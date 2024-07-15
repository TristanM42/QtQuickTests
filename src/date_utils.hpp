//
// Copyright (c) - 2023 eMyoSound
//
// Author: Yannick LA ROSA <yann.larosa@emyosound.com>
// created: date
//
// Confidential - All Rights Reserved
//
#ifndef DATE_UTILS_HPP
#define DATE_UTILS_HPP

#include <iostream>
#include <string>
#include "string_utils.hpp"
#include <iomanip>
#include <ctime>
#include <chrono>

namespace utils
{
    class DateTime
    {
    public:
        DateTime();
        virtual ~DateTime();

        std::string ToString();
        std::string ToDateString();
        std::string ToTimeString();
        std::string ToSqlDateTime();

        void SetDate(int year, int month, int day);
        void SetTime(int hour, int minutes, int seconds);
        const int &GetYear();
        const int &GetMonth();
        const int &GetDay();
        const int &GetHours();
        const int &GetMinutes();
        const int &GetSeconds();
        const uint64_t ToTimestamp();

        static DateTime CreateDate(int year, int month, int day, int hours, int minutes, int seconds);
        static DateTime CreateDateFromFormat(std::string &strDate, const std::string &format);
        static DateTime Now();

        static uint64_t GetCurrentTimestamp();

        static long GetDurationSeconds(DateTime from, DateTime to);
        static std::string GetDurationString(DateTime from, DateTime to);

        /**
         * Check if the datetime has been initialized
         *
         * @brief operator bool
         */
        explicit operator bool() const noexcept { return bInitialized; }

        /**
         * Check if date times are identicals
         *
         * @brief operator ==
         * @param other
         * @return
         */
        bool operator==(const DateTime &other) const
        {
            return other.bInitialized == this->bInitialized &&
                   other.nYear == this->nYear &&
                   other.nMonth == this->nMonth &&
                   other.nDay == this->nDay &&
                   other.nHours == this->nHours &&
                   other.nMinutes == this->nMinutes &&
                   other.nSeconds == this->nSeconds;
        }

    private:
        bool bInitialized = false;
        int nDay = 1;
        int nMonth = 1;
        int nYear = 1970;
        int nHours = 0;
        int nMinutes = 0;
        int nSeconds = 0;
    };
}

#endif // DATE_UTILS_HPP
