{ ... }:
let
  text_color = "rgba(eae0e4FF)";
  entry_background_color = "rgba(120F1111)";
  entry_border_color = "rgba(9a8d9555)";
  entry_color = "rgba(d1c2cbFF)";

in {
  programs.hyprlock.enable = true;

  programs.hyprlock = {
    backgrounds = [{
      color = "rgba(120F1177)";
      path = "screenshot";
      blur_size = 5;
      blur_passes = 4;
    }];

    input-fields = [{
      size.width = 600;
      size.height = 50;
      outline_thickness = 3;
      dots_size = 0.1;
      dots_spacing = 0.3;
      outer_color = entry_border_color;
      inner_color = entry_background_color;
      font_color = entry_color;
      fade_on_empty = true;

      position.x = 0;
      position.y = 20;

      halign = "center";
      valign = "center";
    }];

    labels = [
      {
        #clock
        text = "$TIME";
        color = text_color;
        font_size = 65;
        position.x = 0;
        position.y = 300;
        halign = "center";
        valign = "center";

      }
      {
        text = "hi $USER";
        color = text_color;
        font_size = 20;
        position.x = 0;
        position.y = 240;
        halign = "center";
        valign = "center";
      }
    ];
  };
}
