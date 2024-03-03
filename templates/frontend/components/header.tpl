{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2021 Madi Nuralin
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}
	{capture assign="pageTitleTranslated"}
		{translate key=$pageTitle}
	{/capture}
{/if}
{include file="frontend/components/headerHead.tpl"}

<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

{if $requestedPage !== 'login' && $requestedPage !== 'user'}

	<!-- ======= Header ======= -->
	<header class="sticky top-0 z-50 flex flex-none flex-wrap items-center justify-between bg-white px-4 py-5 shadow-md shadow-slate-900/5 transition duration-500 sm:px-6 lg:px-8 dark:shadow-none dark:bg-transparent">
		{* Skip to content nav links *}
		{*include file="frontend/components/skipLinks.tpl"*}
		<div class="relative flex flex-grow basis-0 items-center">
			{if $displayPageHeaderLogo}
				<a href="{url page="index" router=$smarty.const.ROUTE_PAGE}">
					<img
						src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
						width="{$displayPageHeaderLogo.width|escape}"
						height="{$displayPageHeaderLogo.height|escape}"
						{if $displayPageHeaderLogo.altText != ''}
							alt="{$displayPageHeaderLogo.altText|escape}"
						{/if}
						class="img-fluid"
						style="max-width: 180px;"/>
				</a>
			{else}
				<a aria-label="Home page" href="/">
					{include file="frontend/components/ui/logo.tpl"}
				</a>
			{/if}
		</div>
		<div class="flex items-center space-x-2">
			{* Search form *}
			{if $currentContext && $requestedPage !== 'search'}
				<div class="pkp_navigation_search_wrapper">
					<a href="{url page="search"}" class="flex h-8 w-8 items-center justify-center rounded-lg shadow-md shadow-black/5 ring-1 ring-black/5 dark:bg-slate-700 dark:ring-inset dark:ring-white/5">
						{include file="frontend/components/ui/searchIcon.tpl"}
					</a>
				</div>
			{/if}
			{*include file="frontend/components/ui/localeSelector.tpl"*}
			{include file="frontend/components/ui/themeSelector.tpl"}
			{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
		</div>
	</header>

	{if $requestedPage == 'index' || $requestedPage == ''}
		{include file="frontend/components/headerSection.tpl"}
	{/if}

	{capture assign="primaryMenu"}
		{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
	{/capture}

<div class="relative mx-auto flex w-full max-w-8xl flex-auto justify-center sm:px-2 lg:px-8 xl:px-12"><div class="hidden lg:relative lg:block lg:flex-none">
	<div class="absolute inset-y-0 right-0 w-[50vw] bg-slate-50 dark:hidden">
	</div>
	<div class="absolute bottom-0 right-0 top-16 hidden h-12 w-px bg-gradient-to-t from-slate-800 dark:block">
	</div>
	<div class="absolute bottom-0 right-0 top-28 hidden w-px bg-slate-800 dark:block">
	</div>
	<div class="sticky top-[4.75rem] -ml-0.5 h-[calc(100vh-4.75rem)] w-64 overflow-y-auto overflow-x-hidden py-16 pl-0.5 pr-8 xl:w-72 xl:pr-16">
		<nav class="text-base lg:text-sm">
			{* Primary navigation menu for current application *}
			{$primaryMenu}
		</nav>
	</div></div><div class="min-w-0 max-w-2xl flex-auto px-4 py-16 lg:max-w-none lg:pl-8 lg:pr-0 xl:px-16"><article><header class="mb-9 space-y-1"><p class="font-display text-sm font-medium text-sky-500">Introduction</p><h1 class="font-display text-3xl tracking-tight text-slate-900 dark:text-white">Getting started</h1></header><div class="prose prose-slate max-w-none dark:prose-invert dark:text-slate-400 prose-headings:scroll-mt-28 prose-headings:font-display prose-headings:font-normal lg:prose-headings:scroll-mt-[8.5rem] prose-lead:text-slate-500 dark:prose-lead:text-slate-400 prose-a:font-semibold dark:prose-a:text-sky-400 prose-a:no-underline prose-a:shadow-[inset_0_-2px_0_0_var(--tw-prose-background,#fff),inset_0_calc(-1*(var(--tw-prose-underline-size,4px)+2px))_0_0_var(--tw-prose-underline,theme(colors.sky.300))] hover:prose-a:[--tw-prose-underline-size:6px] dark:[--tw-prose-background:theme(colors.slate.900)] dark:prose-a:shadow-[inset_0_calc(-1*var(--tw-prose-underline-size,2px))_0_0_var(--tw-prose-underline,theme(colors.sky.800))] dark:hover:prose-a:[--tw-prose-underline-size:6px] prose-pre:rounded-xl prose-pre:bg-slate-900 prose-pre:shadow-lg dark:prose-pre:bg-slate-800/60 dark:prose-pre:shadow-none dark:prose-pre:ring-1 dark:prose-pre:ring-slate-300/10 dark:prose-hr:border-slate-800"><p class="lead">Learn how to get CacheAdvance set up in your project in under thirty minutes or it's free. </p><div class="not-prose my-12 grid grid-cols-1 gap-6 sm:grid-cols-2"><div class="group relative rounded-xl border border-slate-200 dark:border-slate-800"><div class="absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"></div><div class="relative overflow-hidden rounded-xl p-6"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S1:-gradient" gradientTransform="matrix(0 21 -21 0 12 3)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S1:-gradient-dark" gradientTransform="matrix(0 21 -21 0 16 7)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="12" cy="12" r="12" fill="url(#:S1:-gradient)"></circle><path d="m8 8 9 21 2-10 10-2L8 8Z" fill-opacity="0.5" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></g><g class="hidden dark:inline"><path d="m4 4 10.286 24 2.285-11.429L28 14.286 4 4Z" fill="url(#:S1:-gradient-dark)" stroke="url(#:S1:-gradient-dark)" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></g></svg><h2 class="mt-4 font-display text-base text-slate-900 dark:text-white"><a href="/"><span class="absolute -inset-px rounded-xl"></span>Installation</a></h2><p class="mt-1 text-sm text-slate-700 dark:text-slate-400">Step-by-step guides to setting up your system and installing the library.</p></div></div><div class="group relative rounded-xl border border-slate-200 dark:border-slate-800"><div class="absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"></div><div class="relative overflow-hidden rounded-xl p-6"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S2:-gradient" gradientTransform="matrix(0 21 -21 0 20 3)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S2:-gradient-dark" gradientTransform="matrix(0 22.75 -22.75 0 16 6.25)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="20" cy="12" r="12" fill="url(#:S2:-gradient)"></circle><g class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" fill-opacity="0.5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 5v12a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2Z"></path><path d="M18 17v10a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V17a2 2 0 0 0-2-2h-7a2 2 0 0 0-2 2Z"></path><path d="M18 5v4a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2V5a2 2 0 0 0-2-2h-7a2 2 0 0 0-2 2Z"></path><path d="M3 25v2a2 2 0 0 0 2 2h7a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2Z"></path></g></g><g class="hidden dark:inline" fill="url(#:S2:-gradient-dark)"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 17V4a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Zm16 10v-9a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2h-6a2 2 0 0 1-2-2Zm0-23v5a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1h-8a1 1 0 0 0-1 1ZM3 28v-3a1 1 0 0 1 1-1h9a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1Z"></path><path d="M2 4v13h2V4H2Zm2-2a2 2 0 0 0-2 2h2V2Zm8 0H4v2h8V2Zm2 2a2 2 0 0 0-2-2v2h2Zm0 13V4h-2v13h2Zm-2 2a2 2 0 0 0 2-2h-2v2Zm-8 0h8v-2H4v2Zm-2-2a2 2 0 0 0 2 2v-2H2Zm16 1v9h2v-9h-2Zm3-3a3 3 0 0 0-3 3h2a1 1 0 0 1 1-1v-2Zm6 0h-6v2h6v-2Zm3 3a3 3 0 0 0-3-3v2a1 1 0 0 1 1 1h2Zm0 9v-9h-2v9h2Zm-3 3a3 3 0 0 0 3-3h-2a1 1 0 0 1-1 1v2Zm-6 0h6v-2h-6v2Zm-3-3a3 3 0 0 0 3 3v-2a1 1 0 0 1-1-1h-2Zm2-18V4h-2v5h2Zm0 0h-2a2 2 0 0 0 2 2V9Zm8 0h-8v2h8V9Zm0 0v2a2 2 0 0 0 2-2h-2Zm0-5v5h2V4h-2Zm0 0h2a2 2 0 0 0-2-2v2Zm-8 0h8V2h-8v2Zm0 0V2a2 2 0 0 0-2 2h2ZM2 25v3h2v-3H2Zm2-2a2 2 0 0 0-2 2h2v-2Zm9 0H4v2h9v-2Zm2 2a2 2 0 0 0-2-2v2h2Zm0 3v-3h-2v3h2Zm-2 2a2 2 0 0 0 2-2h-2v2Zm-9 0h9v-2H4v2Zm-2-2a2 2 0 0 0 2 2v-2H2Z"></path></g></svg><h2 class="mt-4 font-display text-base text-slate-900 dark:text-white"><a href="/"><span class="absolute -inset-px rounded-xl"></span>Architecture guide</a></h2><p class="mt-1 text-sm text-slate-700 dark:text-slate-400">Learn how the internals work and contribute.</p></div></div><div class="group relative rounded-xl border border-slate-200 dark:border-slate-800"><div class="absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"></div><div class="relative overflow-hidden rounded-xl p-6"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S3:-gradient" gradientTransform="matrix(0 21 -21 0 20 11)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S3:-gradient-dark-1" gradientTransform="matrix(0 22.75 -22.75 0 16 6.25)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S3:-gradient-dark-2" gradientTransform="matrix(0 14 -14 0 16 10)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="20" cy="20" r="12" fill="url(#:S3:-gradient)"></circle><g fill-opacity="0.5" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 9v14l12 6V15L3 9Z"></path><path d="M27 9v14l-12 6V15l12-6Z"></path></g><path d="M11 4h8v2l6 3-10 6L5 9l6-3V4Z" fill-opacity="0.5" class="fill-[var(--icon-background)]"></path><g class="stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 5.5 27 9l-12 6L3 9l7-3.5"></path><path d="M20 5c0 1.105-2.239 2-5 2s-5-.895-5-2m10 0c0-1.105-2.239-2-5-2s-5 .895-5 2m10 0v3c0 1.105-2.239 2-5 2s-5-.895-5-2V5"></path></g></g><g class="hidden dark:inline" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17.676 3.38a3.887 3.887 0 0 0-3.352 0l-9 4.288C3.907 8.342 3 9.806 3 11.416v9.168c0 1.61.907 3.073 2.324 3.748l9 4.288a3.887 3.887 0 0 0 3.352 0l9-4.288C28.093 23.657 29 22.194 29 20.584v-9.168c0-1.61-.907-3.074-2.324-3.748l-9-4.288Z" stroke="url(#:S3:-gradient-dark-1)"></path><path d="M16.406 8.087a.989.989 0 0 0-.812 0l-7 3.598A1.012 1.012 0 0 0 8 12.61v6.78c0 .4.233.762.594.925l7 3.598a.989.989 0 0 0 .812 0l7-3.598c.361-.163.594-.525.594-.925v-6.78c0-.4-.233-.762-.594-.925l-7-3.598Z" fill="url(#:S3:-gradient-dark-2)" stroke="url(#:S3:-gradient-dark-2)"></path></g></svg><h2 class="mt-4 font-display text-base text-slate-900 dark:text-white"><a href="/"><span class="absolute -inset-px rounded-xl"></span>Plugins</a></h2><p class="mt-1 text-sm text-slate-700 dark:text-slate-400">Extend the library with third-party plugins or write your own.</p></div></div><div class="group relative rounded-xl border border-slate-200 dark:border-slate-800"><div class="absolute -inset-px rounded-xl border-2 border-transparent opacity-0 [background:linear-gradient(var(--quick-links-hover-bg,theme(colors.sky.50)),var(--quick-links-hover-bg,theme(colors.sky.50)))_padding-box,linear-gradient(to_top,theme(colors.indigo.400),theme(colors.cyan.400),theme(colors.sky.500))_border-box] group-hover:opacity-100 dark:[--quick-links-hover-bg:theme(colors.slate.800)]"></div><div class="relative overflow-hidden rounded-xl p-6"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S4:-gradient" gradientTransform="matrix(0 21 -21 0 12 11)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S4:-gradient-dark" gradientTransform="matrix(0 24.5 -24.5 0 16 5.5)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="12" cy="20" r="12" fill="url(#:S4:-gradient)"></circle><path d="M27 12.13 19.87 5 13 11.87v14.26l14-14Z" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" fill-opacity="0.5" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M3 3h10v22a4 4 0 0 1-4 4H7a4 4 0 0 1-4-4V3Z" class="fill-[var(--icon-background)]" fill-opacity="0.5"></path><path d="M3 9v16a4 4 0 0 0 4 4h2a4 4 0 0 0 4-4V9M3 9V3h10v6M3 9h10M3 15h10M3 21h10" class="stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M29 29V19h-8.5L13 26c0 1.5-2.5 3-5 3h21Z" fill-opacity="0.5" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></g><g class="hidden dark:inline"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 2a1 1 0 0 0-1 1v21a6 6 0 0 0 12 0V3a1 1 0 0 0-1-1H3Zm16.752 3.293a1 1 0 0 0-1.593.244l-1.045 2A1 1 0 0 0 17 8v13a1 1 0 0 0 1.71.705l7.999-8.045a1 1 0 0 0-.002-1.412l-6.955-6.955ZM26 18a1 1 0 0 0-.707.293l-10 10A1 1 0 0 0 16 30h13a1 1 0 0 0 1-1V19a1 1 0 0 0-1-1h-3ZM5 18a1 1 0 1 0 0 2h6a1 1 0 1 0 0-2H5Zm-1-5a1 1 0 0 1 1-1h6a1 1 0 1 1 0 2H5a1 1 0 0 1-1-1Zm1-7a1 1 0 0 0 0 2h6a1 1 0 1 0 0-2H5Z" fill="url(#:S4:-gradient-dark)"></path></g></svg><h2 class="mt-4 font-display text-base text-slate-900 dark:text-white"><a href="/"><span class="absolute -inset-px rounded-xl"></span>API reference</a></h2><p class="mt-1 text-sm text-slate-700 dark:text-slate-400">Learn to easily customize and modify your app's visual design to fit your brand.</p></div></div></div><p>Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste.</p><hr><h2 id="quick-start">Quick start</h2><p>Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur.</p><h3 id="installing-dependencies">Installing dependencies</h3><p>Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus.</p><pre class="prism-code language-shell"><code><span class="token plain">npm install @tailwindlabs/cache-advance</span>
</code></pre><p>Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod.</p><div class="my-8 flex rounded-3xl p-6 bg-amber-50 dark:bg-slate-800/60 dark:ring-1 dark:ring-slate-300/10"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 flex-none [--icon-foreground:theme(colors.amber.900)] [--icon-background:theme(colors.amber.100)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S5:-gradient" gradientTransform="rotate(65.924 1.519 20.92) scale(25.7391)"><stop stop-color="#FDE68A" offset=".08"></stop><stop stop-color="#F59E0B" offset=".837"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S5:-gradient-dark" gradientTransform="matrix(0 24.5 -24.5 0 16 5.5)"><stop stop-color="#FDE68A" offset=".08"></stop><stop stop-color="#F59E0B" offset=".837"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="20" cy="20" r="12" fill="url(#:S5:-gradient)"></circle><path d="M3 16c0 7.18 5.82 13 13 13s13-5.82 13-13S23.18 3 16 3 3 8.82 3 16Z" fill-opacity="0.5" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="m15.408 16.509-1.04-5.543a1.66 1.66 0 1 1 3.263 0l-1.039 5.543a.602.602 0 0 1-1.184 0Z" class="fill-[var(--icon-foreground)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path><path d="M16 23a1 1 0 1 0 0-2 1 1 0 0 0 0 2Z" fill-opacity="0.5" stroke="currentColor" class="fill-[var(--icon-background)] stroke-[color:var(--icon-foreground)]" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path></g><g class="hidden dark:inline"><path fill-rule="evenodd" clip-rule="evenodd" d="M2 16C2 8.268 8.268 2 16 2s14 6.268 14 14-6.268 14-14 14S2 23.732 2 16Zm11.386-4.85a2.66 2.66 0 1 1 5.228 0l-1.039 5.543a1.602 1.602 0 0 1-3.15 0l-1.04-5.543ZM16 20a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z" fill="url(#:S5:-gradient-dark)"></path></g></svg><div class="ml-4 flex-auto"><p class="m-0 font-display text-xl text-amber-900 dark:text-amber-500">Oh no! Something bad happened!</p><div class="prose mt-2.5 text-amber-800 [--tw-prose-underline:theme(colors.amber.400)] [--tw-prose-background:theme(colors.amber.50)] prose-a:text-amber-900 prose-code:text-amber-900 dark:text-slate-300 dark:[--tw-prose-underline:theme(colors.sky.700)] dark:prose-code:text-slate-300"><p>This is what a disclaimer message looks like. You might want to include inline <code>code</code> in it. Or maybe you’ll want to include a <a href="/">link</a> in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly.</p></div></div></div><h3 id="configuring-the-library">Configuring the library</h3><p>Sit commodi iste iure molestias qui amet voluptatem sed quaerat. Nostrum aut pariatur. Sint ipsa praesentium dolor error cumque velit tenetur quaerat exercitationem. Consequatur et cum atque mollitia qui quia necessitatibus.</p><pre class="prism-code language-js"><code><span class="token comment">// cache-advance.config.js</span><span class="token plain"></span>
<span class="token plain"></span><span class="token keyword module">export</span><span class="token plain"> </span><span class="token keyword module">default</span><span class="token plain"> </span><span class="token punctuation"></span><span class="token plain"></span>
<span class="token plain">  </span><span class="token literal-property property">strategy</span><span class="token operator">:</span><span class="token plain"> </span><span class="token string">'predictive'</span><span class="token punctuation">,</span><span class="token plain"></span>
<span class="token plain">  </span><span class="token literal-property property">engine</span><span class="token operator">:</span><span class="token plain"> </span><span class="token punctuation"></span><span class="token plain"></span>
<span class="token plain">    </span><span class="token literal-property property">cpus</span><span class="token operator">:</span><span class="token plain"> </span><span class="token number">12</span><span class="token punctuation">,</span><span class="token plain"></span>
<span class="token plain">    </span><span class="token literal-property property">backups</span><span class="token operator">:</span><span class="token plain"> </span><span class="token punctuation">[</span><span class="token string">'./storage/cache.wtf'</span><span class="token punctuation">]</span><span class="token punctuation">,</span><span class="token plain"></span>
<span class="token plain">  </span><span class="token punctuation"></span><span class="token punctuation">,</span><span class="token plain"></span>
<span class="token plain"></span><span class="token punctuation"></span>
</code></pre><p>Possimus saepe veritatis sint nobis et quam eos. Architecto consequatur odit perferendis fuga eveniet possimus rerum cumque. Ea deleniti voluptatum deserunt voluptatibus ut non iste. Provident nam asperiores vel laboriosam omnis ducimus enim nesciunt quaerat. Minus tempora cupiditate est quod.</p><div class="my-8 flex rounded-3xl p-6 bg-sky-50 dark:bg-slate-800/60 dark:ring-1 dark:ring-slate-300/10"><svg aria-hidden="true" viewBox="0 0 32 32" fill="none" class="h-8 w-8 flex-none [--icon-foreground:theme(colors.slate.900)] [--icon-background:theme(colors.white)]"><defs><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S6:-gradient" gradientTransform="matrix(0 21 -21 0 20 11)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient><radialGradient cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" id=":S6:-gradient-dark" gradientTransform="matrix(0 24.5001 -19.2498 0 16 5.5)"><stop stop-color="#0EA5E9"></stop><stop stop-color="#22D3EE" offset=".527"></stop><stop stop-color="#818CF8" offset="1"></stop></radialGradient></defs><g class="dark:hidden"><circle cx="20" cy="20" r="12" fill="url(#:S6:-gradient)"></circle><path fill-rule="evenodd" clip-rule="evenodd" d="M20 24.995c0-1.855 1.094-3.501 2.427-4.792C24.61 18.087 26 15.07 26 12.231 26 7.133 21.523 3 16 3S6 7.133 6 12.23c0 2.84 1.389 5.857 3.573 7.973C10.906 21.494 12 23.14 12 24.995V27a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2v-2.005Z" class="fill-[var(--icon-background)]" fill-opacity="0.5"></path><path d="M25 12.23c0 2.536-1.254 5.303-3.269 7.255l1.391 1.436c2.354-2.28 3.878-5.547 3.878-8.69h-2ZM16 4c5.047 0 9 3.759 9 8.23h2C27 6.508 21.998 2 16 2v2Zm-9 8.23C7 7.76 10.953 4 16 4V2C10.002 2 5 6.507 5 12.23h2Zm3.269 7.255C8.254 17.533 7 14.766 7 12.23H5c0 3.143 1.523 6.41 3.877 8.69l1.392-1.436ZM13 27v-2.005h-2V27h2Zm1 1a1 1 0 0 1-1-1h-2a3 3 0 0 0 3 3v-2Zm4 0h-4v2h4v-2Zm1-1a1 1 0 0 1-1 1v2a3 3 0 0 0 3-3h-2Zm0-2.005V27h2v-2.005h-2ZM8.877 20.921C10.132 22.136 11 23.538 11 24.995h2c0-2.253-1.32-4.143-2.731-5.51L8.877 20.92Zm12.854-1.436C20.32 20.852 19 22.742 19 24.995h2c0-1.457.869-2.859 2.122-4.074l-1.391-1.436Z" class="fill-[var(--icon-foreground)]"></path><path d="M20 26a1 1 0 1 0 0-2v2Zm-8-2a1 1 0 1 0 0 2v-2Zm2 0h-2v2h2v-2Zm1 1V13.5h-2V25h2Zm-5-11.5v1h2v-1h-2Zm3.5 4.5h5v-2h-5v2Zm8.5-3.5v-1h-2v1h2ZM20 24h-2v2h2v-2Zm-2 0h-4v2h4v-2Zm-1-10.5V25h2V13.5h-2Zm2.5-2.5a2.5 2.5 0 0 0-2.5 2.5h2a.5.5 0 0 1 .5-.5v-2Zm2.5 2.5a2.5 2.5 0 0 0-2.5-2.5v2a.5.5 0 0 1 .5.5h2ZM18.5 18a3.5 3.5 0 0 0 3.5-3.5h-2a1.5 1.5 0 0 1-1.5 1.5v2ZM10 14.5a3.5 3.5 0 0 0 3.5 3.5v-2a1.5 1.5 0 0 1-1.5-1.5h-2Zm2.5-3.5a2.5 2.5 0 0 0-2.5 2.5h2a.5.5 0 0 1 .5-.5v-2Zm2.5 2.5a2.5 2.5 0 0 0-2.5-2.5v2a.5.5 0 0 1 .5.5h2Z" class="fill-[var(--icon-foreground)]"></path></g><g class="hidden dark:inline"><path fill-rule="evenodd" clip-rule="evenodd" d="M16 2C10.002 2 5 6.507 5 12.23c0 3.144 1.523 6.411 3.877 8.691.75.727 1.363 1.52 1.734 2.353.185.415.574.726 1.028.726H12a1 1 0 0 0 1-1v-4.5a.5.5 0 0 0-.5-.5A3.5 3.5 0 0 1 9 14.5V14a3 3 0 1 1 6 0v9a1 1 0 1 0 2 0v-9a3 3 0 1 1 6 0v.5a3.5 3.5 0 0 1-3.5 3.5.5.5 0 0 0-.5.5V23a1 1 0 0 0 1 1h.36c.455 0 .844-.311 1.03-.726.37-.833.982-1.626 1.732-2.353 2.354-2.28 3.878-5.547 3.878-8.69C27 6.507 21.998 2 16 2Zm5 25a1 1 0 0 0-1-1h-8a1 1 0 0 0-1 1 3 3 0 0 0 3 3h4a3 3 0 0 0 3-3Zm-8-13v1.5a.5.5 0 0 1-.5.5 1.5 1.5 0 0 1-1.5-1.5V14a1 1 0 1 1 2 0Zm6.5 2a.5.5 0 0 1-.5-.5V14a1 1 0 1 1 2 0v.5a1.5 1.5 0 0 1-1.5 1.5Z" fill="url(#:S6:-gradient-dark)"></path></g></svg><div class="ml-4 flex-auto"><p class="m-0 font-display text-xl text-sky-900 dark:text-sky-400">You should know!</p><div class="prose mt-2.5 text-sky-800 [--tw-prose-background:theme(colors.sky.50)] prose-a:text-sky-900 prose-code:text-sky-900 dark:text-slate-300 dark:prose-code:text-slate-300"><p>This is what a disclaimer message looks like. You might want to include inline <code>code</code> in it. Or maybe you’ll want to include a <a href="/">link</a> in it. I don’t think we should get too carried away with other scenarios like lists or tables — that would be silly.</p></div></div></div><hr><h2 id="basic-usage">Basic usage</h2><p>Praesentium laudantium magni. Consequatur reiciendis aliquid nihil iusto ut in et. Quisquam ut et aliquid occaecati. Culpa veniam aut et voluptates amet perspiciatis. Qui exercitationem in qui. Vel qui dignissimos sit quae distinctio.</p><h3 id="your-first-cache">Your first cache</h3><p>Minima vel non iste debitis. Consequatur repudiandae et quod accusamus sit molestias consequatur aperiam. Et sequi ipsa eum voluptatibus ipsam. Et quisquam ut.</p><p>Qui quae esse aspernatur fugit possimus. Quam sed molestiae temporibus. Eum perferendis dignissimos provident ea et. Et repudiandae quasi accusamus consequatur dolore nobis. Quia reiciendis necessitatibus a blanditiis iste quia. Ut quis et amet praesentium sapiente.</p><p>Atque eos laudantium. Optio odit aspernatur consequuntur corporis soluta quidem sunt aut doloribus. Laudantium assumenda commodi.</p><h3 id="clearing-the-cache">Clearing the cache</h3><p>Vel aut velit sit dolor aut suscipit at veritatis voluptas. Laudantium tempore praesentium. Qui ut voluptatem.</p><p>Ea est autem fugiat velit esse a alias earum. Dolore non amet soluta eos libero est. Consequatur qui aliquam qui odit eligendi ut impedit illo dignissimos.</p><p>Ut dolore qui aut nam. Natus temporibus nisi voluptatum labore est ex error vel officia. Vero repellendus ut. Suscipit voluptate et placeat. Eius quo corporis ab et consequatur quisquam. Nihil officia facere dolorem occaecati alias deleniti deleniti in.</p><h3 id="adding-middleware">Adding middleware</h3><p>Officia nobis tempora maiores id iusto magni reprehenderit velit. Quae dolores inventore molestiae perspiciatis aut. Quis sequi officia quasi rem officiis officiis. Nesciunt ut cupiditate. Sunt aliquid explicabo enim ipsa eum recusandae. Vitae sunt eligendi et non beatae minima aut.</p><p>Harum perferendis aut qui quibusdam tempore laboriosam voluptatum qui sed. Amet error amet totam exercitationem aut corporis accusantium dolorum. Perspiciatis aut animi et. Sed unde error ut aut rerum.</p><p>Ut quo libero aperiam mollitia est repudiandae quaerat corrupti explicabo. Voluptas accusantium sed et doloribus voluptatem fugiat a mollitia. Numquam est magnam dolorem asperiores fugiat. Soluta et fuga amet alias temporibus quasi velit. Laudantium voluptatum perspiciatis doloribus quasi facere. Eveniet deleniti veniam et quia veritatis minus veniam perspiciatis.</p><hr><h2 id="getting-help">Getting help</h2><p>Consequuntur et aut quisquam et qui consequatur eligendi. Necessitatibus dolorem sit. Excepturi cumque quibusdam soluta ullam rerum voluptatibus. Porro illo sequi consequatur nisi numquam nisi autem. Ut necessitatibus aut. Veniam ipsa voluptatem sed.</p><h3 id="submit-an-issue">Submit an issue</h3><p>Inventore et aut minus ut voluptatem nihil commodi doloribus consequatur. Facilis perferendis nihil sit aut aspernatur iure ut dolores et. Aspernatur odit dignissimos. Aut qui est sint sint.</p><p>Facere aliquam qui. Dolorem officia ipsam adipisci qui molestiae. Error voluptatem reprehenderit ex.</p><p>Consequatur enim quia maiores aperiam et ipsum dicta. Quam ut sit facere sit quae. Eligendi veritatis aut ut veritatis iste ut adipisci illo.</p><h3 id="join-the-community">Join the community</h3><p>Praesentium facilis iste aliquid quo quia a excepturi. Fuga reprehenderit illo sequi voluptatem voluptatem omnis. Id quia consequatur rerum consectetur eligendi et omnis. Voluptates iusto labore possimus provident praesentium id vel harum quisquam. Voluptatem provident corrupti.</p><p>Eum et ut. Qui facilis est ipsa. Non facere quia sequi commodi autem. Dicta autem sit sequi omnis impedit. Eligendi amet dolorum magnam repudiandae in a.</p><p>Molestiae iusto ut exercitationem dolorem unde iusto tempora atque nihil. Voluptatem velit facere laboriosam nobis ea. Consequatur rerum velit ipsum ipsam. Et qui saepe consequatur minima laborum tempore voluptatum et. Quia eveniet eaque sequi consequatur nihil eos.</p></div></article><dl class="mt-12 flex border-t border-slate-200 pt-6 dark:border-slate-800"><div class="ml-auto text-right"><dt class="font-display text-sm font-medium text-slate-900 dark:text-white">Next</dt><dd class="mt-1"><a class="flex items-center gap-x-1 text-base font-semibold text-slate-500 hover:text-slate-600 dark:text-slate-400 dark:hover:text-slate-300" href="/docs/installation">Installation<svg viewBox="0 0 16 16" aria-hidden="true" class="h-4 w-4 flex-none fill-current"><path d="m9.182 13.423-1.17-1.16 3.505-3.505H3V7.065h8.517l-3.506-3.5L9.181 2.4l5.512 5.511-5.511 5.512Z"></path></svg></a></dd></div></dl></div>

	<div class="hidden xl:sticky xl:top-[4.75rem] xl:-mr-6 xl:block xl:h-[calc(100vh-4.75rem)] xl:flex-none xl:overflow-y-auto xl:py-16 xl:pr-6">
		<nav aria-labelledby="on-this-page-title" class="w-56">
			<!--h2 id="on-this-page-title" class="font-display text-sm font-medium text-slate-900 dark:text-white">On this page</h2-->

			{* Sidebars *}
			{if $requestedPage !== 'login' && $requestedPage !== 'user'}
			  {if empty($isFullWidth)}
			  	{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
			  	{if $sidebarCode}
		    		<ol class="mt-4 space-y-3 text-sm" role="list" aria-label="{translate|escape key="common.navigation.sidebar"}">
		    			{$sidebarCode}
		    		</ol><!-- pkp_sidebar.left -->
			  	{/if}
			  {/if}
			{/if}
		{*
			<ol role="list" class="mt-4 space-y-3 text-sm">
				<li>
					<h3>
						<a class="text-sky-500" href="#quick-start">Quick start</a>
					</h3>
					<ol role="list" class="mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400">
						<li>
							<a class="hover:text-slate-600 dark:hover:text-slate-300" href="#installing-dependencies">Installing dependencies</a>
						</li>
						<li>
							<a class="hover:text-slate-600 dark:hover:text-slate-300" href="#configuring-the-library">Configuring the library</a>
						</li>
					</ol>
				</li>
				<li>
					<h3>
						<a class="font-normal text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-300" href="#basic-usage">Basic usage</a>
					</h3>
					<ol role="list" class="mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400">
						<li>
							<a class="hover:text-slate-600 dark:hover:text-slate-300" href="#your-first-cache">Your first cache</a></li><li><a class="hover:text-slate-600 dark:hover:text-slate-300" href="#clearing-the-cache">Clearing the cache</a></li><li><a class="hover:text-slate-600 dark:hover:text-slate-300" href="#adding-middleware">Adding middleware</a></li></ol></li><li><h3><a class="font-normal text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-300" href="#getting-help">Getting help</a></h3><ol role="list" class="mt-2 space-y-3 pl-5 text-slate-500 dark:text-slate-400"><li><a class="hover:text-slate-600 dark:hover:text-slate-300" href="#submit-an-issue">Submit an issue</a></li><li><a class="hover:text-slate-600 dark:hover:text-slate-300" href="#join-the-community">Join the community</a></li></ol></li></ol>
							*}
		</nav>
	</div>
</div>

	{* Wrapper for page content and sidebars *}
	{if $isFullWidth}
		{assign var=hasSidebar value=0}
	{/if}

	{* Main *}
	<main class="" role="main">
		<a id="pkp_content_main"></a>

		{if $requestedPage != 'index' && $requestedPage != ''}
		
			<section class="hero-section inner-page">
			  <div class="wave">

			    <svg width="1920px" height="265px" viewBox="0 0 1920 265" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
			      <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
			        <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
			          <path d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,667 L1017.15166,667 L0,667 L0,439.134243 Z" id="Path"></path>
			        </g>
			      </g>
			    </svg>

			  </div>

			  <div class="container">
			    <div class="row align-items-center">
			      <div class="col-12">
			        <div class="row justify-content-center">
			          <div class="col-md-10 text-center hero-text">
			            <h1 data-aos="fade-up" data-aos-delay="">{$pageTitleTranslated}</h1>
			            <p class="mb-5" data-aos="fade-up" data-aos-delay="100"></p>
			          </div>
			        </div>
			      </div>
			    </div>
			  </div>

			</section>
		{/if}
{else}
	<main class="container-fluid" role="main">
		<a id="pkp_content_main"></a>
{/if}
