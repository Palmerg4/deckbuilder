# Deck Builder

PoC WIP - Build a deck of 60 ERC1155 cards. Store the hash of the decks IDs and Amounts. The deck IDs and Amounts can be stored in an off-chain db and can be checked against the hash the user would like to use. Storing the actual arrays of IDs and Amounts on-chain would be extrememly inefficient. 

The user would need the correct balance for the deck to be created. 

The check can be performed before, during, or after deck use by calling `checkUserbalance()`, just a simple balance check.


# Pack Opener

PoC WIP - Open a pack of ERC1155 cards. Wait x number of blocks to open, where x is the `_packSize` chosen. To fulfill randomness on-chain, as many pseudorandom approaches use, we use the blockhash. Unlike some other implementations, we use the blockhash of a "future" block. This is the reason a user has to wait before opening the pack. Each ID in the pack will be hashed from one of the blockhashes proceeding the `initiatePackOpening()` call.

This form of randomness is interesting, but probably not suitable for anything mainnet. It's also quite cumbersome to wait x blocks before opening the pack and receiving the ERC1155s. Only 256 hashes are avialable to the contract at any given time, so the pack size has a hard limit. The same is true if a user doesnt open the pack in time after initiating.