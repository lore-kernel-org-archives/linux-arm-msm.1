Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7703848C3E3
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040146; cv=none; b=t1EUELGfHCYyDfqR3tsZph4jKRpJcN0WoBMUXQjBFdUD4hoH2RpBpTAOvp4gc0clTO8VoBocUwGXspyz/98cpByUnPxnY54GhyPlkCcLEdit8j5W3sOBu9GNqSQwduJrQpkuHPF8fu6W4r1wZv7fCINFqkJAVsU0B7wrDU42xNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040146; c=relaxed/simple;
	bh=QLD2yamtBTT01mmMIBqZSbaKauRTUXhhITcVluZWuOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sK5COt5bHEnw6A9q/aJQWUsJHVzFkCgUFzeCwuz84mXp/4Tz4iFqCCD2VgfHL9oXoo3chDtlZcL4lgrkV39fQZHuUqvFIgdo8s5/jwfzS9XspppXPBUZlfHozZDHLT7dxB+2TWUtCTilQ2q3XzfZVMq7HyvsLi7kM4i5NBq0TtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WN4eKVk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjN2y8dW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WN4eKVk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjN2y8dW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676I1m5t2366927
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 18:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=; b=WN4eKVk5zGEUI+9m
	OLqDLGMWFyTHdQrseD0iHC3vVe+4hZakp2AXrHNLx5dIs4mGoB51dWgCm7uk58Xy
	3uwmQGvmkOilk4J5tCXR5jZQh9t6wu/ekpdLdwex0Fs8ZGzR1VIFtQJkx+8hednv
	KXCM2D97Gf8bghcH6jtWqT1bcpoo6qDGbQ6PSYtLb7ylN64fPB6cYXyQyIO9JEdH
	5i53wqZVplaPiqOxdsDsgZOpB3903EZLKRk3Bm9+eKn6fggfSxR2WFOaBuBQ8ZSh
	+qj86eMTgOAUsWk/yddP2fVu2rf3M1IGsBDSiaKUjXxCDsnAZ6GAxfjqa5eIn0uN
	PUMqgw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jg24t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 18:15:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84842381150so3990972b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786040143; x=1786644943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=;
        b=hjN2y8dW8f64Y4Ef/I2WtBkdN0e9YbXpq5NbwKHqykCJJkWsDjc5gtdQUEEAXEwTOm
         p7yrR3+JOVyFgP8aNG2bIEY9G305DTusEGhybwF/7S70h2D1QzOd7vG8CfL/e/PzaSxY
         Uu+2ilk1i3+xdz7CzQFe3I/zvw6jIEkbMlCrFV3lgorMI4aE/mlqJwQuRNHGnaHnVEGT
         7WtwXYRJ5aU3oeDQXzxBLiE/ku8ImoAfZ4iAXNc+TVIm7gPofV4AGkaMGhdYn0mO6v2Z
         9xVHfp64fAAmggFuCL6FxYL7rhM3uJgLRtw7jNbsMWIanxeTA0zfPyboYiMmjTToqla2
         8TJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786040143; x=1786644943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+92Af+tfpb+HXUrkG7jzilYoIyo/FgNcZb8HcmlYTR0=;
        b=fEl0Fv8yP2Ii8MvOSFy5euR8Ew/u7Ianhfp+LyB7PVnvpKLJN96qFovQ3Q8g4LfuEU
         p/vZhRBBFzzMxQ3u7uj2Rrv2fUWVchF085V5bxdS1G0Qhcpye865b4Svaw/33dNh7Gnx
         Yo0eXXlOOs26qGgZPEuBf0uvqZ0s3yWLh6fh4EwBKLCQSaggnrcZqW9mt2EciNq5DWUY
         jAjRTdu9dtUxBMVrhH7jRvighkENNrqW7Jle6D+brmRz1WEa+MSpGX+xXoU2hV6rASbd
         iRt9asLBBUFL0s5SbiDXT78awl7iQs5lO7Lc/0kBVtUj2kIjbUAtGxopCs+7FK+121wy
         3Gqg==
X-Forwarded-Encrypted: i=1; AHgh+RqwEXJbtpe3771yzSTEOSOGkvGKpxRZCJIMgtMAGOwojAUqMP3NtIdFo1Cwsy8exylQQkBdR07FXLGjWIQW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw23Qm4YtYX9qr7MJTy21B069wnY8SgFlKBXsFwy+R6MToXITZb
	CrF598XAZI+5yI8epAIxAN9XgJLy2d6oTvpoHHelUJwaa2Ssgs0Z+B3DlP74LGCFhT4nbLgohY5
	A2GN22izLNCsQTr60y9T/psOOzLlAM6b9lyh1nHdNOU8yhTounN0lXHny/rxfBjZl3Kth
X-Gm-Gg: AR+sD128x6WwKEJyBns8HCot7wig4bXhKkYusEHoegf7gRV+Lz6i/uYLcwttZhvn+94
	Z1DB+x2m0khi3+0GEPxXj/msn66ne3sojztmeJIvjs/jX1AIVSZV9+KAtAMmHliRqC4uBIz2iYx
	z1QXSzQb0cMPKWa9vzWUCXOaJV8BaOFvvEBhN4dhvqWbEW0d0olE62QUHQoOmKVSQMBKKNhcxcq
	JenK2IfpWD/avZPMS6OYHrTjVk3cU6Nrnei6CDymu/32Mjm8GsjoN0CuZ7lMBKNPl39d9VHDhSQ
	bJr6RcU65udUHbU3my09eMmsEersOx2PZjsEMYQbUwMIyr+ium17Ct7RzI3oNvBuvmjtnBH6dIs
	jz/+mpJs3Uf2+R5ASB8gaZZCh5Z/1weca2w==
X-Received: by 2002:a05:6a00:3393:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84f2dfc8f8emr20328141b3a.14.1786040142850;
        Thu, 06 Aug 2026 11:15:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:3393:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-84f2dfc8f8emr20328068b3a.14.1786040142302;
        Thu, 06 Aug 2026 11:15:42 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.231.86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba2b9sm1829259b3a.48.2026.08.06.11.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 11:15:41 -0700 (PDT)
Message-ID: <8cbd912e-0f50-4fa9-b534-7ce1a3c77d88@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 23:45:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: spi: qcom-geni: Document device-gpios
 property
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski
 <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-0-c363a9b5df69@oss.qualcomm.com>
 <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260806-use_gpio_to_notify_master_of_spi_target_activity-v1-1-c363a9b5df69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfXygDtRRDgY/cf
 doul8pDtFB2rAt+FWSdC+kv4xXpUDWlnZcmuRYrVQcsGQF5CjGUFD10YzVttZN+eDV1f4857nhM
 Zuq2QR/AHfZfGnouj5Jq6KRqamrCM74UDO+AQzp4O5tM/NxDjgEzUJgsqZCtguj7yzCRfhhTbnZ
 RmD3bkq/kQ+UXHyOFf7OlrA1glYpeXhSdSheadXbjVQm0SytShv6eJcUPr5fPksQ3BVwUVicnpR
 5BGtdVnsakYvL36pGViPKA9puf5AZLUUfiyABwDmjq6H7cwixxpreHhzY0yRqGy5z/4a6aQiaq3
 OhpAXwnWN/6MfGcQv+PJHZdNtQ2esVQd3CcgwWiFnHmTNXIl/FeDoVSB22Y7wJbqxlES6X/NIeT
 JQ2s3mIxk6DBbsZcsbx7WgGP0588Z5MemB7k/ro615dTH8Mb0mjJdrR9rBRvDb+aEqiircj0oi7
 iLm7i/3O3wJQ7ACr54g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MiBTYWx0ZWRfXzp0XUNiReJNR
 UITqqTfpLOo2kgX5OOioUE1fUTFUScC6rlrJtiB534ucKTuk0djyUwNX4oWHmEs1psXk4LbCUzh
 wdVIZiQCOCbO6mAn3jdd19k9ce7cKOo=
X-Proofpoint-ORIG-GUID: SMpbkL37WYVW_iHPQbv366n8Xb156ixk
X-Proofpoint-GUID: SMpbkL37WYVW_iHPQbv366n8Xb156ixk
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a74cf50 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=uB10XSru4U0CyR2DWkO06w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NXe-hbaaH1PFlVkP-uwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060142



On 8/6/2026 3:43 PM, Praveen Talari wrote:
> When operating in SPI target (slave) mode, the GENI SPI controller can
> use an external GPIO to notify the SPI master about the target's
> active state.
> 

Is this active state meaning target is in ready state to communicate 
with master controller ?

When will it set this gpio ? can you describe little ?

> Document the optional device-gpios property for the qcom,spi-geni-qcom
seems bit generic name, it should describe the signal purpose, not the 
device. Something like handshake-gpios OR ready-gpios ?
> and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml | 9 +++++++++
>   Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml    | 9 +++++++++
>   2 files changed, 18 insertions(+)

[...]
