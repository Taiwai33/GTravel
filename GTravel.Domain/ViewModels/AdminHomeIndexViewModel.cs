using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain.ViewModels
{
    public class AdminHomeIndexViewModel
    {

        public IEnumerable<Tour> Tours { get; set; }
        public IEnumerable<Order> Orders{ get; set; }
    }
}
