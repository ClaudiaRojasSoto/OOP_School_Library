require_relative '../nameable'
require_relative '../decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

RSpec.describe Nameable do
  let(:nameable_instance) { Nameable.new }

  describe '#correct_name' do
    it 'raises a NotImplementedError if not overridden' do
      expect { nameable_instance.correct_name }.to raise_error(NotImplementedError, 'This method must be implemented')
    end
  end
end

RSpec.describe Decorator do
  let(:nameable_instance) { Nameable.new }
  let(:decorator_instance) { Decorator.new(nameable_instance) }

  describe '#correct_name' do
    it 'calls correct_name method on the nameable object' do
      expect(nameable_instance).to receive(:correct_name)
      decorator_instance.correct_name
    end
  end
end

RSpec.describe CapitalizeDecorator do
  let(:nameable_instance) { double(correct_name: 'name') }
  let(:capitalize_decorator_instance) { CapitalizeDecorator.new(nameable_instance) }

  describe '#correct_name' do
    it 'capitalizes the correct_name of the nameable object' do
      expect(capitalize_decorator_instance.correct_name).to eq('Name')
    end
  end
end

RSpec.describe TrimmerDecorator do
  let(:nameable_instance) { double(correct_name: 'longnameextra') }
  let(:trimmer_decorator_instance) { TrimmerDecorator.new(nameable_instance) }

  describe '#correct_name' do
    it 'trims the correct_name of the nameable object to 10 characters' do
      expect(trimmer_decorator_instance.correct_name).to eq('longnameex')
    end
  end
end
