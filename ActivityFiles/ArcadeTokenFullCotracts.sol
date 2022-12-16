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

contract ArcadeTokenCrowdsale is Crowdsale, MintedCrowdsale {

    constructor(
        uint256 rate,
        address payable wallet,
        ArcadeToken token
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor can stay empty
    }
}

contract ArcadeTokenCrowdsaleDeployer {

    address public arcade_token_address;
    address public arcade_crowdsale_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // This address will receive all Ether raised by the sale
    )
        public
    {
        // create the ArcadeToken and keep its address handy
        ArcadeToken token = new ArcadeToken(name, symbol, 0);
        arcade_token_address = address(token);

        // create the ArcadeTokenCrowdsale and tell it about the token
        ArcadeTokenCrowdsale arcade_crowdsale = new ArcadeTokenCrowdsale(1, wallet, token);
        arcade_crowdsale_address = address(arcade_crowdsale);
    }


}