require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PostEventsController do

  # This should return the minimal set of attributes required to create a valid
  # PostEvent. As you add validations to PostEvent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostEventsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all post_events as @post_events" do
      post_event = PostEvent.create! valid_attributes
      get :index, {}, valid_session
      assigns(:post_events).should eq([post_event])
    end
  end

  describe "GET show" do
    it "assigns the requested post_event as @post_event" do
      post_event = PostEvent.create! valid_attributes
      get :show, {:id => post_event.to_param}, valid_session
      assigns(:post_event).should eq(post_event)
    end
  end

  describe "GET new" do
    it "assigns a new post_event as @post_event" do
      get :new, {}, valid_session
      assigns(:post_event).should be_a_new(PostEvent)
    end
  end

  describe "GET edit" do
    it "assigns the requested post_event as @post_event" do
      post_event = PostEvent.create! valid_attributes
      get :edit, {:id => post_event.to_param}, valid_session
      assigns(:post_event).should eq(post_event)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PostEvent" do
        expect {
          post :create, {:post_event => valid_attributes}, valid_session
        }.to change(PostEvent, :count).by(1)
      end

      it "assigns a newly created post_event as @post_event" do
        post :create, {:post_event => valid_attributes}, valid_session
        assigns(:post_event).should be_a(PostEvent)
        assigns(:post_event).should be_persisted
      end

      it "redirects to the created post_event" do
        post :create, {:post_event => valid_attributes}, valid_session
        response.should redirect_to(PostEvent.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post_event as @post_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostEvent.any_instance.stub(:save).and_return(false)
        post :create, {:post_event => {  }}, valid_session
        assigns(:post_event).should be_a_new(PostEvent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PostEvent.any_instance.stub(:save).and_return(false)
        post :create, {:post_event => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post_event" do
        post_event = PostEvent.create! valid_attributes
        # Assuming there are no other post_events in the database, this
        # specifies that the PostEvent created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PostEvent.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => post_event.to_param, :post_event => { "these" => "params" }}, valid_session
      end

      it "assigns the requested post_event as @post_event" do
        post_event = PostEvent.create! valid_attributes
        put :update, {:id => post_event.to_param, :post_event => valid_attributes}, valid_session
        assigns(:post_event).should eq(post_event)
      end

      it "redirects to the post_event" do
        post_event = PostEvent.create! valid_attributes
        put :update, {:id => post_event.to_param, :post_event => valid_attributes}, valid_session
        response.should redirect_to(post_event)
      end
    end

    describe "with invalid params" do
      it "assigns the post_event as @post_event" do
        post_event = PostEvent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostEvent.any_instance.stub(:save).and_return(false)
        put :update, {:id => post_event.to_param, :post_event => {  }}, valid_session
        assigns(:post_event).should eq(post_event)
      end

      it "re-renders the 'edit' template" do
        post_event = PostEvent.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PostEvent.any_instance.stub(:save).and_return(false)
        put :update, {:id => post_event.to_param, :post_event => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post_event" do
      post_event = PostEvent.create! valid_attributes
      expect {
        delete :destroy, {:id => post_event.to_param}, valid_session
      }.to change(PostEvent, :count).by(-1)
    end

    it "redirects to the post_events list" do
      post_event = PostEvent.create! valid_attributes
      delete :destroy, {:id => post_event.to_param}, valid_session
      response.should redirect_to(post_events_url)
    end
  end

end