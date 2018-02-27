
from denite.source.base import Base


class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'curstr/help'
        self.kind = 'command'

    def gather_candidates(self, context):
        return [
            {
                'word': w,
                'action__command': 'help {}'.format(w)
            } for w in context['curstr__targets']
        ]