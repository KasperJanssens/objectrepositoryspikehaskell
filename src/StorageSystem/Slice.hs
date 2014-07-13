module StorageSystem.Slice where
import StorageSystem.Types

readLocal:: ContainerGroup -> Slice -> (Blocks, MightBeDeleted)
readLocal _ _ = undefined

class SliceType a where
    read :: a -> (Blocks, MightBeDeleted)

instance SliceType Slice where
    read slice = undefined

