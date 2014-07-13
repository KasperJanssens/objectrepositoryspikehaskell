module ObjectRepository.Types where

newtype Blob = Blob String
concatBlobs::Blob -> Blob -> Blob
concatBlobs (Blob s1) (Blob s2) = Blob (s1 ++ s2)


newtype ObjectId = ObjectId String
newtype Object = Object Blob
