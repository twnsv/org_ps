module OrgPs
  module Finder
    class Orgs
      attr_reader :company_node

      def intitialze(gui_number)
        @company_node = OrgPs.tree_node_class.roots.includes(:nodeable, :children).find_by_code(gui_number)
      end

      def child_org_node(typing, code)
        org_node = company_code.children&.includes(:nodeable).send(typing)&.find_by_code(code)

        {
          organization: org_node&.nodeable,
          tree_node: {
            node: org_node,
            parent: company_node
          }
        }
      end
    end
  end
end
