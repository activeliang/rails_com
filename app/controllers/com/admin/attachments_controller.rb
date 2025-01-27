class Com::Admin::AttachmentsController < Com::Admin::BaseController
  before_action :set_attachment, only: [:delete, :destroy]

  def index
    q_params = {}
    q_params.merge params.permit(:record_type, :record_id, :name)
    @attachments = ActiveStorage::Attachment.default_where(q_params).order(id: :desc).page(params[:page])
  end

  def garbled
    @attachments = ActiveStorage::Attachment.garbled.order(id: :desc).page(params[:page])
    render :index
  end

  def delete
    @attachment.destroy
  end

  def destroy
    @attachment.purge
  end

  private
  def set_attachment
    @attachment = ActiveStorage::Attachment.find(params[:id])
  end

end
