// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Token is ERC20 {
    // TODO: add community address
    // address private _community = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    constructor(string memory _name, string memory _ticker, uint256 _supply, address _user, address _maintainer) ERC20(_name, _ticker) {
      _mint(_user, _supply * 80 / 100);
      _mint(_maintainer, _supply * 10 / 100);
      // _mint(_community, _supply * 10 / 100);
    }
}

contract Factory is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}

    address[] public tokens;
    uint256 public tokenCount;
    mapping(string => bool) private usedTickers;
    event TokenDeployed(address tokenAddress);

    function deployToken(string calldata _name, string calldata _ticker, uint256 _supply) public returns (address) {
        string memory key = string(abi.encodePacked(msg.sender, _ticker));
        require(!usedTickers[key], "Ticker already used by this address");
        Token token = new Token(_name, _ticker, _supply, msg.sender, owner());
        tokens.push(address(token));
        tokenCount += 1;
        usedTickers[key] = true;
        emit TokenDeployed(address(token));
        return address(token);
    }
}