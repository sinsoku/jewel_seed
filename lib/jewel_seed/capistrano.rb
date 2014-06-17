Capistrano::Configuration.instance.load do
  namespace :jseed do
    desc "Migrate seed data into database"
    task :migrate, roles: :db, only: { primary: true } do
      run "cd #{release_path} && bundle exec rake RAILS_ENV=#{rails_env} jseed:migrate"
    end
  end
end
