require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "should be successful" do
      signed_request = "AQBaYWZ8CngFL_ySuoDAkNH2JYRRXKhOu6_kxTdAY-sP3pZfidZXtcoYaU_YnzSZWLEmEW9P2SVNzz3O9HPmeis9ontUXq2DJx02CUFthHLAkCGNpU1ls6pENvGCGlOAyAS1WcKuVpLKjMofTTI-wtYBmHaaqAB6WCDgIzFtVOdgCQzBJ2nec6TJxpcpO_s8eOU"
      args = FacebookAuthentication::parse_signed_request(signed_request, '150565638397986')
      print args
    end
  end

end
