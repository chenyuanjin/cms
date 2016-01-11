<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="sys_menu_add_form" action="admin/menu/add" method="post" class="form">
    <input type="hidden" id="menu_parent_id" name="parent.id"  >
    <input type="hidden" id="menu_resources_id" name="resources.id">
    <fieldset>
        <legend>菜单信息</legend>
        <p>
        <span>
            菜单名称：
        </span>
            <input type="text" id="name" name="name">
        </p>
        <p>
        <span>
            图标：
        </span>
            <input type="text" name="iconStyle" style="width:100px;">
            <button type="button" class="selectAdd" onclick="addMenuIcon()"/>
            <button type="button" class="selectDel" onclick="delMenuIcon()"/>
        </p>
        <p>
        <span>
           父节点：
        </span>
            <input type="text" name="parent.name" id="menu_parent_name" readonly="readonly">
        </p>
        <p style="width: 582px;">
        <span>
            资源：
        </span>
            <input type="text" id="menu_resources_path" name="resources_name" style="width: 300px;" readonly="readonly">
            <button type="button" class="selectAdd" onclick="addMenuResources()"/>
            <button type="button" class="selectDel"/>
        </p>
    </fieldset>

</form>