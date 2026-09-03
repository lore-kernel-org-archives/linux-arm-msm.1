Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F4C41D647
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424040; cv=none; b=sQFZ1psnUR9bLlETEstBnbgHfJXBeM513JKhlndvl/NcPNSbFD8+jDKM/U/HEfRmv7RGNTNxopg0N8oKbNfCesOwnOat/C7wXx0DPzkoFEOICI97ADx66kCRHb4fL10RzWa1s62BuHFwAPrd1KLnwGqLB0MDPFop30e7mXkQ594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424040; c=relaxed/simple;
	bh=QHcbKX4vQy3vRwUBSr3fQ/6HMsYcVpJ+fH8mUI/pgj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obcpUuYHAAKI9i13iqFWqOj6asIUaMGJejrZ69rQa0fZgq/NrBTBeXaiaWLYu8ztitcAPP2qvooZ54o2fVZeHztdblF/+Fst7SSLHbjEAnlUbezoh2lMOHFcEX8Mamr9ZGpxrxKeTZk/Ho7DbUVQWWpvha9zunRwfFt3beNw1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuXnDGAd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuXnDGAd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1600d040e4so143089866b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788424037; x=1789028837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBM23VaC7NRoTSibSXqitvOOFeGtS5Tiv5Blws+1ceU=;
        b=EuXnDGAdCQQIhFPc46E7iheOMgsGWg8MuISdJOXBEuzNtxw659SD16xWebgaUdldHO
         DwPpWvNimj32UYS3IDRpCs2Tt6EXVr4yTzmMr30tNsff62Q6d6UuwIRO9uW8HgHczQs+
         1OOCBnuMP0BonoNUAmezfRyG/wvDhNsIoXNT86Ycs1btTe5iIBmeLlXpoKAUoH6o6sM/
         yR2MB/lQl8Y67RIFVQCxcmquCR+wkP/aiU3xsebq0EleCyN3gHFTOR91TPU/DtlsCQzr
         bmYWE/ldzCQewER0wTTONxW/Eqa0tNMnifUssxGGUU9u2iCSr/DTQMsbcSOI+CTfZ9mu
         AjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424037; x=1789028837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBM23VaC7NRoTSibSXqitvOOFeGtS5Tiv5Blws+1ceU=;
        b=ibtG3AtvZBalb6wzTEbg7WZaM2Zy+6n5vj6Zc7DofbnyRobTdcME6Gfh/lLmGG7lBc
         Ofl4Jy1NRondMitQVBL7JgwFVOpoAw+JrQ54vPZ0/HARx/sgr7ifvErboRn6bG5dk+sb
         kOXb+5PyHXqFtDRyIx2LG62PZ6qgR6nf9Mlhhzti8Zq5mXLIzkr3PJq7cXRlpvMvE5d8
         o3HKcjtTCVz3VZVpcaLg7btmBeO5wzyko5xdowKGXKMlZ7GvTK/+Gd0uVOXcDNco0EH6
         WfiXJJSyG1JU74eCdln8wkfZZomTPLYnKkM1MUNqQadsuKMqX558QoZq6gR/n8aZFrlM
         06ng==
X-Forwarded-Encrypted: i=1; AKwUvBwW7V8BtfCjuzjtIAM/crghKsnbirQgZpeGYS3Ht9U8dYmTHaypnar0Qi4ejEiu/fHO2wYoKpOdfmB8Z8hf@vger.kernel.org
X-Gm-Message-State: AFuF++mSwP3PAR53r5ovnejdxSQ9B+MMOlgdQFsT+ad949aYPtcNYpph
	1bTXw5Xf5jSYPsMt+4cTNHExcPaWuevAFC3Q0SsYsV1GpJE4Gdk3x7FP
X-Gm-Gg: AYBFou0lx/hbo+VAIOIKRkPZmmRbq3YUh0z8RYNvYdBcn6ZJDzqJpJKglHigZmQQWoI
	hhCrQV/pT2FQ/6qJi3ivWuFH2atsMXUQ7+B7dbJ4Kvsl1DpAvd+urFRmjlj7iYlcYk4Aj2WXnha
	jqapjzeB8ichw+8G+Nq9DWyct0yXGVlVd3wDvC4Zr6qlZsKQ4fNYzxpNg3vq/dhfKc4yUTfey1t
	4WFjh4ut14X5wEz5tE9UrIUZQdqenbbhQyUiSVNyNcbFk1clQXO8E3WDPwAoIPzq5zEwremUydC
	YQwyMHkwJPf5P8fIh7h+Qxjh7oRrbFBQAUIBmtbSuXmNsmQcd1s2d9uXII48V2FfUVYI9VXXeW0
	i9LClAQ0nL77S+AKUhCiLhwd0rgMcEQblcG9stmgGFc5YnWcEKlGuTPei/yP1yBL+MKOa9pD9fc
	pHfzqqeFYPPiod35oT4TbyeUYhkKoz8dyUNgQBmIZn0R/iYROL/Ia6v18hVxVoHhn+KjT4rElrr
	KD2lJPNvivg
X-Received: by 2002:a17:907:3f23:b0:c25:5a26:3787 with SMTP id a640c23a62f3a-c25f011fb33mr251661166b.8.1788424036654;
        Thu, 03 Sep 2026 01:27:16 -0700 (PDT)
Received: from [192.168.1.124] (78-2-9-45.adsl.net.t-com.hr. [78.2.9.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f952c1bsm2043758a12.26.2026.09.03.01.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:27:16 -0700 (PDT)
Message-ID: <c9cc4753-dcb5-4983-9cff-45135d8b3022@gmail.com>
Date: Thu, 3 Sep 2026 10:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: wwan: qcom_bam_dmux: account network packets
To: Stephan Gerhold <stephan@gerhold.net>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260902124506.363174-1-sinyavin@gmail.com>
Content-Language: en-US
From: Dmitry Sinyavin <sinyavin@gmail.com>
In-Reply-To: <20260902124506.363174-1-sinyavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

The delayed Sashiko review of v2 identified a valid teardown race that 
also affects v3. I will address it in v4.

pw-bot: changes-requested

02.09.2026 14:45, Dmitry Sinyavin wrote:
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
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> v3:
> - Count packets discarded by the transmit error path.
> 
> v2:
> - Read the TX payload length after unmapping the DMA buffer and combine the
>    network-device checks.
> 
> v2: https://lore.kernel.org/netdev/20260831181006.1382372-1-sinyavin@gmail.com/
> v1: https://lore.kernel.org/netdev/20260830085400.2542956-1-sinyavin@gmail.com/
> 
> Build-tested for ARM with Clang and W=1 using allmodconfig and allyesconfig.
> Hardware-tested on an MDM9607-based device: three 32-byte ICMP probes completed
> without loss, and the RX and TX counters each advanced by three packets and
> 180 bytes.
> 
>   drivers/net/wwan/qcom_bam_dmux.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d6437..ef3356200b3e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -177,8 +177,12 @@ static void bam_dmux_tx_callback(void *data)
>   {
>   	struct bam_dmux_skb_dma *skb_dma = data;
>   	struct sk_buff *skb = skb_dma->skb;
> +	struct net_device *netdev = skb->dev;
>   
>   	bam_dmux_tx_done(skb_dma);
> +	if (netdev)
> +		dev_sw_netstats_tx_add(netdev, 1,
> +				       ((struct bam_dmux_hdr *)skb->data)->len);
>   	dev_consume_skb_any(skb);
>   }
>   
> @@ -368,6 +372,7 @@ static netdev_tx_t bam_dmux_netdev_start_xmit(struct sk_buff *skb,
>   
>   drop:
>   	bam_dmux_tx_done(skb_dma);
> +	dev_core_stats_tx_dropped_inc(netdev);
>   	dev_kfree_skb_any(skb);
>   	return NETDEV_TX_OK;
>   }
> @@ -402,6 +407,7 @@ static const struct net_device_ops bam_dmux_ops = {
>   	.ndo_open	= bam_dmux_netdev_open,
>   	.ndo_stop	= bam_dmux_netdev_stop,
>   	.ndo_start_xmit	= bam_dmux_netdev_start_xmit,
> +	.ndo_get_stats64	= dev_get_tstats64,
>   };
>   
>   static const struct device_type wwan_type = {
> @@ -421,6 +427,7 @@ static void bam_dmux_netdev_setup(struct net_device *dev)
>   	dev->needed_headroom = sizeof(struct bam_dmux_hdr);
>   	dev->needed_tailroom = sizeof(u32); /* word-aligned */
>   	dev->tx_queue_len = DEFAULT_TX_QUEUE_LEN;
> +	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
>   
>   	/* This perm addr will be used as interface identifier by IPv6 */
>   	dev->addr_assign_type = NET_ADDR_RANDOM;
> @@ -533,6 +540,7 @@ static void bam_dmux_cmd_data(struct bam_dmux_skb_dma *skb_dma)
>   		break;
>   	}
>   
> +	dev_sw_netstats_rx_add(netdev, skb->len);
>   	netif_receive_skb(skb);
>   }
>   
> 
> base-commit: 2188569e7e1b0bc3f3b557dc97ab7a02befc11c8

