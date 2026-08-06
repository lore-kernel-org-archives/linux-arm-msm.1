Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12754439338
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009963; cv=none; b=B/Mk54VvklvD1guyhdEd6VARRrgh4jNwS2FtQdfzAshFd3D6jTmRHuI7jyUrThIJXbcRDvw0RXQMGPcUesvOQVsThqEh2M6KXSvBaFTVE/lwatYZmpwkjrM8kqohkmLD0+gN62lnCvuoJq8y3/YX5XDPxsfy5pT9doQAtC7f6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009963; c=relaxed/simple;
	bh=gRUha24JKDyYXQuYod1ckbZURT/+JZRsMXtQhQkCg9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9TO1pz97o/DhJUfkNAAgMWGv3jBnVl1iF7/FCJwyADWo41+nyEyMBuH1FbMqIadVSbJutxvI7dwtRD1u1ze2s7rOs8jL6F8qIrm5ZqWu0Lub392ijWurd3D7WF5R3wdGwOjx/btmFUHvIqXLQuRfvwodZswENd8gE/0y44oDWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6jMlumV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYD88+ek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6jMlumV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYD88+ek"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neVu1876435
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=; b=E6jMlumVYbMKyvpr
	Bt+kkZWLKXs74BeVc1MMiS+OGhLn/hGQ2+DE5t64a78ohB+YXaJKd34UszQXqVb6
	pWvFJCiCQwCpyFzr9nQjLXs+bI7NwZFJzLnBOriPaBrspqNnUeBlsjt4LHvvzAtt
	cKUkpx4BwOfe9VyVOdZjWU319Zt6ZZ4QddJ1NXo2TT9t6pehELXDj7pBAjAhtGUf
	H1CYBKabn0z73M7SDJvGq361TkfH1DfMqeZv6GSlgCWsaaetkRExFyj7PI6W/xTB
	qqF7edmtv5NCe2r6ZWX8KxtZR2EZohOL8G/hHZRUIK7kCapszHxRqWAu4wEGeaxx
	K7N7lg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuchdhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:52:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so3033118a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009956; x=1786614756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=;
        b=JYD88+ekvcKX6ZzRiZFyS6P1KYI+EgxzHKSnW9vEnwUcmWAwWqR5zcf/NvBJJFOyP7
         Qj61NzboFI8A5+zWjrbe+smEblGmbyq9Di2kLH+MDSbJ871JfsVwihOSHh1ZEMKX6HtM
         jeSsQK39atYUQ/VxihLPvYYsgFRG7nW1AbtMy0QGQqjrTM9VhXMnY+BRd3AO9ZLkFDYe
         liXYtLNOxivOp2v5ngaKAoloBaDlR0WfUNXTZUr6rCLFRCR7TI0CviJDisFAIRhDW7EO
         +LAEyOXMOnOlwilCkPJxohl0brFt8PHNL4W8QdAsO4yJ2VqD4r12OhsVQ6PVDfQXS0Qc
         FjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009956; x=1786614756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIidbOLK7YUH8s7JFWhLKurGYVJCaqUu4CJdXBld3+8=;
        b=ESJcdI4zj9/u0198BSecLt/YpEfn/2qDt19JeYPP61yLJVPDszib/S6gmxJdp9DYDz
         lAm3/uFTrc4q1GPoQuSc/mMnyAUCmWlkeaand/rr3ek4cUv/M6GWb7/rrxhdjWVhXySX
         S0qc9GGd1y++OLipeayXxDFrq6EG1/PqCYHCZPLCKZckFwOSiWAmhbgoO4b3J9h0eJAm
         ZjjubSJ9SCHcFFMD2fN0aX6G2cp5Qn/g9cU4rXIuiOzqwa36lcKbosLjBlwhixnaXbhZ
         dNvKE0jWDfLwc+5o8L4uIHJ067nBwW1c+ZdO1BoGVqCBUXUq2tOswRKqZrVpn3L4mvoy
         +Nkw==
X-Forwarded-Encrypted: i=1; AHgh+RoDg9v7RSZaCp6vqcNECYsFGU6EjpHI08oer4yreFKgG1iGRITGe0KziP1jO8cpVccP/8Z+2mA+S0BalH0E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyuu3UKXSeZEajq6TY+kmBxZXxqU/inW595KkRjX6vnt3dCxap
	w5yzQ+ZanUCYA0845snIFfBQkQKzOrfEpayxPcx5SxizNkWwAPjTHyBACtWqCpcxtQsHSYCEskv
	r9mJndV+NFkk5yoXtVX9XdsJlYiG/rYALPde0ePX7BaqYf0i7FVvormbOagdyI+vP9YUC
X-Gm-Gg: AR+sD111IONpcKOSVVp5FZth4E9uvTXMDAurlhUArOUXJyF7ix4/x3G7vga+mK5c/3M
	PhO0HHXGDAWNH25BNualyORNHjMZESMnXhn3BGwh+r6senuY45f5UVJQDixHlOPkLz8ppYnicoP
	yR4GjRzadaDsi34A16Z7JEyFD/3eXYceZtH9n7hOU2TOIl0tjaV7xRRfLlyg2nOxhgIUnjOMAw9
	SbedfFP9JXeBJPxKzgFeE+AJ8vapoB8ljhhS1WaBEht17SClLpC5pPRCM6qYDGuKpxLmsHi+KSz
	/1PGu65PAVV/48ubY6h7OEDCRdVaDRxUr0ZYNH1TwdiM7rtd0qvVGwpNBnXTaMgJYmpKSKwTPPs
	dyez2rwUvUWYuisc/jIAafHjXBnUijbeiPLM=
X-Received: by 2002:a17:90b:264b:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3903c5b2c25mr14455523a91.15.1786009956048;
        Thu, 06 Aug 2026 02:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:264b:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-3903c5b2c25mr14455492a91.15.1786009955604;
        Thu, 06 Aug 2026 02:52:35 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6482e7sm23033859c88.6.2026.08.06.02.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:52:35 -0700 (PDT)
Message-ID: <d6207874-630f-445d-8d1d-3a30ba8f41dd@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 15:22:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-1-da52b5228dbd@oss.qualcomm.com>
 <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <xusr4efn5dmsvcs2hl5vg3t7ctqbbchnbdx3mx6km5s7s3se23@mzzqs54lp46l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX8EyLzdKPPmNK
 xmLE7TRIQlxt8ytk1zJQVV7EXuttt2lMWXSMQRLrLfVv+TcOG8fT3ee0XMYbkVd2gvAO/5pFaGw
 7soq3L5Nlv7PpoZTCVR6tGiydnTa5Pw=
X-Proofpoint-GUID: VSKoqlBltpcjayLbMEWN7tcVBKYqBdBH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NiBTYWx0ZWRfX8nTuOIXh7iRQ
 PushOqwm55OVSYcvYlwSBcENMeHi8xrob8Ka18YOA0FVAmNZzfxoNsz8CHzQBZhiTczJQ+PpgGK
 +tDWxlnYBfsPG/eMbjSxI8ITSR6fL9T+phF1HeyEFAh6lVQP2kKpRwLhPO1fhM2QE+nHOcGDiZ3
 0IRB46wDnHwCdlvgrEGr+hxXd5u21pLi0XTt6Rv2FWpLMfufUN+dC0kT80Mg4J7FSIt7lpWCB4z
 IdYBmLV85R/HUVZki3yOEEiweS3CcniRPz2f8cCsUQjSNKznXb4AaH/GisTtfAMUpiRlVh8Y4LA
 lcnU0PmCYcwUuhAqAV4RMlhQOcDekxVCu7VtxNgQJ8Is2Inffjf8oasP1wuezkOgp1Qx2Uy7xqn
 76ww15TTwAHm+CZPf6hJ/JCwu001sGGTNZdb19+d6CGJ0N95P8hDgBJxuNmRoNX+Y/rdRzYPgd1
 0tJBR9Iujm630YJsaeQ==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a745965 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=LxpaqNrMlFw5iMcKExUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: VSKoqlBltpcjayLbMEWN7tcVBKYqBdBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060076



On 8/6/2026 2:19 PM, Dmitry Baryshkov wrote:
> On Fri, Jul 31, 2026 at 11:52:16PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> is restricted to use 0-600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
>> non-pixel buffer inside the low 600 MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>>   
>> +  dma-ranges: true
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
> 
> This would conflict with the 32-bit addressed Venus nodes (and it will
> also break examples). So both should be just 'true'

With "true", i see following comment from sashiko (when ran locally)

Without a const constraint, a device tree could specify #address-cells = 
<1> or a non-empty dma-ranges, and it would silently pass schema 
validation. The DT bindings guidelines also recommend that cell-count 
properties have a const constraint matching the hardware.

> 
>>   
>> +oneOf:
>> +  - required:
>> +      - iommus
>> +  - required:
>> +      - non-pixel
>> +      - pixel
> 
> - #address-cells
> - #size-cells
> - dma-ranges
> 
>> +
>>   additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
> 

