remove_file("bin/dev")
copy_file "resources/dev", "bin/dev"

remove_file("Procfile.dev")
copy_file "resources/Procfile.dev", "Procfile.dev"
