Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0626F3C3F75
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591790; cv=pass; b=fg+3ld8H+C6KpTM9OZFh+ZiT3O8R0eXdLhOS8vmkq9l9mXzGjPCI74xz8Opk3JACEd3X2RoDHYxgHKdxTWGcPXckHimsLM9Oehn+lpBLtk8ql+/OwtQgptzDe/fr8QUcZKI9PXT/Vv8pNLO9V7LLFi8eSUfodGminABDYPCXomo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591790; c=relaxed/simple;
	bh=D/BH9J1ogEsqsPYvMEQyOsTnVDH9r/FOH7C5pHSp/vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iw7mJaGry45zyvo8Zu3C+kzKx2Np1oGoCwwyXsYDHqyve0hm8dhowPnB8mHIqk/v9iWqgJXyjyhDyMmQhw2/skAnHooRQ5V6ttFcEvNC/2Krrjzd+yiFbGVOzEELH5CZ1E9kHXCs/HA4dLzEe7+VYnWuoKi8irbPQm8keAIzhsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UEKMa3ws; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFgBZYmW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UEKMa3ws";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFgBZYmW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MCBk954336
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=; b=UE
	KMa3ws2snyhkw/6ZrN6eFwze15N5bLPP+jLQo2iuE3sWa2PaR9WXWTk/4iWFZ/1T
	t7kxob5iPGt93hQyAEiD3QR37tn/nTs3eEuNESGwev3eEBmdy0I0+kC0baYEPoMn
	sWQi7Y/scF8Eh7bJxV775bljLnWIzXJaJZfK5nVyx3HedurVRSUisYcToZpOvQDj
	/bnToE4XqGDiXuCyyuz8ppoizsytQt+IDuvzpBMvQNDuj76F/Lv5SrB3CZi5t/is
	aXATBeJi8XPsnEAGTOWXxNkuO2l+iucmddi2oD2BHTBTVasfVyxClbv7VW8wojhQ
	R7hlCBi04bPw5lNbB2aw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc0ags-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:36:27 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4574f1cac98so4858867fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790591787; cv=none;
        d=google.com; s=arc-20260327;
        b=Veew8tK8xfKiy6TYXMf5a4samEsYJcK0uAQVFsSKykqTlBb+A9UDFumhEFkPWLsEhz
         lPn+Bry0AzobxYkO2HEdWSxhbGaG4VvnJynClCBJPclBhZxkBO+WStZqG9xQi1QY7v36
         KpEQFS0WLApUFQarXGmrO3aHKb/ibbMeV1/AJBehaQZHfWQxXaux9gfR9Vv8uCoMZOaP
         TXl2Kqlq3Qo6oZpenYIuqCBMOW3VY2mJ9J2aykKGe66C7oXqo+kD1M475vwX0XiMwbIt
         0XxVUKTwZsDacVytFJkM+2z6Z7odisUrXDLY5LnakgIDqnwz4uQddBZ51eLVBmfWAiyY
         XjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        fh=FtAGfrgvXOVfEm9GhN7ygsrS2hYmXmusLE0HyrzBV4c=;
        b=Rs3odXgaiBTz/BDnc0lA9uHawGZ24jLo+EGQu8baoRyKksNFR9mwIDpJz0yYTd8zxe
         CYyt8j3iVUFz1nGKWWGtnckgDLQkct2y0XtgYMfInBjgxiPPqmf0WoCdrcwEfSGHs5eA
         /OsDtWIsXoMxwql3DYrUjBX2FvNuskS4yJgMaa1w75dKP2c5nQFSsWFrVgtVJ7ken2hn
         LcNHGH7b7IiNJ8PJ4wxpvo2LepX8kd8zsbSoAR2Pfl4m1r6iJVCA+1e2bFHX2rYaLipB
         DUfgE9dff3I8qYs36Sq2EheE4u6425Cwh8OyyR5BRETt3GwwzYk53xLouYgqxPzghS6m
         RKlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591787; x=1791196587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        b=WFgBZYmWnkDPb3zfw4Og6qIze+kKh8zx6eTONOLwAe6yrij+xQtSb/tpVXwT9LiVH6
         yd+z7o3pgtaYKWBfdQXqkIWax/mdnbcTO1N2nIrzfmR9gH9AbauMkEopjpYtjfEDGLAG
         BIce0HC2mUIo4+RrXlTTjbZ4/1i9qyP2ItrbWlFMaHTHIi0G/U+Garu6c7cFU9p0jvr+
         TzYf/easKbfkxkbk8rQ2zkePQQzcUBIp42f8RFbDxuiH2Tes4z7bHjYSJe9GRbGLF+9J
         RWQJCVbwh+f4ivvFROnsvXBe0Qj1WJPNzkLvfANTVow0ohBssO1rKob95Lem50vlMQtg
         ieSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591787; x=1791196587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5r3bF3DAcBScXo0yMOsFEJMrNwU9r04sHzpC0amVEsQ=;
        b=imBqRiGnWg+m1wLqfKbQBlYKKsspTEyxU3p8l53eBBOAdCO+Y9JPYao4qf6UnKStU1
         l6N18eh1mMScUDnuym8XpyzAp6CpzDMbc/D5DpIn5XTeNJTnF2as4qKjVaodEpmC4O2g
         Z2iz3v1WWiM3CJXW4HKtJuePD5KqQAbqqFPohaeL2XmKo9+gddJZ/73aBjgqfY7Xm26/
         ITX+QxEqCB/Ud1jsrKhAKVWPMCTrZ49ppzKHAkBU0w/tzV3wbCd83rO2HWT1eyu48UmH
         NSVUeqdEJvSbk/suygBSvg48aU3KArQeW7GFeAivHHHGNcVI4YMFs6m1/o3k1QXuXSBl
         it5w==
X-Forwarded-Encrypted: i=1; AKwUvByxUAHuGIdM/pTxbvsj4O1zBtexwRrLFo+V6Pi7mf0VfMRqTsVtIOgSZrXOatc3waQF4m1O08iHKJxHsbDc@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7gXFf/QQ5qyH1j1uLxaEMP3fLSkTS1PTSbrqwVvlKc+ZoPLfN
	MDtTPJt3lJCmyFJgXUx/4CiQxEIYpOlg+yginPuVVrHI8qnPbYUd8QDG3lJ3eIoJsYaY/Yr2AnF
	4pluyLU/zWoWN5Sk8pNhhgEiaQEekO6+yAPlo8jH5ky/NmlzczE4XGJvaAETxiPeUqOVF+apMnl
	2KlP1B0II+mdiroHWAsKwC8UeKsp1W+t2xhad7fGb4WO1NbyUN0jMqPw==
X-Gm-Gg: AYBFou24HttzCPWju7Ib1F8+AHpsh2GAgw4kO6Pi9YRY/IdmnoJ71r55KKg3ytDITLB
	dV96MeSVy2CcK8SOC1+IwLcD4J0PP0v7x+AD+D47R4KMGfeUoyDRUyWlj+XnIINgj3tYUCtYlzL
	jHklPFsTeOrgerC6kH3pVN8enAuUVuElqDveEUuZMq+9coDKbttSctIYWI
X-Received: by 2002:a05:6870:4191:b0:459:2c03:6302 with SMTP id 586e51a60fabf-491e7c8558dmr10994503fac.11.1790591786840;
        Mon, 28 Sep 2026 03:36:26 -0700 (PDT)
X-Received: by 2002:a05:6870:4191:b0:459:2c03:6302 with SMTP id
 586e51a60fabf-491e7c8558dmr10994490fac.11.1790591786402; Mon, 28 Sep 2026
 03:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926022026.10539-1-liujianfeng1994@gmail.com> <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com>
In-Reply-To: <17bf71c6-2442-4eaa-847d-29ef625870bd@amd.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 03:36:15 -0700
X-Gm-Features: AclHuK9OFDOKbtyMdVZk9UcNKkIrCoCtIosFdiGWTbBmrYE1uul2FMwD-M7M8cs
Message-ID: <CACSVV02WCQwQy9BpUUqziQTtKV7QyJruiM+iTiLE_SEVKtpVNQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "dma-buf: Make DMABUF_DEBUG default to y on
 DEBUG_KERNEL kernels"
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "Bryan O'Donoghue" <bod.linux@nxsw.ie>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6aba432b cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=yt45555V-HXmRlmp1V0A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iq2Fk8JuP7h5AFm-azdA7lf7ltWHS5rV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX7TiyqMSln2qW
 WPEAcGul5TU9OXhDPnmdz3qxd5mT2cBRA+QnzYI7k9gBalYPovIkSO1b/Vv6pgI+vdt51mRpQ3z
 eQ6CNghAYIkU+T3Ech8QFCvvNT07U1BTW6VUMOIrHk6E2GgOD0sdbjEpStjTPffEKMnDOQg7aPY
 7FUJkY3cVfVIRdZFNnmykNOQTej8PGYXBvubyWsHWlySG83xlC57jY6kp5fQK690RM8hpkkf69w
 5/5IqLy9oYrTWTwbKzX+zJijA+cReERiqEbKsqigGiUVuIg61LrTc6tcpkiIhLMXizUem7NEsm3
 jZr0t3bTQfFxcg3snX48b8HCNUCEik/HW89CoijUAhV3GJSzuAmi7lrKsIx7toSE4Ox0VIHd1ul
 /DM4saXqcziWBgQ2y9oH5Wtl5QxtsyI668JqCxJVzUuANRXjGBVfQTSYcoop0oQe2dXL99xYf9a
 uEMySTubYhlQL5EI9Sg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX6WFRW9oVPFdh
 He+nyizEuYQKrlfHEwRjQHS+Tcgu6h3/z3V8LeL3me6OkVI/Ruaj3DH+SHR/8dXQfjSsn78YUlr
 XcFwuUCxP6D0lhkcECCJ6ZJhqIhcqFs=
X-Proofpoint-ORIG-GUID: iq2Fk8JuP7h5AFm-azdA7lf7ltWHS5rV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280042

On Mon, Sep 28, 2026 at 1:19=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 9/26/26 04:20, Jianfeng Liu wrote:
> > That commit fixed a dangling reference in the DMABUF_DEBUG default
> > and thereby enabled the option - and with it the page-stripping
> > sg_table wrapper that dma_buf_map_attachment() hands to importers -
> > on every kernel with DEBUG_KERNEL=3Dy, i.e. virtually every distro
> > kernel.
> >
> > drm/msm is broken by the wrapper.  Both of msm's map paths consume
> > sg->length and sg_phys() of the attachment sg_table:
> > msm_iommu_pagetable_map() for the per-process GPU pagetables, and
> > iommu_map_sg() (via iommu_map_sgtable()) for scanout.  The wrapper
> > zeroes sg->length and strips the page pointers, so mappings of
> > imported dma-bufs silently map nothing, and userspace observes
> > arm-smmu translation faults from UCHE, e.g. during hardware video
> > decode (clapper, chromium) on Adreno systems:
> >
> >   gpu fault: ttbr0=3D000000088a889000 iova=3D000000010741c000 dir=3DREA=
D
> >   type=3DTRANSLATION source=3DUCHE
> >
> > Bisected on a Snapdragon X1E78100 laptop as v7.3-rc3 good,
> > v7.3-rc4 bad, culprit 143755bdabaa9.
> >
> > Switching msm to sg_dma_address()/sg_dma_len() is not a trivial fix
> > either: those fields are only valid for sg_tables that msm has
> > dma-mapped itself, which native non-MSM_BO_WC objects' sg_tables
> > are not, so the conversion needs more work.  The msm maintainer has
> > therefore requested restoring the previous default for v7.3, to be
> > revisited once msm no longer consumes struct page and sg->length of
> > imported sg_tables.
>
> Yeah as I said before the problematic part is MSM here. We have enforced =
correct driver behavior for over 5 years now when that option is enabled.

The problem is bigger than MSM here

> What we can do is to mark MSM as broken and/or give a warning in MSM when=
 DMABUF_DEBUG is enabled and you try to import a DMA-buf.

sorry, no, we can't mark MSM as broken.. we can mark DMABUF_DEBUG as BROKEN

BR,
-R

> But making the check not default to enable on debug kernels is not an opt=
ion. This check here is exactly to point out broken drivers and you can man=
ually disable it.
>
> Regards,
> Christian.
>
> >
> > Link: https://lore.kernel.org/linux-arm-msm/20260923074256.9357-1-liuji=
anfeng1994@gmail.com/
> > Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Karl Mehltretter <kmehltretter@gmail.com>
> >
> > Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> > ---
> >
> >  drivers/dma-buf/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> > index e4f078a326a41..7efc0f0d07126 100644
> > --- a/drivers/dma-buf/Kconfig
> > +++ b/drivers/dma-buf/Kconfig
> > @@ -43,7 +43,7 @@ config UDMABUF
> >  config DMABUF_DEBUG
> >       bool "DMA-BUF debug checks"
> >       depends on DMA_SHARED_BUFFER
> > -     default y if DEBUG_KERNEL
> > +     default y if DEBUG
> >       help
> >         This option enables additional checks for DMA-BUF importers and
> >         exporters. Specifically it validates that importers do not peek=
 at the
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > branch: revert-dmabuf-debug-for-7.3
> >
>
