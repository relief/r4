json.array!(@post_events) do |post_event|
  json.extract! post_event, 
  json.url post_event_url(post_event, format: :json)
end