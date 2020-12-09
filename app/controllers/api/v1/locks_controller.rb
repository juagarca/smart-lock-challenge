class Api::V1::LocksController < Api::V1::BaseController
  def index
    @locks = Lock.all
  end

  def create
    @lock = Lock.new(lock_params)
    @lock.server = current_user
    authorize @restaurant
    @lock.save
  end

  private

  def lock_params
    params.require(:lock).permit(:kind, :status_change)
  end
end
