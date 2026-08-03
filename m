Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F6B3AFAE4
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 09:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748019; cv=none; b=Nya+J7dX3Rs+Bf+zeGNRqJ84NIvHqstuKVSq+bpJC+dI7kLHT3hsHvGR4Gq3rfOq1aYOgiopWmGKK6DRW9k3BDWTllajCBBoagMqXpckXdpK3WPCtfJrMaG9J7M1l8v7Oc/3NmfPl3CcNtE+Ff7AxcxgGxKfdmeGRiyzD6GALqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748019; c=relaxed/simple;
	bh=tiGgcd/zmAbWo4s9/c3TBSgmYi6t6giKfl1GV2HVQe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7UkXbylnFXep2/vi15kwROsHjaNQIVct5Z+CG9PjPjIzE5N+Xvz1bxinL+6pACtn02gNcc6HxDbBQ7D6VusvG1rDLZEj5cDF1SjijglMHB7/a4ynTwcWJhriBjUfIoZ37+6siVh8K9kM7NdW894vAQF11Dz8y+xiQe9LVAbuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AbrsNH1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJmEACSr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AbrsNH1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJmEACSr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736D35w3654505
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 09:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIY8GBQ8s+5Z53Nu8vxAPZIwBqZQbvawzF67422IAXM=; b=AbrsNH1NwtPVI7fu
	0pn6TAclQQUdkxcrz0WPfnxgFppqN/LCnDnm2UIEFr4d9CnGmn0Y5Gr6HhKHCBSq
	16AV7zEQf9k98pDdEXkoAnqvjxl8XTfQ0L0pm1qa2Vc3oo+i0g7+kSIDmfNIk1p7
	tNDpKmqd4028hMm5j9Ym7qGQGGUV6unCfoFOucYeoc9ZiobtTCNrkoIbkxaAuM3z
	alAYq7lDWwz2OMRXPYpZTusBKk6zZCsH4sKtXVL+c+LzV2IEqLvc1evRUUqepkjy
	1XJBhU0Y3Odq0CwWOs5JsQeWz23yGcJQ/Mp31BDt6t30aNtNWyJSbYmK3wIk2Jov
	ltC+hQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb0sa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 09:06:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso48128425ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 02:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748013; x=1786352813; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fIY8GBQ8s+5Z53Nu8vxAPZIwBqZQbvawzF67422IAXM=;
        b=EJmEACSr70A4toN2eMhoBF6WmqUlPqgvBq5ulxE82prevvbZLWxIMBDBBSoLNEdIpG
         NW/VZk4eCfAnBK9CYVFnZIpmzyHartiGi8ik1wCO/cgCxmCAZjTMEAg3Z6uQX5TuLNiY
         UGT38/WqEvozVKhrgdTO3REMDP1eKB0XrPwukZsNbA5MarBaKuoiUAz0Z2fAH2EgBf9W
         uTin72SEdYQKWZMoFo39gjQCrpHvKdtaIaU7J5Vogli7BCJEvoHlx4WQHNzBob09OkuG
         kvIKFoClgtS6TF52uz5NfzCrAcjzmKH9LaTpTE2LZHOdg5kprxDrezWA1Dv3Lm1xbFCQ
         ZoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748013; x=1786352813;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fIY8GBQ8s+5Z53Nu8vxAPZIwBqZQbvawzF67422IAXM=;
        b=MWAqdSkvTmhHeCaSDAQZsWoCPWNt7DQ7itoooBeQverDWafqPUakEFdhOt4KyHNzxR
         S03Kz6wyml3lnBPPHFfzNhNTKw0vZLSFWaE4b2d4oJcp0LeJp8KgCHqvUxAejphQdIUW
         f1FhRsUYwpuP42iw1B25NtQZmi/e38aUwTCyXzQ8guvWzpVA7Nzl+iyrj1jAijAnOvNO
         VvAyl/x6DJ+5oOr4rYfOFbVbUCBfHx70uTd8CBpVuJZOXRptkrxdHoIZ9cYCP8vZh2kx
         2NWrhico0Hx8UhtNM0h1cOlE19VZCqpRtgVxDkBVzzSm6/BTMWxcUFSJAOFEn1Atb2hk
         lscA==
X-Forwarded-Encrypted: i=1; AHgh+RoEX4/CO6QD6tQ7oyrzej6JwEVfJwaqvqsidi0HD11pB/px6LfcdtDD8J9X8qM494q+yQyM/7xf43fI5e6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxuG7iCXsdD3giogqJZy5hrJuL0QHF/sS3LmRTSHC2wnMS+xG4t
	wS3Y5yupYL7uRajcenr4sbHQcUcQafii+SbLO4JeGV1Xe0D2/BHs1mU4FEPLxS0VpRQkPB3cJx0
	TDsZH33nuF53RIY5aZgbV56zyHL4ha9TvzjR7b42d4tvHfq+w5RhYTomL40C/++lIk+Dh
X-Gm-Gg: AR+sD10GpWn/pAXNtuijhovN8yZL2bip+JbXzYu4sFinb9VcP+S4SHWW9F6ybf/tMn1
	5L8XPdYHJrTww7uuqEQ3nOPCkYPlafuYvsVCzKJdbqG1X9Kpf56xrlm6DtNVl6Ux3v62PlS0Iwo
	7seE8qeMkI+sSHpWx5cCPwCDEtwPBDNrp1Jjx41A1qDrvO6F8s45oxxdnJ/6NnSW/T1g1/THEfp
	EKL3Ocr+kb9rmlrsc1QrYFx/qdkxfuy9AksLB7kqQPWzvZDKY37Y5vP/MJb7wDGTaPMf+XFW6By
	9YSN0o9NLs3qr22tNKamk2cNSzkT2Xh2fxLtfFT8Uq24snWpisXx5epdfQ+Mu+j7adQKoHpSPf/
	qXcg9SiFWONmubO3eGJ8vVKUp4CM=
X-Received: by 2002:a17:902:d2c9:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d0521bb7cbmr87737335ad.14.1785748013213;
        Mon, 03 Aug 2026 02:06:53 -0700 (PDT)
X-Received: by 2002:a17:902:d2c9:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d0521bb7cbmr87736935ad.14.1785748012686;
        Mon, 03 Aug 2026 02:06:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f0f9sm36134757eec.23.2026.08.03.02.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:06:52 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:36:45 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <20260803090645.d5avpt66f2ahoggy@hu-mojha-hyd.qualcomm.com>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
 <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>
 <am7Aj5UdrrtGUHjA@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <am7Aj5UdrrtGUHjA@baldur>
X-Proofpoint-ORIG-GUID: cfsqoXlGg5_Yh-IzZ6M_Cb2Vcs5PvF0q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX39IzN6i0ohQH
 SdsC2HOlmIulMfUfm63RrjBPlh+akFPtWUcOrT5ySII5AIT9lXctUlBQoxsdVqcrQpaflAwVCBQ
 u4rk6XPSJPnMeX4640H7nXym8TckeTg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX8/xdfHW9i3Oq
 zmOibVG4qMi/X7S44gJVNpSsn+L51XpIruXGM2w/bqtwEKZUsfFAaVmvdrYAcIRvjsGrKhDsIFI
 84lgb6oDKGbhYxihyru6Leq5AAXKNlMiGCegXWmsm9ucFLI2l5oTLza9++DYxD3yucJ2kVHBDNc
 joQ0AzzHlz9GarTbfRTVd30qu/CyVWdlDhYAXDuokb0Sa1/49Up6gpvQ7S/4lDb5KKXBHfXRUSI
 OdenRcAy6Kv5CSYOG2CwOACpH+9vk98anvt0YL4IlsrLy8169A7XoZCXAEk7kuNKQZs4SXaa9mp
 rMG5PIFrpxBl/njHkX3dyRuhzAAYEB17Yh9kkNYAoK79OI/1ZMJJne8gP17WdSQng1RqenB9uXO
 aGfpv8gurRss/mYzLUiUkSt2AEIm/+6JB8sgZfiAmt+o/HwUZXFCCrtgTdZB8ND4ydHQI1P0FIq
 kjLqDtafPcrrQKOQnqQ==
X-Proofpoint-GUID: cfsqoXlGg5_Yh-IzZ6M_Cb2Vcs5PvF0q
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a705a2d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ShSN6pBggmEGPnbpKMAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030081

On Sat, Aug 01, 2026 at 11:08:30PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 24, 2026 at 11:58:58PM +0530, Mukesh Ojha wrote:
> > The PAS image initialization path always retains the metadata buffer
> > when a valid qcom_scm_pas_context is provided, even if the caller does
> > not require it. This implicit behavior leads to unclear buffer ownership
> > and forces new users of qcom_mdt_pas_load() to manually release
> > metadata, which is error‑ prone and incorrect.
> > 
> > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > retention explicit.  Metadata buffers are now freed by default and are
> > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > probe for contexts that require retained metadata for subsequent PAS
> > operations, while existing callers continue to work unchanged.
> > 
> 
> I presume given that this was sent together with the remoteproc patches
> that this can't be merged until those other changes has made it into the
> tree.
> 
> Please confirm if there is an actual dependency here.

I had an expectation that Sumit's patches would get picked up completely
somehow, which would avoid me adding the extra variable keep_mdt_buf to the
temporary data structure qcom_scm_pas_context. That's the only dependency.

> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 18 +++++++++++++++---
> >  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
> >  include/linux/firmware/qcom/qcom_pas.h |  1 +
> >  3 files changed, 19 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 16ae42e6c434..54ffec97cc26 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
> >  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
> >  
> >  	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
> > -	if (ret < 0)
> > +	if (ret < 0 || !ctx->keep_mdt_buf)
> >  		qcom_tzmem_free(mdata_buf);
> >  	else
> >  		ctx->ptr = mdata_buf;
> > @@ -664,9 +664,21 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
> >  	memcpy(mdata_buf, metadata, size);
> >  
> >  	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> > -	if (ret < 0 || !ctx) {
> > +
> > +	/*
> > +	 * Some clients still pass the PAS context as NULL. Until all clients
> > +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> > +	 * for NULL before dereferencing it.
> 
> Why don't we fix the problematic clients? There's no point in working
> around such things.

Was waiting for Sumit's patches to land so that I could convert
every client to use PAS ctx.

> 
> > +	 *
> > +	 * When a valid context is provided, keep_mdt_buf controls whether the
> > +	 * metadata buffer is retained after PAS_INIT. PAS remoteproc subsystems
> > +	 * set this flag so metadata persists until auth_and_reset() completes,
> > +	 * as TrustZone keeps the buffers locked until then. Other callers leave
> > +	 * it unset and metadata is freed immediately after the PAS_INIT call.
> 
> Please rewrite this to make it more succinct. It seems you could say the
> same thing with just the words "free the metadata on error or if client
> didn't request us to keep it".

Sure.

-- 
-Mukesh Ojha
