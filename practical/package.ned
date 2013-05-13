package practical;

import inet.examples.wireless.throughput.WirelessAPWithSink;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.inet.AdhocHost;
import inet.nodes.inet.StandardHost;
import inet.nodes.wireless.AccessPoint;
import inet.world.radio.ChannelControl;
import ned.DatarateChannel;


@license(LGPL);

network MobileNet
{
    @display("bgb=700,600");
    types:
        channel C extends DatarateChannel
        {
            datarate = 10Mbps;
            delay = 0.1us;
        }
    submodules:
        gwHost1: AdhocHost {
            @display("p=100,250");
        }
        gwHost2: AdhocHost {
            @display("p=600,250");
        }
        adhocHost[10]: AdhocHost {
            @display("p=203,29");
        }
        server: StandardHost {
            @display("p=25,150");
        }
        client: StandardHost {
            @display("p=650,250");
        }
        flatNetworkConfigurator: IPv4NetworkConfigurator {
            @display("p=50,550");
        }
        channelControl: ChannelControl {
            @display("p=150,550");
        }

    connections allowunconnected:
        server.ethg++ <--> C <--> gwHost1.ethg++;
        client.ethg++ <--> C <--> gwHost2.ethg++;
}
