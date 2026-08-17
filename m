Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BAD45628B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786988701; cv=none; b=LFArGzImAthdBwXwqOytDIsaWX/P1ZHDrKyFih7pRtxEBxy6OMqLtmscCTcCnGZd6tYD4kJPwVlr7iU3tv4S9YfJ3H7hqbg4EozUfYL7JggNMsUyxexPmAONnIrXbNHGdeansZGa26iMzr4TvC+mA8Y0KLzp5hKvylJew/pst8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786988701; c=relaxed/simple;
	bh=A/BYLk7bw9Ejae64R/1icJiIkrzaDbooTjrEXUYratA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZcKoz15+z+/hhmwNm+ZHnq7OYpHwFF9cHj5Fl15wa8XlN7l/WQGYQ/MJXzQ4NJ6jKpGHwrYRND1AIcR/Z7/hq9ur8i/W7A2RdCPXlZSr1D2XbGJh+aRP9JRyTBV2Y17Vfa0u69dgsEU344dOWbYZCUEkdo6pW/Nut0L/z24Hjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FMCu0xkE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FMCu0xkE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4813ea321cdso89417f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786988697; x=1787593497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6O6VTakhY2h37xUYJTqMZ6cRR1Y8QjlwcHWujcmkns=;
        b=FMCu0xkEPhq5SUhy1ow2d8CFomUhUHwavQ4f5P7LllaP/Gab4TzFc2pGj10bzYOS5/
         fMqJZ9BfPPRqgJgLA3uutx62EEnRLlDUtdVNnscGsyZxsavovaQQ7swtWM/BrbF5xvrC
         h7BGS1RoiAOXf+EhwpCzehi5s6jIo62WCf7Gow3eSwYz+n+Gn+f3HZ7nfAgFSpGVObST
         uwkr2ykew/1NFsSL0mYeVASAIow845Eoz2DAShEG5RQYiF4gFNkSKLn2yXYDXOc9KxQC
         BZQvaP3DdXvnIlH1/K7JvEidFrSfTNkC8IXAxqeQ3ID28DQL246UJ1RsVnwRKvhV+onK
         1Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786988697; x=1787593497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6O6VTakhY2h37xUYJTqMZ6cRR1Y8QjlwcHWujcmkns=;
        b=SMbYx4SP8lCgdFo/3o+yGbNedTUpqEuWgfxuTUiPsyGbMcQQAD/TfYJAvysix/JUXu
         XlE2z6ItGYZ4ioqxSxz5AvoGnuXXPwAnpjuUAJ9RqrB/N+t+A1kg1KMQsUwyM5w1Uu4j
         LMm4qAvvoosUFflcRTfAgiuzZJrtpKDXK352jLnipQMdJqJJT8q8XDKO/ND9chdY4bUA
         REe2qMHVZJ8sy7Xb3g9gHFktpZuTe4W6tlpY69SSdxGSXeKPbKZHomqeGBhlUSra+MU1
         iVU5YBAa0Vu8X7qQdmye+BncVvp/XmX3sPRqVcILfPkFrWHnxzDqfEEw99iJambDcfN+
         VZZA==
X-Forwarded-Encrypted: i=1; AHgh+RqzFSpP0BDixjcZ5kZne8bfgL4hPoI2sCSxqaoSPnS9lJ6mSOlkLxajEIGCyc0jClTw3NaZSzcsKGAEFGLh@vger.kernel.org
X-Gm-Message-State: AOJu0YxbMgvogPLSc0f4RSekJxXnWC1w3NgkRPDf3JwVR6/zboBS5jqW
	lxkraRXloEbzF1jJ+CmWSBuTa67dSSbVQHNwQHAuyoc+7/cYmSgNYLwB9RWUsxGjPdM=
X-Gm-Gg: AR+sD10Pjla8TlRyBFE4qcc8PjS4qWgytqVU/NsEVUz+Lo4hWCgroCLoC7BbUWrd7fM
	mLUXNLumIAJYhgXXVbAdsBqXPQb7VUrWbb9Y3+Xe+gJSv7cpBXKrvo7sr3/J6HZTB3w7GzJU3jh
	8SSku2AS0SZ8sv+/pIOBzYTFSrgDbwupI1BfRXrN0qMxcX6Vbc9VtKmZQ1QqxsJUunzkFZL3VFI
	PTwh/fJ45vqVRav7xSaDyIxibaI3G/l+d8a3EJpEJOox/9ZR4A2LbBOgXEjvcsuZvCVyykxLsPJ
	z0WL6EGWivZdZJXMNx8hNx0oYefKMi8cTISR+X0MQF8zRrlXuNvStAIaNZRRoHbhK2zPJ6b/Kix
	lXmoUsiSGiUQSiB2wnaoca7dIVTa2zcpahTwmhwXYEYziu3Nb3tDE3So4czkRCbP6JGzqht862S
	ddEMY7IpQ7XHUDQl7xHO+c3/5C4dtKHh1o6Ts8/LIxxXKJ+Lyah6HuZrJNO8j4mL7OHQYguZ8v
X-Received: by 2002:a05:600c:34c7:b0:499:8afd:4a9f with SMTP id 5b1f17b1804b1-499a05ac869mr20348795e9.0.1786988697459;
        Mon, 17 Aug 2026 10:44:57 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7281:1989:ca4f:c9c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7c568sm5614066f8f.18.2026.08.17.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 10:44:57 -0700 (PDT)
Date: Mon, 17 Aug 2026 19:44:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v3] net: wwan: qcom_bam_dmux: fix TX DMA channel
 use-after-free
Message-ID: <aoNIjgCblcfcxUVI@linaro.org>
References: <20260815100454.695-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815100454.695-1-getshell@seu.edu.cn>

On Sat, Aug 15, 2026 at 06:04:53PM +0800, Hongyan Xu wrote:
> The modem power-control interrupt can release dmux->tx while the command,
> netdev transmit, or deferred wakeup paths are preparing and submitting
> DMA descriptors. A runtime PM reference alone does not order those paths
> against the modem-driven interrupt.
> 
> The pc and pc-ack IRQ actions do not encode the modem protocol order. A
> pc=false edge raised before a new host power vote is acknowledged can
> therefore be handled after runtime resume observes the acknowledgment and
> starts using TX. On the other hand, acknowledging a new pc=false transition
> while the acknowledged host vote remains active lets the modem power down
> the DMA engine underneath the driver.
> 
> Serialize power-control state with a mutex and distinguish a requested host
> vote from an acknowledged one. Publish each vote acknowledgment and its
> completion under that lock. Before publishing the host-vote
> acknowledgment, sample the actual pc line and process any delayed
> transition. A valid pc=false transition is then handled before runtime
> resume returns, when no path can submit through TX. The channels are
> released before pc is acknowledged, and a queued BAM_DMUX_CMD_OPEN remains
> queued for the new TX channel.
> 
> If pc goes low after the host vote was acknowledged, refuse the pc
> acknowledgment and keep the DMA channels allocated. Remember the pending
> transition so runtime suspend can first release the channels and only then
> acknowledge pc=false. This preserves the protocol ordering without exposing
> a released TX channel or cancelling an OPEN command that already succeeded.
> 
> Both IRQ handlers can now change the DMA channel state. Keep them
> inactive until the initial probe state is committed, and disable both
> before the final remove cleanup and before cleaning up a failed probe.
> 
> This issue was found by the author's in-house static analysis tool.
> The patch was reviewed by the author.
> 
> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---
> Changes in v3:
> - Sample the pc line before publishing a host-vote acknowledgment so a
>   delayed, valid pc=false transition is completed before runtime resume.
> - Refuse to acknowledge pc=false after the active host vote was acknowledged.
> - Complete a refused down transition during runtime suspend, releasing the
>   DMA channels before acknowledging it.
> - Serialize the vote acknowledgment and completion with vote changes.
> - Gate both state IRQ handlers until probe initialization is committed and
>   quiesce both before probe-error or remove cleanup.

Thanks for reworking the patch again!

I think this approach could be viable. I need to allocate more time to
fully understand the changes you are making, but so far it seems
reasonable given the constraints we have in this driver.

A few initial comments below, perhaps this will help for my
understanding.

> 
> Changes in v2:
> - Track the host power vote and serialize the power-control paths.
> 
> Link: https://lore.kernel.org/netdev/20260808083457.2023-1-getshell@seu.edu.cn/
> Link: https://lore.kernel.org/netdev/20260806060642.1281-1-getshell@seu.edu.cn/
> 
>  drivers/net/wwan/qcom_bam_dmux.c | 192 ++++++++++++++++++++++++++-----
>  1 file changed, 161 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8..41928ed 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -12,6 +12,7 @@
>  #include <linux/if_arp.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/netdevice.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -67,12 +68,17 @@ struct bam_dmux_skb_dma {
>  struct bam_dmux {
>  	struct device *dev;
>  
> -	int pc_irq;
> +	int pc_irq, pc_ack_irq;
>  	bool pc_state, pc_ack_state;
>  	struct qcom_smem_state *pc, *pc_ack;
>  	u32 pc_mask, pc_ack_mask;
>  	wait_queue_head_t pc_wait;
>  	struct completion pc_ack_completion;
> +	struct mutex power_lock; /* Protect power-control state */
> +	bool pc_vote;
> +	bool pc_vote_acked;
> +	bool pc_down_pending;

It's a bit tricky for me to fully understand all combinations of this
flag. Could we use an enum for these to describe only the states that we
care about? E.g. something like

enum bam_dmux_pc_vote {
	BAM_DMUX_PC_VOTE_INACTIVE,      /* pc_vote = false */
	BAM_DMUX_PC_VOTE_PENDING,       /* pc_vote = true, waiting for ACK */
	BAM_DMUX_PC_VOTE_ACKED,         /* pc_vote = true, ACK received */
	BAM_DMUX_PC_VOTE_DOWN_PENDING,  /* pc=false received while host vote active */
};

> +	bool ready;
>  
>  	struct dma_chan *rx, *tx;
>  	struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
> [...]
> @@ -670,25 +694,63 @@ static void bam_dmux_power_off(struct bam_dmux *dmux)
>  	bam_dmux_free_skbs(dmux->rx_skbs, DMA_FROM_DEVICE);
>  }
>  
> -static irqreturn_t bam_dmux_pc_irq(int irq, void *data)
> +static bool bam_dmux_handle_pc(struct bam_dmux *dmux, bool new_state)
>  {
> -	struct bam_dmux *dmux = data;
> -	bool new_state = !dmux->pc_state;
> +	lockdep_assert_held(&dmux->power_lock);
> +
> +	if (new_state == dmux->pc_state) {
> +		if (new_state)
> +			dmux->pc_down_pending = false;
> +		return false;
> +	}
>  
>  	dev_dbg(dmux->dev, "pc: %u\n", new_state);
>  
>  	if (new_state) {
> -		if (bam_dmux_power_on(dmux))
> +		if (dmux->rx || bam_dmux_power_on(dmux))

Do we need this new check, especially given that you added
if (new_state == dmux->pc_state) above? I would think it should be
impossible to arrive here with dmux->rx allocated.

>  			bam_dmux_pc_ack(dmux);
>  		else
>  			bam_dmux_power_off(dmux);
> +	} else if (dmux->pc_vote && dmux->pc_vote_acked) {
> +		/* The modem must keep the DMA engine on until pc is acked. */
> +		dmux->pc_down_pending = true;
> +		dev_err_ratelimited(dmux->dev,
> +				    "refusing pc down while host vote is active\n");
> +		return false;
>  	} else {
>  		bam_dmux_power_off(dmux);
>  		bam_dmux_pc_ack(dmux);
>  	}
>  
> -	dmux->pc_state = new_state;
> -	wake_up_all(&dmux->pc_wait);
> +	dmux->pc_down_pending = false;
> +	WRITE_ONCE(dmux->pc_state, new_state);
> +	return true;
> +}
> +
> [...]
> @@ -724,40 +820,55 @@ static int __maybe_unused bam_dmux_runtime_resume(struct device *dev)
>  					 BAM_DMUX_REMOTE_TIMEOUT))
>  		return -ETIMEDOUT;
>  
> +	synchronize_irq(dmux->pc_irq);
> +
>  	/* Vote for power state */
> -	bam_dmux_pc_vote(dmux, true);
> +	bam_dmux_pc_vote_protected(dmux, true);
>  
>  	/* Wait for ack */
>  	if (!wait_for_completion_timeout(&dmux->pc_ack_completion,
>  					 BAM_DMUX_REMOTE_TIMEOUT)) {
> -		bam_dmux_pc_vote(dmux, false);
> +		bam_dmux_runtime_suspend(dev);
>  		return -ETIMEDOUT;
>  	}
>  
> +	synchronize_irq(dmux->pc_irq);
> +
>  	/* Wait until we're up */
> -	if (!wait_event_timeout(dmux->pc_wait, dmux->pc_state,
> +	if (!wait_event_timeout(dmux->pc_wait, READ_ONCE(dmux->pc_state),
>  				BAM_DMUX_REMOTE_TIMEOUT)) {
> -		bam_dmux_pc_vote(dmux, false);
> +		bam_dmux_runtime_suspend(dev);
>  		return -ETIMEDOUT;
>  	}
>  
> +	mutex_lock(&dmux->power_lock);

Personally, I think this function would benefit from using

guard(mutex)(&dmux->power_lock);

to simplify all the error paths.

> +
>  	/* Ensure that we actually initialized successfully */
>  	if (!dmux->rx) {
> -		bam_dmux_pc_vote(dmux, false);
> +		bam_dmux_pc_vote_locked(dmux, false);
> +		if (!dmux->pc_state)
> +			bam_dmux_power_off(dmux);
> +		mutex_unlock(&dmux->power_lock);
>  		return -ENXIO;
>  	}
>  
>  	/* Request TX channel if necessary */
> -	if (dmux->tx)
> +	if (dmux->tx) {
> +		mutex_unlock(&dmux->power_lock);
>  		return 0;
> +	}
>  
>  	dmux->tx = dma_request_chan(dev, "tx");
>  	if (IS_ERR(dmux->tx)) {
>  		dev_err(dev, "Failed to request TX DMA channel: %pe\n", dmux->tx);
>  		dmux->tx = NULL;
> -		bam_dmux_runtime_suspend(dev);
> +		bam_dmux_pc_vote_locked(dmux, false);
> +		if (!dmux->pc_state)
> +			bam_dmux_power_off(dmux);

I understand that runtime_suspend() is now handling the pending pc
transition, but why do we need power off handling in runtime_resume()?

Previously, runtime PM was really fully focused around the TX channel
management, so I'm a bit confused to see this here.

Sashiko is also complaining that the pending state isn't taken into
account here (which might be correct, but I haven't understood yet why
this is here at all).
https://sashiko.dev/#/patchset/20260815100454.695-1-getshell%40seu.edu.cn

> +		mutex_unlock(&dmux->power_lock);
>  		return -ENXIO;
>  	}
> +	mutex_unlock(&dmux->power_lock);
>  
>  	return 0;
>  }
> @@ -766,8 +877,9 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct bam_dmux *dmux;
> -	int ret, pc_ack_irq, i;
> +	int ret, i;
>  	unsigned int bit;
> +	bool pc_state;
>  
>  	dmux = devm_kzalloc(dev, sizeof(*dmux), GFP_KERNEL);
>  	if (!dmux)
> @@ -780,9 +892,9 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  	if (dmux->pc_irq < 0)
>  		return dmux->pc_irq;
>  
> -	pc_ack_irq = platform_get_irq_byname(pdev, "pc-ack");
> -	if (pc_ack_irq < 0)
> -		return pc_ack_irq;
> +	dmux->pc_ack_irq = platform_get_irq_byname(pdev, "pc-ack");
> +	if (dmux->pc_ack_irq < 0)
> +		return dmux->pc_ack_irq;
>  
>  	dmux->pc = devm_qcom_smem_state_get(dev, "pc", &bit);
>  	if (IS_ERR(dmux->pc))
> @@ -799,6 +911,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  	init_waitqueue_head(&dmux->pc_wait);
>  	init_completion(&dmux->pc_ack_completion);
>  	complete_all(&dmux->pc_ack_completion);
> +	mutex_init(&dmux->power_lock);

devm_mutex_init()

>  
>  	spin_lock_init(&dmux->tx_lock);
>  	INIT_WORK(&dmux->tx_wakeup_work, bam_dmux_tx_wakeup_work);
> @@ -817,31 +930,41 @@ static int bam_dmux_probe(struct platform_device *pdev)
>  	pm_runtime_use_autosuspend(dev);
>  	pm_runtime_enable(dev);
>  
> -	ret = devm_request_threaded_irq(dev, pc_ack_irq, NULL, bam_dmux_pc_ack_irq,
> -					IRQF_ONESHOT, NULL, dmux);
> +	ret = devm_request_threaded_irq(dev, dmux->pc_ack_irq, NULL,
> +					bam_dmux_pc_ack_irq, IRQF_ONESHOT,
> +					NULL, dmux);
>  	if (ret)
>  		goto err_disable_pm;
>  
>  	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>  					IRQF_ONESHOT, NULL, dmux);
>  	if (ret)
> -		goto err_disable_pm;
> +		goto err_disable_pc_ack_irq;
>  
> +	mutex_lock(&dmux->power_lock);
>  	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
> -				    &dmux->pc_state);
> +				    &pc_state);
>  	if (ret)
> -		goto err_disable_pm;
> +		goto err_unlock_disable_irqs;
>  
>  	/* Check if remote finished initialization before us */
> -	if (dmux->pc_state) {
> -		if (bam_dmux_power_on(dmux))
> -			bam_dmux_pc_ack(dmux);
> -		else
> -			bam_dmux_power_off(dmux);
> -	}
> +	bam_dmux_handle_pc(dmux, pc_state);
> +	dmux->ready = true;

Do we need the ready flag? Can we just leave the interrupts initially
masked (IRQF_NO_AUTOEN) and then enable them here?

Thanks,
Stephan
