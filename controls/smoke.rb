# encoding: utf-8
# copyright: 2017, John Snow
# license: All rights reserved

title 'Windows Active Directory Inspec Smoke Tests'

control 'feature_installation' do
  impact 1.0
  title 'Ensure the Active Directory Directroy Services Feature is installed'
  desc 'This test validates that the feature is installed'
  describe windows_feature('AD-Domain-Services') do
    it { should be_installed }
  end
end

control 'services_operational' do
  impact 1.0
  title 'Ensure that the Active Directory Services are running'
  desc 'This test ensures that both the AD service and the AD Web sercice are running'
  describe service('NTDS') do
    it { should be_installed }
    it { should be_running }
  end
  describe service('ADWS') do
    it { should be_installed }
    it { should be_running }
  end
end
