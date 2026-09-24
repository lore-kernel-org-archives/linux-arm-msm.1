Received: from mail-pz2-f14.google.com (mail-pz2-f14.google.com [74.125.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188F49DB97
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261687; cv=none; b=JrEaZh2yu2Uxx13xasPwUD8PMxJL8/a7YvAI2FTPKa6rynVxP0TxmX3ExmIJiHHqgK5baEIfrFbY97PalrfocggnawXSyEv5urAmKCET7ye/aid7gXw26lg6KVe9PJvkcZ0Rx7lRH8G6e6vcPcC+f1B6FNqu6Q4HoHzwf/FQQbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261687; c=relaxed/simple;
	bh=p1DkMVivDdOboeJjqnejcRbxNjlkIEsanEsxvOaX7h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bkvhF7qyiGKz4qevHUJttI+sljYLyEhW27BiuvWbANukdJj91LLag84EZrfp0a7YVrfGX+Lr/B55UegUQbrtWPnq6yT2rrqTCULfBYbFTp9H0RQYBYWZJ9je4O2XfeEVxC/X/2Q9wkTkbhlKJ8sCvHjjfl8zyUC03/yq6UC+ojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTaJmED1; arc=none smtp.client-ip=74.125.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTaJmED1"
Received: by mail-pz2-f14.google.com with SMTP id 41be03b00d2f7-cc46895f82dso40096a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261670; x=1790866470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mo3TPVdoCkIHw8PshUsF9i8x4gaS6XMSbTsYHmyLH0k=;
        b=aTaJmED178NrdcjrazvolNjDT1PUb8sis1r+R+5xUDrH2U4QdOlVto2NIWCo0mOYuV
         LqgmlYoZFVx6TH4YLPTB15xvrbrnSdETfJ6nTwPpIG3O0esevUDcAJr935zLGE1kuwix
         DUGjUAWotnylm5lN/jYRGezXgLIN8g5ECD5N/ClUUAO8InuwftJNz92niW+n2XPAGhGo
         5dHR5wS47BBdOvMITlb8swtNy3iIAzLzy2ntrYINar/p0daMMhpIr4e4URSMowmfLnfK
         /7l3NkMQF2i7plMHK373CUqb5pipQdeBGlBTrF3BdEPsTElCoQ2OSiA6sFW5Lq763Bi9
         bJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261670; x=1790866470;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo3TPVdoCkIHw8PshUsF9i8x4gaS6XMSbTsYHmyLH0k=;
        b=DigyMpGSpbFvqGQ4S/iNEW3LdhrSs+csqbjmS8CyFnvwTUY769nHQfcSLWyIOmNijZ
         nnfm/kNm3OZ+GOrUCblxvPCiQe3RtaqHxqutfE6Dr9vwzH3P0AbflN2swVeQwJJzMGLq
         vXip+LCbdq48zjiEORZwo1a8tJZJsaUtEMjUxA7MhL2HB/cRHmWr92YYr3LcojnD5Lrf
         EPfM2MEy/uZvI5zBjeQ8ZPvQbWYYbYPexQOo0Vb/NDxKnIioe6OxQ22Kic1ujNdvD5nz
         uIai1Ia0daSFeZnLTLGPmjLxzX8phiZwbS9IaHAD0wNTMNs4O2uoR7xS7zNWfyF4UOfJ
         puOw==
X-Forwarded-Encrypted: i=1; AKwUvBwxnMvSGnwV50xi/S+DdV82uGj72/3B0GbfDiWOmMqkD/hTLoa8x73orMwLCBrtMLSUbQNpJDXikcgi6vzq@vger.kernel.org
X-Gm-Message-State: AFuF++lruCKuYsqJ+QkImqCbgjiYSnQVdrh1dmjN2IwHVZNS64Ui8gD+
	wn1YrhvOBltoDtbpkwnoOSzRUbHrxPRE2vGYqecdH01bXib0nNl2VhU/
X-Gm-Gg: AYBFou38ZCnm4SWTR/Z/RnHi13217llH4XPpXXJ9lhVsX7kIRo2hiDqsXCGZNrU6xtE
	kmU+7e1Bp53VTMYFccpYdXi98USJpwjfOW+v60E37qsieomO9DEX+K2fcfaOBgH/HNyBKFRxQZq
	5oB4GRDTu5T/GnVHYS6RuuSe+4eeBzrYxvLKMehJX74RYwBIr8u/7hPjImyi4oG+EaboN4ZZyfy
	3DazRYDCu4WYfDvnSOWPDu/AHGLSM9uC9GwUT4dO1jA3ChacpC0TFcKFIWkg0morVQH1RgDNB0J
	DrylI3RbIkbeReO5rWAgzaRoQNM847B8/9yqUnCTmtT6hCejDdLh05Hgl3cOnyU9xEQ8oWVg6H9
	veaw5N5Gl+6ks2MVU9zx/OQzK+K1tu6RklXQlkmXHiiySJpRi25T7P4tHhJimGk/tZfFRcrkIp8
	jw+eJd/BGUpFTpYogCtdbc3ZI/yFTjXdg5I0MgjCsT8kl5z5x5PaRWKMqXxYfJ+/tqCzhfWUda9
	vfSBnAaFtp+0A==
X-Received: by 2002:a17:902:e542:b0:2d6:3c1a:85ef with SMTP id d9443c01a7336-2df7dfc93c6mr35028765ad.4.1790261669688;
        Thu, 24 Sep 2026 07:54:29 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3a3dsm28629285ad.43.2026.09.24.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:54:29 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
Date: Thu, 24 Sep 2026 22:54:18 +0800
Message-ID: <20260924145419.47354-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
References: <20260923074256.9357-1-liujianfeng1994@gmail.com> <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> So the assessment of what is going wrong looks pretty wrong..  VM_BIND
> should never lead to iommu_map_sgtable() (which is never used for gpu
> per-process pgtables), for example.. but is used for mapping for
> scanout.  And pages are never used for mapping in either path.
>
> However there are a few places where sg->length is used (in iommu code
> and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> what the actual problem here is, rather than any use of struct page.

Thanks for the correction - you're right, I mis-traced the GPU path.
The per-process pgtable mapping goes through
msm_iommu_pagetable_map(), which walks the sg_table with sg->length
and sg_phys(). With the wrapper zeroing sg->length it iterates the
entries, maps nothing at all and still returns 0 - which explains
the UCHE translation faults without any error anywhere, and is a
nastier failure mode than the async-bind-failure story I wrote in
the commit log.

With that corrected picture, DMABUF_DEBUG=y breaks msm in the map
paths themselves: msm_iommu_pagetable_map() for the GPU and
iommu_map_sg() for scanout both consume sg->length, and
dma_buf_wrap_sg_table() zeroes it, so every mapping of a
page-stripped sg_table silently maps nothing. On top of that msm
also uses sg_phys() in those paths and
drm_prime_sg_to_page_array() for the page array, so even with
sg->length preserved, page-less entries would map garbage
physical addresses instead of failing loudly.

So it looks like this needs work on both sides:

 - dma-buf: preserve sg->length in the debug wrapper, so
   sg->length consumers at least fail loudly instead of silently
   mapping nothing. I think that is what both Christian's "we
   should probably change that" and your "zeroing out sg->length
   is what the actual problem is" are pointing at.

 - msm: stop consuming struct page and sg->length of imported
   sg_tables, i.e. build the GPU and scanout mappings from the DMA
   addresses, plus the drm_prime_sg_to_page_array() cleanup.

Is that the right split, and is there a preferred direction for
the msm side?

> (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> but that cleanup that I haven't found time for shouldn't be the
> problem here.)

Agreed on it not being what produced the faults - but it is part
of the same contract problem, see below.

Also answering Bryan's review of patch 2, which is in a different
branch of this thread:

On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> Why is the fix Adreno specific ?
>
> Shouldn't this function be ammended with
>
>  > +    if (filled != npages)
>
> instead ?

It isn't meant to be - msm_gem_import() is the shared GPU/DPU
import path. And putting the fill-count check into
drm_prime_sg_to_page_array() itself would indeed be the better
generic version of that guard; I checked the other callers
(etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
partial fill either. But with the corrected analysis above, the
page array isn't what produced the GPU faults, so neither variant
is a real fix. I'm not asking for either patch to be merged - the
series is a bug report with code attached, sent to get exactly
this discussion going, which is also why it carries the RFC
prefix.

> This very much looks like an LLM generated patch - the commit log, the
> large comment in the code and TBH the solution too.

Sorry about that - the patches were drafted with LLM assistance
and I should have declared that up front. Any later version will
carry a proper declaration.

Thanks all!
Jianfeng
