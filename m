Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5DE502D50
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961061; cv=none; b=YMoewj/93NhVtEqhRpGGBIVvMr414tRlHy3BxL2RELFWIYWvXnWiOnt4fXPchmssMZWjf8FIUzYhMvMdoqBEXrijzQcRRxmF/4qefCQnqRbY+G2C8GAiBJcD1FQ1/hYAopkpE7wZca73AD+DRY0GDhWjDLQqLyWyxoidCxx+Um4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961061; c=relaxed/simple;
	bh=mrxPXIId1qTShZKGlHGgNQz6PnSRa6+MIliC3LYulx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhVf59HvCmAFmue3Ll8q+JRNiifX3q8gwvGY9Vy0y1O33HK07GBHqHOqJnbP/SfUJqEkMDSp+VL77lvuPnjLMR/LWEwC/eOuCP7NJMng2Wm7Ez6y2v98wFZmXJuH038e97uAu9L+dutCsl62a9oT8ocSvMY3zeu9gYboh09Z5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jIsrR6ZC; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jIsrR6ZC"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c4a0870d2so2987715eec.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790961048; x=1791565848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=jIsrR6ZCYoXUg62SeoHiJ6U1qQmTUvfmHWogxM0qjQgpdxTBR38CREigK8nBVg837B
         KemCEloefIFs0d6V2TsfLG+gXof4Lczn1A3R8NHqVJVEIGVHb/IebK+RpIye8M3zMs8i
         YTJWrFKclhx7CxJS5QL7+5f//INbWiK4y09jMHkcmwqjDq7GovOeOKTKri8BnYz4SJ/F
         Wb6KjoEp6g56AjVLR/e/dFRyT7rfM39Ade1CK3Dx+VZ1t0EdbRskxub4VkpZ+yFH9FCS
         4N5joGr5LsAuBrkxXGtJbCwSMI+3e4PJkLhKF7HnXpwKcgm3GyDvhTJqShefFqKWZr60
         C7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961048; x=1791565848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgakvInNsjTIuwI/HruggHJb8c52XKSKFB4qu//ilyk=;
        b=idO6pg1Xfc3FjxJwwLRNCZmhcVsnlT7inlCkSQlCppI1V+7ebL+lI/FcVkmIuenN94
         S4vZSYBOBepmt+06cmkaWJKHglTdh1edra8Pibx0UUEdfZD0tX1qBqBwEFhQUluH8Iu5
         e55we+ZgAX8XSn7eITdoXTx9MN8zukHzsjytpE/zeL3kiarTNMNE1J9zoC05k7UBxVsZ
         5/5A0cZhGRVakudkjUB7XbS0fiW32KxuDSgAxP+nFpjAm7PGSMDqvrro3A8BF6SPA7sJ
         w50vNxUg0mqWv54JR7aRgs4drYOpZpBPbdP9vkc4Vl9cLUyLkKh+rv6YRGEe3rkbcZ2W
         T8DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgtiiOWpbA1rKTsln4diwRNRtCG8nXEhYVjU3QS3mBuw4Jyeu2DTsnugJ+corm1jlvi0TljQdPFJnQhybF@vger.kernel.org
X-Gm-Message-State: AFq9FYKEVHnhIcaNcoXjNQ+/yB2LPbRU9xppYfgt0b6LeRHSdb+lczmb
	1unL2cgH5gA8Dcv9JaHnViY4xL+l/sxNqENuobaxQbCI4ieddP9Z9S/UdBPJCK9DGbo=
X-Gm-Gg: AYBFou24WeMD0z2/21TAWH+VA4wAk6xOeUvbOvp7zi4NjXNNP40GgLRHLyPp1OF5vFg
	k9lMm6qHcmHVtOp0pVNkmmqzuu25ChXvX3qhZ8Io6lCtxYPsbb61id5DgCuZLg1pljaeTdl1isO
	vbhVKp/4dpl7ZWBiDcBGF7UV6Ex/Auo7LaAcifvHxmmjB8t+GKkXE/3lDcQOcbbIxolnkgLRZal
	tiiXvApkaULjSKHD4yiykTlVHg7eEyldwuWp9tvD5t5Rwwny+XRDlcPxdaFLYQEKWYPHLaXZ7oT
	RIKY0/wd2OZPbecthjA96j9YmUiJfeGN4T/aZBadMjHQpZ6ktjeknHDGZGckkvp9+sg5zPgaKL5
	knzqJDDHPUI2IGqCDRcvcgjlLVFwZR6CrMM2piJrXTrlp4Zrf7pCspJfkoTYc8J6DPiJ1Pu5mF7
	kbYHRtYmTYt503RQZxb8rDsqQrxhNvvIaF5GsKUfZu+wBy
X-Received: by 2002:a05:7300:e5c2:b0:34b:b410:9352 with SMTP id 5a478bee46e88-34f14f18c8cmr3725477eec.1.1790961048034;
        Fri, 02 Oct 2026 10:10:48 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510850f86bsm4509703eec.11.2026.10.02.10.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xCgmU-00000000BiY-09Yw;
	Fri, 02 Oct 2026 14:10:46 -0300
Date: Fri, 2 Oct 2026 14:10:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: alex@shazbot.org, ath11k@lists.infradead.org,
	ath12k@lists.infradead.org, bhelgaas@google.com,
	jjohnson@kernel.org, johannes@sipsolutions.net,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
	mani@kernel.org, skolothumtho@nvidia.com, yishaih@nvidia.com
Subject: Re: [PATCH 3/7] vfio/pci: Add qcom-vfio-pci variant driver
Message-ID: <20261002171046.GA32083@ziepe.ca>
References: <20260930151229.GR163130@ziepe.ca>
 <20261001071945.83116-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001071945.83116-1-jtornosm@redhat.com>

On Thu, Oct 01, 2026 at 09:19:45AM +0200, Jose Ignacio Tornos Martinez wrote:

> Regarding platform_device_msi_init_and_alloc_irqs(), I agree that
> moving the driver to device MSI domains would be cleaner on the
> driver side. However, even with that change, I think the VM problem
> remains exactly the same: the device MSI domain in the VM would
> allocate virtual addr/data pairs, and the firmware's private interrupt
> controller still needs the physical host values.

Yes, I'm not saying it fixes the problem..

> Also, the VFIO variant driver scheme would not fully break if the
> driver moved to device MSI domains. The variant driver caches host
> MSI values from the MSI descriptor, regardless of the allocation
> method. The hook point may need adaptation, but the fundamental
> approach (host caches physical values, VM reads them) remains valid.

It breaks because VFIO will only cache *actual* MSI-X table entries,
it does not have visibility into anything that
platform_device_msi_init_and_alloc_irqs()

The only reason this works for you at all is because the driver
hackily copies the vectors from the real MSI-X table so it can look in
the "cache" to find their true physical versions.

Which is my general objection, I would like to see the driver to use
platform_device_msi_init_and_alloc_irqs() and don't want to get stuck
unable to do that because it would break this.

> Regarding the hypercall idea for device MSI domains, I think that
> would be an interesting direction worth exploring as a generic
> solution, but that's a multi-subsystem effort that will take time to
> design and land.

Yes, but it does actually solve the problem in all its forms..

> I completely agree that this could theoretically affect any device
> with private MSI registers. However, in practice, I'm only aware of
> this specific behavior in Qualcomm ath11k/ath12k firmware, where the
> device's interrupt controller requires the host physical MSI
> addresses to be programmed directly. 

Everyone else seems to know this stuff doesn't work for
virtualization and doesn't try to do something like that.

> It's also worth noting that the PCI reset support for these devices
> has already landed in linux-next (commit 290153d46d1a "PCI: Add
> device-specific reset for Qualcomm devices") [1], solving the
> device reset path for VFIO passthrough. This MSI series is the
> remaining piece, with both in place, these Qualcomm WiFi devices
> would be fully operational in VMs for the first time.

Why do people care so much about this? I always thought it was a bit
odd?

Jason
