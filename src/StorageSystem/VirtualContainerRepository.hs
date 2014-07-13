module StorageSystem.VirtualContainerRepository where
import StorageSystem.Types

find::VirtualContainerId -> VirtualContainer
find _ = undefined

data VirtualContainerRepository = VirtualContainerRepository {
  findIn::VirtualContainerId -> VirtualContainer
}
