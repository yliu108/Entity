using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Collections.ObjectModel;
namespace CodeFirst
{
    class Program
    {
        public enum Classification
        {
            Silver = 1,
            Gold = 2,
            Platinum = 3
        }
        public class Video
        {
            public int Id {set; get;  }
            public string Name { set; get; }
            public DateTime ReleaseDate { set; get; }
            public Genre Genre { set; get; }
            public Classification Classification { get; set; }

        }
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
