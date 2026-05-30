hl.config({
  general = {
    border_size = 2,

    col = {
      -- Gradiente Green → Aqua
      active_border   = { colors = { "rgba(a7c080ff)", "rgba(83c092ff)" }, angle = 45 },
      inactive_border = "rgba(495156aa)",
    },
  },

  decoration = {
    rounding         = 0,
    rounding_power   = 0,

    active_opacity   = 1.0,
    inactive_opacity = 0.90,

    shadow           = {
      enabled      = true,
      range        = 10,
      render_power = 3,
      color        = "rgba(1d2326cc)",
    },

    blur             = {
      enabled  = true,
      size     = 5,
      passes   = 3,
      vibrancy = 0.12,
    },
  },
})

-- Curve definitions
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- Animations (leggermente più morbide, in stile naturale)
hl.animation({ leaf = "global", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 4.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.0, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.8, spring = "easy", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.6, bezier = "linear", style = "popin 85%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.0, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.6, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 2.8, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.8, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.9, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.0, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.4, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.0, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "quick" })
