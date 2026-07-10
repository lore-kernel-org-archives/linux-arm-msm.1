Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B643806AD
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709964; cv=none; b=ILg8f2/Dm3pxyQynRZ7h8V3qTAqXprnDWLr5iw8woNnZ8Q/AHBHZBc3DowoXhok71xampiCIRtPe7hncZPZ3Hpbbihy+UQIJkMwvdP6d3DAXOlxPjSwPUStoRdEOk+mFA98QzAb21bZiUOkJWA5XNW3qntOJV4o5U8LoINImyEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709964; c=relaxed/simple;
	bh=L1PtE+Fge/ce+F2DBwYJ3SZFAaV5kA0gEoEabNlaIYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLZsgt/zMAB+gU975MDbc/I/4U1EQPrLsThKplrzS+qvvHPVf1PiXxQ/JIry87KapD8AfaKBn1Oo/voK+XpxhRW3N8ILrqyoDDVLBOGJyNmQ1ckBgjztAVteXlpICYutJDImiCy8UEJOULttKb9SooGc/zHDk2aFzEeYGinC34Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PB7oBmn8; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PB7oBmn8"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c0c45c580so8640831cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783709962; x=1784314762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74B4rm3uR5k1lRSPUh5wFwkcdLxEy4GniWsMlOdHPw0=;
        b=PB7oBmn8rFdXuF6beB/vgXJAJUCb5Wiflj2c0r3WO5cmiDQzPm/ethlo/sbnW7mgCr
         3o7ztziuDHX30UmZN++fI8CpkIsthHTQQ2bJAiL6sImi87C+qTC1GAn82Iq9uazMFTfO
         QfEwUcCldmMKjGyZy+6yP/N7aAyAldDa65gvulGMOoGz0V9ZSHnFIOqvjnsJ5ZU6RTdp
         1jm7WtF/6Tl2z0LlUvF9vI+tCPYhwOkph1I/MfdX11JPSe/Y/iUI9R07HVt50p5i77sB
         tO8wvSNPxWUl5eYxL6kmLj/79pyhsOdO8Nc162WbqFC/q/La2DldEC4WQ3/tPX0i/Bl3
         +ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709962; x=1784314762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74B4rm3uR5k1lRSPUh5wFwkcdLxEy4GniWsMlOdHPw0=;
        b=jHUFteZT0A1dZMZcGXWdOBCDkhNWsLm1JgdOdRF6Dby9tfOdGw4BdQ3vmadcRFufXR
         NNk0wrFB4jd4yGAg3FexZrQnPJh6fhFHP01NgXNfKln+imMZ1mqc3r5PFYIhe79o1Kgv
         GpGLQ2TCNFGld1bqJAXuKIN+YQTmlLLxc9gxwhjNoxRHSRxUx17M3aRb7MsW1/6SHA/7
         384/TtcnpK67N9oL37TvKCWqJRiuasmU3ZaEML+pVypWnz/IzGfmXM6cF67uyfv6vOsh
         vFljis//mLdGEupIS1heQUCELWgEa6hqc/KohDMaiUwf30n5mpJLzK1f0O9JqsVPgBB8
         n/Lg==
X-Forwarded-Encrypted: i=1; AHgh+Rqp8AyAk9wdqLUaXbPLfh1VeX5EhUZxrH1SGGCFFWv737I0ulpc8pSLAJdva3kyMUffp6fHlzvtaG0QxIve@vger.kernel.org
X-Gm-Message-State: AOJu0YzNmoekjbWzU9M9u3N1rSv4aYuFufzcEb5aeU74gN96xL4lefVl
	/Gbh8Pc4oUNFVcNRN+YcQ84AuGFaK47ZnzHqPxts6nfF2R3fyL7r/5KLUWU3l5CmTf8=
X-Gm-Gg: AfdE7cmi9RUF6e0OockkVLP0f3k1//mB7pAS+mGPacs9o41FT1Ik20zZj66HVNoRkkU
	Pfdh8RjBlZ6d9TYXsWhdLGPXaSXU8UV/9kQLWE1gm8kRJIaGrSk4VnmKy1WUua+I0hzlUEE1CPO
	ReLTTC2T5rohxq7iz370csQI/+l9Cd4c5Dy7IOMjPcBTtPQnKR0gzfyHGiSdUbttSL5BNoS1Jfu
	Uy4Rxi5R2izsULh7y6oCtG53M148UOnxL3+oT3v19CqFGk6IBKrRV5gIJNRpid06tN3t9woaJDy
	ca4X06BIQynkdFseI7lbNoNpAQyNikGDDsUzuMjUa/QRZuSRBl5SaWAjddXB4EKEnGeYVCYaztB
	u5OQfGiVmWd+SdwE9gvqYZNraKoB805LacCOjdJGsN4JQZYoLKRiZKG7H+eRXjIXDqBpxdqzbnR
	tOwzsfa8pFLp7m2/tKGX3MAL8J6e2jITIdJoeeyWRueLaBbNBP/JlhVKg4/6vznNjjL6Fv
X-Received: by 2002:a05:622a:1b17:b0:51c:2101:ef with SMTP id d75a77b69052e-51cbf156814mr1787851cf.19.1783709961653;
        Fri, 10 Jul 2026 11:59:21 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51cb884e0cfsm12321961cf.29.2026.07.10.11.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:59:21 -0700 (PDT)
Date: Fri, 10 Jul 2026 14:59:16 -0400
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
Subject: Re: [PATCH 24/30] mm/vma: update vma_shrink() to not pass
 unnecessary pgoff parameter
Message-ID: <alFBBGN6a30A3bQ9@gourry-fedora-PF4VCD3F>
References: <cover.1782735110.git.ljs@kernel.org>
 <6dd744d57d778f94d2fef8fd623d7c4ed8010d93.1782735110.git.ljs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dd744d57d778f94d2fef8fd623d7c4ed8010d93.1782735110.git.ljs@kernel.org>

On Mon, Jun 29, 2026 at 01:23:35PM +0100, Lorenzo Stoakes wrote:
> vma_shrink() does not need to adjust vma->vm_pgoff, we were passing this
> parameter solely to satisfy vma_set_range()'s requirement for pgoff being
> specified.
> 
> Since vma_set_range() is now isolated to vma.c, we can simply introduce
> __vma_set_range() which sets only vma->vm_[start, end], and invoke this
> instead, removing pgoff from vma_shrink() altogether.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>

Reviewed-by: Gregory Price <gourry@gourry.net>

