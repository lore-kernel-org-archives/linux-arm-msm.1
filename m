Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED8D44B68B
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786627329; cv=pass; b=neQjZETOgY9NTUCiSyTOrN/s68eJvm+RCiLR4TJEaX6PRMI1r/PaAjQbxE0U7N++PK/2HnlUGtugx8an7hX2VGw6UFbuFRnhdFH9CS+zYKbnl/7C1a0ZugSrnrIsuQZ/CWGh9jImWfK3Lo/a8mkIwGSp0yvDuxAr0iH5Ax1P5VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786627329; c=relaxed/simple;
	bh=Cj7FBieyVij2NIR9Hibc+ljX62yVtYzJdEkLiaoTp1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blEXXKsOZJyl9avLRtNJwUUnLpJ0BvE2r99zKoozl5NQOTau891MljRUDxCCVvaZc7z9gLY56tOqnRODiVXrL3+KeUo/5yCmubNwTnBrNt0l4qDPAihBOobQpSwSMdU2Whi6FrFmxqGevjsNwIS4rEWga8ybVvpZldlqlPHqh+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D83oWfnW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VVxAiJmy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D83oWfnW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VVxAiJmy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJnog3286604
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X8GgQ9XIrCCNcG7VCrAgj3Yl
	EyImsxHXX4dsddVR5Zw=; b=D83oWfnWxWZdgFCESIttZ9FRNu+GM9HX6Y1cp8Wg
	i1TpyeX+5ODvfASHgPtDHmw5u3fvSvUZlyYn+efAj3QhsR20Fz9H1U5/fWNpOq9w
	UmNOr5p814oIFNMLUXDK3bzR24fTbTfzB6Z3VQESQSH6RqFknmXVeLylgKekLuqw
	218BTQ+3XnEBvzMaZD1JVi6lO56OmD0ESPbxb/GnLboljNIFKjxDQ8VnLS+MEnSN
	vC4uV2r2ZwOq3jE9AO+lO5auJ235sDE055dM8nTQK/YzFc3tL134zK2KAsetZvBy
	6zn77rvgC7GQ0LfC/WY77IpKmXflbxJt8TcYVNwFK8EA0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g18c5hs6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 13:22:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so16382485ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 06:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786627326; cv=none;
        d=google.com; s=arc-20260327;
        b=oRc3O75PRVplOpKS5vZAlUN7mM+xOywWL5LhZDX5OwDwiBr2DMI79PcmrX2B5ORQq6
         rn9aBQcz9mTUsJeglbVCnPJ9fcGOUfVT8keX/P7W1lV5iRVojhxHoMHKR8WF8Jw95i9o
         HFqcn9YAtmr9sr7wNSJrvrALW6nW2kPrHKRo/wGhH0cN69DvZBiNqLG9/RCSAktQP/Hm
         OsnHkDuSVxWEbE3howr2frW54yNYmi8cCcADEdgvQc4kkZhBeE1s3y9+sgWISJ8u88Ne
         DZI5hc0oT93Db3adgIa1xO3l27L1UQGdunT4KutRt8iIOypu/fwL7IICT17n64I+seDp
         KfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        fh=DfRFd+oukhDIPZ6CD04ofO/FjQywLXmwvpU7SG69OlM=;
        b=RvL36RC0mhKukxlhbF7tqHcjwbpDnyrGvsjYuevcC/eeZaNuReuFxXZdpU247bHHPc
         4e+KP328+xfFz9kIVj65GG2OiDybEH1fx4/83Sa/vO7NPohE3MQPGQCwBFtY1Jq0j7NJ
         TTIDSgzfWxb3kL2AeKvKqIYJGDfH+ynt292aA6UEVoxX03vKTU+9KxjshGYSgkojuX+D
         mM90k83vF1izwPudKQKYBDs12S5YF1vhlDjJYYIlxwd0R+Wgf27vhZvKwWkfDWFbLHeY
         0mXyaWJG7Wxj/YuYQ1IafgtUT1p8x52amXgfSM2nYku2trJNgEJtk3/xX2H7sJlgR9aI
         fgOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786627326; x=1787232126; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        b=VVxAiJmye2/U1fJK0momiCOu/M5CKjwAwysVIrjX750WQz+wPGILXi2sYrv4nT9ane
         2CEGHlMIuMIGcpwKrej7QObmf1dYW/bzzO6mTybQ0MRpcCxji4WCTIFkXny/37WF89v3
         JTcVaoPtz6tBIQtadfYKuBRf3Pzr7DVw6UQ7/neEt8VqvnbFJ4k70rc9y15FmTl1fgzr
         QLcRSepvaeR7XolSKspgP7koZuqyvBSyyIXDeiDQxUsmCz7pf5TZvZ+bsRyzVyCmIsd3
         X2GFkeYwP7cQrDnK3eSzGm6xpxjuvMySuqNghZ1zoq9de4bNYbjSzEuyxsE4RW3ExWId
         zAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786627326; x=1787232126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X8GgQ9XIrCCNcG7VCrAgj3YlEyImsxHXX4dsddVR5Zw=;
        b=ovMMexqBOV6o3HWI1AnzaqKfMRS92LJLID8ZNo9cbouDnrxOp6FztQwVzw1dRM+rdD
         sPdxDbiSLhsmIn3oWz8rSzPIC+vhqULHfRUsryI+7u2A9T5/T2jYV50oAJ9kycvU9LLu
         LgWXTdkhsB0XbAFfVfa2QVi6OdVBhnkHSosy1uOqTEEk4qikPenbuqxMDh5v3yHPOTXC
         s9VA03BiTjI0SRc9V8uqFgkjXXiVDKVzWsri8eXQeYY/lFsElvf3qrOMX0oufrbGCXmu
         eR/oljpfYR0AqkO2f/0Nbs0UZn0fXZApFoSdtK9m1OGg/b2ziE96O38VMDssdeCEZTVc
         +j5A==
X-Forwarded-Encrypted: i=1; AHgh+Rqr4CzXoz8kTONq3GKVa/ue2tx9y+dlIuIxwNzI/R5xNLuk3YXPV7EnULlnocWA1zR80x2/qUhOseXEu3HB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/qCYcbp6I+oVJCwbjxGFlT60YgiJMSdBM41BMX1U+qjxyz37
	WYTzeJLwAuhFMcxcmdg9xlaSXFJxmi8K60yboz7HdFTH+xSXA2btOv/jy31A5rQtvUZS0sV9Se0
	68uVL4otdM2XKoo/fAMWzOoHyGXYwLw26AcxQANVGqO9OklG26hvT38IXLpzH5IFjF70b6H+ju/
	XNEEbORY4YXusAiaOBFhMTrr/GXXBGivH3vlbBZ+W9i/Y=
X-Gm-Gg: AR+sD12RPS3HQAnYMeDgXGCPlgfSo08Z+YMco0V9rQIQhdoDFUC5GwUfQ/kcHsYrwgG
	Hg9GrjOvL06nsQnCU/30M5SMqCYKi9WYZu8MjO9tw2FYPQzMpTZPn3iI18x+kx82yB52M2o7Dec
	itBzAJm0sU/hsN4oKTyKm/pWack2e3JabTlDGAXzO1r1QrqXw6ZJcAzw==
X-Received: by 2002:a17:903:19c6:b0:2d1:d95:5253 with SMTP id d9443c01a7336-2d37e8a215dmr67584905ad.15.1786627326132;
        Thu, 13 Aug 2026 06:22:06 -0700 (PDT)
X-Received: by 2002:a17:903:19c6:b0:2d1:d95:5253 with SMTP id
 d9443c01a7336-2d37e8a215dmr67584165ad.15.1786627325593; Thu, 13 Aug 2026
 06:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <20260811174822.1f4bcbf8@octoberrain> <gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
In-Reply-To: <gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 16:21:54 +0300
X-Gm-Features: AUfX_mxHoHpObkBUMA_LVBTzNkTZEAvDKCFJYHdEqxDVRSWTb3ocH_vdHLkb5UU
Message-ID: <CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
To: Robert Eckelmann <longnoserob@gmail.com>
Cc: vladimir.zapolskiy@linaro.org, andersson@kernel.org, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        m.szyprowski@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
        val@packett.cool, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfX2I2SvFZQz6l/
 3bZypu6WBXwx5wQc52DT0lanojP9VbBDIozkNlyRBZ80+FoVi3sqNntvLSmyweCbzRvOFMil47e
 4H5wR2wSTNLKQDx8wNcTQzj9JAFlJVQ=
X-Proofpoint-GUID: 3jP2Ak6D8hjYUhE_AfHhXaa8GYiv8hep
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5NCBTYWx0ZWRfX2A4uobMYQnE1
 Bz3Pa+F2r7jj92h0cQwuWynfFOmz/bTsObYExX7L8DRBN+9eAYB8s0ohdsv5zOOosJir0Tj6D2u
 +EEvfW/KTNxQFhcXUGnhK9MDEp0yB2Xnl1ouODKHiGWqExxC7mny3NJKoXHRwdb2zOEqKYfelvD
 75IVvMAAihC6x3k1x3J9Q93eIT8DX1G+1JQuaq/Wy5KJcUsDx4izdijn/imyVU0wEeE2nYUtuqJ
 7AiojhLvjnj4PBBnvmOitaujCInPGNesTCVKySJq25PggWBpGaZQWZE+a+vgINDXECLR2nomO6o
 /5AxoVnQ3T0c4FTNFWOKNaX7ZeBdlfnyaJZU5dhWrooGZASWwlC2rl9uzCLC+KQYd4w5+zMjUxi
 Qs4N2YHBiyt3FKf3dbCF+0o8i9j9ItRu8zNBz6CXJuk3cQoNHkoDNVBFbrMk0j5fUsJu2INlXM8
 OwYxqykv19R4yDBChNA==
X-Proofpoint-ORIG-GUID: 3jP2Ak6D8hjYUhE_AfHhXaa8GYiv8hep
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a7dc4fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=es_3XOJaTd2Oih7S2uQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130094

On Thu, 13 Aug 2026 at 16:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Aug 11, 2026 at 05:48:22PM +0900, Robert Eckelmann wrote:
> > The same problem also exist on sdm845, esp with sdm845-hdk I saw
> > similiar "already unprepared" mesages in dmesg.
> >
> > Doing the same changes to drivers/clk/qcom/dispcc-sdm845.c, fixed these
> > issues.
> > Can provide a patch for dispcc-sdm845.c if wanted.
>
> Yes, please.

And then almost immediately (sorry). No. The flag is correct. To
unblock SDM845 try adding GENPD_FLAG_NO_STAY_ON to the MDSS_GDSC. The
MDSS reset is not working / accessible, so it might be the only way
forward for now.


-- 
With best wishes
Dmitry
