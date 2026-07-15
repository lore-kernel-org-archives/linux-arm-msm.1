Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B843B71B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144257; cv=none; b=WZnToceEg4nEgVufKjY9FbZiAADGW6v9T+LHHU4x+JZf8kgGy0TRcT9e9q8Q10DUC9tDxtnQoaGe7r2gD8GwkazFTIjxQVlnUaP/Zxw3NAf0wUb0JWEW2kV96DCBEQSEXPJ8bsEaouTVu1fZ6zUMNd4MP6WT7YLU7ua57V2UAgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144257; c=relaxed/simple;
	bh=eYNN6RWU07VAIXpqxw2a0aPtaKc6eCAW3usyhGGWdKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9teJcTjsQKrymXHSPmQYvhi2iapXrdjiOEcMMVrgS+uznWYPWtL2k5B4vVBe6o5w8jjCufC4vfY+ovitRwo93UTpKd0q5pPCps4loZ5zwKdHptW3tkGbc1upo37Muu2ErA/o9N3vDPiMIh5+2s4248B0OIKsY1CThQ2x3f2qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=CXg3Mfk4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="CXg3Mfk4"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c21495722so38496081cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784144254; x=1784749054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OujpRFSpw/QAEHNMk5YVjM7csawMlwgTgeHiHNUlLio=;
        b=CXg3Mfk44UKY2OlQ5cxM/HMuAzWWPxeToNPW6Kb4bgasUVGfWX9Q0/ut8HJiWfyFbA
         T/0eRzuUIJQe/keEcSit8xGP0p+nGVQTBRYGBeiQ3zK0XRjeVVL1C6D0pcRGTIwXXE8m
         qG143U+zw+cSIAF7Q1q7z1AEi2n7l1AIdje5/5vb1G6/TirBj+tkJ/jKQMPAyX6aVUX1
         PwkTbT56h0lwLANhEMf8H8tfUTXa9RV2GrQmUighLOil11Kz4j40Ug0yQ/RlcK7UZtXC
         FX06fEfPe+xB0ZP1iWv4Rz8AeN27rHP/Owsy++7pOJsJKZJdtuuQzAz9u+azjOua8Jxn
         R7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144254; x=1784749054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OujpRFSpw/QAEHNMk5YVjM7csawMlwgTgeHiHNUlLio=;
        b=p6zjGJDB741lCTxFWOyj+WLymYfODA/LQwWxnD4FT0jU53Uhroc/ZzL2QtScUhMSVF
         aPa4X9nhrzekSK0PF8bGGpYU1u/23v6h2e1kkQ6etsxYT9lWAUn0X6Z9ggWwoKJ86G3M
         lPMMJSt+DKBcCVogFgL1xsQFfR1l7ysNtqOY9daAf0dFhb8f9LJ8tAV4ujwMXkJPEvVn
         qHK01z1A2s2LFJZyn9NQCFzU6E4UKY+hX0wGAwsPgTSH3kNcFvewpl09rDSRYJu1qe2y
         QpAaLWnO5gAqKfq/alLy9x2+uuYHpZrXzUiNo6G+6S0swDOTNNZxRMwOOztI/u324gsk
         6IMg==
X-Forwarded-Encrypted: i=1; AHgh+RrOJ/3Sa+a2KUfEYWOhJ14Oh4lSWu3+TGloAPtao/PsGgu+m+2rscQwV6rKDTGu7jNtCj7y2a4ELtLNIoiy@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSgNZWJZCx2V/onwc5SRA6cEP8ExJORcD4zVOOdNZjwcMieim
	RQClNmvJ/XIhemhe56WekqK21T08MJHGZYahPXFFKWebGGv0ZPsrL3SwFlfdCJEIja4=
X-Gm-Gg: AfdE7clxrEP53ZSYy7Cc5B1kqteTtdhOU9fGBWmWgYb1lRKiZKglfnES1eQ9YTtF2DH
	xf/ymzlv58jL7kil3B8N/O39rvdD0g+sDqutrIISlh7NVLoF0yZGqitCAsUJ7xbdE+m+SW8BO2A
	HNJsTNvNtKELhSjsTerOw79R7g4nSbfyyvaXsZnYrSutdHdR2sLueqFXL3aa4cBT2G97j71aNTj
	Xeel9t1o50LNWdOf++K2oxKVvID3CsBxqQbskgMfzElnmdt3u2ysIifyoIwHgvPXumFr/+cDhsY
	GjYYjqH2tadMaYqebeB3RpsnFUQDsrilCV6HvZBf3f7chqyY8IK3BsmaEn02gpBLiT18XFdL1/9
	5JVVrrPPn2diwRdNFo9Y9ZYUo0sAPrajwnnJFuuV8lPv4r6q4ioVhTSMmn4Dx
X-Received: by 2002:ac8:5805:0:b0:51c:12bf:d4a3 with SMTP id d75a77b69052e-51e3c2cc193mr94283961cf.52.1784144253535;
        Wed, 15 Jul 2026 12:37:33 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6e9f4sm144211471cf.2.2026.07.15.12.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:37:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wk5QC-00000000tnI-0nFm;
	Wed, 15 Jul 2026 16:37:32 -0300
Date: Wed, 15 Jul 2026 16:37:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Fix fwnode lookup lifetime
 handling
Message-ID: <20260715193732.GA210048@ziepe.ca>
References: <20260714060930.220277-1-xiongwm2026@163.com>
 <20260714060930.220277-3-xiongwm2026@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714060930.220277-3-xiongwm2026@163.com>

On Tue, Jul 14, 2026 at 02:09:28PM +0800, weimin xiong wrote:
> bus_find_device_by_fwnode() returns a device with its reference count
> incremented. arm_smmu_get_by_fwnode() drops that reference before
> reading the driver data, which leaves the returned pointer derived from
> a device after its reference has been released.
> 
> Read the driver data before put_device() and return NULL directly when
> the lookup fails.
> 
> Signed-off-by: weimin xiong <xiongwm2026@163.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
