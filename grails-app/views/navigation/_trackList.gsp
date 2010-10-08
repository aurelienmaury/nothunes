 <head>
 <sm:inlinePlayer/>
 </head>
<table>
   <thead class="fixedHeader">
      <tr>
         
         <th>
         ${message(code: 'track.name.label', default: 'Name')}
         </th>

         <th>
         ${message(code: 'band.name.label', default: 'Band')}
         </th>

         <th>
         ${message(code: 'album.name.label', default: 'Album')}
         </th>

         <th style="width: 120px; text-align: center;">Play - Download</th>
      </tr>
   </thead>

   <tbody class="navigationTable">

      <g:each in="${trackList}" status="i" var="trackInstance">
         <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
            
            <td>
            ${fieldValue(bean: trackInstance, field: "name")}
            </td>

            <td><g:link url="${trackInstance.album.band.webSite}">
               ${fieldValue(bean: trackInstance, field: "album.band.name")}
            </g:link></td>

            <td>
            ${fieldValue(bean: trackInstance, field: "album.name")}
            </td>

             <td style="width: 50px; text-align: center;"><a
               href="${createLink(controller:'dl', action:'audio', params: [id: trackInstance.audioPath])}"> - 
            <img src="${resource(dir:'images',file:'filesave.png')}"
               border="0" /> </a></td>
         </tr>
      </g:each>

   </tbody>

</table>
