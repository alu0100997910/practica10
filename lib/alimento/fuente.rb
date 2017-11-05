module Alimento
    class Alimento
        attr_reader :nombre, :proteinas, :glucidos, :lipidos
        def initialize(name,p,g,l)
            @nombre=name
            @proteinas=p
            @glucidos=g
            @lipidos=l
        end
    
        def energeticValue
            value = @proteinas*4 + @glucidos*4 + @lipidos*9
        end
    
        def to_s
            cadena = "Name: #{@nombre} --> [Proteins , Glucids , Lipids]: [#{@proteinas} , #{@glucidos} , #{@lipidos}]"
        end
    end
end
  