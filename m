Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706375;
	b=MeA+chp8ZWBwX3rS9pEm4iEiUhcSWv6fTdR0oySIFbzlT3585fyVXN/SjxW9tuGphMbc
	 C84USkiM3LrHJhQb9Q8Z7l73akE6kpn2hZv/zFI0v87WRFhVxcMUlVGFqH4JkRWc7BiNX
	 wH5i4wLddx2Z1/rjaio9FcJqoei7LGSrp2nU4jsZUgfJNWnnQMWe4iQp01FwCQTRq52OD
	 zDtJ9GFTZrwqDGe28srX1NN7r5bESC8RfnuqWbly/Z0H0AL0CHzgw6Y6qydzzFgMGxeF6
	 LUvayyXAigWstJLJjulJCs68iHQ00RjN84JR/mKzxGWRmrSjaMQU+6dCTNfP2A9lfIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
	b=SJ+/EY+UgznLKKIq/T/w22TDZxqzq7PV6w8y5Wa3R06Cb+OuhakWdVeVXSjdQfWH3LLu
	 ZGUQOmQvDH2WPA2guafhUcGB0nlNFDIuk5nP8c83WUwGdgdPD/VLnKCQRQG4h/w9X5jCr
	 WRUbzhp6reyS4vlEcpFUZZOkCQwL4+o3ggcC02srXOvwuXVFJYdl5+6w6NesM5lPlPTSA
	 9744OJf1HJpkd/wS6croJ3noAIPtVZ59YsE5+KSq8s+ptuqTO4vpoCOe/M7O7yCQKZM+E
	 12/iOIBjTMi2TBi24P7hu2lA0u1h/7xMbwNpA0c6+gwuXu7fJFYpSYrnJ4zASeqNRxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNv+liRd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ftoir+xz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7FE606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNv+liRd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ftoir+xz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV09H3170234
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=; b=oNv+liRdPWRzk7rK
	SX+pO7pgIIJjFDFa+PF3myfN0YZ6rg2AR3lgRV+jHmjfm1zNKUPoKBHFAAHfd1Zd
	HSX/q6jqroDN6gPuDT/7qWt/XqcAWdq3xguWUQGP6dnEe9KHJb6VvPG/u9xyvTEs
	p++ao7NxFYT4t+bfB9eNvIoYBQcAkKPNJq3u/l2XS53gMz6CPmG0dyJvKx8ZrFpL
	97HB+BGSEcNmHGOaGDEt6NqPAB/OhIvYX0VKD6+8BCvQaRpeAGHyEBZ7DBkE4aJK
	nQL89ORA5Yz+lKuEHnxZOJBCahN8UGCZhFUuAahUiEv6mafcOSdIyMGV/4hxk9Wj
	PdRlvA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbfk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:19:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92110774491so7353216d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706373; x=1796311173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
        b=Ftoir+xzTMvjPtabCf9EreRqC/3S0g1q4NnXpENgr4w/+cD5BhrooDRkxaIlhaX9la
         it5C3to9G5QmUDGbDTotxErg1gcPcfb+9pir9wxrI+e4u9ZoNAuKRvuQbvCO6TTeQ6yM
         fKOee2FNhHAnHXj5GBLvfrWscgRI34FDI62+nL46UloIX/hH5Cc1F+QEQUePpzqH9buL
         O6RrnVHvLnYMDUcyANJWyEUEBFTTfM4MyItPUkc3qToi3YRNeBSiMDihep3cYoEUIdKb
         guzNAJOGdkvVIMNlneRpDaKAG1i6fHzORZcFVb2SBmmcU8ENaq/yeYfuIwDnUoFQAJLO
         Gyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706373; x=1796311173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ex2uGZMaTo28cXK9e97FP9eID3+hoE7u72R6RyiD5yo=;
        b=IZg50DKFl8WGZ5Yp7cNIv+Yevfxx3qJ/eam9E244FZGREpayKbFNFvUhQG5Tmrq4Zb
         HermqEqgr4/QMLR/P0WXnL7vtlfgf8bBQZSz+QgLCAVhXbqwQbVI5kRMWvW8XuPkx++y
         HqZHya61sAp8Ak1MjKBAh5ljhlg09Fd8YEi/2m5eI80jg4BriAu2VyNBBazoai7MFJWU
         AJOVs8z2I8x/6Y9aPKjOZmofHJXc3F+8mqXTcfglcMK6Pa739mQVIbi8bJrGhpZxTqhx
         gEG9IsP5tuy0b22nHszf9waoEJmubGtkHZmiVP3X4y3ptsxbn7c5+sbudC9B6PlnnPYP
         vDEA==
X-Gm-Message-State: APuU4Z/2XfLo72jqlGLqk2hCYxuhNkZ1RlnHUl5gH1XTZVjxV86/Zpbo
	0j/BpJRJUC+m2rUd75GsYUtKIazdelDtXitX3Aby9v0WvMMaJkf7rb847Ky/wGyfQKnazgFoiZF
	LcfgzCGah9+Jbx7Ez51kF8QSY59lwa0oaXak3z5wees1O9EIITVCT7mmfzejknceuXPmd
X-Gm-Gg: AZFdTZfy4yLHmffbbKuwZ/RN/AJFau1RD5U3r1IdEiaMG2eBOa2q2a182eD/ts9MBtS
	/dVtIMurzDXigAOD3HMlLIq8jW+fXkKgi352W3W+Vzkfv7R4gRzYYOBhy9ZE/TK6lVXaXR2qv8u
	yL0yvxcZjwvmoqzz9Wcwd/mXYGrAaJRzlIZQBDH+DllMjiF+FKdko3Tz8fOj32dQAO+vy+0+Pg9
	CL2cWnXNr49rD+RM7f3BsO1xu2n+/D5OSHgv1Mj6BulGb0sdGKuDcBb4ge7OnQYPXQm8V3EDrAD
	0fW2GIzzUlnLJIl2uP5loAM21uYTiMCgQrRU4izetikne5eT2i/dZgmoQe6W347y4Vp6i4zr0kd
	kc4npFYtrkM4fwimdDXcdxeWMACwiqrXXodg6jgCM2jn3PRxFrM/a84tau/SJLV9zyAKmS/I=
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3391367185a.3.1795706373555;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:a084:b0:949:c973:1372 with SMTP id af79cd13be357-949c9732a6amr3391362385a.3.1795706373059;
        Thu, 26 Nov 2026 07:19:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm9867226a12.31.2026.11.26.07.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:19:32 -0800 (PST)
Message-ID: <330a5417-a973-4211-bd57-c5103cada03a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:19:29 +0100
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
Subject: Re: [PATCH 2/3] drm/msm/a3xx: update the CP protected register ranges
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com>
 <20261111-a3xx-fix-me-v1-2-d81f50f1ba1e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-a3xx-fix-me-v1-2-d81f50f1ba1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dRbjKpih4--1LlONcOpreqlvMxlmDtbn
X-Proofpoint-GUID: dRbjKpih4--1LlONcOpreqlvMxlmDtbn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfXwrRVYh+SD96u
 0twk9DYO0izR2M68RYc/iawu/eFYG3rEmiktiJP9zl/bdWF1Rmv/rTsld24086BThFHOfxRVQCv
 f55lBeMQ7HN69kbk6uAcg6aoRjIvD/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfX9Cz6b3Cur0v2
 Y3GrvQFBSWB46cjBZuRqh58k4DMtnh05L9weFQxtOSwl0U3KK+I36TlOS2yYA8q+e5MqHh2geEK
 IRr/D/nUvkXAGVBDz1eNreT4heIPVHeSombVkSjq7xb0oVVM/N60jEkS4x0oEzNRZun87rN9qfe
 q8BR8UzkB8gGcsnaTqL7FZLFgQ+b5Ly2PmydQ/qyj9/1KNhGq9GNr4F2tFpkVrSCUuaBikoNZUY
 na+2LQxEx1Y/HbjYeZnxLVeE0aMle475c3gbaxQf7XuzcJBgw9HI93tEqdJy2iR4byd1+j54yeT
 XPeDo9CnCbygs4bKUL2aDuWzz1s7N1KYeTnK+8Bg40JZbdMg2Hkv9IKk3n1p5zzIffcasN7/Z3r
 n+tn7t5wT03+JAEe3hoiuOqRvHCCyVplZqPniXk7ZaHhwyCcAlVY4nLsTlB9Ah1l/pMvduXYmrE
 DWXXdkU4qOS+K0HFOJQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b084e06 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iDjXRScZuT7tmbgFxAoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On 11/11/26 2:05 PM, Dmitry Baryshkov wrote:
> The protected register table was taken from the msm-3.4 downstream
> driver. Update it to the ranges of the msm-3.10 kgsl driver, keeping the
> wider 0x100-0x13f RBBM range and also covering the VBIF QoS and AXI
> registers at 0x3040-0x305f that the driver programs.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
