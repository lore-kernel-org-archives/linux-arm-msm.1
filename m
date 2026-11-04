Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792142;
	b=ZwHjQrIzweaQSB1BXQ46xx9uSebn3DcEDuG4e3TwNfTUknFlQTxiR46mn7rg4i9t54Ar
	 VEr6Z2/zvgni6dHwe0/LyvWM8st4k7sMaeUr0ucpzmC6UY7JWwlrve4Jn2r72Rx6+AkmD
	 Eob6U4yTu9Bpu7IFlvUPpWa0ht2ADI3lx5E1NM0L5f03gyxu5UoE1GaezAkEJurcGmUdt
	 tdWGPNr1HILA/cmPL9Vkoen/PrTRcu50/X12tGnglndvbJh8j//IcjqTePmTPXC+FxBsI
	 hQkLJPDHGQ5BRLWUWJFKrXdtkHw+MmpOfgUV/naFL052WPdzlzzHs/H4AxytISIW9ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
	b=GQT1K2KpcMNmpDNZjinljKpOg/WILwm/Qedg8sKsvISFtFKyBkhEtshiNHf1Sblv1ibv
	 OJ/xBDaWCdC5j8t2NQFof3abOJID0EgAS/lGZdw1BGU2NtCxgQJxwtmnr/T7/nSgtPpQO
	 9ga1WofR+PwZFCR5E78bUhOB9T0QcUnRdNC5eA9oAjYqwoAYLP1zaS5V8BGjOoHswATja
	 XaBZYyqiJM/kP3XhvPS/VhJpKv08r8JRBqgKyJxBFlQ+aZUKiganUmLPvWHT7ie5z96g2
	 j6O7PMabVVLZ28TpKgJyNKWQJy8vmApBwvoqBLHzoBgFF0YvMtAs7k2hdywknFYDcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87820606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 11:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87820606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BK7QY574080
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 11:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=; b=ck02Y+UJvwJSSmFS
	M55HtH/FtnsUGn9Tbee4EBYAz+jiBvjtOuOhvidebv/aZCR4K9F6bFyWTu6Tsg6q
	eliAVRowRn4LyU93XUJbaX2uTm6MOITccmE+N5GYNH/sp8PrnDIwCeitpIME8rKR
	sT6OFiTlqGJRVoamGQ0E9B3f9UVC6RklxeUyjcyRQnCnclYS9L1IXK9Y/271a4tC
	jwTwMQX7G+KkBv2ulIFSZmN/ql6UJ5f8THjzCGWBSrvEMD+8ksvwo2mOfr7Idd4B
	Vw4cytVN6dqxdtlS9Wit2Q89X45rz6VtcI5TqXAnKanyuOfAvzqPYEUmfJAaXCAZ
	OAIliw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r80228-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 11:35:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f67358eso5977085ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793792139; x=1794396939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=NDuh9B3F8w0RRQbk4DOFCTn6/pF/Q/Yc63kQVlkQXByE6x0t7x2MSnPnWfoOxkGSQF
         dF0UiccXhotfXe/MF2aS+8uyapCV9O2oojioOQZ+UwjoQSuZoI51pVqlKPeOpsr7iu1s
         prslK+7+tIp6F0Tb9Oxhl6xfmUkr0VQu+Wa1gGJUcH3e5EIO6M/qmSuFcw9HrACfCW6y
         c8HYiPqMO3V+IGm/z4TRhT5Eahk5zVoDME+6IoaZj9+oGkTuRCGDxudetjDRcv5Mhypi
         ly8WY8VL5Qw8uV5XRrNPmNX/2B0trrXe16JJxenzmNeYPbHcX5G33FUuievp81LFLZa2
         Ym9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792139; x=1794396939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=bMpblKJu9JkJe+15I3IkUFG/z2UZqYWME9VSuWA3nkSIyVrqvFfASQpZBaYxNXoEHP
         EERBGSToZTJcPPZWx0LGGVNMBq3nJkc4Z7s1WGaS6cMPTW/MSXuxTDCh5NUeHoOrlaz1
         a3Ve9KNXfrqOL6dHzSSHMnyr0B9RI3v/S/YbwdNGRjkT7B+N736yC2VF2tUmGqKPsqIH
         5FelT8EelpUZxz3ao4YJXCAODHhZkMK8/Otfqe8QRhW/cM8Is/SqzKzF0p+WSUzbLcL/
         W0ThbbX6Gi+yTWTnhIzlBNYAHXu0u8o5qWDx0I4WNoyJowap8vKFl3jXuGbkkV/AIpLr
         bDdg==
X-Forwarded-Encrypted: i=1; AKwUvBwv8RBI/pbWdMkh87W+vPgA26MBIiz9f0jwqyKb4RofIdphT/3jIFwG93BgkpWChh7LRcBlBwAcu7oE0YUo@vger.kernel.org
X-Gm-Message-State: APuU4Z8AhMW5IsZrpVK8BsiIrx6Phof/P95PaoJ10zWmMRea8iFhgM8Y
	ie1VWPi1hyJfzB5I1fUnooPbhEzO1jZM7kaghaqWTUCAjoWGak8pRNpoXxHMNshZsi742erpke8
	KmknHYx3NvfvCfH6s4wBW44mIbAEv0FmkzpIF13XVsJcCsDu2GO3KylDIW9iNjlIHPKRv
X-Gm-Gg: AYBFou1ruQ2ItmJWExYeBNxKXPYkXGZRSGmQPUFf2cqstEIA+xfp7JjmNnUNRMiQnUD
	CVo5Nxhn+Y4Upp+xO8diWf+NyzFPTkcpOFCnxKA17TczACUCLODAp0z96mHoc9bKHURVYgjB/5e
	Epe1PnY8A1zieSkDCmGjGewUuwarqF5aIegeWmIYZtAefuKq1ha0pW6CYPoGxam2FH5cL5VxyuV
	X8v/J4ebVf+ugmx7j/RzO0ELyYcon2vb3fBKVPyqtsSrPcT6tFe4CnVI/ExDJ5CSo1Ipu7dnCs5
	ROPb9B6dK+po8BSo1d95QcODwEv+XuGdl1ODEUwwC2/BgGczS6Cc1r0qMRrucgAUc6pw/2G5eC9
	0iUDlJ1T+jKlfmxh6aH1YaUvENVUtjn+0nINroRULCE7EeTgaHJA6joWDAVhmz6TlpCKN0hR4kD
	A=
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142899295ad.32.1793792139084;
        Wed, 04 Nov 2026 03:35:39 -0800 (PST)
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142898975ad.32.1793792138559;
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5845sm6106805ad.2.2026.11.04.03.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Message-ID: <402ecf6a-357a-4404-985c-9540f6851f8e@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:05:33 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
 <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kUDd2hFIo7fLd8JE1IyLgOtPBq_YQ_A4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX0iA5rDXp1/1S
 LtT7TLsd8kriVXhlw32VwF9xx1O7U4XVdlyPNtcAWIARThPXM7VhvdDEoYJRN12gtm+ikSeokt8
 Ce6CUwoibcpidP1wQGpRrCFJjvVzwm5BIrXgV0CHoDHJbHuVY23OdblhtG1HuT9xmTP1WBF+lcn
 4Z51ZN/W90emlSvteoCHvC+rb7AVFxYkw40E8AZIZLoo9QGVCy6ZiEtibbHc83wsrMDnbJt7z1a
 9J/J+Mk4wLez8MvQA5z53C7IW/qw/N95IzrtO8rL0BIqUVK+qONn6fKNMG7T4ZtTFn+11OSJx+1
 CV9Wagozh4VMfes/MT0ksHBPy44OfZzLc99uEoSzCMRa1ut+V3rK1pDe6tGWIDJlYaemS1S5Iz8
 yQZzVsMFaKBZ2wBmz3pkZgPC3oWz5hbM0B1c/BZg/3hVEyXPaeu9EUys13dTHCpCoyvu9Og+9Jv
 rXoHiIB7Ey7qy/rAEug==
X-Proofpoint-GUID: kUDd2hFIo7fLd8JE1IyLgOtPBq_YQ_A4
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb188c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=49plGf3O2Pee3ShZFYoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX+75SOx0sAIAA
 mMPnCt1xwUKaDdcPwFRbUUQ3mvft4cmKCWrp/1GPt7GFqARbI2PiXTaS/O5+Ys8NhdCzf5JHK9T
 XNMgByiIGua9dBxBGmpV6FTJW3zL3x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040045

On 10/5/2026 9:07 PM, Mukesh Ojha wrote:
> On Mon, Oct 05, 2026 at 04:44:45PM +0530, Komal Bajaj wrote:
>> The Shikra LPAICP PAS requires three IOMMU entries. However,
>> qcom,shikra-pas.yaml inherits the `iommus` schema from
>> qcom,pas-common.yaml, which limits property to a single entry.
>>
>> As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
>> with the inherited `maxItems: 1` constraint, and a valid LPAICP node
>> fails schema validation.
>>
>> Remove the pas-common schema reference and specify IOMMU entry limit
>> for each Shikra PAS compatible: one entry for CDSP and MPSS, and
>> three entries for LPAICP.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e9361..4196f61a8ba0 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       items:
>>         - const: xo
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +
>>     memory-region:
>>       minItems: 1
>>       maxItems: 2
>> @@ -92,10 +95,14 @@ required:
>>     - compatible
>>     - reg
>>     - memory-region
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>>   
>>   allOf:
>> -  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> I think the right approach would be to remove iommu from the common binding
> and let the corresponding target put the constraints.

Agree, that makes more sense. I will move iommu constraints to the 
corresponding target-specific bindings in next revision.

Thanks
Komal

>
>> -
>>     - if:
>>         properties:
>>           compatible:
>> @@ -112,6 +119,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +143,8 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          maxItems: 3
>>           power-domains: false
>>           power-domain-names: false
>>   
>>
>> -- 
>> 2.34.1
>>

