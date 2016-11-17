module AtlysComplexPage
  class Engine < ::Rails::Engine
    isolate_namespace AtlysComplexPage

    initializer "atlys_complex_page", before: :load_config_initializers do |app|
      Rails.application.routes.append do
        mount AtlysComplexPage::Engine, at: "/"
      end
    end

  end
end
