Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D593842FCC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241559; cv=none; b=Kd9enDJmiEV/7lvzNC6DYHoS+Nae5Nw7uRjQeL/UrrZMkiQPgF6CMiWB0XJusFK8eKlN6Xsz5JtvnmRr0PFqnRvSlefUR26h6vU0X1WY1TyBgv52dq2ECnq1zUwKe7i0w2LsBEq6gHzDfo9SUblnvfbCEImBXtpSFkyvl//T7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241559; c=relaxed/simple;
	bh=G/woI9Q47jogCzFfhduFoZMD5TPthjdX7zwCwHvy1Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3hlVspneCMCqglvzzE3OiyZBhC48bKbHgnmH71gF8lP2GpgIa3xlpldVUtaxU9J+xEKOVZDJLNYF2ihL2dljuBQvRlVvuzwowYUVit+shlShVuQBgtuc2QsQxizJPvFo15lB9EfLoF0lsDeeFoWgLfhok518XH76ib1+tAhNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=heap4DMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WN2j9f/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="heap4DMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WN2j9f/1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHG0r2527770
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=; b=heap4DMyr/5u/Aed
	7lSnS7JeVni2kShBec9ucNmp54Nfd5TOIb7uUU2pS+QrHk9ZIz2by2RHRJ8/ItBU
	u4/fyjLchirf6dAmAATBke7EAw80Ap0eG7OUKU5cCnbKOAn8GmVX+bSRaOvdaQX9
	70YNpV9LeBZGeqvpTVZ3QT+V/2Lnvwl91U3Bb+DroXWB9IK0JGPyJJuwj0m+Aptu
	Z/OU1SCmivHA6mx0ySmCfBWAFAse8g0Aj7H0hqFjIh0gL64KMSGMtVoebPpM7E4v
	QbVo3xHe2Ry1WHBIsC9mZRh3jVvM6LnhZHQlu3UTIq2S2ufcQ/lb/UQriVPMBpql
	5OYHEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjh62g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:25:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so1755157b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241556; x=1785846356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=;
        b=WN2j9f/1b1ep4jxn1GAxMgdagYhlkjj2ZTNoM9pfho7HoTCnlP21g8eqrqLE1jyOhX
         fqdo0ODaanDrR/aDau2wH00ufvUYOAOvtc97kjjyC1l0LWXmx2x6g5xTZaRyT9rFPUsU
         U8YnrAng52GMyewwiQVZAM84pMzPda6tatj68zOE/nm+WcSTLarofbdumDCThtGOG0zh
         9IGAMIYh6PEpACpoeMIbbEQrq3tRc29EDua+VYaZzB22bSh8aeTL+H657VrysC2I2xHl
         1rGJtJUkPGSiTu8+ujdfhqhmc7YHOHLvXSzSqbZ6lNuXOxle040NHZG1B+4D/W8PsC0K
         PudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241556; x=1785846356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kcRITBA7JDI6PKJS5pcYOCNKwYysxM9dz7iOzLdqem4=;
        b=RuRt3yNoojeCFicobkAwTH/BNPSG71JP1McYWoMwmVxyZ/MMIC8H5aU8D+VuETwAnY
         4+PqXUJiBl7QHEFGX1s95RzK6+VZV/joc/48RGGxxM0D7pS9WkfqUkjJGQtER8WPiAX7
         Mffv4OgyDm8SDbgqds1UPVAuDGMjm9hzrKYGVIxyx5BKV7R0ItfK5QIHiZOVBb1nj+0p
         6iYVmps7hEcAxaxp3xg56UmKSPm42zRvXT1HRLmenj+01pB9E7E/844rqnbwEyVgbjjR
         pzVDOkFcR1j51ikLvAiRUj6WFmU4Y+zkrELDltaioRvZ3CcPHIIvAxVB9+XTMvnfKYX/
         JPRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9bR2BmiyHoMY9LsZZ1A+2gXGiqe2u3YaNHeX8jUxNCg/i8gxfhevHt019UDikbfWk+OZahIGU2dBn6f3n@vger.kernel.org
X-Gm-Message-State: AOJu0YwAq1Mho5LvvxjDi0+tf0IjzvXgPjXocaWrgSKsS/o70f9SQIwH
	FvAssSyXHy3NkepMueln1+8Xe37o3ymx29Ptv4be258d8cOkjSQulnOzqg7diTP2f0Ym0/Q5+pY
	kpIUOmjoD+aJIVBfhnmF5zR2vibgAtkc2m9c70QYvWDDFk7AiHEUth9vPBrVm2P6i9YHy
X-Gm-Gg: AR+sD13BJT7tm0Xy+eize4sojyq3X8Ypu7ciIzuLWfHhTID/DttWeuww1HfgqePmH5w
	Jg0wwdAGOCelBg+YsSJjWKcm1VRr5qDk++lsBBZ4HD26PlLkk7CY9Kf89YXW+SLgBGEHj6EEDiX
	DvDASkAcGvoRxxtLN3fI8VUPzSIj5z+kT171+O9becPWBJkuL4oQlpdLMzDcpRhzDDUTvWw+tYM
	7qcJr4vhQ+PoNW3WJJG1PWIoCttXFxTTiEM9CmuHTljsLR1E5wiX8Ugdsglg4cVFmFRDgAFDsF2
	xN1Gz6DBGwArWjStRXrZOEwPEJZuyr6hhN5OFjOfQeWzTg8Lu4Je836Zye3t0VLO9xaRKjhBd30
	+zbk2m0CUZqRyixSuURxm5tYWBDlPm35S
X-Received: by 2002:a05:6a00:4003:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-84e932ec00dmr2212690b3a.40.1785241556406;
        Tue, 28 Jul 2026 05:25:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4003:b0:848:7a8a:48c4 with SMTP id d2e1a72fcca58-84e932ec00dmr2212652b3a.40.1785241555953;
        Tue, 28 Jul 2026 05:25:55 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e532807ddsm4362773b3a.21.2026.07.28.05.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:25:55 -0700 (PDT)
Message-ID: <147593cd-fc4e-41b9-83cf-2e42988c5e74@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:55:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sachin <ssachin@qti.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
 <20260706141346.4180348-3-mchunara@oss.qualcomm.com>
 <20260708-purring-infallible-bullmastiff-8f6dea@quoll>
 <afb0862a-04d0-4171-887b-7f32ee64163f@oss.qualcomm.com>
 <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <c714e746-8b58-42d8-8c37-160f8c5b5a59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D5T1bKKGsx068SxqDM2goLvptXpKC4--
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a689fd5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XEvzoQxivL6IAxnHEBIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfXzqil8xR3BTcA
 gp64sdNh5cNoLnGAPdeK59DQSLEDYb0mzUz7jLBjcG7TYlUfe2mc+zvHNjh5WGNfYawHy8esM1p
 6r8c/EgjtgSFzA0Swq/kpD+Uld2g5Ww=
X-Proofpoint-ORIG-GUID: D5T1bKKGsx068SxqDM2goLvptXpKC4--
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfXxfmYZI5R0SGN
 /OrFu803O3WmApY07wyE9OWkTFYsYQGccGh6qGH8vFGQQMv8S4Mr+L50PXwtazHWrSOypwIDakH
 zhxzWKQLMfjsftESeqamLiBIadEvPuliZh8MEfkGIZybSUHWRlZ9oiaO+HZTWMlkbph1dds2SBz
 iT4tJamCfqw/RTnXR2rPD770a9ER1O/NC7UfzguJCIeZH85YSGIjfC9j+FeT4uGcHqIjcVvJ9Sm
 Sq/vdREfGLCXixq69lX0PkmOU2GgXac6P/wDvMRqQAN0ZX1QTwmZJvU2yCpSRYXpO7rYiX6XcOS
 sIcVqFRkFY1qh/mP9NrpycfNyxZjIS7ukCUTlBcHZRQWneC4BThKtAGb5SdsobC/+6Ji7aaNgLC
 KTUhkyGWaPcxvp5lveJLopyawfjmTMXc+mUARS0hv7WBVLOx6ppxDAGaJ4G4z8I/iIKhJDES9f9
 MQqRXz8saz4cdWpKNUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280109



On 7/28/2026 5:52 PM, Krzysztof Kozlowski wrote:
> On 21/07/2026 16:30, Monish Chunara wrote:
>>
>>
>> On 7/8/2026 12:18 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Jul 06, 2026 at 07:43:44PM +0530, Monish Chunara wrote:
>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>
>>>> Glymur integrates the MSM SDHCI v5 controller. Document the SoC-specific
>>>> 'qcom,glymur-sdhci' compatible as required by binding convention to
>>>> identify the hardware and reserve the namespace for future SoC-specific
>>>> quirks, with 'qcom,sdhci-msm-v5' as the fallback.
>>>
>>> Drop half of above sentence.
>>>
>>> "Document the SDHCI controller on Qualcomm Glymur soC, fully compatible
>>> with existing MSM SDHCI v5."
>>>
>>> You do not need to say anything about some conventions or reserving
>>> namespaces. We do not reserve namespaces...
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Sure, thanks. will update in v4. 
>>
>> Just for my understanding, though: how does the suggested wording capture the 
>> why behind the change? Per previous comments and understanding, the rationale 
>> for introducing the SoC-specific compatible is the reason we are making this 
>> change. For future submissions, this would help to avoid similar back-and-forth.
>>
> 
> Why do you think you need to document the "why" if it is 100% obvious
> (and I did state it many times)?
> 
> Best regards,
> Krzysztof

This was asked because it was suggested on first-post to add a why. 

"Same questions as always... why? Don't explain what you did. Explain why
ou did that way."

https://lore.kernel.org/all/9bb28a60-2c01-449d-9456-bcf2d780b68c@kernel.org/

Pardon, if this was a misunderstanding.

Regards,
Monish
