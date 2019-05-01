//= require rails-ujs
//require jquery3

//= require comfy/vendor/codemirror
//= require comfy/vendor/codemirror/mode/css/css
//= require comfy/vendor/codemirror/mode/htmlmixed/htmlmixed
//= require comfy/vendor/codemirror/mode/javascript/javascript
//= require comfy/vendor/codemirror/mode/markdown/markdown
//= require comfy/vendor/codemirror/mode/xml/xml
//= require comfy/vendor/codemirror/addon/edit/closetag
//= require comfy/vendor/sortable.min

//= require comfy/vendor/diff/diff_match_patch.min
//= require comfy/vendor/diff/pretty_text_diff
//= require comfy/vendor/fontawesome
//= require comfy/vendor/redactor
//= require comfy/vendor/redactor/filemanager
//= require comfy/vendor/redactor/imagemanager
//= require comfy/vendor/redactor/definedlinks
//= require comfy/vendor/redactor/table
//= require comfy/vendor/redactor/video
//= require_directory ../../vendor/redactor/i18n/
//= require comfy/vendor/flatpickr.min
//= require_directory ../../vendor/flatpickr/i18n/

//= require comfy/admin/cms/base
//= require comfy/admin/cms/categories
//= require comfy/admin/cms/codemirror
//= require comfy/admin/cms/diff
//= require comfy/admin/cms/file_link
//= require comfy/admin/cms/file_upload
//= require comfy/admin/cms/files_modal
//= require comfy/admin/cms/page_fragments
//= require comfy/admin/cms/sortable_list
//= require comfy/admin/cms/slugify
//= require comfy/admin/cms/timepicker
//= require comfy/admin/cms/wysiwyg

//= require jquery.remotipart

//= require comfy/admin/cms/custom


$('#comfy .btn.btn-secondary').addClass('btn-success');
$('#comfy .btn-group.btn-group-sm .btn-outline-secondary').addClass('btn-primary');

$('#comfy .btn-group.btn-group-sm').each(function () {
  var edits = $('.btn.btn-outline-secondary.btn-primary', this);
  if (edits.size() == 2) {
    $('.btn.btn-outline-secondary.btn-primary:nth-child(1)', this).html('<span class="icon icon-add"></span>');
    $('.btn.btn-outline-secondary.btn-primary:nth-child(2)', this).html('<span class="icon icon-edit"></span>');
  } else {
    $('.btn.btn-outline-secondary.btn-primary', this).html('<span class="icon icon-edit"></span>');
  }
  $('.btn.btn-danger', this).html('<span class="icon icon-delete"></span>');
});
