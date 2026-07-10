Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4783812E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783710336; cv=none; b=ZhOI7BsTQsqfqWIKkAUP5fmhB8NICPly6mMCdwdxDX5+LVPLQSwVevMsTNFXOSGQ3Hd+xt/MZNUaPUBeNjugVUZhhusRxDNEacD5fjhq2S4BKuM44p5W+Wmk6d47C6XnxP291HLMMO1OmXcAwLd/opJcd7MJ0ij+YAVpJ1gXKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783710336; c=relaxed/simple;
	bh=0O95+yAo6D3yNWuX9lzWEAviyk6KjGyNsi91HXznKL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLo5WKeR2zsiAER0sSLgfS8kvFSXJV84NRpMW5Iz7R4kUP7FzePq81LuRukNRr2X7WyQ2SrIddfVKLi301GuLgc/93t19exQr0LByQGT0tR2EDSf+6DSIzg9QbWAUf3MdGII+/CXdlVodRsHJNDP7Lt++ZPQIWPEH9hKHDM0BqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tyGs4YzK; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tyGs4YzK"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e50979c71so125284585a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783710333; x=1784315133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Cb4T8zzpAMOVzwqCT+1eDu/jZ6x8Q2fk7Pyrqw1u7c=;
        b=tyGs4YzKykavFOU7RpmSsqQAhspsUgdW4ruG/mBjVMFoJjf6CNDMip1BPFXVYFwgBV
         S8mzQQ31fxxPWg1IYsGznuUYTJEueHjursWZ4QHWCV8xifPKDBSq3dxqRhn2gPsTjQb5
         ASAqJfwDZV8FsYtCKMxuKXvhMgWH/uY483GNeeIiNloZT/uuc9aPJPi8J24RQb7myLHE
         5lHGqnVQh+bigcLMCkxKtvThM3lBt+pQm6X0conpdFV8gErXzkYi/eCt6H+ikbVByjiE
         E6SFU35OwPnGWINhkRXxffFldULXzgkmy9/IKyFsiHdUGRhLJhtwroVBVCQ8cMYA0SI0
         zWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783710333; x=1784315133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Cb4T8zzpAMOVzwqCT+1eDu/jZ6x8Q2fk7Pyrqw1u7c=;
        b=gSnDQ55SqTdg1RlADGbOakZBuGDTze98dy2RWl1/sYyyqtelWufXU8B1L2ARObsl0r
         752rMWGv6CSedPsP6Q7Mux/chtQLp0L/IGdnjDHMElP58Flo2eDjP7hYUP6YYxUEDQjv
         fu6ZEoEnTCU/WmkIUpNHGo278huaeCVz0TGAeUEbo0a7OhwUFJXnuGluavpgbsJaj8Jb
         IMirRmjPSS6WhqalKUIien2I4iuAF49xpNrOrs+LVN1WY+tzqINP53Wyh5R3CB2kgSln
         83pwhULj1jFmx8aKBioEWZkCuHHAL5oufVhu3on3DTNcuO8qGwa49jissj9wmth54KTy
         6qtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqldmSt/A6I9xw5ViatVw++lr7sPM2w2G03yq/BKlcVjn8IXE+oRanN1YG5QWE5AjkmznSWccIrWHlfNzsG@vger.kernel.org
X-Gm-Message-State: AOJu0YybOUfYOP+iAkjtK6N8q3rqc5sXLQ6/QA7AlNNrycbqMu0P8LBP
	RZvYMUgRUKYfLLHQ3LO2RtomIeh3ZbIMnXWtyQCsyJmJCZhHxtaMVHbNBMpXzp4QwBM=
X-Gm-Gg: AfdE7cmaqpqdAkiHnHeYjO3rOAdPad/r4bLll1gkNlWGQBHUY0AvhLuEsSbJyD6eRty
	vh7k2rhp6bMOnp67gxnc4ZZ/s19RhhgypMP5X+68Nfg+JYMcpNZZw1qk1GOBo3ykN8EzMHjO1QI
	giCv3FHpqN2sxiWIL87Frt62JU4TSBCynspKjqnQBygAyyU6wTD7D8Rb1BAzMWUCFGxeZhLnusQ
	X264a98iBAd2hNpeI+x2KWh3KnMlrgDOyd+XvR3zQhnKIzOiYDnEisd1+LA1lg8xpGZhFK6JtvV
	GLjX9JYgBWS4a/4rbj5mSvKuJwGTAOIVT81VDgXBu9tnHRSu40u6w87eLN32eDuEbUgTaMFqgsq
	LKQVf+nr1C00KGPQQezSrayfp0UWEp671TsfTIU5Iy88+89B8rrgqV+tML3bZFAwzvpEDKH86PA
	G8LtFA2/T5/ekyIvAQ3kM5Ua5Gq3tOkufUU+mMJUxWpZXIC1eOzmHfUG8GNLbODZ8UYGgh
X-Received: by 2002:a05:6214:33c5:b0:8f0:65c7:315d with SMTP id 6a1803df08f44-903ff971194mr4994756d6.24.1783710333250;
        Fri, 10 Jul 2026 12:05:33 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fe009sm47940576d6.38.2026.07.10.12.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:05:32 -0700 (PDT)
Date: Fri, 10 Jul 2026 15:05:27 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Dan Williams <djbw@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Matthew Wilcox <willy@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Hugh Dickins <hughd@google.com>,
	Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-mm@kvack.org, iommu@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	damon@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 20/30] mm/vma: introduce vma_assert_can_modify()
Message-ID: <alFCd1RtttwxKBLc@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <23c7602c58cacc23ef22618a27af9a2d54addf58.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23c7602c58cacc23ef22618a27af9a2d54addf58.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:31PM +0100, Lorenzo Stoakes wrote:
> vma_assert_write_locked() and vma_assert_attached() are useful for their
> own purposes, however VMA code absolutely does allow the modification of
> non-write locked VMAs if they are at that point detached (i.e. unreachable
> from anywhere).
> 

curiosity: I presume this happens mostly during init and/or teardown of
a vma?

> It's therefore useful to be able to assert that a VMA is either
> detached (modification doesn't matter) or write locked (you're explicitly
> locked for modification).
> 
> Therefore introduce vma_assert_can_modify() for this purpose.
> 
> While we're here, make vma_is_attached() available generally - if
> !CONFIG_PER_VMA_LOCKS, then there's no sense in which a VMA is
> detached (vma_mark_detached() is a noop), so have this default to true in
> this case.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

