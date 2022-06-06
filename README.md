# Ruby App

Simple OO based ruby script!!!

# Files

**generator** responsible to receive template and dataset files and initiate the T&C generation process.

**lib/generate** responsible to handle all processing of the T&C Generator.

**lib/template** responsible to validate the template file and handle different operations on the template.

**lib/dataset** responsible to validate the dataset file and handle different operations on the dataset.

**Gemfile** contains ***rspec*** for testing specs.

# Usage

    chmod +x generator.rb
    ./generator.rb template_file.txt dataset_file.json

To test specs, run the following:

    gem install bundler -v '2.1.4'
    bundle install
    bundle exec rspec
