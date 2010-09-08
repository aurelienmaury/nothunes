var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}


function updateSelectAlbumWithJSON(e, albumListId) {

   var rselect = $(albumListId)
   
   // Vidage du select
   var l = rselect.length
   while (l > 0) {
      l--
      rselect.remove(l)
   }

   // Evaluation du JSON retourné par le serveur
   var albums = eval("(" + e.responseText + ")")
   
   if (albums) {
      addOption(rselect, '---Choose an album---', '')
      
      for (var i=0; i < albums.length; i++) {
         addOption (rselect, albums[i].name, albums[i].id)
      }
   }
}

function addOption(selectId, text, value) {
   var opt = new Element('option');
   opt.text = text
   opt.value = value
   
   try {
      selectId.add(opt,null) // Standard, ne fonctionne pas avec IE
   }
   catch(ex) {
      selectId.add(opt) // seulement pour IE
   }
}