using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BaiTH2_asp_
{
    [Serializable]
    public class Student
    {
        public int StudentID { get; set; }

        public string FullName { get; set; }

        public string Email { get; set; }

        public string ImagePath { get; set; }
    }
}