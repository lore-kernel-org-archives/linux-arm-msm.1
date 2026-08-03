Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51250384CCD
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755484; cv=none; b=LrKB7FkKbadlS/ROGkvd0HR6cYbHmgnfduCz0KP0g49Jw6j82U8KrNXykOZR/HE/xUoXe8c0QknKcMsYMDwF2cGCdPAaZSjoXGlftPNgvdPYcSZcZgx/iz49LXahKspIv1TzNDoTWZtOFdHupOxtvP2u4RB3OUap2Q9A1C8Z1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755484; c=relaxed/simple;
	bh=zUEehrAAlTJ8R5aPfUUZP8MnSQLpWmy3bvL8DQf8vmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa1ID3YHGC2WVkIgpTrVg/XTvnFgAFBQnVhX0lHU2Xc2WpQO+UGV8XruLLK9iHoSQN7eBNenWHh7fmKyz1ETxQnq+c8tfGWj6sshvKxOpGLh6a28AvjfNMBtzesAVAM28D6J6ei42QbJ9zmAc31YrRERQMUYr1m8kJBbq+59rzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XTSlB49n; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XTSlB49n"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacef7d299so114825ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785755483; x=1786360283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n762/MxYtv1d3KOPSEF5oTaF+noAfHsJGw6J2wXrY+s=;
        b=XTSlB49nZd24YG48N5KjuasrySy9h4sHKOFtv8JAEJCaaiOVpoiWo/U3ymXgCB9Bhe
         jKPoHrj69lWlLGiZOqkEZ1qxa6q/VQCvC5EzBWkwMlyAXNeENqjwJErbrCa/qA2evhvj
         Bf5BniLV+/3eI+bK9GHjjS9sTLAyKEEDjPbyN/EVQOKQZoKXBbtUH5uH/Ig3wDQ8VV8H
         v5bXHZLCpYEuOzj/vNSHw96GcU1ciqaHV4vhRqisB+7osBs3jSWzdAB/7dSiXtIonOt8
         0yO3uSrlfKEX/tKBgV5XwP5B/8eF53WvjhkvbbjU1RDFw0twdwomKn/tRVT2BTCX2kHZ
         q9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785755483; x=1786360283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n762/MxYtv1d3KOPSEF5oTaF+noAfHsJGw6J2wXrY+s=;
        b=fobynxDGmfCdSRXu4z0PvbEUykUWh010pwpLq22ocUxAAhRFaeAI6WzSHLEHwyex9s
         dEHy05zBXM5sToDwVO+bpnHiF+fUGxrsNzcxO8FNrdmw73iFbtTMw6k1D16wtJL5dU/0
         Kq/dlkU4wM/8hocEliQzxKUonsRlg89sO/QUTO22B2aLskaajVQE0IJWEdNhZplkUw6L
         D1Tlzm7BQ3s5QY8hJZocxeiNggigxNTd/V5j3UwSD9hqyTStsN7SvUCWPh+/SBWZujEe
         7GzZCKA/+N5k/H/W5MpLgTWpyoxczEPZ4QAYsckscr3X6ZLpkJccOOJGBt6D2DcQXxZb
         ondA==
X-Forwarded-Encrypted: i=1; AHgh+RqE6QxplKC61tlwVprKM4+i/fTkg14WaASej0ORnA6BDM7IKKDNJECFuO3GDsAtDRha0c3qU5/El5asRnB+@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLrfRb8oxdGzVxV+GyBxpTavyK79WwDDJY/tGZwBfGm0sda15
	EICh1leUh73wREmX2x+BfTMwNrgWBnpx3KWcOaAp1oP/M5rXuGL5uE/cIG8pKn/jQw==
X-Gm-Gg: AR+sD12p8wGiC2NJj691ruQte/bIIoI7t2TNB0/Q5wNcpXMUOZO1JrxmTX1FfgGNwiu
	CohlRFdxJUdD6U9fpfv1wnH/yqlonNW1y6RRE1v+Nc1Mx6BHTeW3StO6V0DIByv8qvwhI3cvDzo
	KRIxkpnx4r5pdLOzgJRiiEYDlTZWL8BjRuLM395WOTj1ycCjFnBTfgRdkklVKu2jgp6V//zjwR7
	Hmu2eAPyk8vNoZJmWHzVPhBCHcb27AQyaJKOyHllCY4mN3jDWKYPcu88TDxADM5DOMjEv24iX1W
	DwDxT5QRw43ulT95ZvcwK6yJerPLZwkefityDuwL52iMjMMgUHOxt4CK1Pzej2e195IDK/5FkG3
	gzC7OYAdqANGjdh6h5sZ8XgAeEg6jvDO8coDW0nIDaGw3nxWDaagGDX0beVkUExns6PTaNQeKCa
	0sNd+w4iCzaV6zvLbivOPLgKwZYaGCxY+cun7aZyyki9TDKPngqYJtIRYpu/Y3AxfxjdAGGDchy
	EpAnLt7R5DUK2bW4jaw3DM=
X-Received: by 2002:a17:902:ce0a:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2d056f86736mr14315255ad.5.1785755481934;
        Mon, 03 Aug 2026 04:11:21 -0700 (PDT)
Received: from google.com (21.168.124.34.bc.googleusercontent.com. [34.124.168.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30a43a6sm3840095a91.12.2026.08.03.04.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:11:20 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:11:14 +0000
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
Message-ID: <anB3Ukk7JM42Wgpp@google.com>
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
> ---
> Changes in v3:
> - Add arm_smmu_rpm_get_if_active() wrapper that returns 1 when pm_runtime
>   is disabled, ensuring fault handlers work on non-pm_runtime systems
> - Disable fault reporting in arm_smmu_runtime_suspend() before powering
>   down to prevent interrupt storms during RPM_SUSPENDING state
> - Use pm_runtime_put_autosuspend() in arm_smmu_rpm_put() instead of
>   private __pm_runtime_put_autosuspend()
> - Link to v2: https://patch.msgid.link/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com
> 
> Changes in v2:
> - Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
>   pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
> - Added support for smmu->impl->global_fault callback in global fault handler
> - Remove threaded irq context fault restriction to allow modifying stall
>   mode for adreno smmu
> - Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 92 +++++++++++++++++++++++++----------
>  1 file changed, 67 insertions(+), 25 deletions(-)
> 

[...]

This version looks fine to me, 
Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
