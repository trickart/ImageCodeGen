//
//  Code.swift
//  
//
//  Created by trickart on 2023/03/25.
//

import Foundation

let CodeB: [Character: Int] = [
    " " :   0,
    "!" :   1,
    "\"":   2,
    "#" :   3,
    "$" :   4,
    "%" :   5,
    "&" :   6,
    "'" :   7,
    "(" :   8,
    ")" :   9,
    "*" :  10,
    "+" :  11,
    "," :  12,
    "-" :  13,
    "." :  14,
    "/" :  15,
    "0" :  16,
    "1" :  17,
    "2" :  18,
    "3" :  19,
    "4" :  20,
    "5" :  21,
    "6" :  22,
    "7" :  23,
    "8" :  24,
    "9" :  25,
    ":" :  26,
    ";" :  27,
    "<" :  28,
    "=" :  29,
    ">" :  30,
    "?" :  31,
    "@" :  32,
    "A" :  33,
    "B" :  34,
    "C" :  35,
    "D" :  36,
    "E" :  37,
    "F" :  38,
    "G" :  39,
    "H" :  40,
    "I" :  41,
    "J" :  42,
    "K" :  43,
    "L" :  44,
    "M" :  45,
    "N" :  46,
    "O" :  47,
    "P" :  48,
    "Q" :  49,
    "R" :  50,
    "S" :  51,
    "T" :  52,
    "U" :  53,
    "V" :  54,
    "W" :  55,
    "X" :  56,
    "Y" :  57,
    "Z" :  58,
    "[" :  59,
    "\\":  60,
    "]" :  61,
    "^" :  62,
    "_" :  63,
    "`" :  64,
    "a" :  65,
    "b" :  66,
    "c" :  67,
    "d" :  68,
    "e" :  69,
    "f" :  70,
    "g" :  71,
    "h" :  72,
    "i" :  73,
    "j" :  74,
    "k" :  75,
    "l" :  76,
    "m" :  77,
    "n" :  78,
    "o" :  79,
    "p" :  80,
    "q" :  81,
    "r" :  82,
    "s" :  83,
    "t" :  84,
    "u" :  85,
    "v" :  86,
    "w" :  87,
    "x" :  88,
    "y" :  89,
    "z" :  90,
    "{" :  91,
    "|" :  92,
    "}" :  93,
    "~" :  94,
]

let BitPatterns: [[Bool]] = [
    [true,  true, false,  true,  true, false, false,  true,  true, false, false], //   0
    [true,  true, false, false,  true,  true, false,  true,  true, false, false], //   1
    [true,  true, false, false,  true,  true, false, false,  true,  true, false], //   2
    [true, false, false,  true, false, false,  true,  true, false, false, false], //   3
    [true, false, false,  true, false, false, false,  true,  true, false, false], //   4
    [true, false, false, false,  true, false, false,  true,  true, false, false], //   5
    [true, false, false,  true,  true, false, false,  true, false, false, false], //   6
    [true,  true, false,  true,  true, false, false,  true,  true, false, false], //   7
    [true,  true, false,  true,  true, false, false,  true,  true, false, false], //   8
    [true,  true, false,  true,  true, false, false,  true,  true, false, false], //   9
    [true,  true, false, false,  true, false, false, false,  true, false, false], //  10
    [true,  true, false, false, false,  true, false, false,  true, false, false], //  11
    [true, false,  true,  true, false, false,  true,  true,  true, false, false], //  12
    [true, false, false,  true,  true, false,  true,  true,  true, false, false], //  13
    [true, false, false,  true,  true, false, false,  true,  true,  true, false], //  14
    [true, false,  true,  true,  true, false, false,  true,  true, false, false], //  15
    [true, false, false,  true,  true,  true, false,  true,  true, false, false], //  16
    [true, false, false,  true,  true,  true, false, false,  true,  true, false], //  17
    [true,  true, false, false,  true,  true,  true, false, false,  true, false], //  18
    [true,  true, false, false,  true, false,  true,  true,  true, false, false], //  19
    [true,  true, false, false,  true, false, false,  true,  true,  true, false], //  20
    [true,  true, false,  true,  true,  true, false, false,  true, false, false], //  21
    [true,  true, false, false,  true,  true,  true, false,  true, false, false], //  22
    [true,  true,  true, false,  true,  true, false,  true,  true,  true, false], //  23
    [true,  true,  true, false,  true, false, false,  true,  true, false, false], //  24
    [true,  true,  true, false, false,  true, false,  true,  true, false, false], //  25
    [true,  true,  true, false, false,  true, false, false,  true,  true, false], //  26
    [true,  true,  true, false,  true,  true, false, false,  true, false, false], //  27
    [true,  true,  true, false, false,  true,  true, false,  true, false, false], //  28
    [true,  true,  true, false, false,  true,  true, false, false,  true, false], //  29
    [true,  true, false,  true,  true, false,  true,  true, false, false, false], //  30
    [true,  true, false,  true,  true, false, false, false,  true,  true, false], //  31
    [true,  true, false, false, false,  true,  true, false,  true,  true, false], //  32
    [true, false,  true, false, false, false,  true,  true, false, false, false], //  33
    [true, false, false, false,  true, false,  true,  true, false, false, false], //  34
    [true, false, false, false,  true, false, false, false,  true,  true, false], //  35
    [true, false,  true,  true, false, false, false,  true, false, false, false], //  36
    [true, false, false, false,  true,  true, false,  true, false, false, false], //  37
    [true, false, false, false,  true,  true, false, false, false,  true, false], //  38
    [true,  true, false,  true, false, false, false,  true, false, false, false], //  39
    [true,  true, false, false, false,  true, false,  true, false, false, false], //  40
    [true,  true, false, false, false,  true, false, false, false,  true, false], //  41
    [true, false,  true,  true, false,  true,  true,  true, false, false, false], //  42
    [true, false,  true,  true, false, false, false,  true,  true,  true, false], //  43
    [true, false, false, false,  true,  true, false,  true,  true,  true, false], //  44
    [true, false,  true,  true,  true, false,  true,  true, false, false, false], //  45
    [true, false,  true,  true,  true, false, false, false,  true,  true, false], //  46
    [true, false, false, false,  true,  true,  true, false,  true,  true, false], //  47
    [true,  true,  true, false,  true,  true,  true, false,  true,  true, false], //  48
    [true,  true, false,  true, false, false, false,  true,  true,  true, false], //  49
    [true,  true, false, false, false,  true, false,  true,  true,  true, false], //  50
    [true,  true, false,  true,  true,  true, false,  true, false, false, false], //  51
    [true,  true, false,  true,  true,  true, false, false, false,  true, false], //  52
    [true,  true, false,  true,  true,  true, false,  true,  true,  true, false], //  53
    [true,  true,  true, false,  true, false,  true,  true, false, false, false], //  54
    [true,  true,  true, false,  true, false, false, false,  true,  true, false], //  55
    [true,  true,  true, false, false, false,  true, false,  true,  true, false], //  56
    [true,  true,  true, false,  true,  true, false,  true, false, false, false], //  57
    [true,  true,  true, false,  true,  true, false, false, false,  true, false], //  58
    [true,  true,  true, false, false, false,  true,  true, false,  true, false], //  59
    [true,  true,  true, false,  true,  true,  true,  true, false,  true, false], //  60
    [true,  true, false, false,  true, false, false, false, false,  true, false], //  61
    [true,  true,  true,  true, false, false, false,  true, false,  true, false], //  62
    [true, false,  true, false, false,  true,  true, false, false, false, false], //  63
    [true, false,  true, false, false, false, false,  true,  true, false, false], //  64
    [true, false, false,  true, false,  true,  true, false, false, false, false], //  65
    [true, false, false,  true, false, false, false, false,  true,  true, false], //  66
    [true, false, false, false, false,  true, false,  true,  true, false, false], //  67
    [true, false, false, false, false,  true, false, false,  true,  true, false], //  68
    [true, false,  true,  true, false, false,  true, false, false, false, false], //  69
    [true, false,  true,  true, false, false, false, false,  true, false, false], //  70
    [true, false, false,  true,  true, false,  true, false, false, false, false], //  71
    [true, false, false,  true,  true, false, false, false, false,  true, false], //  72
    [true, false, false, false, false,  true,  true, false,  true, false, false], //  73
    [true, false, false, false, false,  true,  true, false, false,  true, false], //  74
    [true,  true, false, false, false, false,  true, false, false,  true, false], //  75
    [true,  true, false, false,  true, false,  true, false, false, false, false], //  76
    [true,  true,  true,  true, false,  true,  true,  true, false,  true, false], //  77
    [true,  true, false, false, false, false,  true, false,  true, false, false], //  78
    [true, false, false, false,  true,  true,  true,  true, false,  true, false], //  79
    [true, false,  true, false, false,  true,  true,  true,  true, false, false], //  80
    [true, false, false,  true, false,  true,  true,  true,  true, false, false], //  81
    [true, false, false,  true, false, false,  true,  true,  true,  true, false], //  82
    [true, false,  true,  true,  true,  true, false, false,  true, false, false], //  83
    [true, false, false,  true,  true,  true,  true, false,  true, false, false], //  84
    [true, false, false,  true,  true,  true,  true, false, false,  true, false], //  85
    [true,  true,  true,  true, false,  true, false, false,  true, false, false], //  86
    [true,  true,  true,  true, false, false,  true, false,  true, false, false], //  87
    [true,  true,  true,  true, false, false,  true, false, false,  true, false], //  88
    [true,  true, false,  true,  true, false,  true,  true,  true,  true, false], //  89
    [true,  true, false,  true,  true,  true,  true, false,  true,  true, false], //  90
    [true,  true,  true,  true, false,  true,  true, false,  true,  true, false], //  91
    [true, false,  true, false,  true,  true,  true,  true, false, false, false], //  92
    [true, false,  true, false, false, false,  true,  true,  true,  true, false], //  93
    [true, false, false, false,  true, false,  true,  true,  true,  true, false], //  94
    [true, false,  true,  true,  true,  true, false,  true, false, false, false], //  95
    [true, false,  true,  true,  true,  true, false, false, false,  true, false], //  96
    [true,  true,  true,  true, false,  true, false,  true, false, false, false], //  97
    [true,  true,  true,  true, false,  true, false, false, false,  true, false], //  98
    [true, false,  true,  true,  true, false,  true,  true,  true,  true, false], //  99
    [true, false,  true,  true,  true,  true, false,  true,  true,  true, false], // 100
    [true,  true,  true, false,  true, false,  true,  true,  true,  true, false], // 101
    [true,  true,  true,  true, false,  true, false,  true,  true,  true, false], // 102
    [true,  true, false,  true, false, false, false, false,  true, false, false], // 103
    [true,  true, false,  true, false, false,  true, false, false, false, false], // 104
    [true,  true, false,  true, false, false,  true,  true,  true, false, false], // 105
    [true,  true, false, false, false,  true,  true,  true, false,  true, false]  // 106
]
