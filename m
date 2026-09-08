Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064D458B6A8
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886073; cv=none; b=YQ236tFOFmtGRuT7oHFModdOqdWywyB80ZpwKSZLAAJe93Ojc8jmVDMqEqTqP1F0MSnD18TpLd8w8jFGd/mXNJP0bkbjNJLwB0O8qyhddTmlpT8129Ag5O2loq28n+XeBZIJGQduOke9BSoHJXCplmzmXX7CbvVvtwmdqRTuePg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886073; c=relaxed/simple;
	bh=LWKICpFS9xFvsp69obCht2UQnb78KG0Es2im+ByJTVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHbb6JHkCF6oJDJy1oaS+ZPEb8yVrlFJwo0ZpDjCuw/VccbuJcm4Lo0L52iHbeYD6DscubgH9TKIcS4zp/fAgaGsdv79xqlq7VOWqo3XQcAziGYlmGNdJRB5+zEOSaXh8zabCzMYwzsX+AFuOTPIUF9oy6E2jBquNVJXFYDlwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DW7IfjVh; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DW7IfjVh"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52ff0b7c98aso45751231cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788886070; x=1789490870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=DW7IfjVhTQ51PgWrBUWPGF61LQIrGaA2ldRaIn/x1iBlSc9P72hMYLV3KmSqd6heL9
         Qs/nwRt/L2yPl3zcmPvNdgOpFhB1YXOmC0FdXzSTIQZxOYBMQzedF7ia/mIWS5eSOdPf
         LWNYx7ooVS2bMQKRxEfg0IEEAuD9QpWRopSN9EI0FOC/6+IH3PFQE5rXNb73OHOK6uMh
         O/XmWr4UocGZWhkhFLSWuNySW25vhQfmXw3xWrZ9AVwtvcWXyc+KNfCo4lIMQ2QgeC9r
         qhgTNY7wsngaAMlY/VbnSFi3MRA5uAyXGwUyOHVetub4WcsrhPyMbe5k+p8bWRbK++yk
         kEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886070; x=1789490870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg7dqcSt6yfLp94UU5Cr+hhthqJWmJ7c1cnnv4D4Hxg=;
        b=FYFI3rC+Hp6cRevC1GEbW4AtQ/042dvBu6ASULXIGMf03VZ8u+H+HVL5G9jEo81WKI
         5eQB/+oT9+dIM6jlFjV0r1qWKfijz2KGGYN8GfVwPzmzdS+rSZTU/E3msZjJciaEVygI
         GRu9sGYHNYzKB36ZnY11yOB5JwpOVqXGa5BQdiY3ebSHgB3z/gUbkVZY4RuddMbYqFYO
         kbxYh3tqUBss6Xbqq2URT4aCpZoLjpdccMyEJSHVhkXHZQj04RK7sDaD4LdQm73i2BMk
         j+CMbwCkSQwROglkLa7IY/sWCmc/pibiS+VwdfaoQIKHs8WneViPzisyt2SvrFXFra/Y
         1Gow==
X-Forwarded-Encrypted: i=1; AKwUvByY1sEPqNn6K0mWGLdoDFZEMa2Bk6HF+Iq22yVQE65rMfDnufOhy14pJrAEaGV7nEWSROaQDM4+yw8HKYSh@vger.kernel.org
X-Gm-Message-State: AFuF++kfTbObv5lGHdPfyYie9t29Ck192umncshx2ojmvocfnsvddY4S
	OTfPzv57Woe+bleFE6xaAzIR+d1YZVsxWriUl21ciIyRMtXCHlAlUQZmgBm2ldATWw0=
X-Gm-Gg: AYBFou1PgueLFsQht5QtCYb9MUcL3YK1iD42sp12jZPeWoEqL9AesJPv3gIukLe8U2O
	VW3QVS0JoI9CmiOJkYsUl9aOHTeWXyHt3s+qCW9QMiMCEqDOR7wbmnhQhuA9Yan7KbI3AO2Y32j
	Eg2PQo0nryqq/I2pxm/sm0ss/LB19wT4PzFDobsucrdsEPLTpYf353CQZ4IczR8/20WnpUsgxnI
	3NBfrHTFrd1lZ9MHzGtymz8KtQ47O6Jzifr70h/pFAWgR6E2bwoK5Uf3TmiaMNEyNG2tQD1AR1j
	KKoHDdTKY141P2h8bVOzxhQkKEIQtca+1Qz5m4SVHseS8ScK+DjAfiS2K4YjwJtV8rY4hUjcmtE
	YTs1u0I7kyZYi429NNRQ1ubnvXMhwN8lD3AQmr2BP0K77EOt37VndueSNjZ2hzQt1nCgrikCcAr
	EaMlPiCxifAs30T8Tpw7sOShe5xMJzw9U8jKUVMliBQnbJG2ObnfJKfP270Wh/FsNf/OQx55OxJ
	BjzF1uj8QVn1KKw2u8Lw02I9YCT8eWi5cuZ0aWrSSTDAA==
X-Received: by 2002:a05:622a:258a:b0:530:430f:630a with SMTP id d75a77b69052e-53054a1f457mr350385211cf.48.1788886069109;
        Tue, 08 Sep 2026 09:47:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a908sm117296241cf.4.2026.09.08.09.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:47:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3yz5-0000000ECD9-00Dk;
	Tue, 08 Sep 2026 13:47:47 -0300
Date: Tue, 8 Sep 2026 13:47:46 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Mentz <danielmentz@google.com>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
Message-ID: <20260908164746.GC2543240@ziepe.ca>
References: <20260804-iommu_contig_hint-v4-1-d7a47ed5db98@oss.qualcomm.com>
 <CAE2F3rBQQEHsksOyE2ojQPbMd_vvFqaFMC2RzT0B6KkxMB5YgQ@mail.gmail.com>
 <c84e61b1-785e-4a47-9082-c5111bf35fd4@oss.qualcomm.com>
 <CAE2F3rC80=ZpiHVtmRDU6f8g4AwV_RrJ-Zqr0Xi7zbUc0fsQog@mail.gmail.com>
 <9c28300b-a17f-4324-b9d5-8fc800e4d794@oss.qualcomm.com>
 <CAE2F3rDdogf1jGsD2ekGqT7X692fFyqv=H-8iM5OTu8AdHHoJg@mail.gmail.com>
 <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE2F3rAeq_CPeaDxuh40v41v2f=68oD2TqK9DYSPKz9F74kqeg@mail.gmail.com>

On Tue, Sep 08, 2026 at 09:36:35AM -0700, Daniel Mentz wrote:
> > > That said, install_leaf() is shared by other callers that reach it through
> > > ops->map_pages() directly, without going through iommu_pgsize(). panthor_vm_map_pages()
> > > (drivers/gpu/drm/panthor/panthor_mmu.c) is one -- it allocates its io_pgtable_ops via
> > > alloc_io_pgtable_ops(ARM_64_LPAE_S1, ...), same as any other LPAE consumer, but does its
> > > own chunking with a local get_pgsize() that only ever returns SZ_4K or SZ_2M, with no
> > > notion of the 64K/32M CONT boundaries. That can hand install_leaf() exactly the mixed
> > > iova=paddr=0x1000, pgcount=34 shape in a single call (panfrost's map loop uses the same
> > > get_pgsize() and hits the same case). So the prefix/aligned-group/suffix handling in
> > > install_leaf() is still needed for that path.
> >
> > Maybe other people can chime in here, but I feel, from an API
> > perspective, we should have only one way to make of use iopgtable. I
> > think we should just mandate that users honor the updated value for
> > pgtbl_cfg.pgsize_bitmap (and pgtbl_cfg.ias) after the
> > alloc_io_pgtable_ops() call and then choose page sizes appropriately.
> > Otherwise, we end up with two pieces of code in the kernel solving the
> > same problem. panthor_mmu won't be able to take advantage of the
> > contiguous bit until it gets updated accordingly, and that's ok.
> 
> On this note, I want to point out that I tried something similar in
> 2025 (see https://lore.kernel.org/linux-iommu/20250430231924.1481493-1-danielmentz@google.com/).
> The feedback I received from Jason at the time was:
> 
> "Wouldn't it be better to use the pgsize_bitmap and rely on the core
> code to indicate that a contiguous page size is being used, so it can
> trivially set the PTE bit without doing all this extra work?"

Still think this is right, Panthor is not using it well if it doesn't
jump through all the hoops. Probably there should be an general entry
point for map/unmap that does the right stuff for the DRM drivers to
call.

Jason
