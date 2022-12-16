// Use solidity version 0.5.0
pragma solidity ^0.5.0;

// Import ERC20, ERC20Mintable and ERC20Detailed classes for standards inheritance
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";

// Create contract 
contract ArcadeToken is ERC20, ERC20Detailed, ERC20Mintable {

    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply
    )
        ERC20Detailed(name, symbol, 18)
        public
    {
        // mint(msg.sender, initial_supply);
        // take minting ability away so deployer can be the one in charge of minting
    }

	

}