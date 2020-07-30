using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
namespace CodeFirst
{
    public class VidzyContext : DbContext
    {
        public DbSet<Video> Videos { set; get; }
        public DbSet<Genre> Genres { set; get; }
        public VidzyContext() : base("name=Connection")
        {

        }
    }
}
