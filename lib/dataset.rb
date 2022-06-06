class Dataset
  ALLOWED_FILE_TYPES = %w[.json]

  def initialize(file)
    @file = file

    validate

    @data = JSON.parse(File.read(file))
  end

  attr_reader :file, :data

  def find_section(id)
    data.dig('sections').find { |section| section.dig('id') == id }
  end

  def find_clause(id)
    data.dig('clauses').find { |clause| clause.dig('id') == id }
  end

  private

  def validate
    # Make sure the file exists.
    raise 'Please, provide a valid path of the dataset file!!!' unless File.exists?(file || '')

    # Make sure the file type is allowed.
    raise 'Please, provide a valid dataset file!!!' unless ALLOWED_FILE_TYPES.include?(File.extname(file))

    # Here we can handle more validations.
  end
end
