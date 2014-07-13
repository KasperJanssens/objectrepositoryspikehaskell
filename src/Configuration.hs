module Configuration where
import qualified CodingSystem.CodingSystem as CS
import qualified StorageSystem.ContainerGroup as CG
import qualified StorageSystem.VirtualContainerRepository as VCR
import qualified StorageSystem.SliceRepository as SR
import qualified StorageSystem.StorageSystem as SS
import qualified ObjectRepository.ObjectRepository as OR
import qualified StorageSystem.Slice as Slice
import StorageSystem.Types(Slice, ContainerGroup)

productionCS::CS.CodingSystem
productionCS = CS.CodingSystem {
  CS.decode = CS.decodeLocal
}

productionVCR::VCR.VirtualContainerRepository
productionVCR = VCR.VirtualContainerRepository {
   VCR.findIn = VCR.find
}

productionSR::SR.SliceRepository
productionSR = SR.SliceRepository {
  SR.readFrom = SR.read productionVCR
}

productionContainerGroup :: CG.ContainerGroupType
productionContainerGroup = CG.ContainerGroupType {
  CG.read = CG.readLocal
}

productionSliceActions::Slice.SliceActions
productionSliceActions  = Slice.SliceActions {
  Slice.read = Slice.readLocal productionContainerGroup
}

productionSS::SS.StorageSystem
productionSS = SS.StorageSystem {
  SS.readFrom = SS.read productionSR productionSliceActions
}

productionOR::OR.ObjectRepository
productionOR = OR.ObjectRepository {
  OR.findIn= OR.find productionSS productionCS
}



