# Removes punctuation marks from a string
def parseString (st):
	s = ''
	for ch in st:
		if (ch >= 'a' and ch <= 'z') or (ch >= "A" and ch<= "Z"):
			s += ch.lower()
		else:
			s += " "
	return s

def main():

	#open files
	in_file = open("Wonderland.txt", "r", encoding="utf8")
	out_file1 = open("allwords.txt", "w")
	out_file2 = open("uniquewords.txt", "w")
	out_file3 = open("wordfrequency.txt", "w")

	unique = []
	word_freq = {}
	word_dict = {}

	for line in in_file:
		line.strip()
		line = parseString(line)
		line = line.split()

		for word in line:
			#writes allwords.txt file
			out_file1.write(word + "\n")

		for word in line:
			if word in unique:
				pass
			else:
				#writes uniquewords.txt file
				out_file2.write(word + "\n")
				unique.append(word)

		for word in line:
			if word in word_freq:
				word_freq[word] = word_freq[word] + 1

			else:
				word_freq[word] = 1

	#proper nouns/capitalization
	capitals = []
	for keys in word_freq.keys():
		if keys[0].isupper():
			capitals.append(keys)

	for val in capitals:
		if val.lower() in word_freq:
			word_freq[val.lower()] += word_freq[val]

		elif val.lower() in word_dict:
			word_freq[val.lower()] = word_freq[val]

	
	for word, val in word_freq.items():
		if val in word_dict:
			word_dict[val]+=1
		else:
			word_dict[val]=1

	for k, v in sorted(word_dict.items()):
		out_file3.write(str(k) + ": " + str(v) + "\n")

	#close files
	in_file.close()
	out_file1.close()
	out_file2.close()
main()
