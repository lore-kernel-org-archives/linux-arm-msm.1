Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565363;
	b=vjN/X/HZ6gdIgny2dp55JynKrApahqVN9nFu2BWipurKRRzH9VFc326gMNY/liN42jSr
	 FZaGz1DAktsgqAQYHNg0sYROkyaw10tBi+rxx5bfjGJEGlhAUA82/dia7EhitQlO0JZkm
	 afNpr81EdiHQXGc53tPGCW1k8bt5oUOM/NOdiuLsqt7VDGG4qAZmuNu1Cm0rXnJjiGwBF
	 4crHw2+rC3MR1TmYrtkMhX4u03IrlTUgntdo1C+hp7NzL0bewJcWMp2z0SOia0XwXwc0z
	 fvcgpAybQ/0CL/u7CDXAwMYl3Utj4IVthtJQ6+sm9edSpMJ5ZUBWv4cH2jFkOR9Zr7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565363;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uyQvLyfxi3krPyIKXwFwrrrzE4BwtXe5ANPqZmDzHnU=;
	b=cmOhtAHX9k5aqyyqAHZk7IeVXghTi6EioJDDDIDVHgZefNIDY4i+IBV1/4/qTmO/yg9x
	 XkwG+CceEQvT8uA9dme6WbEjN5hCLoyyQYnoFDvICdrtJ9PF+sRlakS5TWETHaHDMBgOe
	 fyuHEOPpeXnx9/lAP66PNndV08WaxHM8zUTz8Gs7+ezhA5+gFeyfXZ2tsjtA0RkH1BUEd
	 BCSOePoy2g+RJdPy3BngcENls2HX436VMuz/Ln9BT3hqXg3WYfZKi10smoHs5RI104Xvr
	 fKOpR42GM2edF8t66SdWuFpiqjoXwPeUWW+Wu1/JTXeNVogw+HMMXWHZ39wK76NvqKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UN0diSFN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77D606A31E;
	Wed, 25 Nov 2026 00:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UN0diSFN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F10F1F000C4;
	Wed, 25 Nov 2026 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795565362;
	bh=uyQvLyfxi3krPyIKXwFwrrrzE4BwtXe5ANPqZmDzHnU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UN0diSFN81K7qt/M4VQqt+luXZaeDT7Aiz8E6Bg8kzHo8vLE1StK15YYwY9HaMPd/
	 vZcbxXOSWKLNoQ+nei2BGUEetlz5iqFobaXWz/m49YYFLYIuXJFnCsSn5nkdBUxNzs
	 sKiT/yKH2Gj+LKENrP/Pg5tvC8duxGGNzHBbE9XYvaMxtAQTBP+r92ix59deosQ8nu
	 IwQ/Y27aBOJiSMFYa0Rf5Buf7axJI2QjQNz5Ywe/9Tv6pmllLVU4DxKPV+7mxNOtes
	 qCOm9AYnRPPgUMDuFTTBKthG2gRc1PitJ0f10UhmlCnk8Nud/EaqPayQu28+qGf4iD
	 yIea858x2DCFg==
Subject: Re: [PATCH net-next v2 1/3] net: stmmac: separate the TC count from
 the queue count on XGMAC
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
Date: Wed, 25 Nov 2026 00:09:20 +0000
Message-ID: <179556536060.3135.11757028491068273686@kernel.org>
In-Reply-To: <20261124000415.4067701-2-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261124000415.4067701-2-sagar.cheluvegowda@oss.qualcomm.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 2 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch limits the CBS replay in stmmac_configure_cbs()
  (stmmac_main.c:3560) to stmmac_num_tc().
- [High] The patch limits stmmac_mac_config_tx_queues_prio()
  (stmmac_main.c:3622) to stmmac_num_tc() because TC_PRTY (PSTC) is per…
- [Medium] The patch is meant to stop the driver assuming one TC per
  queue on XGMAC, but the register that actually assigns a queue to a TC…

--

net: stmmac: separate the TC count from the queue count on XGMAC

This adds stmmac_num_tc(). It bounds the per-TC register writes (TX queue
weight, CBS replay, TC_PRTY) by the number of TCs the XGMAC reports
instead of by tx_queues_to_use. It also limits the ETS loop to 8 TCs and
bounds the per-priority registers (Qx_TX_FLOW_CTRL, PSRQ) by
STMMAC_NUM_PRIO_QUEUES.

Link: https://lore.kernel.org/netdev/20260601162537.553512-2-j.raczynski@samsung.com/

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index fcc395321816f..24bbe72e00719 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h

[ ... ]

> @@ -441,6 +446,18 @@ static inline bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
>  	return priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp;
>  }
>  
> +/* Most cores have one traffic class per queue, but newer XGMAC can have more
> + * queues than traffic classes (the number of TCs is reported by the HW
> + * feature register).
> + */
> +static inline u32 stmmac_num_tc(const struct stmmac_priv *priv)
> +{
> +	if (!priv->dma_cap.numtc)
> +		return priv->plat->tx_queues_to_use;
> +
> +	return min_t(u32, priv->dma_cap.numtc, priv->plat->tx_queues_to_use);
> +}

[Severity: Medium]
When numtc is smaller than tx_queues_to_use, which TC do the queues at
or above numtc end up on? The register that assigns a queue to a TC
still maps one TC per queue. In dwxgmac2_dma_tx_mode() in dwxgmac2_dma.c:

	/* Use static TC to Queue mapping */
	value |= FIELD_PREP(XGMAC_Q2TCMAP, channel);

The default map that dwxgmac3_fpe_map_preemption_class() in
stmmac_fpe.c restores does the same:

	for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
		val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
		writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
		       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
	}

So queues numtc..N-1 are mapped to TC indexes the hardware does not
implement. Weights, CBS and TC_PRTY are now programmed only for TCs below
numtc, so those queues point at TCs that either have no scheduling state
or do not exist.

XGMAC_Q2TCMAP is GENMASK(10, 8). The later patch in the series
("include/stmmac: Increase max DMA/MTL channel count from 8 to 16") makes
channels 8..15 reachable. Would FIELD_PREP() then wrap them silently onto
TC0..7?

The driver code doesn't show how the hardware handles Q2TCMAP >= NUMTC,
so the exact effect on scheduling is uncertain.

There is also a pre-existing issue that this patch did not introduce:
the field is OR-ed in rather than replaced. This runtime path:

stmmac_bump_dma_threshold()->stmmac_set_dma_operation_mode()->
    dwxgmac2_dma_tx_mode()

can OR the channel number into a Q2TCMAP value that mqprio or FPE set
earlier. For example, TC 1 OR channel 2 gives TC 3.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ca4c7fb11b73f..5d02f7034a7af 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -3548,12 +3552,12 @@ static void stmmac_set_tx_queue_weight(struct stmmac_priv *priv)
>   */
>  void stmmac_configure_cbs(struct stmmac_priv *priv)
>  {
> -	u8 tx_queues_count = priv->plat->tx_queues_to_use;
> +	u8 num_tc = stmmac_num_tc(priv);
>  	u32 mode_to_use;
>  	u8 queue;
>  
>  	/* queue 0 is reserved for legacy traffic */
> -	for (queue = 1; queue < tx_queues_count; queue++) {
> +	for (queue = 1; queue < num_tc; queue++) {
>  		mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
>  		if (mode_to_use == MTL_QUEUE_DCB)
>  			continue;

[Severity: High]
The replay path is now bounded by num_tc, but is the runtime CBS path
still unbounded? tc_setup_cbs() in stmmac_tc.c only checks against
tx_queues_to_use:

	u32 tx_queues_count = priv->plat->tx_queues_to_use;
	...
	/* Queue 0 is not AVB capable */
	if (queue <= 0 || queue >= tx_queues_count)
		return -EINVAL;

It then passes queue straight to stmmac_config_cbs(). On XGMAC that call
reaches dwxgmac2_config_cbs(), which uses the queue number as the TC
index:

	writel(send_slope, ioaddr + XGMAC_MTL_TCx_SENDSLOPE(queue));
	writel(idle_slope, ioaddr + XGMAC_MTL_TCx_QUANTUM_WEIGHT(queue));
	writel(high_credit, ioaddr + XGMAC_MTL_TCx_HICREDIT(queue));
	writel(low_credit, ioaddr + XGMAC_MTL_TCx_LOCREDIT(queue));
	...
	writel(value, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(queue));

With numtc < tx_queues_to_use, a cbs offload qdisc on a queue >= numtc
still writes TC registers that don't exist. The later patch in the
series raises MTL_MAX_TX_QUEUES to 16. Since numtc is at most 8, queues
8..15 on any 16-queue XGMAC are then affected as well.

The commit message says:

    The checks are in the callers, which can return an error to the user,
    instead of in the callbacks, which are void.

tc_setup_cbs() returns int. Should it also reject queue >=
stmmac_num_tc()?

The runtime and replay paths also disagree now. tc_setup_cbs() leaves
tx_queues_cfg[queue].mode_to_use as MTL_QUEUE_AVB, so the queue goes back
to AVB mode on reopen or resume. This loop stops at num_tc, though, so
the slopes and credits for that queue are not replayed.

After resume, won't the hardware state differ from both the pre-suspend
state and tx_queues_cfg[]?

The later patches in the series don't appear to touch stmmac_tc.c.

[ ... ]

> @@ -3611,9 +3616,10 @@ static void stmmac_mac_config_rx_queues_prio(struct stmmac_priv *priv)
>   */
>  static void stmmac_mac_config_tx_queues_prio(struct stmmac_priv *priv)
>  {
> -	int i;
> +	u32 num_tc = stmmac_num_tc(priv);
> +	u32 i;
>  
> -	for (i = 0; i < priv->plat->tx_queues_to_use; i++)
> +	for (i = 0; i < num_tc; i++)
>  		stmmac_tx_queue_prio(priv, priv->hw,
>  				     priv->xmit_qdisc.prio[i], i);
>  }

[Severity: High]
This bounds one caller of the tx_queue_prio callback by num_tc. What
about the two mqprio callers in stmmac_tc.c? Both stmmac_reset_tc_mqprio()
and tc_mqprio_config_queue_prio() still do:

		priv->xmit_qdisc.prio[i] = prio;
		if (i < priv->plat->tx_queues_to_use)
			stmmac_tx_queue_prio(priv, priv->hw, prio, i);

tc_mqprio_validate_chan_mode() requires a 1:1 TC-to-queue map, but it
never compares qopt->num_tc with dma_cap.numtc.

dwxgmac2_tx_queue_prio() uses the index directly as a TC slot:

	reg = (queue < 4) ? XGMAC_TC_PRTY_MAP0 : XGMAC_TC_PRTY_MAP1;
	if (queue >= 4)
		queue -= 4;

	value = readl(ioaddr + reg);
	value &= ~XGMAC_PSTC(queue);
	value |= (prio << XGMAC_PSTC_SHIFT(queue)) & XGMAC_PSTC(queue);

On an XGMAC with numtc < tx_queues_to_use, setting up or tearing down
mqprio would still program PSTC fields for TCs that don't exist.

Once the series raises MTL_MAX_TX_QUEUES to 16, indexes 8..15 become
4..11 after the subtraction, and XGMAC_PSTC_SHIFT() gives 32..88. Is that
an out-of-range shift of the u32 prio (UBSAN shift-out-of-bounds)? Does
XGMAC_PSTC() also go past bit 31, so the priority mapping for those TCs
is silently lost?

The paths also disagree after this change. mqprio programs
xmit_qdisc.prio[] for every queue in use, but this function replays only
the first num_tc entries on open or resume.

Should the mqprio paths use stmmac_num_tc() as well? The later patches in
the series don't appear to change these callers.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124000415.4067701-1-sagar.cheluvegowda%40oss.qualcomm.com
