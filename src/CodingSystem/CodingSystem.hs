module CodingSystem.CodingSystem where

import StorageSystem.Types (Blocks)
import ObjectRepository.Types(Blob)

decodeLocal:: Blocks -> Blob
decodeLocal _ = undefined

data CodingSystem = CodingSystem {
  decode::Blocks -> Blob
}
