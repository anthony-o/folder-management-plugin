<div style="margin-left: 25px">
    <table class="analysis-table filelisttable" style="table-layout: fixed" id="file-list-table-${folder.id}" name="${folder.id}">
        <thead>
            <tr>
                <th class="columnheader">File Name</th>
                <th class="columnheader" style="width: 70px">Created on</th>
                <th class="columnheader" style="width: 70px">Updated on</th>
                <th class="columnheader" style="width: 160px">&nbsp;</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="3">&nbsp;</td>
                <td>
                    <div style="padding: 4px 0px;">
                        <span class="greybutton addall link">Export all</span>
                    </div>
                </td>
            </tr>
        </tfoot>
        <tbody>
            <g:each in="${folder?.fmFiles.sort{a,b-> a.displayName.toUpperCase().compareTo(b.displayName.toUpperCase())}}" status="i" var="fmFile">
	        <g:logMsg>fmfile '${fmFile.displayName}' id ${fmFile.id} type ${fmFile.fileType} originalName '${fmFile.originalName}' cre ${fmFile.createDate} upd ${fmFile.updateDate}</g:logMsg>
                <tr id="${fmFile.id}-filerow" class="" style="border-top: 1px solid #ccc">
                    <td class="columnname textsmall" style="text-align: left;"><g:link controller="fileExport" action="exportFile" id="${fmFile.id}"><span class="fileicon ${fmFile.fileType}">&nbsp;</span>${fmFile.displayName}</g:link></td>
                    <td class="columnvalue textsmall">
                        <g:formatDate format="yyyy-MM-dd" date="${fmFile.createDate}"/>
                    </td>
                    <td class="columnvalue textsmall">
                        <g:formatDate format="yyyy-MM-dd" date="${fmFile.updateDate}"/>
                    </td>
                    <td class="columnvalue textsmall">
                        <div>
                            <span class="exportaddspan foldericon addcart link" name="${fmFile.id}">Add to export</span>
                            <sec:ifAnyGranted roles="ROLE_ADMIN">
                                <span class="deletefilespan foldericon deletefile link" name="${fmFile.id}"> Delete</span>
                            </sec:ifAnyGranted>
                        </div>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>
