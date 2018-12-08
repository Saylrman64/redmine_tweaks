# Redmine Tweaks plugin for Redmine
# Copyright (C) 2013-2017 AlphaNodes GmbH

if ActiveRecord::Base.connection.table_exists?(:settings)
  Rails.configuration.to_prepare do
    # Patches
    require_dependency 'redmine_tweaks/patches/custom_help_url'
    require_dependency 'redmine_tweaks/patches/issue_patch'
    require_dependency 'redmine_tweaks/patches/time_entry_patch'
    require_dependency 'redmine_tweaks/patches/wiki_patch'
    require_dependency 'redmine_tweaks/patches/wiki_controller_patch'
    require_dependency 'redmine_tweaks/patches/wiki_pdf_helper_patch'

    Rails.configuration.assets.paths << Emoji.images_path
    # Send Emoji Patches to all wiki formatters available to be able to switch formatter without app restart
    Redmine::WikiFormatting.format_names.each do |format|
      case format
      when 'markdown'
        require_dependency 'redmine_tweaks/patches/formatter_markdown_patch'
      when 'textile'
        require_dependency 'redmine_tweaks/patches/formatter_textile_patch'
      end
    end

    # Global helpers for Tweaks
    require_dependency 'redmine_tweaks/helpers'

    # Hooks
    require_dependency 'redmine_tweaks/hooks'

    # Wiki macros
    require_dependency 'redmine_tweaks/wiki_macros/calendar'
    require_dependency 'redmine_tweaks/wiki_macros/cryptocompare'
    require_dependency 'redmine_tweaks/wiki_macros/date'
    require_dependency 'redmine_tweaks/wiki_macros/gist'
    require_dependency 'redmine_tweaks/wiki_macros/issue_macro'
    require_dependency 'redmine_tweaks/wiki_macros/last_updated_at'
    require_dependency 'redmine_tweaks/wiki_macros/last_updated_by'
    require_dependency 'redmine_tweaks/wiki_macros/member_macro'
    require_dependency 'redmine_tweaks/wiki_macros/project_macro'
    require_dependency 'redmine_tweaks/wiki_macros/recently_updated'
    require_dependency 'redmine_tweaks/wiki_macros/reddit'
    require_dependency 'redmine_tweaks/wiki_macros/slideshare'
    require_dependency 'redmine_tweaks/wiki_macros/tradingview'
    require_dependency 'redmine_tweaks/wiki_macros/twitter'
    require_dependency 'redmine_tweaks/wiki_macros/user_macro'
    require_dependency 'redmine_tweaks/wiki_macros/vimeo'
    require_dependency 'redmine_tweaks/wiki_macros/youtube'

    module RedmineTweaks
      def self.settings
        Setting[:plugin_redmine_tweaks].blank? ? {} : Setting[:plugin_redmine_tweaks]
      end
    end

    unless RedmineTweaks.settings[:remove_help]
      Redmine::Plugin.find('redmine_tweaks')
                     .menu :top_menu,
                           :help,
                           RedmineTweaks::Patches::CustomHelpUrl::Redmine::Info.help_url,
                           html: { target: '_blank' },
                           last: true
    end
  end

  # include deface overwrites
  Rails.application.paths['app/overrides'] ||= []
  Dir.glob("#{Rails.root}/plugins/*/app/overrides").each do |dir|
    Rails.application.paths["app/overrides"] << dir unless Rails.application.paths["app/overrides"].include?(dir)
  end
end
