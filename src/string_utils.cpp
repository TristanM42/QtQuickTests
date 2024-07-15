#include "string_utils.hpp"

//
// Copyright (c) - 2023 eMyoSound
//
// Author: Yannick LA ROSA <yann.larosa@emyosound.com>
// created: date
//
// Confidential - All Rights Reserved
//

/**
 * Remove blank spaces at the left side of a given string
 *
 * @brief ltrim
 * @param str
 * @return
 */
std::string utils::LeftTrim(const std::string &str)
{
    return std::regex_replace(str, std::regex("^\\s+"), std::string(""));
}

/**
 * Remove blank spaces at the right side of a given string
 *
 * @brief RightTrim
 * @param str
 * @return
 */
std::string utils::RightTrim(const std::string &str)
{
    return std::regex_replace(str, std::regex("\\s+$"), std::string(""));
}

/**
 * Remove blank spaces at both sides of a given string
 *
 * @brief Trim
 * @param str
 * @return
 */
std::string utils::Trim(const std::string &str)
{
    return utils::LeftTrim(utils::RightTrim(str));
}

/**
 * Search and replace part of a given string
 *
 * @brief StrReplace
 * @param search
 * @param needle
 * @param haystack
 * @return
 */
std::string utils::StrReplace(const std::string &search, const std::string &needle, const std::string &haystack)
{
    return std::regex_replace(haystack, std::regex(search), needle);
}

/**
 * Transform a string into an aray of strings
 *
 * @brief Explode
 * @param glue      Character used to split input string
 * @param s         Input string
 * @return
 */
std::vector<std::string> utils::Explode(const char& glue, const std::string& s)
{
    std::string buff{""};
    std::vector<std::string> v;

    for(auto n:s)
    {
        if(n != glue)
        {
            buff+=n;
        }
        else if(n == glue)
        {
            v.push_back(buff); buff = "";
        }
    }

    v.push_back(buff);

    return v;
}

/**
 * Transform an array of strings into a single string
 *
 * @brief Implode
 * @param glue          Character(s) used to glue strings together
 * @param array         Array of strings
 * @return
 */
std::string utils::Implode(const char& glue, std::vector<std::string> array)
{
    std::string output{""};

    std::vector<std::string>::iterator it;
    for (it = array.begin(); it < array.end()-1; it++) {
        output += (*it);
        output += glue;
    }

    output += (*it);

    return output;
}

/**
 * Lower case all items from a given string
 *
 * @brief StrToLowerCase
 * @param input
 * @return
 */
std::string utils::StrToLowerCase(const std::string& input)
{
    std::string data{input};
    std::transform(data.begin(), data.end(), data.begin(),
                   [](unsigned char c){ return std::tolower(c); });
    return data;
}

/**
 * Lower case all items from a given string
 *
 * @brief StrToLowerCase
 * @param input
 * @return
 */
std::string utils::StrToLowerCase(const char* input)
{
    std::string data{input};
    return utils::StrToLowerCase(data);
}

/**
 * Upper case all items from a given string
 *
 * @brief StrToUpperCase
 * @param input
 * @return
 */
std::string utils::StrToUpperCase(const std::string& input)
{
    std::string data{input};
    std::transform(data.begin(), data.end(), data.begin(),
                   [](unsigned char c){ return std::toupper(c); });
    return data;
}

/**
 * Upper case all items from a given string
 *
 * @brief StrToUpperCase
 * @param input
 * @return
 */
std::string utils::StrToUpperCase(const char* input)
{
    std::string data{input};
    return utils::StrToUpperCase(data);
}

/**
 * Add double quote to a given string
 *
 * @brief Quote
 * @param input
 * @return
 */
std::string utils::Quote(const std::string& input)
{
    return "\"" + input + "\"";
}
