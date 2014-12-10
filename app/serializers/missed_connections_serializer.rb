class MissedConnectionsSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :title, :body, :verification_path

  private

  def verification_path
    view_context.new_missed_connection_verification_path(missed_connection_id: object.id)
  end

  def view_context
    @view_context ||= begin
      ActionView::Base.new(Rails.configuration.paths['app/views/']).tap do |view|
        view.class.include Rails.application.routes.url_helpers
      end
    end
  end
end
