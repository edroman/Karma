require "spec_helper"

describe "routes for admin/needs:" do
  it "index" do
    get("/admin/needs").should route_to "admin/needs#index"
  end

  it "show" do
    get("/admin/needs/:id").should route_to "admin/needs#show", :id => ":id"
  end

  it "new" do
    get("/admin/needs/new").should route_to "admin/needs#new"
  end

  it "create" do
    post("/admin/needs").should route_to "admin/needs#create"
  end

  it "edit" do
    get("/admin/needs/:id/edit").should route_to "admin/needs#edit", :id => ":id"
  end

  it "update" do
    put("/admin/needs/:id").should route_to "admin/needs#update", :id => ":id"
  end

  it "delete" do
    delete("/admin/needs/:id").should route_to "admin/needs#destroy", :id => ":id"
  end

end