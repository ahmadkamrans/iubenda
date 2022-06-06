class Generate
  def initialize(template_file_path = nil, dataset_file_path = nil)
    @template_file_path, @dataset_file_path = template_file_path, dataset_file_path
  end

  attr_reader :template, :dataset

  def process
    @template = Template.new(@template_file_path)
    @dataset  = Dataset.new(@dataset_file_path)

    template.get_tags(Template::SECTION_REGEX).each do |section_tag|
      section = dataset.find_section(section_tag.dig(:id))
      next unless section

      template.fill_section_tag(section_tag.dig(:tag), section)
    end

    template.get_tags(Template::CLAUSE_REGEX).each do |clause_tag|
      clause = dataset.find_clause(clause_tag.dig(:id))
      next unless clause

      template.fill_clause_tag(clause_tag.dig(:tag), clause)
    end
    
    template.export_document
  end
end
