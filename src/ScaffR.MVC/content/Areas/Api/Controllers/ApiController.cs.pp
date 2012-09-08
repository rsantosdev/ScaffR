namespace $rootnamespace$.Areas.Api.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;

    using $rootnamespace$.Core.Interfaces.Service;
    using $rootnamespace$.Core.Model;

    public abstract class ApiController<T> : ApiController where T : PersistentEntity
    {
        protected IService<T> Service;

        public HttpResponseMessage Get(int id)
        {
            T item = this.Service.GetById(id);
            var response = Request.CreateResponse(HttpStatusCode.Created, item);
            if (item == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }

            return response;
        }

        public IEnumerable<T> Get()
        {
            return this.Service.GetAll();
        }

        public void Delete(int id)
        {
            T entity = this.Service.GetById(id);
            this.Service.Delete(entity);
        }

        public HttpResponseMessage Put(T entity)
        {
            this.Service.SaveOrUpdate(entity);
            var response = Request.CreateResponse(HttpStatusCode.Created, entity);
            string uri = Url.Link("Api", new { id = entity.Id });
            response.Headers.Location = new Uri(uri);
            return response;
        }

        public virtual IEnumerable<T> Page(int page, int pageSize)
        {
            var p = this.Service.Page(page, pageSize);
            return p.Entities.ToList();
        }
    }
}