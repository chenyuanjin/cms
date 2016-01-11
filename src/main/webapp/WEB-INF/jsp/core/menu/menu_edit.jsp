<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="sys_menu_edit_form" method="post" class="form">
    <input type="hidden" name="id">
    <input type="hidden" id="menu_edit_resources_id" name="resources.id">
    <fieldset>
        <legend>菜单信息</legend>
        <p>
        <span>
            菜单名称：
        </span>
            <input type="text" name="name">
        </p>
        <p>
        <span>
            图标：
        </span>
            <input type="text" name="iconStyle" style="width:100px;" readonly="readonly">
            <button type="button" class="selectAdd" onclick="addMenuIcon()"/>
            <button type="button" class="selectDel" onclick="delMenuIcon()"/>
        </p>
        <p style="width: 582px;">
        <span>
            资源：
        </span>
            <input type="text" id="menu_edit_resources_path" name="resources_name" style="width: 300px;" readonly="readonly">
            <button type="button" class="selectAdd" onclick="addEditMenuResources()"/>
            <button type="button" class="selectDel"/>
        </p>
    </fieldset>
</form>