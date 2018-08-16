require 'spec_helper'

describe 'dos2unix' do
<<<<<<< HEAD
  context 'Checking parameter validity' do
    it { is_expected.not_to eq(nil) }
    it do
      is_expected.to run.with_params.and_raise_error(ArgumentError, /Wrong number of arguments/)
    end
    it do
      is_expected.to run.with_params('one', 'two').and_raise_error(ArgumentError, /Wrong number of arguments/)
=======
  context 'when checking parameter validity' do
    it { is_expected.not_to eq(nil) }
    it do
      is_expected.to run.with_params.and_raise_error(ArgumentError, %r{Wrong number of arguments})
    end
    it do
      is_expected.to run.with_params('one', 'two').and_raise_error(ArgumentError, %r{Wrong number of arguments})
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end
    it do
      is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError)
    end
    it do
      is_expected.to run.with_params({}).and_raise_error(Puppet::ParseError)
    end
    it do
      is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError)
    end
  end

<<<<<<< HEAD
  context 'Converting from dos to unix format' do
    sample_text    = "Hello\r\nWorld\r\n"
    desired_output = "Hello\nWorld\n"

    it 'should output unix format' do
      should run.with_params(sample_text).and_return(desired_output)
    end
  end

  context 'Converting from unix to unix format' do
    sample_text    = "Hello\nWorld\n"
    desired_output = "Hello\nWorld\n"

    it 'should output unix format' do
      should run.with_params(sample_text).and_return(desired_output)
=======
  context 'when converting from dos to unix format' do
    sample_text    = "Hello\r\nWorld\r\n"
    desired_output = "Hello\nWorld\n"

    it 'outputs unix format' do
      is_expected.to run.with_params(sample_text).and_return(desired_output)
    end
  end

  context 'with internationalization (i18N) values' do
    sample_text_utf8    = "Ħ℮ļłǿ\r\nשׁөŕłđ\r\n"
    desired_output_utf8 = "Ħ℮ļłǿ\nשׁөŕłđ\n"

    sample_text_doublebyte    = "こんにちは\r\n世界\r\n"
    desired_output_doublebyte = "こんにちは\n世界\n"

    it 'outputs uft8 string' do
      is_expected.to run.with_params(sample_text_utf8).and_return(desired_output_utf8)
    end

    it 'outputs double byte string' do
      is_expected.to run.with_params(sample_text_doublebyte).and_return(desired_output_doublebyte)
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end
  end
end
