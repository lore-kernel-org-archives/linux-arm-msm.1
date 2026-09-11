Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038E3839A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789100861; cv=none; b=NzYxmx4V8chhENlDmBRPfKfzf5I5gW6FUy2bz3E/CxPQ8VQAhu7kSYeCtMG4L2Y4wCKTH5fZsp3oQhNQCtfRfIZJXzxF8AuLYviCBDdBqzHe3tEfpxXTq45+nujCzI2zluczH3Odxt4HpQGV31qne9woI3L4+xxW7OtjtTx7sLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789100861; c=relaxed/simple;
	bh=l7BLvAbP/Pdv6FGDbaIFRrv/1rYKCBm7pQkhO5EUGVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFq7TPMOVm1qXTjr7qHEL6lnSIQjFdAk8seCE0RoyzXY8ZhlExH3K4Kbm+ZBQLfEmMvNee1sr9bytLupASMOTSxU8xPhZzYTMC+7BaWVGr05ILUkkkI3FMLumohjhr6XRiZvk6zUlEMw23lT7tXMCUpCf1vQaauqr72YrT+4Sbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYRqXudJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eS8DTJL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYRqXudJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eS8DTJL0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4M5LC2375573
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=; b=dYRqXudJ6cp0K3Fr
	SWnA+MCtmlN9m0ze9mT0UoUcj+e2dtJl6W97lWufLI0R3kM6emFYjMwts5b/a97E
	MCNM8+QEmxYWniSSbYxfw0pyYoW2pMyDI1YgbQ/5yTDYNcsrHLCZDHJgf4SZYITD
	hv8NOmF9IgEzER8l/5vUetm6/3tLXVZ+ktja2UMkgKHp+rQ2IwVM3FpuUXcbjSBG
	kg8JyMISdIeEX73RnkHMg+WJLsZhqZsJ8+zddq2mMpqZ+qkRFO0o5atbhcxGI/nN
	xv1swcfZpqeW5ntAOX5c6xRCNWyMOxFu3OWyBW7KyhMZ3Jo1PK9+aTUxUTogEF3G
	2qV0Ww==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv7avtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 04:27:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396638f9a18so816472a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789100858; x=1789705658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=eS8DTJL0vwkTU3XH0r60grpu0zehzaKtnaV6vNOyki88O4qr7Crkbq7zffOYGQQkfj
         6Nk0H5epgijwN3KmJsvXbc6PVeC+tMATglVc/BiLOquuVGn4qwbiVRXPcKnL40tClx73
         +dXw8eL2B57xRVNqxlyjBp7uwaI853ho169ZNrqcIMvrZZKoB/+0h3QTFFuiST5BDPxU
         wjMltf+zMYLhJUc7Hsyxli61RLu34MC3WNzm8LUehYw3qfaJ32fxiuC+y14NcqeO1XHR
         gxhQfPR8ItkNCToMBAkLyndxHVP2UfN49++yU2Iu7IwBMhnhb/kmr3Kl6lJqA2LcMbnH
         C6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789100858; x=1789705658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vfz7qQYRlWKF32Rq/wiU5EozXpnv1dCrWhFFe4882nI=;
        b=ElGEI+gpfpxnH6bD9YlgNd90cfEu3icMcsa8R3xBG3TcpjUSrtxP+YRT/LZv07F63o
         h9yt/GIn8WoZrqYBzVLz3SOWYOnYanz9pl6wDYTvUsIvKzikFeNmkac/rqWILHvWL8eP
         bcXNGNy9u+ADUfxoY7gtsowt/+UTyXHKnAuyjq3egUee+WwJtxMjle42CaDmHDeVBFbk
         lELBWuqxijpImyKsjmKb7icleLlbmzUheS+dlAy78NYeXXtAovk3POgWXHTYZDApzrQQ
         BXFQUAK1VkXPbCesRwibZe5r9hSq9LUNMz9k9MPiPZ+70SGWGJF5VelMeM7Xs/XFJxkQ
         bFjg==
X-Gm-Message-State: AFuF++kDVgSKUs4gwi4Ws6tfhMXRMXL3+8FMn5LqH/PC5ppFi4F3g7Fk
	NYnX8m/TgDFvzyzQPqE25dhwtXCb0QvstZO20yUutbAzIL9gTMPxDq5ZoideuVm1VQyO4u3JA3t
	hEG568ReQfVeJLdFzl9CeCpG70wrIAYtgh93kxZsO7nSnsLe5sBREtn6yoKg1rIIwsi/f
X-Gm-Gg: AYBFou2RUX33WOMtVwpkUwNd4HrgjinkOBiLYE1BQjisMveHB0FOJMyO4ZMKvyeQJYh
	40MxxXBOUohemaWAmmAgl7N6TJKTldNhTn+0P6bzX2vPx9Kp+IFqq4+OQaIrHWKUv6IdZvo4Vvz
	iy2/Cm1djSu2Xr/zwmIS2ZeX69oq6Bggjfr9+KPj1cGbN48Gk1dvqT/MD38vbTx54HJSJo4zLfP
	tUdyJUQ12Ngl1BLs6heJtyimiqImcmH1OnlLuFKODyd/rspF4SUHzXrkLnGm/kkwQIDiv3XI8GO
	5UbWvN7xJFJ7jFhioA+E8X6S6MyYiviFVkt8AwGc7M7sg7qj949Tikx+3sV5y4vFMH0ddaNX2Lo
	DnZ9FELt87lM2SY8NrKaSFtTmSu0=
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4018031a91.17.1789100855707;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39d9c345ddfmr4017972a91.17.1789100855066;
        Thu, 10 Sep 2026 21:27:35 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b5e1edsm3072419c88.6.2026.09.10.21.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 21:27:34 -0700 (PDT)
Message-ID: <3e322428-7673-4428-ae29-dabd9cabb974@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:57:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Hawi CAMCC
 compatible strings
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-camcc-hawi-v2-0-f892ba1d118e@oss.qualcomm.com>
 <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260908-camcc-hawi-v2-1-f892ba1d118e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfX8IXl4Lgu/6vw
 YqT/n0pV5J0CfL+CcdPsQhHwZQK7MGEbV8QR37gpUFg9wR+RIDcEP0r/hY3b0G1l+Fsx1O/BdKq
 kvjLlXyulP0dNEbZY1/UbTSHmkt19CE=
X-Proofpoint-GUID: hyUvjoB67Su3e_TAhwvCzV9Cl8vpAlld
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa3833a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5R3-X4UbMoIwJvzG15sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA1NyBTYWx0ZWRfXxxkHT3EaLSg6
 zePaNKpX/Nk0YSslKA9Bejwx00ooQSjqC4RjwM2fRsNvhwe9YcYzGV4wMbawFQastWom05WnPnP
 IGp7PJjyQ6/ddQoyNzM2naujEyq4ovizARRmF+VNqMXtTw8K31Ka9h0VGMbrk7GZQagH/WfiSpc
 Wylwh8FEddi4zoqsHojBMm83BMK011/nQAYyMDHCoyUwgIap7pb/Ka//fH0qz2w4rNGln3cc0e7
 cc3ZL4FxfWeqEpRgI7uvs+9gVxKKX7lC0Flk/VoZSq+BDp3+d316m2A+lejssXOOaCvwocGYQS3
 J82PAVWuWJsDC7B7/bJbnxjbu8jNtJLcoZHtnGYn4fEflEmEqLDFI8btu6AXq+wyp5SqCbFPeOH
 9mhg6MDvWzn81F5V3e+JzJQMAdV5GlmqvSj1CXXUMEFI19pkCubLef4SsKNQ5G1WidSHlSboxIE
 D6dslk9FYIOLQvtK8qg==
X-Proofpoint-ORIG-GUID: hyUvjoB67Su3e_TAhwvCzV9Cl8vpAlld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110057



On 9/9/2026 11:31 AM, Vivek Aknurwar wrote:
> The BIST MCLK clock controller (CAMBISTMCLKCC) is unchanged between
> Hawi and Kaanapali, allowing the existing Kaanapali CAMBISTMCLKCC
> driver to support both SoCs without modification.
> 
> Add the 'qcom,hawi-camcc' and 'qcom,hawi-cambistmclkcc' compatible
> strings to the binding, along with the corresponding clock ID header.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml          |  27 ++--
>  include/dt-bindings/clock/qcom,hawi-camcc.h        | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index f65380747220..3e6ba5505584 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -16,6 +16,7 @@ description: |
>    domains on SM8450.
>  
>    See also:
> +    include/dt-bindings/clock/qcom,hawi-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-camcc.h
>      include/dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h
>      include/dt-bindings/clock/qcom,nord-camcc.h
> @@ -27,16 +28,22 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-cambistmclkcc
> -      - qcom,kaanapali-camcc
> -      - qcom,nord-camcc
> -      - qcom,sm8450-camcc
> -      - qcom,sm8475-camcc
> -      - qcom,sm8550-camcc
> -      - qcom,sm8650-camcc
> -      - qcom,sm8750-cambistmclkcc
> -      - qcom,sm8750-camcc
> +    oneOf:
> +      - enum:
> +          - qcom,hawi-camcc
> +          - qcom,kaanapali-cambistmclkcc
> +          - qcom,kaanapali-camcc
> +          - qcom,nord-camcc
> +          - qcom,sm8450-camcc
> +          - qcom,sm8475-camcc
> +          - qcom,sm8550-camcc
> +          - qcom,sm8650-camcc
> +          - qcom,sm8750-cambistmclkcc
> +          - qcom,sm8750-camcc
> +      - items:
> +          - enum:
> +              - qcom,hawi-cambistmclkcc
> +          - const: qcom,kaanapali-cambistmclkcc
>  

Please add the interconnect property in bindings, similar to
Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml

-- 
Thanks,
Taniya Das

