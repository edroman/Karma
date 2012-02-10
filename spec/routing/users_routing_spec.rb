require "spec_helper"

describe "routes for users:" do
  it "index" do
    get("/users").should raise_error()
  end

  it "show" do
    get("/users/:id").should raise_error()
  end

  it "new" do
    get("/users/new").should raise_error()
  end

  it "create" do
    post("/users").should raise_error()
  end

  it "edit" do
    get("/users/:id/edit").should raise_error()
  end  

  it "update" do
    put("/users/:id").should route_to "users#update", :id => ":id"
  end

  it "delete" do
    delete("/users/:id").should raise_error()
  end

  it "add_your_email" do
    get("/add_your_email").should route_to "users#add_email"
  end

  it "house_rules" do
    get("/house_rules").should route_to "users#house_rules"
  end

end