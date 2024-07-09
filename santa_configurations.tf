resource "zentral_santa_configuration" "default" {
  name           = "🎅 Claus 2"
  client_mode    = "MONITOR"
  enable_bundles = true
}

resource "zentral_santa_enrollment" "default" {
  configuration_id      = zentral_santa_configuration.default.id
  meta_business_unit_id = zentral_meta_business_unit.default.id
}

resource "zentral_santa_rule" "teamid-agilebits" {
  configuration_id  = zentral_santa_configuration.default.id
  policy            = "BLOCKLIST"
  target_type       = "TEAMID"
  target_identifier = "2BUA8C4S2C"
  custom_message    = "No 1Password 4 u"
  description       = "Block AgileBits Software, mostly for demo purposes"
}