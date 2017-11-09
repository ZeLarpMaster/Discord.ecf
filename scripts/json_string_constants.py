#!/usr/bin/env python3

import pyperclip

def main(strings):
	format_string = "\n\n\tjson_string_{0}: JSON_STRING\n\t\t\t-- {{JSON_STRING}} of \"{0}\"\n\t\tonce(\"PROCESS\")\n\t\t\tcreate Result.make_from_string_general(\"{0}\")\n\t\tend"
	pyperclip.copy("".join(format_string.format(s) for s in strings))

if __name__ == "__main__":
	strings = input("Enter a comma (,) separated list of JSON_STRING constants: ")
	main(strings.split(","))