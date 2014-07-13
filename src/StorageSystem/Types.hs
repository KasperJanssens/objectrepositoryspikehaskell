module StorageSystem.Types where

newtype Blocks = Blocks String
data SliceId = SliceId VirtualContainerId SequenceNumber
newtype SequenceNumber = SequenceNumber String
newtype ContainerId = ContainerId String
newtype ContainerGroup = ContainerGroup [ContainerId]
newtype VirtualContainerId = VirtualContainerId String
newtype VirtualContainer = VirtualContainer ContainerGroup
newtype MightBeDeleted = MightBeDeleted Bool
data Slice = Slice SequenceNumber ContainerGroup
