######################
#                    #
#   PRIVATE RECIPE   #
#                    #
######################


# GoCD depends on the OpenJDK 7 (1.7.x) JRE, so install it!
node.force_override['java']['jdk_version'] = '7'                # ~FC019 (https://github.com/acrmp/foodcritic/pull/312)
node.force_override['java']['accept_license_agreement'] = true  # ~FC019 (https://github.com/acrmp/foodcritic/pull/312)
include_recipe 'java'

ruby_block 'Get JAVA_HOME path from `java` cookbook' do
  block do
    node.normal['gocd_agent']['java_home'] = node['java']['java_home'] || ENV['JAVA_HOME'] || nil
  end
end
