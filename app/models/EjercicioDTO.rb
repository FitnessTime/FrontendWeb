class EjercicioDTO
    include DataMapper::Resource

	attr_accessor :idWeb
    attr_accessor :idMobile
  	attr_accessor :nombre
  	attr_accessor :series
    attr_accessor :repeticiones
    attr_accessor :tiempoActivo
    attr_accessor :tiempoDescanso
    attr_accessor :diaDeLaSemana
    attr_accessor :estaSincronizado
    attr_accessor :versionWeb
    attr_accessor :versionMobile
    attr_accessor :esDeCarga
    attr_accessor :eliminada
    attr_accessor :nombreCambio
    attr_accessor :seriesCambio
    attr_accessor :repeticionesCambio
    attr_accessor :tiempoActivoCambio
    attr_accessor :tiempoDescansoCambio
    attr_accessor :diaDeLaSemanaCambio
    attr_accessor :idRutina

    # property :id, Serial
    # property :idMobile, Integer
    # property :type, Discriminator, :key => true
    # property :nombre, String
    # property :series, Integer
    # property :diaDeLaSemana, String
    # property :estaSincronizado, Boolean, :default => false
    # property :eliminada, Boolean, :default => false
    # property :version, Integer , :default => 0
    # property :versionMobile, Integer , :default => 0
    # property :nombreCambio, Boolean, :default => false
    # property :diaDeLaSemanaCambio, Boolean, :default => false
    # property :seriesCambio, Boolean, :default => false
    # property :repeticionesCambio, Boolean, :default => false
    # property :tiempoActivoCambio, Boolean, :default => false
    # property :tiempoDescansoCambio, Boolean, :default => false
    # has n, :marcas
    #   belongs_to :rutina

    def to_json(j)
        {"idWeb" => self.idWeb, "idMobile" => self.idMobile, "nombre" => self.nombre, "series" => self.series,
         "repeticiones" => self.repeticiones, "tiempoActivo" => self.tiempoActivo, "tiempoDescanso" => self.tiempoDescanso,
         "versionWeb" => self.versionWeb, "versionMobile" => self.versionMobile, "diaDeLaSemana" => self.diaDeLaSemana,
         "estaSincronizado" => self.estaSincronizado, "esDeCarga" => self.esDeCarga, 
         "eliminada" => self.eliminada , "nombreCambio" => self.nombreCambio,
         "seriesCambio" => self.seriesCambio, "repeticionesCambio" => self.repeticionesCambio,
         "tiempoActivoCambio" => self.tiempoActivoCambio, "tiempoDescansoCambio" => self.tiempoDescansoCambio,
         "diaDeLaSemanaCambio" => self.diaDeLaSemanaCambio, "idRutina" => self.idRutina}.to_json
    end
end