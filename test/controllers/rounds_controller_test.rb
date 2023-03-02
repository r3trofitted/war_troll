require "test_helper"

class RoundsControllerTest < ActionDispatch::IntegrationTest
  test "Round resolves to a pretty URL" do
    assert_recognizes({ controller: "rounds", action: "show", combat_id: "123", number: "3" }, "/combats/123/round-3")
  end
end
