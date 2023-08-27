use debug::PrintTrait;



fn main(){
    // float / double 
    // u8 00000001   11111111 2^8 - 1 => 0 à 255 
    // u16 0000000000000001   1111111111111111 => 0 à 65535
    // u256 => 0 à 2^256 - 1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935

    let x : u8 = 0x9A; // decimal = 19
    let y : u32 = 0b101001010101;
    let u : felt252 = 'Hello world';

    let coordonnes : (felt252, felt252)  = (32, 3);
    let (point1, point2) = coordonnes;
    point1.print();
    point2.print();

    let b1 : bool = true;

    let ma_variable = 903_u32;
    let xx = 32743_u32;
    let sum = additionner(ma_variable, xx);

    let a_afficher = 7;
    a_afficher.print();

}

fn additionner(x : u32, y : u32) -> u32{
    x + y
}