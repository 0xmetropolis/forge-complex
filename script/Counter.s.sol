// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter, CrazyInitializer, ChangeType, CounterArgs} from "src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Counter counter = new Counter(
            CounterArgs({thisIsANumber: 0, thisShouldBeABool: false})
        );
        counter.setNumber(
            CounterArgs({thisIsANumber: 1, thisShouldBeABool: false})
        );

        address[] memory wut = new address[](2);

        counter.increment(wut);

        CounterArgs[] memory yikes = new CounterArgs[](2);

        yikes[0] = CounterArgs({thisIsANumber: 1, thisShouldBeABool: false});
        yikes[1] = CounterArgs({thisIsANumber: 2, thisShouldBeABool: false});

        counter.hereWeGo(yikes);

        counter.change(ChangeType.Decrement, 1);

        new CrazyInitializer(ChangeType.Increment, yikes);

        vm.stopBroadcast();
    }
}
