using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace CodeFirst
{
    class Program
    {
        public class Video
        {
            public int Id {set; get;  }
            public string Name { set; get; }
            public DateTime ReleaseDate { set; get; }
        }
        public class Genre
        {
            public byte Id { set; get; }
            public string Name { set; get; }
        }

        public class VidzyContext:DbContext
        {
            public DbSet<Video> Videos { set; get; }
            public DbSet<Genre> Genres { set; get; }
            public VidzyContext():base("name=Connection")
            {

            }
        }
        static void Main(string[] args)
        {
        }
    }
}
