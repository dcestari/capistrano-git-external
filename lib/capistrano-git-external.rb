require 'capistrano/recipes/deploy/scm/git'
require 'capistrano-git-external/git-patch'

Capistrano::Deploy::SCM::Git.send(:include, CapistranoGitExternal::GitPatch)

