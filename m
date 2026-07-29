Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88D247D462
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327246; cv=none; b=TbiTGnZnBAKjj00OYWhRk8G9uGl73ztyni6UwOk0X1uBTxacS/Qz/djpHGb17ijG6bfiv0BAKEUj6A8Un7vpFuDGer8vLlSJzX0LYAkZ7Zi/OLu8/u8yISccMx+F+gPc2YfD+4PFIvE/anrhhMUCQ9282rOhLfuu0M1Wyc5lBic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327246; c=relaxed/simple;
	bh=adOZ8IdTMEdihpC3KzCA52vuQF91ikdtwyrajV90jJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nOBXPg5UqpJEZVJpk9bWrYYBKl/R4njIpacUeshQC9aU3d8vhjjiB0hLnoM6gpQ3J2VvaTK/Sk1l4zmggxY/SDKzffYmC/3UGxvP47Zx7IbHc+U2i5FSrpPu93ARMuZ/4BWD0AUjb8hOBXfhye4LkND7rfrYKIS3slG8GhP+zmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0pP44tg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct+3jGrE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0pP44tg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct+3jGrE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBsYOf1637580
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnhemxUxhzCOwZzgPx/FLXP2R0Zgl4o/iFWhHwiEHXs=; b=a0pP44tgBGaAhbfR
	Lf3wDoyZanTLXRENS+d/Eq4AbOj0AqBQD/aLIyrgsKrD9hb0SS2hIZf/pZlKiceY
	uta2ev1z8Z4g5jDcCW0swOUh7D2diGwx8HNM99CssNqzV+5e5Q5JxrP4iDn8jCcl
	68IJJ6z0kz9iLWATJbCs75q+yhPw6Kk9gIOWHhJNMtdEu+dLBgWkOdLzXDSxJFdh
	DGUzNi1fE65sm2Yc6Lu/jur2SbRBAownu6K9xTril59o5IaB+SBVHFY1Tno0QG1v
	TN79giqeuG7fp9/KR/TsDBl491G0byMUaAqR1ygrVNN/9STcupzMYJH0cLH8+y3a
	dWJvjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2d82hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:14:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso1081903b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327243; x=1785932043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnhemxUxhzCOwZzgPx/FLXP2R0Zgl4o/iFWhHwiEHXs=;
        b=Ct+3jGrEmH49fbpSy7IYRgcVH0eebMLNi4UDBPl0DkCP19gFQRVg+nIUZqu0qnIAWZ
         ZXR/fPMQIZoTDXeLTj+AMgJcY0UBLV+IC8o2LsbSQ4g2KLJGFtPwsiV9j6d7q2T1Zfzu
         kDBL9AtMSTUEUifyCc/KeCuKwvdAMXKa3h8okdi5I5mqeJjXNppAJWvzRcPXzG49OQnr
         f6TRWb4b521YB7kZXXQOGy1UheZX187Bece6UrPu6HpQYWE6LsvQ/E1RSytY02YC5feQ
         k6Zp/tU4DfiU5bipChNI7CQkujn2Ngz/+khFXCprv6Aq/8bhZvAls2JBdFjuOzNG5qud
         t+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327243; x=1785932043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DnhemxUxhzCOwZzgPx/FLXP2R0Zgl4o/iFWhHwiEHXs=;
        b=AMCq7VafyhemY7dQOtVZPSjdAQ6+yGkiKPE5KpLOVX4reKM8Lo1VfTPpAUu30BlHuh
         w9lvHXOGSZ3o20w2DvJ9T2CpJXOPP6d6daS0ApZROICtjQwvQo9FRbz77ygOu3bbMPCj
         Huo5zAiJATxZvxgZsKpKMDcm5vAOW4CjEL6PHtRowqcS/IlZv4nokMX3cEjvcrxYF9Lt
         zqvopgPJ6Az1Bv0HJWJFytWpzUD7LubjNHYLlZO/ymgaxsZYAmZlskXNHdAXZcGF+FBD
         JSR9mzQMLi7jSsoawnKMtmmHVioFGYncmMihZfasNDDB5RKajPb9krw9OnS0GF5RQ9KC
         FLow==
X-Gm-Message-State: AOJu0YzxIjaVEQBht4kEboo2vMLcn0WCuJOa51GkxA9EKGVL6f6fPOAd
	8k8vFVQxja+6ScoLSMduJyA/1rFaCuTek6hI3J8Xf4x1V0obp3pzCOc+G6KMZDxjgvA0Xi/jfkN
	xNVA5EORKtdtfih2+xtVYKxYHXv3i5WIe6FXW2nSM3bbEK4XmeQK5+ldUQ6wWJgmuvyzP
X-Gm-Gg: AR+sD10fFVCr2wk8iNQOOVIs7lZSMWjIOjbMA/DeANJcV1ARcgBQUmzxTZl68sfUWBc
	+VD4J7Q+BWbvtdFVCVXNFdHoyLk2wUi0Ya3EB8BWoPFYmedEZwwEcBZCOc3uvCGrBFJZ9fuR0oa
	/Rizj8hOSKcjxI4ZFrh/XnlbY2Bjz/1CKXAQKxaQDhUCpg/CT2k6/wYOBcfq8/cyn877imP7F2g
	NrhrFmgA82qokCJyjn+oeUrGinlAtm5lGhUWxjLCFRjaUIXKRQS0UtarpGdeTDmV/iPCd//sJvJ
	rMHjn9aSLiiC9jb1vmWPc4hwxv4H25jF2QIgBorJx+/cBHxtOxSyT4oEmLGMta5vYu48jtDvo47
	B180HTvv9MyN9FQeg/74LCxycMR1YrN3Q5oBRSWJqpLmXeb7/6OsnXKlqAWSC4H/Yviwf94mWPo
	I+GYhg8EFgGyQo
X-Received: by 2002:a05:6a00:882:b0:84a:32ba:a262 with SMTP id d2e1a72fcca58-84ea7906f3cmr2145614b3a.7.1785327242658;
        Wed, 29 Jul 2026 05:14:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:882:b0:84a:32ba:a262 with SMTP id d2e1a72fcca58-84ea7906f3cmr2145569b3a.7.1785327242099;
        Wed, 29 Jul 2026 05:14:02 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0301b3csm1276886b3a.34.2026.07.29.05.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:14:01 -0700 (PDT)
Message-ID: <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:43:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T9m8ifKQ c=1 sm=1 tr=0 ts=6a69ee8b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=P4Ji7gahYyBqfBe6NxEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX9Nu8wmHe+o2U
 TEHHk+z7G9m7SKi1dD7K+RdI5wULo5LHkrmmjir5pr6Z5GaWG8L9HnI6e+5ecONw/DZoygv52bR
 6fjZbGgbCtX+nmkwM2ZwrTKgvODDvrvX4UEDMOavxxZlTQiVFpknl5c5OJmfIEGtsWEg4OkCBtC
 Uepsp1l5VIvl8tnX/yNshLy6v1u39iIG4rmEKMu57R0r4Bg9bD0UMPRYKAhsBuXYWEbC0X04ktv
 W/m/vpwgUqOoW9jxjLny9cgrlbHS/K1r6xKBuFJnajAnZNNvmXf8+E4jovU8goT8MP6YosVU14d
 /tA11nWPlDleAjTPFyaLGXPLA3jByk+WjIXIN0QgSwM6194F46Bxap3bQrw08r9075+c0s7lcSv
 zyhXKvX3brbIn8bjonLTvZh6pfwmA2nckmpicTxlSeN//KqYN+uORCL3d4W5PSqw1w61ZFNm3OM
 f7ZaAzAddidEULyUNbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMSBTYWx0ZWRfX9tX4kl4auXtD
 mKeVRH0mTre0yDh7BQftNVAsQyp519uErFfswdaSpra6gWeQJ7+F2TN30+/T9DlO9Gs/RVSAxKt
 NgLpXE0roXDeEglIa3e3YbDAr9Nn/wI=
X-Proofpoint-ORIG-GUID: RLQx4GPt8Ziw3LjC6xv2spG6x8U7lTCz
X-Proofpoint-GUID: RLQx4GPt8Ziw3LjC6xv2spG6x8U7lTCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290101



On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>> providers, and how many leading sensor IDs on each, whose readings the
>> driver averages to compute the SoC junction temperature reported to
>> the EC for fan control.
>>
>> The generic thermal-sensors property has no standard semantic for
>> selecting a range of sensor IDs from a provider without enumerating
>> each one, so a vendor-specific phandle-array with an explicit sensor
>> count is used instead.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> index c07483aa5937..ec809fcd03ab 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> @@ -33,11 +33,40 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>> +  # a devicetree concept the EC cares about. What the driver actually needs
>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>> +  # phandle with a count instead of enumerating every sensor cell.
>> +  qcom,tsens:
>> +    description:
>> +      List of tsens providers and, for each, the number of leading sensor
>> +      IDs on that provider whose readings are averaged to compute the SoC
>> +      junction temperature reported to the EC for fan control. Only
>> +      applicable for Hamoa based devices.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    minItems: 1
>> +    maxItems: 2
>> +    items:
>> +      items:
>> +        - description: phandle to a tsens thermal-sensor provider
>> +        - description: number of leading sensor IDs on that provider to average
> 
> Why don't we want to look at all of the TSENS sensors?
> 
> Konrad

Each tsens provider has more physical sensors (16) than the count used
here. The leading N we take exactly matches the number of sensors
already wired to board thermal-zones for other purposes (CPU clusters,
GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
this platform, so there's no per-purpose reading to include in the SoC
Tj average.

-- 
Best Regards,
Anvesh

