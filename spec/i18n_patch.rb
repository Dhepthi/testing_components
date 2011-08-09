
# The code below patches I18n to raise exceptions for all errors, including translation errors.
# The default (unpatched) behavior in Rails 2.2.2 rescues translation errors and returns the failed 
# translation keys as a string. This behavior is undesirable in test, because it makes it too
# easy for translation errors to go unnoticed when running automated tests. Instead, we want to fail noisily.
#
# == Usage
# (within test_helper)
# require File.dirname(__FILE__) + '/i18n_patch'      


# Patch translation within views
module ActionView
  module Helpers
    module TranslationHelper
      def translate(key, options = {})
        options[:raise] = true
        I18n.translate(key, options)
      rescue I18n::MissingTranslationData => e
        raise e if RAILS_ENV == 'test'  # <<< this line is the patch. everything else in this method is original.
        keys = I18n.send(:normalize_translation_keys, e.locale, e.key, e.options[:scope])
        content_tag('span', keys.join(', '), :class => 'translation_missing')
      end
      alias :t :translate

      def localize(*args)
        I18n.localize *args
      end
      alias :l :localize
    end
  end
end

# Patch translation in models and controllers
module I18n
  class << self
    def raise_all_exceptions(*args)
      raise args.first
    end
  end
end

I18n.exception_handler = :raise_all_exceptions

