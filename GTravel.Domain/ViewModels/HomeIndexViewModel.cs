using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain.ViewModels
{
    public class HomeIndexViewModel
    {
        public List<string> States { get; set; } = new List<string>() { "ACT", "NSW", "NT", "QLD", "SA", "TAS", "VIC", "WA" };

        public IEnumerable<Tour> Tours { get; set; }
    }
}
