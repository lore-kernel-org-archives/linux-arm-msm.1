Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731742;
	b=CeSFakS7sfN3mfGTSF5nMLX4IhL7ibkboXORJeLjeoP5Ybsrp831MaWNNqvcN3uHRoZx
	 RSEed3P9jO44cb6XEqPMTlB+j2RpFgNH3yakc9/16fu7ba5kxHB0dL5Vj+n8gc1jEgOqh
	 vJoxnlPQguZQ02p5twANmfeo0vpXQQOoKONBDUalPrOV6PL6xUElOh4Zn2WJD2ita88Ff
	 trtSkmndY5227dTtFs1hBSgpPe5GVuB0l32lVo/LTt+wyxf2iSKDLqyd5xPmiBEeMC4yo
	 F4Agjkk3Ha+aUGdfrLhHdzlNJTWR03yurjGRSw4kYgTKjDFHJM0THe4zAdk0k9ds0Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
	b=AhBAElGMrZdbabDwbi7Lg2MIWiooevBWCfh2fttV1Rkv/FELWj3wVIvaYkpj0ivvS5TZ
	 7o2hE5aS6nmgTpT9Xg87atr3tn4TN97OuyMQ1ZEckwmfgFKOyGDpHIe4PlFEn0DESDEyI
	 ZkhTwVvOlEhLrtYkcjgfvkKr4fWX8US8ouUDKASVvH4SbZEbUB3orsHw2o2lQHZnYHRUd
	 jNBzu9VzFe6+DBf/mT8wiEeCEQR+yaKfVXIG8QibCl6lYcx5T2X02kANAk3qSmUO1eVEG
	 2mfqeD0ug/z7X/7AYDAFFzlzL2FFhrD8mmHkBO6nwB4vfyP9bWc5M3xvHVRg4kiFCow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l2wyXFYq;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00E606A331
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F00E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l2wyXFYq
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so3307603a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793731741; x=1794336541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=l2wyXFYqZ38HdD8weK/KapS0MavCwUQNm5m8p8EfD+xcRcfXIyTrWWCNYRgp+/vQ0i
         ksJeEnZRdauMXUDBIZc/C71nEF+uDmJu0b2vpkgdxljq1Llv0dVefDe8tt/GoIUKxdDi
         3xRF0zFO9MWrdxdNUCyRSdqrWItJMZuhGMr20/CjBv3vMHjFjcO3YJ4KB2UcGkjbav0W
         m1relR/fPR+6ZF2d2H70rXUjyAYD34Uf84QZMC23/6a0tilojHf/umSUEE2/WXKUOb8Z
         NKpSimujPUoPOAcbNR09PhouGBvrnhvrxiWmGn8meE7bZMxPXPfKrnVl4uhWDJVGvnIm
         iNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731741; x=1794336541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gZOM3Lc0bVWMBjTHBnWLKucS3KUPQN4gjQNABudBe20=;
        b=uLXJ4TLlkDFniOkhZBoTSCRDy5SGl05DKAkwP9b4zERVaePvwVctmzfgS5iIiN8p5v
         ZUlBUzeiIt5tc6nQpoxfqPcHaUCHwrWtpOhhSgax7BDDDM3zd5KRxpyDUAryneRsmEVK
         cZwv+iATbBVleCP1ou2UotMnkDzs2uuLFGUrK9Rn45nGWDjOSBpOhUinMkMKXUosjN/+
         +BxAXpryvdaabmkB6DPCYVtyU3dc4mfv4C/iqSV3WKLNhcxwR49wtXfxAey++oamEFM2
         nZ8OTyBHHvU6pJWj1xfIzESajEplU72Zn47c8ObpnzuzTnLvHBz6d9ROXTny1ruuneJ+
         MvHA==
X-Forwarded-Encrypted: i=1; AKwUvBxM/D4llm4ho5lGVkjfTwqwdh8+G2Df4DaU2zOo1HxubxWDnzM/MsmklQq360Hevplvbqyalmo3c4yYYQkR@vger.kernel.org
X-Gm-Message-State: APuU4Z82yptTkggu4gJ2bnXoMoB7WyRqEuke6nq4zn9/oVmzuCjlBTPj
	L5geDWOLfqAWXDPC/DLGzMgv1epYyVkrKuYwPvR3c4pMTAjBbxADTipGMOUE8IHctWc=
X-Gm-Gg: AYBFou3BR5otSuy2jAlL683E1UdadmLD5CRfUB6t/2Nuu+WimA2WkDQ6kihTyYscsK6
	StkWicCWDP51KJ/akXj0HlEcbCwAtNngsq0HQ8JJzF7sRoGZ775JUZkYYnfmnGkgxahqvamGv8X
	KgSuDu3fzAefroE/JFQ38VcLTeowW9aHGcCXAvnvmLjfROB/FPHEgCDnD/yp76Voa6tzjZHoUuj
	QfnqEi6v2WBTbj2H8DNDXARZuHFPGHdp211Ea3YArr8NOzsb7n3X3wQujz4y/GYSK52ZwOTVjeu
	oUbg9M8c4J2X9kBrcVWVbD2tI/w6O6XK286iRBboDQGZnD7IOwV3TlLEMA5v0iGrKsy5PsktaTz
	8vA0zxNVNRWBcGIXFefUz2WWBLVNKYuaYw+Dhz8BaH5ZxFGtDDLSfZnlpebiLn+dAxjMEr9zB4q
	VwJSuqsndhQ/BTT163s4H5Jirhv480bA8eCurc8x5/jYiY9ZVC7pomGWnuxyFFHfIMLaUHocbaS
	9SRxnemAr5D4qe02t5ZijWMfxEq9LcREAW9EeiTjNpi1WyNh6venx/4I2llBsG7NZ75HbOxCNnd
	MmC8vFmydXeb4De2hg1iElhSKqwzuazB8VXRYl8QcQ==
X-Received: by 2002:a17:90b:1d03:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3ae8984de33mr11985967a91.60.1793731740597;
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bd88bsm210133a91.12.2026.11.03.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:49:00 -0800 (PST)
Date: Tue, 3 Nov 2026 10:48:59 -0800
From: Joe Damato <joe@dama.to>
To: Frank Li <Frank.li@oss.nxp.com>
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
Message-ID: <auosm8mCULyafyny@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank Li <Frank.li@oss.nxp.com>,
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
 <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
 <aun4W3dvmfWRDFeQ@SMW015318>
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
In-Reply-To: <aun4W3dvmfWRDFeQ@SMW015318>

On Tue, Nov 03, 2026 at 09:06:03AM -0600, Frank Li wrote:
> On Mon, Nov 02, 2026 at 03:28:33PM -0800, Joe Damato wrote:
> > On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Replace open-coded assignments to callback and callback_param fields
> > > of struct dma_async_tx_descriptor with calls to the
> > > dmaengine_desc_set_callback() helper across net drivers.
> > >
> > > No functional change intended. Prepare to make struct
> > > dma_async_tx_descriptor private to the DMA engine.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
> > >  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
> > >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
> > >  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
> > >  4 files changed, 9 insertions(+), 16 deletions(-)
> >
> > [...]
> >
> > > diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> > > index cc6ace8d64371..1479f8362e04e 100644
> > > --- a/drivers/net/wwan/qcom_bam_dmux.c
> > > +++ b/drivers/net/wwan/qcom_bam_dmux.c
> > > @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_tx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> > >  	return true;
> > >  }
> > >
> > > @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
> > >  		return false;
> > >  	}
> > >
> > > -	desc->callback = bam_dmux_rx_callback;
> > > -	desc->callback_param = skb_dma;
> > > -	desc->cookie = dmaengine_submit(desc);
> > > +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> > > +	dmaengine_submit(desc);
> >
> > I noticed in the above that the return value of dmaengine_submit is discarded
> > instead of stored.
> >
> > Is that intentional? I suppose it might be because AFAICT cookie is never
> > used and the commit message says "no functional change intended".
> 
> dma_cookie_assign() already set desc->cookie in dmaengine_submit(). Of couse
> it is not obvious. Do you need me update commit message to descript it.

Ah, I see it now. In the tx_submit callback it looks like dma drivers set the
cookie.

So removing it here really is a no-op since it was getting set, as you said,
during submit.

My mistake. I don't think it's worth respinning just to fix the commit
message just because I didn't dig deep enough :)
