/* Description: The user class will follow the singleton pattern.
 * This class will contain the authenticated user's data.
 * 
 * Author: Andres Cornejo
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Muni.Classes
{
    public class LoginUser
    {
        private string username = "";
        private bool isAdmin;

        private static LoginUser instance = new LoginUser();

        public string Username { get => username; set => username = value; }
        public bool IsAdmin { get => isAdmin; set => isAdmin = value; }

        private LoginUser() { }

        public static LoginUser getInstance()
        {
            return instance;
        }

        public void setUser(string _username, bool _isAdmin)
        {
            this.username = _username;
            this.isAdmin = _isAdmin;
        }

        public void logOutUser()
        {
            this.username = "";
            this.isAdmin = false;
        }
        
    }
}