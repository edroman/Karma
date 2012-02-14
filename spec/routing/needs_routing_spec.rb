require "spec_helper"

describe "routes for needs:" do
  it "index" do
    get("/needs").should raise_error()
  end

  it "show" do
    get("/needs/:id").should raise_error()
  end

  it "new" do
    get("/needs/new").should route_to "needs#new"
  end

  it "create" do
    post("/needs").should route_to "needs#create"
  end

  it "edit" do
    get("/needs/:id/edit").should raise_error()
  end

  it "update" do
    put("/needs/:id").should raise_error()
  end

  it "delete" do
    delete("/needs/:id").should raise_error()
  end

  it "add_your_email" do
    get("/needs/thanks").should route_to "needs#thanks"
  end

end