class Backup
  attr_reader :environment

  def initialize(environment = 'production')
    @environment = environment
  end

  def capture
    puts "Performing database backup of #{environment}"
    Bundler.with_clean_env { system("heroku pgbackups:capture --expire -r #{environment}") }
  end

  def pull
    puts "Cloning #{environment} data locally"
    Bundler.with_clean_env { system("heroku pgbackups:pull -r #{environment}") }
  end
end
