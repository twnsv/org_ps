module OrgPs
  require "org_ps/engine"

  mattr_accessor :org_class

  def self.org_class
    @org_class.constantize
  end

  require 'org_ps/trunk/linkable'
  require 'org_ps/factory/nodes'
  require 'org_ps/factory/orgs'
  require 'org_ps/service/org_nodes'
end
