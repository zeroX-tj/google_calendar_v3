require "spec_helper"


describe Connection do
  describe "initialize" do
    it "should throw an InvalidTokenException if an invalid token is provided" do
      Connection.should_raise_error(InvalidTokenException)
      Connection.new('my_invalid_token')
    end
    it "should return without error if a valid token is provided" do
      Connection.should_not_raise_error
      Connection.new('ya29.AHES6ZSW_opHnLutPpGPaz_zRX5ZGOH74tOty5_B6A2FxNc')
    end
  end
end
