class CleanupNotesJob
  include Sidekiq::Job

  def perform
    Note.where('created_at < ?', 1.month.ago).delete_all
    Rails.logger.info "Deleted notes older than 1 month"
  end
end