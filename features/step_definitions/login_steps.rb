Dado("que acesso à página principal") do
    visit "http://pixel-web:3000/login"
    page.current_window.resize_to(1440, 900)
end
  
Quando("eu submeto minhas credenciais {string} e {string}") do |email, password|
    # O hastag é para buscar um elemento pelo ID (Inspecione o elemento para ver)
    find("#emailId").set email
    find("input[name=password]").set password
    click_button "Entrar"
end
  
Então("devo ser autenticado") do
    logged_user = find(".user .info span").text
    expect(logged_user).to eql "Uesley"
end
  
Então("devo ver uma mensagem de alerta {string}") do |expect_alert|
    alert = find(".alert").text
    expect(alert).to eql expect_alert
end