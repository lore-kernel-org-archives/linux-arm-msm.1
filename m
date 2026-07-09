Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AC366DA5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610455; cv=none; b=Yk3+zCM18ik8lnVQqbss6Lx2qVSnRIto2W+gMFiADZyFWGJ2YZ1IDZnuCKPsHuX9yphSwW0GBS6bQ1dxXwyjTuQX1E4vrVOPOm2hh980BVoNNQR0RNUL4zZK46wV5O4iD1ciB7+PcQW/k0kB8489Ep8p7whO3ojX1peekJjWmqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610455; c=relaxed/simple;
	bh=bI1J+cBiMa2SCkpHmKrJG+azHdWZ7mPEOFo5aU/4c1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpZflH4UuqgbxRsCqStEjWw9ZPCjHjR+5kLHa2EPRP+np4RHScJSys4LcczxCvhQASiJW0X5NMfSWD4Ctf+L4r1rrVs5yL15q2H3e+CN2TTIWzaqCujBJ0x/oUmN4cMZMu9KprZfFeTl2SeEh+8faommwUBUp3FIyF/6l6gX+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RcHNg+Ts; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RcHNg+Ts"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92ed19f4d60so67130485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783610452; x=1784215252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3aG5hxu0JYH7EcM/cq6JX5Yef1RoVI9XARU/q8dKmL4=;
        b=RcHNg+TswvftK0rg4pdx5hqB/98t8hg3+kCvMaP3Wvj32IUEgQZ9DN6uIqXYkrZSWA
         1Eu5dZ6dcjNig8HJNvE+HrO3uN3YkcDCXU37P3fJdj3k9VCdvMTFR7yu9VDftTB5iRqA
         K8SDg1lchFzNdcbcs3f9FNQDV5/hxAjH8ASDXRrDVmRioSlH/e6Cr/Z6a8I4QbteOIIC
         HvDkHSwlINZylnxe4+hrpcd6PFlecb7POo21Ozhg6IB09pfT0HXX7rLljq1wRn9Pbbcd
         1U2ZSUGtyb2krIIqADL9WnNTQZIShhSl1bsfu2qXF5pL0rNCLyyOu7Cy0nkMjbppGyxx
         /9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610452; x=1784215252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3aG5hxu0JYH7EcM/cq6JX5Yef1RoVI9XARU/q8dKmL4=;
        b=H3Eiu4PQyTEeNEPrj3UNIh3mUKGWemhQBvpKqqnQwWq0p6mJDr6VQbQ9prRLQR6UNH
         9eBqx6T6AGxqb1fcrUKPC3BROjP3tkO+CUsDSlpUBdffBDqKN1yy0FOXXNzgjrDrkp2E
         KJR1/tizCKZq/nZLvAE8714UP0Hd4yF151jb4y85YHU5mqSgfJ3Ph5NgjQGQt0qmpm/k
         UcCEqnn+1IwQumuLnYe68tGtV7D5B/dDbmFkYZGNsHq1O8YYfjmJ6I0iFIdeAh5/51PV
         w+MViAcHsiAeJqG2LdmVvi6AoCHw6VvvTv+Hqw53tj3PTRWxYc3FtDG601yor9f1VIOC
         9ONg==
X-Forwarded-Encrypted: i=1; AHgh+RrF6NN/3CFMG9f2l80P5e/dVfMif/7e0VimYol6TWY51FtWRA05Jvsthxu7RAZ8emN4n4ArTpEKJUArHV3i@vger.kernel.org
X-Gm-Message-State: AOJu0YwSz5KUX1gaZXzwRZ4TEVTBV1PatefTkOMhVfc0GAT/jKUstj1s
	W5XX775ok8wUP0uBAsrXWWepRQ7+VTg7oUdT5RqqWStm+Uw4trvH6b2fFXZQhDHFr+U=
X-Gm-Gg: AfdE7ckfdZ9w4eUsfkSCADMdimNFqy23mhpOr7fN8HMz3kIjqXD+0/XGBjZoEasTtyZ
	9D3w5+JOCzS88sl3Mx4Ff3LXqoiuRx3tR+oiwm85D1tkjl1UdH40286fi8wXvGHssONFk9BE9sr
	fEVU0j7l+OEdiHYlWpSMxRbbibaWBFhDvGsYTYx+xJPuCxHOB0xYkwic4nhd79PIHoycUMI6HgP
	g7OIB6eSdC1ZMlSnIyTbGmV//kczX4jkbE+zheeDX6Nur+IgQUMeU18qiYa156iDrfwPBNQxanL
	juu6jWKbnf2pSF0PkEajmmm/Qd8Q5ABjEFJaESTfpDPXn27pnr6Vc4EvASF02EEctEA9xJIFKYm
	e1TSP+9gyYQjv9pkYiAkuJeeLSzy+P8P6XGH+/ODVpYNK51Q8iapjGhjRv6kDTrue8d1ZTlpwZR
	QDT9UzeNJUlyK9L3bv/2uFivc7tBxy5oYwZjqiqWifCJbSd69WJYsaZmWFxMRuP12ORt+T
X-Received: by 2002:a05:620a:179e:b0:92a:f74f:904 with SMTP id af79cd13be357-92edab23ef2mr337298385a.1.1783610451142;
        Thu, 09 Jul 2026 08:20:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ca90a5sm1652288685a.32.2026.07.09.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:20:49 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:20:44 -0400
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
Subject: Re: [PATCH 14/30] mm/vma: minor cleanup of expand_[upwards,
 downwards]()
Message-ID: <ak-8TKDC1GBOeMOM@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <b24f70b72f0a9e2a37b904e5b59d80b88bd42e4a.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b24f70b72f0a9e2a37b904e5b59d80b88bd42e4a.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:25PM +0100, Lorenzo Stoakes wrote:
> Adjust the stack expansion functions expand_upwards() and
> expand_downwards() such that they are expressed in terms of named constant
> values, and make use of vma_start_pgoff().
> 
> This clearly documents that we are referencing the page offset of the start
> of the VMA.
> 
> Additionally this cleans up the overflow check in expand_upwards().
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

