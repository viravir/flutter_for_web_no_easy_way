import 'shaka-player';

const videoHlsSrc =
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

export class NativeVideoPlayerPlugin {
  private players: Map<string, shaka.Player> = new Map();

  /**
   * Methods for players manipulation
   *
   */
  async init(playerId: string): Promise<void> {
    const existingPlayer = this.players.get(playerId);

    if (existingPlayer) {
      await Promise.all([
        existingPlayer.unload(),
        existingPlayer.load(videoHlsSrc),
      ]);
      return;
    }
    const playerVideoElement = this.findPlayerElement(playerId);

    if (!playerVideoElement) throw Error('Cannot find player video element');

    const newPlayer = new shaka.Player(playerVideoElement);
    this.players.set(playerId, newPlayer);

    await newPlayer.load(videoHlsSrc);
  }
  async dispose(playerId: string): Promise<void> {
    const player = this.players.get(playerId);

    await player?.destroy();
    this.players.delete(playerId);
  }
  async play(playerId: string): Promise<void> {
    const player = this.players.get(playerId);
    player?.getMediaElement()?.play();
  }
  async pause(playerId: string): Promise<void> {
    const player = this.players.get(playerId);
    player?.getMediaElement()?.pause();
  }

  /**
   * Methods that interact with the document
   */
  private findPlayerElement(playerId: string): HTMLVideoElement | undefined {
    // Why not try to get it directly? It's in the DOM, right?
    const possibleDirectDomChild = document.querySelector(`video#${playerId}`);

    if (possibleDirectDomChild)
      return possibleDirectDomChild as HTMLVideoElement;

    // Okay, we have tp go through each platform view shadow dom out there :(
    const flutterPlatformViews =
      document.getElementsByTagName('flt-platform-view');

    for (const flutterPlatformView of flutterPlatformViews) {
      const possibleShadowDomChild =
        flutterPlatformView.shadowRoot?.querySelector(`video#${playerId}`);

      if (possibleShadowDomChild) {
        // Found it!
        return possibleShadowDomChild as HTMLVideoElement;
      }
    }

    return undefined;
  }
}
