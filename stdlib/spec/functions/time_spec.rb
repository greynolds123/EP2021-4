require 'spec_helper'

describe 'time' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params('a', '').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }

  context 'when running at a specific time' do
    before(:each) do
      # get a value before stubbing the function
      test_time = Time.utc(2006, 10, 13, 8, 15, 11)
<<<<<<< HEAD
      allow(Time).to receive(:new).with(no_args).and_return(test_time).once
=======
      Time.expects(:new).with.returns(test_time).once
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
    it { is_expected.to run.with_params.and_return(1_160_727_311) }
    it { is_expected.to run.with_params('').and_return(1_160_727_311) }
    it { is_expected.to run.with_params([]).and_return(1_160_727_311) }
    it { is_expected.to run.with_params({}).and_return(1_160_727_311) }
    it { is_expected.to run.with_params('foo').and_return(1_160_727_311) }
    it { is_expected.to run.with_params('UTC').and_return(1_160_727_311) }
    it { is_expected.to run.with_params('America/New_York').and_return(1_160_727_311) }
  end
end
