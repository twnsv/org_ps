module OrgPs
  module Factory
    class Nodes
      def self.create_root(org)
        OrgPs.tree_node_class.com.enabled.create(nodeable: org, org.gui_number, name: org.abbrev_name)
      end
    end
  end
end
