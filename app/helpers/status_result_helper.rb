# app/helpers/status_result_helper.rb
module StatusResultHelper
    def return_status_result(model:, status:, message:)
      StatusResult.new(
        type: "https://example.com/problemas/#{model}-erro",
        title: "#{model.capitalize} erro",
        status: status,
        detail: message,
        instance: request.path
      )
    end
  end
  