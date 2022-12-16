pragma solidity ^0.5.0;

import "./ArcadeTokenMintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

// Create Crowdsale Contract
contract ArcadeTokenCrowdsale is Crowdsale, MintedCrowdsale {
    // initial constructor
    constructor(
        uint rate,
        address payable wallet, // sale beneficiary
        ArcadeToken token // the ArcadeToken itself that the ArcadeTokenCrowdsale will work with
    )
        Crowdsale(rate, wallet, token)
        public
    {
        // constructor can stay empty
    }
}

// Create Crowdsale Deployer Contract
contract ArcadeTokenCrowdsaleDeployer {
    // create addresses to hold the deployed contracts addresses
    address public arcade_crowdsale_address;
    address public arcade_token_address;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet // this address will receive all Ether raised by the sale
    )
        public
    {
        // Create new instance of ArcadeToken
        ArcadeToken token = new ArcadeToken(name, symbol, 0);
        // assign the token contract's address to the token variable
        arcade_token_address = address(token);
        // new instance of Crowdsale contract
        ArcadeTokenCrowdsale arcade_crowdsale = new ArcadeTokenCrowdsale(1, wallet, token);
        // assign Crowdsale address
        arcade_crowdsale_address = address(arcade_crowdsale);
        // set Crowdsale contract as minter
        token.addMinter(arcade_crowdsale_address);
        token.renounceMinter();
    }
}