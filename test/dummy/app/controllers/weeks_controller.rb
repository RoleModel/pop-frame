class WeeksController < ActionController::Base
  layout 'application'

  cattr_accessor :version, default: 1
  cattr_accessor :fetches, default: 0

  def index; end

  def show
    self.class.fetches += 1
    sleep 0.6 if Rails.env.development? # long enough to see the loading state
  end

  def save
    self.class.version += 1
    redirect_to weeks_path, status: :see_other
  end
end
