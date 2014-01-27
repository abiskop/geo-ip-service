
name "geo-ip-service"
run_list "recipe[apt]", "recipe[geo-ip-service]"
default_attributes({})
