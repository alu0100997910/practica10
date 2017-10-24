class Alimento
    attr_reader :nombre, :proteinas, :glucidos, :lipidos
    def initialize(name,p,g,l)
        @nombre=name
        @proteinas=p
        @glucidos=g
        @lipidos=l
    end
end