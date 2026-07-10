Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27923C09E7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783719571; cv=none; b=Lc1HFmC7nYIR1f/jjD+Q1PAEPt5w6qCdTqXnFU1V05QKKTPlA3kX8StylG5Vv7Zt7PjycEBXPUfrDl68BP9pQ0IFeBbWLDlcUVVwMKBfV15lfkCwg/gQiXF+T4uVGAhYv1y/MPNI6ir3Y1k1VeoRiW1YczJo+RTOkpMtfnzqrgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783719571; c=relaxed/simple;
	bh=8IQ5CYx7b5nVnRm8wkAHsld3shhNHab0xIV3bA9f26A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWk13sfOeEvZo7v/p1PgMHqdKEnJuWTrP3oqNCrsXGd5YIi8nEIx27hsCYZLohqO95fwMZqssN5HFZOJVzKUrshjNE7D57SDS4XXChGxgHPx83J4Ai2E9LhayWFBy71oSGuTHPW+Mz0/6gF2r7qMl430XeU+nckzz9VBmGWbCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KcM3Wylc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KcM3Wylc"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f0d6853360so11373306d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783719568; x=1784324368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wb1LcvJKID9cCXN+ue8juptbLrwaSleub1+yDxtfpnU=;
        b=KcM3WylcLQKgQyXi9yGb6DVP2xBKT/WbjS7kPU2VDU7XkEH4msaT6vN2PsX/38yBZz
         8DXrNaOJya8FB8lundHEne4O353YE2hDIALM9o/2VBTcWWbIZXjoSBld1dOop2vOMmbl
         GEaav3WGOuAd2joAlZRxieqZmCAlx13NmAF+RsQB7bqQCVVuuJoLKuPXDyfv9EbDog7+
         0APUZO2+koKajYBqWUXhYmRb8Mut7lET+V6pvLRRbwbSLd1Fx+tBt1OR8kCkbkOVm8rj
         YLaiVQtEgIVqoEXPWjQhT1+7yX1R5ZUSI9TK6UaCYaaaQmY8ZPknfw0RBIeoO11F9jrN
         GWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783719568; x=1784324368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wb1LcvJKID9cCXN+ue8juptbLrwaSleub1+yDxtfpnU=;
        b=i8VG4cQLRSCU7CGt7cVtfGwZHKSGwpFMTYF/JzUSikldJec2zMN0bYXbBIvzxCXWxp
         Vx3WQddc1M3Plc15X4/DAt/E2Bb2mti6JEh8JUVmVl2g8oQ/mC0839dytwfduMrG6moU
         pXvwckMpixR5y7jhpHPU5DY/nOzGf41uSp6tsesjMbnXgULjesbj1WFSSbx6MyGV85pW
         mUAcisdr+xBPg+fcb1Z35HV/todDVOx476jSAXVGFUuaUrMtV24c8hNXgLZjTltqQpHb
         f+fuxNdnEGXlCMPclc3UZM9wS7VTuRQ2+QgdXsax7xNSgc3AWBaTy4OzPBMleY4BILhe
         3k5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqH8ikdD/P8jDzC9ks1OcuWjM5GPFK9xT2eYeZSsB8NhZMheKQoTyZKe7A+z2xLshrKoFl7Y4R+/H2ff8T6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZ3oVzJiivscx9uE1wtLRfVVdz3D7l50NeOORjBMd4tEbHFrB
	oQK52yeM7letvwwdMlHwsbS4MtF+bN0irkiweofZ31/1DObQlATz/1CnOoIlJQmGuK0=
X-Gm-Gg: AfdE7clh0jX8+EPDsNcZlKYSUTxKT59qGXOvMC4Uen87Bk4mnBHf0RfN2mxFqy6Z6mT
	l8gezUcHIWf9oG4F8tOz+uciKn4E7TZo4nXKibGp7uV6IJlkJ3dN9JGFR044l3YENbD2DBrn0LO
	qrMfvoLOWZb3jvTwXdoYZfHiKVSnoUKVwC81m4Em4ihVOyMVLwTPPt6/Wr+TaZFPTj/PtrYeLtL
	BGhqS68SNIa+JRQjitk1wVExG95uMs0/u0dqwCtFDfsxPzQlNQyLfTENoNv/ooIHvHCTcWPu5FE
	pFuhriqllh+18wPSyg8LZpwuDdurn/2yP6/M4QwIY8bhqCXObZiCIvSi0xNyr3F6AXoCP07047f
	uVXQsGzNvJhyP+z3a7L1MzsHNIQFVW3XNLyu2xuy4lpthDFvp2r2ycicyZcpAro6uTmg4rJuAdp
	sxFR8Xw87fvIe7hQNTfMUwsJuQXyl0LK5Uippo/Gu7iigk+2v1dPx/5Lt3hbF3gPYUQ5dz
X-Received: by 2002:a05:6214:5904:b0:8ce:9cbd:b0ce with SMTP id 6a1803df08f44-90400c8fae9mr11445886d6.34.1783719567574;
        Fri, 10 Jul 2026 14:39:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e081dsm50984276d6.9.2026.07.10.14.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:39:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:39:19 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>, Pedro Falcato <pfalcato@suse.de>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Dan Williams <djbw@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>, SJ Park <sj@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Ian Abbott <abbotti@mev.co.uk>, Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, damon@lists.linux.dev,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-sgx@vger.kernel.org, etnaviv@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	kvm@vger.kernel.org, Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 28/33] mm/vma: slightly rework the anonymous check in
 __mmap_new_vma()
Message-ID: <alFmh0sm1are2VIq@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-28-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-28-2a5aa403d977@kernel.org>

On Fri, Jul 10, 2026 at 09:17:09PM +0100, Lorenzo Stoakes wrote:
> Determine if the VMA is anonymous early on, so we separate the logic which
> invokes callbacks from the rest of the logic.
> 
> This is in order that a subsequent commit which asserts correct virtual
> page offset for anonymous mappings correctly asserts this for new anonymous
> mappings.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

