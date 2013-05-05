require "spec_helper"

describe Gesund::Checks::MysqlConnection do
  it "passes when mysql returns PONG on a ping" do
    ::Mysql.stub_chain(:new, :ping, :close)
    subject.success.should be_true
    subject.message.should match "MySQL is answering to a ping"
  end
  it "fails when mysql raises an exception" do
    ::Mysql.stub(:new).and_raise("something bad")
    subject.success.should be_false
    subject.message.should match "MysqlConnection ERROR: RuntimeError: something bad"
  end
end
