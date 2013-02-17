
# Sync time to prevent syncing issues between VM and local env
#execute "sync-time" do
#  command "ntpdate pool.ntp.org"
#end


git "/home/vagrant/browserid" do
  repository "https://github.com/mozilla/browserid.git"
  reference "dev"
  user "vagrant"
  group "vagrant"
  action :sync
end

execute "install-browserid-dependices" do
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant/browserid"
  command "/usr/local/bin/npm install"
  action :run
end

bash "start-browserid-server" do
  user "vagrant"
  group "vagrant"
  cwd "/home/vagrant/browserid"
  code <<-EOH
    /usr/local/bin/npm start &
  EOH
end




