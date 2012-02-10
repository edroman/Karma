require "spec_helper"

describe "routes for sessions:" do
  it "index" do
    get("/sessions").should raise_error()
  end

  it "show" do
    get("/sessions/:id").should raise_error()
  end

  it "new" do
    get("/sessions/new").should raise_error()
  end

  it "create" do
    post("/sessions").should raise_error()
  end

  it "edit" do
    get("/sessions/:id/edit").should raise_error()
  end

  it "update" do
    put("/sessions/:id").should raise_error()
  end

  it "delete" do
    delete("/sessions/:id").should raise_error()
  end

  it "failure" do
    get("/auth/failure").should route_to "sessions#failure"
  end

  it "sign out" do
    get("/sign_out").should route_to "sessions#destroy"
  end

  it "auth routes" do
    get("/auth/:provider/callback").should route_to "sessions#create", :provider => ":provider"
  end
end