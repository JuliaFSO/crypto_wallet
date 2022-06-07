namespace :dev do
  desc "Development environment setup"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping db...") { %x(rails db:drop) }
      show_spinner("Creating db...") { %x(rails db:create) }
      show_spinner("Migrating db...") { %x(rails db:migrate) }
      show_spinner("Creating coins...") { %x(rails db:seed) }
    end
  end

private
  def show_spinner(msg_start, msg_end = "Done!")
    spinner = TTY::Spinner.new(msg_start)
    spinner.auto_spin
    yield
    spinner.success(msg_end)
  end

end
