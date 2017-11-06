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

    class Lista
        Node = Struct.new(:prev, :value, :next)

        def initialize(val)
            first=Node.new(nil,val,nil)
            @head=first
            @tail=first
        end

        def push(val)
            aux=Node.new(@tail, val, nil)
            @tail.next=aux
            @tail=aux
        end
    end
end
  