Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D91483807
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 16:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032926; cv=none; b=uOWo0aWlMOZVtb97ur1lJ1q+A1yBJ72DlHC9ruKTl6TAafOU0h+ZbBNSZOlxPkUXVan03x0K2eDK/nRGxqhy1xZFOUif8nE74Z5OBZOTw2rEWja1kty0bdJJZrtvvsS4cPKbGo7tebFU4cbBxrheZ6hOXnxSTjtou8HBwgfpWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032926; c=relaxed/simple;
	bh=rM6WqHOzLXNE8v5SZmM5/FLBmKxA9bCvbpnl5nnChoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nH4u74a32TUnM2ghPKCqWIVCfJGL1AdSe2nlmeCP8I3Y53RvciepdGKTZnHsBebgwnDkJSQJg1zDSLsytVKSsXGMAF5RVXO40+YdH0ztuf0YdrF8ESb81CDnio/pnmWEbTE2lA/5750bvWjz6YmpVTC2vySgi1kCm2I+p6IaJ84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vHABvYj7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vHABvYj7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495590dde14so27557145e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786032919; x=1786637719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ykpi2E0KhNqiLQYTNueRImn4Hqj48Xny1FxBziKOSww=;
        b=vHABvYj7FQ8Vdsn5lyZw0vzfGweaGPSIN3xOrbMU1te3Ubv2wBd4c9BbosRfSCEr+s
         kdKLVrfvkQFzX2mWynrLX7S1Ebc9WsfvZFXnvawgs4t41VRDaHbeZCj5+mQ7zeOiemmP
         Rtd6EuPT8FcXVyk6prHZ918SovQk599CzPZ651k/oRD3wEjIsomHBeaYKQcAvJyuLxb7
         wPcUuhjOaX/lyRmAhkh0xGvBBXzcu5PA/wxOHk6UlwetjpknrjXNSn+aE8kor/x2jNZr
         YDsg/66bXvh6uKBiummk3vEB6/xyvMdrUFcpzuCmeTdcGOBuz9ntILopVu620TgqVsJT
         7rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786032919; x=1786637719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykpi2E0KhNqiLQYTNueRImn4Hqj48Xny1FxBziKOSww=;
        b=hFP68D/7jwOPBo16BpsBjQnWggfUhL3p2wn0Jxi4Y8p0xJ9bCRmaPwnNnSaFEaRAvI
         MFUoSAsBmwykIKOpoOrt9dc/yR+OFUNUWILT2T4Jr3OpIzlm02IrqEak1dLAV22acRuQ
         yKNGoNPysVvLiaUC6KZIpGWN0LaUhEN+CF8tXwgALNKvCL1kXIWKZjr/oI8av5DTOIPw
         ymRqBE+UCjT8xeDJLf+tpkLH4XMVaTBkFc0LMdU8jobWOuOr+ZnNcjXJPfNsCABBGc8i
         W4pALRA7pzyUGBK3geFG4sxjCopZVj+Exn3nPPSeAjpEY5PCPygMWUNU3w8eb0dW0JWD
         U7pQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVm3SpytE7dH0E3pK9ssEO4TpN/pu8milYcxfVj5jGepJTx/lsFDe8Ah0q0rwi9oa2g39pMjpmtTbtoPsT@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs8to6rVI1rhfcfXevWgF/oouf8GRnzMJRiDmdRPatoEiTbq+y
	Rze0JuH78NyJEl/9txhLbacDxkOM545Hb0k2TvoNA6GQKxy9h3JvQoy5VEkH8mQXuls=
X-Gm-Gg: AR+sD128/BOUXZoDej9wXB74zZi+11iLG6Af6JSeOHgMmuDjvN0W5HDdZ/CAo1LgWrT
	CxuaDLjee8TlCk1W2O4a3o5CiQGQOzfCr6gonEXmiahS80pibWfzaphIDlFnHhFtpWfJ3okMLT6
	QVjUycd+HwzQVteCfOCk7PEWQ2oFJb0R6bbga7QKqaSNHiEPI852BKCgf0YeZWiutw1C+Du6wS3
	Gsn+trKcQPwIfhhBurc1knlct6lw5YK5NswsN5M0geOjufzw9aWG4OtEqQ9axSK4Gbl3BtqSmEt
	ITUqWpHQQlqRCISBLfNko0yVIFJgnmSckdIS0csxI9IS5VlU4sefuVet5S9P715DXa7FTMPaMMj
	2UpnV3KWoHw6PMc0tYOd6Qbryy8a66Fdu+sABbsTRXXTHQOr9NsN6Up0kNtIxsHsGEs97N4u+bR
	0Ak6E/eedASTZxeVaGFbyDROO+qRTOp7GQ9K8cvGd2PNh77sbQJsXFN9mIVS+D8SNhJQSau0o=
X-Received: by 2002:a05:600c:6b65:b0:499:5a02:e474 with SMTP id 5b1f17b1804b1-4995a02e4c0mr24663565e9.8.1786032919368;
        Thu, 06 Aug 2026 09:15:19 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:4854:e1d:a01a:cd13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422b741sm79494865e9.14.2026.08.06.09.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 09:15:18 -0700 (PDT)
Date: Thu, 6 Aug 2026 18:15:08 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: fix TX DMA channel
 use-after-free
Message-ID: <anSzDNYf0AMW7U9Y@linaro.org>
References: <20260806060642.1281-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060642.1281-1-getshell@seu.edu.cn>

On Thu, Aug 06, 2026 at 02:06:42PM +0800, Hongyan Xu wrote:
> The modem-driven power-control IRQ can release the TX DMA channel
> independently of the runtime PM callbacks. It can therefore race with the
> command, netdev transmit, and wakeup-work paths while they prepare and
> submit descriptors through dmux->tx. A runtime PM reference prevents
> runtime suspend, but does not serialize those paths with the external IRQ.
> 
> Protect TX channel users with SRCU. Clear the published channel pointer and
> wait for existing readers before terminating and releasing the channel.
> Serialize channel replacement and power transitions with a mutex, and
> discard deferred packets if the channel disappears after runtime resume.
> 
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>

Thanks for the report and patch!

Generally speaking, I would expect the modem never signals pc=false when
there is an active power vote from the host (which is modeled as the
runtime PM state in the driver). The BAM DMUX protocol is by design
quite fragile, so I think we could also just refuse to work with
non-conform firmwares, e.g. by never acknowledging such a broken IRQ
and keeping the TX channel allocated.

There is one rare situation however where this race condition could
occur even with a conformant firmware:

 1. The RX path is active (pc_state = true), but the TX path is idle
    (i.e. the host pc vote is false).
 2. We try to transmit a packet and request runtime resume.
 3. bam_dmux_runtime_resume() sends pc vote true.
 4. The modem sends pc_state = false, but the bam_dmux_pc_irq() handler
    gets delayed for some reason.
 5. The modem acknowledges the new pc vote (which would be followed by
    pc_state = true, but it will likely wait until the host has
    acknowledges the previous pc_state = false IRQ).
 6. bam_dmux_pc_irq() still hasn't run, so bam_dmux_runtime_resume()
    still sees pc_state == true, finishes and goes ahead with
    transmitting packets.
 7. bam_dmux_pc_irq() runs and frees the TX channel that is in use.

Your patch solves that by dropping packets in this situation. This can
be problematic, e.g. in the following situation:

 1. The RX path is active (pc_state = true), but the TX path is idle
    (i.e. the host pc vote is false).
 2. bam_dmux_netdev_open() runs and sends BAM_DMUX_CMD_OPEN.
 3. The command is put into the DMA queue and bam_dmux_netdev_open()
    returns success (it does not wait for a confirmation, at the moment).
 4. In this moment, the packet is cancelled again by
    dmaengine_terminate_sync() and the interface will never be opened.
 5. (In addition, bam_dmux_tx_done() is never called anywhere for the
     packet with your patch, so the buffer will leak...)

I think we need some approach that minimizes the overhead for handling
non-conform firmware, prevents the use-after-free, but also avoids
dropping queued commands where possible.

I'm not entirely sure yet what's the best way to do that. It may help
already to introduce some synchronization for power-related events (pc,
pc ack, runtime PM). For the situation above, I wouldn't expect the
modem to signal pc_state = false after it has already acknowledged the
new pc vote. This could theoretically happen with the current driver
though, since pc and pc ack are separate IRQs that are handled by
separate IRQ threads.

Suggestions welcome. I will also try to find some time to look into it
further.

Thanks,
Stephan
