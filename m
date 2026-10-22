Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792694499;
	b=AKBO25bBC7XPFUbPZZk/TfAZ5i20NgNdUXtTOadraSjA7r0nHJK+aOK2vtqKegtEoG1w
	 i/xC4x5cuPrjBIlU3b7tGP8fJb0ePvmjkpf4O41XwtPAG+Yk/LIySsHq94KbZ2qrd0ZVq
	 uC4296xmni5rWU86IS9DdwP6Pmh1CeETXfxzbGIKkJMzKnwiaN4LDFVPu2nJXy2COiNC6
	 ZhAgasbRLfkMSVc/gLKQQGhOJWLPKZrLVMxhO0ue0l0RwLfk15ko/qn4jHX85GjuybeRd
	 3WAiGNuB9pOsN+BI5ckW9C4dsfVNPCNTfjxZqRkfsiqQEwe0wQ/ElNNcQW41H0ueV4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
	b=pm1S8f9aXBUGRVnKfrJg+iQbEbJv2GzjceAOPlBeNoz1HJ/X/fRlCoLyztvX7cvj108X
	 FklO5NHYl8dVL/5FWp5nRj5Z21x4QHH26xlTgygqTyPpPi3Ui3VV62tYEKWGcR4S6BBmv
	 gK0083vfnCW42lFNwjbEnJo85N+G4ZcFrw0NHYqlNTgO+IhCglGiy8NJnW6ck9qTIHnQi
	 kyqmDfTKJV4tZhSC+UXP6Xv9gD3vX7505dbdpAcfk3pQ++SD84llr0E84oLLN8vTlLNv+
	 jLGd8zsfzwYVEMiFLBOOn7YqdF87r0z2Fq7ZvwSdI2udltbF2s7tQpQzlCjbj5lnIdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=euxiU796;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxNLuSwt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48ED606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48ED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=euxiU796;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dxNLuSwt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtTFQ387600
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=; b=eu
	xiU796OTje+8cVlY6U4i/+C6P7bDnqYXdUj2RMdFdSBexnjTyOCz7wc4bqd+UBnZ
	PWhKSFea3qn/zG72xD6debCbiMi6ljW1naa+uqOHDpt1D0JJ2SVa5N4H7TTp62re
	ELqIFYZCNzrHm9DS2Zg1oXQfYCFcS/5i5RiTLzOF/BCwJ/79txmsZpv7uf0Uq0Qw
	/QpAmR9+EkXNXsaEYmoIjcnSzFCl1ARu+Y4lkFkcQUkvIzJTFjsdGANvZMo3dzmo
	16uYy0s+vWLLJjiNmM+7ihz9kCyeUsrqoIhQ9u+HeYxS4ISEZGRQGaLmDQ4CUFI/
	bmPfmkHL6DbrAkR8q9oA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq4464-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 18:41:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6e1fc036608so117357eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792694497; cv=none;
        d=google.com; s=arc-20260327;
        b=Adl8smdmv7NaqdxRHVf82s6iWUYsYM7SD25UV1rYx93iVEV9UJqWTlmp/o/yNR8mfo
         5v57yEz85jG7265p4q1qL6MApjbkgw/QundteK/QkM6HiAXKm1mOQFxGqQoTkBjQ4QlX
         lT4gSsZLK/vBjeikgnYZ8HDQZru+bj9qYoAGpUkoJ9ndEW5KI/9B5tJuuDY4XDyBYt6u
         xWNyRg7OQ2Vx3uFeSky8kV60cuX9phken7Aj9T6d11x9zl2Umwg6KkOCydxeWw2ZVLFa
         qidlmNatdCn+BU7Jtdqq6TbEghOnFRAjhVVUmV0EGBe1UrMHcGR4z36rO61gwea0eRms
         n+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        fh=bgiyL+MUskDJLY5xsR2kgn4dqZB9dabS7y9V4M+MA0o=;
        b=NSUVxafr1SGwpR+kaEY1t5Prtz5E4On4OOpDamf87MBwU7cYIjTTRmfGpEQeVMd098
         +qTi/BztTnE31j4RQP2P+EcldbIY9v1hpe7qn38RgAtrOd/5/6Z/LRUt8SlHY64d/G8v
         k/voMW0LIm5ncOsk0w22Bsqw5MN2lnRr7DozNneukqIjiZwkYYAJwT8bCdFO7NOwcx7+
         OG20j8tzDYgen4U0FgFL/V65IKcA+MotYExG+g3DhtCVa2kl4MB1y16DFBaCkAr9dt9H
         ooBnqr3t4wnVErvgd00/4UgKO916URZmLwNrTjEbbN9HkGXIOKST3RpaRBFXUHcR3MVW
         qxfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792694497; x=1793299297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        b=dxNLuSwtDacnIUQJAqegvifRzMrjQoiKiZrP5SYKVffWHR1MhExWtqwT4vyB3M4L/P
         BTsl1gwFSo4Jh6u4VXen6ZxY3qYH+VDfZCTVj3QH6r1QUPdNj6uM7EajPwE1XQ5Cd34g
         lW9i2OaFymkL9OdsjTWfN9TfVrn6kykoZb/5fEwi4oaxOD32P8DTsFPqmhhGgAfD4+7s
         mJChjyYqq9mVjdxedzEcW0eYg/DOo1qUHtW64J3WxoUFfUk7yei0aVtq5eJuK7ce7vSi
         8BCK7Ld3Rv99KvngzX7rRwJpCcGsrcN9IRkKTsdyU9QkIIdR3rZFHX64uJf0OvNZO29e
         KxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694497; x=1793299297;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQ1yqWlhaAsFxjht/bbSB5+ov/E3vUlh1iSz8HtB/lc=;
        b=GJww6J5NcPNqvqVGZSJGySzU922443h2R6iB8SyWhLbm70kvRaMsAP1P+38d5hyBFN
         5BKStsSQJomAxWkHx3DgY9/MRSJjstBxuNYpxCQoZYD71lV/8JEYe9VCU1AHyTlSDX4O
         QBLu4PcuSD3eDRaVfVJF6S9hcu2KId+PdJIoWqEoWmjT4EN/VolmVWhHJm5DJcm/b9AQ
         mQ+ps+1tQxNoDuCYFd6hg3Z0WufeoMYF0RJNJ3ObrR11luCLWnTz8t/MIdLZz+R48BX+
         ta9BUymUII3Tkh8U8gKiAPtVM3F0yxg91c8JqTLYKn1IQsq8gPcD9FF7BXsztEa3ZRIO
         zxFw==
X-Forwarded-Encrypted: i=1; AKwUvBz3h+mldFSYuy3kJ6YLvP20u5TawtxJLIimQiSWM1nB2nFxXE05NEv3T2fOoeTEFWovMcd6urXZmFx9M3nJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8ueiQ0EiVyNLF2bIHoLN+NlUPUyWJP5j8DxQ5kepncFf31Mpe
	BylV3AAxdCDewAy2jLTsez4lXH3JXu8OboIcVgWhqXSlt41y1RbhwXhEv/NqIk2VhTIHK5eLMU4
	6WWQ5rxP8HtJ02n8u1x5FNAa7ExeDC2+RUJQ1dSE9yLD8awcbU4E4ZiDuAYN6+dG1oro5uGlX1q
	l1iSGINlBW2V/FsSsNaayzPvQ5C8418zCEL3y6iMyGWFA=
X-Gm-Gg: AYBFou0HiqvYqasU5EUbFvIGasRUivQQmzsAJYg5XXyn8WCYRDqF6bq1c3prK2SLDfx
	iuJ2tSgVF1uJ7Mkld+nHJfPhIowcem4ccNkUfRdmfXwgKHT4vrVFvU+7yFV+fNLyOR9VBfoe8yH
	fi/8d1cQG2Bij9rXVQpLtIJ+j/f6J14tK5W0w5+wpfTYisFPuqJJYXA1EIRQ==
X-Received: by 2002:a05:6820:5706:20b0:703:27e0:354 with SMTP id 006d021491bc7-70b88a6d3abmr141606eaf.66.1792694496787;
        Thu, 22 Oct 2026 11:41:36 -0700 (PDT)
X-Received: by 2002:a05:6820:5706:20b0:703:27e0:354 with SMTP id
 006d021491bc7-70b88a6d3abmr141590eaf.66.1792694496395; Thu, 22 Oct 2026
 11:41:36 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-13-robin.clark@oss.qualcomm.com> <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
In-Reply-To: <4069a590-607b-474e-9e3e-f7e744d3dabc@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:41:25 -0700
X-Gm-Features: AclHuK_E4qF_ycx7Q98oHOhvhifI0LrSBbfrv3Y0YeWAfO2MHE8rzdoP5FSSzrE
Message-ID: <CACSVV01rM0-kgpoZHw4g8sEHXk-bswfXB7G5Va6fn6y9izxqXw@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/a8xx: Switch to generated nonctx regs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: U8m7fMeeVrDkJy3QH8aWilXVAOmMK1m_
X-Proofpoint-ORIG-GUID: U8m7fMeeVrDkJy3QH8aWilXVAOmMK1m_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3NCBTYWx0ZWRfX9SMKq/UdBsVW
 WnUWekO0m/GTtn2rSaALUevqUg0wLX2zCAVvyxaXDf6eH4Q7tbfsKpvvwHF7IlVOLtUhprE73xH
 W7A1fodc9t8a8LbHSijzAuQeChF+leA=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ada58e1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=b-Rxe3tx399ZIUr8oAMA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3NCBTYWx0ZWRfX+b2zb5HDBnyQ
 CZSXSu0SALZIA/6fyDioUU6ZAJjLR6zB20LTAyA1gnJ9ytYnUwDx/CnhT7jPaRaLHFzxYivI0TT
 EM/93czrAltbCAzSfXv6hEEpyJdopllQbTdonD9X0bhz2vWZGPR4AETaoSxBEEndUe9uaBKw7Iw
 uPDph7JoRYQ+/Y8W8jQgi1SIvfIAoBPLoZpVXRPyOmRG3K4gRBkojR2hPTFGclyP4JFnEPlt2WU
 QbxnQp46yq02w3JA1RGwJsQidxH7Acfj/0Oal/JrINlT99miyWzF3jYcFRD1NrXxSecQUTdT6Zw
 OCXLpeRdZwRYIVdi/D/4WTesudfNuV8vRZObuGNbe6ZayqW1J/nA83wmmpI7Z0ldGfFagWmr6fz
 DfBIZPu4NL6pbwMrQrlS37CrMDsFwITbBUH/ZrrBCrR0iditd8AVsG+DTvMu6bVD7ocghRTOxAJ
 3p0XUbPqdfeHxvEiUlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220074

On Thu, Oct 22, 2026 at 1:04=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/21/26 10:41 PM, Rob Clark wrote:
> > The generated headers contain the current (at time of generation) hw
> > recommended values.  Using these directly makes it easier to stay up
> > to date.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> For context, here's an LLM-generated change summary:
>
> What changed
> - RB_GC_GMEM_PROTECT is gone from every generated table. That matches the=
 code change, which now computes the value.
> - Every generated table adds GMU (GMUCX_*) entries, and most also add RBB=
M_INTERFACE_HANG_INT_CNTL.
> - Several hand-written entries are missing from the generated tables, for=
 example RB_CCU_DBG_ECO_CNTL and UCHE_MODE_CNTL on a810, and RB_RBP_CNTL an=
d SP_HLSQ_DBG_ECO_CNTL_1/2/3 on a840.
> - Some entries keep the same register but change value or pipe scope:
> - TPL1_DBG_ECO_CNTL changes from 0x10100000 to 0x10000000 on a810, a840, =
a845 and a850.
> - TPL1_DBG_ECO_CNTL1 on a830 changes from 0x04000724 to 0x720 and from PI=
PE_NONE to PIPE_BR.

I've fixed the PIPE_BR thing.  But there are still a few other issues.
I'll drop the generated nonctx list in the next version of this
series.

BR,
-R

> - PC_CHICKEN_BITS_3 on x285, a810 and a840 changes from 0x500000 to 0x400=
000.
> - GRAS_DBG_ECO_CNTL on a845 and a850 changes from 0x01000800 to 0x0000080=
0.
> - UCHE_HW_DBG_CNTL on a850 changes from 0x01410000 to 0x01010000.
>
> Konrad
