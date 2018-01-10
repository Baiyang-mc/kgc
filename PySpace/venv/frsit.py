#!/usr/bin/python
print("你好，世界");


#!/usr/bin/python
# -*- coding: UTF-8 -*-
# 文件名：test.py

if True:
    print("Answer")
    print("True")
else:
    print ("Answer")
    # 没有严格缩进，在执行时会报错
    print ("False")

    import pygame
    from pygame.locals import *


    class Brush():
        def __init__(self):
            pass


    class Painter():
        def __init__(self):
            self.screen = pygame.display.set_mode((800, 600))
            pygame.display.set_caption("Painter")
            self.clock = pygame.time.Clock()

        def run(self):
            self.screen.fill((255, 255, 255))
            while True:
                # max fps limit
                self.clock.tick(30)
                for event in pygame.event.get():
                    if event.type == QUIT:
                        return
                    elif event.type == KEYDOWN:
                        pass
                    elif event.type == MOUSEBUTTONDOWN:
                        pass
                    elif event.type == MOUSEMOTION:
                        pass
                    elif event.type == MOUSEBUTTONUP:
                        pass

                pygame.display.update()


    if __name__ == '__main__':
        app = Painter()
        app.run()

    import pygame
    from pygame.locals import *


    class Brush():
        def __init__(self):
            pass


    class Painter():
        def __init__(self):
            self.screen = pygame.display.set_mode((800, 600))
            pygame.display.set_caption("Painter")
            self.clock = pygame.time.Clock()

        def run(self):
            self.screen.fill((255, 255, 255))
            while True:
                # max fps limit
                self.clock.tick(30)
                for event in pygame.event.get():
                    if event.type == QUIT:
                        return
                    elif event.type == KEYDOWN:
                        pass
                    elif event.type == MOUSEBUTTONDOWN:
                        pass
                    elif event.type == MOUSEMOTION:
                        pass
                    elif event.type == MOUSEBUTTONUP:
                        pass

                pygame.display.update()


    if __name__ == '__main__':
        app = Painter()
        app.run()
