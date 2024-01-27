// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct CounterArgs {
    uint256 number;
    bool boolean;
}

enum ChangeType {
    Increment,
    Decrement
}

contract Counter {
    uint256 public number;

    constructor(CounterArgs memory args) {
        number = args.number;
    }

    function setNumber(CounterArgs memory args) public {
        number = args.number;
    }

    function simple(uint256 simpleIncrement) public {
        number += simpleIncrement;
    }

    function change(ChangeType changeType, uint256 changeAmount) public {
        if (changeType == ChangeType.Increment) {
            number += changeAmount;
        } else {
            number -= changeAmount;
        }
    }

    function increment(address[] calldata timesAmount) public {
        number += timesAmount.length;
    }

    function hereWeGo(CounterArgs[] calldata yikes) public {
        for (uint256 i = 0; i < yikes.length; i++) {
            number += yikes[i].number;
        }
    }
}

contract CrazyInitializer {
    constructor(ChangeType changeType, CounterArgs[] memory args) {
        changeType;
        args;
    }
}
