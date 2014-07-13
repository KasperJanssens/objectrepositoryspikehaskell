module ObjectRepository.ObjectRepository where
import CodingSystem.CodingSystem(decode)
import StorageSystem.Types(Blocks, SliceId(SliceId))
import StorageSystem.StorageSystem(StorageSystem(..))
import ObjectRepository.ObjectMetadata(ObjectMetadata (ObjectMetadata))
import ObjectRepository.Types
import Prelude hiding (read)


--'Proof of concept' of how let ... in works, not really good style
find::StorageSystem -> ObjectId -> Object
find storageSystem objectId = let (blockOfLastSlice, ObjectMetadata slices) = findMetadataAndLastSlice storageSystem objectId
                                  blobs = map (readFrom storageSystem) $ init slices
                                  blocks = map decode blobs
                               in Object $ foldl concatBlobs blockOfLastSlice blocks

findMetadataAndLastSlice::StorageSystem -> ObjectId -> (Blob,ObjectMetadata)
findMetadataAndLastSlice storageSystem objectId = interpretBlobAsMetadataAndLastDataSlice $
                                                    decode $
                                                        readFrom storageSystem $
                                                            getLastSliceId objectId

interpretBlobAsMetadataAndLastDataSlice:: Blob -> (Blob,ObjectMetadata)
interpretBlobAsMetadataAndLastDataSlice blob = (Blob "koekoek", ObjectMetadata [SliceId "dingske"])

getLastSliceId::ObjectId -> SliceId
getLastSliceId (ObjectId s) = SliceId s

