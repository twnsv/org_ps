module OrgPs
  module Service
    class OrgNodes
      class << self
        def create_company_node(gui_number, name, office_address)
          company = OrgPs::Factory::Orgs.create_company(gui_number, name, office_address)
          root = OrgPs::Factory::Nodes.create_root(company)
          {
            organization: company,
            tree_node: root
          }
        end

        def add_org_node(parent_node, typing, name, code)
          org = OrgPs::Factory::Orgs.create_org(typing, name, code)
          node = OrgPs::Factory::Nodes.create_child(parent_node, org)
          {
            organization: org,
            tree_node: node
          }
        end
      end
    end
  end
end
