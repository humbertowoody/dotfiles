if !exists('g:lspconfig')
  finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  
  -- Mappings.
  local opts = { noremap = true, silent = true }
  
  buf_set_keymap('n','gd', '<Cmd>lua.vim.lsp.buf.definition()<CR>', opts)

  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  require 'completion'.on_attach(client, bufnr)

   --protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
  }
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

-- For Python (?)
nvim_lsp.pyright.setup{
  on_attach = on_attach,
  filetypes = { "python" }
}

nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  filetypes = { "python" }
}

-- For Terraform (?)
nvim_lsp.terraformls.setup{
  on_attach = on_attach,
  filetypes = { "terraform" }
}

-- For Docker (?)
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" }
}

-- For LaTex (?)
nvim_lsp.texlab.setup{
  on_attach = on_attach, 
  filetypes = { "tex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = false,
        onSave = false
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = true 
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true 
      }
    }
  }
}

-- For HTML (?)
nvim_lsp.html.setup{
  capabilities = {
    offsetEncoding = { "utf-8", "utf-16" },
    textDocument = {
      completion = {
        completionItem = {
          commitCharactersSupport = false,
          deprecatedSupport = false,
          documentationFormat = { "markdown", "plaintext" },
          preselectSupport = false,
          snippetSupport = false
        },
        completionItemKind = {
          valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
        },
        contextSupport = false,
        dynamicRegistration = false
      },
      documentHighlight = {
        dynamicRegistration = false
      },
      documentSymbol = {
        dynamicRegistration = false,
        hierarchicalDocumentSymbolSupport = true,
        symbolKind = {
          valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26 }
        }
      },
      hover = {
        contentFormat = { "markdown", "plaintext" },
        dynamicRegistration = false
      },
      references = {
        dynamicRegistration = false
      },
      signatureHelp = {
        dynamicRegistration = false,
        signatureInformation = {
          documentationFormat = { "markdown", "plaintext" }
        }
      },
      synchronization = {
        didSave = true,
        dynamicRegistration = false,
        willSave = false,
        willSaveWaitUntil = false
      }
    }
  },
  cmd = { "html-languageserver", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  on_attach = on_attach,
}

EOF

