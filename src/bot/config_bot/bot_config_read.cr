require "json"

module BotMapped
  class ActionTextBlocks
    include JSON::Serializable

    @[JSON::Field(key: "actionCommand")]
    property actionCommand : String

    @[JSON::Field(key: "updateToPhase")]
    property updateToPhase : Int32
      
    @[JSON::Field(key: "textBlock")]
    property textBlock : String?

    def to_h
      {
        "actionCommand" => @actionCommand,
        "updateToPhase" => @updateToPhase,
        "textBlock" => @textBlock
      }
    end
  end

  class Conversation
    include JSON::Serializable

    @[JSON::Field(key:"phase")]
    property phase : Int32
    
    @[JSON::Field(key: "actionResultBlock")]
    property actionResultBlock : Bool
    
    @[JSON::Field(key: "internVariables")]
    property internVariables : Array(String)?
    
    @[JSON::Field(key: "updateToPhase")]
    property updateToPhase : Int32?

    @[JSON::Field(key: "textBlock")]
    property textBlock : String?
      
    @[JSON::Field(key: "helpTextBlock")]
    property helpTextBlock : String?

    @[JSON::Field(key: "actionTextBlocks")]
    property actionTextBlocks : Array(ActionTextBlocks)?

    def to_h
      {
        "phase" => @phase,
        "actionResultBlock" => @actionResultBlock,
        "internVariables" => @internVariables,
        "updateToPhase" => @updateToPhase,
        "textBlock" => @textBlock,
        "helpTextBlock" => @helpTextBlock,
        "actionTextBlocks" => @actionTextBlocks.nil? ? nil : @actionTextBlocks.not_nil!.map &.to_h
      }
    end    
  end

  class Metadata
    include JSON::Serializable

    @[JSON::Field(key: "maxPhase")]
    property maxPhase : Int32

    def to_h
      {
        "maxPhase" => @maxPhase,
      }
    end
  end

  class Blocks
    include JSON::Serializable

    @[JSON::Field(key: "blocks")]
    property blocks : Array(Conversation)

    @[JSON::Field(key: "metadata")]
    property metadata : Metadata

    def to_h
      {
        "blocks" => @blocks.map &.to_h,
        "metadata" => @metadata.to_h
      }
    end
  end
end