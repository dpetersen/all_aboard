module AllAboard::PerspectiveAssignment::JobData
  extend ActiveSupport::Concern

  def update_data(hash)
    AllAboard.redis.set(data_key, hash.to_json)
  end

  def current_data
    json = AllAboard.redis.get(data_key)
    return {} if json.nil?

    JSON.parse(json)
  end

  def data_key
    "data:#{id}"
  end
end
