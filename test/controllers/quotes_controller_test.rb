require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
  	quote = FactoryGirl.create(:quote)
    get :show, :id => quote.id
    assert_response :success
  end

  test "quote show page, not_found" do
    get :show, :id => 'xyz'
    assert_response :not_found
  end

  test "quote add new entry" do
  	post :create, :quote => { :author => 'Sui Sing', :saying => 'This is a test quote.'}
  	assert_redirected_to root_path
  end

  test "quote add new entry, validation fail" do
  	post :create, :quote => { :author => '', :saying => 'This is a test quote.'}
  	assert_response(:redirect)
  end
end
