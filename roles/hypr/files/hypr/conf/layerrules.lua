------------------------------
-- Layer rules
------------------------------

-- Layers are surfaces like bars, menus and notifications. Their namespaces
-- can be listed with `hyprctl layers`.

-- slurp's region selection (hyprshot): no fade, so its border does not
-- flash or end up in the screenshot
hl.layer_rule({ name = "selection-no-anim", match = { namespace = "^(selection)$" }, no_anim = true })

-- rofi menus pop in and dim what is behind them
hl.layer_rule({ name = "rofi-dim", match = { namespace = "^(rofi)$" }, dim_around = true })
hl.layer_rule({ name = "rofi-popin", match = { namespace = "^(rofi)$" }, animation = "popin" })

-- Blur behind the logout menu and the notification center. ignore_alpha
-- leaves the fully transparent parts of the surface unblurred.
hl.layer_rule({ name = "wlogout-blur", match = { namespace = "^(logout_dialog)$" }, blur = true })
hl.layer_rule({ name = "swaync-blur", match = { namespace = "^(swaync-control-center)$" }, blur = true, ignore_alpha = 0.5 })
