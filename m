Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340A367290
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610577; cv=none; b=ty36S8lwQLODfuY+jVpccIJ9LyLbPVGC+9d/Wofeq4mOz+Mb6BuqHrRkT9OSux/8U3oGUboNFB0zhA9yeVmEEB9nwLCnrKf3x+pJmbWj2RIP0gGf/8jWYfxUcSlP6Xwn2A3WuchcCE3UIHGTrFDDudvSYUrTZL9jQ7jAbfnJ+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610577; c=relaxed/simple;
	bh=WZm0pCIlMCZnYkWqHCv0Ceyplb5Du4QgkvAdE7k9ZdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnBAlqI1vShhb10f4sYkBqxNDGujMTWcFKVtL6twgCy/JAKoJgnn3vTIuFtEtu41qqTu9ojMggksCh7+vSPWcj7ndTnAKrKRMspFT2Hdpmz3YYSM4c3o+WWICxthsj26QIyVY8QTz+EIru3V/rP0CNzCYDljk600afSV41ude+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=at0Go6QV; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="at0Go6QV"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8f18d92172aso201736d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783610574; x=1784215374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8MCYdDNt+ln4FYDiI3hqZQpolLcmikZ66uE9gEYE70E=;
        b=at0Go6QVpsvcs347YVm8e6Uaja9G1IeXCuro3d3GOlXJqHWVvE6PiN0K2GrLyghLIW
         z3oj6epX/hjLL27IHOykQiyUe/iNRNY1KDATD9vh76zvXQHF5HBTyw9/Aq8HDW7V933u
         wN+nxswsqSfWTjCdK/+Kl3FBNM0eBchEq7T9PdmZKnesdFjarUfsPj3XxCRJXXvUxwOm
         p+XWOy5Qk3UREk2XLNSf41ntnAdyKhre7b8Pe4ZuqkS5bQYq1kz/PxDwBk5xWSo96gGz
         jTdJjrtzSEH51GHs+sq7xrsvUHCZr/q3OKaXfAojoNZfUxOOj9jGmFUbIMVbGezn4Afh
         G0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610574; x=1784215374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MCYdDNt+ln4FYDiI3hqZQpolLcmikZ66uE9gEYE70E=;
        b=Viza7afU9RqwcRk9jKHyBX+VxGw4tEcjxRIJCfqTEX9jc+kbaF+niS+TPD3eOA0McR
         NvC65iWN6I4oaRpWlDf3VxlWgwNblOK+HxQPplYjGYeW6wZ1p6TbQi/0vwXALbucn8c+
         ooU3UNMPDNVCXao2pz2k0ql911KNkIPfSjlttorVHynJmEFngb+Y36WmadM3W7+3hLyS
         0zsofRNKdIdyJVSBy0niE7caJi1SCmfG1mG4qUHwiRCuLuGDhz+2xHH30uv+qqPY+gIA
         dDHZAXCfnvgB9faOEW96lFPP1Cr0x0Snz5/dQ0pi7YSS2CUttsqphHeuogfj9bFRO/gu
         SSZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDVFcUEFNsaDanAxoqfLRNMnM97am84suwZpnwQafv3GuWBk6JeK64fnStlO/Tncv1mSu5K9IxR5l5jioY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwaw8PGqTWB17PtX9bROXaBH+HNj2z/5gTOC80jJ1B0GeCqWr3
	kvz3h3CT0gN/Y5hMRrO9cJo7FumAUYmywSPAEdRga5+fYnKpwRxUGsHjf63JYmjfk6c=
X-Gm-Gg: AfdE7cluz6kH9UWNcGQuojH0jAKBHiH+vXXUfb9rvguYKr4+DFHxZ/9dP+IEEHPFwcz
	VyAbctSsOwyh+uZOLldluGoCwKJ0p+2/JLtUVsHuTrTC9HK9KwfpBqbSEQ3FnZPCnO0TBeUauwl
	uVXA4jkQltJUIEw5f9OVk/KoCTjUXji6r9Mov5N5fUdKpWtbqypUFISZ6gY7ubDCfd/EYwOP9ky
	VKISUh/NImusscVBLwZWw2ncEZoYgkKOmEdaRliTS8y/iKGka8wwXdmn0rvwMhfZ+nkl774IUd4
	ql5p1WGoMUkx9LG9cjZ8AdxhRu8+jS+pZVpHNVUm4z/o2kC08u6O+QUtoIWDp/k333VHVEhXpVz
	P2LCCfiZQD7giN3SwMwVi6F7GpQ6Hy76Vz5s1kK3i94oe5cgpgoKQ2RY8LkBAYWxHz6qO5HNN07
	6TFsCDFsKOh1N3F1XMw56b5/TxDeiBhCrhq9pvMqYTtfrJ5vLkZAw+E33hAd1PGvGUXqtY
X-Received: by 2002:a05:620a:28cf:b0:92e:68be:1c5 with SMTP id af79cd13be357-92ecf6165e4mr847751685a.21.1783610574232;
        Thu, 09 Jul 2026 08:22:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b7fc3asm1638936985a.9.2026.07.09.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:22:52 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:22:47 -0400
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
Subject: Re: [PATCH 15/30] mm: introduce and use linear_page_delta()
Message-ID: <ak-8x3TWsuhGzKlJ@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <eedf589778aaab33e6df2ad6556dcde536e13460.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eedf589778aaab33e6df2ad6556dcde536e13460.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:26PM +0100, Lorenzo Stoakes wrote:
> It's often useful to obtain the number of pages a given address lies at
> within a VMA.
> 
> Add linear_page_delta() to determine this and update linear_page_index() to
> make use of it.
> 
> Add comments to describe both linear_page_delta() and linear_page_index().
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

