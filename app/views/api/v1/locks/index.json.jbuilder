json.array! @locks do |lock|
  json.extract! lock, :id, :kind, :status_change
end
