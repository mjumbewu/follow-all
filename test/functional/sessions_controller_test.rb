require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should save access token and secret in session on OAuth callback' do
    result = {}
    result['omniauth.auth'] = {}
    result['omniauth.auth']['credentials'] = {}
    result['omniauth.auth']['credentials']['token'] = 'abc'
    result['omniauth.auth']['credentials']['secret'] = '123'
    request.stubs :env => result
    get :create
    assert_equal 'abc', session[:access_token]
    assert_equal '123', session[:access_secret]
    assert_equal 'Signed in with Twitter!', flash[:notice]
    assert_redirected_to show_path
  end

  test 'should display list when authenticated' do
    session[:access_token] = 'abc'
    session[:access_secret] = '123'
    stub_request(:get, 'https://api.twitter.com/1/account/verify_credentials.json').
      to_return(:body => File.read(File.expand_path('../../fixtures/user.json', __FILE__)), :status => 200)
    stub_request(:get, "https://api.twitter.com/1/users/show.json?screen_name=sferik").
      to_return(:body => File.read(File.expand_path('../../fixtures/user.json', __FILE__)), :status => 200)
    get :show
    assert_not_nil assigns :user
    assert_response :success
    assert_select 'title', 'Follow All'
    assert_select 'form' do
      assert_select '[action=?]', '/follows'
      assert_select '[method=?]', 'post'
    end
    assert_select 'input[name="list"]' do
      assert_select '[type=?]', 'text'
      assert_select '[size=?]', 20
      assert_select '[value=?]', 'codeforamerica/team'
    end
    assert_select 'input[name="follow"]' do
      assert_select '[type=?]', 'submit'
      assert_select '[value=?]', 'Follow all members of this list!'
    end
    assert_select 'form' do
      assert_select '[action=?]', '/signout'
      assert_select '[method=?]', 'post'
    end
    assert_select 'input[name="_method"]' do
      assert_select '[type=?]', 'hidden'
      assert_select '[value=?]', 'delete'
    end
    assert_select 'input[name="commit"]' do
      assert_select '[type=?]', 'submit'
      assert_select '[value=?]', 'Sign out'
    end
  end

  test 'should redirect to failure path when unauthenticated' do
    get :show
    assert_redirected_to failure_path
  end

  test 'should display error on failure' do
    get :error
    assert_equal 'Sign in with Twitter failed!', flash[:error]
    assert_redirected_to root_path
  end

  test 'should empty session on sign out' do
    get :destroy
    assert_equal Hash.new, session
    assert_equal 'Signed out!', flash[:notice]
    assert_redirected_to root_path
  end
end
