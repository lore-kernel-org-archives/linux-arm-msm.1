Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CA3955C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166085; cv=none; b=VpGB86Cn+9qC5v4+nflAmY7uqgE5raskD/EO5h5EQZPF0/fwRgCno1G5wMFdw9U8FLPAOYr2EL2UCXdsEQikUPO9i5wIMvE3W4u9ckxe1Dn9MGPBjOemEc3oISbXQUQ6vW11IWuxy7U6Y//L8gjWacp4HtLLEHW14tqtVar5bSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166085; c=relaxed/simple;
	bh=ngaxqFOtln2nHsPTDS+hFwh07MaPzdPzfMxJ6KosXBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eGK+YqhxFM31l48tMKqn5E3LpEGLs7jIKgXhSXZ2ohAPdSgY+gwkY0gikEE9CYy6v0jSQb5P89syoOHx6t81gNjK64ASXQlj3H0Xx3x7Q1qqTodg5/r83K6DmaU2EF4226fdV+hcb4kH38z8r7xDCUNooiTfT6xkwnpvkQX7wHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBUHu++m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shjv13v+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBUHu++m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shjv13v+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaYO3905404
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=; b=aBUHu++mZJBWylru
	65PtEuN/p9e98wNE8PWt3MmbcO2T0GXJcoWxacD5oacEc7+QAUpMuI3CY6ZI+VhI
	JPCgpNfiURepy/eFjKwgUB9FW3uUUPE39bqXZhL1R50cI1210MAJg8OPnjh8ig1w
	P7poJ0goChEyo5mUMeplgvGelLYGNXX3FHFHNxCseGa0RBNeIK92FEAd84jpNAn7
	pCmQwZ9TiJjEKD6p8jCCluwUGNYMoP8qFow2DLtKKdUKw5cOYT8P/LPzfmkUXlNA
	zjjp8HaZcF2alSIqOgff7ZLCXyIs8mgjI838cp9jY/MOES6dBYVhHtI0oDhJIX1B
	srxQUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uksd0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:28:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca7c1e22995so4622787a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785166081; x=1785770881; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=Shjv13v+iqAXCxAPp+WrN7J2XWY/kF4SCn1HeoP8mkOM6y2ZjfFNlpazHUDuxpfiXc
         ZHwVJe1SvHAy34GC9BItsBqeAWrXEEfLlVKADQ5qV56OFwaeheyk1kqBDE452FvpLvrB
         ZlY2SDdBWtKjvDYDCARFtggUjsqj9fRbcD8vTNzdu8SOgtsF8Vj+v+kTlcdHLrH/9ZQp
         Q6ybt6WAz6hV3klsOAzHLJ6XiyFJ+MQw0dsj6KEUROjg/klONzwfZULlx6645vQ0x2wZ
         EtmAeG0mY1tsLmV2Ah9FB6VyLT+eud/aTOHIRpFvxicrJ9hebTKFkYNSq2YfmJ58S0aX
         hQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166081; x=1785770881;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhp+lSfxStrLP/lbhM8SGKXuUYig6H8Cg7yd4lCGVMg=;
        b=F1/S7th7tmU6MwCX9tRGK6v2tRY/jucoddceh6WRKaJkX15o6iHlzC9ErlqNGua9Xf
         a4+afa8qBa6b1GkGjKNOq1cNzX0Hv9Fuzoe8ufdEyJLuUoPxvKxV0eljBJw8nLqONJUi
         as/qqDxADLZJ7YOlbAwfybjZSEiz7nuNmuOETt4DaOHdTweNx4h6NbHV4e9AAnBfxUul
         nXKcsVc1IsG217tOb+mfjCUUw14HPZOS3t2PW5LHIxZ/uRvuyrhFb/4zbFkhm4wVbNsj
         Lrfx5AAZs6UvBxb7aa/aoK+yS79Rrw23JvzMKu8NJ5ZqzcJ3izNcF0yuMJvvKp+1k8ee
         iivA==
X-Forwarded-Encrypted: i=1; AHgh+RrKb6BiaegB2lvZFntzXjywLTfCGML250+WQln9lFPij3YMgTpCy6JPDc2yX7WB5WPzjxwC0+Q5dipmto/9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz75/ff6/maIit2gt3mJbzT1I2f7qaKm/gsdN0A66M0IufrWdFh
	8DCEuIDpQtHcWO+0N4n+ZY+YXd0BUqBqdOW7+kuHDoapSLUZEmuG5aNX36LQwTh8LCH85lLNNnp
	Yzy6jU+gnbZaz+m7zKDaaKOurAeybABYmcvXkdAq+IVDl26P1102DjVuTjPzy4vWgDTWb
X-Gm-Gg: AR+sD11g3/wDbR2buX0InmancRUpvmO0U5styu9312fgNQ7FNmWi4s68oGesHhAP1yJ
	JnE9xqh4dauOarj0c0jpDQH2QRDrH2DJ1maYNJhS/v/1kJVh6tkiTnEaOEcwa8awnHDJrgIu9/N
	AmcMPELP2CN7f7WXcW9e4HQOWuCj8Rttb9cwp1+1L1Z1NbwBy+JTo+/pFsvBeAGLfAmn9lAqIM/
	Jtess7m40TtiyQeBdE8Kxm5F3lJk6wwZcMRMa/mz6bUqNvMWfpWwczrz148eKx50cUPbO6u7Hux
	fen8YX6T+Wha+uPW11I3KAfAmDzXWSk8gD6iwynDqLlpRDcSjjpaKy5DzMZnePKQAgfbq4QdUwT
	oWMkCWoK8PKmD3RCLDMDmkqiYebHK4A==
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639465637.68.1785166080977;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c67e163784mr8639426637.68.1785166080541;
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Received: from [192.168.1.3] ([106.212.244.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dc15asm3383903a12.30.2026.07.27.08.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:28:00 -0700 (PDT)
Message-ID: <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 20:57:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: txCxWkJte8vHdLenwod35iX45HMt8fDM
X-Proofpoint-ORIG-GUID: txCxWkJte8vHdLenwod35iX45HMt8fDM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX6EIy6BZ0ZdmM
 JikzEUos75yywWY7Hv6tVv1DGZiOkcEszXJ4jyM1m+qwW0aeq7gsmFZdxKDJRViwZw7BcUhmuIs
 zYSv0hOb7okZCdfdryJJQbi2EBtbGvY=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a677902 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=yelsqLKVWbcqNe5dfEYUXw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KLQR4twFUm2b5WDXR-sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfXzhdmGJCnQ+kR
 J3DFhnnEblPGR8Ysgws5LnuEPAlR5rtyiLj8X7S6wUMhmT0s2GwmOu33Cf7pZsIfcRK0WO9QuWX
 Sw9tGIXAMNB//9w3LP8HTp+DW0FUcTwRYs/tObdmCF2ohQnLe0CKvftDsHnWyR4aTZCTp6xR1zZ
 VRJP7iZqsS87MAZHs5PEpcbFXDBrxVzD4aIEachCv8q7TnZ/aHDPKTJ+Mu67LDuGogPXwDQiuar
 lfNUVoMxh9MpNA3hBhvz/8qhKqOiV0BRAOX6C5y+K2R/HMXpCbHw11pi6S/4uMpj1HsnKSl9Faq
 ZC4TMqfcZE/x2xd+bJEHXM8RtcGof6xY4MKoH9mRk7WZR7krBMislOwLiBHL3c/tNiMpgl9JrPu
 Wi9IJzH4ivh3RO+AgJuzJZvmDJoEgJF/5MlDtLwWQdLm2kuEWSdSsS1i4IDlyR/KP7m2p+rMBkp
 y/Obfz2tRRlrNTecoCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270145



On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> describe Digital Audio Interface (DAI) child nodes.
> 
> Add #address-cells and #size-cells to allow representation of multiple
> DAI instances as child nodes, and define a dai@<id> pattern to document
> per-DAI properties such as the interface ID and associated clocks.
> 
> On platforms such as Monaco and Lemans, third-party codecs are hardware
> wired to the SoC and do not always have an in-tree codec driver to manage
> their clocks. For these designs, clock line enablement must be driven
> from the platform side, and this series provides the necessary support
> for that.
> 
> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> introduces the required device tree binding support to represent and
> vote for these clocks from the kernel.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 

Thanks for the patch.

Tested on Shikra-IQS. No issues observed.

Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> index 2fb95544d..78587139f 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
> @@ -21,6 +21,43 @@ properties:
>     '#sound-dai-cells':
>       const: 1
>   
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +# Digital Audio Interfaces
> +patternProperties:
> +  '^dai@[0-9a-f]+$':
> +    type: object
> +    description:
> +      Q6DSP Digital Audio Interfaces.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description:
> +          Digital Audio Interface ID
> +
> +      clocks:
> +        minItems: 1
> +        maxItems: 2
> +
> +      clock-names:
> +        minItems: 1
> +        items:
> +          - enum: [bclk, mclk]
> +          - const: mclk
> +
> +    dependencies:
> +      clocks: [clock-names]
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
>   required:
>     - compatible
>     - '#sound-dai-cells'
> @@ -29,7 +66,20 @@ unevaluatedProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
>       dais {
>           compatible = "qcom,q6apm-lpass-dais";
>           #sound-dai-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai@10 {
> +            reg = <PRIMARY_MI2S_RX>;
> +            clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> +                     <&q6prmcc LPASS_CLK_ID_MCLK_1
> +                               LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +            clock-names = "bclk", "mclk";
> +        };
>       };

