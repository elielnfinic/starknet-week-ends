# Petite explication 

Salut à tous. Vous avez besoin d'une petite explication?  

Okay, c'est juste un simple smart contract qui est d'ailleurs déployé sur Starknet.  Vous pouvez le checker en cliquant sur ce [lien](https://testnet.starkscan.co/contract/0x02a9dfd6c8a630c372464b2b2999afcc377234c68d3c12d0a7f8f0dd2f32e64e).  

# Comment build le smart contract 

Exécutez simplement la commande suivante `starknet-compile src/d_balances.cairo out/d_balances.json --single-file`. 

# Comment déployer le smart contract

Commencez d'abord par déclarer votre smart contract par    
```starknet declare --contract out/d_balances.json --account VOTRE_NOM_DE_COMPTE```

Copiez la `class_hash` générée après cette commande.

Enfin déployez le smart-contract par `starknet deploy --class_hash LA_CASS_HASH_GENEREE --account VOTRE_NOM_DE_COMPTE`

Après exécution de cette commande, il sera généré l'adresse de votre smart contract ainsi que l'addresse de la transaction.

## Attention 

Soyez sur d'avoir utilisé le meme nom de compte pour la déclaration et le déploiement.

# Interagir avec son smart contract  

Nous allons utiliser [https://starkscan.co](https://starkscan.co) pour interagir avec le smart contract. Dans la barre de recherche, placez l'adresse de la transaction pour se rassurer qu'elle a été éffectuée avec succès mais aussi utilisez la même barre de recherche pour chercher votre smart contract.  

Après avoir trouvé votre smart contract, allez à la seciton "Read/Write Contract" pour interagir avec les fonctions de votre smart contract.   

En cas des questions, la communauté est disponible pour répondre.

El.