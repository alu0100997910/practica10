class Alimento
    attr_reader :nombre, :proteinas, :glucidos
    def initialize(name,p,g)
        @nombre=name
        @proteinas=p
        @glucidos=g
    end
end