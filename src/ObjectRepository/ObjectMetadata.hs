module ObjectRepository.ObjectMetadata (ObjectMetadata (ObjectMetadata)) where

import StorageSystem.Types(SliceId)

newtype ObjectMetadata = ObjectMetadata [SliceId] 
