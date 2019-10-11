desc 'Creates default permissions'
task voltex: :environment do
  Rails.application.eager_load!
  Zeitwerk::Loader.eager_load_all if defined?(Zeitwerk)
  base_class = ApplicationRecord rescue ActiveRecord::Base

  base_class.descendants.each do |descendant|
    Voltex.default_actions.each do |action|
      Voltex.permission_model.where(
        resource: descendant.name,
        action: action
      ).first_or_create
    end
  end

  Voltex.exclude.each do |attrs|
    Voltex.permission_model.where(attrs).delete_all
  end

  Voltex.include.each do |attrs|
    Voltex.permission_model.where(attrs).first_or_create
  end
end
