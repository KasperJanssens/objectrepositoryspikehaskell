module ObjectRepository.ObjectRepository where
import CodingSystem.CodingSystem
import StorageSystem.Types(Blocks, SliceId(SliceId), VirtualContainerId(..), SequenceNumber(..))
import StorageSystem.StorageSystem(StorageSystem(..))
import ObjectRepository.ObjectMetadata(ObjectMetadata (ObjectMetadata))
import ObjectRepository.Types
import Prelude hiding (read)


--'Proof of concept' of how let ... in works, not really good style
find::StorageSystem -> CodingSystem -> ObjectId -> Object
find storageSystem codingSystem objectId = let (blockOfLastSlice, ObjectMetadata slices) =
                                                    findMetadataAndLastSlice storageSystem codingSystem objectId
                                               blobs = map (readFrom storageSystem) $ init slices
                                               blocks = map (decode codingSystem)  blobs
                                           in Object $ foldl concatBlobs blockOfLastSlice blocks

findMetadataAndLastSlice::StorageSystem -> CodingSystem -> ObjectId -> (Blob,ObjectMetadata)
findMetadataAndLastSlice storageSystem codingSystem objectId = interpretBlobAsMetadataAndLastDataSlice $
                                                    decode codingSystem $
                                                        readFrom storageSystem $
                                                            getLastSliceId objectId

interpretBlobAsMetadataAndLastDataSlice:: Blob -> (Blob,ObjectMetadata)
interpretBlobAsMetadataAndLastDataSlice blob = (Blob "koekoek", 
    ObjectMetadata [SliceId (VirtualContainerId "merel") (SequenceNumber "koekoek")])

getLastSliceId::ObjectId -> SliceId
getLastSliceId (ObjectId s) = SliceId (VirtualContainerId "koekoek") (SequenceNumber "merel")

