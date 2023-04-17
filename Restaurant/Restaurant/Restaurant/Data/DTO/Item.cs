using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Data.DTO
{
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public ItemCategory ItemCategory { get; set; }
        public string ItemImagePath
        {
            private set { }
            get
            {
                return App.ItemImagesDir + Path.DirectorySeparatorChar + Id + ".png";
            }
        }

        public override string? ToString()
        {
            return Name;
        }

        public override bool Equals(object? obj)
        {
            return obj is Item item &&
                   Id == item.Id;
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Id);
        }

        protected Item(Item other)
        {
            this.Id = other.Id;
            this.Name = other.Name;
            this.Price = other.Price;
            this.Description = other.Description;
            this.Active = other.Active;
            this.ItemCategory = other.ItemCategory;
            this.ItemImagePath = other.ItemImagePath;
        }

        public Item()
        {

        }


    }
}
