package grig.midi;

import tink.core.Future;

#if (cpp && !DISABLE_RTMIDI)
typedef MidiIn = grig.midi.cpp.rtmidi.MidiIn;
#elseif ((nodejs || python) && !DISABLE_RTMIDI)
typedef MidiIn = grig.midi.rtmidi.MidiIn;
#elseif (js && !DISABLE_RTMIDI)
typedef MidiIn = grig.midi.webmidi.MidiIn;
#else

/**
 * Generic midi in interface that abstracts over different apis depending on the target.
 * See [grig's website](https://grig.tech/midi-connection/) for a tutorial on basic use.
 */
extern class MidiIn implements MidiReceiver
{
    public function new(api:grig.midi.Api);
    public static function getApis():Array<grig.midi.Api>;
    public function getPorts():Surprise<Array<String>, tink.core.Error>;
    public function openPort(portNumber:Int, portName:String):Surprise<MidiIn, tink.core.Error>;
    public function openVirtualPort(portName:String):Surprise<MidiIn, tink.core.Error>;
    public function closePort():Void;
    public function isPortOpen():Bool;
    public function setCallback(callback:(MidiMessage, Float)->Void):Void;
    public function cancelCallback():Void;
}

#end
