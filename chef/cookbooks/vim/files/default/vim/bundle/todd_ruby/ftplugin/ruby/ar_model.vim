" Vim filetype plugin
" Language:  Ruby
" Maintainer:  Todd Blackman
" Last Change:  2013 May 1
" Dependencies: DBext and vim-rails

function! s:default_tables()
  " WIP: Pull from database
  return [ 'auth_user', 'blacklists', 'blog_assets', 'blog_posts', 'blogs', 'bookmark', 'bookmark_counts', 'bookmarks', 'calendar', 'comment', 'comments', 'composed_image_jobs', 'content_snippets', 'delayed_jobs', 'external_app_externalapp', 'external_app_externalpushpin', 'external_app_gigatag', 'external_apps', 'external_pushpins', 'external_snapshots', 'featured_galleries', 'feedback_types', 'forums', 'galleries', 'gallery_entries', 'gear', 'gears', 'gears_gigapans', 'gigapan', 'gigapan_comment_counts', 'gigapans', 'gigatag_credits', 'gigatag_logos', 'gigatag_stats', 'gigatags', 'groups', 'groups_users', 'home_block_elements', 'home_blocks', 'invitations', 'keyframes', 'messages', 'messages_message', 'moderatorships', 'monitorships', 'notification_noticesetting', 'page_views', 'pages', 'posts', 'print_settings', 'printable_options', 'pro_profiles', 'products', 'rate_stats', 'rates', 'roles', 'roles_users', 'schema_migrations', 'scoring_factors', 'site_pages', 'snapshot', 'snapshot_comment', 'snapshot_comment_counts', 'snapshot_counts', 'snapshots', 'social_userprofile', 'subscriptions', 'tag_gigapan', 'tag_user', 'taggings', 'tags', 'topics', 'tour_entries', 'tours', 'users']
endfunction

function! s:get_table_name()
  return rails#pluralize(expand('%:t:r'))
endfunction

function! s:table_choices(arg_lead, cmd_line, cursor_pos)
  let start_list = [s:get_table_name()]  + s:default_tables()
  let compare_str = "v:val =~ '^" . a:arg_lead . "'"
  return filter(start_list, compare_str)
endfunction

function! s:get_model(...)
  if strlen(a:1) == 0
    let l:table_name = s:get_table_name()
  else
    let l:table_name = a:1
  endif

  call dbext#DB_execSql('show create table ' . table_name . '\G')
endfunction

command! -complete=customlist,s:table_choices -nargs=* -buffer Model call s:get_model(<q-args>)
