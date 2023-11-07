// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address private _owner = 0xefd267e5314297343098B5D597171a4467f62849;
    // TODO: add community address
    // address private _community = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    constructor(string memory _name, string memory _ticker, uint256 _supply, address _user) ERC20(_name, _ticker) {
      _mint(_user, _supply * 80 / 100);
      _mint(_owner, _supply * 10 / 100);
      // _mint(_community, _supply * 10 / 100);
    }
}

contract Factory {
    address[] public tokens;
    uint256 public tokenCount;
    event TokenDeployed(address tokenAddress);

    function deployToken(string calldata _name, string calldata _ticker, uint256 _supply) public returns (address) {
        Token token = new Token(_name, _ticker, _supply, msg.sender);
        tokens.push(address(token));
        tokenCount += 1;
        emit TokenDeployed(address(token));
        return address(token);
    }
}