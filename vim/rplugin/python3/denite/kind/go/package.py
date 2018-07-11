
from denite.kind.file import Kind as File


class Kind(File):

    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'go/package'
        self.default_action = 'import'

    def action_import(self, context):
        for target in context['targets']:
            self.vim.command('GoImport {}'.format(target['word']))