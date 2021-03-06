# Copyright (c) 2010-2014 University of Manchester and the University of Southampton

require "xml/libxml"
require "workflow_parser/rapidminer/operator"

module WorkflowParser
module RapidMiner
  # A RapidMiner process.
  class Process

    # Operators of this process.
    attr_accessor :operators

    def self.parse(element)
      process = WorkflowParser::RapidMiner::Process.new
      process.operators = []

      element.find('operator').each do |operator|
        process.operators.push(WorkflowParser::RapidMiner::Operator.parse(operator))
      end

      process
    end

    def get_components
      element = XML::Node.new("process")

      operators.each do |operator|
        element << operator.get_components
      end

      element
    end

  end
end
end
