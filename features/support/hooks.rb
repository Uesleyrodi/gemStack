
Before do
    page.current_window.resize_to(1440, 900)

    @login_page = LoginPage.new
    @product_page = ProductPage.new
    @side = Sidebar.new
end


Before("@auth") do
    @login_page.go
    @login_page.with("uesley_rsantos2@hotmail.com", "pwd123")
end

After do 
    puts "Tudo aqui acontece depois do teste!"
end