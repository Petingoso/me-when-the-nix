{ config, pkgs, self, ... }: {
  programs.kitty.enable = true;
  programs.kitty.extraConfig = "include /tmp/themes/kitty/kitty_theme";

  programs.kitty.settings = {
    font_family = "Jetbrains Mono";
    bold_font = "auto";
    italic_font = "auto";

    bold_italic_font = "auto";
    font_size = 16;

    adjust_line_height = 0;

    adjust_column_width = 0;

    disable_ligatures = "always";

    background_opacity = "0.6";

    cursor_shape = "block";

    scrollback_lines = 10000;

    mouse_hide_wait = 3;

    url_style = "double";

    open_url_with = "firefox";

    url_prefixes = "http https file ftp gemini irc gopher mailto news git";

    detect_urls = true;
    # url_excluded_characters 

    select_by_word_characters = "@-./_~?&=%+#";

    focus_follows_mouse = true;

    enable_audio_bell = false;

    remember_window_size = true;

    tab_bar_edge = "top";

    tab_bar_style = "powerline";
    tab_powerline_style = "angled";

    close_on_child_death = true;

    allow_remote_control = true;

    listen_on = "unix:/tmp/kitty";

  };

}
