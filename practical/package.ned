package practical;

import inet.networklayer.autorouting.FlatNetworkConfigurator;
import inet.nodes.wireless.WirelessAPWithEth;
import inet.nodes.inet.StandardHost;
import inet.nodes.inet.Router;
import inet.nodes.wireless.WirelessAP;
import inet.nodes.ethernet.EtherHost2;
import inet.world.ChannelControl;
import inet.nodes.adhoc.MFMobileHost;

@license(LGPL);

network MobileNet
{
    parameters:
        double playgroundSizeX;
        double playgroundSizeY;

        @display("bgb=450,174");
    submodules:
        host[10]: MFMobileHost {
            parameters:
                @display("r=,,#707070;p=230,61");
        }
        channelcontrol: ChannelControl {
            parameters:
                playgroundSizeX = playgroundSizeX;
                playgroundSizeY = playgroundSizeY;
                @display("p=43,138");
        }
        server: StandardHost {
            @display("p=420,60");
        }
        client: StandardHost {
            @display("p=43,60");
        }
        wirelessAPWithEth1: WirelessAPWithEth {
            @display("p=125,60");
        }
        wirelessAPWithEth2: WirelessAPWithEth {
            @display("p=342,60");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=373,139");
        }
    connections:
        client.ethg++ <--> wirelessAPWithEth1.ethg++;
        server.ethg++ <--> wirelessAPWithEth2.ethg++;

}
