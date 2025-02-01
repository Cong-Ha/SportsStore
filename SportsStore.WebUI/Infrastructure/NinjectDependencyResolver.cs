using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ninject;
using SportsStore.Domain.Abstract;
using SportsStore.Domain.Entities;
using Moq;


namespace SportsStore.WebUI.Infrastructure
{
    public class NinjectDependencyResolver : IDependencyResolver
    {
        private IKernel kernel;
        public NinjectDependencyResolver(IKernel kernelParam)
        {
            kernel = kernelParam;
            AddBinding();
        }

        public object GetService(Type serviceType) 
        {
            return kernel.GetService(serviceType);
        }

        public IEnumerable<object> GetServices(Type serviceType)
        { 
            return kernel.GetAll(serviceType);
        }

        private void AddBinding()
        {
            //mock repo call for product data
            Mock<IProductsRepository> mockProdcutsRepo = new Mock<IProductsRepository>();
            mockProdcutsRepo.Setup(m => m.Products).Returns(new List<Product>
            {
                new Product { Name = "Football", Price = 250, Description = "Team Sport", Category = "" },
                new Product { Name = "Soccer", Price = 180, Description = "Team Sport", Category = "Field sport" },
                new Product { Name = "Baseball", Price = 120, Description = "Team Sport", Category = "Field sport" }
            });

            kernel.Bind<IProductsRepository>().ToConstant(mockProdcutsRepo.Object);
        }
    }
}