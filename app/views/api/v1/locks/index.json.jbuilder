json.array! @locks do |lock|
  json.extract! lock, :id, :time, :kind, :status_change
end
