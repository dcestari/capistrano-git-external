module CapistranoGitExternal
  module GitPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def add_git_external_commands(method_name, revision, destination)
        git = command
        execute = []

        execute << super.send(method_name, revision, destination)

#        if variable(:git_enable_externals)
          execute << "#{git} external init"
          execute << "#{git} external update"
#        end

        execute.join(" && ")
      end

      def checkout(revision, destination)
        add_git_external_commands(:checkout, revision, destination)
      end

      def sync(revision, destination)
        add_git_external_commands(:sync, revision, destination)
      end
    end
  end
end

