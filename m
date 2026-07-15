Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55743AD52B
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131603; cv=none; b=IJ5Jr1vts+ZOqhIyWR6YlUeT5Yo5DC77xpkxArDN1XKuDOCpoGYz1S3GweiVIZBl+PRk8VfsSaHAsnsAu/NkirNuB0gc0kb4FXUArPAB/gZt4BURkuFv33Kb9yLBYJSm4hxXttdFQhM05NwmXvyH35mA1c45T9cCp/baRZH1sbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131603; c=relaxed/simple;
	bh=uPscrPb3ETPjEhpObEhVsTsiQn+HK7qL2dKRijNuK8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyU9NDLRJICdWrBlDjofTUCvx9sfTLyJpaH+Tscvc9j1O5ULDQSI+mbZaHXz9kHIRCeVJOgyqeYx5uZShq0xnvI8hcK4yO51mOyBUo26m6cnM9CpdSsAr4l9BKZE8Y/OeZmdH2KWuxKXzxIrLnVNx0PhpJI/Io1wwtqU+pbCd5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hjnlF1vz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hjnlF1vz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40455225e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784131598; x=1784736398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lQdKSmRz9WhvxdTzt01CBN7vUfgGKc2JFY2x/IMYok=;
        b=hjnlF1vz47Oz70AH3vJwmph7B0yPP+8/Rrd2tz1c8lpaeXL78K2A9Qklg8KGgBXM+m
         4y+IYECvRG9rOILvyZKc9iasPvZAQCaUA/FnFL5ChRInyhZ0WpNqGl5HzdI07j9XVYGv
         FOkAuB2zNqd4By6LNMjxF4B9ydgcZO52AyvvpfllrXie/0bmfp1kKOjQFFLUlTIhE6Y3
         UTdVW55NLxmAbk5hIhXzXXmK6bdcRp612WC/rZwEqxTPx8fX0dC7SLezHTAZVhGYbTU9
         5pc+6V7JXu/FeYeY4GYCKjVMIymkA0eI+DltPWnOBxZOmC2Ytul6XwB03nYfQ2jMIc50
         Yydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784131598; x=1784736398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lQdKSmRz9WhvxdTzt01CBN7vUfgGKc2JFY2x/IMYok=;
        b=ACVWTk4f2v4alMOa8xckA+43lI7O5N9zIUPhVqvlTtXoH10E3dANqVylmLse8vT5Vl
         jP65c7qcvtI84EGKBDxldyzVXFeviHzH/imcTDxwR66BcTvmq5ZB3Bi2Jd8vFmDcCXAH
         gubqsf1iQlawZNQdZ78/mCZp0fPR32HSSaDxdpY6bZBGZgi272+1vI3LTmekDjS7Cmtd
         ks03gxmG3vK90Kik/Zf6BdbV4wNvFppanww0LNGTJExgIlrs3dmWO+8M7ntdnYMOWDbZ
         4LmPnaVcNokt5ca8ToFYcSR3rsBbChXVy9iSeyTs4U+3CkxklvOzuTgaOhYGlway57Zi
         PxAg==
X-Forwarded-Encrypted: i=1; AHgh+RrL3W7A8OKyS/nLwnzFlTrJAh+X+ctmvJ9Cd780yIoYARqpu51CVZzfx1KmpibANk5zaYKI2lF0+E2GbAZC@vger.kernel.org
X-Gm-Message-State: AOJu0Yybj9shvSo9ugtRD+KBCZ1K35pGqqDnETREkoUnrI03C5wtoRnT
	jbBtxuFHLaG57acAu1p1oSIUXOvy7xfMzwzuYjGDkZalp1yl98dzXCry7i+wfallN4KhCmwME8i
	JPIZ9kH8=
X-Gm-Gg: AfdE7clnfLXUNrR57PIcVkGIWTw3930Vu5Qq/728PYfTklDY5nx66re6ftjLyR7cRIY
	QhftsYqzWxIG6md3XEYUAfT2cIvW1hvukF26tB9dqC/x80nkaJsy0dKvplciW0cDp1gb+aoT0Ns
	AMx0VuTXNY7lf9JNCRFl+lyhnQhVYBBRbbwk818YdZHHzSFL9OndAUSiHy7J9uHTfYT4mZ+EQ6D
	UGWrum/GYPh07nFxle1ltYfB3njaLIdCUvoKi5+nK8xOYAY/XD+doaNgKl3xWyx5xgDYR/7be7j
	fjktY6otROIruC8OGUq2cvp2u9dVGE4TL68HKKjEMSuZBYsCwg3s0x0INwkjt1BRFP07DXGeZCw
	g1pMxlgO+/G8N8grPH+yrZx1ladPajSXQ2Cx66eZjGfHsjM2+9ohDo2mODWam5I89llGQeY+kAl
	JCF8/Kfrxz1li/SkDq/hSIOJstTDloaKO9umA=
X-Received: by 2002:a05:600c:8b6d:b0:495:3fc4:81b4 with SMTP id 5b1f17b1804b1-495403fcaadmr9759685e9.30.1784131597440;
        Wed, 15 Jul 2026 09:06:37 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:d62b:a557:d06c:e9ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm232743795e9.12.2026.07.15.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:06:36 -0700 (PDT)
Date: Wed, 15 Jul 2026 18:06:27 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v21 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <alewA9ubkYKHpnuj@linaro.org>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
 <20260713-qcom-qce-cmd-descr-v21-6-bc2583e18475@oss.qualcomm.com>
 <alYGGu7_3G6mJAzQ@linaro.org>
 <CAMRc=MevqXga1u-XC8LYc3hnjjzmdESntsSGYP25XECeeySfJA@mail.gmail.com>
 <alepDnRJmRLbFGRQ@vaman>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alepDnRJmRLbFGRQ@vaman>

On Wed, Jul 15, 2026 at 09:06:46PM +0530, Vinod Koul wrote:
> On 15-07-26, 14:43, Bartosz Golaszewski wrote:
> > On Tue, 14 Jul 2026 11:49:14 +0200, Stephan Gerhold
> > <stephan.gerhold@linaro.org> said:
> > > On Mon, Jul 13, 2026 at 03:01:07PM +0200, Bartosz Golaszewski wrote:
> > >> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> > >> channel - prepend the existing queue of issued descriptors with an
> > >> additional "dummy" command descriptor with the LOCK bit set. Once the
> > >> transaction is done (no more issued descriptors), issue one more dummy
> > >> descriptor with the UNLOCK bit.
> > >>
> > >> We *must* wait until the transaction is signalled as done because we
> > >> must not perform any writes into config registers while the engine is
> > >> busy.
> > >>
> > >> The dummy writes must be issued into a scratchpad register of the client
> > >> so provide a mechanism to communicate the right address via descriptor
> > >> metadata.
> > >>
> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > [...]
> > >> ---
> > >>  drivers/dma/qcom/bam_dma.c       | 191 +++++++++++++++++++++++++++++++++++++--
> > >>  include/linux/dma/qcom_bam_dma.h |  14 +++
> > >>  2 files changed, 198 insertions(+), 7 deletions(-)
> > >>
> > >> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > >> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f08549ee3872eece85884606d6ee9e540ee688ca 100644
> > >> --- a/drivers/dma/qcom/bam_dma.c
> > >> +++ b/drivers/dma/qcom/bam_dma.c
> > >> [...]
> > >> @@ -686,6 +702,35 @@ static int bam_slave_config(struct dma_chan *chan,
> > >>  	return 0;
> > >>  }
> > >>
> > >> +static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
> > >> +{
> > >> +	struct bam_chan *bchan = to_bam_chan(desc->chan);
> > >> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > >> +	struct bam_desc_metadata *metadata = data;
> > >> +
> > >> +	if (!data)
> > >
> > > Doesn't really matter much, but since the parameter exists you might as
> > > well add
> > >
> > > 	&& len == sizeof(*metadata)
> > >
> > > here to be sure.
> > >
> > 
> > Ok.
> > 
> > >> +		return -EINVAL;
> > >> +
> > >> +	if (!bdata->pipe_lock_supported)
> > >> +		/*
> > >> +		 * The client wants to use locking but this BAM version doesn't
> > >> +		 * support it. Don't return an error here as this will stop the
> > >> +		 * client from using DMA at all for no reason.
> > >> +		 */
> > >> +		return 0;
> > >> +
> > >> +	guard(spinlock_irqsave)(&bchan->vc.lock);
> > >> +
> > >> +	bchan->scratchpad_addr = metadata->scratchpad_addr;
> > >> +	bchan->direction = metadata->direction;
> > >> +
> > >> +	return 0;
> > >> +}
> > >> +
> > >> +static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
> > >> +	.attach = bam_metadata_attach,
> > >> +};
> > >
> > > I'm not sure if we have discussed this before, but could we avoid
> > > re-programming the scratchpad_addr all the time by placing it into
> > > struct dma_slave_config -> peripheral_config? It still feels awkward to
> > > me to place a global constant configuration value into per-descriptor
> > > metadata.
> 
> The concept is that a dmaengine can handle multiple peripherals, so the
> peripheral is always per desciptor
> 
> > Yes, this was discussed several versions ago. I went with using
> > dmaengine_slave_config() until v11. I think Vinod or Dmitry requested we change
> > it to the metadata.
> 
> metadata seems better fit for this.
> 

Modelling this as descriptor metadata is really misleading. You call
dmaengine_desc_attach_metadata() on a specific descriptor, but then the
bam_metadata_attach() above just writes it globally into

desc->chan (struct dma_chan) -> to_bam_chan() (struct bam_chan)
-> bchan->scratchpad_addr

The descriptor that you pass in is completely unused. If you call this
on a different descriptor later with a different value, it will just
change the global configuration for the previous descriptor as well (if
they are submitted together). It will always be like this, since it's
the entire channel (and descriptor sequence) that is locked and not an
individual descriptor.

dmaengine_slave_config() operates directly on the struct dma_chan, so it
is IMO the right place to add this. That makes it clear that this
configures something for the entire channel.

I don't think that breaks support for multiple peripherals connected to
a single BAM (dmaengine). A BAM pipe (channel) should always belong to a
single peripheral. And even if it belongs to multiple peripherals, we
still need a single "scratchpad_addr" to use for the lock/unlock
sequence.

I would avoid using struct dma_slave_config->dst_addr (like in v11) [1]
though, since it's more a "address to dummy register" now than the
actual dst_addr of the peripheral. That's why I suggested
struct dma_slave_config->peripheral_config.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20260302-qcom-qce-cmd-descr-v11-7-4bf1f5db4802@oss.qualcomm.com/
