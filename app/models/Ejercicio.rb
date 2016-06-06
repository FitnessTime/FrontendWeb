
class Ejercicio
	include DataMapper::Resource

	  property :id, Serial
	  property :idMobile, Integer
	  property :type, Discriminator, :key => true
  	property :nombre, String
  	property :series, Integer
  	property :diaDeLaSemana, String
  	property :estaSincronizado, Boolean, :default => false
  	property :eliminada, Boolean, :default => false
  	property :version, Integer , :default => 0
    property :versionMobile, Integer , :default => 0
    property :nombreCambio, Boolean, :default => false
    property :diaDeLaSemanaCambio, Boolean, :default => false
    property :seriesCambio, Boolean, :default => false
    property :repeticionesCambio, Boolean, :default => false
    property :tiempoActivoCambio, Boolean, :default => false
    property :tiempoDescansoCambio, Boolean, :default => false
    has n, :marcas
	  belongs_to :rutina
end