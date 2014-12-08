class MissedConnectionsSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :title, :info_window_content

  private

  def info_window_content
    context = Rails.configuration.paths['app/views']
    view = ActionView::Base.new(context)
    view.class.include Rails.application.routes.url_helpers
    view.render :partial => '/shared/info_window',
                :locals => {missed_connection: object}
  end
end
