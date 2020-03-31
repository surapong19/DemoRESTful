using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace DemoRESTful
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }

        public List<Customer> GetCustomerList()

        {

            return PopulateCustomerData();

        }

        private List<Customer> PopulateCustomerData()

        {

            List<Customer> lstCustomer = new List<Customer>();

            Customer customer1 = new Customer();

            customer1.CustomerID = 1;

            customer1.FirstName = "John";

            customer1.LastName = "Meaney";

            customer1.Address = "Chicago";

            lstCustomer.Add(customer1);

            Customer customer2 = new Customer();

            customer2.CustomerID = 1;

            customer2.FirstName = "Peter";

            customer2.LastName = "Shaw";

            customer2.Address = "New York";

            lstCustomer.Add(customer2);

            return lstCustomer;

        }

    }
}

