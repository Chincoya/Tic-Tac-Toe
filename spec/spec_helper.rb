require './lib/logic'

RSpec.describe TicTacLogic do
  describe "#move" do
    engine = TicTacLogic.new("P1", "P2")
    [1,2,3,4,6,5,8,9,7].each do |x|
      # 9 checks
      it "Processes user input and returns if the input was valid" do
        expect(engine.move(x)).to be_truthy
      end
    end
    # 1 check - 10 in total
    it "Checking for a invalid move" do
      expect(engine.move(5)).to be_falsy
    end
    # 2 checks - 12 in total
    [0, 10].each do |x|
      it "Check for invalid inputs" do
        expect(engine.move(x)).to be_falsy
      end
    end
  end

  describe "#game_end" do
    engine1 = TicTacLogic.new("P1", "P2")
    [1,2,3,4,6,5,8,9,7].each do |x|
      # 9 check - 21 in total
      if x == 7
        it "Check if tied" do
          engine1.move(x)
          expect(engine1.game_end?).to be_falsy
        end
      else
        it "Checks win condition for #{x}" do
          engine1.move(x)
          expect(engine1.game_end?).to eql(-1)
        end
      end
    end

      engine2 = TicTacLogic.new("P1", "P2")
    [1, 2, 4, 3, 7].each do |x|
      engine2.move(x)
      # 1 check - 22 in total
      if x == 7
        it "Checks win condition on first column" do
          expect(engine2.game_end?).to be_truthy
        end
      end
    end

    engine3 = TicTacLogic.new("P1", "P2")
    [2, 1, 5, 3, 8].each do |x|
      engine3.move(x)
      # 1 check - 23 in total
      if x == 8
        it "Checks win condition on second column" do
          expect(engine3.game_end?).to be_truthy
        end
      end
    end

    engine4 = TicTacLogic.new("P1", "P2")
    [3, 1, 6, 2, 9].each do |x|
      engine4.move(x)
      # 1 check - 24 in total
      if x == 9
        it "Checks win condition on third column" do
          expect(engine4.game_end?).to be_truthy
        end
      end
    end

    engine5 = TicTacLogic.new("P1", "P2")
    [1, 4, 2, 5, 3].each do |x|
      engine5.move(x)
      # 1 check - 25 in total
      if x == 3
        it "Checks win condition on first row" do
          expect(engine5.game_end?).to be_truthy
        end
      end
    end

    engine6 = TicTacLogic.new("P1", "P2")
    [4, 1, 5, 2, 6].each do |x|
      engine6.move(x)
      # 1 check - 26 in total
      if x == 6
        it "Checks win condition on first row" do
          expect(engine6.game_end?).to be_truthy
        end
      end
    end

    engine7 = TicTacLogic.new("P1", "P2")
    [7, 1, 8, 2, 9].each do |x|
      engine7.move(x)
      # 1 check - 27 in total
      if x == 9
        it "Checks win condition on first row" do
          expect(engine7.game_end?).to be_truthy
        end
      end
    end

    engine8 = TicTacLogic.new("P1", "P2")
    [1, 2, 5, 3, 9].each do |x|
      engine7.move(x)
      # 1 check - 28 in total
      if x == 9
        it "Checks win condition on first diagonal" do
          expect(engine8.game_end?).to be_truthy
        end
      end
    end

    engine9 = TicTacLogic.new("P1", "P2")
    [3, 2, 5, 1, 7].each do |x|
      engine9.move(x)
      # 1 check - 29 in total
      if x == 7
        it "Checks win condition on second diagonal" do
          expect(engine9.game_end?).to be_truthy
        end
      end
    end
  end

  describe "#current_player" do
    engine10 = TicTacLogic.new("P1", "P2")
    # 2 checks - 31 in total
    it "Checks if the current player is the first one" do
      expect(engine10.current_player).to eql("P1")
    end
    it "Checks if the current player is the second one" do
      engine10.game_end?
      expect(engine10.current_player).to eql("P2")
    end
  end
end
