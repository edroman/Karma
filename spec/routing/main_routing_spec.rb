require "spec_helper"

describe "routes for main:" do
  it "index" do
    get("/main").should raise_error()
  end

  it "show" do
    get("/main/:id").should raise_error()
  end

  it "new" do
    get("/main/new").should raise_error()
  end

  it "create" do
    post("/main").should raise_error()
  end

  it "edit" do
    get("/main/:id/edit").should raise_error()
  end

  it "update" do
    put("/main/:id").should raise_error()
  end

  it "delete" do
    delete("/main/:id").should raise_error()
  end

  it "home" do
    get("/").should route_to "main#home"
  end

end