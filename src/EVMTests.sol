// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @notice Contract that tests basic opcode operations to ensure EVM equivalence.
contract EVMTests {
    uint256 public chainId;

    constructor(uint256 _chainId) {
        chainId = _chainId;
    }

    receive() external payable {}

    function testChainId() public view returns (bool) {
        require(block.chainid == chainId, "Incorrect chainid op");
        return true;
    }

    function testBlockNumber() public view returns (bool) {
        require(block.number > 0, "Incorrect block.number op");
        return true;
    }

    function testSendEther() public returns (bool) {
        address receiver = address(0x1111111);
        uint256 initialBalance = receiver.balance;
        payable(receiver).transfer(1);
        require(address(this).balance > 1, "Not enough balance of the native token");
        require(receiver.balance == initialBalance + 1, "Transfer failed");
        return true;
    }

    function testBlockGasLimit() public returns (bool) {}

    function selfDestruct() external {
        selfdestruct(payable(msg.sender));
    }

    /// ...
    // Implement all methods
    ///

    // @todo After all methods are implemented, check gas consumption
}
