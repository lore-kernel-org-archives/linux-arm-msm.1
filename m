Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88638D419
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756883; cv=none; b=lcjTDjO/mqR81TZdxT6d8lIewOn3ydAUDF3IqIVbuC8PyVoDzyCpYN1bJP/9QuKlYS0lnBWOCOz7W/yv2U5t5VSZYA/CI8fXmmk3PQNNJIacwkQMqO9nrTPFUQcl7g5eS38d6VrGL8JCuo7o1/Ib9UR2xOtl8ZL1RQROfB2fPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756883; c=relaxed/simple;
	bh=hvUjH62FMs4eWRYreksi0y6ODe1YRla6sWjuNOUTH44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlBtydyLPZd0hy6FW8jZbUh3b8TjEsHOz9lWMcmEX+2NInrRUDGQbkuG+KxQoudgwEVjiGU1p+EyixsAKMgbEFvYMmc0UEVQlJBINRIbA4a5MtgNAB9rHRDFaBZcMZXbto3dHgyIc4gzqeXVZ5mnAkE9xnId3iC5XPOX+TkSF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0BEASft; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0BEASft"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacef7d299so116505ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785756881; x=1786361681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2wni3Q+wShyY65f0uKlTNx2h4S9tj48PjL0JpbjcW/Q=;
        b=i0BEASftTF0eIJOml4u4mgVzwjzn1O02lCCOkEO40LBLve7YRZ9E2ZZY6BHg1TQ5XG
         dsqrqDPxK3TFMuWJBdqVstoZ0+H8W3ae+N46fbjwHgWKIZVUBmKkPMzdI83HJQxFGR8E
         2l4RaD9nvX06TECOd+sw4beZJI0Bsz6UhyiR/A3Vh8o9WWX/7+bsGNsLa7URXZtsvKvZ
         EfogU4160PF2wbz1g+umA/tkvCz+/xv1jJl9Xw5ZWy75hSKS/bQjnRMiy5DxrNa03ITX
         Mv4f3p4t+qDQHcYxPwkNPpPJyz2dkFedhDq2yfHttI/kPRKy6SzImRniwUC0A5quNkrH
         O5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756881; x=1786361681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wni3Q+wShyY65f0uKlTNx2h4S9tj48PjL0JpbjcW/Q=;
        b=blZ4j842UYeGSBH1QvGVyC9VWapWAP0RJ0crlTp+4Zzr8rVstkw3iKZqK1SmIMPYrp
         UcwUGLisncxDmEuCE9uYVJRcTrQrUdHNBYcwRGlv2VVewUFbgTWaqvMaK3d67Hjdbr0s
         kpc7Y0Wy070nDD+QfdJekLGjCV+P3bNa34p0LDsX9ycbNPIQPm9qdUieZEcAYEyLTmei
         TiKNstNrLOgaXaUimO3KYxIOZblePgaUDD709fhSTNZL6FaVzwG+Bk5d0YRO4BamPQ+s
         2zu6ETVPwonJrTCLVPcPVeSF8voCG+mF7otSY6aVvtiUbG2fv2PDjQf145fv6pmaPsgS
         +eDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps+tWW3wo/EdJuk9TXGNyPE3ZnD+jupm/dsAIeQwfECEWKIF0mKdY6r1f+IoCxXAKW4RR2WPaRmxCAUTAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1C0JDBEahKuxFUdtWWtYodEM9flF6FLFtDQC8mBblCe7rdoQy
	ytIivy6SxIuWfBhzKgAOIP30ql4tXgsGrGeEX83w+FNrazUhWRX02gqG7CoQINk/Uw==
X-Gm-Gg: AR+sD11fTPuCAmGmgloaDDyh+JFXo1xsAqmS5X//r/b/lP49VCziIxz38G/Osti+Wrv
	STyP6AEzIZPfITGfwjwF9ElBFfmlfdQDDfgB3aXxY/UYomgR8J4mn6yOv0g3HEqDzGBI/6TGW8G
	eb4hqaV83IklF8uTyYcdMF9ZM1gXhNzKtPy3sBy67Pl2v/j0aRYHCrZoZyD5DaNgqyLRWyAzAPo
	9D+rSNVf/VHMa0Ii9NIfAwdM2iPzwaq7UZqc5g0jNHz5tagN7NSjGtwTdanscWSbqa5EUHGQb1W
	1A7ybJjoWsgi0fgzCnfe2C+P7lKwwwSOvRhlOhEUrSb8DjTPP9XBHgsVyoFdx2Ynp6zyBTnyozR
	EklzM/BxMuQOhOw77xkhQdesnN1+K4Vvls0DkgmoDiAxjWlg0vID+K8XD0MmuI9OAy3Ccw6F2fc
	HTMNmg+JjNdlY3x1lCU3/X04u4T6mgF+dIXvKgaFnunv9u8pZmhh8evZy6wEZDyzTKVEI/NxNcs
	OUl5i3ofD2bApF3BeWQD14=
X-Received: by 2002:a17:903:1aec:b0:2ca:cbe5:c3af with SMTP id d9443c01a7336-2d056f884a0mr11365075ad.7.1785756880556;
        Mon, 03 Aug 2026 04:34:40 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae67d0esm36522585ad.30.2026.08.03.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:34:40 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:34:33 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Subject: Re: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
Message-ID: <anB8ydWLQw0KZxqT@google.com>
References: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 02:32:46PM +0530, Prakash Gupta wrote:

Hi Prakash, 

On a second thought, I'd like to discuss one more thing

> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
> sits in a power domain, all register accesses must be done while the
> device is runtime active to avoid unclocked register reads and
> potential NoC errors.
> 
> So far, this has not been an issue for most SMMU clients because
> stall-on-fault is enabled by default. While a translation fault is
> being handled, the SMMU stalls further translations for that context
> bank, so the fault handler would not race with a powered-down SMMU.
> 
> Adreno SMMU now disables stall-on-fault in the presence of fault
> storms to avoid saturating SMMU resources and hanging the GMU. With
> stall-on-fault disabled, the SMMU can generate faults while its power
> domain may no longer be enabled, which makes unclocked accesses to
> fault-status registers in the SMMU fault handlers possible.
> 
> Guard the context and global fault handlers with
> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
> fault register accesses are done with the SMMU powered. If the SMMU is
> not runtime active, the fault can be safely ignored as
> arm_smmu_device_reset() clears fault registers on resume.
> 
> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
> before powering down. pm_runtime_get_if_active() returns 0 during
> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
> cause an interrupt storm while the device is being suspended.
> arm_smmu_device_reset() re-enables fault reporting on resume.
> 
> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
> @@ -2306,6 +2329,25 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)

[...]

I believe, there is a small race condition in the suspend path that can
lead to unclocked register access crashes. (Something similar to what
I've attempted to handle in arm-smmu-v3 [1])

In arm_smmu_runtime_suspend(), we disable interrupt reporting in sCR0 and
SCTLR, and then immediately call clk_bulk_disable(). This disables the
interrupt generation but what about the interrupt handlers running
*during* suspend? I believe we could have this race:

CPU 0 (Suspend Context)                    CPU 1 (Interrupt/ISR Context)
-----------------------                    -----------------------------
                                        1. arm_smmu_context_fault() starts.
                                        2. rpm_get_if_active() returns 1.
                                           (Clocks are ON)
3. arm_smmu_runtime_suspend()
   - Clears CFIE/GFIE in registers
     (stops new IRQs from firing)
4. clk_bulk_disable()
   (Clocks are CUT)
                                        5. Attempts MMIO access (e.g, to
                                           clear CB_FSR or CB_RESUME).
                                           --> [CRASH] Unclocked MMIO access

I believe similar to arm-smmu-v3 [1], we must call synchronize_irq()
on context interrupts after disabling them in the SCTLR but before
we cut the clocks. This forces CPU 0's suspend thread to sleep and wait
for any active ISRs to safely drain while the SMMU still has clocks.

We can simply add this loop to arm_smmu_runtime_suspend():

>  static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>  {
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> +	int i;
> +	u32 reg;
> +
> +	/*
> +	 * Disable fault reporting before powering down to prevent unclocked
> +	 * register accesses in the fault handlers if an interrupt races with
> +	 * the suspend callback (e.g. device in RPM_SUSPENDING state).
> +	 * arm_smmu_device_reset() re-enables fault reporting on resume.
> +	 */
> +	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
> +	reg &= ~(ARM_SMMU_sCR0_GFRE | ARM_SMMU_sCR0_GFIE |
> +		 ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GCFGFIE);
> +	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
> +
> +	for (i = 0; i < smmu->num_context_banks; i++) {
> +		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_SCTLR);
> +		reg &= ~(ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE);
> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_SCTLR, reg);
> +	}

    for (i = 0; i < smmu->num_context_irqs; i++)
        synchronize_irq(smmu->irqs[i]);

>  
>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>  

Since we're disabling those interrupts and fixing concurrency, 
this seems like the perfect opportunity to add the sync_irq too..

What do you think?

With that loop added:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://lore.kernel.org/all/20260728210928.1050849-10-praan@google.com/

