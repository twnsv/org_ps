module OrgPs
  module Factory
    class Nodes
      def self.create_root(nodeable)
        org = nodeable[:nodeable]
        TreeNode.company.enabled.create(nodeable: org, org.gui_number, name: org.abbrev_name)
      end
    end
  end
end
