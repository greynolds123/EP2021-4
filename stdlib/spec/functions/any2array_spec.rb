require 'spec_helper'

describe 'any2array' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_return([]) }
<<<<<<< HEAD
  it { is_expected.to run.with_params('').and_return([]) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it { is_expected.to run.with_params(true).and_return([true]) }
  it { is_expected.to run.with_params('one').and_return(['one']) }
  it { is_expected.to run.with_params('one', 'two').and_return(%w[one two]) }
  it { is_expected.to run.with_params([]).and_return([]) }
  it { is_expected.to run.with_params(['one']).and_return(['one']) }
  it { is_expected.to run.with_params(%w[one two]).and_return(%w[one two]) }
  it { is_expected.to run.with_params({}).and_return([]) }
<<<<<<< HEAD
  it { is_expected.to run.with_params('key' => 'value').and_return(['key', 'value']) }
=======
  it { is_expected.to run.with_params('key' => 'value').and_return(%w[key value]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  it { is_expected.to run.with_params('‰').and_return(['‰']) }
  it { is_expected.to run.with_params('竹').and_return(['竹']) }
  it { is_expected.to run.with_params('Ü').and_return(['Ü']) }
  it { is_expected.to run.with_params('∇').and_return(['∇']) }
  it { is_expected.to run.with_params('€', '万', 'Ö', '♥', '割').and_return(['€', '万', 'Ö', '♥', '割']) }
end
