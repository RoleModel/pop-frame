# Change Log

## [v0.1.1] Oct 12, 2026

- Add browser support details to the README (#1)
- Use the shared release workflow from RoleModel/actions (#2)

## [v0.1.0] Oct 9, 2026

- `pop_frame_tag(id, src) { trigger }` renders a button that opens a native popover holding a Turbo
  Frame. The frame loads `src` (anything `url_for` takes) the first time the popover opens, and
  reloads in place on a morph refresh, staying open. `pop_frame.css` anchors the popover to its
  button.

[v0.1.1]: https://github.com/RoleModel/pop-frame/releases/tag/v0.1.1
[v0.1.0]: https://github.com/RoleModel/pop-frame/releases/tag/v0.1.0
