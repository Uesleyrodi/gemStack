describe "POST /products" do
  before(:all) do
    @product = Product.new("uesley_rsantos2@hotmail.com", "pwd123")
  end
  it "novo produto" do
    payload = {
      title: "Contra",
      category: "Super Nintendo",
      producers: ["Nintendo", "Konami"],
      price: "299.99",
      description: "O melhor de tiros :)",
      cover: "contra.jpg",
    }

    Database.new.remove_product(payload[:title])

    resp = @product.create(payload)
    expect(resp.code).to eql 200
  end

  it "produto duplicado" do
    payload = {
      title: "Alex Kid",
      category: "Maste System",
      producers: ["Sega"],
      price: "19.99",
      description: "Outro game muito divertido",
      cover: "alexk.jpg",
    }

    Database.new.remove_product(payload[:title])

    @product.create(payload)
    resp = @product.create(payload)

    expect(resp.code).to eql 409
    expect(resp.parsed_response["msg"]).to eql "title must be unique"
  end

  it "titulo não informado" do
    payload = {
      title: "",
      category: "Super Nintendo",
      producers: ["Nintendo", "Konami"],
      price: "299.99",
      description: "O melhor de tiros :)",
      cover: "contra.jpg",
    }

    resp = @product.create(payload)
    expect(resp.code).to eql 400
    expect(resp.parsed_response["msg"]).to eql "Oops! title cannot be empty"
  end

  it "categoria não informada" do
    payload = {
      title: "Donkey Kong Contry",
      category: "",
      producers: ["Nintendo", "Konami"],
      price: "299.99",
      description: "O melhor de tiros :)",
      cover: "contra.jpg",
    }

    Database.new.remove_product(payload[:title])

    resp = @product.create(payload)
    expect(resp.code).to eql 400
    expect(resp.parsed_response["msg"]).to eql "Oops! category cannot be empty"
  end

  it "preço não informado" do
    payload = {
      title: "Donkey Kong Contry",
      category: "Super Nintendo",
      producers: ["Nintendo", "Konami"],
      price: "",
      description: "O melhor de tiros :)",
      cover: "contra.jpg",
    }

    Database.new.remove_product(payload[:title])

    resp = @product.create(payload)
    expect(resp.code).to eql 400
    expect(resp.parsed_response["msg"]).to eql "Oops! price cannot be empty"
  end
end
