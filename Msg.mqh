//+------------------------------------------------------------------+
//|                 EA31337 - multi-strategy advanced trading robot. |
//|                           Copyright 2016, 31337 Investments Ltd. |
//|                                       https://github.com/EA31337 |
//+------------------------------------------------------------------+

/*
    This file is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// Properties.
#property strict

/*
 * Class to provide methods to deal with the messages.
 */
class Msg {
public:

  string last_msg;

    /*
     * Display a text message.
     *
     * @param string text    Text of the message.
     * @param string type    Type of the message.
     * @param string subtype Subtype of the message.
     * @param int    no      Number of the message.
     * @param bool   print   Condition whether to print as a standard message.
     * @param bool   comment Condition whether to print as a comment.
     * @param bool   alert   Condition whether to print as an alert.
     * @param bool   dups    When True, ignore the duplicates.
     *
     * @return
     * Return text if the message is shown, otherwise NULL.
     *
     */
    static string ShowText(
        string text,
        string type = "",
        string subtype = "",
        int no = 0,
        bool print = TRUE,
        bool comment = FALSE,
        bool alert = FALSE,
        bool dups = TRUE,
        string sep = ": "
        ) {

      static string _last_msg;
      bool shown = FALSE;

      string msg = "";

      if (type != "") {
        msg += type;
        if (no > 0) {
          msg += " (" + IntegerToString(no) + ")";
        }
        msg += sep;
      }
      if (subtype != "") {
        msg += subtype + sep;
      }
      msg += text;

      if (msg != _last_msg || !dups) {
        if (print) {
          Print(msg);
          shown = TRUE;
        }
        if (comment) {
          Comment(msg);
          shown = TRUE;
        }
        if (alert) {
          Alert(msg);
          shown = TRUE;
        }
        if (shown) {
          _last_msg = msg;
          return msg;
        }
      }
      return NULL;
    }

};
