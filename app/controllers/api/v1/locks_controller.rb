require 'csv'

class Api::V1::LocksController < Api::V1::BaseController
  before_action :authenticate_server

  def index
    @locks = Lock.all
  end

  def create
    # Good credentials only
    # render json: { message: "Good Crendentials" }
    report = params["report"].open
    parse_file(report)
    render json: { message: "FINISHED!!! Locks: #{Lock.count} + Entries: #{Entry.count}" }
  end

  private

  def authenticate_server
    code_name = request.headers["X-Server-CodeName"]
    server = Server.find_by(code_name: code_name)
    token = request.headers["X-Server-Token"]
    # If the request has wrong credentials
    unless server && server.access_token == token
      render json: { message: "Wrong Crendentials" }
    end
  end

  def parse_file(report)
    csv_options = { col_sep: ',', headers: :first_row }

    CSV.parse(report, csv_options) do |row|
      timestamp = row['timestamp']
      lock_id = row['lock_id']
      kind = row['kind']
      status = row['status']

      # Find lock and update its status if exists already
      lock = Lock.find_by(id: lock_id)

      if lock
        lock.status = status
      else
        lock = Lock.new(id: lock_id, kind: kind, status: status)
      end
      lock.save

      # Create entry and associate the lock to it
      Entry.create(timestamp: timestamp, status_change: status, lock: lock)
    end
  end
end
