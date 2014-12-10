namespace :db do
  break unless Rails.env.development?

  namespace :production do
    desc 'Clone production data to local database'
    task clone_to_local: :environment do
      with_recent_data = ENV['RECENT_DATA'] == 'true'

      backup = Backup.new(:heroku)
      backup.capture if with_recent_data
      backup.pull
    end
  end
end
