template "app/views/layouts/application.html.slim.tt"
template "app/views/layouts/preview.html.slim.tt"
remove_file "app/views/layouts/application.html.erb"

template "app/controllers/profile_controller.rb.tt"
template "app/views/profile/show.html.slim.tt"
