
<%@ page import="fr.xebia.nothunes.domain.Track" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title>Navigation</title>

  <g:javascript>
    // Fonction de filtrage du select des Albums et de la liste des Track, � partir d'un id de Band
    function filterByBand() {
    var bandId = $F('bandSelect');
    <g:remoteFunction action="ajaxFilterTrackByBand" params="'id=' + bandId" onComplete="updateTrackList(e)"/>
    <g:remoteFunction action="ajaxFilterAlbumByBand" params="'id=' + bandId" onComplete="updateAlbums(e)"/>
    }

    // Fonction de filtrage de la liste des Track, � partir d'un id d'Album
    function filterByAlbum() {
    var albumId = $F('albumSelect');
    <g:remoteFunction action="ajaxFilterTrackByAlbum" params="'id=' + albumId" onComplete="updateTrackList(e)"/>
    }

    // Fonction de mise � jour de la liste des Track avec la r�ponse (au format HTML) de la requ�te AJAX.
    function updateTrackList(e) {
    $('navTrack').innerHTML = e.responseText;
    }

    // Fonction de mise � jour du select des Albums avec la r�ponse (au format JSON) de la requ�te AJAX.
		function updateAlbums(e) {
		// The response comes back as a bunch-o-JSON
		var albums = eval("(" + e.responseText + ")")	// evaluate JSON

		if (albums) {
			var rselect = $('albumSelect')

			// Clear all previous options
			var l = rselect.length

			while (l > 0) {
				l--
				rselect.remove(l)
			}

			var opt = document.createElement('option');
			opt.text = 'All'
			opt.value = ''
			try {
		    	rselect.add(opt, null) // standards compliant; doesn't work in IE
		  	}
			catch(ex) {
		   		rselect.add(opt) // IE only
			}


			// Rebuild the select
			for (var i=0; i < albums.length; i++) {
				var anAlbum = albums[i]
				var opt = document.createElement('option');
				opt.text = anAlbum.name
				opt.value = anAlbum.id
			  	try {
			    	rselect.add(opt, null) // standards compliant; doesn't work in IE
			  	}
		  		catch(ex) {
		    		rselect.add(opt) // IE only
		  		}
			}
		}
	}

  </g:javascript>
</head>
<body>


  <div id="boxLeft">
    <div class="halfLeft textCenter">
      
      <img src="${resource(dir:'images',file:'kmix.png')}" alt="Grails" border="0" /><br/>
      
      <g:form action="search">
        <input type="text" id="searchQuery" name="searchQuery" value="${searchQuery}"/>
        <g:actionSubmit  value="Search" />
      </g:form>
    </div>
    <div class="halfRight">
      <h2>Bands</h2>
      <g:select id="bandSelect" name="band" class="navigationSelect"
                from="${bandList}"
                noSelection="['':'All']" optionValue="name"
                optionKey="id" size="30" onchange="filterByBand()"/>
    </div>
  </div>

  <div id="boxRight">
    <div class="halfLeft">
      <h2>Albums</h2>
      <g:select id="albumSelect" name="album" class="navigationSelect"
                from="${albumList}"
                noSelection="['':'All']" optionValue="name"
                optionKey="id" size="30" onchange="filterByAlbum()"/>
    </div>
    <div class="halfRight textCenter">
      <img src="${resource(dir:'images',file:'kmix.png')}" alt="Grails" border="0" /><br/>
    </div>
  </div>

  <div id="bigBox">
    <div id="navTrack" class="list">
      <g:render template="/navigation/trackList"/>
    </div>
  </div>


</body>
</html>
