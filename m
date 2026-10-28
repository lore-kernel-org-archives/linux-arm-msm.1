Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176201;
	b=dLQYK78SEbMa7N0dIY51OKBSC51tBSyxTkCh4p0kVngx49w7VrI5q81v2uyR548JhwkA
	 yZsTigJtrBnTW8ANeiWbbcBu18SPregtvTwtg4uUZpczYzwkwJ4n32arCh4ndWigPQO67
	 ZUDG272q6jmKFbslVWVw0rNYIuBe2Ntf4tA9sgXLFp6hNo66tlBNm/+5D++Cr6mwGyRh9
	 Fb3XWg3+nE0N+SjN1XrdYVPpYy1pIeElsFqh30/teMaku0lYe67+FKHQfuf2zXQN9d5Dk
	 SpW64o1QLUhuAWQfkoOw9hjuE8GzR46nQsGxnk1GyG3MG2L+JLkCGj+EFQI8jBv3wPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176201;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
	b=HhPmSR+K3TqwcRMYZapOy8CHFzzRLCbab2pFg1rb5igYyPbWKe6L1TzVaHfQj7jdClMw
	 yWr0usxT6LvVLuueXcM4r0CEZNc4N2EOJBbGNvkj1m7J5Ut/pJPyYyodkKHGSX38LG85K
	 GpqH/4JqzTI+rb4V2Oq9pqT6QnZEA5VPBdU/NLErSqY511nJ4dQKfAudD0gV9tRe1U9S6
	 rdZylHivRe6WZRUk0fLWjsUOHwA06r20S5WQH2YTgXeOx2A2MazVBBX0chBXd2gMRUhnP
	 NGrdRYRCapr5dybgdBJYnDc8YMuwSEIWD479ycmDEa2WM8dzFTFf9vvN3jutt3vfcNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOlg6NP7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZvAc9nHM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20C606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B20C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gOlg6NP7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZvAc9nHM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793176199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
	b=gOlg6NP7DwR3ogxwAxc39U1cQ7v1BF1elZyyNfz2Ie3nlrTc3OiNTSy0a0fUD95DNOLAcV
	js3ISucfhERU7CZ7e/QgeEcP/QAQu4iwSrOfK8UmdHOUohPmjoaIvCAnSpttrpAJwDiXI8
	iwKsQK7PtOaWkHuX5sRFw4sCGTOgEvQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-ftfnAcidOpGsQzWSZCTmGA-1; Wed, 28 Oct 2026 04:29:52 -0400
X-MC-Unique: ftfnAcidOpGsQzWSZCTmGA-1
X-Mimecast-MFC-AGG-ID: ftfnAcidOpGsQzWSZCTmGA_1793176191
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48af5a07314so427216f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793176191; x=1793780991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
        b=ZvAc9nHMlHp4WGyWUmvgA7gFATCXQ1Xlf4bFz+FTyQ1j460Qq/d+jJ4B3uTHhvFP/m
         +xS0qx+z3CNVN1WvPSi4KVf/MznA7zMvPEkaEDtxOHIXqyIp0K1zev8JXD5sgfysCQ98
         NweuZ5gd2FYHn6XH8GR+OzeM0J2CQ8vAeu78ze0sMFkrS/O4lfNB3O5n5raWq5wfuVlZ
         4X97+GNd6U8KeYd8lsS+DgxkT1a70enF6qEGTsjcfnCp/dTpuq/2cOstBpd8I28qltAV
         j9sgaRbFeCdfLpcJWu/zydgzVGsZLoUVcMs2bbJJWMk/4Mixrvz8e6X6bnUCl1Adafj2
         zaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176191; x=1793780991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phov0yx4/iWFGJSHvqREaKJOsHR3bBycQ5pnM0JKxhE=;
        b=hcuAqm5FR91iAy2narIXZ4Dobaf8aXi4IYhypR9O/jlnQcvqLEsnlbBOb6wJrZf8Os
         bbLCykIcxMMClv/XknIql9peekwM2j/kB2KAtXEFe6fgI3SWhx1wI02p+HEtRnyPWLFV
         Cjkjoua2XM1vb5QktW+dKGLi9LRYNzfTA2JQ8wfg6n3UtxZE3L6xng+skb48kFQQMVTA
         gyIy2OKFo/2FEh9JjBq00IQrC591cBVS1pUnAf+lLREuSR11AKxFB9w1gFbSK7jC1wIl
         e5B3UTWl1vB7XV6o0hNrbQ+lupmrd1RqYju8y4avY6xm+V3fjipNXO17rE5LufLJjzaQ
         gV+A==
X-Forwarded-Encrypted: i=1; AKwUvBzWQgOIt+I7IvQYMA3Fq/mKpGJl3lsCd+3+mt6cIj6wZ9THMQ8w4aEiDNslvYw90dBlBp8RejlPCkVMIKwO@vger.kernel.org
X-Gm-Message-State: AFq9FYIGKn2NmLgpmHEJYcXWZHV5ND7M0ZDUMhPyhRjJMZ25mqWYQGRO
	gG4YSNek1wQW8cDyk8kldQayDcw3CJu79xBNfIIa5/2+j15BREK/Jgv8ibbQAhFVDMtD1ABY9dn
	8ltJKUHZvjAf81K0GXAkih3dylhxBv28IdY2yjq7u8GedLSKbrewauFopyHxYFFSlncE=
X-Gm-Gg: AYBFou1zyF9e5C1p9GBNG4O+EgguminYbfZ/Lpt5Yf+qO+DANQn4lQZcRq3ux5Ji4eT
	5Cpi43QnytfEaJvAJr7MZhnxzGnGxSx2u8Fx5RymBTejWhEiVMcJSRYMRYKqDGYF4j8QD79Rh/X
	Z96n0R8POGXjJdiidq0B2ngJ1NnuJnJLmkTOoNfzJEPsBK43R3jvu4/LJbvKK5okrwCMh0YOL/3
	biJM4J0vBXx77vzQX6Uxwu/hsUxnzHOoMwiN2lLcYoHr4sKuNX9n85MNPUL/AVRPpUcAi9b3kMc
	PpHGSxpDRWKmlJMGRf9jowezKrk8J0MBP/2gtXXe8Ci+d1/AFFUY4MXBRz0uU7kEAK7KYlkbZPc
	4hkpw80zak/QdzZ90nYty38Rf0Yf7FqpuUAL0PMxnCHs=
X-Received: by 2002:a05:6000:25fd:b0:487:342:d141 with SMTP id ffacd0b85a97d-48e5d5986bcmr4042056f8f.23.1793176190928;
        Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
X-Received: by 2002:a05:6000:25fd:b0:487:342:d141 with SMTP id ffacd0b85a97d-48e5d5986bcmr4042016f8f.23.1793176190533;
        Wed, 28 Oct 2026 01:29:50 -0700 (PDT)
Received: from localhost ([139.47.30.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27541537f8f.38.2026.10.28.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:29:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:29:48 +0100
From: Albert Esteve <aesteve@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sarannya S <sarannya.s@oss.qualcomm.com>,
	Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
	Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] soc: qcom: smem: validate private entry list walks
Message-ID: <auGyfKTc9QnREUr3@aesteve-thinkpadp1gen8.rmtes.csb>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
 <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>

On Tue, Oct 27, 2026 at 01:45:26PM +0100, Konrad Dybcio wrote:
> On 10/22/26 11:47 AM, Albert Esteve wrote:
> > From: Sarannya S <sarannya.s@oss.qualcomm.com>
> > 
> > When walking private entries, use the uncached/cached free offsets as
> > the list bounds, require room for a header before dereferencing, and
> > reject a next pointer that does not advance.
> > 
> > Skip the cached list when the cached free offset is at the partition
> > end.
> > 
> > Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> > Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> > Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/soc/qcom/smem.c | 52 ++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 38 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index 36a4a10f3aec..a6732832e2c5 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
> >  				   size_t size)
> >  {
> >  	struct smem_private_entry *hdr, *end;
> > +	struct smem_private_entry *next_hdr;
> >  	struct smem_partition_header *phdr;
> >  	size_t alloc_size;
> >  	void *cached;
> > @@ -434,19 +435,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
> >  	end = phdr_to_last_uncached_entry(phdr);
> >  	cached = phdr_to_last_cached_entry(phdr);
> >  
> > -	if (WARN_ON((void *)end > p_end || cached > p_end))
> > +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> > +			cached > p_end))
> 
> nit: i wouldn't break this line, and otherwise the next line should
> start below where the first condition starts

Right. The statement fits in one line so will do that.

> 
> [...]
> 
> > -	if (WARN_ON((void *)hdr > p_end))
> > +	if (WARN_ON((void *)hdr > (void *)end))
> 
> LLM noticed that before this patch, we risk overrunning end, but with
> this patch, we now risk a corrupted/malicious partition ending before
> 'end'. A valid walk always lands exactly on `end`, so the fix is:
> 
> if (WARN_ON(hdr != end))
>     return -EINVAL;

I see, makes sense. Will do as suggested.

> 
> 
> Otherwise my clanker is reasonably happy and I see nothing wrong
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

> 
> Konrad

