;; Este arquivo de canal pode ser passado para "guix pull -C" ou
;; para "guix time-machine -C" para obter a revisão do Guix que foi
;; usada para popular este perfil.

(list
     ;; Nota: estes outros commits também foram usados para instalar alguns dos pacotes neste perfil:
     ;;   "325fed4c1514bffd084355455710fcc3f1c8da2c"
     ;;   "bcd627f58e74ce44cc96a9aac37c6d9e9e3c0dcc"
     ;;   "e13f7d48e5b989f5dbd27c19ac81989ec6b3ec6e"
     ;;   "bab73e413b3421f4aa051e9438d147040a52e1be"
     ;;   "0eb3546d5a988d8d7ced886622a49b4c1ea1bede"
     ;;   "612e4dd98f7d1d015e405af9d029bede3fe3c280"
     ;;   "e66b8d0534acc55264470cf22fe0af111df52347"
     ;;   "c81ed0970007810a4662edbc3474f5afc656fe95"
     ;;   "a1d711c92e119f6b5b8e99a620cdba92a4ca3bfb"
     ;;   "0485e3a4a6b33c5efe5367a04ba86f3563afd1e8"
     (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
         "a800c49fb767f549fbc0eefe8dce6daa5da8604c")
       (introduction
         (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
             "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
     (channel
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix")
       (branch "master")
       (commit
         "831f3ff14260e20d4da31b707515891eeb49e752")
       (introduction
         (make-channel-introduction
           "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
           (openpgp-fingerprint
             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
)
