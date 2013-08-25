node default {
  hiera_include('classes','')
}

## Import our manifests
import "classes/*"