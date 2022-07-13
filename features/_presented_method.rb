presented_method = <<-RUBY

  def presented
    "#{self.class.to_s}Presenter".constantize.new(self)
  end
RUBY

inject_into_file "app/models/application_record.rb",
  presented_method,
  after: "primary_abstract_class\n"
