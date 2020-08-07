#The ORDER does total difference, be careful
# std libs
require "file"
require "time"
require "json"

#third libs

#person libs
require "./config_bot/bot_config_read"
require "./config_bot/bot_config_process"
require "./cache_bot/bot_cache"
require "./handle_conversation"

#variables and alias
PHASE = "phase"
UPDATE_TO_PHASE = "updateToPhase"
TEXT_BLOCK = "textBlock"
HELP_TEXT_BLOCK = "helpTextBlock"
ACTION_TEXT_BLOCKS =  "actionTextBlocks"
ACTION_RESULT_BLOCK = "actionResultBlock"
ACTION_COMMAND = "actionCommand"
INTERN_VARIABLES = "internVariables"
PATH_CACHES = ROOT_PATH + "/src/bot/cache_bot/_caches/"
PATH_CONFIG_BOT = ROOT_PATH + "/src/bot/config_bot/_configs/"
TIME_UNIX_CACHED = "timeUnixEpoch"
MAX_MINUTES_CACHE = 1
ROOT_PATH = ((%x(pwd)).match(/.*\b/).try &.[0]).as(String) #The ROOT_PATH will be take from root project when called.

alias AllInt = Int8 | Int16 | Int32 | Int64
alias AllType = Float32 | Float64 | Int16 | Int32 | Int64 | Int8 | String | Nil
alias BlockTypeOne = Hash(String, Array(Hash(String, Int32 | String | Nil)) | Array(String) | Bool | Int32 | String | Nil) | Nil