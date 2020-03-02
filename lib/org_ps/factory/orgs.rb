module OrgPs
  module Factory
    class Orgs
      def self.create_company(gui_number, name, office_address)
        Org.com.enabled.create(
          gui_number: gui_number,
          abbrev_name: name,
          full_name: name,
          code: "company_#{gui_number}"
        )
      end
    end
  end
end
