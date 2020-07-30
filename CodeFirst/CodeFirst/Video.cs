using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CodeFirst
{
    public class Video
    {
        public int Id { set; get; }
        public string Name { set; get; }
        public DateTime ReleaseDate { set; get; }
        public Genre Genre { set; get; }
        public byte GenreId { set;get;  }
        public Classification Classification { set;get; }
        public ICollection<Tag> Tags { set;get; }

        public Video()
        {
            Tags = new Collection<Tag>();
        }

    }
}
