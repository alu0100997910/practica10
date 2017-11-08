require "spec_helper"

RSpec.describe Alimento::Alimento do
    it "has a version number" do
        expect(Alimento::VERSION).not_to be nil
    end

    describe "# Pruebas de la Clase Alimento" do
        before :each do
            @alimento=Alimento::Alimento.new("Huevo Frito",14.1,0,19.5)
        end
        
        describe "# Creacion del Alimento" do
            it "Se almacena correctamente el nombre del alimento" do
                expect(@alimento.nombre).to eq("Huevo Frito")
            end
            it "Se almacena correctamente las proteinas del alimento en gramos" do
                expect(@alimento.proteinas).to eq(14.1)
            end
            it "Se almacena correctamente los glúcidos del alimento en gramos" do
                expect(@alimento.glucidos).to eq(0)
            end
            it "Se almacena correctamente las grasas del alimento en gramos" do
                expect(@alimento.lipidos).to eq(19.5)
            end
        end
        describe "# Prueba Métodos de Alimento" do
            it "Test del método to_s" do
                expect(@alimento.to_s).to eq("Name: #{@alimento.nombre} --> [Proteins , Glucids , Lipids]: [#{@alimento.proteinas} , #{@alimento.glucidos} , #{@alimento.lipidos}]")
            end
            it "Test del método valor energético" do
                expect(@alimento.energeticValue).to eq(231.9)
            end
        end
    end
end

RSpec.describe Alimento::DerivadoLacteo do
    before :all do
        @huevofrito=Alimento::DerivadoLacteo.new("Huevo Frito", 14.1,0,19.5)
        @leche=Alimento::DerivadoLacteo.new("Leche", 3.3,4.8,3.2)
        @yogurt=Alimento::DerivadoLacteo.new("Yogurt", 3.8,4.9,3.8)
    end
    it "# Clase de un objeto" do
        expect(@huevofrito.class).to eq(Alimento::DerivadoLacteo)
        expect(@leche.class).to eq(Alimento::DerivadoLacteo)
        expect(@yogurt.class).to eq(Alimento::DerivadoLacteo)
    end
    it "# Tipo de un objeto" do
        expect(@huevofrito.instance_of?Alimento::DerivadoLacteo).to eq(true)
        expect(@leche.instance_of?Alimento::DerivadoLacteo).to eq(true)
        expect(@yogurt.instance_of?Alimento::DerivadoLacteo).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@huevofrito.kind_of?Alimento::Alimento).to eq(true)
        expect(@leche.kind_of?Alimento::Alimento).to eq(true)
        expect(@yogurt.kind_of?Alimento::Alimento).to eq(true)
    end
end

RSpec.describe Alimento::Carnes do
    before :all do
        @cerdo=Alimento::Carnes.new("Cerdo", 21.5,0,6.3)
        @ternera=Alimento::Carnes.new("ternera", 21.1,0,3.1)
        @pollo=Alimento::Carnes.new("pollo", 20.6,0,5.6)
    end
    it "# Clase de un objeto" do
        expect(@cerdo.class).to eq(Alimento::Carnes)
        expect(@ternera.class).to eq(Alimento::Carnes)
        expect(@pollo.class).to eq(Alimento::Carnes)
    end
    it "# Tipo de un objeto" do
        expect(@cerdo.instance_of?Alimento::Carnes).to eq(true)
        expect(@ternera.instance_of?Alimento::Carnes).to eq(true)
        expect(@pollo.instance_of?Alimento::Carnes).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@cerdo.kind_of?Alimento::Alimento).to eq(true)
        expect(@ternera.kind_of?Alimento::Alimento).to eq(true)
        expect(@pollo.kind_of?Alimento::Alimento).to eq(true)
    end
end

RSpec.describe Alimento::Pescados do
    before :all do
        @bacalao=Alimento::Pescados.new("bacalao", 17.7,0,0.4)
        @atun=Alimento::Pescados.new("atun", 21.5,0,15.5)
        @salmon=Alimento::Pescados.new("salmon", 19.9,0,13.6)
    end
    it "# Clase de un objeto" do
        expect(@bacalao.class).to eq(Alimento::Pescados)
        expect(@atun.class).to eq(Alimento::Pescados)
        expect(@salmon.class).to eq(Alimento::Pescados)
    end
    it "# Tipo de un objeto" do
        expect(@bacalao.instance_of?Alimento::Pescados).to eq(true)
        expect(@atun.instance_of?Alimento::Pescados).to eq(true)
        expect(@salmon.instance_of?Alimento::Pescados).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@bacalao.kind_of?Alimento::Alimento).to eq(true)
        expect(@atun.kind_of?Alimento::Alimento).to eq(true)
        expect(@salmon.kind_of?Alimento::Alimento).to eq(true)
    end
end

RSpec.describe Alimento::Grasos do
    before :all do
        @aceiteoliva=Alimento::Grasos.new("aceite oliva", 0,0.2,99.6)
        @mantequilla=Alimento::Grasos.new("mantequilla", 0.7,0,83.2)
        @chocolate=Alimento::Grasos.new("chocolate", 5.3,47.0,30.0)
    end
    it "# Clase de un objeto" do
        expect(@aceiteoliva.class).to eq(Alimento::Grasos)
        expect(@mantequilla.class).to eq(Alimento::Grasos)
        expect(@chocolate.class).to eq(Alimento::Grasos)
    end
    it "# Tipo de un objeto" do
        expect(@aceiteoliva.instance_of?Alimento::Grasos).to eq(true)
        expect(@mantequilla.instance_of?Alimento::Grasos).to eq(true)
        expect(@chocolate.instance_of?Alimento::Grasos).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@aceiteoliva.kind_of?Alimento::Grasos).to eq(true)
        expect(@mantequilla.kind_of?Alimento::Grasos).to eq(true)
        expect(@chocolate.kind_of?Alimento::Grasos).to eq(true)
    end
end

RSpec.describe Alimento::Carbohidratos do
    before :all do
        @azucar=Alimento::Carbohidratos.new("azucar", 0,99.8,0)
        @arroz=Alimento::Carbohidratos.new("arroz", 6.8,77.7,0.6)
        @lentejas=Alimento::Carbohidratos.new("lentejas", 23.5,52.0,1.4)
        @papas=Alimento::Carbohidratos.new("papas", 2,15.4,0.1)
    end
    it "# Clase de un objeto" do
        expect(@azucar.class).to eq(Alimento::Carbohidratos)
        expect(@arroz.class).to eq(Alimento::Carbohidratos)
        expect(@lentejas.class).to eq(Alimento::Carbohidratos)
        expect(@papas.class).to eq(Alimento::Carbohidratos)
    end
    it "# Tipo de un objeto" do
        expect(@azucar.instance_of?Alimento::Carbohidratos).to eq(true)
        expect(@arroz.instance_of?Alimento::Carbohidratos).to eq(true)
        expect(@lentejas.instance_of?Alimento::Carbohidratos).to eq(true)
        expect(@papas.instance_of?Alimento::Carbohidratos).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@azucar.kind_of?Alimento::Alimento).to eq(true)
        expect(@arroz.kind_of?Alimento::Alimento).to eq(true)
        expect(@lentejas.kind_of?Alimento::Alimento).to eq(true)
        expect(@papas.kind_of?Alimento::Alimento).to eq(true)
    end
end

RSpec.describe Alimento::Verduras do
    before :all do
        @tomate=Alimento::Verduras.new("tomate", 1,3.5,0.2)
        @cebolla=Alimento::Verduras.new("cebolla", 1.3,5.8,0.3)
        @calabaza=Alimento::Verduras.new("calabaza", 1.1,4.8,0.1)
    end
    it "# Clase de un objeto" do
        expect(@tomate.class).to eq(Alimento::Verduras)
        expect(@cebolla.class).to eq(Alimento::Verduras)
        expect(@calabaza.class).to eq(Alimento::Verduras)
    end
    it "# Tipo de un objeto" do
        expect(@tomate.instance_of?Alimento::Verduras).to eq(true)
        expect(@cebolla.instance_of?Alimento::Verduras).to eq(true)
        expect(@calabaza.instance_of?Alimento::Verduras).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@tomate.kind_of?Alimento::Verduras).to eq(true)
        expect(@cebolla.kind_of?Alimento::Verduras).to eq(true)
        expect(@calabaza.kind_of?Alimento::Verduras).to eq(true)
    end
end

RSpec.describe Alimento::Frutas do
    before :all do
        @manzana=Alimento::Frutas.new("manzana", 0.3,12.4,0.4)
        @platano=Alimento::Frutas.new("platano", 1.2,21.4,0.2)
        @pera=Alimento::Frutas.new("pera", 0.5,12.7,0.3)
    end
    it "# Clase de un objeto" do
        expect(@manzana.class).to eq(Alimento::Frutas)
        expect(@platano.class).to eq(Alimento::Frutas)
        expect(@pera.class).to eq(Alimento::Frutas)
    end
    it "# Tipo de un objeto" do
        expect(@manzana.instance_of?Alimento::Frutas).to eq(true)
        expect(@platano.instance_of?Alimento::Frutas).to eq(true)
        expect(@pera.instance_of?Alimento::Frutas).to eq(true)
    end
    it "# Pertenencia a una Jerarquia" do
        expect(@manzana.kind_of?Alimento::Frutas).to eq(true)
        expect(@platano.kind_of?Alimento::Frutas).to eq(true)
        expect(@pera.kind_of?Alimento::Frutas).to eq(true)
    end
end

RSpec.describe Lista::Lista do
    describe "# Pruebas de la Clase Lista" do
        before :all do
            @lista=Lista::Lista.new(5)
        end
    
        it "# Creacion del Objeto Lista con un objeto" do
            expect(@lista).not_to be(nil)
        end
    
        describe "# Metodos de la clase Lista" do
            it "# Push 1 objeto" do
                object = 9
                expect(@lista.push(object).value).to eq(9)
            end
            it "# Push 2+ Objects" do
                array=[2,3,4]
                expect(@lista.push(array).value).to eq(4)
            end
    
            it "# Pop_front" do
                expect(@lista.pop_front.value).to eq(9)
            end
    
            it "# Pop_back" do
                expect(@lista.pop_back.value).to eq(3)
            end
    
            it "# to_s" do
                expect(@lista.to_s).to eq("[ 9, 2, 3 ]")
            end
        end
    end
end
