Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B0E149C6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724493; cv=none; b=upeEhPVk364I+GJC1IItCGRYCUgNOMeZWxfkWXTGPU9MtQXF/DR6Rg+NgcB+rfy9sdRrh5WjsPZHzGMOSXaUKVmdwcsEkvqC1plIlGXKp2xitoml09HQkaJaYhSBMOG0Fs+U7hxbZAmymIcgBEHQCvNdyZblvSZMi/Z57vuvSSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724493; c=relaxed/simple;
	bh=LSan+qsl/PdUzA+3tf/f+0lljAi+xqioinYXzBQFQpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY1v6s6WL63bAQzcFH9OgLtwU65IrLJ8jyLERypPDOX3JBoviYSi1UtXWEUhue+Eedlm462AcgknTCo8BEhKPCpFIM4uuyD81gUfPacKuIjMguoDkdhuE9JyGwIV1C43APEm2AFO9YRAJWSw3RRGEy/T5SMNOZ6wo1NX5boefrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTDcGTKP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTDcGTKP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so65823105e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784724490; x=1785329290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=QTDcGTKPsYGAlYqslFtyfqpQMz8CFViRPzgVwUFv1krUZ4zz0Pen5q33Xp7SHZp4yI
         cND4LWrHo2fylcNol1+GAj1fBz02X6aGJRiIiwLT3K7EGRQMbWwWtvgjm9jNEj8tChlk
         c1CrMx8PT2QM2BB90OL2owbQne8LE7OpC74PT7Iju+h5aCpaHAjykyterGAqRoJ6rYNz
         a7UzrVvUQ1htleJtablQs6t6fm4yzdejCQiAmwh5M/1MdVgEETMMbsXyvNHHG86GZ7Hj
         pkhMzvlcL6yXsIvtBiTCsYNugCTx3+xEcu0ttUzakA3mI5hIJNy5AglGOsrtj6BYEOKT
         UfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724490; x=1785329290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=OI+MgLDqJkUQVpSAhRDfGkGSnVIEDI4L5i0uDPSXCzEwJJJ4mwedlP/JvNZpsitI1F
         I36jL1dTI/zMQSw3M43MdZf//IpB2ju9ui1l7i8nCOfOH5nMc55g3m9vroQyjsmKlg7F
         6653h0ovEdAYb+/ODsSH6g5DJIV0Y6F64+vNEk512nCbapALLAk+WpJ3cEBbghK71g/P
         5KHAVMxNn8MAPrabi1/ft5ENcZgtxi3huZLjB0s3Bp+IM1G8AJ8WXmLVGrkSDI5B4s58
         3yR8BLaOaPu4z+RygXARnYwrC6NscdILQM24o1o7oY4YBsuFBmmopoO+1UZNt1MUNrFp
         whGA==
X-Forwarded-Encrypted: i=1; AHgh+RqpoTcvSoixhzOMjXILajiHLElgnkkptLtruU9gysjg2dqDgH2RgwRpZel3wk1gcWVZg0C7UDZUChA22AFV@vger.kernel.org
X-Gm-Message-State: AOJu0YxDpoUqtqNeTTBZ/dEbWm5y+AoXBh2spihia3rTzTm3DpNdSUlJ
	1x7vjOIFfbWaKXF4j9g/FOSDfIBE0jM0H648Y4y+gqTvpvCEk/xvTIDRzjwEpnnVlMw=
X-Gm-Gg: AR+sD12wFJBG3NOdb+1Z5u1oBZxqYlKDa+ZOCmWRKqEd/URNlCvqzWMwNmIjFmVAYpR
	SY+FQPxGcTPTxsVw0LfWKR+1QpEh9dSoLCQZ7hxjWj7SVLwOv95z60lMqsKnB4kl7jDM7p8eNqm
	NoxiSEof4SZnstJARk/doI5MhIU+mU74aL0YIX6O09tzRmo9s7ZGx8xck4+NCVsbvf9I0RBAtNG
	8PJCq1thVyVBXYm7X7Wjzp5H2YdTeURGTPM1KTwyHG5Z+tNjuSZr/ohe4ymp2muVHnygtYxBHhY
	ucHhxUobWKOHuTXB7h+HHyX//0hv1/Id77k/LJzWng2LzDwQkwYops97YjeZUqIopJF6x8Es2rr
	OSBw0CvWYMXhVnwDuWMDyPSOkl5custz4vMLP2LJP6fOJ2Xy5R0G5RJVpdEvnXqeGEZTPorSr7/
	/Pg+H7L6M1VRZv
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr297618495e9.8.1784724489524;
        Wed, 22 Jul 2026 05:48:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm131520645e9.9.2026.07.22.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:48:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:47:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amC7_M-HjVZ3sQuT@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>

On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> >> --
> >>
> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> dmaengine: qcom: bam_dma: add support for BAM locking
> >>
> >> This commit adds support for BAM pipe locking by prepending and appending
> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> >> config for the dummy writes.
> >>
> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> > index f3e713a5259c2..411c60c4433e2 100644
> >> > --- a/drivers/dma/qcom/bam_dma.c
> >> > +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> >> [ ... ]
> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >
> >> >  	lockdep_assert_held(&bchan->vc.lock);
> >> >
> >> > +	vd = vchan_next_desc(&bchan->vc);
> >> >  	if (!vd)
> >> >  		return;
> >> >
> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >  		return;
> >> >
> >> >  	while (vd && !IS_BUSY(bchan)) {
> >> > +		/*
> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> >> > +		 * already have bam_locked set and must not trigger a second pair.
> >> > +		 */
> >> > +		if (!bchan->bam_locked) {
> >> > +			ret = bam_setup_pipe_lock(bchan);
> >> > +			if (ret) {
> >> > +				dev_err_ratelimited(bdev->dev,
> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> >> > +					ret);
> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> >> > +				break;
> >> > +			}
> >>
> >> [Severity: High]
> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> >> requeuing immediately without sleeping prevents the memory reclaim needed
> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> >>
> >
> > It looks like my suggestion to queue_work() again in the error path of
> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> > We do need to retry somehow or report an error though, I don't think
> > aborting and leaving the desccriptors completely unhandled is an option
> > either... :(
> >
> > One option would be to try to avoid the allocation and write the lock
> > descriptors directly into the FIFO, but this will probably get really
> > messy as well, since you would need to carefully modify the FIFO
> > management in several functions ...
> >
> > I don't have a good spontaenous idea how to solve this right now. :/
> >
> 
> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
> make bam_setup_pipe_lock() return void as it will no longer be possible for it
> to fail? It would just grab the preallocated descriptors.
> 

I considered suggesting this, but how do you know which descriptor needs
it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
tell you anything about the order in which they will be submitted. :/

We could always allocate the extra lock descriptors and waste the extra
memory for the descriptors that won't need it. That should work, but is
also not great ...

I was hammering at the code a bit earlier to try the "write the lock
descriptors directly into the FIFO" approach. It has some advantages,
but also makes the FIFO management quite a bit trickier, hard to get it
right without full concentration. :')

I _think_ it could potentially work, but if you have a simpler idea I'm
also happy to throw away the mess I started. :-)

Thanks,
Stephan
