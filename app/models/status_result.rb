# app/models/status_result.rb
class StatusResult
  attr_reader :type, :title, :status, :detail, :instance

  def initialize(type:, title:, status:, detail:, instance:)
    @type = type
    @title = title
    @status = status
    @detail = detail
    @instance = instance
  end

  def as_json(_options = {})
    {
    type: type,
    title: title,
    status: status,
    detail: detail,
    instance: instance
    }
  end
end
