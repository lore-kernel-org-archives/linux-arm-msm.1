Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619214;
	b=y9WoAvvnzhUmP9X+yGDabZ0oJeE6me5bSId4P1Yl12VX8qOclVcuiWUwAn5TgG+dktas
	 /DWGGLIjPa4z5MZc7mUHv26yk0wWpEOzDLMm1syXDCvtcav3Z2yMYoYv0Z0Cgu3xxFpFC
	 mNgvFFxWTHmyut1qGiQ6F/sl4aB+3C+uGSbrBv1hO8mEmB5QiA6/T8Nja5MJUxxPy9QNJ
	 ZXDjHiyaFbNyMKG953N28mHMVvSBib9GpjboeN2alYsmIMmPR97k7EOZJgZCKjHXumQE2
	 QYrqUm6H3+4vJjmBi/w3T1UHa51065c8x6//llEpmgCe9qGOdQSXaXvwwZAC/ELRT/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
	b=wX6v+QqCLpH0M06Evv5QBmsqLa5P2YuRmIpAPODo3/51b4xK5IpUBTS9IiQKPrCl52zO
	 /Y1Yv1QblrWMB8IQOm788Nwj12cDK5lOTre9RBL773VjDJ5Z5a9vG0yLXj3FfCFvnwyTL
	 jyMomKPOK368vKB7+xmAZmJ81udRTGAcY+6dUu5q81soN7RrUNw+7cPYLrMnKgsHX3L4Q
	 xei5K/gYb9IzaLw6rtHDdobQQJjkrTNUZO46Q8B7VyscEq9btG5ozYWeuM9ZsUjq9116G
	 5uYMLG1DGq1SyVUPu18Xe6oFVDzJCuAsuIlTMxLWlQvXXIKG/ZSR3+EjwiXevxZ348Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXmnZnFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjZWBS9u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07A606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A07A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXmnZnFm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjZWBS9u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2rAh076840
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=; b=pXmnZnFmxKHeP8NA
	YIKHDSfNZ4enHJuh5RwRYZwP2wQVggeE+7Q23FOkLyY0n0bm/kdwH0iNLQWAfnwc
	F4TeN748CBkjapSluA13Ay+rlQbI59FPWrRJaDhyAlE+vIIy1TEcRorVAWA23ID/
	vCytx2Kem1PkdzI+lPb7JXR9t9vrHVpfrRK2iUOHSC5wKT6XBhz+pmvXYkp82kl9
	3UGLqASuOJrf5ByDpaVjQfhphse832EAe/R7ljnVapJxInTtpLQCzkLHedmrHQ3R
	FvwuAKZlLkkzfKHRjRKeDecR53LEz5O8CYmvfhQDrr393nWgXHIfPQBP13zd5Pkl
	8grj9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r3fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:33:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so54602585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619212; x=1794224012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
        b=YjZWBS9uCBB1tGRlwS7qM4nI7U8tAJSBMRQc8yIENxk1zYO2A01zGqZL9Q9MKYjcXu
         ELJ0nqm0K8tdL82Ml/h7iCnrZaSRk5tM+jMTSNcVy39pucmqbeDkdHz7ft863FxxkhZ2
         5uOI7SF8krtdgSRnYUNoXF2TQVs9Nysd4VlLLX7SEdecggTA5cBMokKEVYCtBVd9yQIK
         L+zREm/+VdGF+KSovs8TFDl3nlIMdXE8LtOempQx+/W111zipvLDcskZsbzF9qPGvBtZ
         AXuFihGPhVnOXmBws6ycheF0OEzIB/F+SGr6IHIGZGio1D3sY8rpw73oodH6bMxJuq8M
         mzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619212; x=1794224012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eApJcFtpZRdgO9B0TQZd5jM4n5PQ6ew8DlGPQpAuDI=;
        b=d82NfpnFUK7rkbnGqeLeYVIlAqZQGE+d9ITuYYvGcVuHtQUTVtxzDwIXca8H2yFm1m
         eC/MEihXDUutyjUXw9Roqw9YobsQdny2+k0EgKXTbkpyqxB7uYhiIuFk3GDvbA6imJ/V
         Uzz4sophs0RwXDTIz2MgK4m4BvE51P9VbL9l4AgJbHuMCILcJuxDAe2MSzjp+o59udhP
         xrd7YpBcMUrTUIvBgVmZp3S2vxQm8ohSXRySEKtPyuMqhJApy2qVLz9Qe4G8m0U54Izm
         2F16DHM0Q+Tx8db2wgYuomm334jpZ/l1B66q1g0NIY66n19fohVEQ9NDHVxzrfjIROad
         Ct1w==
X-Gm-Message-State: AFq9FYK5e2BZ/2r/GcCsyxKqSn95NF3a8HuaHzD6SNXAtZjIo7gBf16M
	Ci6MMXw0mWvIa+gz7Kwb0Ksu5uzSClV0c532/6GMS4CFzbDtFU5Sbe3OWWASHuAXUbHTC1ISfil
	lm6sNp2+ykhPwjwWBGy5uKRaS1i5bPxIPYksmR1LVpPX4mX6N0b7Ojlz/HK34G7/b+ik/
X-Gm-Gg: AYBFou1VmNtjf9ZjKD5SJqRIX9zaYoqqBjm2hHQtI/TTxUchhnOpcqZtlt/SA5cbJIi
	faO/EMe053CgMQjS/GPeEV5bDE26MxJvMY0LinsvfMYn6o/PvN9iG1j1yqNz2RAxueaAB7x15YQ
	Qu7yYxLK/HoHxsu2hRmmZ/YmPOcnpp/q2DU9jhs3IA5CwqKONQnPnoXQPrPZe8tt1BN7sqYK+vP
	u+GiluxQNuyDd7NN6zKsE7JkP1FPK3LNiGqyZmNcqVxr1vgXzAN/PjS1uO736s0I82xnhg6fzut
	d+NVJRPYLlf6cLB2aoh/z0qxYaGUiuJv8Y3tIVZDXTdMAG1mKiPLtjXfSvXsDvj7J9nFF8ivnsH
	CSMTBX8tkukeqmQoeDvc1yfRl9KKgBMla8iAPMn/UaFkHHvfrFnEvY+9Yeg3CaB/Hfgf5d8s=
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr1504794285a.0.1793619211485;
        Mon, 02 Nov 2026 03:33:31 -0800 (PST)
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr1504791385a.0.1793619211088;
        Mon, 02 Nov 2026 03:33:31 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4aa12sm373481666b.52.2026.11.02.03.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:33:29 -0800 (PST)
Message-ID: <fc2ef1c1-4132-4060-8a50-3fc5ac4c301e@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:33:27 +0100
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
Subject: Re: [PATCH v2 2/8] drm/msm/adreno/a6xx: Mark cxpd device_link as
 stateless
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-2-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-2-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX2cSwCrFa7eYV
 qIO3/xYWjdrBaDiUE6qvV1qcMuT3EbwicFvB3WDjVEBr7oW9fmAtQTOVg7W/Hq0mRyhr4dqhd0F
 YMKq2JYjVbv3GYa6nkL4LT1/Nsc0QstTYbRW/v9bqbYzlRrLaLux4HOcB+7bIg7mwH8HwuyuYHe
 K+ZJmxp9wukPCneKA4ZV6VSx8q4Mhj9Zv+uHGA+TUCh0WztaHrCm8NQ9zNs6pAScupeRktdTuL4
 RtJnWp+Gv0UVNAXQgwgPWSmJ8Lw6a50xZ2B8C292tYol/nTfwU5JxCeVXbGLNV4ktZkcRxB2c6g
 fhg6pgiAfez1M+aqx0uKuUAFAKLwfF2ZzvFBk/GU4yyVfriFEGJcnWdX8q2lmGOVv1HGx8HX5k3
 3ZO95zo+lbOtQ3H4WiPavyCSBRcuX9x42TqkPHwPT8EtzVGU4nXMbCDq9+y8TMchBIiuuD/hI29
 4jYvPjmwy/+6lWkZ8IQ==
X-Proofpoint-GUID: UioMH1BQIcO2XsZSvsO2d-N46jgRGbKW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NSBTYWx0ZWRfX67VfXzKNfZYh
 JcnhRZqcJejmGOcexVChUtD26u3hTlNGdMcZzsiZtMCCNlyHKoS/5yeyjVywj/3mVRa027QOVoD
 P1MR2V8U7BFwbYrYdWT/DfQWaWj9+mQ=
X-Proofpoint-ORIG-GUID: UioMH1BQIcO2XsZSvsO2d-N46jgRGbKW
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae8750c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1r_rKV1dNJARR5MeNUoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020045

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> Since the cxpd virtual device is a driverless device, it has no real
> struct device_driver bound to it the way a normal platform device does. So,
> the managed lifecycle doesn't map cleanly onto it. Since the lifecycle of
> this device_link is managed by the msm driver, pass DL_FLAG_STATELESS
> together with the existing DL_FLAG_PM_RUNTIME flag.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
