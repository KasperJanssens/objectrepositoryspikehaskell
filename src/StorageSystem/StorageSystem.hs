module StorageSystem.StorageSystem where
import Prelude hiding (read)
import StorageSystem.Types
import StorageSystem.Slice as Slice

import qualified StorageSystem.SliceRepository as SliceRepo



read::SliceRepo.SliceRepository -> SliceId -> Blocks
read sliceRepository sliceId = let read = SliceRepo.readFrom sliceRepository
                                   slice = read sliceId
                               in fst $ Slice.read slice
                               
                               

data StorageSystem = StorageSystem {
  readFrom::SliceId -> Blocks
}



