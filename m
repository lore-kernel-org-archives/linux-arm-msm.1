Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662116;
	b=Du44PSvT6/MkoGlN8O7LkgnWJZrB7nEDODDNI0U4Iu4oTfTpm6zMQaOs6QMhKYK7hJHO
	 eu4iSA6uGyW8sv+ZWteMn44o8kNl64qs6bdIWy46/AqZox+zZbDRKJ+MVzNEZQTkLGito
	 BrEAAUdD/+LlHLIGHtdoyd1upud1Ki0ayzFTHySv7AfG8qqXZe55TCjFmg8xP50Tpn4BK
	 Oqr+pfWoIQNUgNOaifqrgJF0koZh1t7PjuqTI32eI7vYDRnrzawEIaM7y5H12tkYikfip
	 2HEXGIix64CNV3zdxu8M6v7JoZ6N1z/qwRStiaFLNONl9TFXZx/go2bSin7sPbSRGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
	b=w1sM4MxAoAFfAXqA7r+LCsPACkPY4g4NUT9cEd71lZcmCoTXR+LmGqG/qVOBQ54q5fsQ
	 j8oL/08AzdEpoU6OL4m3dpgvSVEdKEn4QiEgHFEV2GEYHXz0MPYIqdc3Yy5TCYMu8f0CP
	 whYTTwJB/eQhhH3N3O6bAhns76/eq6Do2CLIUpK0FGi/iizMNb62T6uTZSrDHVl0G7qXu
	 x7qQP1YG4CusJqYHo/i6dYOVdX6zLteJaV1mQ4Q5aeySvZ1K7Ljl83IWcTYxBIMaoSX2I
	 wm4peUhn/NuhCO2P2DGHlA2UIlpF3BPBc3q8khmVYqEcNsGR5i96V5b+fl/6XWhuyJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uWLG9vMd;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D74606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D74606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uWLG9vMd
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so568201a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793662114; x=1794266914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=uWLG9vMdHRfPTQf8yd9B2J4pxCSDMU1Lyv+yKyLSFWcZ/0JjGOWoPfZTjIQeCA7c/F
         OhedkgLoE9Y6v/+A0GiDYtUdlHqMBMafuZG5l8XQG65zIrNDnLZdnfkXc751MGlMdG6e
         T+NnY/jViA3WbFwuN1QmnQRP3W3WcQbXnBXCMjsH5y8BHsPMy0m+YCGoTMQ6Uu9rBS/L
         +gZY/1AewV2MmqrMMKLSMyfjpsZSuav1FcnmSIOHFFw8pNp6K0I4X5UyoBO2upKDE2Xb
         AifxOTWB+utbQVyrtwcteTJXIrjPZIvf8XMjlVZXn0s8GYA8htbKQpMIKDDdw7mk8dfg
         /Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662114; x=1794266914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=vfUZyb9p9aY9yi6Es99pTDTmrY3ZEUJOHpLNEh6WPWVO+7ZiY4UUSZqnlu/b2FV8ho
         tGjaft+q17mHp85rwNmy4xajVfF7OGHZ1e4t2S8XIN+mVVQXmoswcdge7ZK+j43qgvZh
         ZvYrEAKnsEVBrmp4aw0lzvfkH3Cn0HwMpkZk2+h0y2o9l2091lKiShnTeyPcv9tyuL3D
         5c6C1KfHtk0phyJO5CCe8CWQDnYKBmdP256dq5QPYbqcp/+g5xDh6pQuFMNbZrooltdO
         XMrWBGhay6XDnw7i6OiFLhhXtIWFajPSRrU9LEIPEUKJKmkIoiQTRKrlZGc3kM41b9WU
         SyFw==
X-Forwarded-Encrypted: i=1; AKwUvBzVCJkxdXG1DY36F2QGakpUUBNBhvJ2xhSeLIH3Uv2O625e+gewxbZf67kxC4DCeys3hPMoEK2BKC6+ED2b@vger.kernel.org
X-Gm-Message-State: APuU4Z8ohEpq2u2DCJaTE4b/p6lW6u07VxUBvVN/sN14dgxTqiF4m0jV
	3MxWf5q+zi3iqLyE5BnDH+d72hxfdvLvGrEmIRfq6HvKexq6hNNCtjx6fI2dBWvWqwA=
X-Gm-Gg: AYBFou0U5uVuO1dv79cR7Ta0w6IIigiyC63n61O9Jbbcph0GOqW7DHrA9kRJ591FZ+B
	uZUO01y0VudSc3s1Lg251eclNAaz+fRf5HXUCwxqfaKMO1QB5dJkUuQ2YAulLD6+n68Pdpr/JZu
	Ozt1hRtGs/2cVT0LceUgYO7K0RPFJMYxefQmaau5Hg0SM917I+Futaef3IyLDfH10rgtBqHWi0a
	LXsmOFb2YWBJfkZ+SQZZo0+MQvNzE+NdfWR7P8rHMH1iAzdJKSJCuTho82qpkhr5n593pAwxV9a
	ND+1gOhgZy6iWT87kFGaF9RUnqHvyK3A3Xr4SqzNvOOCvdbYEcIPRXDiS8e3y+QjLFbCkQOrOF0
	GsOd+o9cE7Qx3FoMhAWPbuXb5BbWr2Jet09JeWMDcALszE2asq0gJugrvoVuA1QsHz+BdLG+Lbh
	1xPTaz2qaoqis9RKzyqXKkBi8jy8JdY2+LRLLJ1ySiRhS1DxMlEcTXebdyY29mFBjWx8Az45Y2Y
	qIWLmAhokM0nH8TXHFDkhtyWrD7wzqP7zL3n8QO50u7n/1ilfPXspkLj5YJQZ1ILsou4DTH2eha
	LFrD4LRyfL22/bvlbeaYBqTb9ACcoh4f7lZj0ZB0o8C1mvmw+bAwDtbtnwPLBmo=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr8946634a91.11.1793662114604;
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6271ccsm1233086a91.7.2026.11.02.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:28:33 -0800
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
Message-ID: <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>

On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)

[...]

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_tx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);
>  	return true;
>  }
>  
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_rx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);

I noticed in the above that the return value of dmaengine_submit is discarded
instead of stored.

Is that intentional? I suppose it might be because AFAICT cookie is never
used and the commit message says "no functional change intended".

Reviewed-by: Joe Damato <joe@dama.to>
