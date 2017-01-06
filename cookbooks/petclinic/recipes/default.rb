#
# Cookbook:: petclinic
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
tomcat_service "petclinicserver" do
  action :start
  env_vars [{'JAVA_OPTS' =>
    '-Djava.net.preferIPv4Stack=true -Djava.net.preferIPv4Addresses=true '}]
end

remote_file '/opt/tomcat_petclinic/webapps/spring-petclinic.war' do
  source 'http://localhost:8081/libs-snapshot-local/com/liatrio/samples/spring-petclinic-tyler/1.0.2-SNAPSHOT/spring-petclinic-tyler-1.0.2-20161217.234420-1.war'
  owner 'tomcat_petclinic'
  group 'tomcat_petclinic'

end

directory '/home/tomcat_petclinic' do
  owner 'tomcat_petclinic'
  group 'tomcat_petclinic'
  mode 0755
end

