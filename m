Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524944A40C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388810; cv=none; b=ACjAw7cUj+2QvAEPiRr7C7ej7tkIp6RcpD3Rx1Qr53+Lqr74Oq6QVHXtC2GdhlQUdE2QkfQ9m5FAXNQJE2Gs0RfRFEVcjAENU46EoAuriUQ1Xf9xpZEX6Wjb61z7S0GhYP2oFy75lJtzdf0UuCYeGFuZbXMYmvbuIPnh2BMusug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388810; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m4nDsYD1luvdBD3Us4o7jPoI31/fXvrtp95zxDmBzXhKDAAm/CdkEjarHI6pVSLmjXIHKUOulv4U60ktFYfTvs/kQd5WTUTKWUv34pm9GL2ZSKqScwMdTbP0/K1EFDykIGXrWNSzGnSgLchdrBPMQcYP4iBTmSX0d9BsJ/DxDtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ip2yDfeC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hp5A9/yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ip2yDfeC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hp5A9/yq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm31Y728468
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=Ip2yDfeCU75+4C6P
	KefBum5gtJk4+gMuqAyktfSWM4mKwZZ65dRwMcQ9Uh+sE+9SQO0Ww1rswWC+algF
	TgAoSZdQcg3UaaCNNxUw78JmXTWXRyzXcn/aaIEILRGUnRB140tY7CC+t0KmW7Rr
	FuJBXJLcwO2gFixC3sPYzkuIqaxD0Nc9odEYW1A1smxv+sHUZ1G55E0D+yjHwwQ4
	LRbCib/iOJGX9n0CGTaUezmcVRu9vK+N8JDqzNtjK6gD132pHB2aeCGGqnzIxcWe
	HM0+nlzKTMqJAVMTj8wN+yKin+Q7Dp2+WlSDH77Wk14oJXP6v8jeDM6V1ca71qow
	OEbE5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rv7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:26:46 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6e562b059so123916e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388806; x=1789993606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=Hp5A9/yqlSI4Tp1NB1rdk3aQTCVST0fTPk2kTCxTOq+rLYWkeIyprKHuBTVwa6QVyB
         Isg3T+5b1cxoNms//0GIgP2MrRXmH0E4TR0KkNS9PHQDCGRCcLegwnPj9rb+37/XpU03
         hb8Kk0UsY59fQSejIr0BeqZwE337a7glLBfZkuRNMJXMnwxWqinSuFdN/xmfVoNI4f3j
         Ma1BDpbWJcgWxnPV4v4X12jO3Ra2JVAwqldq4AtbdqdqHEPLQ1YnQzEelYaFwmtu010x
         ixDplz6Z0JPnBQTgWZ0aKvc6C11FJFkhGoJO7Xu2hvQw5Tpv6ClQjdUgggAEE/uQ0Y6N
         FaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388806; x=1789993606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=VSx6XNsnhx8OvOQuHIhCVfjVPuQUaKJd7xfd8Vq0sjYq6ZPpxTX4J5O2aXYAhW+62/
         DdlghZBTDGaSwfJRnosmBLyXYrI76jaarIlPOlivOdF4yhiUhXFI6JGs4RVJu3T/7odO
         wO3lI0LC8wmuIc+qQffyxvl+A55hl3VCcWbl0BZqBI6ADhCuCgc1RfTrFpTnfZfjXONl
         xx3pWzbaATe3e/4ANdxmzI4OAf6hG8Rw/xSCMf+3HHLkyBwSt0aRl25UrGX2SW7G78yO
         //o1NmzEV8mnE8guVzq19VkZst1+7ZZw3sVTT4rB29ZtbAVvOW0w0t+i0Q9IAklz1m6u
         ERyg==
X-Gm-Message-State: AFuF++mv2eIQuXMvkgWgNylpC0XTy+PDUg82C3U/sLru9qf7R4xc8yiJ
	Ib0I+3DYnsJ1/lUYrUQAsXnmXt/u0ggXUZKvPPgiFR0UAvMSHe2JnOZmKXlWQrkhNygUqzIC3dB
	LzURoulc9TGkgaUNVnjgkFtXlqd8VgbXZtt7jfyKDzGkRg6ZzklTy1YkVr2mwNilp6QZi
X-Gm-Gg: AYBFou3B+CQ0+aciq0ymtHaKlTl5Tc+9uLqT4L9/Kadkdd/2CY2jHrrJVopWpjGjkBM
	N/g5yZ5neTD/gUZnx7J+Jc7QNFABqzhBf2sFgchjWQw+OgkiQ5v6TjGcD6Ra3C2GY5zBQI/tqEA
	ZY3FkLNyhmvaEYyi+fK6BzzRc/sYMptBplpZermFo9PRId2UECxWQ5FTczA3ITgoLaxdzyv3h79
	sZ0amokq3ffR+Izn4TxgqdFsq0yN11deKUh8bYGz2K0cYX1byYr2FZMG/pj0xtYVIAQyB0xQGB4
	BPnGXdCCiZTJP5vc3+VpWyqW/zThVKFl/Epkw6XkZYHFiEM7uYtVyNHBwwiBJu3XGG2stBPCMib
	M4bC0rkMzxD8g7M+bTj9yMQ==
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr318636137.2.1789388805983;
        Mon, 14 Sep 2026 05:26:45 -0700 (PDT)
X-Received: by 2002:a05:6102:5792:b0:797:925f:2563 with SMTP id ada2fe7eead31-79b5c8ff6dbmr318624137.2.1789388805506;
        Mon, 14 Sep 2026 05:26:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046a417sm2363884e87.51.2026.09.14.05.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:26:44 -0700 (PDT)
Message-ID: <a057e3b7-1973-410f-922b-df1bf13b72e6@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX5CRY/rCpkroB
 Lz/8B8OF/z84ppRKcUbXAg0nXxW5kJewbsN5meH6kOkibT5BsBosnbOIs9wwCo9utRrr7HruFN4
 IM1U9f/XHplstspoRAqZsmIMmvT4BVc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXyfmeyc6pd+MY
 9/Ld5pSh+4mY3+H706mY85Dc8TfR1xJuZALFHmZ6XLJygalsImI99MpnFaB3nHDiOz2I4oBFW+8
 Suc3qRjaqUWJ+G0ZQ+e0j3oevrNbd4/szOTrCci1+EU824nhGAuWpsgQG2aC7KiY6mFCDR5kx2h
 EBSbZMpLajgmJ6ipNXc5ysZzVGG4YCYIkKpKRl0LtgZ2OU3Ph5SATG26YetilGds7ngMPKOHF6j
 yDASe+K17B96t6pCiMZhof/nroWM4brZPyG3nLEtqkJ/R1JRmiq3ca4UlcOrBiPZSILSKFSGP+2
 hEJ9xrNm9gXMjLrR1NluAD66/F9zUaRkJydilkgiJABPqNL6+M9fqAONAnwna9oGJzBzs2rxouT
 SNeGaKro3GgGsqBIDtvK0g4MLFonEW0jTw4+NC4RZlwdT6CPJ/c5tZra5M/6+dz3m6f0wwFFMW4
 29CDaHg++ZvPIelB4Qg==
X-Proofpoint-GUID: p9QuCRD7z4YUw9_3hATuQ-JbIjt7Cg1i
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e806 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: p9QuCRD7z4YUw9_3hATuQ-JbIjt7Cg1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
