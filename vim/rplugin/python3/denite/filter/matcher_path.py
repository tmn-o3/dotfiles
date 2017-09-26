
import re

from denite.util import split_input

from .base import Base


class Filter(Base):
    def __init__(self, vim):
        super().__init__(vim)

        self.name = 'matcher_path'
        self.description = ''

    def filter(self, context):
        candidates = context['candidates']
        if context['input'] == '':
            return candidates
        ignorecase = context['ignorecase']
        pattern = context['input']
        if ignorecase:
            pattern = pattern.lower()
            candidates = [x for x in candidates
                          if pattern in x['action__path'].lower()]
        else:
            candidates = [
                x for x in candidates if pattern in x['action__path']
            ]
        return candidates

    def convert_pattern(self, input_str):
        return '|'.join([re.escape(x) for x in split_input(input_str)])