#ifndef STRING_UTILS_HPP
#define STRING_UTILS_HPP

#include <iostream>
#include <sstream>
#include <string>
#include <regex>

namespace utils
{
    std::string LeftTrim(const std::string &str);

    std::string RightTrim(const std::string &str);

    std::string Trim(const std::string &str);

    std::string StrReplace(const std::string &search, const std::string &needle, const std::string &haystack);

    std::vector<std::string> Explode(const char& glue, const std::string& s);

    std::string Implode(const char& glue, std::vector<std::string> array);

    std::string StrToLowerCase(const std::string& input);

    std::string StrToLowerCase(const char* input);

    std::string StrToUpperCase(const std::string& input);

    std::string StrToUpperCase(const char* input);

    std::string Quote(const std::string& input);

    /**
     * Transform any input type into a string
     *
     * @brief AnyToString
     * @param input
     * @return
     */
    template <typename T>
    std::string AnyToString(T input)
    {
        std::stringstream stream;
        stream << input;
        return stream.str();
    };
}

#endif // STRING_UTILS_HPP
