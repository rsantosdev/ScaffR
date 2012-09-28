namespace $rootnamespace$.Areas.Api.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Net;
    using System.Net.Http;
    using System.Web.Http;

    using Core.Interfaces.Service;
    using Core.Model;

    public abstract class ApiController<T> : ApiController where T : DomainObject
    {
        protected IService<T> Service;

        public virtual HttpResponseMessage Get(int id)
        {
            T item = Service.GetById(id);
            var response = Request.CreateResponse(HttpStatusCode.Created, item);
            if (item == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }

            return response;
        }

        public virtual IEnumerable<T> Get()
        {
            return Service.GetAll();
        }

        public virtual void Delete(int id)
        {
            T entity = Service.GetById(id);
            Service.Delete(entity);
        }

        public virtual HttpResponseMessage Post(T entity)
        {
            Service.SaveOrUpdate(entity);
            var response = new HttpResponseMessage(HttpStatusCode.Created);
            string uri = Url.Link("DefaultApi", new { id = entity.Id });
            response.Headers.Location = new Uri(uri);
            return Get(entity.Id);
        }

        public virtual HttpResponseMessage Put(T entity)
        {
            Service.SaveOrUpdate(entity);
            var response = Request.CreateResponse(HttpStatusCode.Created, entity);
            string uri = Url.Link("DefaultApi", new { id = entity.Id });
            response.Headers.Location = new Uri(uri);
            return response;
        }

        public virtual IEnumerable<T> Page(int page, int pageSize)
        {
            var p = Service.Page(page, pageSize);
            return p.Entities.ToList();
        }
    }
}