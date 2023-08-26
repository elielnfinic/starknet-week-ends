use starknet::ContractAddress;

#[starknet::interface]
trait I_DBalances<T>{
    fn get_balance(self : @T, owner : ContractAddress) -> u256;
    fn set_balance(ref self : T, amount : u256);
}

#[starknet::contract]
mod DBalances{
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    #[storage]
    struct Storage{
        balances: LegacyMap::<ContractAddress, u256>,
        owner : ContractAddress
    }

    #[external(v0)]
    impl DBalances of super::I_DBalances<ContractState>{
        fn get_balance(self : @ContractState, owner : ContractAddress) -> u256{
            self.balances.read(owner)
        }

        fn set_balance(ref self : ContractState, amount : u256){
            let my_address = get_caller_address();
            self.balances.write(my_address, amount);
        }
    }
}

