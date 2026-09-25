Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7848E0FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331589; cv=none; b=euFypBjY692CO9czMslD1q6s/DZhIi6hERfI1nnxeQ2DaW2ERbuGKcCLMDG+NAexuEe1LbziFISoaTgHK+vb+agz6KFj98gVFnuCc4t3DPtjcSR+PD33WGIzDYMOvkRwlYVm4iJvg5BwuN5Xmd9stm/fqA7f5TscyADNRx2gam4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331589; c=relaxed/simple;
	bh=JRFfmUzA+SnkmvIL77q5lOVN8GiVOkN2e8RTdRhku24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URy337dX68a0ptB71/hgrs9y4G4uwFzFujmtczKM8vnUTkdOHHbk+6XX40xStsVYnKPjbVLEHsGlxKJfkuc9xs24qCSMdPvtZuvcKAB1slxdPw/Acnpb7CCLSbD5g0mZ2z5n9tZHn+MB1JSWKudasaXm09TLto7ghpK4W+eYKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c82dJQwg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk7rqHIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c82dJQwg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk7rqHIw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA488d609035
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=; b=c82dJQwgJaxCKTLQ
	CGw5sM33mKWVibfXzRzB6bWaocYOcqSmaYcVUlPBOU0Pm94fs7khL3sxTkhvXJTV
	BLp3ZpXhyaBDqLwoBcrfHwsONrcOpzlP1kq7itJ9eSx/8ijg7DcXP/kg4s1h/SHe
	pZXE0uocI6UGEPncqyxIWEXqnBiT0QQDx08cO3DZ5JDttsikTgrY5z02mhWkz0Z4
	LcpFQwElqmek6P7cJGMDYcJv9YkyuA+5wCzof2FMhJp/3EtWavc5uu7McB3T04K4
	Komc0yVLl2UbC/QcPOjUa2hFt7pXOY+e2K0IugK/yfrJkgmc/rnKsZmuDFZH0kLM
	iZGhLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnr1gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f4002c1aso10606485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331586; x=1790936386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=Nk7rqHIwDlvcucwdMpV2Qlc8msXSyqmelk6hrWrg0KT1f6Iml4n4V36/pQERY5W7P0
         jBs1x0NoMj2dNv6DiHTBvJZD1CcE1Q61OdrdqYyA4HmYw5QjmgVi6PzuwE14VVrHranb
         n/DLp17+uu4w9E3R0T8Qg6h96xJX0uQXDc+3xaJx8IPcXNYfPf0M9uLbxld6tyszQ5O6
         arHTNwWxjfn7KQ39UkvCNaxbXJTucxiIh3MG6g+0OmY8rgzbZPn6oRvns8KOb4Ttjmgk
         ZS9YXvGmxlivTuANXBfLtXuVMW1PwiqyMhVf38qr4JXO/HKtNxzuuY3aaCieShtOnRa4
         j1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331586; x=1790936386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClUZQgHA+YXoNCn8HMzXL9kMN9fbDxeAKcAHr9vfWms=;
        b=m+Pi3gDCP9OHZnpE6nfTZRcvRViE3PrGlVoZsrRysDIFg7ya78EXDGJw1dglylEnJT
         55S75/zU7wfa1GTS2x2L9MXfpcp7lAOJewZB0/6DhWJ0dRZ8rXBtXVrNsyJLjoaDe/Pr
         SDOGnmzr7925spQIEga8aDIRXvyVDVgXF28QpNvdUVUWytrNAwI6WLbAUqq7LZC/9KbQ
         Jq62pYsAg8Zih6x2HmUb14NhOr0WTkOupRBebn1WjEAPnISsxqDaB7AH5B6Eh9t+OqyV
         nsXctrOtB7mba/HenqCghqCKlpCkodIY0i+sU037jARMAZZaTSS403NSnv111H1BXiGg
         qJ1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/8ewyjaP3qQuOfJT/YtAxhSGu38t31zTIH8rmkWlskWzKWoE9Q5HWXjFnBzf4rO3bt0EO+eazeML4tITO@vger.kernel.org
X-Gm-Message-State: AFuF++n5B8YCH/hNw5MwTZHlnxGpo/EseCaFGlcu61467PU1lfN9G3a0
	yLyuZaDJoJevMzPG9xpGmqdwmwBY6pWdlsSPKitLaZXoVjY4C+Zbbi/2oTKyliJwBmnribm59Zr
	oH3bwqx88xDuDN6NgdZK8IHkyl+KSQgCalqr+HRN31oH6c17He3dmTjB5c4iK+bTlqRvH
X-Gm-Gg: AYBFou1ryD6yU1s2s3uVAbeyf8zhNPdyGlEhOij2VtZ2btFxFO/lj2WZ6edUdNHhphH
	ZGS8GFiI9SGB7du8MLJtVW5KyWvENRazjSbBaSXQmw2i/biFcJyMSldGUlTQP4phgdS4Ng/R2XM
	4szjtERkCgDbynqPUO6+l1roGo/LlDfGIKDEcX9h1bRjIfbZZpSyMs49sgGSQANSu3/BbGalque
	vzpd3ECRScyfMMO3yLuVS+Vdv55a9FdWr1Yu266BBJ/a4umbJUF9m6VHRpoIGypcgZ+8zoMlmdF
	bk1HFVjLK7Y2V7T+3S4RYoEFa93HIZMKcjB5EHMK349nVE956/pv68vna3C1R/MH7KY1+ACN+6T
	XD0+6Na+IQhorRNRttZkQvA==
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350438385a.1.1790331586137;
        Fri, 25 Sep 2026 03:19:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:93a:19cc:107a with SMTP id af79cd13be357-93c43b941d0mr350436385a.1.1790331585697;
        Fri, 25 Sep 2026 03:19:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:44 -0700 (PDT)
Message-ID: <6c8c9823-4d22-49b2-9c50-476f61110def@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: glymur: fix Adreno X2-90 GMU
 compatible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
 <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-2-0fa0bfd8d315@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c4gSIzDqQwievvhaCBX7iCZ8-JHwiGMa
X-Proofpoint-GUID: c4gSIzDqQwievvhaCBX7iCZ8-JHwiGMa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX1YiSWW6UiE4e
 jZQ+vIgSTdW5vu0Rsl2v1LuoURuJtMtsZ/vVtAYcNMfaPmzMx60HaA/nI54WWSLZ3nmhShRQFr3
 GbAEf4qviYPwCFA1Its6jdB0Ivi7Rsw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX+fueZUWS+So2
 B8UayH8kloc0d4CaIINPYX0iygoyypSvcQeCG4hd+pSPetmyJCio0/nutksB6vogFPinBLL6/bf
 KPDy8Uq2bzAVI/erGjrbVY8hPAIV23uWt2Nc23+xPplb2QvtFM+yhU77UruSekyaHBGqtiYW3BX
 qpy1KRAsZ2WoRnGzd9c6dj1Y/CjrpfJh5E05Z4+sPYaPuZHaYZ3SxgJOf6TGJirr20S1224LOGl
 XbJ20S782qzFXSQ/XhqHBIVboXHEHSPpBKnzLhtpoTBjccG5ryhCQf2yM0HktETII5vRyHZ9LJd
 KrETo484ww1R2N68TSeB0tCoTPqGstMbUmcjm/kCzwELzfFaGZpvV/W64QgAXls/yD+EAO/DbYj
 tYIJO/RvlGi/VITBaGtIZ9G94CL4mA9m1rQYwKa606QWMwm43yN9L97wwZhXbSpbwoHNhvKqo2S
 mJI15++gw4p98dbOWPw==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab64ac2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041

On 9/24/26 11:14 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> The Glymur's GMU compatible was set to the wrong string
> qcom,adreno-gmu-x285.1. Correct it to qcom,adreno-gmu-x290.1.
> 
> Fixes: b6ff8cec8aaa ("arm64: dts: qcom: Add GPU support for Glymur")
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
