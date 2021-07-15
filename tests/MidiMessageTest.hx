package;

import grig.midi.ControlChangeType;
import grig.midi.MessageType;
import grig.midi.MidiMessage;
import tink.unit.Assert.*;

@:asserts
class MidiMessageTest
{
    private var midiMessage:MidiMessage;

    public function new()
    {
        midiMessage = MidiMessage.ofArray([0x81, 0x30, 0x50]);
    }

    public function testBytes()
    {
        asserts.assert(midiMessage.byte1 == 0x81);
        asserts.assert(midiMessage.byte2 == 0x30);
        asserts.assert(midiMessage.byte3 == 0x50);
        asserts.assert(midiMessage.pitch == grig.pitch.Pitch.fromNote(C, 4));
        return asserts.done();
    }

    public function testChannel()
    {
        return assert(midiMessage.channel == 1);
    }

    public function testType()
    {
        return assert(midiMessage.messageType == NoteOff);
    }

    public function testControlChangeType()
    {
        var controlChangeMessage = MidiMessage.ofArray([177, 64, 127]);
        return assert(controlChangeMessage.controlChangeType == ControlChangeType.Sustain);
    }

}
