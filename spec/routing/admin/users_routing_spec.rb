require "spec_helper"

describe "routes for admin/users:" do
  it "index" do
    get("/admin/users").should route_to "admin/users#index"
  end

  it "show" do
    get("/admin/users/:id").should route_to "admin/users#show", :id => ":id"
  end

  it "new" do
    get("/admin/users/new").should route_to "admin/users#new"
  end

  it "create" do
    post("/admin/users").should route_to "admin/users#create"
  end

  it "edit" do
    get("/admin/users/:id/edit").should route_to "admin/users#edit", :id => ":id"
  end

  it "update" do
    put("/admin/users/:id").should route_to "admin/users#update", :id => ":id"
  end

  it "delete" do
    delete("/admin/users/:id").should route_to "admin/users#destroy", :id => ":id"
  end

end