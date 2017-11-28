document.addEventListener("turbolinks:load", function() {
  if(null === document.querySelector('.ql-toolbar')) {
    var quill = new Quill('#editor', {
      modules: {
        toolbar: [
          [{ header: [1, 2, 3, false] }],
          ['bold', 'italic'],
          ['link', 'image', 'video'],
          [{ list: 'ordered'}, { list: 'bullet' }]
        ]
      },
      theme: 'snow'
    });

    var form = document.querySelector('form');
    form.onsubmit = function() {
      var content = document.querySelector('#post_content');
      content.value = quill.root.innerHTML;

      /* A "blank" quill isn't actually blank, it contains "<p><br></p>"
       * as its HTML. Our validation only catches empty posts, so we convert
       * it here
       */
      if(content.value === '<p><br></p>')
        content.value = '';
      form.submit();
    };
  }

  /* Turbolinks will cache the DOM elements created by quill.js, but not the
   * scripts that control them, so we end up with an extra, orphaned toolbar each
   * time we reload the page in a single turbolinks session. This function does
   * cleanup on the DOM to avoid this.
   */
  document.addEventListener('turbolinks:before-cache', function() {
    $(".ql-toolbar").remove();
  });
});
