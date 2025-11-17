# locale.nix

Sets locale and language options for the system, including language, region, and character encoding.

## Options Explained

- `i18n.defaultLocale = "en_US.UTF-8";`
  - (Commented) Sets the default locale for the system to American English with UTF-8 encoding.
- `i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "ar_EG.UTF-8/UTF-8" ];`
  - (Commented) Specifies the list of supported locales that will be generated and available on the system.
