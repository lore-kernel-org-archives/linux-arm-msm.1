Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606F305E1F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324897; cv=none; b=g0wZS4rbcBgFckV4ZaxYpXBJFRfITW1cOQ/LXo5u938zmTCMIB43t+qcZEk31Gf0+Y9ss5P3xwHLYgtpB2ExH/MACKr6dt14SN4BTU5/uyKOrAmvLbaqZPCRkWQ+kyNVxDtDEmjZDeqOh1mtn1qDtUrMJh4CN7emvK+vR3sy+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324897; c=relaxed/simple;
	bh=xbTYkIXpXUee3gvvOBxk0kUVHW03TTov1eo5uXnvD3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHIQckgVEWGX9wY0BF1zc1fpDKH36ezsCMA3NeID7350AZynBVUPv8maojzoZbpFKGROZExaFbVukBlfpFRnU+dfGv7Z6SEhTS62CNIa1WLJ16azlCUzRZ/aQOszdOnfXDCZl45JqGFF1TxmdAuPkFtayA79XWYlmU2i1InboeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNJc616W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3/i6s3e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNJc616W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3/i6s3e"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666420Vc3595055
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=; b=PNJc616WMWAi/P5h
	KzviJ2QOcmxmWXrNJrOBf186e8ISZSGtk198bVxyTL1x8Ul2sznEyosF6vSU+S4o
	1Iidcvx0nJoQ0rt1im8IZc8p2GU6PoaLmX0Cu6oBI1wjZIHDlvbj9GeTL4QEWcSo
	UdL8TInLCrszGVqnQRAA7vKM0/0QKz0fAIrUjxHcJ5Vk5gRH8FU38XhDAEwh8pUb
	efJLf0/aAi3C8d3e2nd/6vvEk3QoG02CApQOj/ngfc8Oqpwg31zqE+SnHkk2kpCj
	/A7aZ80v+JQV3/90uYV2iFw9EGC9LN2hFw6xV1ivi5vuW5RVfoYOs9owJxpaojO6
	lDdtAA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qvgwg80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:01:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f7d8bb37so97597137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783324887; x=1783929687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=B3/i6s3elaG2Xx6ErRcIowK4JRCIO56PLGNH73ROmSF1+tyNhWAuzF72HlQHu98Unp
         JYpUJcASalS4+6hMtt3RIyOy7n2vAsb0FAWfKCsW20BAmtZ9wq/CoNOktWmqA/mDQ5NU
         cz2g3ID4XARC8FcrYlsEyoxxoXB6vNekIvO/4Ltm74n/Uy3bLUnttWwDnF8IlgUtWTiP
         7+ZTbi5N6HLfgBkhwh5adKOwn56tza7zTxUzPOn0RxaIHjL302K4hJzlICBnVyVIt1Q3
         xyPqlXFxJvwaiwnwJLakqYPuAaiorEm3DFuR7mv6jyTCquFhzd5rUjzcfUcbRdNIRMwl
         Dtaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783324887; x=1783929687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LEvwY9lVsl4c0KkWFbM31zunGMAv/eiBIVSW86anSwM=;
        b=lZyJNTttonSqAKEWEeWp7SriaTEppzh3OyUY9Dy0zfVgXHU95/vkG9BKf1xSTuPwbR
         cJ8hq7eRVXNGS7ihjzXSdnpjO64Oss7uEh6DbdJWm4h9xfDPhn5B7EG90A0V5KML2/Qp
         mEFL2Chr75Ty9WF0gJWwSVF5nW8zSGPxkirW5XTMOdT9b/X2wnprXC5IVFFzKeKBP250
         ilIZb4HqV12JNHkAS5+gHGyl0SOeEZj2Q+KpOFFuH57ZMJHmWHmXTHU1dRfHLZiKZ0bY
         ZbOCo1rfMpymxE2oJYsTRGEMQRo575cTUOX9NsQpzgSwSRloM8i54S8H8KQMJ1FohYwO
         FSYg==
X-Forwarded-Encrypted: i=1; AHgh+RrkpWoNv+lPJVd9gFDe9b+Eeczg4lrFP6DkEZ2X3tPnRzK8EXFJaAOOk4akF2boROdMf2D+5pgZG0qsKOnH@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPq6UuZgRyczeIkR7SXb1U9PUFEUB/vnDoeJxRiPdNZQJqdzu
	ENR92RpFBY2ve6URE3l/xQ5OH0T/ZjbwEMZRUAUrkKUeXlYlXyl+iUKC/53c2AyHjnCxuG+4Xj9
	mXFCwuoa/KjH+GkE2Tj6iZY/ovUg2dABKWPpq4v6bj+31rIATp8GIEDJMtzxuo/6gUwsM
X-Gm-Gg: AfdE7cltLpWhIHfsUgVVSFICVyJYGUEjV6Exo4wzrBH084ds+/CztTxU+EBFfTWeQKe
	fWwASV1brT1dEefYAwrmI7zuYfQJKrS1q7gtL4/l4RWL+L1bTlvjQLnaE1P/9ROQYBwWvcjEHm2
	HbMgkI+nR8wM70CKaT2F2jd1GeR51gCeKMNoae25uKGSp8Qi8pyWA8Za8KfVLXeJSEp/yYGwvxs
	VV+b3s1zghngIcwQuuzGHqcdvBBa2F1T/iwlOnRxJ5VpZUvJJBrAhmtMklHqcnNnQJ+x0E4UYgp
	xWKKArkl50HEq8a00UpscouYt6CYXblyRxSh33ysrd2t/p4d7FrFUaA65Bc4GgO/P32Qb98Uwwi
	WTTE+jhXBH8aG+1V+at9ITkDHUO6I7VRm2is=
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165577137.1.1783324887385;
        Mon, 06 Jul 2026 01:01:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5f02:b0:633:3bf6:977c with SMTP id ada2fe7eead31-741f6b12922mr1165550137.1.1783324886847;
        Mon, 06 Jul 2026 01:01:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d786e7sm3638842a12.16.2026.07.06.01.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:01:25 -0700 (PDT)
Message-ID: <f55c20ab-681e-423f-8d51-9c1def0f13ea@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
 <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvoTxe2n c=1 sm=1 tr=0 ts=6a4b60d8 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dZuxl-eQfz5dsBr31XEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: 2ENSv613Wkz7rneqlrjXVobyb3x-s1bR
X-Proofpoint-GUID: 2ENSv613Wkz7rneqlrjXVobyb3x-s1bR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX9jpD+tTREWm+
 O7pdEaxAo1VVzHPg3G5Cy9E3Xlooa+ARoWcYZSMQDGa3rWaGrVo8WJJuBTJ3q8b2uKisICMXqyg
 2cFGKYqfmMxCfRPE7FA+hnszW6yiznE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3OSBTYWx0ZWRfX1TYKJkVwuLM+
 kR/Yfi7x/GrKTFmvRehnx3zl7esWmW9DsmA5P6DSp8FwADeK6zDQ1OnSpRSAE5izly0RzjJXCbM
 zadl4zV9dcFv8T4HM47jawTVWkgc2TMfQTmP7/1zZdxAW6NK3d1KvtuTAGT7wrMnEX10csM14eg
 LGnlsYXbj9J6cXibSnakq0nLjbrMsQzn79DMktcF1sBsPRLAOiNt2e72TLfbkLmSDMtf7k5F2ys
 ploO4NO0PoEdvh7ptni6rk97asXox5dOqDsJSG8NKoOEwVLqIVNa6NvXm5WPujsLH28ar3M9WkT
 Ri4Kpntm7VnnV2uq4diBKzB/7pvqIiIuT7FnHjJIULaK0lHY2LHaYHnh2sxMHseyown+1Cy4p9H
 gC1TntyMtaPVlVy8YMN3TtCx/SDEy3ADtF8CLeUrJYKEGdqC+pIIVzoxP6yrT5Tz62ykTeieytM
 UFzcJtiwe2ww3fjGSgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060079

On 7/3/26 10:34 PM, Akhil P Oommen wrote:
> From: Aditya Sherawat <asherawa@qti.qualcomm.com>
> 
> Enable the A704 GPU and configure its zap-shader firmware on the
> Shikra CQM EVK board.
> 
> Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 269e11bd44f6..8206dddcfc75 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -50,6 +50,14 @@ &remoteproc_mpss {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/shikra/a704_zap.mbn";
> +};

Move this to evk.dtsi

Konrad
