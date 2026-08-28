Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71961449B12
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924478; cv=none; b=uRcPs0uWMgvNXV2h1DFsBZti2sBLSADFcSH3Xleykqll9OceWrmiAjqdPWcOK/sNNQ1YJGLTwg23PNsuwwlvgXXBO1BaYspwqj5Tkd4YNlrYDWq+umOwO1DCFZ3GzJXGaLB2odkK75ycYGhtBJ3WMVlLDuYpVEor14ucuQr0UYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924478; c=relaxed/simple;
	bh=KOzSdMKac+N23ouYpqDlMH/iQxw2XM5R0pYY2apAVwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOIzwOQgFfE9+0OP4icdr3IOCFhOjHLmsLpg2kbNyFn0uqR/v+MVJeCYQj3EdvzHWAumbzKiAwdHkmzAp2TmX6ocxMIkxPt9RGlRA7jC9DcGRuR5sIHDUH6r99c8xAswSqLkQJ+TT4InVB8GB3IT6BFDTEUeEY/61pCxYmwb+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lA9WoRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acf5d4qR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lA9WoRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="acf5d4qR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDRwa62496077
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=; b=lA9WoRctMnJCh9kR
	vz93K85UuT/bOPWebJK08XgEDrVJjsDYwLXQhbpE8nHHNwxZtX6VdnZzZUR40KiN
	084nNwsAoLvTA6q8PSmANi2C+qId2k61R6ph7i4bFFAVkx1ZyR0HSB8YWYlLCCn7
	pyr2eXkwTqFaZLwS7dGfJT2N29ZqJ27cAr1pp4S4xUezGbGblUbRMRhyQOkMpzrV
	c5EbjKhp2T1CGJ3T2XoioEYOU8IaO8fvvySwy4vJ2lFvbujT1Bo+6qaBill3klPA
	I1kIo7RwKtFSAyUu5pAOgpkMDCfEBsLNNa6YJ8AEguOim6G2yb8wBICs63MUFS/w
	6hO4tA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9x88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:16 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c665139c92so12458e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924475; x=1788529275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=;
        b=acf5d4qRMuPZpXg3AiIrPvowN6RcRyYbRVJtBL7e+0QV7fNuxoZTcsx6HqR9ykcvTD
         TV+RlJj6/xbWzpS/OjBIMjVOZCI0jPtNyOtZqkJ8dZVUEPIaqpp279nGqUcmc3ubAhdJ
         RegD2acnPTiUfDuzywPjrcXRNKzAL6ytcYEGc1d8EvuXugCmXY5wmfLvZxlA+9sqEs6q
         nYqPizcgE5OXDU6WXNgeYt5rGVNiqqbOp/051cN3s82FL1Hsm+MD1w5OYzI0or/SyfIZ
         hx5gZLVf1uMgrQyMC8CcCpT/NxX3/dzrl7h0wgu2Gc0mbtSMaMvyhyVZ/El++3DFUpfE
         l5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924475; x=1788529275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBEnEB0C2+xZB32xn87dXB3ykS2FGO6jzaBxdrgN1Sc=;
        b=s4zJukIdQ5oagdTqOR1Pf1pEoWKYcJgSSkq/FjWxitgrIdCsxTYRMtnwKSM7HIE5W3
         EOArA7uYy/0bCEEcCbi4+cR+td8EqNSAg1TvI4f+0Y1ZhfxjZlrLLOuAQkeL/ZoV1mud
         5EpqAlAOxvO3liGWsoQ/Qkm2JrE566eBKU+6xQpb0MAWO4mtoaxOo5uIQQhtVTToNicT
         CB/2tvEh4w6NuwuUc0IIcEjUY8mCpLpAt8xULoHPoCjxnvZ1sdktVSMQelyLNIt6jd4l
         QsUeaFnh8tSnMequ//hCtt4ns4l5dfiWQfRlC7GpE8sfmiPQKc2z+3VS/NXWkC1Ew9tp
         lTOw==
X-Gm-Message-State: AFuF++mWT/r/YFjp2IlvyQcdmouyLMdRNxzvCPdMtCO9aXZ/Z8oxR4K5
	QVSssC4fwuofIYuwKV0pOZnDlCjjXEnV8XRofxBHO8l3I8kBaRc9/GCMJoiT2rZF1cxXJ7MnowL
	pnV13Jf9RblmE9nUTX1OLH7HKHLea0u6gdD30PVWiBMuK4eMYt0zv63QSjwtp0zfZCSAC
X-Gm-Gg: AR+sD100YnyBSSm57jrIHciUTUm9WKpLR4HiplGwxMRo9emRBeQzefDZuzhsVll2VFu
	LhLs97Wtr0VT1NeNxXZtrV9E/rwcPBcypqEJjUk1/F9lMemL1biJ+2RImL2sfMmv67A6SG7fzsu
	YQR8UB6x6ZFer4tYdbwxLX1VxKUlK469lfwJYjd3C4CRGFEAJjgRh9FTon3v7YKZNXDonEjOaOm
	TSYzDW8r+159XR6TaPCRPE1ok9slIqpisauzjri2gyP0MvsJsVMXJVOKRPdmH4BvV4U49x7NjES
	RnEWie2viBm8JhKYRbt9lPYDtkKYlUd3jl/yEP230eSXmkfAcwy613A+NaJ96NYYwMOdgZdNcb1
	TkWo9CuKV62kwO+OlmH5ZYDk=
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr903887e0c.0.1787924475560;
        Fri, 28 Aug 2026 06:41:15 -0700 (PDT)
X-Received: by 2002:ac5:c89a:0:b0:5bd:7446:e3ff with SMTP id 71dfb90a1353d-5c680ea208emr903882e0c.0.1787924475167;
        Fri, 28 Aug 2026 06:41:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a30559cfccsm3004681fa.40.2026.08.28.06.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:14 -0700 (PDT)
Message-ID: <e4e3c02a-20dc-46f5-b27a-9fa2667ca999@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
 <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
 <ff0c8c22-bd37-451f-80bb-35389ba162c6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ff0c8c22-bd37-451f-80bb-35389ba162c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a918ffc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=aKGLMg70GXf6WMUK1bUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: uNjbZaUPnK-xAEPuAozUjhRnRheemZ4p
X-Proofpoint-GUID: uNjbZaUPnK-xAEPuAozUjhRnRheemZ4p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX8t9Dywn0eR+G
 ET3UnzhMYiUXZ06NiHjs8iNWE19XoveHXH+HvdlL06HI3THJ0qxQsV5Knj5SqIQgOUbrT7UhMMM
 OiJYEO6GfbJ2SgCOI8rweb45eKb2hVw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX3Jjw/ih4/iCI
 I/72Bf2+d2IUkc46DB4q4lFKuyYKpCqz3+iCkFbunLC9NRBFxOnQ8Qa8GSFUP1Hm6QCg/D4vNCt
 qMr6Wp37nIUi7FIqhNgkLmmGRIzMaruwjLWGbS/3Gk7y1TlhMM/blYEcgotiPCQ4MwUP0Qo4e5p
 ZR8xb+isxRH07AWzdZMl785vHbfoL06jyHQYJRkRpQKpNIGd8nVS8CJ0B/EV6tcvAa5Dq3b9KUd
 gqJK4JcfJytrOQrTyzntIuCnxd3Uyfesbt17uIewfVsUKg52BtCdVRR9L2BY+rYFwjnipho8C4H
 YvVIvqPtvK7z1seWWgpg/qcz58PMHUp8PxkegzLvWZKR+Dstnw4OH8uj5Ezbhmy0fDmjBUZL3iP
 im8eNFna5l1E5J8Y91IcxH084nbkdt2N+oF2F5jv2G7UtRt4ja1lIRR4KxUMRLpRKMC0RoBidsx
 hBJ/K2uvE6VhZqUZFWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280118

On 8/25/26 2:25 PM, Gaurav Kohli wrote:
> 
> 
> On 8/24/2026 7:49 PM, Konrad Dybcio wrote:
>> On 8/9/26 2:29 PM, Gaurav Kohli wrote:
>>> Unlike the CPU, the CDSP does not throttle its speed automatically
>>> when it reaches high temperatures in monaco.
>>
>> [...]
>>
>>>           nsp-0-0-0-thermal {
>>> +            polling-delay-passive = <200>;
>>
>> ..and here it's 200 - I really think there should be a single value
>> that makes sense, this seems no less than random
> 
> Thanks for the review, Konrad.
> 
> All targets added in this series use polling-delay-passive = <200> except Lemans, where the DTS already has polling-delay-passive = <10>. This series only adds the cooling maps there.
> 
> As per internal profiling, 200 ms was chosen for remoteproc/QMI-based cooling. I can send a separate follow-up patch to normalize Lemans to 200 ms as well.

I'm fine with a profiled value that's different between platforms if
it's really beneficial, but it should be made explicit that it's
right. If you believe the current settings can be improved, I'm all
for it.

Konrad
