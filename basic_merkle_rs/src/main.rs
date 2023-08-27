// use crypto::digest::Digest;
use rs_merkle::{MerkleTree, Hasher, MerkleProof};
use rs_merkle::algorithms::{Sha256, Sha256Algorithm};

fn main() {
    // let a = "elielleliell elielleliell elielleliell elielleliell elielleliell elielleliell".as_bytes();
    // let sha_r = Sha256::hash(a);
    // println!("Hello, world! {:?}", sha_r);

    // let inputs = ["1", "2", "3", "4", "5", "6", "7", "8"];
    // let hasshes : Vec<_> = inputs.iter().map(|x| x).collect();

    let transactions = [
        "transaction 1", 
        "transaction 2",
        "transaction 3"
    ];

    // generate_merkle_tree(transactions);

    // let mut my_tree = MerkleTree::new();
    
}

// fn generate_merkle_tree(transactions : [&str; 3]) -> MerkeTree<Sha256Algorithm>{
//     let leaves : Vec<[u8; 32]> = transactions.iter().map(|x| {
//         Sha256::hash(x.as_bytes())
//     }).collect();

//     let my_tree = MerkleTree::<Sha256>::from_leaves(&leaves);

//     let indices_to_prooves = vec![2,3];
//     let leaves_to_prove = leaves.get(2..4).ok_or("Can't find those leaves");
//     let merkle_proof = my_tree.proof(&indices_to_prooves);
//     let merkle_root = my_tree.root().ok_or("Couldn't get merkle root").unwrap();
//     let proof_bytes = merkle_proof.to_bytes();
//     let proof = MerkleProof::<Sha256>::try_from(proof_bytes).unwrap();


//     // my_tree

//     return my_tree;
// }
