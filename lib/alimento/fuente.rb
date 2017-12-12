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

        def indGlu(glucosa)
            indidv=[]
            @g.each_with_index do |value,index|
                indidv << indIdv(index,glucosa)
            end
            (indidv.reduce(:+))/@g.size
        end

        # Formatea el objeto alimento a una cadena de texto
        def to_s
            cadena = "[#{@nombre},#{@proteinas},#{@glucidos},#{@lipidos}]"
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

    class Plato
        attr_reader :vegetales, :frutas
        def initialize(name,&block)
            @name=name
            @vegetales=[]
            @frutas=[]
            
            @tabla={"cups" => 2, "piece" => 1, "glass" => 1.5, "grams" => 0.05 }
            @listaalimentos=[  DerivadoLacteo.new("Huevo", 14.1,0,19.5),
                                DerivadoLacteo.new("Leche", 3.3,4.8,3.2),
                                DerivadoLacteo.new("Yogurt", 3.8,4.9,3.8),
                                Carnes.new("Cerdo", 21.5,0,6.3),
                                Carnes.new("ternera", 21.1,0,3.1),
                                Carnes.new("pollo", 20.6,0,5.6),
                                Pescados.new("bacalao", 17.7,0,0.4),
                                Pescados.new("atun", 21.5,0,15.5),
                                Pescados.new("salmon", 19.9,0,13.6),
                                Grasos.new("aceite de oliva", 0,0.2,99.6),
                                Grasos.new("mantequilla", 0.7,0,83.2),
                                Grasos.new("chocolate", 5.3,47.0,30.0),
                                Carbohidratos.new("azucar", 0,99.8,0),
                                Carbohidratos.new("arroz", 6.8,77.7,0.6),
                                Carbohidratos.new("lentejas", 23.5,52.0,1.4),
                                Carbohidratos.new("papas", 2,15.4,0.1),
                                Verduras.new("tomate", 1,3.5,0.2),
                                Verduras.new("cebolla", 1.3,5.8,0.3),
                                Verduras.new("calabaza", 1.1,4.8,0.1),
                                Frutas.new("manzana", 0.3,12.4,0.4),
                                Frutas.new("platano", 1.2,21.4,0.2),
                                Frutas.new("pera", 0.5,12.7,0.3)]

            if block_given?
                instance_eval(&block)
            end
        end

        def vegetal(name,options = {})
            vegetal=@listaalimentos.select do |alimento|
                alimento.nombre.downcase == name.downcase
            end

            if options[:porcion]
                info=options[:porcion].split(/\W+/)
                amount=info[0].to_i*@tabla[info[1]]
                vegetal << amount;
            end

            @vegetales<<vegetal
        end

        def fruta(name,options = {})
            fruta=@listaalimentos.select do |alimento|
                alimento.nombre.downcase == name.downcase
            end

            if options[:porcion]
                info=options[:porcion].split(/\W+/)
                amount=info[0].to_i*@tabla[info[1]]
                fruta << amount;
            end

            @frutas << fruta
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
            if val.instance_of?Array
                val.each_with_index do |value,i|
                    if i==0
                        first=Node.new(nil,value,nil)
                        @head=first
                        @tail=first
                    else
                        aux=Node.new(@tail, value, nil)
                        @tail.next=aux
                        @tail=aux
                    end
                end
            else
                first=Node.new(nil,val,nil)
                @head=first
                @tail=first
            end
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

        def sortWFor
            arr=[]
            current=@head
            while (current!=nil)
                arr << current.value
                current=current.next
            end

            for i in 1..arr.size-1
                for j in 0..arr.size-i-1
                    if arr[j+1]<arr[j]
                        aux=arr[j+1]
                        arr[j+1]=arr[j]
                        arr[j]=aux
                    end
                end
            end
            arr
        end

        def sortWEach 
            arr=[]
            current=@head
            while (current!=nil)
                arr << current.value
                current=current.next
            end

            arr.each.with_index(1) do |val,i|
                arr.each_with_index do |val2,j|
                    if (j<arr.size-i)
                        if arr[j+1]<arr[j]
                            aux=arr[j+1]
                            arr[j+1]=arr[j]
                            arr[j]=aux
                        end
                    end
                end
            end
        end

        # Formatea la Lista a una cadena de caracteres
        def to_s
            current=@head
            sout="["
            while current!=nil
                if current.next==nil
                    sout+=current.value.to_s
                else
                    sout+=current.value.to_s + ","
                end
                current=current.next
            end
            sout+="]"
        end
    end
end