script "install_pgserver" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
  wget -c http://wwwmaster.postgresql.org/redir/170/h/source/v9.0.4/postgresql-9.0.4.tar.bz2 -O postgresql-9.0.4.tar.gz
  tar -xzf postgresql-9.0.4.tar.gz
  cd postgresql-9.0.4
  ./configure --with-openssl --with-libxml --with-libxslt 
  make world
  make install-world
  EOH
  not_if "test -f /usr/local/pgsql/bin/postgres"
end
