Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F0E40DB52
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504149; cv=none; b=MvKHaTNIr+wKC1eaFnoxTno3H1ipnskZarEkZGxS+IyxX4wPOW6DZhHh2fwM0djX+jICYBJ7vN1wtWCIoQvcYGOjt1GooJtTpUsJk5Wj2Mj080C53ZT/mUbW7VWSvE4qjKeXj69zJP3M6LaC6ehsionWRDPBm398wcMbPFxfoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504149; c=relaxed/simple;
	bh=EMll0PbljGbKP6F7UEqAZRjgfB35f4AO+IrlRnOX0eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hi/E4c9TdF7wvO6zeGeblAAmydFWcOE64H3vZUjWo3yqmAXf9n8hM+1k2Cka6aXEAU54/ezBG1CoKs9Kbl/TcWLcUy68z8Vlnu8tZ1RqT12jdcHYqRW2uhC/i4V28kAURLq/yPez/8+Qm3DHHUc6k9kHNt2m+xdlM+Stsb3VMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIPjTwX+; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIPjTwX+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso1651509a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785504146; x=1786108946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUFjbQK9o5Mqb0VtfKbOwJNUfzh35y+PLUoGryk+0Hw=;
        b=tIPjTwX+3lusJoGPrYS6tKXpMbGQG8YUMH+yZJDjngYBiPti60s7imaKvfwrTrM9JK
         DV0uPdFENAvV3wzLeYLxeNYx2kBU0uOsP5m0wyUCGUoHrceZ3xmpOq0Yo8nFayQ7dt+B
         7g0bpNEnkYLHiomPE2b9jgvvh75GGChpTgGr/WdM4ftNXrbyjz5T+nK9qhXgAB9wb9rt
         QXJEPJcDBjIgz4JgFNPaNfuuh3LPXGeqbpKsPftlqEzRjFi9Ulymm6lYbdmBP/yIz36y
         AY/TyqBd40IIrNa1n37P2nwTj/jh9OZBHChdAdAKfxFBOVsn5smje7PX4ZbIFsxphiEJ
         HGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504146; x=1786108946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUFjbQK9o5Mqb0VtfKbOwJNUfzh35y+PLUoGryk+0Hw=;
        b=qDSj3bi7O6pb4ZuwBJ+zgxvcQRVVb2Qes0FNnmfOLgghxfNBXQ8MnixNJh/B8q48ho
         p/T/cTPViogVvFfg8XjVklVedDZgE7Hfn13UZZQAc5p9NEP7cKM5Dba2SlmHFmIZD2kx
         sB+/z/7wb99+dYOrE+LwmANy823QJHtD1ujQx/NXBFWxITgS2q1ZHpn/Nq9cDtvnvTDF
         7ghx8W/hYJA3deFScqjsn71HPejee4CrkTVS6nyX/WzD4qsIQy30Za1+YqY+ubLJqxXL
         5Q1mpJ/x8HoZTKFDhbu4kdTlVZvkiiQ/Y+qDUWeLrSGthLxhANdS06kTR83AlxoHwEp0
         JTFw==
X-Forwarded-Encrypted: i=1; AHgh+RqIbDn6e2rNywRwCCsW0Isv5vMGgj38VebUsz/cH53JDkC+vIzuVSa+laUbxfzrng9aS2SPeGbMmL6zHI3k@vger.kernel.org
X-Gm-Message-State: AOJu0YypsC4QyO/mkaNJW/PlBRmKF+zOfeMAjBnEQA6EevJAec5ZLCzw
	sA79SrwQ/e0jjoufNxK5dgJqlS/K9kw6XXG/BYxlwnQDXtm5vfSVggiZJuhnhoikrCTyi51ttBi
	qdL499q4=
X-Gm-Gg: AR+sD10gI9J3KkFRUxuAOK7oOOhnrteJP3oL9oJqT13giq+7tAhMxdwOKW70dEm5o+8
	g5gHWYJd0nxtLLdzXW4BIWxxU3UoJfqYHaiK9kVzIypQHT3HRWgHRu+T2YNVEIa1aqACMCyRg9e
	JfI7H9FiCEZHpUMoVq/Dl/E1b3Nu/Ci/1+GiuMgjkncAztlvKf6ffTHdSAwBvTUGpXbBLjx2X/L
	ZpgnT+esBcPE5J6+26PKBuHeEgDVcwUQy7S0VPgojyJUx5JoyxTlQuLsBAHGJmzxj4TpGU1N9PX
	rBycpUBLkYt5X+SIFaxR1lQVSgrpH2FY0jlUPrcb6oyvGqXODyGfMyyhJMQLwZFszSiVygqKLkr
	qFHkqGLvzJhxi6cwsvr14UUiUj7hTf6qf1gLdzVRxcSbsJn/drHmtHh2G7emf2af1c428Y61k7N
	PYcRs27jl00bc4rrKYCyn+hZC3bSBjAm+PUEIx2xloGI4bZl3YozZH1yxMBGyrAMsLaJRZ9WmJ
X-Received: by 2002:a05:6402:3224:b0:69a:9355:d1d5 with SMTP id 4fb4d7f45d1cf-6a098f26745mr1168464a12.41.1785504145926;
        Fri, 31 Jul 2026 06:22:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:4eea:ae3f:f2e0:1952])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c655446sm1571952a12.21.2026.07.31.06.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:22:25 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:22:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: q6v5: Ignore stale handover IRQ
 delivered on attach
Message-ID: <amyhh8lNMT9rgK_X@linaro.org>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-3-shengchao.guo@oss.qualcomm.com>
 <amxf7MODINj26a4m@linaro.org>
 <amyc3MTsuCBg82WH@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyc3MTsuCBg82WH@QCOM-aGQu4IUr3Y>

On Fri, Jul 31, 2026 at 09:02:20PM +0800, Shawn Guo wrote:
> On Fri, Jul 31, 2026 at 10:42:20AM +0200, Stephan Gerhold wrote:
> > On Fri, Jul 31, 2026 at 10:56:54AM +0800, Shawn Guo wrote:
> > > Commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > dropped the check that ignored a handover interrupt after handover
> > > had already been issued, relying instead on disabling the IRQ after
> > > its first delivery to make it one-shot.
> > > 
> > > That is not sufficient for qcom_pas_attach(): when attaching to a
> > > remote processor that was already booted by the bootloader, handover
> > > has already happened out-of-band, before this driver ever probed.
> > > qcom_pas_attach() sets handover_issued = true and unmasks the
> > > handover IRQ to keep the enable/disable tracking consistent, but the
> > > transition that signals handover is latched at the interrupt
> > > controller while masked, so unmasking still delivers that one IRQ.
> > > 
> > > Since this driver instance never ran qcom_pas_start() for that boot,
> > > it never took the proxy power-domain/clock/regulator votes that
> > > q6v5->handover() releases. Running the handover callback for this
> > > stale, already-accounted-for signal disables those votes without a
> > > matching enable, producing:
> > > 
> > >   genpd genpd:0:4c00000.remoteproc: Runtime PM usage count underflow!
> > >   genpd genpd:1:4c00000.remoteproc: Runtime PM usage count underflow!
> > > 
> > > Restore the early-return when handover_issued is already set, so a
> > > stale IRQ delivered on attach is dropped after being disabled instead
> > > of re-running the handover callback.
> > > 
> > > Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> > > Assisted-by: Claude:claude-sonnet-5
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5.c | 17 +++++++++++++++--
> > >  1 file changed, 15 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
> > > index 10fa38f264c8..e715083846aa 100644
> > > --- a/drivers/remoteproc/qcom_q6v5.c
> > > +++ b/drivers/remoteproc/qcom_q6v5.c
> > > @@ -210,10 +210,23 @@ static irqreturn_t q6v5_handover_interrupt(int irq, void *data)
> > >  {
> > >  	struct qcom_q6v5 *q6v5 = data;
> > >  
> > > -	q6v5->handover_issued = true;
> > > -
> > >  	qcom_q6v5_handover_irq_disable(q6v5, false);
> > >  
> > > +	/*
> > > +	 * When attaching to an already-running remote processor,
> > > +	 * handover_issued is set before the IRQ is unmasked, since the
> > > +	 * handover already happened out-of-band, before this driver probed.
> > > +	 * The transition that signals it is latched at the interrupt
> > > +	 * controller while masked, so unmasking still delivers this one
> > > +	 * IRQ. Ignore it: this driver instance never enabled the resources
> > > +	 * (proxy PDs, clocks, etc.) that the handover callback would tear
> > > +	 * down.
> > > +	 */
> > > +	if (q6v5->handover_issued)
> > > +		return IRQ_HANDLED;
> > > +
> > 
> > The goal of Abel's patch was to have the handover interrupt unmasked
> > only when needed. If you just bail out here and do nothing then there
> > was no need to unmask it in the first place. Can you just drop enabling
> > the handover IRQ in qcom_pas_attach()?
> 
> Hi Stephen,
> 
> Thanks for the comment!
> 
> Although it seems working in my limited testing, I'm not sure it's
> entirely safe to drop the handover IRQ enable in qcom_pas_attach().
> 
> The handover IRQ is requested with IRQF_TRIGGER_RISING. When we attach
> to a remote processor the bootloader already booted, that rising edge
> happened while the IRQ was masked. Masking doesn't prevent the edge
> from being latched at the interrupt controller -- it just defers
> delivery. The pending bit sits there until the IRQ is unmasked and
> actually taken; unmasking alone doesn't clear it.
> 
> If qcom_pas_attach() never unmasks the IRQ, that stale pending edge
> doesn't go away -- it just waits for the next unmask, which is the
> next real qcom_q6v5_prepare() (i.e. the next stop/start cycle). But by
> then handover_issued has already been reset to false for that new
> boot (qcom_q6v5_prepare() does this before re-enabling the IRQ), so
> the stale edge would be indistinguishable from a genuine handover for
> the new cycle. It could run q6v5->handover() and tear down proxy
> PDs/clocks/interconnect immediately on prepare, before the firmware
> for that cycle has even signaled ready.
> 
> So the enable_irq() in attach() isn't dead weight -- it's there to
> deliberately unmask and flush that stale latched edge right away,
> while handover_issued is still true from attach(), so the IRQ fires
> once, gets caught by the one-shot ISR, is dropped harmlessly (because
> handover_issued is already set), and the IRQ ends up masked again.
> Removing the enable would just defer the spurious handover to a later
> and more damaging point instead of eliminating it.
> 
> If you agree with the theory above, I can follow up with a comment
> update in q6v5_handover_interrupt() to make this rationale explicit,
> so it's clear that the attach-time enable exists to flush the latched
> edge.
> 

It's a fair point (that I also considered before writing my original
comment), but I think it does not apply here.

There is no real interrupt controller for the SMP2P interrupts, all the
handling happens in software inside drivers/soc/qcom/smp2p.c. The driver
does not implement any latching. If the interrupt is masked, the bit in
entry->irq_enabled is not set and qcom_smp2p_notify_in() simply skips
signaling the event.

We rely on this also for the normal boot case. After the initial
handover is completed, the handover IRQ is disabled by Abel's patch and
then you have the exact same situation as in the attach case. There may
be additional handover IRQs coming in, but they should not get latched
for the next boot of the remoteproc.

Thanks,
Stephan
