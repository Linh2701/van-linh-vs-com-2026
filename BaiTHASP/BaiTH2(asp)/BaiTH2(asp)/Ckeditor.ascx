<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ckeditor.ascx.cs" Inherits="BaiTH2_asp_.Ckeditor" %>
<style>
    .ck-editor {
        width: 700px !important;
        max-width: 100%;
    }

    .ck-editor__editable {
        min-height: 250px !important;
        max-height: 400px !important;
        overflow-y: auto !important;
        overflow-x: hidden !important;
        overflow-wrap: anywhere;
    }

    .ck.ck-toolbar {
        border-radius: 6px 6px 0 0;
    }

    .ck-editor__editable {
        border-radius: 0 0 6px 6px;
    }
</style>

<asp:TextBox
    ID="txtMoTa"
    runat="server"
    TextMode="MultiLine" OnTextChanged="txtMoTa_TextChanged">
</asp:TextBox>

<script src="<%= ResolveUrl("~/CKEditor/ckeditor5/ckeditor5.umd.js") %>"></script>

<script>
    const {
        ClassicEditor,

        Essentials,
        Paragraph,

        Heading,

        Bold,
        Italic,
        Underline,
        Strikethrough,
        Subscript,
        Superscript,

        Font,
        FontSize,
        FontFamily,
        FontColor,
        FontBackgroundColor,

        Alignment,

        Link,
        AutoLink,

        List,
        TodoList,
        Indent,
        IndentBlock,

        BlockQuote,

        HorizontalLine,

        Code,
        CodeBlock,

        RemoveFormat,

        Table,
        TableToolbar,

        MediaEmbed,

        SpecialCharacters,
        SpecialCharactersEssentials,

        SourceEditing,

        FindAndReplace,

        SelectAll,

        WordCount,

        Autoformat
    } = CKEDITOR;


    ClassicEditor
        .create(
            document.querySelector('#<%= txtMoTa.ClientID %>'),
            {
                licenseKey: 'GPL',

                plugins: [

                    Essentials,
                    Paragraph,

                    Heading,

                    Bold,
                    Italic,
                    Underline,
                    Strikethrough,
                    Subscript,
                    Superscript,

                    Font,
                    FontSize,
                    FontFamily,
                    FontColor,
                    FontBackgroundColor,

                    Alignment,

                    Link,
                    AutoLink,

                    List,
                    TodoList,
                    Indent,
                    IndentBlock,

                    BlockQuote,

                    HorizontalLine,

                    Code,
                    CodeBlock,

                    RemoveFormat,

                    Table,
                    TableToolbar,

                    MediaEmbed,

                    SpecialCharacters,
                    SpecialCharactersEssentials,

                    SourceEditing,

                    FindAndReplace,

                    SelectAll,

                    WordCount,

                    Autoformat
                ],

                toolbar: {
                    items: [

                        'undo',
                        'redo',
                        '|',

                        'heading',
                        '|',

                        'fontFamily',
                        'fontSize',
                        'fontColor',
                        'fontBackgroundColor',
                        '|',

                        'bold',
                        'italic',
                        'underline',
                        'strikethrough',
                        'subscript',
                        'superscript',
                        '|',

                        'alignment',
                        '|',

                        'bulletedList',
                        'numberedList',
                        'todoList',
                        '|',

                        'outdent',
                        'indent',
                        '|',

                        'link',
                        'blockQuote',
                        'insertTable',
                        'mediaEmbed',
                        'horizontalLine',
                        '|',

                        'specialCharacters',
                        '|',

                        'code',
                        'codeBlock',
                        '|',

                        'findAndReplace',
                        'selectAll',
                        'removeFormat',
                        '|',

                        'sourceEditing'
                    ],

                    shouldNotGroupWhenFull: false
                },

                heading: {
                    options: [
                        {
                            model: 'paragraph',
                            title: 'Đoạn văn',
                            class: 'ck-heading_paragraph'
                        },
                        {
                            model: 'heading1',
                            view: 'h1',
                            title: 'Tiêu đề 1',
                            class: 'ck-heading_heading1'
                        },
                        {
                            model: 'heading2',
                            view: 'h2',
                            title: 'Tiêu đề 2',
                            class: 'ck-heading_heading2'
                        },
                        {
                            model: 'heading3',
                            view: 'h3',
                            title: 'Tiêu đề 3',
                            class: 'ck-heading_heading3'
                        },
                        {
                            model: 'heading4',
                            view: 'h4',
                            title: 'Tiêu đề 4',
                            class: 'ck-heading_heading4'
                        }
                    ]
                },

                fontSize: {
                    options: [
                        10,
                        12,
                        14,
                        'default',
                        18,
                        20,
                        24,
                        28,
                        32
                    ]
                },

                fontFamily: {
                    options: [
                        'default',
                        'Arial, Helvetica, sans-serif',
                        'Courier New, Courier, monospace',
                        'Georgia, serif',
                        'Tahoma, Geneva, sans-serif',
                        'Times New Roman, Times, serif',
                        'Verdana, Geneva, sans-serif'
                    ]
                },

                fontColor: {
                    colors: [
                        {
                            color: '#000000',
                            label: 'Đen'
                        },
                        {
                            color: '#FF0000',
                            label: 'Đỏ'
                        },
                        {
                            color: '#0000FF',
                            label: 'Xanh'
                        },
                        {
                            color: '#008000',
                            label: 'Xanh lá'
                        },
                        {
                            color: '#FFA500',
                            label: 'Cam'
                        },
                        {
                            color: '#800080',
                            label: 'Tím'
                        },
                        {
                            color: '#808080',
                            label: 'Xám'
                        },
                        {
                            color: '#FFFFFF',
                            label: 'Trắng'
                        }
                    ]
                },

                fontBackgroundColor: {
                    colors: [
                        {
                            color: '#FFFF00',
                            label: 'Vàng'
                        },
                        {
                            color: '#00FFFF',
                            label: 'Xanh nhạt'
                        },
                        {
                            color: '#FFC0CB',
                            label: 'Hồng'
                        },
                        {
                            color: '#90EE90',
                            label: 'Xanh lá nhạt'
                        },
                        {
                            color: '#D3D3D3',
                            label: 'Xám nhạt'
                        }
                    ]
                },

                alignment: {
                    options: [
                        'left',
                        'center',
                        'right',
                        'justify'
                    ]
                },

                link: {
                    decorators: {
                        openInNewTab: {
                            mode: 'manual',
                            label: 'Mở liên kết trong tab mới',
                            defaultValue: true,
                            attributes: {
                                target: '_blank',
                                rel: 'noopener noreferrer'
                            }
                        }
                    }
                },

                table: {
                    contentToolbar: [
                        'tableColumn',
                        'tableRow',
                        'mergeTableCells'
                    ]
                },

                mediaEmbed: {
                    previewsInData: true
                },

                codeBlock: {
                    languages: [
                        {
                            language: 'plaintext',
                            label: 'Văn bản'
                        },
                        {
                            language: 'csharp',
                            label: 'C#'
                        },
                        {
                            language: 'javascript',
                            label: 'JavaScript'
                        },
                        {
                            language: 'html',
                            label: 'HTML'
                        },
                        {
                            language: 'css',
                            label: 'CSS'
                        },
                        {
                            language: 'sql',
                            label: 'SQL'
                        },
                        {
                            language: 'java',
                            label: 'Java'
                        }
                    ]
                },

                list: {
                    properties: {
                        styles: true,
                        startIndex: true,
                        reversed: true
                    }
                },

                placeholder: 'Nhập nội dung mô tả sách...'
            }
        )
        .then(editor => {

            window.ckeditorEditor = editor;

            console.log('CKEditor đã khởi tạo thành công');

        })
        .catch(error => {

            console.error('Lỗi CKEditor:', error);

        });
</script>