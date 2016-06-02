require 'Open3'

Given(/^I have a running server$/) do
  output, error, status = Open3.capture3 "vagrant reload"
  expect(status.success?).to eq(true)
end

And(/^I provision it$/) do
  output, error, status = Open3.capture3 "vagrant provision"
  expect(status.success?).to eq(true)
end

When(/^I install Nodejs$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=.vagrant/machines/meanserver/virtualbox/private_key -u vagrant playbook.mean.yml --extra-vars 'roles=nodejs'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^It should be successful$/) do
  expect(@status.success?).to eq(true)
end

Then(/^Nodejs should exist in system path$/) do
  output, error, status = Open3.capture3 "vagrant ssh -c 'ls /usr/bin/node'"
  expect(status.success?).to eq(true)
end

Then(/^Npm should exist in the system path$/) do
  output, error, status = Open3.capture3 " vagrant ssh -c 'ls /usr/bin/npm'"
  expect(status.success?).to eq(true)
end

# Mongob tests
When(/^I install MongoDB$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=.vagrant/machines/meanserver/virtualbox/private_key -u vagrant playbook.mean.yml --extra-vars 'roles=mongodb'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^pip should exist in system path$/) do
  output, error, status = Open3.capture3 "vagrant ssh -c 'ls /usr/bin/pip'"
  expect(status.success?).to eq(true)
end

Then(/^pymongo should exist in system path$/) do
  cmd = "ls /usr/local/lib/python2.7/dist-packages/pymongo"
  output, error, status = Open3.capture3 "vagrant ssh -c '#{cmd}'"
  expect(status.success?).to eq(true)
end

Then(/^it mongod service should be running$/) do
  output, error, status = Open3.capture3 "vagrant ssh -c 'service mongod status'"
  output = output[0..19]
  expect(status.success?).to eq(true)
  expect(output).to match("mongod start/running")
end
When(/^I install dev\-tools$/) do
  cmd = "ansible-playbook -i inventory.ini --private-key=.vagrant/machines/meanserver/virtualbox/private_key -u vagrant playbook.mean.yml --extra-vars 'roles=dev-tools'"
  output, error, @status = Open3.capture3 "#{cmd}"
end

Then(/^dev\-tools to exist in system path$/) do
  tools = ['mocha','bower', 'nodemon','gulp']

  tools.each do |tool|
    output, error, status = Open3.capture3 "vagrant ssh -c 'ls /usr/bin/#{tool}'"
    expect(status.success?).to eq(true)
  end
end
