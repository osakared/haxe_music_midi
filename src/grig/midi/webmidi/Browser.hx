package grig.midi.webmidi;

class Browser
{
    public static var window(get, never):Window;
    extern inline static function get_window() return untyped __js__("window");
}