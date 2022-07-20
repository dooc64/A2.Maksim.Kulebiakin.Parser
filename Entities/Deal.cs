using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Deal : IEquatable<Deal>
    {
        public string SellerName { get; set; }

        public string SellerInn { get; set; }

        public string BuyerName { get; set; }

        public string BuyerInn { get; set; }

        public decimal WoodVolumeBuyer { get; set; }

        public decimal WoodVolumeSeller { get; set; }

        public string DealDate { get; set; }

        public string DealNumber { get; set; }

        public override int GetHashCode()
        {
            return DealNumber.GetHashCode();
        }

        public bool Equals(Deal other)
        {
            return this.DealNumber.Equals(other.DealNumber);
        }
    }
}
