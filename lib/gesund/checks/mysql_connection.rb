require "mysql"

module Gesund::Checks
  class MysqlConnection
    include Gesund::Check
    def initialize(options={})
      begin
        ::Mysql.new.ping.close # raises exception on failure
        self.pass "MySQL is answering to a ping"
      rescue => e
        self.fail "#{self.class} ERROR: #{e.class}: #{e.message}"
      end
    end
  end
end
