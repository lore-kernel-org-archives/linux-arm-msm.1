Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2B73AFD0E
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288115; cv=none; b=NffaR0dvQ4f2hv93RRWqrF2FpS7PtuNe2Ugn4PG4iZ8YYCD8YXjbB68I4pexSZeltmi7qk/dEZr5uiE2Z+uyumyvq4D+8pQgwJjUUBDdQH/f787mNQNXyirWtn1UBB3Oc0CYP9Sk5XYpaqWGoG/7wFw5TwFKHKSZErVW6DpCchU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288115; c=relaxed/simple;
	bh=jbmancpsHTjVs2TeiXOri8bQFZyZ0a+JoVJMwsnKP0U=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MQOgWr+tLZSNA0BzldXPixJpYESqkmK5fbxwYv5fa73wDWqn6YuFjiFL4ImSHgt/XUFAZ0u5CHEUJBlw6JxTDOdQ8IiR67OTppTAzvk9IZxfdMNcPmX0NYZrGe+HHrLj4rypTPazoU8mVnoZ6Q0HMwC7SxPTCE3JtrpeS220mIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eujh0OHx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjcKdwH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eujh0OHx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjcKdwH2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21XXY913028
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk9NLu6lCcY8JkSba9VV/ahy8MrSZ53djuNpID1PR1M=; b=Eujh0OHxd2HnZjx5
	dBlEVwNEtHMvBseOq34Pli3xN1EBm43dmAnwCuFKJVEKiKLlXYA5qnfc0d+tByXk
	eGemOaPGFTXmqVAiecsxmlYX/78ie4koD08WRd6qGOuIP4+ln2StYCgskgqR+Yxf
	VaIsdwFnGPlgDtrDUEc0i+g6eEyy6YefZBYiwMSyR3gMw4yYy2Q9FcKlVeEO6hS8
	pZqmgedIcbnPX/x1rgkoxO4jUXqWKCMtW2IfVtopu8LNk1fi2E4xivjqHzwmDe/Z
	iKu2lgNhpLAGQyNMpAnixEmuApMYpS8dELmqka9aCQPA+vFmdYXFLiWAg23pFkHt
	Eb7qWA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk4ej0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 04:55:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1019057a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288108; x=1787892908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uk9NLu6lCcY8JkSba9VV/ahy8MrSZ53djuNpID1PR1M=;
        b=gjcKdwH2I68HWHNWrCrWWxoo+3opqwKoalW4BE7yP8FI1HKsjZ0IPEPibp03V5fsft
         +fbSNo2VOt4vMD3Mce9oyEjQi5yCJc+roXe4hKATFswz7vUmvH5uKBDJL3cxq49Kazd1
         W0k9lxmuDxQiTyugjZMCPlwbd1ZcwA6FGzvlcY+uSVSp8C5/+/iSC5O0aP/Xo62JFpvp
         CD7oe7uSeeJ+U/kXiy/kI5sk9jqvVeWU1st7pDlQUDKNHlt1/Q3gXc1KxAQlKpCOFxaJ
         HSyos6fYFBol7oO79wjySu1Yyy7DrMQ1Eioiz5tHiU2VnCtzS/75+8zz17PF8UsbIkaF
         mgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288108; x=1787892908;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uk9NLu6lCcY8JkSba9VV/ahy8MrSZ53djuNpID1PR1M=;
        b=IXpOiHuiHQMEdMBOOzwDZvDWUu3wtepZTfGzY4P2CIk9tbEtIfDRBFexNqLdjWKU2U
         rnzsOq4lb1djpTmkpNrmMQvbxiLzxmX3PgFUl5u6IXKv4VF3lt3XLHLPiQQOXADItYJL
         DuPtQSzI4nONjwI3rGgUXzJ/8AHJhFgxh/B3HS2mHY67JWLkD3OzySA9BjW1RNkHJHOM
         84ZlY93y1zStnM+xnz+TwJ1SygrFv7saJvNsKXOQccluy2V94LqLI5a2k1Cih5aeh7Rd
         VvZR3yqAO/Ng4E3lND2FzLZ3dOTdStH1KC6MeuZNzYgVD791wQ8p83Sw+om5F31IpIR+
         Id9g==
X-Forwarded-Encrypted: i=1; AHgh+RrtclenzHWNNDE98u6oRQIZj1vlzYPR+osu52cKgbIW07HCRKSAW1eYKktKB8qjaA2FXfUHXndV9O7/KZmi@vger.kernel.org
X-Gm-Message-State: AOJu0YxvjR5gQrlhCeLerg1CLsQV1h+xrBaGJHXmgSq+77G7ZFtayFdC
	RYhhVX4ALgSB6QiOJZSslV78fNz4Fh8qAfUojrxb4ZGq9HEn9EweF2ee28cX6sukmh4Uf90w6h/
	hy8xTS2h1bFoH+GqHFikP7e8kXLzuW/9yuxZN1C4INJ6qdCAYGLh008T5rymGiMN2c3h1
X-Gm-Gg: AR+sD12Pr117mJ4rT7WZJmL/5JKv/fT7c3KPXNnNxu+sTXUFKaopL5jxvSf0ATb+34Z
	N6KuNS02dSGuJirfXUWSWPmtkH2AomQhULzu6A01vUMuR61BUOnnYTrQuwZmeTiTxlf6mfLP05j
	SkxRohxogfKVeYsI0pKMAb1FSRQ/D/x6lnyM7fEAOKOnVI9qErIFFrl/VtmuKgUYl+tEaRW/K35
	0Jl54LdsriHyJg9PAYEauLJlnUIqK5hRLDPOlXnwUU8dIbkAHbaeylj3OG01X8GMWm+n4e6AVmx
	USYZbdTMA5+VmxSgpCj7IZjNHV1KCoPfP3DPiTGC4/rv4bZ7TlH+mnHNBFohR4aggFe2Imr9zjr
	8g5FwGt2MaPG86wPZ4kNMMaf+ET9XIw==
X-Received: by 2002:a05:6300:67c1:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3cd306150e3mr7172991637.8.1787288108174;
        Thu, 20 Aug 2026 21:55:08 -0700 (PDT)
X-Received: by 2002:a05:6300:67c1:b0:3cc:9620:5816 with SMTP id adf61e73a8af0-3cd306150e3mr7172878637.8.1787288107721;
        Thu, 20 Aug 2026 21:55:07 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3bb46sm20562131eec.3.2026.08.20.21.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 21:55:07 -0700 (PDT)
Message-ID: <16248e00-5ac9-43c8-9e4f-1b3fb061dd2c@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 10:24:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen4 ADC
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>
References: <20260731-pmic5_gen4_adc-v1-0-9c49b2eea6f9@oss.qualcomm.com>
 <20260731-pmic5_gen4_adc-v1-1-9c49b2eea6f9@oss.qualcomm.com>
 <20260804-marvellous-crayfish-of-recreation-d06401@quoll>
 <4e25b74c-baea-4283-9730-7313162284b5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4e25b74c-baea-4283-9730-7313162284b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rZgoewz2E1HuC7zp6kWVEuoJTlBvXmor
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX4ZUNA1gVEUOR
 DBzfolsNmpbcRbFcW8YCfKbjfLXaAhRDZ/aSJ72h92A7m1B7RerWOz0MoDctnI7NmF74F231DW+
 aOqE63ZmHiMhHmy2/HKTr4Ogp604aok=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a87da2d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JbgVt6K1tEAjoNa7P_MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMSBTYWx0ZWRfX5cwsr0xrdMZ7
 jhUUA4XQjEPFOl74dH5xRe7gsGugKnWv9tLtsfcobLd9chsryiOPGVy8+//FncgEgck9nibF/hn
 oykSkxGQmI5qULpel1RG3yEAg5+x0XnJtppuQOaFXL30rlHWEjy6xe4WnAlDbP3uqkvYeQs6qoH
 sDEavsqPFW7Uj3uoVDgmwj64QeSZla2R5J1UmkTjCCnGNBlTtdRvrre4qkqE/jwc1y9H0LEcA2Y
 SHmWrM+f5NFIT6KSQ1CTrsmu44RcYS0nlfXZtaeQOHALM7hSMQNE0QVc/m7DfH7Zl3TApAqohDw
 /ZKzVRuj8vzUAGPUTkz3+9/P4ugaeIqcLDQHRRNWqRRBf1dTMZQG0sifsWY3Xxknbpt7rDxU35b
 8ng2qeuiV1/iyzfsJSTv0q/fHRbh+bkOd4AaPPB6sh4I60RGZJ874EZXuCHeaIE7YJxDou8J/83
 9nKUe1zBXq+iDbL/tVg==
X-Proofpoint-ORIG-GUID: rZgoewz2E1HuC7zp6kWVEuoJTlBvXmor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210031

Hi Krzysztof,

On 8/6/2026 4:23 PM, Jishnu Prakash wrote:
> Hi Krzysztof,
> 
> On 8/4/2026 1:50 PM, Krzysztof Kozlowski wrote:
>> On Fri, Jul 31, 2026 at 11:36:14PM +0530, Jishnu Prakash wrote:
>>> PMIC5 Gen4 ADC is similar to PMIC5 Gen3 ADC, with several changes made for
>>> improved performance, mostly at the hardware level. The main differences are
>>> increased ratiometric conversion resolution (from 14 bits to 16 bits) and
>>> increased bit field width for PMIC SID (to allow communication with an
>>> increased number of PMICs, supported on latest SoCs).
>>>
>>> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>> ---
>>>  .../bindings/iio/adc/qcom,spmi-adc5-gen3.yaml      | 47 +++++++++++++++++++++-
>>>  1 file changed, 46 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
>>> index 149f4af8f4b8..e79ddc2acca0 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
>>> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-adc5-gen3.yaml
>>> @@ -21,9 +21,14 @@ description: |
>>>    All boards using a particular (SOC + master PMIC) combination will have the
>>>    same number of ADC SDAMs supported on that PMIC.
>>>  
>>> +  PMIC5 Gen4 ADC is similar to Gen3 ADC, with some differences such as
>>> +  improved ratiometric conversion resolution.
>>> +
>>>  properties:
>>>    compatible:
>>> -    const: qcom,spmi-adc5-gen3
>>> +    enum:
>>> +      - qcom,spmi-adc5-gen3
>>> +      - qcom,spmi-adc5-gen4
>>>  
>>>    reg:
>>>      items:
>>> @@ -83,6 +88,46 @@ patternProperties:
>>>            This property indicates ADC_TM monitoring is done on this channel.
>>>          type: boolean
>>>  
>>> +      qcom,adc5-gen4:
>>> +        description:
>>> +          Indicates channel is of type ADC5 Gen4. This may be needed in cases where the
>>> +          master PMIC has an ADC peripheral of type Gen3, but some of the other PMICs it
>>> +          communicates with have ADC peripherals of type Gen4, so channels of those PMICs
>>> +          need to be marked as Gen4 to ensure their conversions are handled correctly.
>>> +        type: boolean
>>
>> It is implied by the compatibles, in this case the peripheral
>> compatible.
> 
> This property is needed in cases where a Gen3 master PMIC has Gen4
> channels under it.
> 
> The main point to keep in mind for Gen3/Gen4 ADC is that the compatible
> describes the ADC peripheral on the master PMIC, but the master PMIC's
> ADC communicates with ADCs on other PMICs, which may not always be of
> the same generation. Under the master PMIC's ADC DT node, we have ADC
> channel nodes from all the PMICs it communicates with.
> 
> 
> For example, SM8750 has the following 8 PMICs, having ADC channels:
> 
> PMK8550 (Gen3 master PMIC)
> PM8550
> PM8550vs (2 instances)
> PM8550ve (3 instances)
> PMIH0108
> 
> 
> ADCs on the first 7 PMICs are of type Gen3, but PMIH0108 has
> Gen4 ADC. So ADC channels of PMIH0108 exposed under the PMK8550
> ADC peripheral need to have the "qcom,adc5-gen4" property to
> indicate they are of a different generation and may need a
> different conversion formula.
> 
> Similarly, on some variants of the upcoming mobile platform Maili,
> we have the opposite case (master PMIC has Gen4 ADC, one of the
> other PMICs has Gen3 ADC), so we would also need the "qcom,adc5-gen3"
> property for some platforms.
> 
> I'll add a description for these properties too in the commit
> message, hope it helps.
> 

Please let me know, does the above explanation look fine for
why we need the channel property "qcom,adc5-gen4" ?

And Jonathan was asking me to split this patch, to add the
new Gen4 compatible first and channel properties separately,
do you have any preferences there?

Thanks,
Jishnu


> Thanks,
> Jishnu
> 
> 
>>
>> Best regards,
>> Krzysztof
>>
> 

