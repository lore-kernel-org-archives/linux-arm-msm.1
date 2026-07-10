Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825E1C3BF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717805; cv=none; b=eGgb86IQhx9bjhxCEAz2quNWkSjn3B+1gaUzhFH8UPrLZpDmwVStHdrQ36eHrnpZEZNuNA9vIlnaMwi8VCQ3ZpJOSnLtyPgCpJoiL1Vd+ETq7avdTkuJDKt++nfSpIAFCpj61bnVH/k8InxMGXHWrnwR39TgA/SsFvBxEK8KZm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717805; c=relaxed/simple;
	bh=dNW60Nn0Pk4RAFrYvjK4f4wy+wh7S7nAq4Uli4yrIhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX9zYNYTce/PSyz478ATLA9YtJAo7P0s2J+n1smCBv+Z2MUSR3OI3fXTe7CYAj2L22rEScoGaucCTcb5DFbljzEbBuJCztxx5c0U50mX3xe7eQJx0O4uVIntyYgiLzlI39Cg944d0x9ggYrAmSUt4J/EjelGzktU1CsuIeQ24Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IeOfG/44; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IeOfG/44"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8efec2c28f8so10841236d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783717801; x=1784322601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FM5wmgcpnXqQ2LPOtHbLfNIfX5IHSF2YMfcySjsQd8k=;
        b=IeOfG/44lUDhZNIy2n53/oJ2urnUwg/8zqSNAqnWhDDzsuc2hRT/2MJ44iW3PIUUdY
         0cKCLWB1ldejcRPaxLKKE2HNwwb5n6ERzHg4JGWFDufdCh56F770PixKeR5QwDzQznz1
         Jmx/9iGCwJs5BmrWXg5kE7KtFI3LPyXEmWOGL3lAh64raZt3/H3BRH4jM+3Ckk1pq0gS
         AVdCqYlgpu3IdxLLPaWkz2qyyo3FTRx6zjiABH8qF1KwW2Jm/HULxy3PrZTkOXDKa4ZT
         b0yZMAD13765/Yo1FNsj9VMVnFaBJKi3QlTJITHTFpoqoSFecjMGs9mDCknxy9BlA7ql
         oyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717801; x=1784322601;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FM5wmgcpnXqQ2LPOtHbLfNIfX5IHSF2YMfcySjsQd8k=;
        b=lHMzUpxQme1ruJIKpG/pwmj3kbrT2eyyU7VYrCLa7d9/Rm1yZ3n+iAcHR5AzR+Egrx
         vb6Ba5XLBGy4lN1PTkvNNM1sOcrq48KEzFiyxC0MJjpBclz9SPtg9o7SDMAWCEVcS9nT
         ebYsRuvM0RXUQu+6YgEWLBuuUt25fufmX4V9opEtJy1yOrJXuJlWT+vzSw7nErEp4ZVy
         LOfepMZK2+urmsWHfjtRZqUPqGssoQbcLrPe3s6KezNXXzO+mOKUi21OO6e5Imun22hw
         3QQArMDzlq1Ttjwq+V/ZWjhKNMcEv+wcsJTehrXJIn8L3rjvZDgex/BZKccAQm0oa72J
         xSLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr68zIQoCJTzjISdYJyUbGnARIY9FdmPe1YOQ8LQtLgeEovYFzaNN2Nlmj3o74W5MOehaAf2XFBgPzFiKie@vger.kernel.org
X-Gm-Message-State: AOJu0YzOeb53Ot29x0gP6E3SzNI1c1pqgtxzETmgEA47ti4N11EZskee
	ZlrM/CA+CperQKN9Q5za/z5CJiG5gnp/tXqCXqO4RcnNSQSjP/r8AaHNU9r852maeY8=
X-Gm-Gg: AfdE7cmIEW6JAtFs+xnJDNw4TX9ehdfe0j7zBXlW4BD1cWU4OsAMgzizKTVxzjDGiVm
	7hHz4rAkzOuL/S+iRm4cM/9GioFhviWbUxMucdFcrGKjgRdWElRCnp8uinEB89+4ABtAJB+E3k6
	4Jme2tCZPSOJzlxU4T8DwK6DHoIhKDXw/0brYSqyx4yBnZD1QRK+HPFw5k2Ec+Hm2SYXu98IGOA
	f3EiGlU/aqDvrRBRFVLHD59azyLAuCEcPkr3S8VgF8y09knHcPRky88FCziLGv9Sdbtmb6ITirh
	ML6McmqaHnS+6uqYBZONUBbjTilDTTTrvIiPQUFvJiT27wLpdEAhKCjLCGLfS0WT06OoN+cZgkg
	UEwf+Bm7zG4xi35BX+Ac6NkYNck+PZb2zSzfO88Pr4uE3pPLf7Z5OZ0FPJM7sSKmCzgnxFGJXVO
	U2Z6i5sVih59c5dpxnTCn50Kxh/6F3FEc3IufQPJk+gpY26gYjfZ0GCkBTSLyYaGjacMjN
X-Received: by 2002:a05:6214:31a1:b0:8d1:d1e1:8360 with SMTP id 6a1803df08f44-90400b7f3e1mr9010646d6.39.1783717800595;
        Fri, 10 Jul 2026 14:10:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c8d4csm52955776d6.44.2026.07.10.14.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:59 -0700 (PDT)
Date: Fri, 10 Jul 2026 17:09:54 -0400
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
	Huang Rui <ray.huang@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-sgx@vger.kernel.org,
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, kvm@vger.kernel.org,
	Russell King <linux+etnaviv@armlinux.org.uk>
Subject: Re: [PATCH v2 33/33] tools/testing/vma: output compared expression
 on ASSERT_[EQ, NE]()
Message-ID: <alFfopehgN0dkMzM@gourry-fedora-PF4VCD3F>
References: <20260710-b4-pre-scalable-cow-v2-0-2a5aa403d977@kernel.org>
 <20260710-b4-pre-scalable-cow-v2-33-2a5aa403d977@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-b4-pre-scalable-cow-v2-33-2a5aa403d977@kernel.org>

On Fri, Jul 10, 2026 at 09:17:14PM +0100, Lorenzo Stoakes wrote:
> Update the macros to output the compared values at hex for easier debugging
> when test asserts fail.
> 
> We have to be careful not to re-evaluate expressions as they may have
> side-effects. So update the code to take local copies and use these for
> both the test and the debug output.

Aw you found it before i reported it :]

> 
> Also remove unused IS_SET() macro.
> 
> Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>


Reviewed-by: Gregory Price <gourry@gourry.net>

