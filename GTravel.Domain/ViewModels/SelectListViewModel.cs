using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain.ViewModels
{
   public class SelectListViewModel<T> where T : class
    {
        public T Entity { get; set; }
        public IEnumerable<SelectListItem> SelectListItems { get; set; }
    }
}
