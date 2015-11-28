require 'spec_helper'

module Xcake
  module Generator
    describe CopyXCAssetsBuildPhase do

      before :each do
        @node = double().as_null_object
      end

      it "should not able to install folder" do
        folder_path = 'Folder/'

        allow(@node).to receive(:path).and_return(folder_path)
        allow(File).to receive(:directory?).with(folder_path).and_return(true)

        expect(CopyXCAssetsBuildPhase.can_install_node(@node)).to be(false)
      end

      it "should be able to install xcassets foler" do
        folder_path = 'Assets.xcassets'

        allow(@node).to receive(:path).and_return(folder_path)
        allow(File).to receive(:directory?).with(folder_path).and_return(true)

        expect(CopyXCAssetsBuildPhase.can_install_node(@node)).to be(true)
      end

      it "should remove children for node" do

        expect(@node).to receive(:children=).with([])

        project = double().as_null_object

        build_phase = CopyXCAssetsBuildPhase.new(project)
        build_phase.visit_node(@node)
      end

    end
  end
end