default["tomcat"]["version"] = "tomcat6"
version = node["tomcat"]["version"]
default["tomcat"]["home"] = "/usr/share/#{version}"
default["tomcat"]["installation"] = "/var/lib/#{version}"
default["tomcat"]["webapps_dir"] = "/var/lib/#{version}/webapps"
default["tomcat"]["user"] = version
default["tomcat"]["group"] = version
