require "spec_helper"

describe "routes for queries:" do
  it "index" do
    get("/queries").should raise_error()
  end

  it "show" do
    get("/queries/:id").should raise_error()
  end

  it "new" do
    get("/queries/new").should route_to "queries#new"
  end

  it "create" do
    post("/queries").should route_to "queries#create"
  end

  it "edit" do
    get("/queries/:id/edit").should raise_error()
  end

  it "update" do
    put("/queries/:id").should raise_error()
  end

  it "delete" do
    delete("/queries/:id").should raise_error()
  end

  it "add_your_email" do
    get("/queries/thanks").should route_to "queries#thanks"
  end

end