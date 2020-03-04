module OrgPs
  module Factory
    class Orgs
      class << self
        def create_company(gui_number, name)
          OrgPs.org_class.com.enabled.create(
            gui_number: gui_number,
            name: name
            abbrev_name: name,
            full_name: name,
            code: "company_#{gui_number}"
          )
        end

        def create_org(typing, name, code)
          OrgPs.org_class.send(typging).enabled.create(
            abbrev_name: name,
            full_name: name,
            code: code
          )
        end
      end
    end
  end
end
