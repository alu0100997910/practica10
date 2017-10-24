require 'lib/alimento'

describe Alimento do
    before :each do
        @alimento=Alimento.new("Huevo Frito",14.1,0,19.5)
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
    end

end