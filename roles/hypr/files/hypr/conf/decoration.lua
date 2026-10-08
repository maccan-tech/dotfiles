------------------------------
-- General window decoration
------------------------------

hl.config({
    decoration = {
        -- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
        active_opacity   = 1,
        inactive_opacity = 0.85,

        rounding = 5,

        blur = {
            enabled           = true,
            size              = 3,
            passes            = 3,
            new_optimizations = true,
            ignore_opacity    = true,
        },
    },
})
