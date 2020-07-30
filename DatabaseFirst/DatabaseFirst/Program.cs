using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 
namespace DatabaseFirst
{
    class Program
    {
        static void Main(string[] args)
        {
            var dbContext = new VidzyDbContext();
            dbContext.AddVideo("testing", DateTime.Now,"Horror",(byte)Classification.Platinum);
            dbContext.AddVideo("testing2", DateTime.Now, "Comedy", (byte)Classification.Gold);
            Console.Read();
        }
    }
}
