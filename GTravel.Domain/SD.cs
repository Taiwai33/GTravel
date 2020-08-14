using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace GTravel.Domain
{
   public static class SD
    {
        public const string Admin = "Admin";
        public const string Manager  = "Manager";
        public enum States {ACT,NSW, NT,QLD,SA,TAS,VIC,WA}
        public enum TourStatus { Draft = 1, Active = 2, Archived=3 }

    }
}
