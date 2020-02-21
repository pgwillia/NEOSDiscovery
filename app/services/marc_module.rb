require 'nokogiri'

module MarcModule
  def nokogiri(document)
    Nokogiri::XML(document['marc_display']).remove_namespaces!
  end

  def marc_field(document, tag)
    document.xpath("//datafield[@tag='#{tag}']")
  end

  def get_marc_subfield(document, tag)
    document.xpath("subfield[@code='#{tag}']").text
  end

  private

  def get_marc_id(document)
    raw_id = document.xpath("//controlfield[@tag='001']").text
    if /^[[:alpha:]]$/.match?(raw_id.first)
      raw_id.slice!(0)
      raw_id
    else
      raw_id
    end
  end
end
