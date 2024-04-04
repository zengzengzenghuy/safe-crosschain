//SPDX-License-Identifier: MIT

pragma solidity ^0.8.23;

import { RLPReader } from "solidity-rlp/contracts/RLPReader.sol";
import { MerklePatriciaProofVerifier } from "./libraries/MerklePatriciaProofVerifier.sol";
import { Enum } from "safe-contracts/contracts/common/Enum.sol";
import { IGiriGiriBashi } from "./interfaces/hashi/IGiriGiriBashi.sol";
import { ISafe } from "./interfaces/safe/ISafe.sol";

import { AxiomV2Client } from "@axiom-crypto/v2-periphery/src/client/AxiomV2Client.sol";

contract AxiomControllerModule is AxiomV2Client {
    bytes32 public immutable QUERY_SCHEMA;
    uint64 public immutable SOURCE_CHAIN_ID;

    error InvalidSourceChainId(uint256 sourceChainId, uint256 expectedSourceChainId);
    error InvalidQuerySchema(bytes32 querySchema, bytes32 expectedQuerySchema);

    event Test();

    constructor(
        address axiomV2QueryAddress,
        uint64 sourceChainId,
        bytes32 querySchema
    ) AxiomV2Client(axiomV2QueryAddress) {
        QUERY_SCHEMA = querySchema;
        SOURCE_CHAIN_ID = sourceChainId;
    }

    function _validateAxiomV2Call(
        AxiomCallbackType callbackType,
        uint64 sourceChainId,
        address caller,
        bytes32 querySchema,
        uint256 queryId,
        bytes calldata extraData
    ) internal view override {
        //if (sourceChainId != SOURCE_CHAIN_ID) revert InvalidSourceChainId(sourceChainId, SOURCE_CHAIN_ID);
        //if (querySchema != QUERY_SCHEMA) revert InvalidQuerySchema(querySchema, QUERY_SCHEMA);

        // <Add any additional desired validation>
    }

    function _axiomV2Callback(
        uint64 sourceChainId,
        address caller,
        bytes32 querySchema,
        uint256 queryId,
        bytes32[] calldata axiomResults,
        bytes calldata extraData
    ) internal override {
        // <Implement your application logic>
        emit Test();
    }
}
