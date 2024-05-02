// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import '../BaseTest.sol';

import {AaveV3Ethereum, AaveV3EthereumAssets} from 'aave-address-book/AaveV3Ethereum.sol';

import {WeETHPriceCapAdapter, IWeEth} from '../../src/contracts/lst-adapters/WeETHPriceCapAdapter.sol';
import {CapAdaptersCodeEthereum} from '../../scripts/DeployEthereumWeEth.s.sol';

contract weETHPriceCapAdapterTest is BaseTest {
  constructor()
    BaseTest(
      CapAdaptersCodeEthereum.weETHAdapterCode(),
      90,
      ForkParams({network: 'mainnet', blockNumber: 19575450}),
      'weETH_Ethereum'
    )
  {}

  function _createAdapter(
    IPriceCapAdapter.CapAdapterParams memory capAdapterParams
  ) internal override returns (IPriceCapAdapter) {
    return new WeETHPriceCapAdapter(capAdapterParams);
  }
}
