# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = ["a", "e", "i", "o", "u"]
    result = []
    combined = []

    words.each_with_index do |word|
        result << only_vowels(word)
    end
    
    result.each_with_index do |word, idx1|
        result.each_with_index do |word2, idx2|
            if idx2 > idx1
                r = (word + word2).split("").uniq
                if r.sort == vowels
                    combined << words[idx1] + " " + words[idx2]
                end
            end
        end
    end
    combined
end

def only_vowels(word)
    vowels = "aeiou"
    result = ""
    word.each_char do |char|
        if vowels.include?(char)
            result += char
        end
    end
    result
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).any? {|divisor| num % divisor == 0}
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    result = []
        bigrams.each do |bigram|
            if str.include?(bigram)
                result << bigram
            end
        end
    result
end

# def find_bigrams(str, bigrams)
#     result = []
#     split = str.split(" ")
#     split.each do |word|
#         bigrams.each do |bigram|
#             if word.include?(bigram)
#                 result << bigram
#             end
#         end
#     end
#     result
# end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        if prc == nil
            self.select{|key, value| key == value}
        else
            self.select {|key,value| prc.call(key, value) }
        end
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        result = []
        if length == nil
            self.each_char.with_index do |char, idx1|
                result << char
                self.each_char.with_index do |letter, idx2|
                    if idx2 > idx1
                        result << self[idx1..idx2]
                    end
                end
            end
        else
            self.each_char.with_index do |char, idx1|
                if self[idx1...idx1 + length].length == length
                    result << self[idx1...idx1 + length]
                end
            end
        end
        result
    end

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        result = ""
        self.each_char.with_index do |char|
            oldidx = alphabet.index(char)
            newidx = (oldidx + num)% 26
            result += alphabet[newidx]
        end
        result
    end
end
