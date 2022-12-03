static const char norm_fg[] = "#c8c1c0";
static const char norm_bg[] = "#240a05";
static const char norm_border[] = "#5a4743";

static const char sel_fg[] = "#c8c1c0";
static const char sel_bg[] = "#c59506";
static const char sel_border[] = "#c8c1c0";

static const char urg_fg[] = "#c8c1c0";
static const char urg_bg[] = "#b6371c";
static const char urg_border[] = "#b6371c";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
