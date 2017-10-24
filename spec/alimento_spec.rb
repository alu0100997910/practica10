require 'lib/alimento'

describe Alimento do
    before :each do
        @alimento=Alimento.new("Huevo Frito",14.1,0)
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
    end

end