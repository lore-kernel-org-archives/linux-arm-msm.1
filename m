Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565367;
	b=PvdJqA+N4KG+/qW8mmTKukSGkPvxFGC+PPRR+wfTldnhA7dXZ1QMaiUu2NXY9PfYs/T5
	 atW3jQNZw7aJjkq1dLHmwTmg2rRm7biLmq6TmgHiQD4KLhuDXl4XhPU4UvQD9cwSCgH6q
	 U8KKV/Fxb+6i61pHPC/mjq4rMWBlHxy44ffNksKW0dsQFdSyf9azBNkX4gzy3A4enQu71
	 WdEhT5spUxV3hPjpQAOdvUI5g+Twwb3oObln8wh3fLWU7ZTzIXJl2zs/l/utv4HQ3CmtM
	 g5t38K5yMIQVHpsTb4elYj1QSKtys2pmM5pbJdpJ77FcA688PJZT7GpAyFlw5RYWwIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565367;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=SlEO7AG/xoBdanHyLcbNyPfkti5alnKG1VL7DPC5IJg=;
	b=MHXrEMgai+HEBa6LfXxLOcBxdNEQn711lfbXhAnlXiBHCKaeK+4Snp6OTPsiO+4CVjCI
	 SsZARsoz8Zt1u07F92yUv/etUbK2N25RjpCND7m+jh3OUWSaSWiK0dGS2R0NzAQARF7V7
	 Fg04lyUhp+u6hS/QMe/sabpRfORsXwykCjSrptsE/CL0E+dMdNbb7e/IKY0tH0H06w49u
	 +GILKnGcnbMwkzy1nOLX+j8BNDMLUpuiMuuyiwK/2Pdp8MeWwPm7GBPJb1OZe9+hAeOTm
	 Oc5MGpTKZolu/lRdBDqn56WxoZedR3H2w5ayQ8d1Pk9C5gPqfLbUhcj0U5JtRQJvjjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odh4ycun;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09849606A33F;
	Wed, 25 Nov 2026 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=odh4ycun
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F73F1F0089F;
	Wed, 25 Nov 2026 00:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795565366;
	bh=SlEO7AG/xoBdanHyLcbNyPfkti5alnKG1VL7DPC5IJg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=odh4ycun0vP81AgfR+TAVVmdt5EvllvtLqYpb+NfquwNQah9O7DNKC+DrZqbNzLWY
	 nzWOEVc4RwMqp3H0E16VEXQ/ceQ/EMow71rEIuDD9FoaHuH2pUQYFpF1Hu9cuRiBG9
	 5xRtiZLAVY2d+US8Y5CjQ5YizjbhI1MJr4m72LYZrSAcQcpaEEcMfvmkqKX2W/ZoIf
	 E7QvDPhz0FC22GOPPQF+1YNxvdOHEmz/oLZNaINrF90t1yEVn3dBGWVn9retJLEoZ1
	 cNvXyxVq66QNFUMeU5JAtMgQfOhR1iHMMtIa6dVvapvAt5fNzCS0fNDlNqQdubObVV
	 fBPB1RBuH8WXg==
Subject: Re: [PATCH net-next v2 3/3] include/stmmac: Increase max DMA/MTL
 channel count from 8 to 16
From: netdev-bot+sashiko@kernel.org
To: sagar.cheluvegowda@oss.qualcomm.com
Cc: j.raczynski@samsung.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, cs0617.lee@samsung.com,
 k.domagalski@samsung.com, k.tegowski@samsung.com,
 abhishek.chauhan@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com
Date: Wed, 25 Nov 2026 00:09:24 +0000
Message-ID: <179556536493.3135.4615910736838398111@kernel.org>
In-Reply-To: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-4-sagar.cheluvegowda@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 5 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] tc_setup_cbs() (stmmac_tc.c:343) checks the CBS queue only
  against tx_queues_to_use.
- [Medium] With up to 16 TX queues, tc_setup_dwmac510_mqprio()
  (stmmac_tc.c:1456-1464) checks only that offset+count <=…
- [Medium] dwxgmac2_tx_queue_prio() (dwxgmac2_core.c:140-155) handles
  only TX queues/TCs 0..7.
- [Low] net: stmmac: 3-bit queue mask truncation in
  EST_SZ_CAP_HBFQ_MASK()
- [Low] net: stmmac: signed shift overflow in dwxgmac2_rx_queue_enable()
  for queue 15

--

include/stmmac: Increase max DMA/MTL channel count from 8 to 16

This commit raises MTL_MAX_RX_QUEUES, MTL_MAX_TX_QUEUES and STMMAC_CH_MAX
from 8 to 16 so that newer XGMAC hardware with up to 16 DMA/MTL queues can
use all of them.

> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 00be2df63d220..b91c8d069dc28 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -15,9 +15,9 @@
>  #include <linux/platform_device.h>
>  #include <linux/phylink.h>
>  
> -#define MTL_MAX_RX_QUEUES	8
> -#define MTL_MAX_TX_QUEUES	8
> -#define STMMAC_CH_MAX		8
> +#define MTL_MAX_RX_QUEUES	16
> +#define MTL_MAX_TX_QUEUES	16

[Severity: Low]
Can stmmac_mac_enable_rx_queues() now evaluate a signed shift into the
sign bit?

Both dwxgmac2_rx_queue_enable() and dwxlgmac2_rx_queue_enable() in
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c do:

	else if (mode == MTL_QUEUE_DCB)
		value |= 0x2 << XGMAC_RXQEN_SHIFT(queue);

XGMAC_RXQEN_SHIFT(x) is defined as ((x) * 2). With MTL_MAX_RX_QUEUES
at 16, rx_queues_to_use can be 16, and stmmac_mac_enable_rx_queues()
then passes queue 15, giving 0x2 << 30. Since 0x2 is a plain int, this
shifts a 1 into bit 31. That is undefined behaviour in C and can be
flagged by CONFIG_UBSAN_SHIFT.

MTL_QUEUE_DCB is the default rx queue mode, so this would be hit on
every interface bring-up through stmmac_hw_setup() on a 16-queue
XGMAC/XLGMAC configuration.

The register value most likely still comes out right with the kernel's
compiler flags. Could these constants be made unsigned (0x2U, or
FIELD_PREP() with XGMAC_RXQEN(queue)) as part of the preparatory
changes before the limit is raised?

[Severity: Low]
Now that tx_queues_to_use can be larger than 8, does est_irq_status()
still report the right queue on a head-of-line blocking event?

In drivers/net/ethernet/stmicro/stmmac/stmmac_est.c:est_irq_status(),
the EST_HLBF handling does:

	value = readl(est_addr + EST_FRM_SZ_CAP);
	hbfq = (value & EST_SZ_CAP_HBFQ_MASK(txqcnt)) >>
		EST_SZ_CAP_HBFQ_SHIFT;

txqcnt is priv->plat->tx_queues_to_use, passed down from
stmmac_common_interrupt(). EST_SZ_CAP_HBFQ_MASK() in stmmac_est.h only
knows about up to 8 queues:

	(_val > 4 ? GENMASK(18, 16) :
	 _val > 2 ? GENMASK(17, 16) :
	 BIT(16));

For txqcnt 9..16 the mask stays 3 bits wide and bit 19 is dropped.
An HLBF event on queues 8..15 is then logged in the "EST: HLB(size)
Queue %u" message as queue 0..7. That points the user at the wrong
queue when debugging a taprio schedule.

The impact is limited to the diagnostic message. Should
EST_SZ_CAP_HBFQ_MASK() gain a _val > 8 ? GENMASK(19, 16) branch? Can
you confirm the HBFQ field in EST_FRM_SZ_CAP really widens to 4 bits on
the 16-queue XGMAC cores?

[Severity: Medium]
Now that tx_queues_to_use can be larger than 8, can tc_setup_cbs() program
per-TC registers that do not exist on XGMAC?

In drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:tc_setup_cbs(), the
only bound on the CBS queue is:

	/* Queue 0 is not AVB capable */
	if (queue <= 0 || queue >= tx_queues_count)
		return -EINVAL;

The queue is then used directly as a traffic class index. dwxgmac2_qmode()
does:

	writel(0, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(channel));

dwxgmac2_config_cbs() also writes XGMAC_MTL_TCx_SENDSLOPE(),
XGMAC_MTL_TCx_QUANTUM_WEIGHT(), XGMAC_MTL_TCx_HICREDIT(),
XGMAC_MTL_TCx_LOCREDIT() and XGMAC_MTL_TCx_ETS_CONTROL() using that same
queue. XGMAC has at most XGMAC_MAX_TC (8) traffic classes, and
dma_cap.numtc can be lower than that.

At the same time, dwxgmac2_dma_tx_mode() puts the queue into a 3-bit
field:

	value |= FIELD_PREP(XGMAC_Q2TCMAP, channel);

That means queue 9 is served by TC1. TC1's shaper is never touched, and
the tc command still returns success.

The path is:

  tc qdisc replace ... cbs ... offload 1
    stmmac_setup_tc()
      tc_setup_cbs()
        stmmac_dma_qmode() -> dwxgmac2_qmode()
        stmmac_config_cbs() -> dwxgmac2_config_cbs()

The earlier commit "net: stmmac: separate the TC count from the queue
count on XGMAC" described this as writes to TC registers that do not
exist. It bounded the resume replay in stmmac_configure_cbs() by
stmmac_num_tc():

	for (queue = 1; queue < num_tc; queue++) {

However, tc_setup_cbs() is still bounded only by tx_queues_to_use. As a
result, CBS state saved for queues >= num_tc is also silently not
restored.

Should tc_setup_cbs() reject queues >= stmmac_num_tc() as well?

[Severity: Medium]
With more than 8 TX queues, can dwxgmac3_fpe_map_preemption_class()
silently truncate both the TC number and the preemption class?

tc_setup_dwmac510_mqprio() only checks offset + count against
tx_queues_to_use. It therefore accepts num_tc up to 16 and queue ranges
that include queues 8..15. It then reaches this code in
drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c:

dwxgmac3_fpe_map_preemption_class() {
    ...
		for (u32 i = 0; i < count; i++) {
			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
		}
    ...
}

XGMAC_Q2TCMAP is GENMASK(10, 8), so TC 8..15 alias onto hardware
TC 0..7.

The preemption class is written with:

	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);

FPE_MTL_PREEMPTION_CLASS is GENMASK(15, 8), so bits 8..15 of
preemptible_txqs are dropped. For example, with num_tc 2, TC1 on queues
8-15 and TC1 marked preemptible, preemptible_txqs is 0xFF00 and 0 is
written to the field.

When num_tc is 0, the default restore loop writes i, up to
tx_queues_to_use - 1, into the same 3-bit XGMAC_Q2TCMAP field.

No error is returned to the user in any of these cases. Should the
mqprio/FPE path reject configurations that do not fit these register
fields?

[Severity: Medium]
Does dwxgmac2_tx_queue_prio() handle queues 8 and above?

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c:dwxgmac2_tx_queue_prio() {
    ...
	reg = (queue < 4) ? XGMAC_TC_PRTY_MAP0 : XGMAC_TC_PRTY_MAP1;
	if (queue >= 4)
		queue -= 4;

	value = readl(ioaddr + reg);
	value &= ~XGMAC_PSTC(queue);
	value |= (prio << XGMAC_PSTC_SHIFT(queue)) & XGMAC_PSTC(queue);
    ...
}

For queues 8..15 the sub-index becomes 4..11. For queues 8..11, prio is a
u32 shifted by 32..56 bits. For queues 12..15, XGMAC_PSTC() also expands
to a GENMASK() past bit 63. Both are undefined behaviour.

On x86-64, queues 12..15 end up overwriting the TC4..TC7 fields of
XGMAC_TC_PRTY_MAP1.

These calls can now be reached from tc_mqprio_config_queue_prio() and
stmmac_reset_tc_mqprio(). Both loop over ARRAY_SIZE(tx_queues_cfg), which
is now 16, and do:

		if (i < priv->plat->tx_queues_to_use)
			stmmac_tx_queue_prio(priv, priv->hw, prio, i);

Neither loop is bounded by num_tc. By contrast, the boot-time
stmmac_mac_config_tx_queues_prio() is bounded by stmmac_num_tc().

The path is:

  tc qdisc add ... mqprio ... hw 1 mode channel
    tc_setup_dwmac510_mqprio()
      tc_mqprio_config_queue_prio()
        stmmac_tx_queue_prio() -> dwxgmac2_tx_queue_prio()

Should these mqprio loops also be limited to stmmac_num_tc()?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124000415.4067701-1-sagar.cheluvegowda%40oss.qualcomm.com
