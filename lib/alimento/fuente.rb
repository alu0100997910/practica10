# encoding: utf-8
# Este módulo se ha creado para describir
# las clases alimentos y las clases que heredan de los alimentos
# Author::    Alejandro González Alonso  (mailto:alu0100997910@ull.edu.es)
# Copyright:: Creative Commons
# License::   Distributes under the same terms as Ruby

module Alimento
    # Esta clase permite representar un alimento, con sus valores 
    # en Proteínas, Glúcidos y Lípidos
    # Se han incluido los mixin Comparable.
    class Alimento
        include Comparable
        attr_reader :nombre, :proteinas, :glucidos, :lipidos
        
        # Se define para incluir el mixin comparable
        # Compara los alimentos según su valor energético
        def <=>(other)
            return nil unless other.kind_of?Alimento
            self.energeticValue <=> other.energeticValue
        end

        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento
        def initialize(name,p,g,l,med=nil)
            @nombre=name
            @proteinas=p
            @glucidos=g
            @lipidos=l
            @g=med
        end
        
        # Se calcula el valor energético del alimento
        def energeticValue
            value = @proteinas*4 + @glucidos*4 + @lipidos*9
        end
        
        def aibc
            aibc=[]
            @g.each do |value|
                s=[]
                value.each_with_index do |val,j|
                    if (j!=0)
                        s << (((val-value[0])+(value[j-1]-value[0]))*5)/2
                    end
                end
                aibc << s.reduce(:+)
            end
            aibc
        end

        def indIdv(individuo,glucosa)
            indidv=self.aibc[individuo]*100/glucosa.aibc[individuo]
        end

        # Formatea el objeto alimento a una cadena de texto
        def to_s
            cadena = "Name: #{@nombre} --> [Proteins , Glucids , Lipids]: [#{@proteinas} , #{@glucidos} , #{@lipidos}]"
        end
    end
    # Esta clase permite representar un alimento que es derivado lacteo 
    class DerivadoLacteo < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Huevos, Lacteos y Helados"
        end
    end

    # Esta clase permite representar un alimento en la categoria de carnes
    class Carnes < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Carnes y Derivados"
        end
    end

    # Esta clase permite representar un alimento en la categoria pescados
    class Pescados < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Pescados y Maricos"
        end
    end

    # Esta clase permite representar un alimento que tenga alto contenido en grasas
    class Grasos < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Alimentos Grasos"
        end
    end
    
    # Esta clase permite representar un alimento con alto contenido de carbohidratos
    class Carbohidratos < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Carbohidratos"
        end
    end

    # Esta clase permite representar un alimento en la categoria de verduras
    class Verduras < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Verduras"
        end
    end

    # Esta clase permite representar un alimento en la categoria de frutas
    class Frutas < Alimento
        # Se definen los valores de proteinas, glucidos y lipidos
        # y el nombre del alimento a través del initialize de la superclass
        # y se define el nombre de la categoria
        def initialize(name,p,g,l)
            super(name,p,g,l)
            @categoria="Frutas"
        end
    end

end

# Este módulo se ha creado para describir
# la clase Lista
# Author::    Alejandro González Alonso  (mailto:alu0100997910@ull.edu.es)
# Copyright:: Creative Commons
# License::   Distributes under the same terms as Ruby

module Lista
    # Esta clase permite representar una lista doblemente enlazadas
    # Se han incluido el mixin Enumerable.
    class Lista
        include Enumerable
        Node = Struct.new(:prev, :value, :next)

        # Inicializa la clase con un valor
        def initialize(val)
            first=Node.new(nil,val,nil)
            @head=first
            @tail=first
        end

        # Añade los valores a la lista desde el final
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
            @tail.value
        end

        # Elimina el primer elemento de la lista
        def pop_front
            aux=@head.value
            @head=@head.next
            @head.prev.next=nil
            @head.prev=nil
            aux
        end

        # Elimina el ultimo elemento de la lista
        def pop_back
            aux=@tail.value
            @tail=@tail.prev
            @tail.next.prev=nil
            @tail.next=nil
            aux
        end

        # Se incluye el metodo del mixin Enumerable
        # Se define como una iteración sobre los elementos de la lista
        def each
            current=@head
            while current!=nil
                yield current.value
                current=current.next
            end
        end

        # Formatea la Lista a una cadena de caracteres
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
  