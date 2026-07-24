Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623BE3E2752
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893109; cv=none; b=gz0OhOajQn75G8j6SNykVmJFqA3FQ+CY/i/2++myqvYo+5zzPrg3A5MzyJboc4I2cm2ZydpAKkQwt7IC6hONu3CG3ccZ7HuNwwY7RTte/5tohF6Thmuy2aSRSZp99WyLHBxn9aCMIitWFCtNwMQAHoytxwH48Xz8M9acr9rYRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893109; c=relaxed/simple;
	bh=4SXyhYXs5YB+NWPmOteZV8Hmx2Cbb/y7SxPJ1rdgDqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvG1h7bs9R5u5QJFyQRYll32bHPVbcZIRabrzKWMPlvpBdL7YAO6cu0IXAyg4S+NVDFQcL7yc+yIbuiWAqGlRC28QtDDRamMPB/wzR6qpTm7kGqJIq5W8dwsG3D+oKEIVqKLzhNTbnAiP7YPdS3pKmg7H+tVY5DtfICTBkdmcDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLlgvG4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2buhtXb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLlgvG4s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2buhtXb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAEQx32853491
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yu8Jif1MA3CSRuS8Qjpm4AqmQwk3Fa3uZXp1jiWqpn4=; b=mLlgvG4svZDyw7+5
	YcyoNUbfgrTYi+//XPr5Jj0DUZzxFn3/7U9N6im2SKN1BkYD97PmzhqQ7Z9Deog9
	0h7ZUVolcdTQiIlMY0nsSviXoctQxIgGWp2l57dYZX99YCfDTzIZXx0xn+SEzXoE
	s2myElM3wCTGnDWOrWEHikfaZhb99AUoEN1KzDy/hg0HUwZjVmKvpeMNeDHKyS1L
	DyEKFj8HgmVmycQtq7y3PXsZpRDVVIQCCivT4OG8hlZC8aYhEQM6mjPw7RuMa4ne
	FlWwVOBbd0i7dAm+mhCDXMG20KdU4RU957MZ6pNHsf1yawz++uzF0VRJkljYHhKi
	iFtCwQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahtsqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:38:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so429118a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893105; x=1785497905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu8Jif1MA3CSRuS8Qjpm4AqmQwk3Fa3uZXp1jiWqpn4=;
        b=U2buhtXbd5VnA314YBjKYm/LFH1g5XcVFKfZ73LwxZfxWC0H+xmNLU7jYKDxSaXBws
         QOyTF6FxkQNJkT1/k59BxHRw7jsAwsHExgpSV8uq0ASF7h0XPIhLswPkvVbmebzmrxCu
         XfFLxHHm7rr1uzwvn7d6igD6hZ+4aOvIRGWeVPNE1U4sgQoMIDJBerjaBzem0+gCn1aW
         HESA3I5fQPZ4aFCJXuXBBxOwXpuwHMBYxCStN4Yxrh+6IS0Euo4P0Zw1KtT9ZNUbqwN2
         j/usaQl40lRmL2kh2hYtuV1nmbAn5o73mclV3tv8F0sFrUCy8aHRynDv1o2yVGwlT3Un
         wflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893105; x=1785497905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu8Jif1MA3CSRuS8Qjpm4AqmQwk3Fa3uZXp1jiWqpn4=;
        b=LAO36mXeF15qbu8vzGZ2K4bdhhTCmhFC9L7Ikp5anIhlahKlqmaLcaXR2UzOd3z+ZX
         H3jywDEj+d4OH4PWgdeQ8Nk/dFHLnoRkEA57SCILCvjYO8aFm4r1CInk8Dol+MFD8QTQ
         y1tz3W3VsD9720lz8eqJVYPkJzxzVETDg7QWBxmjZKK+/nGPNUaXS9qiZlXeC94sBGmN
         Hii6AjzZHKuh+HYxcI34P3DYfxSdUYdiL+zSTt3N2IzjIVoWsCXxkD9jS+0gyjvF4OUI
         5fR5Jk9w5u8PsiDkIwPQWz1HZbUrQeGKyy2Sapo4ffvrAJAVuw8RM6vKcic31s54UFWq
         SHNA==
X-Forwarded-Encrypted: i=1; AHgh+RpTzVGWbD1VkfD9ziAGW6Y2iPgTZbpYYMif2zuVC5W/5vrFutO6Knx86Iub0+CEH/eGdCnNxK4s/QkRZdbZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6p4djSUiAXSS5uTSrHvo8fDr7bHQSGRHA0tC97D11x4hnxJ2
	hFiv4Ota0VrAI29QEEXwr4pFNbF5tvtiKW1AVzzh4fgSuD92ipjHExRChFbdxij2agpT//sN6o0
	GuAZyYnt07fkums3ATNRAZ5E8vdCZkAKwBvtfFICtuTNk6YaDQNCxNaLIKHgDVdRkC49U
X-Gm-Gg: AR+sD11xMthtCUUsb+cjW6tDx7JHVCXJdJK40b4Uy8ECF5UblhDusMc5JmdwkP+2IY/
	/DWY+223wFUttgDIiiH6t+/6sqmfbnppnDhXynpjKxdrOApaiegdf92QsU5wrlrsacPVYU8tzov
	rcDqwuz2l03BXbzoi8rYK8KvvjSKkjzAAWXUZ9Ekp8oyDGSuc2jeObbcXhGGh1GO9Qho01fT8Tz
	lGOysgeBhrzf6w+IEiHoeoNihwqktperfOrU/o0ilFcwDkSeu442GP/augNOI1rXFjxpK4OaV+7
	NZZHTtP/FqmDI7wTZcXiLe9TBvJStmE0vXqCJ/k8MiJDQdIafUucD6dV2jbbgszXMmprGiFYWlP
	MyGZ0HorfkPqxWHcbNM9BfwHvvCOm2UfIWZw=
X-Received: by 2002:a05:6300:501:10b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3c661c6a2dcmr1754082637.14.1784893105178;
        Fri, 24 Jul 2026 04:38:25 -0700 (PDT)
X-Received: by 2002:a05:6300:501:10b0:3c6:61c6:8970 with SMTP id adf61e73a8af0-3c661c6a2dcmr1754069637.14.1784893104787;
        Fri, 24 Jul 2026 04:38:24 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.251.199])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9f2f0sm31490699eec.13.2026.07.24.04.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:38:24 -0700 (PDT)
Message-ID: <652d6819-993f-4b10-bbbd-635c9b785e98@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:08:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/11] dt-bindings: media: qcom,sm8550-iris: Add vpu
 sub nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-1-72bb62cb2dfd@oss.qualcomm.com>
 <em7loyijdpav6chk7pslmz3u7cifqbopyoutwbuhjjhs4whmmc@zg5o22m2xrej>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <em7loyijdpav6chk7pslmz3u7cifqbopyoutwbuhjjhs4whmmc@zg5o22m2xrej>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfX1ktkG2xywOFt
 pD0sPU6RziuyOsiJmAzVM/99WN/bv60qPGY+wRY2ZetgKC93g71JR3EcB4eqn7dVKO0yeirrg8s
 1BUZtMe5fZcaXcCqEFsk4NDwqZIc2rQ=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a634eb2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Am0+rXbGVt9FyytbsJdRwA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MZGBJN6z8D9sCzpjJ74A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ApvVjyEBMAPYZwa4fV_pH-HuZNyfcR-5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNSBTYWx0ZWRfX/Ivm9bhBxiXU
 h4a+0I3k4M/S/k/TVAomb6koQhFLhcHpuf2JnqEBAuU6EPmHGrGuIzqy/qWFxKf/USy0WZLKrKw
 ucQEo05H1vPT6b2xVOM1hSzrYbVFpD8ehnCgwdbHUYEtlklDJMYYp8UgrckwJyQgb0JKs5zb77v
 RZAWb59r9a1H0QA8/nn3erqdUbjfwltTrwPYWf7aRmIyrV66UYRvrAKhzoUa8Yz7m7oisX6RpRY
 SfH9nV8laUSGQhGb6rk+l5kmzpl4CRAvoLo8Dw06HMLqC4MFEui8Y6MbsZGrXFttL0IFC6P1/YU
 3hUTIlDR1KPXMTChjpVjv794ReI8VWopuvKG2+GDWO6KFlpxnw+F1eBDIvAnCNXTJEZpYtksGLU
 PUQe8jQWI7ha3kmh92H6HuUmsGVC9v8vgjjzx0b33ix4k9UwpTscCjEhCQCthw9RiAtFqlhTKEx
 BuOJVLkLJk+Av6n7MXQ==
X-Proofpoint-ORIG-GUID: ApvVjyEBMAPYZwa4fV_pH-HuZNyfcR-5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240105


On 7/24/2026 4:45 PM, Dmitry Baryshkov wrote:
> On Thu, Jul 09, 2026 at 06:05:47PM +0530, Vikash Garodia wrote:
>> VPU hardwares have a limitation where VPU streams are associated with
>> dedicated addressable address range, as illustrated below
>>
>>      +-----------------------------------------------------------+
>>      | Stream A reserved region (600 MB)                         |
>>      | 0x00000000 - 0x25800000                                   |
>>      +-----------------------------------------------------------+
>>      | Stream B reserved region (3.5 GB)                         |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | Other reserved regions                                    |
>>      +-----------------------------------------------------------+
>>
>> Mapping a stream outside its expected range can cause unintended
>> behavior, including device crashes, as reported at:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> To address this limitation, the subset of stream/s are now represented as
>> sub nodes, so that they can be associated to the respective addressable
>> range.
>> The limitation could be exposed when running usecase like concurrent
>> video sessions. The binding have been validated with higher concurrent
>> sessions across the SOCs supported under this schema.
>>
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8550-iris.yaml           | 66 +++++++++++++++++++++-
>>   1 file changed, 63 insertions(+), 3 deletions(-)
>>
>> +
>> +  firmware:
> 
> Venus devices have been using 'video-firmware' here. Can we please use
> that name? Or I'd ask differently: what is the reason for deviating from
> the name that has already been used?
> 

fair point. The primary reason was to keep it aligned with other 
subnodes (pixel/non-pixel) which does not have the video prefix. For 
firmware, it would be more appropriate to keep it same as defined 
earlier "video-firmware"

>> +    type: object
>> +    description:
>> +      Firmware context bank represents the firmware processing domain of the VPU. Required to boot
>> +      VPU when no hypervisor is present.
>> +    properties:
>> +      iommus:
>> +        maxItems: 1
>> +    required:
>> +      - iommus
>> +    additionalProperties: false
>> +
> 

