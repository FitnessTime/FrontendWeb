require_relative '../models/RutinaDTO.rb'

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

    def self.from_json(rutinaJSON)
        rutinaDTO = RutinaDTO.new
        rutinaDTO.idWeb = rutinaJSON['idWeb']
        rutinaDTO.idMobile = rutinaJSON['idMobile']
        rutinaDTO.inicio = rutinaJSON['inicio']
        rutinaDTO.fin = rutinaJSON['fin']
        rutinaDTO.descripcion = rutinaJSON['descripcion']
        rutinaDTO.aclaracion = rutinaJSON['aclaracion']
        rutinaDTO.versionWeb = rutinaJSON['versionWeb']
        rutinaDTO.versionMobile = rutinaJSON['versionMobile']
        rutinaDTO.estaSincronizado = rutinaJSON['estaSincronizado']
        rutinaDTO.esDeCarga = rutinaJSON['esDeCarga']
        rutinaDTO.eliminada = rutinaJSON['eliminada']
        rutinaDTO.inicioCambio = rutinaJSON['inicioCambio']
        rutinaDTO.finCambio = rutinaJSON['finCambio']
        rutinaDTO.descripcionCambio = rutinaJSON['descripcionCambio']
        rutinaDTO.aclaracionCambio = rutinaJSON['aclaracionCambio']
        rutinaDTO.idUsuario = rutinaJSON['idUsuario']
        return rutinaDTO
    end
end