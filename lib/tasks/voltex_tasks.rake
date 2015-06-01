desc 'Creates default permissions'
task voltex: :environment do
  Rails.application.eager_load!
  actions = %w(index show create update destroy)

  ActiveRecord::Base.descendants.each do |descendant|
    actions.each do |action|
      Voltex.permission_class.constantize.create(
        resource: descendant, action: action)
    end
  end
end
