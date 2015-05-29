module Voltex
  module Generators
    module Helpers
      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def model_path
        File.join('app', 'models', "#{file_name}.rb")
      end
    end
  end
end
