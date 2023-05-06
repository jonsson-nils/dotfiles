require('leap').add_default_mappings()
require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  labeled_modes = "nvo",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}

