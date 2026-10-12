Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBA44AB88
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794475; cv=none; b=BOVQ8jL8iO4u6z2BNoGWBW5etrfKbD4U3Fjj2ZcmTft8zPPAz+MRGXNvf0cIQ1lXjzd8o++jZACl6zxxGODY9J0Pa7LBqBA+AfDKfQ27QDzUxR8DDLiiS06tCzAIWRWnT3rDjbyCCk1TyoZKC/In2WAcEK4B+//c86G1aJx9hfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794475; c=relaxed/simple;
	bh=Hfq20dRp+wFT03a4/sFntrP0p/AxTie81mZS6a/kB1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4BgPWrkOJY6PuZ4SZa+CYMJ+eNdVszT+QxEobMO8sSHEZeYH4BfgzuS3U5lC5DtAenb+nkx5D1A6nJdkMP6wnuaGY8XQT51jWPaNf6+ewHv9jY/qR2vBhHE+I0Wf3/xTH5sltUBl/1lh56gAbiWIusleSd0V+sWjPuVbwFyRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ai5FHyzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIi/iiHD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ai5FHyzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIi/iiHD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KbJh2873944
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=; b=ai5FHyznuqWJvwh7
	nFw9jGAjXyjV9H5Z+mcIUA2ESi5ifOMKW32t0UcjzUd7n5QRWA9bEhEtG9DRk2BO
	4fK2ZuYuau57oxsHDZHWS5j2SEBkIpQkMpd8EjH2nMc1paqdjEwoYo9wIr8kzxn1
	ATahCT2LL6Tzrr3NxfV70XnwgeMQ/88UlPMT6oY21dMeY/8R/6vFxjLSwlqODBb8
	M2+KfnNTbp5E0IXuYCEVOko3N3JxTtGKlQt3rhmgEOLDAM+R/Rq8r8iyBB5c8Kls
	Hh/3TSCEGeCBt7iiqCJJpJuvdNhdZxYlIjKHfsMJVQHd/SFtOOoxmzF1Z/2wMJ/z
	Hj+MUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe0xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:41:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e6188d1e51so20605115ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794473; x=1792399273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=;
        b=dIi/iiHDcnEFx7FaeLPUHYFrsV46OdDdX9qJDmj1/VCxiAcLvERkQbR5wEbPH9Zzx3
         iBtr6/+BJNsqFnOhvCkElByIdZPGNFR5zpY0uzxi4E+gDYInPc/pYgMFoLj/uHWaSpnA
         vRGdDVT7FGYW4gJZeC/Qs6ZvMRmknsw8AzNoa6iecIfHqFUObDmIYVTC4chqt1K5s61x
         4e6wuxcakjG6wpoESj7DvpYs5EmA+Yw8PIcpZqTkuQLIW05ErnUD51IpiJD3+bxTGjmD
         JWUFL5koRC7b9UDSFXNap4e+3EuXJFm7dU9+KJFBW+6Y0j8UMYybzQ3y+RWz7GL/h5oD
         4Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794473; x=1792399273;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8GO7ExOgblqj7+GdipBZ3YhlJBmXYlbc4wk298drcU=;
        b=B2angRvzBKSS29fOCsClyfdcM8sveJBR9x8xY5C59uJpubCqesF1j0cXub3d2cxH/A
         uqqxXjHiDl+JuPWp4v+HFFsXVSHTsuE9rP/Em6OWFcAdAPVBmBh02sB9t4EYNbDA5gdQ
         r1ihgwEWvAxmECY1MmtTFbQynaEJCF2WYqSsrkZMtqjD+59x725PvoCZ5YXj9/36OB/m
         B9mOPN1rsfhRd8zwqvSP3gzdOXdTqm/+nf/XMmo0J3PvvhKzThKYGVT/Kan293SPar7K
         bCOFFZadal9WkUsy0id+dzF3kE6tcvNHXTZ3hCWfK568viHfA2gy5m2YfPmQWnb7bpdL
         zgAw==
X-Forwarded-Encrypted: i=1; AKwUvBygUSYn7xq3ZMNLjBdFuJR5oY3mWvE+TGL+vsbw3qGjFBU1yeD10nn3yF+Wn5f+sgKsPOR/8ErZ67gR2KTv@vger.kernel.org
X-Gm-Message-State: AFq9FYJxfOVMRDckQ0jECaN2a5ZABG5aJYj9cYlGo961SHXJSA5XI3Cd
	Je9zJv3NhZlwHkuFm0VG4THR7FA9SGI1PCDtXO+IjHFXndNKot9piLyqwCxVrH/qNhZW5CCWw/j
	BkTq0MC52w/EtrQqBWtYYxZymk0VvUbTtVo2iH9XCuOJT1g+i/TGIUWR/faVUWt++gwVc
X-Gm-Gg: AYBFou1nrGNV0rlZ6f8PhcXQ4NK1Rdemb+cG5jBTpzaVTwRXmHooNu1stU6R2xv3Pgi
	lPww4roLfsMNApSLevZr8iBIXOyD0P2/o9BulS7OP8K4DJz/bntBGxVh1Zn5dsVFzjlyaf1fPjI
	XmnJKZdQVZjnST7ThDa5JuWSIPfRqvojDSWhy9XiFOkxwgVRjqe65AdghVraP8jM9TjjajB5bAM
	a18omuZ57zZCH6vpxKiv69g83u3QRnTWU9nZ8yrf56W8aERX4pQfAcorU1dkkW/DeqyNkeo0g21
	fQK9w3NrP9Ffhg+Mt6XQa8zB92+Slw7e1/gUFHflTACBNdDx/kGX0l9s0lD9FbTzFVlAI5FCfha
	PQvOGGO4okn6F+DYrdwPOXTjbeBMrew2iRp/QqU7qNA/N3DyjJbGWLccTn+dWQN+fKXVTZLE=
X-Received: by 2002:a17:903:15c8:b0:2e8:f7a:c69d with SMTP id d9443c01a7336-2e8429a8013mr71142845ad.15.1791794473005;
        Mon, 12 Oct 2026 01:41:13 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2e8:f7a:c69d with SMTP id d9443c01a7336-2e8429a8013mr71142745ad.15.1791794472496;
        Mon, 12 Oct 2026 01:41:12 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e14f6sm40626185ad.69.2026.10.12.01.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:41:12 -0700 (PDT)
Message-ID: <a09f71a4-31e7-439d-b053-66b279ea27c7@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:41:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
 <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <f3qs4wcascfodjufisl4qtpycfb3lunff2fv4u3olybjius5kp@vahhjfjfh6wv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX6opmWCsGnN51
 gdRsDugbB9d3qEjo5tFiFPPAptD1tjCqD5Q6rhLAYbW/PysLZWt12/RKm56S1hlbR+uNX0TifKN
 ngb+fU/cA29qJvf1CW+kLa011MURUmA=
X-Proofpoint-GUID: Ug4DDVh0_xO4XEchwt6SQe60_vU-7Ifo
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc9d29 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rG2K5GnlOK9i5R8LVMAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX8gUUkdzmfxxx
 DEJHF+pdmXhIvhE43s5V/r/ByMIdS1SbcGCKES1ADuf1EhwWvfTDBhN1F90qnOt6wqBSO8RII7m
 JsadLGYySuD5sKruisi4nsgm6SYRmHBXFNq02kphO5h+OnIMqpJEcrDjafZzB+DU2OoW4728lXI
 aITbqm6XqTi2agr4IhsKdWiJtFjRtjjOZIz6gIiqb9txeobzMKBiIEzWROLLdQa/pIuoIPRgiRG
 zKe3GllPHTPWmikRsBpzpub9/BsnFFtXr98VWHR6Ni18HtF93RWOvGSQXj7xx2h8crBfKymGg+D
 gcB8KPQHnlKGSvxqOfK1ilRYe0TO9nJ73d9NiKsIuKShbff9yskRt6mkhFV/OZxv3Pescs/qa4o
 MSYkQcHqTkQnWfw+LhDgrK1Oe0H1qcICqXUJ+qLgoBbzqY9U7MRFCWSvEP6Ikv2s0YL1cMCY5bD
 6VcHStzR4CpXHPDaO5w==
X-Proofpoint-ORIG-GUID: Ug4DDVh0_xO4XEchwt6SQe60_vU-7Ifo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120034



On 10/5/2026 9:02 AM, Dmitry Baryshkov wrote:
> On Tue, Sep 15, 2026 at 05:27:48PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
>> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
>> that powers the rest of the MDSS hardware.
>>
>> Describe INT2 GDSC as an additional power domain of the DPU device
>> rather than of the whole MDSS, since it only supplies DPU-local
>> source pipes. Restrict the schema change to the Kaanapali DPU
>> compatible via an if/then, so other platforms sharing
>> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
>> existing single power-domain constraint.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> index 3f953aa5e694..19b791a857b5 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
>> @@ -25,8 +25,7 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> -  power-domains:
>> -    maxItems: 1
>> +  power-domains: true
>>   
>>     operating-points-v2: true
>>     opp-table:
>> @@ -53,4 +52,20 @@ required:
>>     - operating-points-v2
>>     - ports
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          minItems: 2
>> +          maxItems: 2
>> +    else:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +
>>   additionalProperties: true
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> index aa0cf0ec5b93..88aa71d2b912 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>> @@ -61,6 +61,29 @@ required:
>>     - clocks
>>     - clock-names
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,kaanapali-dpu
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          items:
>> +            - description: MMCX power domain
>> +            - description: INT2 GDSC power domain
>> +
>> +        power-domain-names:
>> +          minItems: 2
>> +          maxItems: 2
>> +          items:
>> +            - const: mmcx
>> +            - const: int2
> 
> Nit: I'd suggest more generic names here. If the next platform switches
> from "mmcx" to some other domain, while keeping the split architecture,
> the name becomes unapplicable (in the past we have seen platforms using
> CX instead of MMCX). What about using names like "core", "int2"?
> 
Agreed, using "mmcx" would be too provider-specific, as the DPU 
performance domain can be CX on other platforms.

However, "core" might be confusing here because DISP_CC_MDSS_CORE_GDSC 
is already attached to the parent MDSS device. The first domain on the 
DPU is used for OPP performance-state voting, so would "perf" and "int2" 
be clearer generic names?
>> +
>> +      required:
>> +        - power-domain-names
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.43.0
>>
> 

