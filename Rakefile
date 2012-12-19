require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/version_task'
Rake::VersionTask.new


class Bundler::GemHelper
  def rubygem_push(gem_path)
    command = "scp #{gem_path} www-data@gems.bstar.wido.me:/var/www/wido.bstar.gems/repo/gems/"
    puts command
    system(command)
  end
end