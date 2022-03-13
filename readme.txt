update - 3/11/2022
-now compatible with 0cc-Famitracker and Dn-Famitracker
-fixed a bug in text2dataGB (undefined behavior) 
 that might have caused incorrect output
 

FamiTone2 audio library v1.15 by Shiru 04'17
Game boy port v1.1, 2019, Doug Fraker



Except for channel 5, this library should run nearly identical to the NES version. 
You will write the songs (all songs in 1 file) with Famitracker, using only the 
first 4 channels. Don't add any DPCM samples or notes. (text2dataGB should just ignore 
anything in that channel anyway) Export a text file.

text2dataGB.exe - converts the text file to asm, for import into rgbds. The data is 
the same as the NES version, but the header pointers are 4 channels, and db and dw 
have no dots. This and nsf2dataGB.exe are command line programs, run in the command 
prompt like this...

>text2dataGB.exe songname.txt

Sound effects should be written in another Famitracker file (all sfx in 1 file, 
each as a new song, each ending in C00). Use only Pulse 1 and 2 and Noise channels. 
Currently the triangle channel is not supported*. Export as nsf.

*The reason I didn't include triangle channel support, yet, is that I didn't want to 
modify the existing Famitone2 library very much, and if you loaded a different wave 
table for the sfx, I would need to save the song wave table, and reload it when the 
sound effect was finished. And, I haven't come up with a good way to let the famitone 
library manage wave tables. Maybe in the future this will be possible. Currently, if
nsf_fix.py detects something in the triangle channel, it will immediately end that
effect, insert a zero, and move on to the next (see soundsF.asm).

nsf2dataGB.exe - converts the nsf file to asm, for import into rgbds. The data is the 
same as the NES version (NTSC), but the header has been changed, and the db and dw 
have no dots. 

Unfortunately, the frequency values differ greatly between NES and GB. So, convert the 
!! asm file produced by nsf2dataGB.exe !! with...

nsf_fix.py - this is a python 3 script. It requires that you have python 3 installed 
on your machine. It outputs another asm file with an F inserted in the title. This is 
the final asm file to import into rgbds.




Important notes, same as the original famitone2

- Allowed notes are C-1..D-6, Note Cut (rest note)
- Only Volume, Arpeggio, and Pitch sequences (no Pitch for noise
  channel) supported
- All instruments should have a volume envelope assigned
- Only the loop part of sequence is supported, release part is not supported
- Pitch envelope accumulate the offset at conversion time only, thus
  it can't go further -64 to +63, and can't accumulate the offset with loop
- Only first step of Duty envelope for pulse and noise channels is used,
  there is no Duty sequence
- 64 instruments max
- No volume column support
- Tempo is set with the global setting, speed can be changed with effect
  Fxx (1..21)
- Bxx effect for looping without an intro, does not support forward
  references
- D00 effect to cut patterns early
- No effects other than listed above are supported
- Up to 17 sub songs in a file, they will share instruments and pattern
  data


- sfx can only be max 255 bytes per effect, which is rather short 
  (reducing the volume changes will make the data smaller)


ALSO NOTE - arpeggio envelope set to absolute only 
  (this is true of all famitone versions)

  
  

Notable differences.

- I have added the optional switches -Wno (suppresses warnings about 
  unsupported effects) and -allin (prevents removal of unused instruments) 
  to text2dataGB.exe.
- I have removed the -nesasm, -asm6, and -ca65 switches from text2dataGB.exe 
  and nsf2dataGB.exe
- You might notice differences in the pitch envelopes due to differences 
  between the 2 systems
- Sound effects currently don't allow fine pitch adjustments. I couldn't think 
  of a clever formula to convert the NES value to GB value, so I handled each 
  note with a large if/elif tree (see nsf_fix.py) rather than math, but that 
  destroys fine adjustments in pitch, only allowing exact chromatic scale notes 
  to output.
- removed all but 1 sfx channel. And changed the way it works. Now, each call to
  FamiToneSfxPlay stores the value to a temp variable, which isn't read till the
  FamiToneUpdate call. Why? If 10+ sfx calls are done in the same frame, they 
  would waste a lot of CPU time clearing values and reloading pointers, so this 
  would use less CPU, but note, only the last sfx called in that frame will play.
- removed all but 1 famitone constant... the base address, which will probably 
  have to be adjusted for each project, is at the top of famitoneGB.asm 
  FT_BASE_ADR = $CE00
  
  


How to use, in rgbds...

At startup, load hl with the address of the song data, and call FamiToneInit.

After that, to load a wave table, load hl with the address of the wave data 
(16 bytes) and call LoadWave.

At startup, load hl with the address of the sfx data, and call FamiToneSfxInit.

To play a song, load A with the # of the song (starting with 0), and call 
FamiToneMusicPlay.

To pause a song, load A with 1 and call FamiToneMusicPause. To unpause, load A 
with 0 and call FamiToneMusicPause.

To stop the song, call FamiToneMusicStop

To play a sfx, load A with the # of the sfx (starting with 0), and call 
FamiToneSfxPlay. There is now only 1 sfx channel, so only 1 sfx can play at a time.

You can stop sfx by calling FT2SfxClearChannel.

Once per frame, call FamiToneUpdate.




CPU usage
-21 vertical lines of 153 or 7% of the frame.

ROM Space
-$732 aka 1842 bytes

RAM usage
-141 bytes of standard RAM




Be sure to include famitoneGB.asm in the main asm file, and also hardware.inc, 
which is a common gameboy programming definition file containing some standard 
register names. The hardware.inc should be included above famitoneGB.asm.




Sound Quality

This works in "zombie mode". That is when the volume envelope is set to a constant 
(low nibble 8), writing another constant value to rNRx2 increases the volume of the 
channel by 1, wrapping around past 15 back to 0. When volume envelopes rise, this is 
a smooth transition for zombie mode. When volume envelopes fall, it has to write 15 
times in a row to notch down 1 step, which adds some clickiness to the sound, 
especially at a low volume. So a volume envelope that does this...

15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0

Will sound crackly. The lower the volume the more noticeable the click. Like 
crumpling a potato chip bag. Each step down will have a chance to click.

I find that at volume 5 or lower, if you flatten the envelope as much as possible 
to eliminate steps down, it greatly improves the sound. Like...

15 14 13 12 11 10 9 8 7 6 5 5 5 2 2 2 0

...will reduce the possible clicks. Notice the 3 in a row. 3 in a row seems to be 
a minimum for reducing the likelihood of a click to barely noticeable. 

After experimenting, I decided just to do a new trigger, rather than 15 writes to 
rNRx2, for very low volume and decreasing. It seems less clicky. But, my "flatten 
the envelope" advice still applies.



The Wave Channel doesn't have zombie mode, but it has a very lousy volume 
control, and each step down will be noticeable. This envelope...

15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 

is really this...

15 15 15 15 15 8 8 8 8 8 4 4 4 4 4 0

and it might sound weird, and it also might click on that transition from full to 
half volume. So you might want to just give it a constant volume, like the NES 
triangle channel.

15

or

8



Has been tested on Original Gameboy (DMG-01), Color Gameboy (CGB-001), Super Gameboy, 
and emulators BGB and Nostalgia.GBC (android).




