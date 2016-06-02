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

Then(/^it should be successful$/) do
  expect(@status.success?).to eq(true)
end

Then(/^Nodejs should exist in system path$/) do
  output, error, status = Open3.capture3 "node -v"
  expect(status.success?).to eq(true)
end

Then(/^Npm should exist in the system path$/) do
  output, error, status = Open3.capture3 "npm -v"
  expect(status.success?).to eq(true)
end
