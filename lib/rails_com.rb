# frozen_string_literal: true

require 'rails_com/version'
require 'rails_com/engine'
require 'rails_com/config'

require 'rails_com/core'
require 'rails_com/action_controller'
require 'rails_com/action_view'
require 'rails_com/active_record'
require 'rails_com/active_storage'

# Meta for Rails
require 'rails_com/meta/routes'
require 'rails_com/meta/models'
require 'rails_com/meta/controllers'
require 'rails_com/meta/env'

# Rails extension
require 'rails_com/generators'
require 'generators/scaffold_generator'
require 'generators/jbuilder_generator' if defined?(Jbuilder)

# controllers
require 'rails_com/sprockets/non_digest_assets'
require 'rails_com/webpacker/yaml_helper'

# Utils
require 'rails_com/utils/time_helper'
require 'rails_com/utils/num_helper'
require 'rails_com/utils/uid_helper'
require 'rails_com/utils/hex_helper'
require 'rails_com/utils/jobber'
require 'rails_com/utils/babel'
require 'rails_com/utils/deploy'
require 'rails_com/utils/qrcode_helper'

# outside
require 'default_where'
require 'default_form'

module ActiveStorageExt
  module Admin

  end
end
