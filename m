Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E996334C1C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322910; cv=none; b=R+kASGvjIoyNk8Wp1ZV2v3Ia7ZGCb+SlAt7mPsnT6zGcrdR8mPhnrQ5cfJ87sMByFxOs6zDb6ldjbODYctgMEgbevYbQ4d3HzHNkoFsvInihgpgUGCfx74ykkbVi/SuyLrxpFxkVFwrERF49arVEfQPNkezUP9qJjequLuqRsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322910; c=relaxed/simple;
	bh=DHHzktsDLAM4f7rIUIIn9lXfD1w/CqMfKuEuew5qCes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJgUefNnqoPE7i6PeaHEFwWRAoH9ljtbQ4AcdvxowZ/gL4iTO+zIIIlEE95+V6RZB5ebtPA1yDF7aCZW/24O+DBKaKHyQsPfHqxAaUNxUyUGeteoU2E4/QI4SSEusSKV9NG4MECCcpIPhBKVyfxI3qTYoCR/rlnLMcDD0+RzLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkuJ28OM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZAd+CxmQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkuJ28OM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZAd+CxmQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YY7s208419
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=; b=QkuJ28OMMeOdpYrD
	JM2gcZ8DGgCBQdnLREK7uzV/jrc5h2uVQQZsijPPCgflB+AZ3+DFTVvK6cL041uD
	/ga4ysFrrcqp+fiblFYVK8S0s4BwULcfufxcwAFIh3kQE0ofEQ9N6A28amUyoxnE
	2NWrQWBOi2QfQgb5eYZiRuvkjSWaz/aC00YtMWea4/lYEehwFLwbyPkiO/WKwF5J
	KT3oT10fHFZyP6uRci33d0np8/OaafwW8L/A/lntgXpkWhaNfBmN6c7vsSeiR2F2
	wGrDtSgMVce4OLemb4Wz2i9+YEhb1Dgg7YfXcNtc0eNgQ/6Oah74reXVE4A35mxl
	Uz8P+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898tkgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 07:55:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530f968ccb3so10754311cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 00:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322907; x=1790927707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=ZAd+CxmQ0FD7jX891xqOeniz5VBqUh3Vumrni9MMQTqxcKmwuoUsGCwIRZ7mqjc1aR
         V2135nxE2T/Jif6waBxppuOwDRqyTaz5T4JRBUlKdfLjELeAWfO6E8w94NUmL2E2/TNi
         TxKlcp1vZ9jNfjy5d0DLui6IOsJQo6R42bqCMOYvhabERHeZ9h42dYsc5e2V0Vb7O3hT
         DNBlrfTXW44r5qDYRoTdZgK2+gPQHMoCmEhWv4JtZ7Vvk2PQ2IRDtQi3zEIVt9UhubSA
         lKREvdDa7pK1ZIWacFe65lV9fEDa+eVptYRwhSnPdZwVYGNuvmi5zyyLJc/gTJyrmH3n
         /z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322907; x=1790927707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MU1bXUmmuwrr1uy5tFVB9eld75zZ4KDn2NV0kvtO0Ao=;
        b=KNK0iaRmk2dS7ft/R5EPrqJ0r6qBtTaTbM5SU84LaffkXgZZIL4NHvDiSX3KkU0OO8
         bgYnxZl6ISGwjqu9RhpmKZYD7lwGJKfqZYQGuyfYTTt2Fr2Zf2eebhvJrlTuL6yOLsTO
         o1gyAJRaXkLdwNH9cM9B6cLl3Hrhlkyf1uDMhtte+AnPVSbhkqGDKjt4lt3OFDJ3Stlu
         PyFMCKARxvp4mE2+yBiTOvZqJdmlMs5AKwAsJkYo0PhZYnSL9NMS6hiiOnSqFfBQDD/l
         a8gSrucOr5uVLdF/THy9ml5OfmsFDa38zBMcBXTmPe7EgSexfgk56rQoxy4rRYkpiK/j
         TXcA==
X-Forwarded-Encrypted: i=1; AKwUvByoEhN2ljK9iSvsS8sms1Mb9FoJrVwN2TzlYdV8EKggb83Y5rj6EJ4ymh8rBBphTnX4PDQmW1e6tFTGDkGP@vger.kernel.org
X-Gm-Message-State: AFuF++lNZQnJS8yry5uchwn0zNH/ncV6/IKIkR8KT2gkuRmkjgh+5lNe
	cZsvie6FTnEd6eUbdXyf67G5RhcmYmp0Vbrc2i/vNTYkfjKOC38/Vgg9yzl4hTc+ekWCOVv+vmA
	cbIWtYBY+nd/FAL1i+PKHMhXepUIe2teks9UELV2JNnmyAj+jMJ1YzwY+lMieA/YC26mf
X-Gm-Gg: AYBFou2QpiPnfPUjQLAyu+hG7a8W6xleSs1x9XQv9/VL95gWZcSIwHfkUNb/ybdmPy6
	dfS72+6rPkryLuWAQcV3Ki2QnVgNIVcSNkndpuD5akJukH3DmiOTKdYBSrzI51ueCg7z8TGeiuV
	FeyreFrnqwBLcyVoSEEkjyEu1Y9GZqfZ/MzqCTUhXjR54imEf9HsqpCSs1XW1lIzCXXvDa+o/zg
	kuNLkEGwnC4m9FZjKcmpstQe1tUoUcnuPdWNqxsQ2GTDtbX6gyMR2QvbydD9+bnZp9RI12iI0e0
	qvz8LfzLzFoI+PsvvEW9CeeZ9aKk5PHD8woTfMAlFRvd6nbSzrM2907+d2DAHk0/KuNKgSH4xbl
	6icS2V7on0kfnXmlIETkyK+i9Uw==
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415671cf.58.1790322907456;
        Fri, 25 Sep 2026 00:55:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:530:b2e4:d59f with SMTP id d75a77b69052e-5330b6ebb60mr28415281cf.58.1790322906928;
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm196689075e9.14.2026.09.25.00.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:55:06 -0700 (PDT)
Message-ID: <32b16fac-2c4d-442f-9174-da16e82944f9@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:55:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX1qf0OfHStn4G
 JDDuk+ul1vRSC9TrWS9F+2QFuIx7eCP/nFmlHFwW6/6Ev4m3pw2tfDhvuo0fGFJvHvqL/ukpiut
 OsIJ6bG4LYDu9BZcdqwU2guY0EcweQemOqj4djEETclJ6S6qTTGMqPWeHVY+jiDF4GKnJhdY2mX
 uUGKtUcNb451vu4rszboAu/lTLGz6/KzpFDCyJHdtLPAu0NyCXR30oDCqDa0aMOWg+bfQpqES3k
 jH30a0YKMbieQCZQOSfBOKIEcScNSNXJWF+oZXCc5+qxbcj+DZRhDLqJoAI6REVXhR+sdonl+UN
 hDcDs6VnklZ60Z0AdWyG3RE9oSf/aPAchf/ftZ+tZTsIJR8/ZBinVGpHA4quEGTiiO/9TsXuP1k
 0Ajc3TsxkjSxarjv2ye3RIsXg62UrfGnoZDMVU30N3a9O/3om0SMgbqRUA4IRnlppjx2xmxgIaL
 mUsdXcz7ORl6d3pJK4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX2RPnakzfShOq
 kIX+1PyxjEkD+MPQtaw5jJ4jRCOmP8xDE1qE0+3w+4ft5Loz2tvE4no1pd9t+bGKnOCffr/OdR4
 9972KnNX9AZ17eghj1iF1H+Xi3tnYRo=
X-Proofpoint-GUID: rZB1adPyf9pIWaqqUEMxaolOpeMlgP3a
X-Proofpoint-ORIG-GUID: rZB1adPyf9pIWaqqUEMxaolOpeMlgP3a
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab628dc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=8N9GC05w9tLPy7rIr4cA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250031



On 9/25/26 8:51 AM, Loic Poulain wrote:
> Enable drivers for the EMC2305 fan controller and PCA963x LED
> controller present on the Arduino Ventuno Q board.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
> To: Rob Herring <robh@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Srinivas Kandagatla <srini@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
>  CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>  CONFIG_SENSORS_SL28CPLD=m
>  CONFIG_SENSORS_SHT4x=m
> +CONFIG_SENSORS_EMC2305=m
>  CONFIG_SENSORS_AMC6821=m
>  CONFIG_SENSORS_INA2XX=m
>  CONFIG_SENSORS_INA3221=m
> @@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
>  CONFIG_LEDS_LM3692X=m
>  CONFIG_LEDS_PCA9532=m
>  CONFIG_LEDS_GPIO=y
> +CONFIG_LEDS_PCA963X=m
>  CONFIG_LEDS_PWM=y
>  CONFIG_LEDS_SYSCON=y
>  CONFIG_LEDS_QCOM_FLASH=m
> 
> ---
> base-commit: b9bb4134a9583a388704433eef22c82c49963585
> change-id: 20260924-config-ventuno-398c8e9ca9c8
> 
> Best regards,

