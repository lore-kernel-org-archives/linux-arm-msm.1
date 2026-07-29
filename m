Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B744AB9F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323591; cv=none; b=V/iklfVwoyRbHLgCQZup7/yuIXTd4xEbsPJUypLzD8MdAXkqVKSmu2NLeaQW8415kfLtoaVo/UlCpGiAsPqmRSagUetXf0CMiw8QgxCPglTdll6ay2/ufyBw/JuSTUxZTeNklbzkbkank4M61YGOzfUPD+krHOR2Dg7ME0s3RdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323591; c=relaxed/simple;
	bh=eHsIHV1AXVz/XaIJHGb+AZLir6HQToB0jT8g6CR2t4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkczQbuS6Ih0EGYuaQqGBYKJbfkR+NpmQuT8axk8sj6aUq+YaLWGd8R8dqEkflkHuN7YcwkwXkg7Nrx+MUj254j2XpE6yGjdllxRCH7Wmapc4TxhI9B5Mkrr02Kkzi4bv1nCvCAqLyaSVaP11PV9+jrrWlmP4yZ8hHheDcQK4Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cwYOxSpv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C45DemVK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwYOxSpv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C45DemVK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBAabR1826651
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:13:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=; b=cwYOxSpvqlV+IcaP
	NouPLYqR8vSDHZvx9VDC0MFC6Mg4oqIUQbSiPJ7Id0skxvt4kRP+ZPkVzXJNnuQ5
	yD/DJGQ0eVe1uBq1yzlYWGvs0gMNREqWF8o0L4+BjT+gjSr7s9yh7eE53O+TyK/2
	NdlxLnnAu/L1McBL4Pwgr1ammxgUyAQHzCzhWzebyFA7dIn3ih5ndH31VFbc5kiY
	WZ49ayefgVu8wsAOp0r/XhMjYOFj7zLuGMq+gyn7YGMh6qWlmIvxCkY02ibVptTv
	DNpc9rN9d6Dntm3XerZtfjw//0BucB+8vS/KrBg8LJjMXBBIp/1TXwkKKh5YlFH1
	b61HiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgdtg0ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:13:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e9d892f0dso2488111cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323586; x=1785928386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=;
        b=C45DemVKs6Nruhcn0XxVSfeCGOE3XL7W7xoGhFVUif9VjnFj3QJ47fpvAXJZ6XXMVv
         fOMZlWZKlAwOOixUxLnTE1jw4P4YZ9zfDK7bXmmbC2s7aIg7NBb39zpwk3N6o764rug0
         rBzbnLPTFj5zG7aeiqEg8RUPMbiFEpjdHuDcO+I/gTSkNgeDjohrb0idqsOzkPkoKwgo
         wZfzpK4ZHCR6lgcaqxtAFe7s7F52vNmY2g+LoffqHOqA9a40Zi+1RXL4bXfycFwPBlOk
         7ttnOMt6Zz1NQFQTcOCvIgzycw6kYV7DQzBYPCKxw9p49vaVkLFpp3sRsiTyETeiI/y/
         g5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323586; x=1785928386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egQ5Sd4X5i8dWQKe1toEYX+OzKum8SXkE1FoptzVp28=;
        b=hU1beB7jk9uYhO3c7F+F5LyE0zA9BvkyQc01l1VK8smEIbOWcv8BjcH2WzIArQgene
         5NjZgQUke9Ifm487AKE2C8VaRVtAqoQw+e2OknLo3jek04mQNe77CPsUJ6XkV86qlr8y
         Ek6V48OV8I64CZW1OJg9HlGWlLW2KhDY5mfDMlCHCTN8WjAsgj8AhG9BFvj9u949LxiN
         k0osjKskqz3A+FMKp2roPVe7WxowZl6tWHZGPh1p9A5YE2mJOSHL+7pkLuanwTZyul62
         6GGQ7yNEmoHsyK78vK9rqfm1Wx4gIz0ZeHSkXiKYq9zdn4/brW9wtvHY7nGVT9dMoN9L
         FwHw==
X-Gm-Message-State: AOJu0YwcPMVV/La/5IM1vOlo1yZslmjlx28hO+StjskbxzGUhyjKt8uj
	TKE9BSMNdEKJQhCCifMg6/LxEUsf6xcxmHWUMAy3dfTCEf91ot9VNMaYhTYnqGDfcjF3zjnJ+BE
	91xkgCIiHOg+YUK5R/VkpXDyddz7CaCdZb3joMNBatNMzIqhlcKhyqyyeIcjP3LczghXL
X-Gm-Gg: AR+sD13ZD7nL/qA8Anc+FzIHk3Z7ioWq0V2D2091uwUw/IGHfOTIqZ3Kj1TS9hcmnv0
	7yiDFyyVXq3YLWExzQ0WioTWV5P+JaM+McWscbOCK5RwycoiU9XmzqITU2MJY0FDQsNgxkKvEZ/
	RO66zyDYLBKctvIA2s1n6czA8cY1dDIczVk4K6yRkINM0KIKo5FTBO+QNGhyXL26BREhzTvjzaY
	Y9XnnWxy3vAsmRoMGnsu2lZ1yAmMzk6G3JCP8aTz6N9Twars3ZkyJI2Lh9aDvEkXH1LPSWG3FYK
	SR38qsSJafqeF+sqGQCqonT3IIJiRX0yLACTfGzJBjUndY64qwdMBLHQR5jovNrmVLH1ONf0bj/
	/k6vYgYUAkhBaLoRjBYz0E15U
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr53237131cf.4.1785323585698;
        Wed, 29 Jul 2026 04:13:05 -0700 (PDT)
X-Received: by 2002:a05:622a:82:b0:51a:8079:795e with SMTP id d75a77b69052e-529d70f64dbmr53236671cf.4.1785323585291;
        Wed, 29 Jul 2026 04:13:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83ce0eb3sm98924766b.18.2026.07.29.04.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:13:04 -0700 (PDT)
Message-ID: <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX7KoZI4EYs6EH
 my4Df0Exh4h6RLTp47xv2niI/yagevuwNhnlXjUv95+mdLaYNasFin3VSwFZLiSGtELw06kUk9G
 byGppt267oCsHs8xWhSe5yxns4W/YMg=
X-Authority-Analysis: v=2.4 cv=Fb8HAp+6 c=1 sm=1 tr=0 ts=6a69e042 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ggQ_GJ_R9_w00h1cgFYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lTFHc0rboTuGpIXBBLYaKzlJrYo_KhUV
X-Proofpoint-GUID: lTFHc0rboTuGpIXBBLYaKzlJrYo_KhUV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX1gtJfdAdYbqE
 AuDWZ+IS4bGgtEM7UjuGKOroPxx0lDHa2Z6C0yl0BOmYc7X2CNr4B7/leRZ5vCuuJetP869Yybg
 WRT4yBmmNSQSMMguItLksW46jSIIq76QiaIB2zrjniIpK2AqSe9xDeFrOkD7rXdMiQQlb6tYNzI
 WeeJxALY4WODrP2uF/CMC/qpa08M42Z9srUhqvnlCI9fWwOgcpp6QZpqEmQ2T5wuQhgZ+KFOByq
 HDFOkmq3ohMWJ/zm85VtrQ3Y+SdygVmyeGR13+xuQJhlyKxKM3LCMBTQSH1irGF0ZX0Qe+9UaDt
 Wh4Mm0hmE/vxqMixph3MnaTQzsjBWXyyTVxp2lJI99W/sS/CMrpqfuMoWXHldb4FzGx19NtEIn4
 hWCXv3BzoLYsTlmn/J4d02WR+6tVOSnAj4zhALSgtOaCsJCbN+9MDesfwNZ83UUkTycD2CbSPwJ
 edxMsQoydOZUo1QGqEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Add the qcom,tsens property so Hamoa-based boards can list the tsens
> providers, and how many leading sensor IDs on each, whose readings the
> driver averages to compute the SoC junction temperature reported to
> the EC for fan control.
> 
> The generic thermal-sensors property has no standard semantic for
> selecting a range of sensor IDs from a provider without enumerating
> each one, so a vendor-specific phandle-array with an explicit sensor
> count is used instead.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> index c07483aa5937..ec809fcd03ab 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> @@ -33,11 +33,40 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  # A generic "thermal-sensors" phandle only identifies individual sensor
> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
> +  # a devicetree concept the EC cares about. What the driver actually needs
> +  # is raw readings from a contiguous range of leading sensor IDs on each
> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
> +  # phandle with a count instead of enumerating every sensor cell.
> +  qcom,tsens:
> +    description:
> +      List of tsens providers and, for each, the number of leading sensor
> +      IDs on that provider whose readings are averaged to compute the SoC
> +      junction temperature reported to the EC for fan control. Only
> +      applicable for Hamoa based devices.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      items:
> +        - description: phandle to a tsens thermal-sensor provider
> +        - description: number of leading sensor IDs on that provider to average

Why don't we want to look at all of the TSENS sensors?

Konrad
