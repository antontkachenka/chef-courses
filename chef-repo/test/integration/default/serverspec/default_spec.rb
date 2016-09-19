require 'serverspec'
require 'net/http'
set :backend, :exec

describe "22 port is listening" do
	it "test port - success" do
		expect(port(22)).to be_listening
	end
end

describe process("jenkins") do
        its(:count) do 
                should eq 1 
        end
end

describe 'Jenkins URL' do
        it 'Jenkins URL available' do
                jenkins_url = URI("http://127.0.0.1:8080/jenkins")
                jenkins_url_status = Net::HTTP.get_response(jenkins_url)
                expect jenkins_url_status.kind_of? Net::HTTPSuccess
        end
end
