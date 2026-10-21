Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571936;
	b=LAG5wn8OAMazAdHGuqbC2UwFgslSUcyaYxsOYKbpGqPxyycpjczd1v094HJfMSBpllfE
	 e3abngFgeJNgWhctPwQpOPS/60NHWMkrbXlXtdwnFnOiImPlXlMUmJAD9IMUybZSdv5Tv
	 d47LlydI8OzNKx+F++DXSgXktwTcfA8kfpatQ5uk0lS9ZAjOnCJ96uZLqJqNTVpS/YAEU
	 ZJ+k+4A1xCgXClS3yZMCAG1PjUHB7VlBj2M1wC9pHVKvxgj4vhjPm+HYvevf3ZyhFTRCq
	 BUJ4hcckLAD0GmVXwR3oACgSzmkjEaoLh/9+0gt8tkv7dp63Pj80z2aQH36xQQi8RjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
	b=kYuOo4F5bEZn/3aiZGQmw/qvqd3c8LwTukRXV3qwauyke/bJC4q3usBMGSC8XT9P2JZx
	 h82UkFIdeEH1GmBwaBMpmRzTo6dayOq3yX7xHcjq5XHm2XaB/ixaHU/bEMXnV9UL8qlUs
	 m7KuTZkH+mh7BHmPhZlalxJ9s+guAjfaRFXZx9+fEqaWByStn0Sef7hVuevzW19yszgnd
	 P5KN9bfrfPCRQiWQB5zST4P6rVSv8GBYyNrJpSXdJ02FmPnenKHPBusS/9sXRJ/hAWE7u
	 q2OtsRPPqiUEOkvr6+FMNYhrO6DI/Z2Y0EXkjcO+bIDGKV0YEDuIJEdlE4ynmUCXIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBP1AgCN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5THkjeN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9BD606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBP1AgCN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5THkjeN
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1tu3355622
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=; b=IBP1AgCNXnfxKQWs
	U/gF6I4kttmVJBgP+n+m+w1mQh1SNWfkVPYDMewQm13NgtuORAjhg0dJtMxpqUXE
	TuKwpKXCL1WE7G0F8Oeb+JZMNvrfs6zex1hf8PtQKWdBJmth2HzTbu2AqD2E8WNg
	79MaS4yUU1GPhHx5gQBZA1tj5tzs40i2f6ps8KE/R4rbPgvGkggDy4n4nM3bOf6u
	D2BdEpDYiuail7KwS2VxG0yIIT8WsEn5NVRTDyWnZfvJ6oNheQcfRhxxqkgSO7yC
	n258RB16rRgVP6BZ0+Uzwrn4b7QOYu0g9HPXbgaELdP2kyD7PW66/58dcuwG7rIV
	abvBcA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jx6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:38:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so1023936d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792571934; x=1793176734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
        b=f5THkjeNNGZCSZkmJzhLz3FLgIXAOHnKyK4eL5RKVzeu1wxkIzJSide/BBPfF9ZbEF
         is3CeA+EgISIu+8+/hgJQ4smzSfRucqUljXInxr68kNINYDEQMnAH+XhyT/WCC4NM2lx
         bBmmPCo98lw5hqjJX94cwbJVls4z9U0b7BqNecn7Cq0AQJxcMTsmjfp1pUwrAynUYVnF
         Tj4CtUmy8+mDejmEt4Lo3ICWp57hPbkI+UfsJk5ezFD5BVQA1/Nsx8xVDQj9t2vcf3/Y
         lom2MflvxTd44Oovc5l+VjR9jT6OSmRW9qcmTj2uZFMQt7nZj6/2E7bfmiUYf8ck1fKa
         hOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571934; x=1793176734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10q99WjpupYyXoAqEGbsDSnGwWdgp3LWUj2x80wFg9g=;
        b=2zSdRPsw1BMhT59qplpRjG/GH/MhFidEFFuSzzLoRKWmR1Zsrd5hBHUooj9x2T4HM/
         6jZt7uzs64GlXwFtuk4TCU2V6sLKFaLgZmEeETtSXkDY0hqBaor8nq1tZAao3Hkk/8QD
         9f5k3wD3M51o/6bhYEqaLWhn9+cKXIwh3NlDX9OXEVNQzs9OPGBO6y+IaySJsXPBxPvi
         aAnarKo3OrXXeCgFaRkp0S1OYK6Ax3X26Qsb34gmMKiQJ5O+4uQAaf9n7UvQy6mgkqAX
         76F2B4Wxfnw+T8+98wGs6YPDrNdXcJZv2sf7mky8gsQ3oH8pbMjbfpkefbzibb/4DVyz
         84XQ==
X-Gm-Message-State: AFq9FYLXxQ4iH8wp5wg5WCUG3MrEYrdlFIyxEZNo0jDGUZPRA+bYg9tZ
	xw0/cHBUaILvJbXsVIC3b0M2TLRIa8ezy/mSLBVrezg/+LbTiG1m0a52yyuu7HUJpt9vd9fHo5+
	1u1bIHpYJe0TEo5rzKpZDfucdTvkXieiSlCgDWL3bSmgXTvSPOhBCN6DN9bwbeSTSH2D1
X-Gm-Gg: AYBFou0jOw8cL95mECU+U1Eig2+zleAPfXW4xLK4eVlfi4tlkk578uvwTlmRCUWCeoE
	wdZW3LxJhZ2BnIe+KXNm4p9hV2OGzJ/oiBpTM22kfRj22puNcIAy0EYvbRVIoYirbYVUjQkx4Hj
	4/mqvxo/fMAMkI5pNmSAjMKgdWlmhYE+ssN083lXM0UWViq+ccBhHV2GsLbKYe8AB32j0lkxsqe
	QyI76hCnSXIB+vNeaKLpOTKstjkMYPvyf646Q7XmiHTlWj0g16+0BvMv8ku5Oo7IucXgPIHuHQG
	ZyJIdIDl7G8uWjfZ/qxZmGivY+0WIto16Xp+ANWTZqRFRzm791+ga9WsDtItGiOj7UZZ5X6kR75
	0llt0Vq/UgktOQ37yEa2Pxg==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr338660885a.2.1792571934502;
        Wed, 21 Oct 2026 01:38:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr338657585a.2.1792571934003;
        Wed, 21 Oct 2026 01:38:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77729sm54778566b.25.2026.10.21.01.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:38:53 -0700 (PDT)
Message-ID: <c90eb47d-0eac-46af-9806-8404f5053e38@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:38:50 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/msm/a8xx: Allow nonctx reglist to include GMU
 regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX3C3BsqvDG4/p
 L1616ls+74ZdZRp3qmHt4t7g6nCmONK5U6NuTvaX5jD6DnDEia0lJ8uY//8IXXVvoLw5fIM1Rhs
 uDnvtVc4K6hmseNoeGp157vNKQLCBTwqhuFS7YWSTOJ+oZn5oT2L3JzOzFBBCEZM3AsrzDtImHc
 kBRIEe7eI7naqSgrp0kfiD4Njb/c1HNvU5apzkQCFAxOopd/GvjC+Mri+BLlO/i3tP80uzGYO8w
 XY+r5xFEkBGIgLaXpI6qwLA3qGJAHuAFaqKz6bYeZFqB92d6PWG3v4BpVQgMpXlnHlsfZ1ec6t/
 NPkaZ2bSaNvXfhUBDtf5uHKgcXikXBVTcQwQPeL0ueWeDJElvHM4GX7fnCLphKxBPpPQfCAJfM/
 UI7GaMgAx/5Il254W7tQygP09KYKU1p/GEjO4YPZV4InkdUgEl5zz+oihHRQp2XTfpUGriAJRtB
 owGxE4uV6m8AA8NQHow==
X-Proofpoint-ORIG-GUID: L7xg5bZ_bx2fGmz32jQhjb4kkk1jeecF
X-Proofpoint-GUID: L7xg5bZ_bx2fGmz32jQhjb4kkk1jeecF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX70ZEv98qvNc7
 1QHJkM6fT5tOmE/AT/FTpO2amVnSvzTyVyiKz7SPmMCPwDNodfZOj735ikV8hrEFOqlHT60Yh/W
 /ofBhHE51bxdJz76wTe2uGQpajfgtsI=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad87a1f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FxG1VXWaU6FXrht2Wa8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> From hw PoV, it's all part of the GPU.  But from dt perspective it is
> it's own device with a separate io space.  So we need to detect this and
> direct writes to the correct place.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
