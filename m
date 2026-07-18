Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0608B375F8A
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 20:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784405505; cv=none; b=nRqjDR+VCOGXs/DqO8E2fr7rqmvQDCCuiuPapgUZfTYmSAT6JoUQeh/wt/SzkBnhaxm0BhWTkeOp+sZ/JeZe2sfDVPK4zjynguh6+a0RfTdOPUVFTUtuOfNs0pI9KkpiFRZfO+0ILcHkYm9yMFpYjIvMlPr2R5zF7nAW/IyvHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784405505; c=relaxed/simple;
	bh=rsYCqbczMV4w4qUMEvfd3jp4oJxT0/vk7KoPV4tloAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hX8KI82pgygY1wxAkZfMxhPSpHl2GUgijgQuI63XKCWlTTc1NbNbY+fTN9CaDGwcAD0hbUyoMoXM8iLeMZAHixVEZmMo4XrGQZj56MwYQjgA5UxK1Ehq6mfDBSxeOIBMrh8WLpRw6XbTEPiXvysyLSfJz+gs1dvYjKJmOQXVse0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KkN/NQyZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkN/NQyZ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495509b08ebso23685e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784405502; x=1785010302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHFeM/dPfGA4sFtsC9fMsOxlubs1dV+bQ3yag0vQkBw=;
        b=KkN/NQyZiOYbimWC4FOBB1vZznZHInMAqOtZW83iooIyaXU2ngEqTwkTGsfdNiNl9w
         kZUpyOcbcLNcjvnEyaRAkjHbZSEugXfHC+fNAzZLQJ0GkAx4C/tiYWAI5q9aE93TdijD
         EmxGQ7CJ4TdQC7iFvhvipWp1uky1QAyELAYoa654BRwk7OP+bB5GTXSqzMOcOlyWRvWe
         bKQP31cTa+X5UoCfcK6pgplOxw/wAjJgoY3PUOQfgK5XjnRDr/l1Tt++M8nzfkIFqgYP
         7VQshEWrwns0TjRe9qmBCOEvms+VEE0juIc1J05TSiUpL+tibHfsrG2zK9+MtIZh/LCm
         KTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784405502; x=1785010302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHFeM/dPfGA4sFtsC9fMsOxlubs1dV+bQ3yag0vQkBw=;
        b=Iuuj0dDeFo5Lvh6Y8ikcjoAFAxjNOVaPFnTKqdzWz+WEAeokzOTB63j0JpbTg5apEi
         nqHwhgvOZDKUwxqhHlkp8nSwDzMa0MFjFk/oH8Mz6YEe4l4H6mh+iS2AZCL0lBNZ5Sbk
         23HElRAOGRNBzxyjm1GJ0IUSs/fTHXKZyHW5YSl9H6hJykK1ZYPZF4VlQzw0B/PzuAVM
         j28DiKd6Apuk94U3y1yXK/ZsRjFzf+UHdNmqM1eIUJSAYAFcUKQSXPR52LDXMySOOHqV
         b/0Kaa5Y2kQaYFR4Nus66Lqi5UUxZCyCcYu6TgGWmZEXlsOkhxX39hJQAf3++b7yRm/I
         SODQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvEuQUNt906Ed1s3eRj91Ca6ubjaGYjluKQU7wQ+cHiW6Tg+cx+OYXZIhxkAhdtrdYCzBZB4IjAtS89Eq8@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGrqCMLAcJy3ofWpBAevOt0qtmIpJcTD2AJgGk2pvZNzlgOGg
	32xPvrIdCwAUyB+YDBPT0h5DxHaNVNs2U98+n8zagn2+AFfyrSQmPfV62HUtN/b7uA==
X-Gm-Gg: AfdE7cmpIlUJnzuumz/e8PZdDrFDYl2tuAVMT2tx5WweQseNPRWL8nxOB/7bC2fq8g8
	Q0Vz0dXn1WZAIgplZdTqdyVq2ZNVSlr6kb7HzW4wYUYjQxnGfpfj/9IDuHyiceZemak118XBRRC
	sPyIT++dsFUB8aqZBU9G96/ncs7Yg9JdAAyvmF2Ua55NSZhv7KM4SIJbtNJ1AgbesCdz6EDS4En
	1VHKNCIofOoKzegEw/5i2KPO5tp4HaxHmdY3Sx+qgtu0aD33Z0EDutRaTmylYexp83U8sfBzCbB
	ThQmODH3lVs9zMJa8kKWSkTDBZCdXgr9dtKBNdXYnzAsQExgrNd+qN7xMPWzt1W0MkZJH6Xzc/b
	wWF39Tsufv9dA9vkrdJCttyvaFb4M/PxRIb9NHaKGWRFsJ0XI28l7F7c9SPZn9lHBw5kXkb4Kw4
	d9tSsCTD/haHoRZW/pmaDOwqNKdlg3v9lHw68Gjw==
X-Received: by 2002:a05:600c:3f0b:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49550691e94mr1258705e9.7.1784405501768;
        Sat, 18 Jul 2026 13:11:41 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49558cb8433sm3398395e9.2.2026.07.18.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 13:11:40 -0700 (PDT)
Date: Sat, 18 Jul 2026 20:11:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <alvd9zPeXQVQ7l2l@google.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
 <20260715122830.GB3775915@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715122830.GB3775915@nvidia.com>

On Wed, Jul 15, 2026 at 09:28:30AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 01:03:22PM +0100, Will Deacon wrote:
> 
> > From what I can tell, the fiddly parts for iommupt will be:
> > 
> >   1. Hardware bugs / quirks. Some of the simpler ones could probably be
> >      handled but for the more invasive stuff like the Mali format
> >      format, io-pgtable will probably need to hang around. Perhaps
> >      it becomes io-pgtable-mali.c?
> 
> I briefly looked at Mali a while back and it didn't seem so bad, but
> that was for a GPU driver not the iommu so a bit different
> issue. Exactly what the GPU drivers should be doing is less clear to
> me, they don't really fit well with the iommu focused interface (eg
> the memory preload issues/etc).
> 
> >   2. The pKVM work from Mostafa. We'll probably end up with something
> >      separate at EL2 for this (ideally, just reusing the CPU page-table
> >      code when it learns about BBML3).
> 
> Yeah, I'm not sure here, it isn't great that is adding another user
> and open coding some of the logic (eg smmu_pgsize_idmap). It would be
> much better if it could just use all the existing flow more directly
> somehow.

I was under the impression that io-pgtable-arm will remain the same,
but if it is going to be removed (or at least the LPAE format) I need
to figure out an alternative for pKVM:
- Compile iommupt for the hypervisor (similar to what we do with
  io-pgtable-arm in the SMMUv3 pKVM series which compiles in both)
  I am not sure how easy is that for iommupt, I have the SMMUv3
  iommupt series on my review list, I will check that.
- Support the hypervisor page table in the IOMMU, that requires some
  extra support changes, I recently posted BBM support, but there is
  more as avoiding lazy mapping when unmapping, TLB hooks...).
  There is another problem with that for android, as we still need
  stage-1 as some SMMUs only support single stage (used with pv)
- Write a small IO page table implementation just for the hypervisor,
  that's not ideal as it would benefit also from features as CONTPTE.

I will look more into this, solution 1) seems the best case if
practical, otherwise, 2) might be reasonable for upstream.

Thanks,
Mostafa

> 
> >   3. Non-coherent walkers, although I think this might actually be fine
> >      because x86 needs it anyway?
> 
> This is done already, the smmuv3 conversion I've posted supports it.
> 
> > So, for now, I wouldn't require new drivers to use iommupt but I'm
> 
> The recently posted broadcom driver used iommupt and I thought it
> turned out very clean, it actually seems like less work to do it this
> way than try to write your own page table like that rockchip driver
> did which required several review rounds.
> 
> Jason
