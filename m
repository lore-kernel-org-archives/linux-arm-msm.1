Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365744;
	b=JkPAomtpPrOVZoVnGCRFM7jc3nq7opnrKboyifazcwD0RDLQWY0Ume2+4pBKpVpeedIO
	 UYbuCMSVPiEQ78PDMJCGcify8R7kW8LVohTwMfih5LEIlaDavc5FntfVz77l60dyoKfxJ
	 5wCj7VK3v2jseQf37piHE6Pk3upUSSnJemJGQjv/GM/C+JZ8HLFcsrGxt4LBz+wvTUGaJ
	 VRsyjxugRHDIkgc+is7T5pzng46/6aTd63CCjWSOYnXPre6d6qJwUgzpCMp7kwJnQ4qg6
	 6AbE7njJ+LdVt6zcj9O3dXQn8P6vZV/n3mZfABVvXhjVZmIWv1RilZkrj0AvQQq1feQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
	b=fzoGw8ijAssCMcZTODeBumNUoumGQOXtTnmZ3fStC7VpGiBA6ZpAbDHik2xA6R47Z+ws
	 ZFDQV1/9xkjFMETDeOpWfccGc5xM3QLujXAhTLJ3afDU7BTAPRIEyY2ayYWvPPwJqo85O
	 ovunP4e3t5luxD5xqmh2KxDuzECNdBCRHkoLQFNh8w/a94crKz1UQ3RGZQIZJe5qxCbcp
	 Su8T9dzr0rYIK857UkhBow0Opsw4P1U1nGL9aSTV/lxuqjp9s/s3etO7aTUSY3reReCfu
	 LVBG56XADVMYGtGy/aTZxIzXaXkeSib2LCxFemqM2g8FQQcJvWDVzeQt3OTjhMKgu9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FffGxu6W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE0606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jofX2PlH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FffGxu6W
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG88T3719553
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=; b=jofX2PlH9sK44rY1
	hTJwH/V8S1h2Ehj/NWXUdY64MVX3m+B7He4PrRq6Yb9Iekg2dQxrn0HvtZI28zJ9
	RRcY15pL9JIX/ZRIW1lSCPl2zi8c+svbt1KdqyBn7OuE618BEsyNZA/awYfXJfHZ
	x394lXmUJwAi5oWW7Y3mnrQb4mhpf5ALmAZkfuOBe1PS6soxP30XEchqhEVQXb8S
	6wfxhs5I3ebouclMOJoynZoJ8Lm7FMseFxIg3Aa7qkHnSU7I8HOiGB0jkDZ1sMbu
	mKCDKfioiruMwPg2jwuK8B5KLaUXuIWmy2seuAdgtrA912gg7ClcJYCBdXlsoH4r
	r9G6wA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qu4ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 13:09:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988b6210181so8748241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 06:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793365742; x=1793970542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=FffGxu6W3tAZ/m/t66B5cEPVM9cjDgw79L16mYE4MihewQotjdrJaekjnYVUyRmmv/
         gLQ56bW+Zi6TuukeDrE5SbD3BTw4/g8/8bhTaFYwU9ZPOGqSxO8tvb7Wacv4NNvJUT2k
         ahm9d5ThMak71vaXppRhtkeV0rr2tqQixwJ6ka/twR9gPQC9pT0XdRrZQr+NuslVYleC
         2N3vPC0qT/mfg446AZzg5mitceHuW7+8PXDu0zHQlHJ+ferdIj8/m8K+dViVf1balmgv
         rn4U2tGKFdNmmdkIKmy+te+a6qMiRs8c1yGBhj5kO7zvTISi2HoYLbgLZ8y4en1blRif
         BXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365742; x=1793970542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4P301YqaFnb7KKDE2QgQixMk0k7HBc05iLOcpHCCho=;
        b=cAUR/GVJULOcnsCS+Qt2kzWnHU04JtDpSSZ4XVsZqr3kJr61W/cYfRvb4Dmx0uw+Rr
         sHcZdfv6WCe0o1U1udQlGVPJ5bgv92sWQ9wZY3PUnda8FDV024QsudWsZEBKAdvsX32g
         FWQMt2l+7mHiw8F488pTL1PgZsF+Ik4by19keH4gBlVVvdysMLXKc1+sL1tJvTi4E0yT
         bMxqZWMqtlIqhWFOcxGxd+XkvKGyYI+38MFFPRlWGYBm17VQihsTcBvYA1pVoO57NBv+
         Amiv0oHoG7XJhbJGQb4tlUFsBg7lVuVgffvKQaEdLsZMVszQkWMS9hAvAI+97z2O+Fsr
         OjNg==
X-Forwarded-Encrypted: i=1; AKwUvByphyXWnVobr1Q0Ip01Dl+nuZFxI1NNG4ldbPw1vQKsT8/lmk+oXzBjF4ErNdYzZIcVsTc+aHMap7Rp7CWq@vger.kernel.org
X-Gm-Message-State: AFq9FYK32bqBZ4tv2fY1XTg7yQBtF6I4m16CYCgTLzRnT4E64nD0ORsG
	qDBi9+E53VRWSIXGB0Zn9HN/00jUgOYnR2cbg51ceaS+lVtwva8mKIiL6VFOfAzDklbCiOSCNNL
	B8nE8gzSZVAB+tW4f7AVbJZb7RWobe3c0bN68TOF5wUKs4HgXzikgmdjBNyPjngZDdYCF
X-Gm-Gg: AYBFou2s2szsEZeOjMixUz5/xk0PHdMhHy6hOrGlhUSq8bqV2N+g/I6H5VteP8zP4VY
	im+kwnxEdPUDS/tlERcdasX4NeFe/J3cjww0aOnyS49+dF4BVPPvwHNWX8g+U9yIj/j0upGk/O1
	WSdqsvs4zc2DBWVANbz9vaHKra/pkYBWaSKdPsbM7d6nKwuGcHa0a2i4Jih3T7Fz+rVne2Tv+rB
	Y/IBTfzlj8MDoc+M5OSFu3x6mcD+GQJULArucN9hvaH6e3pm6GkUwtUtt0CBxbagf0riwKv8ZCU
	lfyW5yxq1msZnSx5o7FvKQZIZ27faPsN37o4GQQX/LxKx4RQvYvkLTZK9UXyL/RTj425/S8XbSL
	6XFIpPDN8/HdWN8Pf/EtxqjqteWRtPfq7M9rEhCVrWtqgT6CX3YK4nYLj7kqnRhtyI7jJwoQ=
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802577137.1.1793365742009;
        Fri, 30 Oct 2026 06:09:02 -0700 (PDT)
X-Received: by 2002:a05:6102:868f:20b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7d0727a54dbmr802519137.1.1793365741491;
        Fri, 30 Oct 2026 06:09:01 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7b01b5esm605327a12.20.2026.10.30.06.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:08:59 -0700 (PDT)
Message-ID: <3f11cf8c-db2a-4243-b1f6-7f2cb9a7a87e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:08:55 +0100
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
Subject: Re: [PATCH RFC v2 05/14] firmware: qcom: scm: Configure LPAC aperture
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-5-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pLhFVFeFhOSMFKcLef4Uyg1wOgvqe0ie
X-Proofpoint-ORIG-GUID: pLhFVFeFhOSMFKcLef4Uyg1wOgvqe0ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfXwKGZxNaYkUMc
 Uuo6p+aLlYGkq7Sz0BYhKcJkXaKmTng2MPysHjSNN9bEhD/x6QiI1bRXtpm0uySyHFBDHhZDPxh
 aQXMohE7QClEhe0eR7ViQdomATEutP5n1JCWomuVU+iumX3jUqxzm0Eva+ktA/OhVLOyzZr1Imp
 JNvAci67yuukbicx8dI9D6o9UzeiFD2/2CgXD1mSxQXF2sxcGrQSz9MxbV2QnaG1ahS6FNfWi/c
 Akqtsi+3rMNOTXRlIBlT8ZwxYJ3gPKaJiJcUoAEFa/M9gG8V8NVY6NGipWWumD6SQ7pe7u4A6/r
 G+KuUWCmlbrMnbuF9YoiJMkMtTlendE39p4SOwGojcD/Nw6DLZFXSY8Qsw6x9nzT5zA8hkvCO/a
 5MlkIg0VRTPVswPUFesgRjLyoQvJJf9oPDofWNLTAnJ21WDoteJWy2+7V+wnTJwixlGei7hcU4t
 CX4gPvX/BSdpHEdClnQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae496ee cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=HiRCik2jR1DMqHai1FgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MiBTYWx0ZWRfX3ff6G/wZnuxi
 3yq9wPBg4YShxoNa4gxB9SAHrpwvii43ZylbskPpUjHUWYa4p8ogbkrf/naAIT9mS/XYEJVLNxf
 xEYlfHSog/cxv03Ugtc7uxzmGWEa5lE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300052

On 10/29/26 2:52 PM, Anna Maniscalco wrote:
> In order to be able to update the SMMU registers from CP for page table
> updates we need to configure the LPAC aperture to include the context
> bank that will be associated with SID 1.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c        | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>  include/linux/firmware/qcom/qcom_scm.h  |  1 +
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 9b06a69d3a6d..92093399f20d 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
>  
>  #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
> +#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)
>  
>  bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
>  {
> @@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
>  
> +int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
> +{

Please make qcom_scm_set_gpu_smmu_aperture() take a parameter instead
- bit 8=0 is QCOM_SCM_CP_APERTURE_REG, bit 8 =1 is
QCOM_SCM_CP_LPAC_APERTURE_REG

Konrad
