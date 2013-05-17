#
# Cookbook Name:: jenkins_tomcat
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package node["tomcat"]["version"] do
    action :install
end

bash "change tomcat user" do
    user "root"
    group "root"
    cwd node["tomcat"]["home"]
    code "chown #{node["tomcat"]["user"]}:#{node["tomcat"]["group"]} ."
end

template "#{node["tomcat"]["installation"]}/conf/server.xml" do
    source "server.xml.erb"
    owner "root"
    group node["tomcat"]["group"]
    mode "0644"
end

template "/etc/default/#{node["tomcat"]["version"]}" do
    source "tomcat.erb"
    owner "root"
    group "root"
    mode "0644"
end

link "#{node["tomcat"]["home"]}/conf" do
    to "/etc/#{node["tomcat"]["version"]}"
    owner "root"
    group "root"
end

service node["tomcat"]["version"] do
    supports :restart => true, :reload => true, :status => true
    action :nothing
end
