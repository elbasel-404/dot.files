{
  # This option sets the default locale for the system.
  # The locale determines language, character encoding, and cultural conventions (e.g., date/time formatting, number formatting).
  # "en_US.UTF-8" sets the locale to American English with UTF-8 encoding.
  i18n.defaultLocale = "en_US.UTF-8";

  # This option specifies the list of supported locales that will be generated and made available on the system.
  # By including "en_US.UTF-8/UTF-8", you ensure that the American English locale with UTF-8 encoding is supported.
  # The "/UTF-8" part is a specific format requirement for this option.
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ar_EG.UTF-8/UTF-8"
  ];
}
