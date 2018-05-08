# gives access to all testing configurations and methods
require 'rails_helper'
# :type => :helper treats the tests as helper specs and provides specific methods
RSpec.describe NavigationHelper, :type => :helper do

  context 'signed in user' do
      before(:each) { helper.stub(:user_signed_in?).and_return(true) }

      context '#collapsible_links_partial_path' do
        it "returns signed_in_links partial's path" do
          expect(helper.collapsible_links_partial_path).to (
            eq 'layouts/navigation/collapsible_elements/signed_in_links'
          )
        end
      end
    end

    context 'non-signed in user' do
      before(:each) { helper.stub(:user_signed_in?).and_return(false) }

      context '#collapsible_links_partial_path' do
        it "returns non_signed_in_links partial's path" do
          expect(helper.collapsible_links_partial_path).to (
            eq 'layouts/navigation/collapsible_elements/non_signed_in_links'
          )
        end
      end
    end

end
