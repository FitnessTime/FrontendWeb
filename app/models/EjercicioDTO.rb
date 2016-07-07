class EjercicioDTO
    include DataMapper::Resource
    
    property :idWeb, Serial
    property :idMobile, Integer
    property :nombre, String
    property :series, Integer
    property :repeticiones, Integer
    property :tiempoActivo, Integer
    property :tiempoDescanso, Integer
    property :diaDeLaSemana, String
    property :estaSincronizado, Boolean, :default => false
    property :esDeCarga, Boolean, :default => false
    property :eliminada, Boolean, :default => false
    property :versionWeb, Integer , :default => 0
    property :versionMobile, Integer , :default => 0
    property :nombreCambio, Boolean, :default => false
    property :diaDeLaSemanaCambio, Boolean, :default => false
    property :seriesCambio, Boolean, :default => false
    property :repeticionesCambio, Boolean, :default => false
    property :tiempoActivoCambio, Boolean, :default => false
    property :tiempoDescansoCambio, Boolean, :default => false
    property :idRutina, Integer
end