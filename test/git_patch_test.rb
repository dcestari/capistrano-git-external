require 'rubygems'
require 'capistrano_git_external'
require 'test/unit'

class GitPatchTest < Test::Unit::TestCase
  class TestSCM < Capistrano::Deploy::SCM::Git
    default_command "git"
  end

  def setup
    @config = {}

    @source = TestSCM.new(@config)
  end

  def test_checkout_without_externals
    @config[:repository] = "git@somehost.com:project.git"
    dest = "/var/www"
    rev = 'c2d9e79'

    assert_equal "git clone -q git@somehost.com:project.git /var/www && cd /var/www && git checkout -q -b deploy #{rev}", @source.checkout(rev, dest)
  end

  def test_checkout_with_externals
    @config[:git_enable_externals] = 1
    @config[:repository] = "git@somehost.com:project.git"
    dest = "/var/www"
    rev = 'c2d9e79'

    assert_equal "git clone -q git@somehost.com:project.git /var/www && cd /var/www && git checkout -q -b deploy #{rev} && git external init && git external update", @source.checkout(rev, dest)
  end

  def test_sync_without_externals
    dest = "/var/www"
    rev = 'c2d9e79'
    assert_equal "cd #{dest} && git fetch -q origin && git reset -q --hard #{rev} && git clean -q -d -x -f", @source.sync(rev, dest)
  end

  def test_sync_with_externals
    @config[:git_enable_externals] = 1
    dest = "/var/www"
    rev = 'c2d9e79'
    assert_equal "cd #{dest} && git fetch -q origin && git reset -q --hard #{rev} && git clean -q -d -x -f && git external init && git external update", @source.sync(rev, dest)
  end
end

