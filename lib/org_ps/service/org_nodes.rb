module OrgPs
  module Service
    class OrgNodes
      def create_company_node(gui_number, name, office_address)
        company = OrgPs::Factory::Orgs.create_company(gui_number, name, office_address)
        root = OrgPs::Factory::Nodes.create_root(company)
        {
          organization: company,
          tree_node: root
        }
      end

      def add_org_node()
      end
    end
  end
end
