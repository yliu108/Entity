using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace CodeFirst
{
    public class Tag
    {
        public int Id {  set;get; }
        public string Name {  set;get; }
        public ICollection<Video> Videos {  set;get; }

        public Tag()
        {
            Videos = new Collection<Video>();
        }
    }
}
