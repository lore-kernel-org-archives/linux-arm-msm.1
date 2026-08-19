Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA7046D0AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787139998; cv=none; b=bEawuK5yR6Rl+kyyAMjxXRkCGMr2kd7PYgSTDKj996fipfSIKQ67Cvnd62Y1EWbub3hB9OMGe8lSnVZ8Gpeqp2gA1BHAkKXIgdHb11lihHYirDsPX7PIENsmsYS0WTY8sarmSE3g22Z9VV0CY8lh4B+Ohwz5JBZaTjAIudZlyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787139998; c=relaxed/simple;
	bh=MYsbDTf87OOeqbvae12TXtdLnG7sJF1sHZaIdOetIrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UB+Hmadvz0tJLy5u7jUZe02ORd3zowBZJTwkap/aUWH8MQ4fq3N21SJdsoiSE7ZydPLG0qDvHUn1vW4sezgHnl/ql89B8RHeZJyKa+r/JsoHDs1KSfFoLDMsMcgi8CjLwRf6g3gxD31xO0ukvya0RDyExMuEE36Ejuw1oLURIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RKgaBRTq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSlO9GE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RKgaBRTq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSlO9GE+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA8E7Y3984469
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=; b=RKgaBRTqF1tXD1W2
	yOYZvnHR+2wzAyupCgFjvaXz5o1MpfGit0LXDmc+kgQuJ1SL8Coh/xBbpnJTFOKs
	DDIgc/TSWaBileL8imDF6ExX6/fHDQqVwmPKEj+uJx4swPgxnCjbG4AHajO1Bekj
	xwsW8usWTiqaQeARKQ2KhB0zefXGouaGUP8y8Oa8WgX2VvwET8kOPvq49I4+fbSy
	Ev9e46BUDXLF84L9MKGcioviIqFgbJLHmUjVHv/duk5fOvTcFN8Mnc1h6Cgfspb/
	9pAY5RjFjYNxs9Ixd81WT7By0bZJJw6w4NoZICrDlswcd2pl4PnjC6H+8v2MQZA2
	V6KC2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjk3uf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 11:46:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso2551731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787139992; x=1787744792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=;
        b=jSlO9GE+moYLxSyhJJct3+TCo/CNjjt9XVxW/ThyXMWMD0ZSnnyQraKLKj11EZgmzr
         M2kRrW2fyWPp3NyRlc+am7vyvyvv0DOO0Ex7CXHRDiAQX/oN+I1T6r4kIiKUWKrOnoTf
         /C2ZnX6SQwz37y51OqVOJ0zGCYwsYTZqOIL8uqK2tTJMbniEmY6x1KSWLvYc48lxF9Oy
         TmGGTj+/ZZJSeGjWlyMLXtYyLDL4XPKqOGbyI8WPMv8NuUk3FPods6HffxBP5L18JDap
         vprNa4i/Ce2Svvk92zPazlZOTWSFLhvUTXFf9KnPeqqOo4XlsayNLmNVSm9G18NLxjHr
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787139992; x=1787744792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3koSoptLG2t1C3ur/HWYmg6TZ1MEX2bwwz9D+ZrF+AY=;
        b=k+yA3fHr2c1XYSTbiPaK907nyJIH5r05pqVDENofdfZhLlZMuCxqN+GdPHQvT4RQKk
         jRdU6txPQxlvNYB6BPFk0JLbbyK9tjI0MN07k6vNGk41shX9c6oq6Om16vuuxhd7qeiz
         /k//Fo4uzm/9pndXdBT3Ln5f2bNbWmrHkwe7u2jKF6APVnmZ+6M6mrsDvhMaMWKediu0
         d7SMbZZXQSXhJLTBnwScfjevvnOdeVwN9rORVSPlVBBin/2L2/A6G0C10rdqmq6ABQL6
         U89hygTUOOGp9mqS1Q9SyAVKXYIjrVm5kdj5M0TAnxGFA5H4PsDQ81hxBoJwdEMUgKd7
         4DRA==
X-Gm-Message-State: AOJu0Yy7hTFDisq9nBXodkTqFBAXkS5+PS3Us8MyMGb6bkfxdHuOpLyZ
	ylThhO22EUQgp3LcrSIxbiZi9tZLwPrZ0v2jayXwJXP4MPu1lJuI8NegL6qNNBGh1MYIrl3EofR
	DT6spPbX0E+8D4xTIyAPnpmez6FtoFuH+MQ3et9BAiueSxbK/XVz8ieK1Ulc0haTCe+dl
X-Gm-Gg: AR+sD10x9R3QGz8TE5iJc4aqotJ4rxiNQcs3+WdW7UZHLXzKKJvhd3CG/xcKTHzbcLZ
	rXhJvBLHvXIuBxLKx5ZONYHNOR8YMn6TfF+rreQxIECWEj+SFgF+aixlbAbiE/3fDjBeq7+GeWL
	kDDImqQyyTpJ2o4ORg2kKeYW1M556rel4sqil/Ad72X9KDW9LRlXNVKy0G6qqV9wUhOjFLuHPed
	JPjFwv8rRle3RxO92kGpmI4gYygAAS5CPFQoVknPWUdJDUIQ714/DgKqh2iPBEvp9/XlX+Ti6vq
	WBvQqc+MWNiQtJTQKMfPgGR7If2mk0vj1uG3FYxD5R3/tTDm9U7IfGrA+7URfPRuj+Gn7yp+9tB
	24vtKKvtS4j/ilaI2W27xh3n2
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr26405121cf.3.1787139991931;
        Wed, 19 Aug 2026 04:46:31 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52dd5c958aamr26404831cf.3.1787139991498;
        Wed, 19 Aug 2026 04:46:31 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c78a484sm62015566b.26.2026.08.19.04.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 04:46:30 -0700 (PDT)
Message-ID: <40c85916-6694-4976-95be-6ce2a2f19732@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:46:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA5MSBTYWx0ZWRfX3mvNOTlERjg1
 VCDYqqfyUma3hhiaQCOi5MvQ+tHZ8flv9KfWvwA15JEm02GaKePHJhw3bANb3xJrslt3NAMyWaF
 F5jKRy8XXtY0zZxFpOAA1OuxdMRPdXLpMZEcv+uzGTG9LRuKHUu96rDbwzL7fT2LxkFkjHi/8cE
 3HrHlWk1nVVks4YDrxF9qL+T5tHNzXrYv9m5HsIVF5sxPPJxsjZGIjxaqmvLfme54qVPeOSuK9o
 X/un3WfFwRKbGQVNQtISEoKmfY653i1ld4OiXE1x4otvYO44jDq88zaPHfhIxJom3Xcp2hP49+L
 wfT0QX21q5xfl9gERUMxbMGWFukq0fCRF94iqm2oQjXbXxfXmgYdftZ+CcNB0zF0xn3j/Eac/Yq
 jIlMbfc2aJKx6Sw/WmQNGHXYozP4hMMdCdswX50nhtc35ENXY+anGmMmkYVJW8ENjDQXDNJTsoz
 6IxXr5DPFR6Gf3/CZzw==
X-Proofpoint-GUID: E6Hp5Q620R15z41qjWS-Sl99dn7BZev5
X-Proofpoint-ORIG-GUID: E6Hp5Q620R15z41qjWS-Sl99dn7BZev5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA5MSBTYWx0ZWRfX1UljoOSlBQ2d
 Kh34pqSIgdiJqn+Rru2iDmxtiMy8qnNGbhdilGVL2KCmn2pe+4i2rgF0aeOTRV1rlZER3tril49
 zagWGYPZl+8fyUqxlhP9avGIkM5uDBc=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a859798 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o6DoCgZa75HwP2qXs8IA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190091

On 8/11/26 6:44 PM, Iranna Mundaganur wrote:
> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> 
> Add the missing SIDs for the LPASS eNPU masters to the ADSP
> iommus list. These masters are exercised during audio record
> use cases where Environmental Acoustic Intelligence (EAI)
> models run on the eNPUs.

Could you share a bit more details on how we can reproduce t his?

> Currently all transactions from these eNPU masters will result
> in global faults; fix them by adding the additional SIDs.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f04058d2e089..6b06e0acbcf0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
>  			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
>  			reg = <0x0 0x06800000 0x0 0x10000>;
>  
> -			iommus = <&apps_smmu 0x1000 0x0>;
> +			iommus = <&apps_smmu 0x1000 0x0>,
> +				 <&apps_smmu 0x1040 0x20>,

The correct SID base is 0x1060 (although the mask makes them equivalent)

> +				 <&apps_smmu 0x1080 0x0>;

This will bind the eNPU streams together with the ADSP firmware stream
into a single iommu domain - is that your intent?

Konrad
