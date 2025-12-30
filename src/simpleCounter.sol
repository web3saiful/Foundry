// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract SimpleCounter {
    uint256 public count;

    function increment() public {
        count = _incrementLogic(count); // calls internal function
    }

    function decrement() public {
        count = _decrementLogic(count); // calls private function
    }

    function setCount(uint256 _value) public {
        count = _value;
    }

    function getCount() public view returns (uint256) {
        return count;
    }

    /// ---------- Internal Function ----------
    function _incrementLogic(uint256 _count) internal pure returns (uint256) {
        return _count + 1;
    }

    /// ---------- Private Function ----------
    function _decrementLogic(uint256 _count) private pure returns (uint256) {
        require(_count > 0, "Underflow"); // only work when already required set in contract with `Underflow` this message
        return _count - 1;
    }
}