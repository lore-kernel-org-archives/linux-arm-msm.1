Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73946455633
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791366790; cv=none; b=pPK+Vh3SSC2YnbvYf5nrD3Yt5hWc1QH6oJ4sq1zAD0D/f1sDuiAd6aT+qOuCvKic0DMYE5VuEjG6yfmyLQ+UG0FY2AJPzmUCTB318bLb/npLnGVWFwrg6HY/so6n9nBoISmH3BMPXyzJPXhm7zKkMsPOaXFfUQhnIaTHxkFiK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791366790; c=relaxed/simple;
	bh=9gO4pwz/04Cg1frnryDEcaXN/Rh7zIp3iy6gJ/EkT1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WL0KWaHgf7NxOqf04MH19GqJ1MMUaRkXM7bywBARAMi6y1wqO4f5tmT6bjiPWjIAHfTOEXxcL4pdgxwXcdoa1mOKGqWEUm9dLGbb6wf0w8nM4Jb20hc9h3K+DYaQ5DVdXTbkTKb1CjOJGylutRZZl2M5hPu8cwG4KnBU27omfaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SwD1Viq1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgK3tnEE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwD1Viq1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgK3tnEE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jmlX3686141
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gO4pwz/04Cg1frnryDEcaXN/Rh7zIp3iy6gJ/EkT1M=; b=SwD1Viq1+FLm/eF+
	RAl9AxdAST0Tm4M6nWvTDrHKSvpQ9hl21YrYSop/teLV4wbMW/HvpA9jY3Y7GlTu
	R8iqRnXGZZJ2GIgQuXKDGFf83GRAicbzjd/dcmxUNpkzLZlpqCzQiK+O/kXctzpu
	FMO/Hb+G/V41aEQteaaIQvSuuG4RC+kKyk3drWFu1f7tzXxti2tZ6r0kg9VTNpFS
	zAxBOYSF6rWClz8k/mXGk++2YecQ5hGX4t9MLFNiwek7bbrsI9ZaoQ8ewqog5m5l
	caIMkfKsskjPrnKTs7Gg1hdE+ZBtrj3IoDf9KnfyJhYObLYlPtqDyPQwA/zxB3nT
	7yk+UQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609j6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:53:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35158d674e1so3434868eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791366779; x=1791971579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gO4pwz/04Cg1frnryDEcaXN/Rh7zIp3iy6gJ/EkT1M=;
        b=XgK3tnEElHHbmxBlm8Ty3pCRTHp7V0qQ1a53iCQ1yYQ3RwHqDTrORlKDzROao9tlD3
         K9BjLWsJhCD6we4CYBi4qioxwK4jLoEVNec/LaAH/q/BqXnqWR/54au9KYkUM+841ewy
         pnijj51nUqBhiTlpFMZ6ZsmlLHwPNwk0kamYwhW1VXlIVmsIIpsbY55hJfx7JBgjVc9n
         +gGApStxAmQr16N80TeL+PnIBP2lhvgNtTtHWQiz92w4W/EcIaqze4pR4ii6gdA+Z57h
         sCMpUNoqSBefKxaCgN8mumOsBl3kataD+4dsDjOLO7hXFWJaQFM343j7QkQWP8Uuaeb8
         2A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791366779; x=1791971579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9gO4pwz/04Cg1frnryDEcaXN/Rh7zIp3iy6gJ/EkT1M=;
        b=CZyDj3V5fuIP1r0RrZcyc/2mp96kayOZQLl0oy+q1zzSVkBe4UpkNATBzKFneC41J0
         gX5jX5YzUJlBg8Lr2ta+sg/54PWCbdCBNw1xHSo0WT0L5bVrMQU6AXiaqr8DvHN2mlyV
         UCVGUmM9m2FkrOAz3SNjOjOtpfd25DH1zU1jmhJPUQDXCr311FartL0N2BsSJrp66fCs
         Ywf/emvOXNXshBfvMTDGnj6dUrX7JA7GqvF1Q9kFHrg9Goe6EypkLMWZktJBYB1WD+vu
         4devFV+NDlf+Fa1wHwyiTdVqhlXAYMiWWAdj3b03EKi3F8Y5nmgT+cXNyph/Mn4hXi92
         NXCA==
X-Forwarded-Encrypted: i=1; AKwUvBxeVIjjaz6mTDWlSU0m7Dmb5v/U8lqa+kHwITUusGuucVHfCdQAR2bBgHWShjQjopx8jwf6PJL53NiTf9Aj@vger.kernel.org
X-Gm-Message-State: AFq9FYLt9VXAOsY5Q964VMIWX8NZwLDKgucR+FLu3/f85FsezPZ2626h
	IRPpSIYDfsTKZaERmCwcG31a1zPoEnO56eCKRvHJqsrmhL6yjty+NtRmP+DSe0UZkcXdKwmv21w
	Z2Zath7GF7Pe6aEuJnTPRZjYjFMjQqc0QpkFYaS7itI+plGXplwPMNIftJKTmclV23fYvXTCpAg
	5G
X-Gm-Gg: AYBFou2w+/0OrIO880UKAOa6ZmMo/wlciJF/LjPvC38PIL/nlCyKEMnY+UJmVcgqAiN
	D4z7tMaTiQbrASYf+kOPnLixGWvxoI73c9LNi8CEYjCorglEtpBY1QrZakZMNzrINjog/u7h54J
	tvmMAlym28wwqtp16qDEDELP7cWuD0IDAFXPov76l26BJhUN2DOApqv6fHu4KfoXGrTP/cYx4MD
	u6f3GF2opYoKg/EmaPJQgE0dn9FK5DAfwYYj2sdBZR4Pj3OHjN64WeFIcBDf24lRb5zZfsCLT0p
	JSCC8cSJIluoOlXjP2TTzk+UTPkqGQ6961h451JtD28hooHDzkqWI4vmFwr1Zn0gev0WHdJVD3F
	gIUebvB0Pz3zzoUtV9a4ROM9H5g==
X-Received: by 2002:a05:7301:d594:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3515dd951d3mr1672941eec.9.1791366778867;
        Wed, 07 Oct 2026 02:52:58 -0700 (PDT)
X-Received: by 2002:a05:7301:d594:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-3515dd951d3mr1672919eec.9.1791366778322;
        Wed, 07 Oct 2026 02:52:58 -0700 (PDT)
Received: from [10.218.6.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af90521sm12886015eec.19.2026.10.07.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:52:57 -0700 (PDT)
Message-ID: <bbb59b91-c3a0-444f-a902-79a43fa0dd7a@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 15:22:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4
 bytes for read request
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown
 <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-1-98675c248278@oss.qualcomm.com>
 <20261005070021.orhixqhfqqlt4doy@hu-mojha-hyd.qualcomm.com>
 <ltg543gynh5obljyqbtnpn3mnbdpmrazttblzpuvugoshqcdrw@dxksbmbtnyyi>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <ltg543gynh5obljyqbtnpn3mnbdpmrazttblzpuvugoshqcdrw@dxksbmbtnyyi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pu3rqDz0Igj-EUM9TwjIuRoVfNxHAp3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX6V74zpSbjtK9
 6WDnkYLFp66dM1PnUlOtNdX2SC8x3q0zUqlkPXZWg/581P1uy+wwYwqn1Qr4gbgS+qOaEnobdez
 j9m9VfgAaGcDm1k/SjAj6CWF1n2qQlM=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac6167c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=W_yJ1xEsLHEdduS58YEA:9 a=PRpDppDLrCsA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: pu3rqDz0Igj-EUM9TwjIuRoVfNxHAp3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX8N9Vxr2A3T5O
 OMCkMCYir5bGYw8tUdG29kEnCR2b9Ny213BNwn+h3WxXR+4cDISRFvnrab9MTL7ne+TyMlGbs6g
 mnRJpRSvxKMyo38lQKiYoUna1D2rFda5w8B2/J2k8J/K21xit3m9qzvH/YRo/tRXrNt2z63gPfi
 NPuApFgobgmYX+4nTkt5jT2Y0LhPOP/FLkty4E6jMdBMRLMPXpNxCfDR1wYzsV776TUDOQars00
 AJYCwIpwBgBS9dM5Ig7UabkbIsnx4Vl+qp5YBSLsi5Pt/OLcT1+MKUohyBNH3ek2idXfIeOtGJu
 XKllTGNKI8s/la0vDR7hsFb1yxx8oB6lJqBvt1MzRKNUehdieD0+iX4gKW+d3VsTuoX2Np1dJtY
 KXNjLr2XIxqO/Gkf+qZ9/DPyp8+opkCgKFzDaf/BJY2x/SgeGGhQ2XOYM4Iv00QOttveSpTZA+Z
 y2IwWn5Y8TEIqTOg2Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070039



On 05-10-2026 12:40, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:30:21PM +0530, Mukesh Ojha wrote:
>> On Fri, Sep 11, 2026 at 02:38:13PM +0530, Maulik Shah wrote:
>>> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
>>> request instead of default 8 byte on older SoCs. The write request
>>> continues to be 8 bytes.
>>>
>>> The CMD_MSGID_LEN field is [3:0] bits. Describe the length bits as a
>>> GENMASK() and use FIELD_PREP() when programming 4-byte or 8-byte message
>>> length.
>>>
>>> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi
>>> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
>> I know LPC is going to start today, but I wanted to highlight this patch
>> specifically, as without it, both Hawi and Maili SoC do not boot up at all.
>>
>> Can this be picked up as an independent patch for 7.4 as conveyed in the
>> cover letter?
> You've sent two patches in the same series. Typically maintainers prefer
> to pick all or nothing. Also, Fixes should come before the actual
> changes.

Let me drop patch-2 and send only patch-1 in v3.
patch-2 may wait for some more comments as per [1] before merging in as fixes.

[1] https://lore.kernel.org/lkml/53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com/ 

Thanks,
Maulik
