require "test_helper"

class CarrinhoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get carrinho_show_url
    assert_response :success
  end
end
