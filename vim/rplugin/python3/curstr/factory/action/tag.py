

from typing import List  # noqa

from curstr.action_group.base import ActionGroup
from curstr.action_group.nothing import Nothing
from curstr.action_group.tag import Tag
from curstr.options import Options

from .base import ActionFactory as Base


class ActionFactory(Base):

    def _create_action_group(self, options: Options) -> ActionGroup:
        word = self._vim.call('expand', '<cword>')

        contained = []  # type: List[str]
        append = contained.append
        for tag in self._vim.call('taglist', word):
            name = tag['name']
            if name == word:
                return Tag(self._vim, word)

            append(name)

        if not contained:
            return Nothing(self._vim)

        return Tag(self._vim, contained.pop())