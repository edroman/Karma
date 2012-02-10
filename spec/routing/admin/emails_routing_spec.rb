require "spec_helper"

describe "routes for admin/emails:" do
  it "index" do
    get("/admin/emails").should route_to "admin/emails#index"
  end

  it "show" do
    get("/admin/emails/:id").should route_to "admin/emails#show", :id => ":id"
  end

  it "new" do
    get("/admin/emails/new").should route_to "admin/emails#new"
  end

  it "create" do
    post("/admin/emails").should route_to "admin/emails#create"
  end

  it "edit" do
    get("/admin/emails/:id/edit").should route_to "admin/emails#edit", :id => ":id"
  end

  it "update" do
    put("/admin/emails/:id").should route_to "admin/emails#update", :id => ":id"
  end

  it "delete" do
    delete("/admin/emails/:id").should route_to "admin/emails#destroy", :id => ":id"
  end

end