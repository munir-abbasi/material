{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2021 Madi Nuralin
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Primary navigation menu list for OJS
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

<ul class="navbar-nav mr-auto flex-row {$ulClass|escape}">
	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{*if $sidebarCode}
			<li class="nav-item {$liClass|escape}" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				<div class="dropdown">
					{if !$showIcons}
						<a href="#" class="nav-link" type="button" id="dropdownSidebar" data-mdb-toggle="dropdown" aria-expanded="false">
							<i class="fas fa-globe"></i>
						</a>
					{else}
						<a href="#" class="nav-link dropdown-toggle" type="button" id="dropdownSidebar" data-mdb-toggle="dropdown" aria-expanded="false">
							{translate key="common.language"}
						</a>
					{/if}
					<ul class="dropdown-menu dropdown-menu-xxl-end dropdown-menu-light" aria-labelledby="dropdownSidebar">
						{$sidebarCode}
					</ul>
				</div>
			</li><!-- pkp_sidebar.left -->
		{/if*}
	{/if}
	<li class="{$liClass|escape} nav-item">
		{if !$showIcons}
			<a href="{url page="search"}" class="nav-link mx-1">
				<i class="fas fa-search"></i>
			</a>
		{else}
			<a href="{url page="search"}" class="nav-link">
				{translate key="common.search"}
			</a>
		{/if}
	</li>
</ul>