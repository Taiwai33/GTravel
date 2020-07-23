using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain.ViewModels
{
   public class TourCreateUpdateViewModel
    {
        public Tour Tour { get; set; }
        public Meal Meals { get; set; }
        public IEnumerable<SelectListItem> SelectListItems { get; set; }

    }
}
