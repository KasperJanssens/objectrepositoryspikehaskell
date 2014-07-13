module StorageSystem.ContainerGroup where
import StorageSystem.Types

readLocal::SequenceNumber -> (Blocks,MightBeDeleted)
readLocal _ = undefined

data ContainerGroupType = ContainerGroupType {
  read::SequenceNumber -> (Blocks,MightBeDeleted)
}
