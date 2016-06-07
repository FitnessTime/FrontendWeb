require_relative '../DTOs/RutinaDTO.rb'


class RutinaAssembler

	def crear_dto (rutina, usuario)
        
        rutinaDTO = RutinaDTO.new
        rutinaDTO.idWeb = rutina.id
       	rutinaDTO.idMobile = rutina.idMobile
        rutinaDTO.inicio = rutina.inicio
        rutinaDTO.fin = rutina.fin
        rutinaDTO.descripcion = rutina.descripcion
        rutinaDTO.aclaracion = rutina.aclaracion
        rutinaDTO.versionWeb = rutina.version
        rutinaDTO.versionMobile = rutina.versionMobile
        rutinaDTO.estaSincronizado = rutina.estaSincronizado
        rutinaDTO.esDeCarga = rutina.esDeCarga
        rutinaDTO.eliminada = rutina.eliminada
        rutinaDTO.idUsuario = usuario
        rutinaDTO.inicioCambio = rutina.inicioCambio
        rutinaDTO.finCambio = rutina.finCambio
        rutinaDTO.descripcionCambio = rutina.descripcionCambio
        rutinaDTO.aclaracionCambio = rutina.aclaracionCambio


        return rutinaDTO
    end

    def from_dto(rutinaDTO)

    end
end