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
