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
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^it should be successful$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Nodejs should exist in system path$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Npm should exist in the system path$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
