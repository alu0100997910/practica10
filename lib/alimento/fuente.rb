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

    class DerivadoLacteo < Alimento
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Huevos, Lacteos y Helados"
        end
    end

    class Carnes < Alimento
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Carnes y Derivados"
        end
    end

    class Pescados < Alimento
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Pescados y Maricos"
        end
    end
end

module Lista
    class Lista
        Node = Struct.new(:prev, :value, :next)

        def initialize(val)
            first=Node.new(nil,val,nil)
            @head=first
            @tail=first
        end

        def push(val)
            if val.instance_of?Array
                val.each do |i|
                    aux=Node.new(@tail, i, nil)
                    @tail.next=aux
                    @tail=aux
                end
            else
                aux=Node.new(@tail, val, nil)
                @tail.next=aux
                @tail=aux
            end
            @tail
        end
        def pop_front
            @head=@head.next
            @head.prev.next=nil
            @head.prev=nil
            @head
        end

        def pop_back
            @tail=@tail.prev
            @tail.next.prev=nil
            @tail.next=nil
            @tail
        end

        def to_s
            current=@head
            sout="[ "
            while current!=nil
                if current.next==nil
                    sout+=current.value.to_s + " "
                else
                    sout+=current.value.to_s + ", "
                end
                current=current.next
            end
            sout+="]"
        end
    end
end
  