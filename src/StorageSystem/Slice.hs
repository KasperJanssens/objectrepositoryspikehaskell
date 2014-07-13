module StorageSystem.Slice where
import StorageSystem.Types
import StorageSystem.ContainerGroup

readLocal:: ContainerGroupType -> Slice -> (Blocks, MightBeDeleted)
readLocal _ _ = undefined

data SliceActions = SliceActions {
  read::Slice -> (Blocks,MightBeDeleted)
}


