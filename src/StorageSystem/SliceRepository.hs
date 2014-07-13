module StorageSystem.SliceRepository where
import StorageSystem.Types
import StorageSystem.VirtualContainerRepository
import Prelude hiding (read)

read::VirtualContainerRepository -> SliceId -> Slice
read virtualContainerRepository (SliceId virtualContainerId sequenceNumber)
    = let VirtualContainer containerGroup = findIn virtualContainerRepository virtualContainerId
      in Slice sequenceNumber containerGroup

data SliceRepository = SliceRepository {
  readFrom::SliceId -> Slice
}
