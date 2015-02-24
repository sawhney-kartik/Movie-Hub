function getMovies()
{
   movies = new Array;
   if (this.readyState!=4)
   {
      return;
   }
   if (this.status!=200)
   {
      console.log("The program has encountered an unexpected error");
      return;
   }
   movies = JSON.parse(this.responseText);
   var elem = document.getElementById("moviesView");
   elem.innerHTML = "";
   for (var i=0; i<movies.length; i++)
   {
      var link = document.createElement('a');
      link.href = "/movies/" + movies[i].id;
      link.appendChild(document.createTextNode(movies[i].movie_name));
      elem.appendChild(link);
   }
}

function handleAjax(userFunction,action,url,async)
{
   var myXHR = new XMLHttpRequest();
   myXHR.onreadystatechange = userFunction;
   myXHR.open(action, encodeURI(url), async);
   myXHR.send();
}

