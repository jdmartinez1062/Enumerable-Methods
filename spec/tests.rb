


RSpec.describe "Enumerable" do
    describe "#my_each" do
        it "loops through the array" do
            let(:ara){[1,2,3,4,5]}
            expect(ara.my_each{|x| puts x}).to eql(ara.each{|x| puts x})
        
        end
        it "creates enumerator" do
            let(:ara){[1,2,3,4,5]}
            expect(ara.my_each).to eql(ara.each)
        
        end


    end
end

