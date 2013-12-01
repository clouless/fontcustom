require "spec_helper"

describe Fontcustom::Manifest do
  context "#initialize" do
    it "should create a manifest file and assign :options", :integration => true do
      live_test do |testdir|
        capture(:stdout) do
          manifest = File.join testdir, ".fontcustom-manifest.json"
          options = Fontcustom::Options.new(:manifest => manifest, :input => "vectors").options
          Fontcustom::Manifest.new manifest, options
        end
        content = File.read File.join(testdir, ".fontcustom-manifest.json")
        content.should match(/"options":.+sandbox\/test\/fontcustom/m)
      end
    end
  end
end
