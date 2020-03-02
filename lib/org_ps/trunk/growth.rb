module OrgPs
  module Trunk
    class Growth
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
          manager_org = OrgPs::Factory::Orgs.create_org('manager', "主管", "#{org.code}_manager")
          manager_node = OrgPs::Factory::Nodes.create_child(node, manager_org)
          member_org = OrgPs::Factory::Orgs.create_org('member', "員工", "#{org.code}_member")
          member_node = OrgPs::Factory::Nodes.create_child(node, member_org)

          {
            organization: org,
            tree_node: {
              node: node,
              children: {
                manager: manager_node,
                member:  member_node
              }
            }
          }
        end
      end
    end
  end
end
