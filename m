Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484036;
	b=KNF1GAP2/cllvRxVmqAUeAQnsW5XfyabblLzwMxzQJduK96n7k1T/cXrPb+VaP2Eqdpg
	 uTXXniMG7zli2cbCgPiwEn0rZfVPQx8ZEh2A4HtY/FcjQl6RCFEWtFK+PJKlO0aPhcslg
	 PCfVc7TVdUDVz5CBV4BTpF34ot4NDTtn1bIcUURAtDS572RgPeHezVinStB1gSfZPT29N
	 q1mvPvUUwcdLWyZUhQEffnIXWo0NxKlAaOIencMqDwol8Q6xRje81MbMPSMwmarX3KpUX
	 SB/5kB3aeTP54MAV4s308O7yY8HaoNwjkKsCsI08D4kyEG2BLQBp/nqYwYwhxWr6Mbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484036;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=d7m7HVJOhtX+DCuQTIUO8zHvldU1qVZx8CQyQENA6bs=;
	b=O/XGl/OA7d4z8zu7sKcoIQJ5Mw3v1w5grwu4f+NwEWQneWl6ux8+ynw0O35TL0oDYKsL
	 kxd+DpxceUls/USAh3eskfkKfDrL1VwN7q6F6cCQGo8euGswgLVemFzUPYBKOg3uCfI0z
	 47OCip+eke4C+zZtN95AGjwWYD4LPcq/Oll/qvGsIwHsmESJWmibp+qwOjGM/P8lFDE1b
	 9dCW5nQmVy/BQ5SePhqc0Svwzq5f3NwAXBHFt1ClMTq83exgdg8EFSd8ud8rPsafj4ou3
	 MJ8pRK+29MRb/qBx+zbDQ7y0h9MHNj88qHnn4M9ElSHLwq2KqIZRID8PUEEO2e8I/OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtLSd9Px;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F3606A31E;
	Tue, 24 Nov 2026 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XtLSd9Px
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2171F000C4;
	Tue, 24 Nov 2026 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795484035;
	bh=d7m7HVJOhtX+DCuQTIUO8zHvldU1qVZx8CQyQENA6bs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XtLSd9Px4vWbCSo09M0U76E+DUQaqKzAAHg2tpv9Rx7hzkKKE/NFzjaUdGD+YwvAQ
	 44IZ1l+F8JeP8VMeYHcy8F2V+kDYrw6tLxfwv2SmELNBy0FgJn4/VvkFyVe/SIQj/L
	 YPX0RNMyNg16UeeqpJnTqAYWUgpPsgr95ZgGk0ssr/ZEabPNgiL+l778DpCpebiu2/
	 czrC0AQh+ExzpWqZjK5IUKnj8EJyPJ+nw3sbtXQrj7X4+1QTlpuZWysjth8rYgkvRX
	 4eY/KTqaozy1i62oArfuFuVQsU7Wn2SyjRjTePQDRKAOAJNh6YhunqDldcgTUDq1+p
	 Ovtk4qs60al2w==
Subject:
 Re: [PATCH net-next v5] net: stmmac: dwxgmac2: enable L2 split header support
From: netdev-bot+sashiko@kernel.org
To: sagar.cheluvegowda@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
 hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com
Date: Tue, 24 Nov 2026 01:33:54 +0000
Message-ID: <179548403438.3135.1804854034587814346@kernel.org>
In-Reply-To: <20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261120005243.3724402-1-sagar.cheluvegowda@oss.qualcomm.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The rewrite of dwxgmac2_get_rx_header_len() in
  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c is shared by…
- [Medium] In dwxgmac2_get_rx_header_len()
  (drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c), the header…
- [Medium] The new dwxgmac2_get_rx_header_len() reads the header length
  in two different ways under the same SPLM=L2OFST + SAVE_EN…
- [Low] dwxgmac2_config_l2_split()
  (drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c) sets SPLM =…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  extends it.

--

net: stmmac: dwxgmac2: enable L2 split header support

This adds a config_l2_split MAC callback and implements it for XGMAC2. On
enable it selects split at the L2 header offset, enables Split AV in
XGMAC_EXT_CFG1 and clears VPRE in XGMAC_EXT_CFG0. The callback is called
from stmmac_hw_setup(), stmmac_set_features() and stmmac_xdp_open() on split
header capable cores, and dwxgmac2_get_rx_header_len() is reworked to look
at FD/LD when reading the header length.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 09194b9d8322e..58d7433e8b17c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1412,6 +1412,25 @@ static int dwxgmac2_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
>  	return 0;
>  }
>  
> +static void dwxgmac2_config_l2_split(struct mac_device_info *hw, bool en)
> +{
> +	void __iomem *ioaddr = hw->pcsr;
> +	u32 value;
> +
> +	/* L2 split is not supported for packets with variable preamble */
> +	if (en) {
> +		value = readl(ioaddr + XGMAC_EXT_CFG0);
> +		value &= ~XGMAC_EXT_CFG0_VPRE;
> +		writel(value, ioaddr + XGMAC_EXT_CFG0);
> +	}
> +
> +	value = readl(ioaddr + XGMAC_EXT_CFG1);
> +	value &= ~(XGMAC_CONFIG1_SPLM_MASK | XGMAC_CONFIG1_SAVE_EN);
> +	if (en)
> +		value |= XGMAC_CONFIG1_SPLM(1) | XGMAC_CONFIG1_SAVE_EN;

[Severity: Low]
This isn't a bug, but should the commit message say that SPLM = L2OFST
moves the split point for all split header traffic, and not only for the
tagged or non-IP packets it talks about?

Untagged and VLAN stripped IPv4/IPv6 TCP/UDP frames were previously split
at the L3/L4 header boundary. With L2OFST they would be split right after
the EtherType. Commit d10f1a4e44c3 describes the same change for dwmac4.

stmmac_hw_setup() turns this on by default for every sph_capable XGMAC2
with RX checksum offload enabled. stmmac_rx() would then build the skb head
from the 14/18 byte MAC header only. The IP/L4 headers would have to be
pulled from the buffer 2 page fragment.

Could the commit message state that this changes the RX layout for IP
traffic on existing XGMAC2 users, and ideally include some throughput
numbers?

> +	writel(value, ioaddr + XGMAC_EXT_CFG1);
> +}
> +

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395bc..b28aa39f99472 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -292,8 +292,22 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
>  
>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
>  {
> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> +	u32 rdes3 = le32_to_cpu(p->des3);
> +
> +	/* HL is only defined on the first descriptor */
> +	if (!(rdes3 & XGMAC_RDES3_FD))
> +		return;
> +
> +	/* when FD=1 and LD=0, HL is RDES2[9:0] */
> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> +		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +		return;
> +	}

[Severity: Medium]
In hwif.c, the XGMAC2 entry and the XLGMAC entry both use
.desc = &dwxgmac210_desc_ops. So this parsing change applies to every
existing split header user, including XLGMAC, which never gets
config_l2_split.

If the databook statement in the commit message is right and L34T is only
valid on the last descriptor, then on FD=1/LD=0 descriptors the old code
tested an undefined field:

	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;

If L34T reads 0 there, hlen stays 0. stmmac_rx_buf1_len() then returns
dma_buf_sz for a header buffer that holds only HL valid bytes, so the skb
head would carry stale page data.

A remote peer can produce multi-descriptor split frames.
XGMAC_CORE_INIT_RX sets GPSLCE with GPSL = XGMAC_JUMBO_LEN (16368) whatever
the MTU, while dma_buf_sz is 1536 at MTU 1500.

Is this fixing an existing RX corruption bug inside a feature patch? If so,
could it go in a separate patch with a Fixes: tag so that stable picks it
up? The v5 changelog says the fix wording was removed on purpose. If the
old behaviour can't actually be reached, could the commit message say the
change is a no-op for existing configurations?

There is also the L2T branch further down. On XLGMAC, SPLM/SAVE_EN are
never set, yet non-IP last descriptors with L2T != 0 now take HL from
RDES2[9:2] >> 2. Are those bits guaranteed to be zero for frames XLGMAC
never split? "The callback is not implemented for XLGMAC" in the commit
message makes it sound as if XLGMAC is unaffected.

[Severity: Medium]
Is RDES2[9:0] the right layout here for non-IP frames?

This branch reads HL from RDES2[9:0] for every packet, although the packet
type isn't known on an FD=1/LD=0 descriptor. The FD=1/LD=1 non-IP branch
below uses (RDES2 & GENMASK(9, 2)) >> 2, because RDES2[1:0] carry AV
status.

The MAC may also write AV status into RDES2[1:0] of the first descriptor
for non-IP split frames. In that case a multi-descriptor non-IP/AV frame
would get HL read as roughly 4x the real value plus the status bits.
stmmac_rx_buf1_len() would return an oversized header length, and
stmmac_rx_buf2_len() would be off by the same amount.

For comparison, dwmac4_enable_sph() uses the same
GMAC_CONFIG1_SPLM(1) | GMAC_CONFIG1_SAVE_EN setup, and
dwmac4_get_rx_header_len() always reads RDES2[9:0]. Does the XGMAC
databook really make the HL bit layout depend on descriptor position?

> +
> +	if (rdes3 & XGMAC_RDES3_L34T)
>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +	else if (rdes3 & XGMAC_RDES3_L2T)
> +		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;

[Severity: Medium]
What happens here to non-IP frames whose L2 type is 0?

XGMAC_RDES3_L2T is GENMASK(19, 16), the same bits as XGMAC_RDES3_ET_LT, so
this check really means "L2 type != 0". In the LT encoding, 0 seems to be a
valid type: an IEEE 802.3 length encapsulated frame (LLC/SNAP, for example
STP BPDUs).

Suppose the MAC splits such a frame at the L2 offset with SPLM = L2OFST and
SAVE_EN set. Then *len stays 0, and stmmac_rx_buf1_len() skips this branch:

	if (priv->sph_active && hlen) {
		priv->xstats.rx_split_hdr_pkt_n++;
		return hlen;
	}

It returns min(dma_buf_sz, plen) instead, and stmmac_rx_buf2_len() returns
0. Wouldn't the skb then contain the split header followed by stale
page_pool data from buffer 1, with the real payload in buffer 2 dropped?

If HL is always 0 for frames the hardware doesn't split, could the L2T
check be dropped so that RDES2[9:2] is read for every non-IP FD=1/LD=1
descriptor? That would match the databook table cited in the commit
message.

>  }

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index f256244ce0d11..0c333d14be4d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -6467,6 +6469,7 @@ static int stmmac_set_features(struct net_device *netdev,
>  		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
>  		u8 chan;
>  
> +		stmmac_config_l2_split(priv, priv->hw, sph_en);
>  		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
>  			stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  	}

[Severity: High]
This is a pre-existing issue that this patch didn't introduce, but the
patch builds on it. When RX checksum offload is turned off,
stmmac_set_features() now also calls
stmmac_config_l2_split(priv, priv->hw, false). However, priv->sph_active
is never cleared. It is only assigned at probe and in stmmac_xdp.c.

stmmac_init_rx_buffers() and stmmac_rx_refill() keep buffer 2 programmed
through stmmac_rx_check_buf2_cap(). With split header off, the DMA fills
buffer 1 and then buffer 2 of each descriptor. Meanwhile
stmmac_rx_buf1_len() still does this for every non-first descriptor:

	if (priv->sph_active && len)
		return 0;

Take a frame larger than 2 * dma_buf_sz, for example more than 3072 bytes
at MTU 1500. XGMAC accepts it, since XGMAC_CORE_INIT_RX sets GPSL = 16368.
Wouldn't the buffer 1 data of the second descriptor be dropped, and
stmmac_rx_buf2_len() return plen - len from a buffer 2 the DMA never
wrote?

After something like 'ethtool -K ethX rx off', that would hand stale or
uninitialized page_pool memory to the stack. Should sph_active, or the RX
length accounting, follow sph_en here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120005243.3724402-1-sagar.cheluvegowda%40oss.qualcomm.com
