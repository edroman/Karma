require "spec_helper"

describe "routes for admin/queries:" do
  it "index" do
    get("/admin/queries").should route_to "admin/queries#index"
  end

  it "show" do
    get("/admin/queries/:id").should route_to "admin/queries#show", :id => ":id"
  end

  it "new" do
    get("/admin/queries/new").should route_to "admin/queries#new"
  end

  it "create" do
    post("/admin/queries").should route_to "admin/queries#create"
  end

  it "edit" do
    get("/admin/queries/:id/edit").should route_to "admin/queries#edit", :id => ":id"
  end

  it "update" do
    put("/admin/queries/:id").should route_to "admin/queries#update", :id => ":id"
  end

  it "delete" do
    delete("/admin/queries/:id").should route_to "admin/queries#destroy", :id => ":id"
  end

end