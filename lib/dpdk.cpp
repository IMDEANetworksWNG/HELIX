/*
#include <rte_eal.h>
#include <rte_ethdev.h>
#include <rte_mbuf.h>
#include <rte_ip.h>
#include <rte_udp.h>
#include <iostream>
#include <cstring>

#define NUM_MBUFS 8191
#define MBUF_CACHE_SIZE 250
#define BURST_SIZE 32

static const struct rte_eth_conf port_conf_default = {
        .rxmode = {
                .max_rx_pkt_len = RTE_ETHER_MAX_LEN,
        },
};

class DPDKApp {
public:
    DPDKApp() : port_id(0), mbuf_pool(nullptr) {}

    void init(int argc, char *argv[]) {
        int ret = rte_eal_init(argc, argv);
        if (ret < 0) {
            throw std::runtime_error("Error with EAL initialization");
        }

        mbuf_pool = rte_pktmbuf_pool_create("MBUF_POOL", NUM_MBUFS * 2, MBUF_CACHE_SIZE, 0, RTE_MBUF_DEFAULT_BUF_SIZE, rte_socket_id());
        if (mbuf_pool == nullptr) {
            throw std::runtime_error("Cannot create mbuf pool");
        }

        struct rte_eth_conf port_conf = port_conf_default;
        ret = rte_eth_dev_configure(port_id, 1, 1, &port_conf);
        if (ret != 0) {
            throw std::runtime_error("Cannot configure device");
        }

        ret = rte_eth_rx_queue_setup(port_id, 0, 128, rte_eth_dev_socket_id(port_id), nullptr, mbuf_pool);
        if (ret < 0) {
            throw std::runtime_error("rte_eth_rx_queue_setup failed");
        }

        ret = rte_eth_tx_queue_setup(port_id, 0, 128, rte_eth_dev_socket_id(port_id), nullptr);
        if (ret < 0) {
            throw std::runtime_error("rte_eth_tx_queue_setup failed");
        }

        ret = rte_eth_dev_start(port_id);
        if (ret < 0) {
            throw std::runtime_error("rte_eth_dev_start failed");
        }

        rte_eth_promiscuous_enable(port_id);
    }

    void send_udp_packet() {
        struct rte_mbuf *mbuf = rte_pktmbuf_alloc(mbuf_pool);
        if (mbuf == nullptr) {
            std::cerr << "Failed to allocate mbuf" << std::endl;
            return;
        }

        // Ethernet Header
        struct rte_ether_hdr *eth_hdr = rte_pktmbuf_mtod(mbuf, struct rte_ether_hdr *);
        rte_eth_macaddr_get(port_id, &eth_hdr->s_addr);
        rte_ether_addr_copy(&eth_hdr->s_addr, &eth_hdr->d_addr);
        eth_hdr->ether_type = rte_cpu_to_be_16(RTE_ETHER_TYPE_IPV4);

        // IP Header
        struct rte_ipv4_hdr *ip_hdr = reinterpret_cast<struct rte_ipv4_hdr *>(eth_hdr + 1);
        ip_hdr->version_ihl = RTE_IPV4_VHL_DEF;
        ip_hdr->type_of_service = 0;
        ip_hdr->total_length = rte_cpu_to_be_16(sizeof(struct rte_ipv4_hdr) + sizeof(struct rte_udp_hdr) + sizeof("Hello, DPDK!"));
        ip_hdr->packet_id = 0;
        ip_hdr->fragment_offset = 0;
        ip_hdr->time_to_live = 64;
        ip_hdr->next_proto_id = IPPROTO_UDP;
        ip_hdr->hdr_checksum = 0; // Offloaded later
        ip_hdr->src_addr = rte_cpu_to_be_32(IPv4(192, 168, 0, 1)); // Example source IP
        ip_hdr->dst_addr = rte_cpu_to_be_32(IPv4(192, 168, 0, 2)); // Example destination IP

        // UDP Header
        struct rte_udp_hdr *udp_hdr = reinterpret_cast<struct rte_udp_hdr *>(ip_hdr + 1);
        udp_hdr->src_port = rte_cpu_to_be_16(12345); // Example source port
        udp_hdr->dst_port = rte_cpu_to_be_16(23456); // Example destination port
        udp_hdr->dgram_len = rte_cpu_to_be_16(sizeof(struct rte_udp_hdr) + sizeof("Hello, DPDK!"));
        udp_hdr->dgram_cksum = 0; // Optional

        // Payload
        char *data = reinterpret_cast<char *>(udp_hdr + 1);
        std::strncpy(data, "Hello, DPDK!", sizeof("Hello, DPDK!"));

        // Packet length
        mbuf->l2_len = sizeof(struct rte_ether_hdr);
        mbuf->l3_len = sizeof(struct rte_ipv4_hdr);
        mbuf->l4_len = sizeof(struct rte_udp_hdr);
        mbuf->data_len = mbuf->l2_len + mbuf->l3_len + mbuf->l4_len + sizeof("Hello, DPDK!");
        mbuf->pkt_len = mbuf->data_len;

        // Send the packet
        const uint16_t nb_tx = rte_eth_tx_burst(port_id, 0, &mbuf, 1);
        if (nb_tx != 1) {
            rte_pktmbuf_free(mbuf);
            std::cerr << "Failed to send packet" << std::endl;
        }
    }

    void run() {
        while (true) {
            send_udp_packet();
            rte_delay_ms(1000); // Send a packet every second
        }
    }

    ~DPDKApp() {
        rte_eth_dev_stop(port_id);
        rte_eth_dev_close(port_id);
        rte_eal_cleanup();
    }

private:
    uint16_t port_id;
    struct rte_mempool *mbuf_pool;
};

int main(int argc, char *argv[]) {
    try {
        DPDKApp app;
        app.init(argc, argv);
        app.run();
    } catch (const std::exception &ex) {
        std::cerr << ex.what() << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}*/
