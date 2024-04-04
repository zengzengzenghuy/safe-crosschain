import {
  addToCallback,
  CircuitValue,
  CircuitValue256,
  getStorage,
} from "@axiom-crypto/client"

// all fields of `CircuitInputs` must be `CircuitValue`, `CircuitValue256`,
// or static arrays over these types
export interface CircuitInputs {
  blockNumber: CircuitValue
  address: CircuitValue
  slot: CircuitValue256
}

export const defaultInputs = {
  blockNumber: 5620977,
  address: "0x2796816304CE26dC515312266Df21b10Bb0cDcc3",
  slot: 0,
}

export const circuit = async (inputs: CircuitInputs) => {
  const storage = getStorage(inputs.blockNumber, inputs.address)
  const value = await storage.slot(inputs.slot)

  // expose relevant inputs to the smart contract
  // addToCallback(inputs.blockNumber)
  addToCallback(inputs.address)
  addToCallback(inputs.slot)

  addToCallback(value)
}
