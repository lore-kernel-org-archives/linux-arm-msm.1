Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0984F7986
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417304; cv=none; b=lZpAup3DpwxJ+eKW1Wm5sJchy0piUi/4JGrQ3Zr7d67Z0/D1UnykYeVbWjGslRss0fPySmhf48YofKMp1HfQz5BDnDo957SA+RLNMJmaG1UPZnHOer1MPSWjs/Pi7pacb7CV4vGWLGwV5P1IEsg4MKKpQhxOo3wFnhxXvffsEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417304; c=relaxed/simple;
	bh=hLRYNiIFpN5MJZo0UujIbLJcUZVp8+gOs06hfUBDIcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=csUQeLOoQDb7mUHZtKCpXLfeBrIMChnl/q9BXQnDoQ1fY6XnlR+FR0gG1c79TvdusBZnzSmW3Z2NI9YPJjAts0i/lmKsRKMKmo1guhezXVhLCRHZVpYOwlUJedzOtyPZonpr9vqDvSnwlxKsqA2NqTbqi9u/Wx9u+DwM7Hs2gPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=omHBm/48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jap7YI+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="omHBm/48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jap7YI+g"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P92t1666883
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=; b=omHBm/48enmLcQH/
	MNw8ut+xE4M1JaFUhd5ppKQYXRk174X7DcI4lJ/rbgLUWbP6794HOkDiJfagG2WV
	xi2YLRAw5FdI+qUlyIqpdv6F7ws+P0WTqi4VnB8qnTQ8R3g4ASB8kuJkryQuTpMs
	+8GCgpschP2zYW8psKdYFFvKyp8xTA7tsVPpu08cfTQnwE+Mq4AOaGb9zKBGFxTR
	yy9zyQA6HDBSr2vDzpMk13XQtm8x/sR1hPgW5uLIYDEEpturxeoP477/5hKDm+tk
	PNz29+fkXoTCUpZ4kcfFXC0xOQkVTVL5mQWZ2Mo+O3Pjic3TPfLi2S5ZJghBpRem
	EjECjA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1bwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 13:41:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so33618685ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792417300; x=1793022100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=;
        b=jap7YI+gWNqJhpB89hLdZwKg54zKBnIsq3KylwbogVJf8yVf8wPp/jyG3Lw4EgVY7O
         O6dv/j/vyfWeXBALV+XPEmOWjGVU4BiQsjmzqndd1TTUOg/hXATgJ8NLe+VD/JF146BD
         TpUT9kyvhY1hnr6vxNe+WTJhyggqYEE1KTfRR5imDSCrxJaES3AVJlVGBM3yDfxCJxwC
         UOAvj2LMpx83/JrfDYAnGRPLt25Hr+Ta49TvjaYZ5TBuacVBiXV+tRv07K7iyID3FWI3
         5DG+zcTzpVqVbDrwZB6fdUOS6QTAc395T7Y9MGCoXOZYk7iqxdjXo1I2Lwa91q50vIM2
         mu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417300; x=1793022100;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDGgUx2y+vlBcRfA5nze/kCSIFOOUQjvYj72SlXRyOQ=;
        b=BlAsmtIqlGxS2W58ihm7cLwnQkz315+O72Iseb+6FVSgFIGgcIJToHjQFAbwQTbce2
         tvhBiSH1fG9JxjmHmQJ0xRneeN1VwjhAOtVrldwVHmagguAehzokTMWeE8RFkV9nBY1a
         r29jKImHfpmuWfCjmirHJrETaHDBSmd1vfMxvv0bSWzs5YwHFMo2JUO6VBaSptvEOz91
         y8TOnmGcf8cWweKAybU0Rai8WvhSavZEygHyW2a8lbiJ5TyF2RNEroVN78H7oiIn4G3i
         FUGWARi97+wkRGlL+MnlcX/x8ytNAD0PfvJSfm7kTQV3bGt0o9XW6cQW16X71TMe+vMb
         w/6Q==
X-Forwarded-Encrypted: i=1; AKwUvByh2YYLV3xELHUsqDkNtCyGT7v0KZMieXaPZmA6xlNyWPZbq15WuausEzyz6m94sDJahBjwccE4Zmfcw+t3@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3VDq/1X16xK0NKvD92IZyQvXTqOU6kAuSGudItnP4/vd7ONO5
	Oy7bqTQJ0HNk8zgdZ052Y1lFG7pLBizqewPPH02BuoZj0AIJevbUp4bOFa1aGCjRAbleyW+OXcp
	RCLBBfTeAL/0uGAiTbkkzPews3KBOaN75EvKQIWY9Y+9IAdLWKpXm3IwYHgbZmcp4dZBc
X-Gm-Gg: AYBFou12VgEZYoscBDSSOYJ2+PAG5pBL7iNEuWIcVB2WGUhV0rDqr9s06cxaEFPRAEy
	UueXDai7tEBgEffmxCgjtbuSkgCMIhD2oVYx0b39wwGZ9sGLO6kVxuCwZ7u3f3aW3UL0m+ujZhp
	9sgXAaWe259cYedRdlqLuEOsyS2QjM0cFjz3FhrNjbEW6N3y/frXY0p9iT4fLc9bPI/owrML0hJ
	wZNvJHYvRMAk5wmjWmBUvUB+AyQNJm8pyz95HA0+ERIGKCh0R1zdJdqkxUUb3vteFcroJzTHwLd
	+rdmGiKuYLMEiApZ8NFScqUT/E3O8OBTy14KLCF4mchpq4zn7qJtju3dsp9Su+pENWlfAtKnuUb
	U170TPAftn4k8mHBiNh4Y7MKzzO9rmbOZroo=
X-Received: by 2002:a17:902:f546:b0:2e9:5a8c:5ae4 with SMTP id d9443c01a7336-2e9a6d403acmr67541185ad.24.1792417300226;
        Mon, 19 Oct 2026 06:41:40 -0700 (PDT)
X-Received: by 2002:a17:902:f546:b0:2e9:5a8c:5ae4 with SMTP id d9443c01a7336-2e9a6d403acmr67540605ad.24.1792417298844;
        Mon, 19 Oct 2026 06:41:38 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.193.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm989185ad.46.2026.10.19.06.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:41:18 -0700 (PDT)
Message-ID: <5c2a1c97-1ae3-4369-b94f-93264662ff47@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 19:11:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
 <20261017-vivid-chubby-chimpanzee-c31c56@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261017-vivid-chubby-chimpanzee-c31c56@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX95AvyVW449rr
 RQ8AFKIa7JLWOSrYAR02MEacxFq/ud3p0wl+OzR5A6d2IMnWZHxVUEuWvmnrok+abz9GneJXe+o
 QAubnqvzaWadCEUGN00WSrCRVpE6MV0=
X-Proofpoint-ORIG-GUID: IHtCcWJQK4601qasVztTogwbX-UCqi7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NCBTYWx0ZWRfX+U/MS6fznvuK
 SRb3dDcLYaHaGrbikewZdYDRc3RjrXr2KyQR6nupJAdm4OFS9IxGcllJFE6FxL9CAeR4DOIekm/
 3j1gDv18NVCS2MHeHyH8w9AI6n4han6wgPlxpD4fg0L9Kik1Avs8zadETEwVlh/6KzouH+GaDFZ
 j51TuFCsLcwanBIlZ2P7XVHIpo1Sa+BZYYRyAYVdm+xK3hlZIEdGdkGXq8Yz2dr49fayiXvt06O
 ezyccXxJktNz/jh31ZvP9Y3BajgE1LCb/7pk+M+jiuXHOHAKCZZUPY5DlrD4JXRd4gdv5RaMWQ0
 v8m1o0V/PR8oCG7AMbMCDdXyq7FzH8SwyRUkDiVkE0Ha5B5K4uCU1pPPg38aRZfIGikdrYUDU2k
 5JHM0D/UBxzvYF/W8Pp7t4YCYxx+6P+tbKbnvj+NI/k1jNEV0yZVcWzJymWTRQUgLzBl7+AQoVR
 21RR8fod+KAK0I244UA==
X-Proofpoint-GUID: IHtCcWJQK4601qasVztTogwbX-UCqi7e
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad61e14 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=BrlcFtHvR1PXzI/wv7BzPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=s_dmKMIZ5sDHlGwdeUEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190054


On 10/17/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 02:42:53PM +0530, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add compatibles for the RX, TX and VA macro codecs found in the Low
>> Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.
>>
>> The Maili RX, TX and VA macros are identical to their Hawi counterparts,
>> so document them with the corresponding Hawi compatible as fallback.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
>>   Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
>>   Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
>>   3 files changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> index 142955b85..41b578f83 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> @@ -29,6 +29,10 @@ properties:
>>                 - qcom,sm8750-lpass-rx-macro
>>                 - qcom,x1e80100-lpass-rx-macro
>>             - const: qcom,sm8550-lpass-rx-macro
>> +      - items:
>> +          - enum:
>> +              - qcom,maili-lpass-rx-macro
>> +          - const: qcom,hawi-lpass-rx-macro
> h < s, thus this list should be placed before above one using sm8550
> fallback.

Right, will move the hawi block above the sm8550-fallback one
in all three bindings (rx/tx/va) in next revision.

Thanks,
Prasad

>
> Best regards,
> Krzysztof
