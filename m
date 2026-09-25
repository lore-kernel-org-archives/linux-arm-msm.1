Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B302D485505
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331580; cv=none; b=Asx885VVPuEWH+5Z/7KTqst9GiOpbtsDmKirZx23DAK9ML6HmjONVJVq7FAPqjeJJZK6bNyVVgL18uBy7gIjheu5/7b5ZDQs9pVycwKPGmUY/zzf5Kk/dIvu8mPrGcM3+LV5XOuhhEhM6QlFgTBhNKSUXa70qb7kafDWvT4DBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331580; c=relaxed/simple;
	bh=kuiriOcwrhUBkH+cFmNQEkfBDUUYBrctQFAqrwLNkHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W0GSUv2HTGgHOFbssCXj2U/fgrJlYCqTiLJ42f1Js02kf6z5xIBR/c6+J631Q47w4n303P9XAvNDrdHRhFTiMJDxPvEJM414QKGwZwOD3IZnlMJh3F4uzuPSzascCw9uQLnLWb0thEqGFT89iWumVHHVGLlPIwmcCqz/mVZBx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjm9Cc0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMP+L0xW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjm9Cc0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMP+L0xW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yo291194081
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=; b=hjm9Cc0kwqVAAJaN
	byxMTIXx8CjId+Th/N6Jj8le7ClwnLsiFbz4PvDp5UJbOz6toe+q40WkShgffNwA
	GEPgdVK2lisIxS+alfZm3xb57By8QmZpxIild5HuWVc9pEVxncz2e4ZFkIFbXpBs
	gzDjZClF7t0IKXHTaHZxizpVW+IhgPzGUw/8UHNxt5q6aB5W9tP+dnTQyoO1O5V5
	2pnhR2NH9FHnHi5z4C/E6XFmFwOEiDbMG3YuIRWk6WJ+TqYYPOVoDhAmWmYerzpm
	K0GcMFGuKDbUIWKGla75UTYOV1IbPXpaCsS/0TXYkrELP0exuc8sZsjVFCSiavYH
	EoYcJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874k107-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:19:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so20319285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331577; x=1790936377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=GMP+L0xW1+U3dWs/2A+u+9GeO3Oa9YRR5YqjGaO17naTbyXuJUeagqoYhdXNlII2yr
         Pv4TwykFrvwYJIixPyghWWx3R33Q34Omo03zkyD3swtLOwPlU033TdHo7QBc/yapv840
         utlObM6+2VlU7pPTuvB1kM7QgCPAM2GFE6IvHVEQtA9kzdkX+myTVe/I0SdCmNZRG6YL
         dNOpUiNxUiBPgEXSy3g5mS5X8Rvt51pdxVgYKHY6nr7ckaFZg/rtIgfqEIZBxuJIMrqW
         +fy8p9rtY2VsAyt0oFQ3fIXQtQDBK3JjpyjUUOb5f/F7C9qSJ3+cchRdezKZqGW0xu3x
         E8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331577; x=1790936377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJosBlRsssotpYc76/kVdKbiIQG2FpE3LuJTADYjC68=;
        b=S53ukd3F4i23UJwM37/fb+3TTEEYyp+4pfnqD6Dy8HtwyMUK/Imj4aogvRc2VIOCIM
         nd1nLuMIwn6/J/+ES64lbYXE9QiRL3SkjGYTuXyZQdJbQWB8qbNvntvDVukd64+GRobG
         46TU/CXI26ElceUzshORxbAYVQ1+wlk16vJZQjOM25EiB6dod05MRGcr66UFDbOgsOPm
         4Fmqg5MlaRNmdW0aDaJnO8wRV7DETKYAY4DsSbB0CP5/kRUgro8Um0B9jKpgjMR0Pu1H
         OJlt0YoLrqCgQjP1czNI7h509/j9GBWEa7xNJFBNJs2sxoXWTFBimM1rrjZGxEIL4pJK
         jALA==
X-Forwarded-Encrypted: i=1; AKwUvBy0ZmnrZ9QcU0m3uFGQtxyC42LxFzWKuTjzW4oLPGOXOvhvEhPnIlw2P1Uret75qSww6AlNPac9ZGinqxvV@vger.kernel.org
X-Gm-Message-State: AFuF++mdUb1+g2aSVK2xXr39i4/2cjNtlpOMeket1LAwnMrSkrXl32af
	iCjxBizNvkk2WKCYP0I5mYYYD/keKxUVTx0WXOBawg5RMHr/pQPZgwf81yQGySJ/liO/68DmsFn
	jhdJstvMEnTb/yFa4J56doZppv5JDQXdEs3Ca/y+A+xwc5A2wTvVAPRVOI+9mnySGYUp1
X-Gm-Gg: AYBFou2iPzHOGlaRKoweqVUdIlujFcm4LGcPQI7u1PKL1jRC079r1dG1YTwbN0LuJ7/
	dE9eaqtOsRax68BR2Nj/ckYHVTZUm6Z0kXMcxDTmAv2V4PwpH8iOAir1u/58aVw6Du//21Wafw1
	Q3/IowbSgyW6vZOgbJVSo7eay9HUbyorooIBnOok9GlqHsbOsK4KTd5qkkklMwRGD8+M5JAItUp
	HpYRtBKsKfTThOYj2RObVva/X9Bnb5+A2rP0UUjSkET2nt4Q+9fNqYMQLoAVF4Wo/gx0ce9m0u7
	eU2HxFKpKxyBn5O/8VP9sQ1K1raP5+AbX6h/AnV21aXpdGbUna7TmCZGhPdgng/Ej+f25XfOSgS
	cqFEUY9h201MPj9bs/rLTKA==
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340522585a.3.1790331576870;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:9205:4d78 with SMTP id af79cd13be357-93c43d40617mr340520085a.3.1790331576328;
        Fri, 25 Sep 2026 03:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae74815easm93578766b.23.2026.09.25.03.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:19:35 -0700 (PDT)
Message-ID: <d7db3b98-a44a-4e63-8ca7-c9fbfac70f28@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 12:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
 <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oNkNeqR-FyeU9D_hqr9ZHguI6fHJdbX8
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab64ab9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Efl7ekKAViBeap_CtEcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX8mGKZtQ9CgOy
 15N9j7zzHUWkzEhkf1aS1iY63YREBH5zqthqiMDa+q2TeF2cX0YX7xIs/NisgRc0SHcbbYxpWZr
 9LnOFZWR6JXfpNbPRaDyaGK+dlp44ca6lKGkHoFhJLHJPv5wp9wgEcq5aXQ2rsTFkIN9eEvwT54
 uWre2r8QnzNre96gPN+op5xh3V2d0ZzP9ySdFL2m4kvv5Rx+g9fGyNKJPce+oBXdhJpU9rYSzwu
 KMQOvVNm4IJd4n5RkXhVub4Oqu6j3BBeZ0AjquBcFrOby35fYxlHq+m88Kdgf//O9F7ljIszGiF
 WOD3D3q4+ipmpWfsmCvYgSeQwgvcW0YMLFa09WJwvrdK3QGNXDy0MWPUcYoy1mL7OXczQlQJ3C1
 Y230+4fMa/TMgSbkFfFiFbkuhOpyZv/HUXOSFofoLPcyoKqupLTxTsN6HumkfSlmoyxZwmkGDi3
 sMUE5dPUdrUBBkHwkkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX2uerpAPUJauU
 imS1uIwlMk58xLHgV0v/Kmzf5PQnsYt1dF790ysQnfekJhMi9JXkcbysxv968ZIoS5rY10fQXyX
 Gtg7Qlty2GSbOGGpj++RL4NfzNqNpPA=
X-Proofpoint-GUID: oNkNeqR-FyeU9D_hqr9ZHguI6fHJdbX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041

On 9/25/26 12:13 PM, Mukesh Ojha wrote:
> SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
> hawi-mtp.dts, but that is not the right approach, as it should be enabled
> by default. For Hawi, like a few other targets such as Kaanapali and
> Glymur, SoCCP boots up in early stages of the boot chain before the OS
> takes over. So, it is default on.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
