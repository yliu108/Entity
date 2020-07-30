using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
namespace CodeFirst
{
    public class Genre
    {
        public byte Id { set; get; }
        public string Name { set; get; }
        public ICollection<Video> Videos { get; set; }
        public Genre()
        {
            Videos = new Collection<Video>();
        }
    }
}
