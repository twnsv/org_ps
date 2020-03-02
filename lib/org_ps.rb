module OrgPs
  require "org_ps/engine"

  mattr_accessor :org_class
  mattr_accessor :tree_node_class
  mattr_accessor :user_class

  def self.org_class
    @@org_class.constantize
  end

  def self.tree_node_class
    @@tree_node_class.constantize
  end

  def self.user_class
    @@user_class.contantize
  end

  require 'org_ps/factory/nodes'
  require 'org_ps/factory/orgs'
  require 'org_ps/trunk/growth'
  require 'org_ps/service/org_nodes'
end
