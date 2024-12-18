{.passC: gorge("pkg-config --cflags Louvre").}
{.passL: gorge("pkg-config --libs Louvre").}

{.passC: gorge("pkg-config --cflags wayland-server").}
{.passL: gorge("pkg-config --libs wayland-server").}

import louvre/[compositor, namespaces]

export compositor, namespaces
