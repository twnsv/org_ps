module OrgPs
  module Finder
    class Authorities
      attr_reader :company_node

      def initialize(gui_number)
        @company_node = OrgPs.tree_node_class.roots.includes(:nodeable, :children).find_by_code(gui_number)
      end

      def manager_users
        manager_nodes = company_node.find_all_by_generation(2).manager.includes(:nodeable, :parent, :children)

        {}.tap do |nodes_hash|
          manager_nodes.find_each do |node|
            nodes_hash[node.parent.code] = {
              name: node.parent.name,
              user_ids: node.children.pluck(:nodeable_id)
            }
          end
        end.symbolize_keys
      end
    end
  end
end
