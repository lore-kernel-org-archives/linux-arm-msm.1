Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721182;
	b=RsWtpXnXNPqe+mhPXzVpwAm4LBo6AV4SpVBaf/EG0R1Z4xZ100pIey+edz8SQ9t5lS6g
	 U1S6oz+A4JMTRxvgfHESFNzT/ceCrGvyB5XrUhPXL5QyXqp2kucjfAulir27/xEFLmMpj
	 ySHZFriW0P+EqE5dosy+K/4/rFPMc7xt+EUp7AjrDHvyAeMSLOHMWkaBuu3912Q+043GM
	 eFEuIWmcDUZPe7RjR8PGribXoxyRZz5Xp6HB9wXMyySTcmYov0zov5oEp9nC+HN7PnOkr
	 mFm1p8xRExHzKfvnYjLN86sqO6sTLtb2oJACQiWqCHWAjdICSRABEK8noqRskYCcTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721182;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=DlmXxKCRfwySP2H9xbg+rD0tHnrJuVjklCcVNScXQk4=;
	b=l7FdNPWmwTrSycE+YBdQtxzU/Y/5lIElkd6ls81/9ldkYpKOFW5gPoZA7ImsiDZGf04D
	 ecQ34Fq67vQQNtRhU1Ca5Gkt9pSnN0ZJvhZioZ2TApqGRuikz7+y+uSvCVCqCiTFXVCYG
	 jXEBUxPkHxsAcIL+BhWbfljGJ9X1ZGhZ+PxY/6+eJa7sPpGgZpHXd1Wv9nIay15DmqS3x
	 ii6zOxYkRjXNl+R+YCZNMTNbrgshZ/7BSrmaYt60oDarmGSGHEps82WMhuXpLxKeKIHUY
	 RK6teftKjLtZgWK0v7svKLZqyeR5xOU+fY96Sn0ZrbZDkm20AB6Go/M6yHvrrjQWWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLdeKFk2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C358A606A31E;
	Thu, 26 Nov 2026 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VLdeKFk2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613671F000C4;
	Thu, 26 Nov 2026 19:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721182;
	bh=DlmXxKCRfwySP2H9xbg+rD0tHnrJuVjklCcVNScXQk4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VLdeKFk2jnnsDeHa5w+9cs9AVtXeXk0NK2+QqgkGNQRKJ359/0ZJwP7rEZA8O2lD6
	 Evf9JBWGctuH57a3m0r9cUCAAeLOUQ7QQa1h7S0/wahAe9inMvlxjIgGPFMg30yiXs
	 E7HiT18iIHujTJj3huD5+SwUY2rb2p2ej/XXtznCh5jXELZNGlMJeu0G+d1c294vAD
	 0TQd7Ig3nQ9yVjaA4ZTQTC9IcCK51JSpRml5Nt4Us9kTSgRIKeYmQjc3biLWAP90MP
	 mULoCWCRdczSndKPm5lJLdCQy5+AfwpUT1MuTj6IMeWIYpq9jQsQNtk7WyxYDC47AT
	 d9FnYKR8q5rcg==
Subject: Re: [PATCH net] net: stmmac: xgmac: fix RX split header length on
 multi-descriptor frames
From: netdev-bot+sashiko@kernel.org
To: sagar.cheluvegowda@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lorenzo.bianconi@oss.qualcomm.com,
 hongmei.xu@oss.qualcomm.com, abhishek.chauhan@oss.qualcomm.com,
 sarosh.hasan@oss.qualcomm.com
Date: Thu, 26 Nov 2026 19:26:20 +0000
Message-ID: <179572118090.3135.17761933543011019663@kernel.org>
In-Reply-To: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
References: <20261125192531.1940982-1-sagar.cheluvegowda@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] dwxgmac2_get_rx_header_len()
  (drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:293-304) now…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but it can produce
  the same corruption the patch fixes.

--

net: stmmac: xgmac: fix RX split header length on multi-descriptor frames

This patch changes dwxgmac2_get_rx_header_len() so it reads the split
header length from RDES2.HL whenever the first descriptor is not also the
last one. The RDES3.L34T check is kept only for single-descriptor frames.
For descriptors without FD set, the function now returns early.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395bc..ed38aa358642b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -292,7 +292,14 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
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
> +	/* L34T is only valid on the last descriptor */
> +	if (!(rdes3 & XGMAC_RDES3_LD) || (rdes3 & XGMAC_RDES3_L34T))

[Severity: Medium]

Can this trust HL for frames the MAC did not actually split?

Commit 96147375d49f added the L34T gate on purpose. Its message says
"Split Header length is only available when L34T ...". After this change,
every FD=1/LD=0 descriptor uses RDES2.HL no matter what L34T says.

Suppose the XGMAC writes a non-zero HL on the first descriptor of a
multi-descriptor frame it did not split, and that HL is smaller than what
buffer 1 really holds. Examples are a large non-IP frame, or a frame whose
headers exceed HDSMS. GPSL=16368 accepts both. stmmac_rx_buf1_len() then
returns hlen without any check:

    if (priv->sph_active && hlen) {
        priv->xstats.rx_split_hdr_pkt_n++;
        return hlen;
    }

Later descriptors count buf1 as 0 and buf2 as dma_buf_sz, so the running
len ends up too low. On the last descriptor, stmmac_rx_buf2_len() has a
floor but no dma_buf_sz cap:

    return plen > len ? plen - len : 0;

stmmac_rx() then uses that value directly:

    dma_sync_single_for_cpu(priv->device, buf->sec_addr,
                            buf2_len, dma_dir);
    skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
                    buf->sec_page, 0, buf2_len,
                    priv->dma_conf.dma_buf_sz);

Could buf2_len then be larger than what the DMA wrote into sec_page? That
would put stale page_pool bytes into the skb. When dma_buf_sz is close to
the page size, it would read past the end of the page.

Before this patch, the FD && !LD case was mostly gated off by L34T. It
fell back to counting buffer 1 as a full dma_buf_sz, which under-counts
but never over-reads.

A stale read-format des2 is a page-aligned DMA address, so it gives HL=0.
That leaves the question of what the hardware writes to HL for frames it
does not split. Does the databook guarantee that HL is either zero or
accurate in that case?

>  		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
>  }

[Severity: High]

This is a pre-existing issue, but is this des2 read ordered against the
OWN check in stmmac_rx()?

In stmmac_rx(), the only dma_rmb() after the OWN check is behind
extend_desc:

    status = stmmac_rx_status(priv, &priv->xstats, p);
    /* check if managed by the DMA otherwise go ahead */
    if (unlikely(status & dma_own))
        break;
    ...
    if (priv->extend_desc) {
        /* Read the extended status after the own bit */
        dma_rmb();

extend_desc is only set in stmmac_dwmac1_quirks(), for dwmac1 enhanced
descriptors, so XGMAC and GMAC4 never get this barrier. stmmac_rx_zc()
has the same gap.

On weakly ordered CPUs such as arm64, the des2 load in
stmmac_rx()->stmmac_rx_buf1_len()->dwxgmac2_get_rx_header_len() can be
satisfied before the des3 load that saw OWN clear. In that case des2
still holds the read-format value written by stmmac_rx_refill() through
dwxgmac2_set_sec_addr(). That value is a page-aligned address, so HL
reads as 0.

On an FD && !LD descriptor, this gives the same buf1_len = dma_buf_sz
misaccounting that this patch fixes. On a single-descriptor split frame,
buf2_len becomes 0. The skb then carries the header plus stale buffer 1
bytes instead of the payload in buffer 2, and the frame is still marked
CHECKSUM_UNNECESSARY. The RSS hash (des1) and VLAN (des0) reads have the
same exposure.

Documentation/memory-barriers.txt calls for dma_rmb() after checking the
descriptor ownership bit and before reading the other fields. Should
there be an unconditional dma_rmb() after the OWN check for these cores?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261125192531.1940982-1-sagar.cheluvegowda%40oss.qualcomm.com
