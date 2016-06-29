class RutinaDTO
	  include DataMapper::Resource

    property :idWeb, Serial
    property :idMobile, Integer
    property :inicio, Date
    property :fin, Date
    property :descripcion, String
    property :aclaracion, String
    property :versionWeb, Integer , :default => 0
    property :versionMobile, Integer , :default => 0
    property :estaSincronizado, Boolean, :default => false
    property :esDeCarga, Boolean
    property :eliminada, Boolean, :default => false
    property :inicioCambio, Boolean, :default => false
    property :finCambio, Boolean, :default => false
    property :descripcionCambio, Boolean, :default => false
    property :aclaracionCambio, Boolean, :default => false
    property :idUsuario, Integer

end