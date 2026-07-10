Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671B12F1FDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696154; cv=none; b=BNi0Cy8TyX6xv2J88JvVuLE38tJC6bvFc9wyXhzd7tUUrw4uYPFO1Feu9Q+ZTaXad6knhevjXkNyq/izVPVKLqkj4a8ho2ZW3oemapZIpPZNxubyzfFSuuB7ioXfLvmCyuQufNFr5rxbQz9VLzckiYguJzhpOMn7iiUXWLzqFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696154; c=relaxed/simple;
	bh=EYnEp1we9gIclXQGcrALFhmvzaRn2auF8TgNETsfUuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUCUyC1tIaiQbuB2MLef5FCGJ/K5iG54+1PSVQpnADDz8jFI39YBtIt0dv0+gqfGH8eGYOn30DdyT7cd9/z7tX8HIgk96enzbgzVBY/ZGy3XkOkHDFOHHl5TfxaRg2/hDHXcc8ncxXSPrPnCQiyTe0Of0jMZsP8td/7ggWFmPeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=FlE2iCAF; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="FlE2iCAF"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e99ef0902so51647685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 08:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783696149; x=1784300949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kfeOD7p/qxHHEIV6dN3ojdA17bZ6I64Gd2Z+QpoWxkg=;
        b=FlE2iCAFDKTqBTgPqXOnJ3m8Yh790P47HLtlrzlavDiRF10u4QNnF2QfY/uGZHMgZr
         Q/u9otJq2Y2AsRyL3yPUL8ol6pdpFY+sWjCLDtfArbqiWJdnJqki20TPEXBIq1ME3yhz
         p/21rl8xvXrLuvdLMaKdT/0EM4yEzpfDA8g09pEjrZXxIb3sC+RLk0qDcsdaZ+BZ6rOz
         y5udFqKEswdq83Yti3y8l/ZC9fKn6s4/w6P2YVvxxghLsKWMiZqDtq7hCbZ+k1Kg3R88
         YXehrYH5Ooy3oMxeQAhnnOA4PktE3GgSvjERWyDtqxUcBWevruVtsziswp+3pUoQ5XmF
         sI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783696149; x=1784300949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kfeOD7p/qxHHEIV6dN3ojdA17bZ6I64Gd2Z+QpoWxkg=;
        b=Fp+0arMbEmLyRGOoaRVeIQJ+fJ8InbZwNvjeUzKP2+eeWTjvRkK36MsMmEqZ+v6t1T
         JWLjFiFewDwvxB6kFxPocFe016/c6eI4DqRL0t9bt7jFz5u3MrmWRCv98xLz6UKJiYQX
         IHpOIbuYPF3FyFtysnHiXpCYSSjtk5zfE+4WpZwS4vOqX0osCh53K1Tonqk+j5nMYPoY
         clcEBZ/4BXZKPY/NAqoibUQxjQI5Or/dn5wqlCsiTXRpTfkaH2knSYrohUT5klPsdI33
         DcHNLYa4FyWdG8g8XwthmPJsm/5nGrygyToSQRxsMe1uXFP9Ad6ftF8VXwh0uQLrEr5h
         NPhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa7Cw14ZFka9O1nv1u9PhOUPQhuojnZKrLMw9VCrHEnQ+6DT5/wRX0kgcZvv/eg8uBK9G0jWA3wLnJy7vl@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPdk3P6lPu6K3fsOQML5rNuHx8XMVRkDg0HSh2ABw61N++XkA
	STP/HSKENxLeZMjQx+Yz/ifKnwW+rgxasEJxbYOSvGG6FwUpE8KUXha5xkpMpjmQgIQ0IAW6Yvm
	RofuG
X-Gm-Gg: AfdE7cnqw3fHVTjDW83jrV7vY4B/5YIs+O4oEGRpaJsayoputfuiK46Npve3Y0tk2pC
	kklXtGoIUIHiFYdBkg4QQq8YLzloyExen1mxpAcU2W0/6eyFuH/OL0yEsGN9vDGIxBRfs7hPXUe
	41NIgDlByxIa0dyddTwQPMJY0KQCWdcvyU7BfBUGsxCnuxUMta9ZXCkw+nKq97501fctSQHhsZ4
	G4GcYSua9l70iq/0JblvimSkEEpWtyXX/OCB/3JzRmFGU///+UE1ySOMXUqclFyViOXocHMTKpm
	XKDtvzG02Hr5DAX/nQ713idTr8xbvWjSDHv5TbKGWDib06bMqkiKMMsK1Va3ZA2/ysN7nxTZ1Lp
	//ibc/E1TnFKxyXZzWRKeOtLP/sb9VxStgWr3VQxUy7WpM8fM6a4g+TGpaN5zBsJnyQ4oTbVrCr
	mwcmGrZUnOep/Moj5kSkRSMD/79oJ/zLI/NO4jX3/zjj+wddfQaNxep+0L83RnJQWu2HaX
X-Received: by 2002:a05:620a:4414:b0:92e:7d53:8e8d with SMTP id af79cd13be357-92ecf55964cmr1359477885a.27.1783696148308;
        Fri, 10 Jul 2026 08:09:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d34f76sm213283985a.35.2026.07.10.08.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 08:09:07 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:09:02 -0400
From: Gregory Price <gourry@gourry.net>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Pedro Falcato <pfalcato@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	damon@lists.linux.dev, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 17/30] mm: prefer vma_[start,end]_pgoff() to
 vma->vm_pgoff in kernel/
Message-ID: <alELDgm258nhjk3b@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <ea87349d63205bf4c26ea79854f179a9bf8cfb0b.1782735110.git.ljs@kernel.org>
 <akZCg73F-oGzDp1a@pedro-suse.lan>
 <akZGqclqQ6gS12Vv@lucifer>
 <ak_C_o2ehS17Q5HV@gourry-fedora-PF4VCD3F>
 <alEHy1raICek7imv@lucifer>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alEHy1raICek7imv@lucifer>

On Fri, Jul 10, 2026 at 03:56:33PM +0100, Lorenzo Stoakes wrote:
> On Thu, Jul 09, 2026 at 11:49:18AM -0400, Gregory Price wrote:
> >
> > Silly question:
> 
> There's no such thing :)
>

All my questions are silly.  That's my secret :]

> >
> >    What's the purpose of retaining tags in a non-address value?
> 
> Well if you want to reconstitute an address from it later then that'd be the
> intent, but I'm being hand wavey here for sure.
> 
> Main thing is to retain stuff under the page mask
> 

Right, which ... 

vvvvvv
> > That sounds like there's fragility just waiting to be broken.

If that's an actual issue, then our relationship with tags is painful :[

~Gregory
