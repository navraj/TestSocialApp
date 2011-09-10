require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => UserSessions.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    UserSessions.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    UserSessions.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to user_sessions_url(assigns(:user_sessions))
  end

  def test_edit
    get :edit, :id => UserSessions.first
    assert_template 'edit'
  end

  def test_update_invalid
    UserSessions.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserSessions.first
    assert_template 'edit'
  end

  def test_update_valid
    UserSessions.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserSessions.first
    assert_redirected_to user_sessions_url(assigns(:user_sessions))
  end

  def test_destroy
    user_sessions = UserSessions.first
    delete :destroy, :id => user_sessions
    assert_redirected_to user_sessions_url
    assert !UserSessions.exists?(user_sessions.id)
  end
end
