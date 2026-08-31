Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEE3CDBB7
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167012; cv=none; b=t2yFmd4awZWtxG9+NL1WSSsrvZynRyONQxsEcz4I0uFavcQd4RrsV61aBrVR+RcQHhP7FKq378x0tdY4IWPaH/0625/29AruUdTduzCQbGMkPKT/R1kEsrfacToRfsk91onRVV5uKHxXvpRI1s1RnfVJBXjHUW2+WpvdYv34zLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167012; c=relaxed/simple;
	bh=cCYOKZeBS/lMwQ4fkmgbGwz6LHn0Xx/xObKqYLjoD1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsrLX0gt5SAMKS/rVOX+NRncGXFNXi5RSDy4vzwYqQ+hEqQxESetuG9uRT7RZ8hbY1YGZA9Y81H6dwEX6YO7TH/MAWBSrSNqpQsiv/hr7rwGwEtGhHnfSVXEmHueP4aiRyLatL4jZWCB1tUl2RobpCTyn7McGvR4O9N8RuoxQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVzWV3b7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GOIV4jTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVzWV3b7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GOIV4jTx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V8t89H3215098
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=; b=QVzWV3b7f0/LbpT7
	Ryhm2IAWsxJmMrtvlqOOkNuWF8eqSTntTIxhMlpmZiHLcngNU8A1dSXZOdhlRli9
	9P8UrTElSmH323Wa6UyEGgwFVvLHebOAvMvG8n535LPjm9tPkwi76DHQ1NGZulr8
	BCvIIkx6Ey/f9Ayq96/sIe++FYjQ/W1K28LaH4VWq7xydTH+N7CZrCJ+7epQQQol
	C4ttKqMiNgTDcO9vi5r3WBkMs0RaEy1BBlP+7+NHq3+8fo8a6m+ffrKVPZixUKpl
	R/UIrqXE8dGMCRpXxiKm7y/uWsq4Dcc6J9Rxv/L80s85aEwEldn1P750nVcNAQ5/
	qqCySw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6h9014y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:03:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so4462272a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788167009; x=1788771809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=;
        b=GOIV4jTx2G9IfqaWe9qWHokHg86Pe9P3NFJ+855NkzqzqnxvzEo1wHlgd+1bM6XOf7
         wJIU8dehXnXaXk/AxevIAru1KCzpGvPMqJvCwDOcWoXp+FijQH2F0XE753AsFWx/Gf1Y
         J8NSP8DAQPo8vCzFX7+tzESXvtHEErs14gp2JZ7ABi5IGmxPGPNJoC0YGIdxyLKl+zS2
         wn+/NAvkBBaA1z1ocFdbO8Uwht+7hdlrVo0lk5jVMJ+AaHzyobkwEnHtEuPlFBaz7nzS
         5q0ZSRKRVJsdd/Xwneaxl5I5MxXLMwV+baUfTs1DaOmxYZXz5mxSO09cimGpCePWAc6A
         ve0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167009; x=1788771809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcP6LHGWxJXPulKdHOrCQk5ulFe7xWTVCyIQ7SbYJ0Y=;
        b=dcgxu8VaeP8Ao7UQ3eclYP46DBkocLXB6RbGur+jbutIdFdZZMJGID8sCYDeL0D8bN
         Pk/FKH88wNvZhY4kleANC+phzf81Ezq4SsannYsl+v/BY6mJSGc2rEYtP0Bhp/93Pqpc
         UJYoNZLMGIbUFiBffz9DCkH9CUEni0B/8w8nzAutIJC14Dmk8/Ov/A5jIZ6VY6H/oQnQ
         +yJw+zt1Cl2j3Y00WGDDl993rAT5xz+mQmQhZgJf1888nrxnEOl81gUvASZcAH6cn4qp
         Bz9zhYFtgZdjw4QacFA0oDfTk6xQJ45eqWHvcI9pMf1aR1NmI9oJDfTyv+77VPSNtNNf
         1nKA==
X-Forwarded-Encrypted: i=1; AKwUvBy8lYrS12THoP/G6bdQLjE3mi8sIw9EB6LWRa0k+6cNJMmXVkMbu0XqzJJlA0Weu3x6Pnzrpfc4m7IAattR@vger.kernel.org
X-Gm-Message-State: AFuF++k+F/ROct3HDxzGXh8msaMbOLg0fCcYGsIVs14Ta4zmSbWXLlWm
	tTUsFuw/2dULMLuC4LUMXXckOz7DWtWNHpnLnQd1361p5NT2V109mvNY3b3cK8Xf9DnFt1zkKPO
	8aimxf4/4KxowLK6io04GK5vbZWkfi/abdJk6sTgeKkKKoV0AoaMa59yYLHICX4eHQhlm
X-Gm-Gg: AYBFou1BS7M+9oMbKpNS/2IRcZblmVGE5GrtYgXUbP+OsrFc+pH4kSMwsjE/YqpTr4Y
	LG7qMWSrJrMyMAoKc4AeZtH4G56RtShmzeo5giDTQXDhytHidIUZYOpRPvNSBGLR1lXRDV8eSBI
	1Nza3433V7YQ9f3E+NsdE9+dqYXhzQ0pLa05/jAfdbVG+6wDAmhWrq9jmUkwPopBR0VAYbGxl9n
	tiqZuwfuaQ8ojw0JX0eP90zElPdULYbgnr0ER9eZYfNNk1S9mZRteeyTPL1nbDJD8cHR4xnzei6
	gS9lrbofuSeKYQbfGaG3Wf+3U4GmK8XFd43Q22V5xZp/N+QBy/h6F7aLmfIteoV6tYVdiQ5VXsO
	c3btgTGrj3V9ZGe71xTUca2X9AqYiYDhd8+j2NKrEcbpgfjzCNNpGEDIbWIrj9SpGdQ==
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr25276760a91.17.1788167008034;
        Mon, 31 Aug 2026 02:03:28 -0700 (PDT)
X-Received: by 2002:a17:90b:48c5:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-3989be9ac97mr25276413a91.17.1788167007386;
        Mon, 31 Aug 2026 02:03:27 -0700 (PDT)
Received: from [10.218.1.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm24522102c88.2.2026.08.31.02.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:03:25 -0700 (PDT)
Message-ID: <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 14:33:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260831-messy-ebony-warthog-cfd727@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W6UIkxWk c=1 sm=1 tr=0 ts=6a954361 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qatax8_Rp1FOiZlDYp0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1nmnZ1jAOj6UsrhyfYhFBi_p6VO4FaH7
X-Proofpoint-GUID: 1nmnZ1jAOj6UsrhyfYhFBi_p6VO4FaH7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3NyBTYWx0ZWRfX26i6ng4L5/+N
 15leAQo83N4qDZEUKRnvjB0j2JWu2QdS3e8IX1BwWqyYiquKkerdBeez/TwEAw4TzAZA0grlOA0
 qnUoHVADAWOY/fUByIqnXcMGqf7qD1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3NyBTYWx0ZWRfXzpwaYFHAi5Ft
 KHlE6uKZLT+UyqaF2W4GRS4ERE/MfoXJGXDorL0+/KTRmJ3QlxCPEaI9XruhNWlhOjqSCYoIyDZ
 Qurz7JwwJf6+kEmoY0frW/wI3kgLrbpHCPCVw+0qPrCQJ6sLa6oJ1FHV8Qd4iqNxgehUiH3rpuW
 KzmeNsu99qMTPfFks5DcrAlTHVBJidMMUnjsIZCF3mh3i0g6D5gFvgw6pmrylaTOhgLdwfTvwXJ
 4LhJuNSDNPGklpEH0G7RTOciMImM50Ml7NuxIQg+mm1iojY8u8eQdsUvE451yOZs5Q03LTMtxFl
 Fu7McnDaOkhO7NpUFKdoJNSOKamgf5m8ucBSW9t0NqawtfNpMSt75upeUyv0TBR+xRzieiSmGhA
 XkwHVSMjsB9qFX5n6s3gkN3desr9pa/bn2D6UdpvTzK/foudUfoFUqZtsj2g6HRPp6U30SapVZk
 oTlxrEoQPKOixlDwSmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310077



On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>> Currently for Glymur non-multiport USB controllers, number of interrupts
>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>> present.
>>
>> Mark glymur non-multiport controllers to support a maximum of 6 interrupts
>> including the hs_phy_irq and ss_phy_irq.
> 
> Why?
> 
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Modified commit text indicating the issue in max interrupt-names for
>>    Glymur non-mp controllers.
>>
>> Link to v1:
>> https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
>> ---
>>   Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> index ea60f7220afe..3bef18f9557e 100644
>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
>> @@ -524,7 +524,6 @@ allOf:
>>           compatible:
>>             contains:
>>               enum:
>> -              - qcom,glymur-dwc3
>>                 - qcom,milos-dwc3
>>                 - qcom,x1e80100-dwc3
>>       then:
>> @@ -547,6 +546,7 @@ allOf:
>>             contains:
>>               enum:
>>                 - qcom,eliza-dwc3
>> +              - qcom,glymur-dwc3
>>                 - qcom,ipq4019-dwc3
>>                 - qcom,ipq8064-dwc3
>>                 - qcom,kaanapali-dwc3
> 
> This changes the ABI without an explanation.
> 
As per the harware specification, the controllers do have both 
hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that 
info. Will update the commit message accordingly.

Regards,
Krishna,
