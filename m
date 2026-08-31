Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA083C3F6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160669; cv=none; b=YF18CIg/FcNp+n8ZVj64OSCgute5kMHYYm+imjd3SqPrt/sG/gSTyO/HJYFznPmPCexdzaH0m9717u5eSYFtDv/1ZdoaYtx5F+by4coRdMEDMwKRn2e39q4SE9mFct0SGQ+Yi7lnxM+eQ+EvVVJ7q0HSro/RCKCoAR5DehCgeXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160669; c=relaxed/simple;
	bh=No3arZkb7GS9BUfPj5yGniRYgwn15bXy2rIPMwW8mSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UN7BogzchOWXFPJaZBWWgThpwcrTHV9KL8v1k5hdMEbOudSA9z7hgq1j3A/L52recAI/CX3PNKNRxEcScG8x9pL7VlK+/wwi7lveNJCzL1NWgGAEY3KixQA+Ls/iu/7QTmxPbxt7qjfLlRBo/yMhCm59Y1uJ7IO281x2UUlpQt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PATFg+ob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iibC0QGG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PATFg+ob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iibC0QGG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52Wca2017589
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=; b=PATFg+oblYm0y8tv
	2rQyngQZfdh9buU8BgGsGB5pTM2ORc4rmPaTBIiMGHMMGlZ84bXO89R4BFqHjcR9
	7iM50IBkmAqpBRGYJkFU9Hia4zlauRGpKUhJW78EQ3Itvsgx9MF/HVCDtwkRWCyD
	7k4u9ZAV+DiGE57vPCdDaFzHMu/gYf/YUVQXUGp3CYq6m2TdyWdFyXPBwADjmOv2
	ylE7MJ2mNTMg+CIXuBLtzJem0xhUumnni47ePizj6h7y52cv8Sm14l8GmGUXBkBR
	mA+OA72dT28Fr8/g7lYplxITDng3ywrOpIRnQ62ghZIQl51I+AW82mVLb5EfwXxF
	4yhf4g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6n381-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:17:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90ce451128fso3229936d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160666; x=1788765466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=;
        b=iibC0QGGFok5YtIVLv9VQEN0tmRwAmZ3joFHpx/XhVLuWItjkC/LOGZ5rlOZabcW+j
         NHqwMpApWSZcdrVDiSc1vs6+Ik+sWCCjTffRVSwmZrcUOZ1D31+EZjGqo/tcAaJmh3mC
         mRm2ro3aNWcT8NFvPxmxi1O7vvwreVASyjzhY0Jpjigc7TUUyGmo1Tb4QJN8ivqlxdtC
         hw1Iniq+2sLJQ7t6feOQMmSZz4LsGa7jGjNJFsiy1yl8hjK0Dd6IoVICO9EdQq+G9aF1
         TiOS2JGEZkU3jEkHp9xEsdcJ998ytp9xyx6w4GtNgqrxD1AM7dnNHd5Qs92r7m/oGgLU
         pJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160666; x=1788765466;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=794VzWlX7I18XqBnq0FNJYi5numZyllg0oZt0/y/SIw=;
        b=DoFyZCSbz4wyEOSZiI467r4ROUjxaZXc7jOtVVRDpFNwk8Hi+Mp6V7opyh5QteFNjA
         vDFXuLDcKvbQ4EBuzjT79f/8drJk2rb//GuqkHGSn6iycY5wgO+pe6vHA75RVBj14n8A
         1ZbPCl316/KDxlUTQpzeG59vzcEQlTSSMTi33E8xW0hLd7HXIF/tTYG3+13NZvS8gOgq
         4ouqXcNR8lvnj0om+5oyi+pesrsDWVvjrdGOqgBW0Z7QPziShUGIzD7qZh3Fxn0RI2nZ
         +YaecCKuIEuQ3JY+xn+YYYEIQg7JaXhquJHBiHA+S/WNgmMy4V5JjPMp4mMgUkR/B38F
         Fu8Q==
X-Gm-Message-State: AFuF++mSs7txSN/R8MO3LDa0FMgH+Xjora9m4qDnla5ut0gFXADwPaA8
	VAmGkeJO1CZ9WMlGeqgtfzvBEOPVIQOcZW8LJhYrUHHXtj4HObUTQxqdWzKfu4musODhOBmaQI+
	Q2HN80lpGv3/mZHRCOD3C0a2ElJJmeA1JTUWnREAtgXBbIPhRnIr6gjOpOAmBRi3HbwAS
X-Gm-Gg: AR+sD10UnCA+VqlefLTyqJeN10Enc2YaleQOM2emEDr04HwrE5/cHdPrZk+gik12kag
	SRkOf5KCufWhGdbFr854+30OlxTwGoHb4fu6kxL/2B83OOSD2PUNDX/XCWR1YtPKNn5m7k5yvz2
	DnKC9ildrdF355DJ7xvUnlKlERhwU6f1pw8cPG2fbSOCrpQ5Ynt3cFOByTDsKE3Cu0Vt18WdAHI
	ofInNuea/rwPJh7kLpeuAid2GyKGEgUbN4GSh7HvW0UakQdQIDKpum31Il2G8eIcFq+Ja+IjkS4
	phUeJ/iqTyHR2KKfXzHikm8sBfC2r6WGOrmSmqI7d8i/HflQY2OU7t9+/bOEkwCiWm4BLMOFv+U
	/qlHYFHChH7czY0epNR79KQ==
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr765030085a.6.1788160666006;
        Mon, 31 Aug 2026 00:17:46 -0700 (PDT)
X-Received: by 2002:a05:620a:29d2:b0:939:288a:8a30 with SMTP id af79cd13be357-939288a8d25mr765028685a.6.1788160665503;
        Mon, 31 Aug 2026 00:17:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f29a9dfsm398576666b.63.2026.08.31.00.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:17:44 -0700 (PDT)
Message-ID: <735301a5-3685-42ee-81c5-57c9a04af856@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:17:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
 <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qTtrh_k8-vWQhDSKaSSfsVMKTVFGWGbC
X-Proofpoint-GUID: qTtrh_k8-vWQhDSKaSSfsVMKTVFGWGbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfX+x5pmCokr4fu
 f1DZgX5ZnaLLfBCocFDk2J83MUwE0UJEvRp2Vg9ZdYjb6SgbBITmJRLq7POYT/RidPeIAUF1g9J
 2RwQVsep3Th/mWqt/A7mYZ5MqkMsYMuJuKIGDbqAWMVM+ysk36Ffw8t+VlnYmdujQisvls5ADLs
 yUypQq13XRaaxorQ05RRvuSaJm4X91pkTyNtg7spCUwKnR2jMnEIDyjW3ibB0AKXkFvCdovzVLM
 VriigqCdGdemdEJZCi8rjMGfneUCFsibQPY388hPTddHtM8OlbIj/ugSu5IWJZ+U7pTSJ2Jl4xa
 zt/EgkZpo1yQIjSigI+E9ZhlxAMnOhzjKn44kKoZ+J+ETtpe2D0SL9o4AXZG7TGG6aw8oVyI4f5
 AzxETp73Ufz8tf945ezBzK4XU+FLTSRPTmt/usg22V6c63lC0LubIBZZIG3vf0qffGmxlFwbqAq
 USZBKXSY124AleNgj/Q==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a952a9a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UFs7FDn9XIzN9GNbEyIA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MSBTYWx0ZWRfX2S8tDHI9gtNc
 No0YMRYIEVDcQlSXcdCucCHMwHnoSx3WxrxcWlyqMKwndnKWUchMjqn3jRBwG7H2DoScXRR3QAS
 RUN1aJCJZKz2mrU4+FteCRs8quJ8pig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310061

On 8/29/26 9:08 PM, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The DisplayPort outputs need the Glymur DP PHY series at runtime. This
> device tree builds without it.
> 
> The chassis HDMI jack is removed in v5. It is driven from the usb_2
> combo PHY as a DisplayPort-only instance, and that path does not come up on
> Glymur. The same failure was reported against the already-merged Asus
> Zenbook A16 (UX3607OA), which describes its usb_2 combo PHY the same way. A
> fix is in progress but not yet available.

FWIW this paragraph would be better suited to go under the --- line
(the part that doesn't go into the git log), but it's fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
