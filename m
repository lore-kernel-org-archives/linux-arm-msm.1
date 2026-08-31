Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2EE3DDDB3
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168196; cv=none; b=VCsIBuEutWRibbWhZ+8ixNEafzpRZHoz4EtCP+Q0zKUMwYYYhul2mELumWLuyPX2MQ3Q81/ySzTpR0vlUeKflLrl2d2jWenIJJtISaQfkIA62QQQ+fTpGnFAnQSzbLxFdrx/TnMKYMwdG/MIQRH4lVaAWy5YCxH4hUdCmlIWiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168196; c=relaxed/simple;
	bh=WgeNQTqKGAJfLK6CgQ6bJQ+73spe47hmYV0uQ67oxeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYQT5M4tppz578jGku92I5GvtEY0g8wMAykCnBcMbOQ+5Nd4IAv/fAtRMGqrNnRyry5Epeskx9sOh+NRCFxuEQKsGkeIWzCu/c8elFs/xGdMpHS+vWC03V1ETh3KiGX6Q5oP4ZgB6KlU57ep4pUSVd8CezEGfbj/V/+NDQNdXPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=noSGUM8m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="noSGUM8m"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49557167508so34048095e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788168191; x=1788772991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1kGajNhHG5JP5EUc7HIjKns7pSWjUGQRgeS9sY3KDg=;
        b=noSGUM8mtcxA0nVTxahcZp3jV8J/uoOAv6ctaLG3zidW++lTcU8Stvv3u2nkux8jIj
         k98OUFi2HoQmLy5ZZqfeXjzTI6/89plOKqfli3aOiDcBWj+1+r9u6krwb1SvfRuVlC+p
         IgNxRcF+o1CP6kQYW0R/+Y+JSHU4HVI+S7vlMH5Dpzm8mMR15PjlB5Dmnx3w4MWGRnng
         PN4Z3YEftp+3oD5GQ8xw+Ub3lip8a0QX1vq2f7y6pR2QC39uJjRgZThtDotPe4wval9M
         mzYHGJi+i/2U5zmp0Xe963ff0mlZrMRqhL4rI4iPGcq9C/jm4idfkZ2YahLGIMhawZW6
         K0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168191; x=1788772991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1kGajNhHG5JP5EUc7HIjKns7pSWjUGQRgeS9sY3KDg=;
        b=lJyPY+gJMtRt3x1uf8aNyg8KS+c0SsqUkJhNW6FVE/I6W4Yk3QDH99jJcKmKDxOKaw
         EElOrkQTRe1NVk/Bg/e3lgoityreXK08G3l/84+dXUWhP2ioETAEkIxmdA9k2aIb+GyY
         bcYnP1IV6iGodnJdPggAZOcL43CBTGSozc5gNuU2tReh5Z5jF7qaxBQ/zuwwgAIwp3dk
         oxAF746JY/J0E/WHCJGdaHt0VGK5iSIWgRAvrLGNBK1yAZiqZhcpkToAOqnS8O7LjMRE
         SqKncnBbmegoGLC4hvGgkLftYAkgiOemxw7Qalb9X6SlvJRmb0FjQnzuvpHDhmam+PYe
         IyWw==
X-Forwarded-Encrypted: i=1; AHgh+Rpan5azjxFBYjl/sCgeZn7TrZ9e7pGIbw32pf74/NJ8e2056pcJHtTxOxLysK161MaBBN2PhzPtnlc12StT@vger.kernel.org
X-Gm-Message-State: AFuF++mFkWH6QGlPfrczNy0xheCSrSuSu3TiTxom9oy2At4HDRg9LdKU
	ybzDXl7M3siOkscMs951NFG+mb5JUpMR13XlFz4LoWrbZPqosD6n7xRn/mrWap+gmN4=
X-Gm-Gg: AR+sD118RTzjAh8Tv6JU2EWPvSz6ivVJRsZBxGHIPc9De+zp6y1MpmBvqLvkV2wcHa3
	WBFVM7k+nOgQAehefhVmL0q64951tTnuRLebbL6OlOy8FlFV2VJwyew5yDfd1/8FrrfIvahkWRQ
	bzxtEwmINzWb/Wjp1rHILVl5gyVNFNO0GtDgE4ZUT3rlZwwCY0VtudnWUVln7ST+W3vnKceU+aA
	SU0ub/p6aOaUCkhit/ZrhpPzOES1jDQAP4DQaimT9vQZtmHDeGbf543RL+ftpeaNTwthANqzemD
	A9SHNYYXpnaxe2aqP1w+0t5JK498FD9XeO6XIwlWF/B3KJzwjvDERTdTetksLD6YIKw0z3wOYGQ
	dXq/lHC0ICM+xhsLv6E6B8MQXE0oqvvk0uKOWLJKC2ZULmCmDlPGsjetQeVGC0v9wA7QKTM3Vz5
	ZCH+PvOSFrv1rGZx3nP8kGm22ByR7ytGcHgvvC1ayEG6oyIASO+YDv+3FBXhIfBeIzrD69N6tk8
	uoVpoJeXa4=
X-Received: by 2002:a05:600c:3b89:b0:49b:9205:45b3 with SMTP id 5b1f17b1804b1-49cd94f84f7mr40943245e9.15.1788168190688;
        Mon, 31 Aug 2026 02:23:10 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7241:7d09:c3ef:cd6:3fed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd2fa779esm118070055e9.2.2026.08.31.02.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:23:10 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:23:05 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Sinyavin <sinyavin@gmail.com>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: wwan: qcom_bam_dmux: account network packets
Message-ID: <apVH-Wd4d9q1uMzy@linaro.org>
References: <20260830085400.2542956-1-sinyavin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830085400.2542956-1-sinyavin@gmail.com>

On Sun, Aug 30, 2026 at 10:54:00AM +0200, Dmitry Sinyavin wrote:
> The BAM-DMUX data path does not update the network device packet and byte
> counters. As a result, userspace sees zero traffic even while packets are
> being transferred.
> 
> Use the standard per-CPU software statistics helpers. Account transmitted
> packets after their DMA completion and received packets after removing the
> BAM-DMUX header and padding.
> 
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
> Signed-off-by: Dmitry Sinyavin <sinyavin@gmail.com>

Thanks for the patch! A few minor comments:

> ---
> Build-tested for ARM with CONFIG_QCOM_BAM_DMUX=m using Clang and W=1.
> 
>  drivers/net/wwan/qcom_bam_dmux.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d6437..40c40bc5645a 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -177,8 +177,15 @@ static void bam_dmux_tx_callback(void *data)
>  {
>  	struct bam_dmux_skb_dma *skb_dma = data;
>  	struct sk_buff *skb = skb_dma->skb;
> +	struct net_device *netdev = skb->dev;
> +	unsigned int len = 0;
> +
> +	if (netdev)
> +		len = ((struct bam_dmux_hdr *)skb->data)->len;
>  
>  	bam_dmux_tx_done(skb_dma);
> +	if (netdev)
> +		dev_sw_netstats_tx_add(netdev, 1, len);
>  	dev_consume_skb_any(skb);

This is a bit odd, why did you split the two if (netdev) statements?
The skb stays alive until it is freed here, so you should be able to
obtain the length even after bam_dmux_tx_done().

>  }
>  
> @@ -402,6 +409,7 @@ static const struct net_device_ops bam_dmux_ops = {
>  	.ndo_open	= bam_dmux_netdev_open,
>  	.ndo_stop	= bam_dmux_netdev_stop,
>  	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
> +	.ndo_get_stats64	= dev_get_tstats64,
>  };
>  
>  static const struct device_type wwan_type = {
> @@ -421,6 +429,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
>  	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
>  	dev->needed_tailroom = sizeof(u32); /* word-aligned */
>  	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
> +	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
>  
>  	/* This perm addr will be used as interface identifier by IPv6 */
>  	dev->addr_assign_type = NET_ADDR_RANDOM;
> @@ -533,6 +542,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
>  		break;
>  	}
>  
> +	dev_sw_netstats_rx_add(netdev, skb->len);
>  	netif_receive_skb(skb);

Would it be better to increment the stats after the packet was already
passed to the network subsystem in this call?

I'm not sure if we need to check the return code of netif_receive_skb()
and increment rx_dropped if it fails. This seems to be handled
differently in various drivers. Maybe someone else knows?

Thanks,
Stephan
