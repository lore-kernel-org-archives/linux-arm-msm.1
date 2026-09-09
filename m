Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2752FE4D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788951636; cv=none; b=f4CbYGeKPuCkf3GDUL9HLA6HOINQJ8y6NdxBOws0ZdCeNfqfatop8+gPM79JLi4/tuB2pvLuWtPjHc12rqlyjIO4+2Tp476TMQXpP8kfy1tIttyv2XNDpfP7V9jzmoGcq+fdyORtloYxLNnG2GpEHFmELJpg95ZGQQXsUp5KWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788951636; c=relaxed/simple;
	bh=BpZU+Csbr6XAi4Uya3364FwpsUxyX/Gtm2FuGJ0r0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dq+1ipb28VHF3BrdpK/sCjJEg/O0Oh5QisvqSo0b/RmrZm/sSQ256teegRYXnsLCKqtehP3Nq4C5WJNquykHNHXD3VO41UOXJ/7qcd4y++rpTgWaS8Sjx/l9KRaH71CwMGbU8cZV4S17b/n6l5ppe2xpTVicf5QKIhmvyUA/rTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cH4zVMhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc2SqaxQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cH4zVMhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc2SqaxQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Apval1639521
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=; b=cH4zVMhTMuyO21jy
	30UgnLlKC0zv279sZxMCK+xh5RiN5zRsalXPfLhUQ+C28JTBLAfQ8IvWaoWYV7PE
	UzPSVYD06CV+MImUo99tggF3kuSifr49YyTuOd9XVF48p73nU75E++tyKC0/apAK
	YdDb13iTcLzj1TgL9OAP/9oRLiuYdWw0s2UXEkiqcUoQzU8wYaBxUWfSYhMTPHTP
	Dq7s4CXX3VjbCnjO2mADXjruMYg4KHjYd6ez80ETI+UMCKmiVc7oBURqpGfxklyl
	4CVptdJ55cSeRHfpDxBUrHKRjXK/cBetZ+n/cQ11L+7ZdeznA02+DiJBvzARwaUq
	UZZFfg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cnr6uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:00:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso168921137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788951630; x=1789556430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=Rc2SqaxQWswonc3Vgk7Q8btDdty1Ts5lbN2x21NViwZulJYXmBKf58Unjm7dgVP9sI
         vuFeamDXhtKjqaEL60dReO1PohmqLggwfKux4LKpcRHSbKVgMn/RJGUPPeEKKsK7J7fj
         oULOb63SmVGsgkp0F0NafJ/2LUpAZPt1aBkfRlsoo1q5C8oGssa+yigeAW9N9/4Pd+wN
         N0bA0FwyCs30etEuwZPMOtzTkinrhnooVvi4SRQsvo3s/1Jq9xZJhPVSBDl7BE900QC0
         GI1iGDBjr0cdco3XC+2LUtvbVlx7vqs8m7O7XspEg6k5AhZgNwIrL+ymSRW4pAFlvvzp
         bUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788951630; x=1789556430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7M1xBfbwoWpxywxGNIz7S/tIizoYLnlcHAJ3EhjTxbI=;
        b=ZsbIBUxqBXygSOFp88aFRz8jNF+gKdVC/Yt0QXbHf05j4RWxXGroQKRLXWGPex6wzv
         WCC0KtkeJLQumdCwJrWsN+aKyRxAue6oyx1fX+/OyxB0Adgh8Ci38DUnzLlTtYYtw9ba
         uvtucFjitpbT7Jw1Ha0PExE54jtFK9MH2pglcaciflEjGCcv06vUL2X87jDG1UZpXdDI
         4giCUc0Whiz1SOKWw5KTTkFlHG5GcVjp60v1auQe5ZZqfNu0d987CjQ9C1gii9tXNyCD
         tXpgHmk1gX+HJY4HlB/1m0Sj8Fth23DDquByumKIPxH/yRh0DYh7tCmREEGw8fmmg4xG
         +8vw==
X-Forwarded-Encrypted: i=1; AKwUvBx43wodMtN1hOuR4ISU2oR6LZBc1Qp2UFR+tNUjDY+w/TncukwFWMK2HZMaBkPgsVfkP3sILTVvZA8XcXMG@vger.kernel.org
X-Gm-Message-State: AFuF++mEfF1uwiFJJgMov/rtJ9YFyOuzG9my6b1QehlCoc+bleZ9WiTR
	CERYfu+1U35Tx2m2be1566Tk9GRlKXdAUfKHEoRw+zbv5FMmKeQfLuuXwLBSI9Q1KvGmRIuMx+1
	ayAkC/IosYl0ZZ77vgmGtc3Qy4Ib8cPJXwl7vCMnr9+ndr1UBhEScDFgJJUe+/Q5y9S/1
X-Gm-Gg: AYBFou0vQr4K8nyrOmwVMfy6aNry9Rsy7XZx2yqo8KPougkOOInMJ5bcnRi3F6yz7MG
	9hQT+cby1u8Hg7F5j9TF6On8xCGXXim0Q7zuvsWgWcemjlcHNweJuTenWmg9F9+hd5QXQt/kCOw
	F5LSoN5NjqtK8KECJLhC8Nicyp36+1jITtaVaJ7uup4sZSMl6BEEYgpu1qkyHUzRKC1agYmhr7O
	pktVYOWH+SNImuVpWEp5dKZ0o08v7gtM217coqY+Rhh6bni6qAwGJKhzI9lgtUBdgcQM1QlzLMh
	/5dTdLuEVAWbMsfHMU1vsV7YHJj1pmti1cmn8LUU71BYM70fUZyidNhR/85zdah8qIm2IwBmZYb
	kaFMhyIP+riKuEdt0towJFQ==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465030137.1.1788951630521;
        Wed, 09 Sep 2026 04:00:30 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2465021137.1.1788951629956;
        Wed, 09 Sep 2026 04:00:29 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a49e959082sm3022831fa.20.2026.09.09.04.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:00:27 -0700 (PDT)
Message-ID: <0b999fca-7441-44c2-b6b6-a092c30cd65c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:00:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BE-UACXmhratFXM6DSvlkPf0pB9woero
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfX4TlhBn/MARRr
 n9fTnKsJp87/8xPLxrO5nGWnQw31PCacytJ9m4DaV680vSigFVP5SBjuUs2bM4+FC6kiYGTi+H3
 uZ1YECn+8S1gjElLzjwbWeXBTP/PYBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyMSBTYWx0ZWRfXxXbl8ZltbsEs
 0p/cechcpdrFCRjNb+xdtBTn+YkPbs/eSEvf1yQs35rSY0xZlvY5Qxz5iRbEeN59abLQF50XuuI
 yPvVn9Pu5RphkkdjO124Z5wefiBfyJkV30QQuQUOj8XbiOSueWH+nKnVIUuprtl3stPLogB8tRP
 bL/rytfn4qb1PQVyGOXPDpkH/RYUphcazR/x7G55lRiZeVSGzetBpaQsGTjp9tilETWdH8RRH+S
 yWUks6xTMd7mgOiN84CPM9AUL0lVZFqL3XuugsjVSPGmHXqFIuZyCSeQCCSthro3kPm2iP1ii0b
 yMf9nQgBSiNxrzMJBL4vu5OSVIu0qoQ8O6OTecLOU2QTuqAf16FPLAdWLy/MVxrb4TghdNvzQBo
 GRq1iV+4PvlfAPPpHGQ8rV179xLpPl12rsbiyoXj0xcn1uvLNEp3vtKm/NMkXuB9XHpkseHatV4
 huC5kKmvbF+oW54wo7w==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa13c4f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: BE-UACXmhratFXM6DSvlkPf0pB9woero
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090121

On 9/7/26 5:58 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
