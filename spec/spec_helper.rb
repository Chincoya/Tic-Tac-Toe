require './lib/logic'

RSpec.describe TicTacLogic do
  describe "#move" do
    engine = TicTacLogic.new("P1", "P2")
    [1,2,3,4,6,5,8,9,7].each do |x|
      it "Processes user input and returns if the input was valid" do
        expect(engine.move(x)).to be_truthy
      end
      it "Checks win condition" do
        expect(engine.game_end?).to eql(-1) if x != 7
      end
      if x == 7
        it "Check if tied" do
          expect(engine.game_end?).to be_falsy
        end
      end
    end
  end

end
