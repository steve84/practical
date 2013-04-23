package practical;

import inet.examples.wireless.throughput.WirelessAPWithSink;
import inet.networklayer.autorouting.ipv4.FlatNetworkConfigurator;
import inet.nodes.inet.AdhocHost;
import inet.nodes.inet.StandardHost;
import inet.nodes.wireless.AccessPoint;
import inet.world.radio.ChannelControl;
import ned.DatarateChannel;


@license(LGPL);

network MobileNet
{
    @display("bgb=433,167");
    types:
        channel C extends DatarateChannel
        {
            datarate = 10Mbps;
            delay = 0.1us;
        }    
    submodules:
        accessPoint1: AccessPoint {
            @display("p=116,29");
        }
        accessPoint2: AccessPoint {
            @display("p=298,29");
        }
        adhocHost[10]: AdhocHost {
            @display("p=203,29");
        }
        server: StandardHost {
            @display("p=31,29");
        }
        client: StandardHost {
            @display("p=391,29");
        }
        flatNetworkConfigurator: FlatNetworkConfigurator {
            @display("p=329,93");
        }
        channelControl: ChannelControl {
            @display("p=67,93");
        }

    connections:
        server.ethg++ <--> C <--> accessPoint1.ethg++;
        client.ethg++ <--> C <--> accessPoint2.ethg++;
}
