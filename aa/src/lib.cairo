use starknet::account::Call;

#[starknet::interface]
trait ISRC6<T>{
    fn __execute__(ref self : T, calls : Array<Call>) -> Array<Span<felt252>>;
    fn __validate__(self : @T, calls : Array<Call>) -> felt252;
    fn is_valid_signature(self : @T, hash : felt252, signature : Array<felt252>) -> felt252;
}

#[starknet::interface]
trait IAccount<T>{
    fn is_valid_signature(self : @T, hash : felt252, signature : Array<felt252>) -> felt252;
    // fn __validate__(self : @T, calls : Array<Call>) -> felt252;
}

#[starknet::contract]
mod Account{
    use array::ArrayTrait;
    use ecdsa::check_ecdsa_signature;
    use starknet::account::Call;
    use box::BoxTrait;
    use starknet::get_tx_info;

    #[storage]
    struct Storage{
        public_key : felt252,

    }

    #[external(v0)]
    impl AccountImpl of super::IAccount<ContractState>{
        fn is_valid_signature(self : @ContractState, hash : felt252, signature : Array<felt252>) -> felt252{
            let is_valid = self.is_valid_signature_bool(hash, signature);
            if is_valid { 'VALID' }
            else { 0 }
        }

        
    }

    #[generate_trait]
    impl PrivateImpl of PrivateTrait{
        fn is_valid_signature_bool(self : @ContractState, hash : felt252, signature : Array<felt252>) -> bool {
            let is_valid_length = signature.len() == 2_u32;
            if !is_valid_length {
                return false;
            }

            check_ecdsa_signature(hash, self.public_key.read(), *signature.at(0_u32), *signature.at(1_u32))
        }

        fn __validate__(self : @ContractState, calls : Array<Call>) -> felt252 {
            self.only_protocol();

            let tx_info = get_tx_info().unbox();
            let tx_hash = tx_info.transaction_hash;
            let signature = tx_info.signature;

            let is_valid = self.is_valid_signature_bool(tx_hash, signature);
            assert(is_valid, 'Account : Incorrect tx signature');
            'VALID'
            
        }
    }
}