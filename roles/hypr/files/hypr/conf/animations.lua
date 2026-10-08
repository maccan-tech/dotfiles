------------------------------
-- Animations
------------------------------

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("myBezier",     { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("easeOutQuint", { type = "bezier", points = { {0.22, 1},   {0.36, 1}   } })

hl.animation({ leaf = "windows",    enabled = true, speed = 1, bezier = "myBezier",     style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default",      style = "popin 80%" })
hl.animation({ leaf = "border",     enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "fade",       enabled = true, speed = 1, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slide" })
