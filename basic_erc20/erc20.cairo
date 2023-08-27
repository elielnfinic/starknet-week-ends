use starknet::ContractAddress;

#[starknet::interface]
trait I_ERC20<T>{
    fn name(self : @T) -> felt252;
    fn symbol(self : @T) -> felt252;
    fn decimals(self : @T) -> u8;
    fn totalSupply(self : @T) -> u256;
    fn balanceOf(self : @T, _owner : ContractAddress) -> u256;
    fn transfer(ref self : T, _to : ContractAddress, _value : u256) -> bool;
    fn transferFrom(ref self : T, _from : ContractAddress, _to : ContractAddress, _value : u256) -> bool;
    fn approve(ref self : T, _spender : ContractAddress, _value : u256) -> bool;
    fn allowance(self : @T, _owner : ContractAddress, _spender : ContractAddress) -> u256;
}

#[starknet::contract]
mod ERC20{
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    #[storage]
    struct Storage{
        name : felt252,
        symbol : felt252,
        decimals : u8,
        totalSupply : u256,
        balances : LegacyMap::<ContractAddress, u256>,
        allowances : LegacyMap::<(ContractAddress, ContractAddress), u256>
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event{
        Transfer : Transfer,
        Approve : Approve
    }

    #[derive(Drop, starknet::Event)]
    struct Transfer{
        _from : ContractAddress,
        _to : ContractAddress,
        _value : u256
    }

    #[derive(Drop, starknet::Event)]
    struct Approve{
        _owner : ContractAddress, 
        _spender : ContractAddress,
        _value : u256
    }

    #[external(v0)]
    impl ERC20 of super::I_ERC20<ContractState>{
        fn name(self : @ContractState) -> felt252 {
            self.name.read()
        }

        fn symbol(self : @ContractState) -> felt252 {
            self.symbol.read()
        }

        fn decimals(self : @ContractState) -> u8 {
            self.decimals.read()
        }

        fn totalSupply(self : @ContractState) -> u256 {
            self.totalSupply.read()
        }

        fn balanceOf(self : @ContractState, _owner : ContractAddress) -> u256 {
            self.balances.read(_owner)
        }

        fn transfer(ref self : ContractState, _to : ContractAddress, _value : u256) -> bool {
            // self.symbol.read()
            let me = get_caller_address();
            // assert(_to == 0, 'ERC20 : SENDING TO 0');
            
            false
        }

        fn transferFrom(ref self : ContractState, _from : ContractAddress, _to : ContractAddress, _value : u256) -> bool{
            false
        }

        fn approve(ref self : ContractState, _spender : ContractAddress, _value : u256) -> bool {
            false 
        }

        fn allowance(self : @ContractState, _owner : ContractAddress, _spender : ContractAddress) -> u256 {
            self.allowances.read((_owner, _spender))
        }
    }
}