using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Employee
    {
        public int Id { get; set; }
        public string Role { get; set; }
        public string Name { get; set; }
        public string Lastname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string PlaceOfResidence { get; set; }
        public int SelectedTheme { get; set; }

        public override string ToString()
        {
            return Id + " " + Role + " " + Name + " " + Lastname + " " + PhoneNumber + " " + PlaceOfResidence;
        }
    }
}
