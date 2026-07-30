Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEA6401A06
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403558; cv=none; b=V6sbFkf03bBKCqHoLCH3kRO0RlJsCFqjOeEM8iL9Bcw/lo3Pth67wT4mN8tvFlI+Sv8Q1fgvTK44wN/zrl7iV77sqhIPiyEyXVLtshlQYdv4Qny9rIsFky3pTQtr5vGUO5hy+2bju/rHjZ/LM9yF3oynVbN5KA1JwZNPkm1FTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403558; c=relaxed/simple;
	bh=e+kemegnfd25Sop3xdW/Diw7KF46KmCCUk4+XwwvsRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQ3uRSUc6htszDYcgfamqkZ970mN+BNJwUI+uviPG0MD1BAEeWDJZvOzgfAZIQGngYOkvsjyjt8kERwjYXHudSnlfujcptcDjqsn0V8+HtvFayWDWvk4H2vvctWHfIJFsEbqyprm/1Lbu79RHf1SflBtZAqNKBV0ynbk9SVVgJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djH7gx4i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9XYEhMY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djH7gx4i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9XYEhMY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8wwWu599196
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=; b=djH7gx4ile1RlJg4
	SoMWfm+PZI8SQ7T6KhXEmU5zRY/TWjmp5u8wMDGtp9mnYPuWd+TAcjdqiF9UmrlE
	E3B6m0XJNsGaXTRS+o9ANbm7PBAXCoERL14DOzk/GfCwYzleJwRRh9RVOlQipfUZ
	L7cXtrTDaJSsyrM/QWoSn1DJJWPm6GjD51trDw9kmx77fv0CkNTwPAe+7Tj3OkgT
	C6hpb9/+Te204tTpVCa6cSkIf0v5uu8gVH0a7H9m1FE+MCjseV90VLrhgYiQUD87
	XVSMWe0hZe+rJXa11yLw0m2QkAEF0NMsQUHhSK6heJZPWuVz5j266zc/xMecN6d+
	YqnarA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3jv04hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:25:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so4248541cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403556; x=1786008356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=;
        b=d9XYEhMYjHlaGfZnQfbxdUOkZCpkCkTxxeNspBU6SQqmcuzm7V1w5N8IfvvgGjYOuJ
         /zRv4e1cioxqjvGgtZK1ROnABzWRiCXE34s0f2B0J9pOtdEKPGEUJYWVhQd628qECwMy
         dxn34AaOoykTyb6jeT+QzMruQ4wlBNqdL5n6CUtw1sa7ME+4RcQR2rnwpfmWR7g4tap3
         IHfjiFY22hmjJxejo0ObpFyBK+ZQABqx8K2fwxz+3ElOE9j+EZ93ny2yUbQLEI/W6w6j
         YEBke7s6Ze5YDsNM8Jv14RBikH4M8i7pWaJ03oVVmWH8QJLHyNhNYhkmJE15We3YR+lt
         /KTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403556; x=1786008356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CpwG7cUwCiBQiNOvTzmfNMlN8+MeLdJPK4zcBEkWFB4=;
        b=FaUJKPSA9XM98nRT6OlUxOpUNrtSqJ5m00M49CXtaGT4u47r7t64/MVKIc8CAsQ4zv
         TjRVaPrhwIN/qb2SczaXWzxCBhwH/6NrWiYwie28u0XsG3KP3CEGKvMZcBwsjHjdWIyc
         P8Wit1/Su7mwzBbmpn7+R2Z1msUjqo5NfAVx73jVeBRmXeg2TR+Fx8ltv2iAzzsLKFs8
         1qDi86PLizJmBHBQbpliE0Eb7vqMr0/0ERw7EJh5pDWDzWJziJAn57nUY6ENvAOgeOBP
         6qKkmhU9xe3Fs+74K8wPQQ+uXKT58EmxGxI5/BP6LNgfErw02SxowfK1qURb96vCU3ER
         yl8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKGqMMyh/H1f2QbEXiwdZY0UHOf90kYAHHYjCtjO0R49hmjonOHdSucoOL29srxQoSDT68z2uSCD8E0ZpW@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIMhyLfDz+SnP0RvDyV5fati0sPpsvLVUE6CAD8K5u6+BO/CP
	RPV1UM7G1aQyhhVuQaVlTY3lFUsMWIpQQ4w4fMaRXoZgDiUifPbu418Z12ksUpVjLKks4CH00Mv
	DQP/CEHwcUiemZtixCNEK90j9x+JgFyZAC/JCP9eI5SxkaJ+DkXMPRGRaxfinl9a7O4P4
X-Gm-Gg: AR+sD11J+81TJwsjRjaCoaPkWGAQ8jyttnVNNb2284sStuwYodxxAzOEkCrJPhTdXF5
	TQaBWCy4dkP+WjOykOxUng1C3bWHkz4IuCTI2BWl6+Dpa+CRRt6GvYMVFT3bphGiPrqJHvJ/30j
	4ww22U9ztUgtRuQIwd3O3/YT23u0dAyjCF0X/8GPSTWnXINyZl/8yAG9YnsUp0SgGW55po0Y+jr
	eHwJWt8qnavpYcRMS9TM1/BVy9BDUEZ3JwO4dyiLReRUKbh9ATieKvn2bTaObSHa5zxPK140TBk
	EVyBcupPYwUTvtDCjrDoutTtsSgXX8GGh59kuHynlzpjRgG//h/8g5nN3KDRcMsfO37dXiDiYrD
	i+taVNwE4XVV7VrrNi4gXz2fo
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33502231cf.4.1785403555721;
        Thu, 30 Jul 2026 02:25:55 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8a:b0:51b:f40b:2faf with SMTP id d75a77b69052e-52b386e56d9mr33501871cf.4.1785403555230;
        Thu, 30 Jul 2026 02:25:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bb46f0sm46325366b.44.2026.07.30.02.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 02:25:54 -0700 (PDT)
Message-ID: <f122889b-1278-43b0-966b-562b5388e587@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
 <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
 <amnDqhTpMffP9M1w@hu-qianyu-lv.qualcomm.com>
 <cc185dfa-4271-4c63-89a9-05b8990db242@oss.qualcomm.com>
 <amnM/dVT3tZeR4h7@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <amnM/dVT3tZeR4h7@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX3LrhCMGh0Apn
 LbHndvsZEfF6Qr9g4ZcniguoNyNh65J637trCfx0fyR1y8xvw07ywcFcU63KqDIpacW6LutVjL0
 3IRRDNVdILyG9ifoJIPYHlvGLpmRy5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX9sBHIAACbgwY
 l5ND1m1K8mHNtbEqXl6ihTQEDmbgaCsUVBRSlj2214WgbhJsXNwWRDz9XKXFYt+RpORT4sMCapZ
 QgmClMIelcIDPZD9bRmJXFR9PulDnUa+YErmw8JM9cI9l0tRr1kun0rnzlSQrYvrjK6mm13+Otx
 nkyFFn9VFW8lGhxI07VtG+jwxNzUQ58BtR59agzP/oxhWfMgMHVbh09esVJciISMKqiXcJ3Jpoe
 +wSMGcBwCM1nFzlhC1y+SUrRaQ0emZLO/sn+SkBZRAQHFgKU2b3QcnQ1c4Rb/mJkXAv+Qf0qcEA
 N0JlZXF2HigkP3UuMYeIzxniFT5E0D1tz/ovI9/6RzyIM+V3BfVarlno4rKDSL826RVa3UEnaa7
 6DVRGHJRNrvvG81Q6GS1NtkIpdBa4Gh7jCeMO+v/l9JbYmxHnY1dYRVFaRngIRM12+OVFvKrf76
 7qJAYnxMtMeOdPdJiNw==
X-Proofpoint-ORIG-GUID: SQqi33VDFXw8lPiWC41bvjIU0LkOC7mE
X-Proofpoint-GUID: SQqi33VDFXw8lPiWC41bvjIU0LkOC7mE
X-Authority-Analysis: v=2.4 cv=Tb6mcxQh c=1 sm=1 tr=0 ts=6a6b18a4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yc642J7MXfvTOP0XSmYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

On 7/29/26 11:50 AM, Qiang Yu wrote:
> On Wed, Jul 29, 2026 at 11:22:45AM +0200, Konrad Dybcio wrote:
>> On 7/29/26 11:11 AM, Qiang Yu wrote:
>>> On Wed, Jul 29, 2026 at 10:30:27AM +0200, Konrad Dybcio wrote:
>>>> On 7/29/26 8:45 AM, Qiang Yu wrote:
>>>>> On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
>>>>>> On 7/24/26 12:01 PM, Qiang Yu wrote:
>>>>>>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
>>>>>>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
>>>>>>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
>>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>>>>>> ---

[...]

>> Do we know what happens if UEFI sets this to x8-mode? (is that even
> 
> UEFI will not set it two x8 mode on crd.
> 
>> a concern on CRDs specifically though?) Will the second controller fail
>> to probe and become a sync_state hog?
> 
> PCIe3b is not enabled in UEFI by default, if we enable it here, we will
> see probe fail.

OK, I'm happy with the patch as-is then

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
