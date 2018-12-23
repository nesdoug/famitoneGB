# python 3 file, to fix frequencies produced by
# famitracker to nsf to nsf2dataGB, as GB
# frequency data are different than NES
#  these are for sound effects for famitone2
# (gameboy port) for game development

# usage, make sound effects in famitracker, each
# effect a unique song. Export nsf file.
# Convert to asm with nsf2dataGB
# in command prompt, type nsf_fix.py file.asm
# where file.asm is the filename
# Alternatively, you could drag the .asm file to nsf_fix.py
# but you won't get to read the error messages.

# should output a similar asm file with "f" appended the title
# f for fixed frequencies finally for you

# NOTE, channel 3 is not supported. If detected, this will
# immediatly end processing that sfx and insert a zero, and
# then skip to the next sound effect.


# note range allowed, c-1 to b-6




import sys
import os

col = 0

def NibbleToInt(nibble):
	if (nibble == "0"):
		return 0
	elif (nibble == "1"):
		return 1
	elif (nibble == "2"):
		return 2	
	elif (nibble == "3"):
		return 3	
	elif (nibble == "4"):
		return 4
	elif (nibble == "5"):
		return 5
	elif (nibble == "6"):
		return 6	
	elif (nibble == "7"):
		return 7
	elif (nibble == "8"):
		return 8
	elif (nibble == "9"):
		return 9
	elif (nibble == "a"):
		return 10	
	elif (nibble == "b"):
		return 11
	elif (nibble == "c"):
		return 12
	elif (nibble == "d"):
		return 13
	elif (nibble == "e"):
		return 14	
	elif (nibble == "f"):
		return 15
	else:
		return 0 # ?? error
		
		
# I picked a range for each note
# to account for possible off by 1 errors		
def ToGB(local_high, local_low): #2 ints
	if (local_high > 6):
		return "02c"	# c-1
		
	elif (local_high == 6):
		if (local_low > 125): # c-1
			return "02c"
		elif (local_low > 32):
			return "09c"
		else:	
			return "106"
			
	elif (local_high == 5):		
		if (local_low > 200):	
			return "106"
		elif (local_low > 117):
			return "16b"
		elif (local_low > 38):
			return "1c9"
		else:	
			return "223"	
			
	elif (local_high == 4):
		if (local_low > 220):	
			return "223"
		elif (local_low > 150):
			return "277"
		elif (local_low > 84):
			return "2c6"
		elif (local_low > 22):
			return "312"
		else:	
			return "356"
			
	elif (local_high == 3):	
		if (local_low > 219):	
			return "356"
		elif (local_low > 164):
			return "39b"
		elif (local_low > 112):
			return "3da"
		elif (local_low > 62): # c-2
			return "416"
		elif (local_low > 16):
			return "44e"
		else:	
			return "483"
			
	elif (local_high == 2):	
		if (local_low > 228):	
			return "483"
		elif (local_low > 186):
			return "4b5"
		elif (local_low > 147):
			return "4e5"
		elif (local_low > 110):
			return "511"
		elif (local_low > 75):
			return "53b"
		elif (local_low > 42):
			return "563"
		elif (local_low > 11):
			return "589"	
		else:	
			return "5ac"
			
	elif (local_high == 1):	
		if (local_low > 237):	
			return "5ac"
		elif (local_low > 210):
			return "5ce"
		elif (local_low > 184):  
			return "5ed"
		elif (local_low > 159):  # c-3
			return "60a"
		elif (local_low > 136):
			return "627"
		elif (local_low > 114):
			return "642"
		elif (local_low > 93):
			return "65b"	
		elif (local_low > 73):
			return "672"
		elif (local_low > 54):
			return "689"
		elif (local_low > 37):
			return "69e"
		elif (local_low > 20):
			return "6b2"
		elif (local_low > 5):
			return "6c4"
		else:	
			return "6d6"
			
	elif (local_high == 0):
		if (local_low > 246):	
			return "6d6"
		elif (local_low > 232):
			return "6e7"
		elif (local_low > 219):  
			return "6f7"
		elif (local_low > 207):  # c-4
			return "706"
		elif (local_low > 195):
			return "714"
		elif (local_low > 184):
			return "721"
		elif (local_low > 174):
			return "72d"	
		elif (local_low > 164):
			return "739"
		elif (local_low > 155):
			return "744"
		elif (local_low > 146):
			return "74f"
		elif (local_low > 138):
			return "759"
		elif (local_low > 130):
			return "762"
		elif (local_low > 122):
			return "76b"
		elif (local_low > 116):
			return "773"
		elif (local_low > 109): 
			return "77b"
		elif (local_low > 103): # c-5
			return "783"
		elif (local_low > 97):
			return "78a"
		elif (local_low > 92):
			return "790"
		elif (local_low > 87):
			return "797"
		elif (local_low > 82):
			return "79d"
		elif (local_low > 77):
			return "7a2"
		elif (local_low > 72):
			return "7a7"
		elif (local_low > 68):
			return "7ac"
		elif (local_low > 65):
			return "7b1"
		elif (local_low > 62):
			return "7b6"
		elif (local_low > 58):
			return "7ba"
		elif (local_low > 54):
			return "7be"
		elif (local_low > 51): # c-6
			return "7c1"
		elif (local_low > 48):
			return "7c4"
		elif (local_low > 45):
			return "7c8"
		elif (local_low > 42):
			return "7cb"
		elif (local_low > 40):
			return "7ce"
		elif (local_low > 38):
			return "7d1"
		elif (local_low > 36):
			return "7d4"
		elif (local_low > 34):
			return "7d6"
		elif (local_low > 32):
			return "7d9"
		elif (local_low > 30):
			return "7db"
		elif (local_low > 28):
			return "7dd"
		elif (local_low > 26): # b-6 max
			return "7df"
		else:	
			return "7df"		# can't quite play the c-7 ?
	
	return "02c" # default is low c-1
	
	
def CommonPrint():
	global col
	global col_count
	global col_error
	
	if (col == 0):
		newfile.write("$")
	elif (col >= 16):
		newfile.write("\n\tdb ")
		col = 0
		newfile.write("$")
		col_count = col_count + 1
		if (col_count >= 16):
			print("Error. Over 256 bytes. Don't use this.")
			col_error = 1
	else:
		newfile.write(",$")

	
filename = sys.argv[1]
newname = filename[0:-4] + "F.asm"

oldfile = open(filename, 'r')	
newfile = open(newname, 'w')
# warning, this may overwrite file

testarray = [";", "T", "h", "i", "s"]
a = ""
error = 0

newfile.write(";")	# make sure we won't be processing a file twice
					# by inserting an extra ; at beginning
oldfile.seek(0)
for i in range (0,5):	# test at least a few characters to expected value
	a = oldfile.read(1)
	if (a == testarray[i]):
		newfile.write(a)
	else:
		exit("Aborted. Probably not the right file.")

		
# continue writing till see 2 colons
count = 0
for i in range (0,10000):
	a = oldfile.read(1)
	newfile.write(a)
	if (a==":"):
		count = count + 1
		if (count > 1):
			break
			
# convert all bytes into integer list, stop when see : or eof

list_int = []

nibble_high = 0
nibble_low = 0
nibble_both = 0
size = 0
col = 0
col_count = 0 # inc every reset of col = 16, if >= 16 too many bytes
col_error = 0
str1 = ""
k = 0 # a little offset from j
str2 = ""

low_i_P1 = 0	# upper byte, integer
high_i_P1 = 0	# lower byte, integer
high_i_old_P1 = 0
gb_low1 = "" # converted values
gb_low2 = ""
gb_high_P1 = ""
gb_high_old_P1 = "X" # X is an unexpected value, so first round triggers

low_i_P2 = 0	# upper byte, integer
high_i_P2 = 0	# lower byte, integer
high_i_old_P2 = 0
# just use gb_low1, gb_low2 for P2
gb_high_P2 = ""
gb_high_old_P2 = "X" # X is an unexpected value, so first round triggers

newfile.write("\n")

for i in range (0,256):
		
	for j in range (0,10000):
		a = oldfile.read(1)
		if (a == ""):
			break
		if (a == ":"):
			break
		if (a == "$"):
			a = oldfile.read(1)
			nibble_high = NibbleToInt(a)
			a = oldfile.read(1)
			nibble_low = NibbleToInt(a)
			nibble_both = (nibble_high * 16) + nibble_low
			list_int.append(nibble_both)

	# process list and print it
	newfile.write("\tdb ")
	size = len(list_int)
	if (size == 0):
		break
	j = 0
	while (j < size):
	#for j in range (0, size):
		CommonPrint()
		if (list_int[j] >= 128):
			# test, just emit 1 bytes - CHANGE
			if (list_int[j] == 129): #81 = P1 low
				# check if there is a high byte 2 over
				k = j + 2
				if (k < size): # error check, not past end of array
					if (list_int[k] == 130): # yes. 82 = P1 high
						low_i_P1 = list_int[j+1]
						high_i_P1 = list_int[j+3]
						str2 = ToGB(high_i_P1, low_i_P1)
						j = j + 3
					else: # no, just low byte
						low_i_P1 = list_int[j+1]
						high_i_P1 = high_i_old_P1
						str2 = ToGB(high_i_P1, low_i_P1)
						j = j + 1
					# common to both
					high_i_old_P1 = high_i_P1
					gb_high_P1 = str2[0]
					gb_low1 = str2[1]
					gb_low2 = str2[2]
					newfile.write("81")
					col = col + 1
					CommonPrint()
					newfile.write(gb_low1)
					newfile.write(gb_low2)
					col = col + 1
					if (gb_high_P1 != gb_high_old_P1): # don't need to print new high
						CommonPrint()
						gb_high_old_P1 = gb_high_P1
						newfile.write("82")
						col = col + 1
						CommonPrint()
						newfile.write("0")
						newfile.write(gb_high_P1)
						col = col + 1
						
			elif (list_int[j] == 132): #84 = P2 low
				# check if there is a high byte 2 over
				k = j + 2
				if (k < size): # error check, not past end of array
					if (list_int[k] == 133): # yes. 85 = P2 high
						low_i_P2 = list_int[j+1]
						high_i_P2 = list_int[j+3]
						str2 = ToGB(high_i_P2, low_i_P2)
						j = j + 3
					else: # no, just low byte
						low_i_P2 = list_int[j+1]
						high_i_P2 = high_i_old_P2
						str2 = ToGB(high_i_P2, low_i_P2)
						j = j + 1
					# common to both
					high_i_old_P2 = high_i_P2
					gb_high_P2 = str2[0]
					gb_low1 = str2[1]
					gb_low2 = str2[2]
					newfile.write("84")
					col = col + 1
					CommonPrint()
					newfile.write(gb_low1)
					newfile.write(gb_low2)
					col = col + 1
					if (gb_high_P2 != gb_high_old_P2): # don't need to print new high
						CommonPrint()
						gb_high_old_P2 = gb_high_P2
						newfile.write("85")
						col = col + 1
						CommonPrint()
						newfile.write("0")
						newfile.write(gb_high_P2)
						col = col + 1
						
			elif (list_int[j] == 134) or (list_int[j] == 135) or (list_int[j] == 136): # channel 3 error
				newfile.write("00") # just end the effect now, emit error message.
				newfile.write("\n; Error: Channel 3 is not supported.\n")
				error = 1
				break
				
			else: #byte >= $80
				m = format(list_int[j], 'x')
				str1 = str(m)
				newfile.write(str1)
				col = col + 1

		else: # just emit byte and continue
			if (list_int[j] < 16):
				newfile.write("0")
			
			str1 = format(list_int[j], 'x')
			newfile.write(str1)
			
			col = col + 1
		j = j + 1	

	if (a == ""): # eof
		break
	list_int.clear()
	col = 0				# zero all the variables before each effect
	col_count = 0
	high_i_old_P1 = 0
	gb_high_old_P1 = "X"
	high_i_old_P2 = 0
	gb_high_old_P2 = "X"
	
	newfile.write("\n.sfx_gb_")
	newfile.write(str(i+1))
	newfile.write(":\n")
	
		


newfile.write("\n")
if (col_error == 1):
	newfile.write("\n\n; Error: Over 256 bytes. Don't use this.")
		
if (error == 1):
	print("Error: Channel 3 is not supported.")
print("Done.")
oldfile.close
newfile.close


#80 = 128,P1 vol
#81 = 129,P1 low
#82 = 130,P1 high (always follows low)
#83 = 131,P2 vol
#84 = 132,P2 low
#85 = 133,P2 high (always follows low)
#86 = 134,ch3 vol
#87 = 135,ch3 low
#88 = 136,ch3 high (always follows low)
#89 = 137,noise vol
#8a = 139,noise freq



