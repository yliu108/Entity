using System;
using System.Collections.Generic;
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
        public byte GenreId { get; set; }
        public Classification Classification { get; set; }

    }
}
