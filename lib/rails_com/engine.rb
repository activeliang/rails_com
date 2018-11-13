class RailsCom::Engine < ::Rails::Engine #:nodoc:

  config.generators do |g|
    g.stylesheets false
    g.javasricpts false
    g.javascript_engine false
    g.helper false
    g.jbuilder false
    g.templates.unshift File.expand_path('lib/templates', root)
  end

  initializer 'rails_com.assets.precompile' do |app|
    app.config.assets.precompile += ['rails_com_manifest.js']
    app.config.content_security_policy_nonce_generator = -> request {
      request.headers['X-Csp-Nonce'] || SecureRandom.base64(16)
    }
  end

  initializer 'rails_com.add_assets_templates' do |app|
    app.config.assets.paths.push(*Dir[File.expand_path('lib/nondigest_assets/*', root)])
  end

  initializer 'rails_com.add_activestorage' do |app|
    require 'rails_com/rails_ext/attached_macros'
    ActiveStorage::DiskController.include VideoResponse
    ActiveStorage::Attachment.include AttachmentTransfer
    ActiveStorage::Attached::One.prepend RailsExt::AttachedOne
  end

end
