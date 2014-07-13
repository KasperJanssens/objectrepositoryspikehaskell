module StorageSystem.StorageSystem (productionStorageSystem, StorageSystem(..)) where
import Prelude hiding (read)
import StorageSystem.Types



read::SliceId -> Blocks
read _ = undefined

data StorageSystem = StorageSystem {
  readFrom::SliceId -> Blocks
}

productionStorageSystem :: StorageSystem
productionStorageSystem = StorageSystem {
  readFrom = read
}


