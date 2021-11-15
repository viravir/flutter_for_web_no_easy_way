import { NativeVideoPlayerPlugin } from './nativeVideoPlayerPlugin';

declare global {
  interface Window {
    NativeVideoPlayerPlugin: NativeVideoPlayerPlugin;
  }
}

window['NativeVideoPlayerPlugin'] = new NativeVideoPlayerPlugin();
