using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using movieapplication.Models;

namespace movieapplication.Controllers
{
    public class MovieController : Controller
    {
        private MovieContext db = new MovieContext();
        // GET: Movie
        public ActionResult Index()
        {
            
            return View(db.Movies.ToList());
        }

        // GET: Movie/Details/5
        public ActionResult Details(int id)
        {
            Movie movie = db.Movies.Single(m => m.movieId == id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // GET: Movie/Create
        public ActionResult Create(int id = 0)
        {

            ViewBag.actorId = new SelectList(db.Actors.ToList(), "actorId", "actorName");
            ViewBag.producerId = new SelectList(db.Producers.ToList(),"producerId","producerName");

          /*  Movie mov = new Movie();
            mov.GetActorList = db.Actors.ToList();*/
            return View();
        }

        // POST: Movie/Create
        [HttpPost]
        public ActionResult Create(Movie movie)
        {


            string fileName = System.IO.Path.GetFileNameWithoutExtension(movie.ImageFile.FileName);
            string extension = System.IO.Path.GetExtension(movie.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            movie.moviePoster = "~/Image/" + fileName;
            fileName = System.IO.Path.Combine(Server.MapPath("~/Image/"), fileName);
            movie.ImageFile.SaveAs(fileName);

                          
              if(ModelState.IsValid)
                {
                    db.Movies.Add(movie);
                    db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.actorId = new SelectList(db.Actors.ToList(), "actorId", "actorName",movie.actorId);
            ViewBag.producerId = new SelectList(db.Producers.ToList(), "producerId", "producerName", movie.producerId);
            return View(movie);
           
        }

        // GET: Movie/Edit/5
        public ActionResult Edit(int id)
        {
            Movie movie = db.Movies.Single(x => x.movieId == id);
            ViewBag.actorId = new SelectList(db.Actors.ToList(), "actorId", "actorName");
            ViewBag.producerId = new SelectList(db.Producers.ToList(), "producerId", "producerName");

            return View(movie);
        }

        // POST: Movie/Edit/5
        [HttpPost]
        public ActionResult Edit(Movie movie)
        {
           
            if (ModelState.IsValid)
            {
                db.Entry(movie).State = EntityState.Modified; 
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.actorId = new SelectList(db.Actors.ToList(), "actorId", "actorName", movie.actorId);
            ViewBag.producerId = new SelectList(db.Producers.ToList(), "producerId", "producerName", movie.producerId);
            return View(movie);

        }

        // GET: Movie/Delete/5
        public ActionResult Delete(int id)
        {
            Movie movie = db.Movies.Single(m => m.movieId == id);
            if (movie == null)
            {
                return HttpNotFound();
            }
            return View(movie);
        }

        // POST: Movie/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, Movie movie)
        {
            movie = db.Movies.Single(m => m.movieId == id);
            if (ModelState.IsValid)
            {
                db.Movies.Remove(movie);
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            return View(movie);
        }

        //Actor-----------------------------------------------------------
        // GET: Actor
        public ActionResult IndexActor()
        {
            return View(db.Actors.ToList());
        }

        // GET: Actor/Details/5
        public ActionResult DetailsActor(int id)
        {
            Actor actor = db.Actors.Single(a => a.actorId == id);
           
            if (actor == null)
            {
                return HttpNotFound();
            }
            return View(actor);
        }

        // GET: Actor/Create
        public ActionResult CreateActor()
        {

           
            return View();
        }

        [HttpPost]
        public ActionResult CreateActor(Actor actor)
        {
            if (ModelState.IsValid)
            {
                db.Actors.Add(actor);
                db.SaveChanges();
                return RedirectToAction("IndexActor");
            }

            return View(actor);
        }

        // GET: Actor/Edit/5
        public ActionResult EditActor(int id)
        {
            Actor actor = db.Actors.Single(a => a.actorId == id);
            return View(actor);
        }

        // POST: Actor/Edit/5
        [HttpPost]
        public ActionResult EditActor(Actor actor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(actor).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexActor");
            }

            
            return View(actor);
        }

        // GET: Actor/Delete/5
        public ActionResult DeleteActor(int id)
        {
            Actor actor = db.Actors.Single(a => a.actorId == id);

            if (actor == null)
            {
                return HttpNotFound();
            }
            return View(actor);
        }

        // POST: Actor/Delete/5
        [HttpPost]
        public ActionResult DeleteActor(int id, Actor actor)
        {
            actor = db.Actors.Single(a => a.actorId == id);
            if (ModelState.IsValid)
            {
                db.Actors.Remove(actor);
                db.SaveChanges();
                return RedirectToAction("IndexActor");
            }


            return View(actor);
        }
        //Producer-----------------------------------------------------------
        // GET: Actor
        public ActionResult IndexProducer()
        {
            return View(db.Producers.ToList());
        }

        // GET: Actor/Details/5
        public ActionResult DetailsProducer(int id)
        {
            Producer producer = db.Producers.Single(p => p.producerId == id);

            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        public ActionResult CreateProducer()
        {


            return View();
        }

        [HttpPost]
        public ActionResult CreateProducer(Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Producers.Add(producer);
                db.SaveChanges();
                return RedirectToAction("IndexProducer");
            }

            return View(producer);
        }

        // GET: Actor/Edit/5
        public ActionResult EditProducer(int id)
        {
            Producer producer = db.Producers.Single(p => p.producerId == id);
            return View(producer);
        }

        // POST: Actor/Edit/5
        [HttpPost]
        public ActionResult EditProducer(Producer producer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexProducer");
            }


            return View(producer);
        }

        // GET: Actor/Delete/5
        public ActionResult DeleteProducer(int id)
        {
            Producer producer = db.Producers.Single(p => p.producerId == id);

            if (producer == null)
            {
                return HttpNotFound();
            }
            return View(producer);
        }

        // POST: Actor/Delete/5
        [HttpPost]
        public ActionResult DeleteProducer(int id,Producer producer)
        {
            producer = db.Producers.Single(p => p.producerId == id);
            if (ModelState.IsValid)
            {
                db.Producers.Remove(producer);
                db.SaveChanges();
                return RedirectToAction("IndexProducer");
            }


            return View(producer);
        }

    }
}
