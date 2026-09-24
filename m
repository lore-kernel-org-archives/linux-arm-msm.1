Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9B4A3F1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263450; cv=pass; b=VUCFyIkeAkLc9kWtEqqCiYkKDaw4YDKCUYmvxbakOBKblV/aIGNepeu9sneDQPmAVhQtpG9qtMNWebT9yAefVFSO6053xcKEc7u3k4+cwhBKvOxPb0yJJ3pjr1nhPnkaIYe7Tj6r2V5eq5koOz7Uh6nPiVlmOkk9W6NlK80GyKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263450; c=relaxed/simple;
	bh=1m8e2wOsqMrgDPaj/O0eKa9TALGEmusZLoP/vnx03i8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao2ejVHkh+qBN7vn70BzLEAjofYWAZABZ3BqLmlKADlDNgSbXbzR20zjeHueSMyQcOBtcdqFsa40kYDUBtPEduM+NSpJvYEGHPpC/82V7nc6mbMBy6aUz67rYq/CiXoddTtDNHxGHKqA6FxwgTI1kUXjBlojXfWzuBbnD86+PUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKFiGTAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WF+dx1bq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKFiGTAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WF+dx1bq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OF8tGi2032881
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=; b=BK
	FiGTAaK7AiaGU4i0w/nY558Yucoas9ghxuei1filSjCk6bNgn7VSxk2s8K2gH58H
	Fezr0EOweVAJviAX0+Oo6RBjjBi6R/0jnght5FEMDJRgS9jappmj4c1ienF9LAHg
	ofSOb2yngGblENDPZ9o7j9yEaxR7MloOVi5BbEZ+Lw7Xvaf++2RL4coYqyHhqL4L
	KOMcjg5UGz893ArL05LZcEQB+UxlDd6PbnWDcxAXjF9vyxTiyutrIbQc8sAcBASe
	4Jhr40/h/G8dCvkTw8sUe9vOjzMkT9X7I3KZxGiXooob8zZO8cFfXO63QwL9hc5G
	bafdE1KzaSgKLiBOyEzA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e03gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:24:07 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso2940809a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790263447; cv=none;
        d=google.com; s=arc-20260327;
        b=NWuZoCOgqn+9Out1UBH36sXm5lqNoYD1oi5mDCFNVSJeeTWj1VU/KQO2z4QVTPTdeo
         E3/xM5fCWyb2f7G0FH5Z7H6e+0dhqcp14ekKbmUttBHzLOK6SqeF5Apbv25I4Mk7UlSy
         n220pCuxOtp9TYFJ3/BSmaplRJJic1T54SAvp0yBbx5Mp7oi152DaRugPlIQ0ozzk2Us
         xx67nWJT2mnZUmtOYW8jp9mJ3zOARKcf65gY+CJ5b65SdgRGf6jJNIHyis3zLyxfYAza
         xK4UW325t0hKP5AWjpV2R/xhks8xInTaoJsBQEd7g5VJuFbvulSddTd8qxRbt1PhiVrp
         m8IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        fh=kLtMudnq3+4fHDM5r8aTY80PiDCIgQZ/8TVr4ocbdq4=;
        b=Jzq/F9AQHNxpCmdeWSHQWooUVSplgs+/VJ4M+pm95T+Tf5VHTV9G4YiBrOpHUR3iZ+
         33IrhIaARItU38HH5xNEoB2PSJVFHW9kYBlp4XuZV3DInu1M6s8VGwU0pQMcaxsDys/i
         btSQbhiEBcAvzQz+IegBMiQ0TWszYoWTsmWl3Yjm34wUlcZl9kMCNujvKaQdbfm7FGhp
         kMNvDiF+5mwcogJZ6Ni3rgtM3/1FrGVTB27yKfpMyozJrVBFgy/6tyf5aoXfYjMH1SP/
         69pqo1DlpSTd+uvZs0pCVXwu/vi1B1Hf6J4I2Ria9jbO2TyyXIrw0u+nTPFmEa0kjXYg
         IlrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790263447; x=1790868247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=WF+dx1bqnN9ArGrO/OHg9+/NsTkV35+aRnnoORvRCK6B+UEaqOT61E4rqDIlLtXfKu
         YAAoJH4gQ/YEooxe17S2D2Ou4zMmOIg+qbb5YeoEWgJ9lk7c6+1NUq7wJ+YUlCA7yLLY
         TvLFDTfj5kU3fGgz2VP49xOkZBbZzuauyQzEB7FgU+dVO7IrxsDl8QoHdPA84ZXze7t8
         5TDHnRpABlngowmsthTWW6kK87iH7WzW9rjfNw5Zg5cJZ5lLe36XrAgnjq/ugXSV7A19
         ll2FMkRYlJNV+pstNY8tyve1d2YW6BxazRDwN6BAqlexpim2GJO+SpWRHiACgDRG0fq6
         5MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263447; x=1790868247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSJGEOaWnOQsAtOO7cFRQJIYsioL8PCNRmlmGKoYK+c=;
        b=hNrt7vdenhAFJw+KRlorGzYgqr5KHDsUK7Mtvdi6wACGgD9q6mxIzALyfg3AOA9v2t
         WUpueaVwf415oNkSkWXs8x9/afOuM5s0K+M/9zRJIIVPYRUyQ948NnJDSJc6z3zWNBE0
         z+yyh8rVldY/0M5H64k7QAqZtLFD3524eckVpEYxZcqr9dqXzmb/S6UFFV6xvldAWYsA
         qF6+vknRARwuZuQ6X2oMPlM1LskSGSYOmar+K3dX/hrFZDoftsQoBThnci2SXXgDSWFX
         xzqyuNq1nktNyyyy8TPmsUVvTuYKm96RoQ9mYtUXFHGnE+EH8bxnN1rFjxJpIMt9FD+m
         6/WA==
X-Forwarded-Encrypted: i=1; AKwUvBx1pxfDUnT95kVQf30HTZxlcXw9VSSRm90sQ5Y2ejlohORl5QCEggrUlBhMAfOaQsWMt6YxeK5c+ATJwSPt@vger.kernel.org
X-Gm-Message-State: AFuF++mOvZ8YRw9Ipg96HNlwEabqecKC0EarSK1572cxCBQ0ww9+ChuU
	friCQOh8ww3LTJBKQD+a8Wusut4GILC/ygfiOSYM3RVY0BusXLn+/ziLNYnA3a+W1FsqFphcdnW
	kiOONIPOwUM3+WmuaWV5nZQf210aAl4yD3sJJ2JAiyWp9vd19ML3vZBJoBNqLSYkrS3BTwcXJXd
	4S7CpnGu2j/elUgxV8l5FBXUZwRnGHeUSNzk0BDduej8E=
X-Gm-Gg: AYBFou2qlPLyhn5ZbuNkZmOv2fX1I1+D9AOYko3QwWrV8lzVFn2I7xie+oDanEpG95V
	r6PuzsDuDALas/46Occ95WGV810qXU49dtZAHLYwE3zSS3sbfz/r9o0v/m+8Xx0CBimhSwxdgOB
	kq6QgvRIx2gdajweYf8/Bsjn4BsUoomidYq3vN5oJMR/a34ugJqDZ1fb5G
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id 586e51a60fabf-491e6ded9a1mr2702863fac.29.1790263446485;
        Thu, 24 Sep 2026 08:24:06 -0700 (PDT)
X-Received: by 2002:a05:6871:7c04:b0:475:e235:8ff with SMTP id
 586e51a60fabf-491e6ded9a1mr2702840fac.29.1790263445947; Thu, 24 Sep 2026
 08:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com>
In-Reply-To: <20260924145419.47354-1-liujianfeng1994@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 08:23:53 -0700
X-Gm-Features: AclHuK_WRAYAvS2UWB0hTgewsu2euKPCpECh3qJVYbGPrKE7NCVbxLwrzOLrmGk
Message-ID: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX1DuaAjR3W664
 bWsRsafjogKzRZ4jtVh7vp1JmtkFVoDgEvehuIJDmNty6vSl7JSqc+SaTJueZeEAbmsZwkpHsy/
 QOuZqO1DlnO944/bMV2jIQFDDQs0uLXWk6QkDyiOcdW8csT1MZUMBa2eKmZWY7dp59EPazlQZcc
 /EeEmjg0jq6KnrRMHOVWRjsu8cb7XTMrkllrLPgKVWgTp929XX/Gf3thGq7vHYXHGQdpFlnUa6A
 qbWJccAI4G6eIseUiBl+cN2JOHH0xJ7jf46W8Y3LS+0tV7dB18naRER34jCBcVXdIppmRVDRPWS
 wqvpgRbVbZgg4vkqvHZJ2hgDmeA105UogEQPdAAiXjWChTnHnEYWE+N9xDWXcCcj0JXMODMgpeN
 JZnTSorJiWuROfHIFfI7dwIbACV2153mzvBxFx5XyGiWLLLIcWV1Sak6xOQWvXIwh+LMXMdot6t
 0RS3WSrkAn/hmgTlZrw==
X-Proofpoint-GUID: xT4M4-bZZKcgF_qnNXqNquZWl04CWn52
X-Proofpoint-ORIG-GUID: xT4M4-bZZKcgF_qnNXqNquZWl04CWn52
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab54097 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=ntJSuBRzbTKlmYc5m18A:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX3YOwaJll7XaG
 SchA/W+/bJQT6bSGnn6MKuBhcdCH06bT1pRS8QSh75rif8hkK9d2PCBhPnM9l5d6ENAyQvBIk+t
 AqZmQuk+V/O8G0vTOeYdCLh0bux51jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240063

On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gmail=
.com> wrote:
>
> Hi Rob,
>
> On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > So the assessment of what is going wrong looks pretty wrong..  VM_BIND
> > should never lead to iommu_map_sgtable() (which is never used for gpu
> > per-process pgtables), for example.. but is used for mapping for
> > scanout.  And pages are never used for mapping in either path.
> >
> > However there are a few places where sg->length is used (in iommu code
> > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > what the actual problem here is, rather than any use of struct page.
>
> Thanks for the correction - you're right, I mis-traced the GPU path.
> The per-process pgtable mapping goes through
> msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> and sg_phys(). With the wrapper zeroing sg->length it iterates the
> entries, maps nothing at all and still returns 0 - which explains
> the UCHE translation faults without any error anywhere, and is a
> nastier failure mode than the async-bind-failure story I wrote in
> the commit log.
>
> With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> paths themselves: msm_iommu_pagetable_map() for the GPU and
> iommu_map_sg() for scanout both consume sg->length, and
> dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> page-stripped sg_table silently maps nothing. On top of that msm
> also uses sg_phys() in those paths and
> drm_prime_sg_to_page_array() for the page array, so even with
> sg->length preserved, page-less entries would map garbage
> physical addresses instead of failing loudly.

oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
I think using sg_dma_len()/sg_dma_address() instead should be fine in
msm.

Otherwise, (other than the fault path) obj->pages is mostly a proxy
for "is backing storage allocated".. we could just use obj->sgt for
that instead.

> So it looks like this needs work on both sides:
>
>  - dma-buf: preserve sg->length in the debug wrapper, so
>    sg->length consumers at least fail loudly instead of silently
>    mapping nothing. I think that is what both Christian's "we
>    should probably change that" and your "zeroing out sg->length
>    is what the actual problem is" are pointing at.
>
>  - msm: stop consuming struct page and sg->length of imported
>    sg_tables, i.e. build the GPU and scanout mappings from the DMA
>    addresses, plus the drm_prime_sg_to_page_array() cleanup.
>
> Is that the right split, and is there a preferred direction for
> the msm side?

On the msm side, I think we should be using
sg_dma_len()/sg_dma_address() for the immediate issue.

Maybe we can just do the same on the iommu side, but not sure what
various sharp edges might exist with other iommu users.  We could also
just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
 It looks like there are a few other drm drivers that use
iommu_map_sgtable() so it might be worth at least trying to fix this
in iommu.  Presumably if there are issues with that approach an iommu
maintainer would speak up.

For the longer term cleanup, I think we should use msm_obj->sgt
instead of msm_obj->pages for "is there backing storage", and allow
msm_obj->pages to be NULL for imported dma_buf's

Given the late stage for v7.3, the immediate thing we should do is
revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
sorted out what to do about the iommu_map_sgtable() path.

BR,
-R

> > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > but that cleanup that I haven't found time for shouldn't be the
> > problem here.)
>
> Agreed on it not being what produced the faults - but it is part
> of the same contract problem, see below.
>
> Also answering Bryan's review of patch 2, which is in a different
> branch of this thread:
>
> On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > Why is the fix Adreno specific ?
> >
> > Shouldn't this function be ammended with
> >
> >  > +    if (filled !=3D npages)
> >
> > instead ?
>
> It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> import path. And putting the fill-count check into
> drm_prime_sg_to_page_array() itself would indeed be the better
> generic version of that guard; I checked the other callers
> (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> partial fill either. But with the corrected analysis above, the
> page array isn't what produced the GPU faults, so neither variant
> is a real fix. I'm not asking for either patch to be merged - the
> series is a bug report with code attached, sent to get exactly
> this discussion going, which is also why it carries the RFC
> prefix.
>
> > This very much looks like an LLM generated patch - the commit log, the
> > large comment in the code and TBH the solution too.
>
> Sorry about that - the patches were drafted with LLM assistance
> and I should have declared that up front. Any later version will
> carry a proper declaration.
>
> Thanks all!
> Jianfeng
