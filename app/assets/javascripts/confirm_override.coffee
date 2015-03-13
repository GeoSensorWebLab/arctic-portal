# Override Rails handling of confirmation

$.rails.allowAction = (element) ->
  message = element.data('confirm')
  return true unless message

  $link = element.clone()
    .removeAttr('class')
    .removeAttr('data-confirm')
    .addClass('btn').addClass('btn-danger')
    .html("Yes, I'm positively certain.")

  modal_html = """
               <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                   <a class="close" data-dismiss="modal">×</a>
                   <h3>#{message}</h3>
                 </div>
                 <div class="modal-body">
                   <p>Are you sure you want to do this?</p>
                   <p>There's no turning back.</p>
                 </div>
                 <div class="modal-footer">
                   <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                 </div>
               </div>
              </div>
             </div>
               """
  $modal_html = $(modal_html)
  $modal_html.find('.modal-footer').append($link)
  $modal_html.modal()
  return false
