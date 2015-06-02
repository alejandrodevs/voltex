desc 'Creates default permissions'
task voltex: :environment do
  Rails.application.eager_load!
  permission = Voltex.permission_class.constantize

  ActiveRecord::Base.descendants.each do |descendant|
    Voltex.actions.each do |action|
      permission.where(
        resource: descendant.name,
        action: action).first_or_create
    end
  end

  Voltex.exclude.each do |attrs|
    permission.where(attrs).delete_all
  end

  Voltex.include.each do |attrs|
    permission.where(attrs).first_or_create
  end
end
