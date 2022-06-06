class Template
  ALLOWED_FILE_TYPES = %w[.txt]
  CLAUSE_REGEX       = /\[CLAUSE-\d\]/
  SECTION_REGEX      = /\[SECTION-\d\]/
  CLAUSE_FORMAT      = '[CLAUSE-{{ID}}]'

  def initialize(file)
    @file = file

    validate
    
    @data = File.read(file)
  end

  attr_reader :file, :data

  def get_tags(regex)
    data.scan(regex).map do |occurrence|
      { id: occurrence[/\d/].to_i, tag: occurrence }
    end
  end

  def fill_section_tag(tag, section)
    representation = section.dig('clauses_ids').map { |clause_id| CLAUSE_FORMAT.gsub('{{ID}}', clause_id.to_s) }.join(';')
    data.gsub!(tag, representation)
  end

  def fill_clause_tag(tag, clause)
    data.gsub!(tag, clause.dig('text'))
  end

  def export_document
    # A document can be exported here.
    puts data
  end

  private

  def validate
    # Make sure the file exists.
    raise 'Please, provide a valid path of the template file!!!' unless File.exists?(file || '')

    # Make sure the file type is allowed.
    raise 'Please, provide a valid template file!!!' unless ALLOWED_FILE_TYPES.include?(File.extname(file))

    # Here we can handle more validations.
  end
end
