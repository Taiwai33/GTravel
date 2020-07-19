﻿using System;
using System.Collections.Generic;
using System.Text;

namespace GTravel.Domain
{
    public class Attraction
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int CityId { get; set; }
        public City City { get; set; }
        public ICollection<TourAttraction> TourAttractions { get; set; }

    }
}
