require 'lib/alimento'

describe Alimento do
    before :each do
        @alimento=Alimento.new("Huevo Frito")
    end
    
    describe "# Creacion de alimento con un nombre" do
        it "Se almacena correctamente el nombre del alimento" do
            expect(@alimento.nombre).to eq("Huevo Frito")
        end
    end
end