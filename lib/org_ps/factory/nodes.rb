module OrgPs
  module Factory
    class Nodes
      class << self
        def create_root(org)
          OrgPs.tree_node_class.com.enabled.create(nodeable: org, org.gui_number, name: org.abbrev_name)
        end

        def create_child(parent_node, org)
          parent_node.children.send(org.typing).enabled.create(nodeable: org, code: org.code, name: org.abbrev_name)
        end
      end
    end
  end
end
