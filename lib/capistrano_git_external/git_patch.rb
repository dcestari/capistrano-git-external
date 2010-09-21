module CapistranoGitExternal
  module GitPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method :checkout_without_externals, :checkout
        alias_method :checkout, :checkout_with_externals

        alias_method :sync_without_externals, :sync
        alias_method :sync, :sync_with_externals
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def add_git_external_commands(method_name, revision, destination)
        git = command
        execute = []

        execute << self.send(method_name, revision, destination)

        if variable(:git_enable_externals)
          execute << "#{git} external init"
          execute << "#{git} external update"
        end

        execute.join(" && ")
      end

      def checkout_with_externals(revision, destination)
        add_git_external_commands(:checkout_without_externals, revision, destination)
      end

      def sync_with_externals(revision, destination)
        add_git_external_commands(:sync_without_externals, revision, destination)
      end
    end
  end
end

