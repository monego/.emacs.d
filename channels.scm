;; Este arquivo de canal pode ser passado para "guix pull -C" ou
;; para "guix time-machine -C" para obter a revisão do Guix que foi
;; usada para popular este perfil.

(list
     ;; Nota: estes outros commits também foram usados para instalar alguns dos pacotes neste perfil:
     ;;   "b386c11e7804e0b577411d930b60f1e0a4a0382c"
     ;;   "570ef13a87bb54d3410c431700ba78316a2641e2"
     ;;   "2823253484e49391c6ba3c653a2f9e9f5e5f38ae"
     ;;   "dae418afd70155b59ee4740edb044c35b7b52536"
     (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
         "c8556379c3f2d3d095a178858915720f2eebc012")
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
         "5baccd1d72594b4c85e958c2f34cac923345acb3")
       (introduction
         (make-channel-introduction
           "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
           (openpgp-fingerprint
             "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
)
