module Dams
  module ControllerMethods

    def list_records( type, name_field, limit = 1000 )
      records = Array.new
      query = "has_model_ssim:info:fedora/afmodel:#{type}"
      response, doc = get_search_results(:q => query, :rows => limit)
      id_ns = Rails.configuration.id_namespace
      doc.each do |obj|
        records << [obj[name_field].first, id_ns + obj["id"]] if obj[name_field]
      end
      records
    end

  end
end
