action :install_server do
  yum_package "nginx" do
    action :install
  end
end

action :setup_web_server do
  puts "\n Hello Nginx Web Server! "
  puts "Time.now = #{Time.now}"
end

action :stop do 
  service "nginx" do
    action :start
  end
end 

action :start do
  service "nginx" do
   action :start
  end
end

action :restart do
  service "nginx" do
    action :restart
  end
end

action :reload do
  service "nginx" do
    action :reload
  end
end
