require 'capistrano/recipes/deploy/scm/git'
require 'capistrano_git_external/git_patch'

Capistrano::Deploy::SCM::Git.send(:include, CapistranoGitExternal::GitPatch)

