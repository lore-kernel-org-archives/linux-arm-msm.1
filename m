Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD193E4504
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790356723; cv=pass; b=XeAtA3wCLzKkzTnOwd+tyZMNz52bOZdOSbpr0csRWOavXxn1EI7wb/AK7EGok6+dPdNJblnduQFD3rwHZsuh+gWZPAwNW3UdxFP3g/2ux5qtEV2gKoP0ngVSUSOXdpkX59tWtA21z4rsvoELHkbBqg2cSRWLOtOHh9SGWgNILxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790356723; c=relaxed/simple;
	bh=qo0Pvlant2tqAkK0E4yhyM6y0yWPa88IF+SZ5h2MERQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSIQSkb3h1cVIOkC14hyfyIim6tU7ns6qJfgY4geLR6Put25FZ2fJni3dWyZ3IULW/WkZRLgyppMozOIES2eZuD9SUihH9Y7IJbeXXMrjAUdZoVuK0whlC98Ku61RNswDzRFWbbP9PtpFZgyhtymuSL/nrBKWU7hzHpoi+PMxuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCiX7juX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV6c4u8t; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCiX7juX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV6c4u8t"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PGKgNv1711614
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=; b=QC
	iX7juXbh2Qhd4o2YIlA2o1bVApnsTTUkzsnv15kJAoUxv8RNuRFEx44kbww0qe7g
	NULoYGNVCFTJDkbi9DSJrvV/W5g9ebMAeZ8zq1ce02qeiGEaRKDaqPZ1nUC5JS1P
	R/Z8VS3VBCj7QOI38+eIEbJVfIpJ0FzwNnZgB7eu+OEHzp/v25pFfwg6lS4seFHh
	dlHWgFD4l7a0B7WOBkfDZX+y3GcpMMRudxC7bcuzNKiuwAttpAlWHSPpRYMKWCjL
	3VX4zSKjYdu4vvOlKp83ue7WK02cgzakMWkWeZzydIcm+X0XtbXM/GDok2eP0YSx
	jCOdpIfBZrSi5r9XciYQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwvd3r6jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 17:18:33 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46a5954cdfcso1343942fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790356712; cv=none;
        d=google.com; s=arc-20260327;
        b=O2vyEopYCz4wvzf+cOJmsKMqZgXjYYshR15cysLOJEHKop7cLHgcgJZgXjbI3CttKj
         ST9QznMaFSvpHsW29nggD0hJGaZQD3m2eJ2iixi1tpnJb4tIoXcPEmJbUEle5ZmwXUIo
         KDwTNC2ybVrTaETJ03IerJCtcgjdLyXFwSKfetbTmnFyp+0tpPTScAfRoDuaQuVXhgkE
         i2CIZdBCyH7jleBX/eUp7ovmG6HpipmHHptzWs+aNtlOj5q8h4ztXoXK8CGkcND9oHFA
         6nXEAybuzbymuSncQa0sjpSyEDjTaiTcCeLZktsIHfczmA1QIWpywLPMBcqJT/g2urNj
         mkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        fh=zy5en61pjXvH8SBzawotyAWE0sw7g5jj3N9/Fb7sXQE=;
        b=O9D2/fZ+WQ/cben5sdRQWwokffLJDMKJ174vj9OW+lUfno+n1tSFFG1ZfhjlqPT98D
         IsMKbk0pBuz79ZYD2YsUbauky6IdWtyj3SqfpJVCO556IilZGbori1De62AfjNFBfA+z
         7fqjrj0A7ZRDSN42lbRJWHLNMfUt9qjeVX6YLUEymZTMk1emVS6RBim2Y6Wmc7Kls3Z1
         /+OwoqRU9mE9G6t615gyv2G7oL9C+2DpZNP6Xcl4VBkUxYl8TKzQJYkggxmHt4d0AItQ
         /lWmTqTdymM9NaPgApb2KYjZDcvfNT/cLWbS8kdStvyAny5FfQDYoPAbV1e3PBtNFnuV
         kFmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790356712; x=1790961512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=KV6c4u8tQAXxVbwPJMEI9RbxP2iPBqXapHLb+FISGXoM/1zJOPw1VXNZbjQXiLkJvq
         QVej19nnRJVNrv50pGulZcAqVydLEK7mIZZl239Qr6JjYosBtY+vBw/HUvkXncD/upwA
         FEZFfR14WF8rLBpqsDw1QgM9ISqUmBIyC2KG27CHnJfNrHoJZaxtEBHyKsX/rLsZmNlb
         2pDTgwNpq0zE1I2e9B9TvvI7iex51joFkXZJWxQYTvB+R3PeOXD7KbC83Rahf003H0z7
         dypUDIEAzHPHyRKI90MhGNNmg1/A7mDiLT46FyXgYOKpuZ3i+73c7VYc47V1LGtb5i0i
         X57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790356712; x=1790961512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlPheSorNXC3rOtR6BddKKv8TdJJ+ajZdWoaUxUSYcY=;
        b=kF7fwV/yor3UxJLEaI9L13RMlZaICsDGLAEh5iPrU7gX3f9Js71pHrEopO4yJYf2z6
         YDHMi/bSPinfg55n6CQt+jcmadcKTr2MW1OddFcNZUqy9qMKyp8N6sxAzrGb0lE4YP7C
         d1lQjYwtl+E3cAo1SGCuY09s0eHJjh69ISX+1B56sGHOBWgW74s3eYDerzsz8mj9tS/Q
         aNcbDo+uHtfRza5GOScxQjwwFMbLZvZNo0bVRDSccGvMAts8bRL8gFRSipvYvXseHroG
         ItuzcN4FNrEeDVfzbxP/5z032H65Yut/Auj56+AY9p5YRP7IbyNFGoqxxMdIjKa+QPd2
         EsIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4NSh7IKEMoD0lJf912arxH89PlIlopbyrIHMeWxQJTpoQYEUXBc7vacq05KeH2787VHXC3xzu2EZcs/7b@vger.kernel.org
X-Gm-Message-State: AFuF++lHxkzQXTABu2+6HAIAnW8KBjBCwn/RXm4W2U5v5s7vhtIxPC+L
	a4Ay90pFCAM22XobqKdKStQiEyC7OzmOruASlzzt7UrAH0BOr28xqHFbq1PxEUo6ysNX3YSUcjB
	/zLf4bRWV6I9JJLXfRFn3Eg0mS5kKVnHH1cgxOiRBkZ7afKMmWAzZhwVloG7jYjup2xLlIhI/I7
	7Z1ESnFS1KkGfkujB4B/OnDQSiEQxAnDzmYPLB0YPgqno=
X-Gm-Gg: AYBFou1QXSQXUV+Ctr7yEqbSBK2EXRH88bhQEA7hR9mIilrTjXFwBEj6lzwE9PTf9TT
	fWNH5OnsdwhJGwQ/RTueIEbvf3yyuS64c4Wrt4mIbjsVRtJk+tfur/w4eBDosxQq/Tx6u5jm9w3
	pMUOh8a+D267ig/tvQnWXTvHGH1zUfwadqk7fd5rJ/t1wq/8fi6i4wlOru
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id 586e51a60fabf-491e9fcab5bmr6173605fac.25.1790356712394;
        Fri, 25 Sep 2026 10:18:32 -0700 (PDT)
X-Received: by 2002:a05:6870:3453:b0:475:a153:2dc3 with SMTP id
 586e51a60fabf-491e9fcab5bmr6173571fac.25.1790356711799; Fri, 25 Sep 2026
 10:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923074256.9357-1-liujianfeng1994@gmail.com>
 <fe3a4297-f300-451d-9763-0b3016706111@amd.com> <CACSVV01NZROH9U5Qjd1TSDu+BPyyPLC9pFByqSfrxXrPJV+wZQ@mail.gmail.com>
 <20260924145419.47354-1-liujianfeng1994@gmail.com> <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
In-Reply-To: <CACSVV00tYa18fijNfSSwzE8tgYVqHK5yp4zohwdTgvyNK8SREQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 10:18:20 -0700
X-Gm-Features: AclHuK9fSyAIzoBNFWcWUoZ2puEB8-AtVFFp1mUdAjt1DjbWKFPGlOaH2m00xXw
Message-ID: <CACSVV01wPhaVPUtYCwHyQ8M_Egy2O_P6gPhGkoS04S2+FABSrw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/2] dma-buf: keep DMABUF_DEBUG off by default
To: Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: JgxWLojJtjPTFVjwyJ-HPLc7NJ-Kq0ou
X-Proofpoint-ORIG-GUID: JgxWLojJtjPTFVjwyJ-HPLc7NJ-Kq0ou
X-Authority-Analysis: v=2.4 cv=YL4KWhGx c=1 sm=1 tr=0 ts=6ab6ace9 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=qnjczsnmBfoytaMDzuAA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfX+fI/y0uSxODn
 XlUO/N+95XdPNqkZtPk6NPxZSumT+G2k1CiYRnAuMyvukqpIYQxesvGtVz230JtDokzqJ329wdf
 TTt6df/5gGE0ymWfdbm23kxvMEWX/lDppz3JYI7jBLmLRMgfdnQsM0QQYkBwO8DCK6lf2m5AMpZ
 Ugi8etkLbguQs7PqRxpzhET8q0CgLo12a5Sy0AUth4AK1ZMoi2rwORsjRmUX+WXhH5+m7OswSu1
 LrydPgQyORjc48tcqWacjfrmleBY2Y997FmznxHRe1khs1rymhl0UoNbtxtPD1dvF5M/S2MQQDc
 1mRy7v7/Y+Oebu7qyFQXn+/asLqH9O2JG95mMgzpmCGmDfZ7/CTJf6sNKqoC9ZG2B/s09JpoScp
 tkQaaIKhVphENJU6RolVdvt0Ko01g/gxIMiQhDRC119YbmMs93+aGp37F3axjsx6NToiTPBBg0v
 9Fe268rCxX860aYyH9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2OCBTYWx0ZWRfX47bm6euVh5o0
 1g6Z6SqIuRii9RF4rAnS0AQgxyoBcXeekLWGZi/eTy3gAzNnI7959de7LFuxhWY8OIPAN3O8D1f
 RZmo6Yvm9/ZRqPIWG4FmTP29QIZJ620=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250068

On Thu, Sep 24, 2026 at 8:23=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Thu, Sep 24, 2026 at 7:54=E2=80=AFAM Jianfeng Liu <liujianfeng1994@gma=
il.com> wrote:
> >
> > Hi Rob,
> >
> > On Thu, Sep 24, 2026 at 7:01 AM Rob Clark wrote:
> > > So the assessment of what is going wrong looks pretty wrong..  VM_BIN=
D
> > > should never lead to iommu_map_sgtable() (which is never used for gpu
> > > per-process pgtables), for example.. but is used for mapping for
> > > scanout.  And pages are never used for mapping in either path.
> > >
> > > However there are a few places where sg->length is used (in iommu cod=
e
> > > and msm).. AFAICT dma_buf_wrap_sg_table() zeroing out sg->length is
> > > what the actual problem here is, rather than any use of struct page.
> >
> > Thanks for the correction - you're right, I mis-traced the GPU path.
> > The per-process pgtable mapping goes through
> > msm_iommu_pagetable_map(), which walks the sg_table with sg->length
> > and sg_phys(). With the wrapper zeroing sg->length it iterates the
> > entries, maps nothing at all and still returns 0 - which explains
> > the UCHE translation faults without any error anywhere, and is a
> > nastier failure mode than the async-bind-failure story I wrote in
> > the commit log.
> >
> > With that corrected picture, DMABUF_DEBUG=3Dy breaks msm in the map
> > paths themselves: msm_iommu_pagetable_map() for the GPU and
> > iommu_map_sg() for scanout both consume sg->length, and
> > dma_buf_wrap_sg_table() zeroes it, so every mapping of a
> > page-stripped sg_table silently maps nothing. On top of that msm
> > also uses sg_phys() in those paths and
> > drm_prime_sg_to_page_array() for the page array, so even with
> > sg->length preserved, page-less entries would map garbage
> > physical addresses instead of failing loudly.
>
> oh, ugg.. I overlooked that sg_phys() uses the pages under the hood..
> I think using sg_dma_len()/sg_dma_address() instead should be fine in
> msm.
>
> Otherwise, (other than the fault path) obj->pages is mostly a proxy
> for "is backing storage allocated".. we could just use obj->sgt for
> that instead.
>
> > So it looks like this needs work on both sides:
> >
> >  - dma-buf: preserve sg->length in the debug wrapper, so
> >    sg->length consumers at least fail loudly instead of silently
> >    mapping nothing. I think that is what both Christian's "we
> >    should probably change that" and your "zeroing out sg->length
> >    is what the actual problem is" are pointing at.
> >
> >  - msm: stop consuming struct page and sg->length of imported
> >    sg_tables, i.e. build the GPU and scanout mappings from the DMA
> >    addresses, plus the drm_prime_sg_to_page_array() cleanup.
> >
> > Is that the right split, and is there a preferred direction for
> > the msm side?
>
> On the msm side, I think we should be using
> sg_dma_len()/sg_dma_address() for the immediate issue.

Hmm, so sg_dma_len()/sg_dma_address() are zero for page backed sgt, so
it isn't quite so simple as I imagined.  In theory, it needs
dma_map_sgtable() but not really sure that is going to dtrt with the
way iommu is used on our platform.  And I'm probably not going to have
time to dig into this until after next week.

Please send a revert for commit 143755bdabaa9 ("dma-buf: Make
DMABUF_DEBUG default to y on
DEBUG_KERNEL kernels") for v7.3

BR,
-R

> Maybe we can just do the same on the iommu side, but not sure what
> various sharp edges might exist with other iommu users.  We could also
> just stop using iommu_map_sgtable() and inline our own iommu_map_sg()?
>  It looks like there are a few other drm drivers that use
> iommu_map_sgtable() so it might be worth at least trying to fix this
> in iommu.  Presumably if there are issues with that approach an iommu
> maintainer would speak up.
>
> For the longer term cleanup, I think we should use msm_obj->sgt
> instead of msm_obj->pages for "is there backing storage", and allow
> msm_obj->pages to be NULL for imported dma_buf's
>
> Given the late stage for v7.3, the immediate thing we should do is
> revert the CONFIG_DMABUF_DEBUG change IMHO, and try again once we have
> sorted out what to do about the iommu_map_sgtable() path.
>
> BR,
> -R
>
> > > (And yeah, I should get rid of use of drm_prime_sg_to_page_array()..
> > > but that cleanup that I haven't found time for shouldn't be the
> > > problem here.)
> >
> > Agreed on it not being what produced the faults - but it is part
> > of the same contract problem, see below.
> >
> > Also answering Bryan's review of patch 2, which is in a different
> > branch of this thread:
> >
> > On Thu, Sep 24, 2026 at 10:36 AM Bryan O'Donoghue wrote:
> > > Why is the fix Adreno specific ?
> > >
> > > Shouldn't this function be ammended with
> > >
> > >  > +    if (filled !=3D npages)
> > >
> > > instead ?
> >
> > It isn't meant to be - msm_gem_import() is the shared GPU/DPU
> > import path. And putting the fill-count check into
> > drm_prime_sg_to_page_array() itself would indeed be the better
> > generic version of that guard; I checked the other callers
> > (etnaviv, omapdrm, vmwgfx, xen) and none of them expects a
> > partial fill either. But with the corrected analysis above, the
> > page array isn't what produced the GPU faults, so neither variant
> > is a real fix. I'm not asking for either patch to be merged - the
> > series is a bug report with code attached, sent to get exactly
> > this discussion going, which is also why it carries the RFC
> > prefix.
> >
> > > This very much looks like an LLM generated patch - the commit log, th=
e
> > > large comment in the code and TBH the solution too.
> >
> > Sorry about that - the patches were drafted with LLM assistance
> > and I should have declared that up front. Any later version will
> > carry a proper declaration.
> >
> > Thanks all!
> > Jianfeng
