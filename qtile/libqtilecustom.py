import os

# qtile arg necessary for Qtile lazy function calls
# if class attributes necessary, learn to do custom Qtile widgets?
#   see https://docs.qtile.org/en/stable/manual/howto/widget.html
#   base namespace is libqtile.widget.base


class ScreenBrightness:
    def value(self, qtile):
        brightness = os.popen(
            "xrandr --verbose | awk '/Brightness/ { print $2; exit }'"
        ).read()
        brightness = float(brightness)
        return brightness

    def set(self, qtile, value):
        os.system(f"xrandr --output eDP --brightness {str(value)}")

    def change(self, qtile, value):
        tgt = self.value(qtile) + value
        if tgt > 1.0:
            tgt = 1.0
        if tgt < 0.0:
            tgt = 0.0
        self.set(qtile, tgt)


class Volume:
    def toggleMute(self, qtile):
        os.system("amixer -q set Master toggle")

    def set(self, qtile, value):
        # no need for bound check with amixer
        tgt = 100 * value  # convert to %
        os.system(f"amixer -q set Master {str(tgt)}%")

    def up(self, qtile, value):
        # no need for bound check with amixer
        tgt = 100 * value  # convert to %
        os.system(f"amixer -q set Master {str(tgt)}%+")

    def down(self, qtile, value):
        # no need for bound check with amixer
        tgt = 100 * value  # convert to %
        os.system(f"amixer -q set Master {str(tgt)}%-")
