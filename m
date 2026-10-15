Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41438B7B4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075750; cv=none; b=ihnAbKXH+0l8P1pPBirMSqcSf/XJLeXMwxDAp+rOPwRU6+mnEUH/E4Kv8z5ytwujwSeVddoPui/lkOs8ji8GiGWoMAlnQVTvgV0lcybNK1z0saZyaj0Ssu6UPouAlYH7yA7eB7XmjpflBepkuf7On8BwCHmdraMlVa0EcrWQgnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075750; c=relaxed/simple;
	bh=jHY2q4KRw1a+3cM8OlSYrnjimO30abUuFA2g+e/yfvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilpG2BlM76b6Ru3/vte+GhteJ3DjrWINtJnEUf6rFZHAm82TxR2ttiu47gA3vBCUuS+yRZl2S2XHbrP+RWv33W50UCSpgnpY15d8VGSGfE/w83J0y/ywkmoqRCKTPLmE475hLptASHSukElpXtcFI47yRmeUET3zijYwOR6DriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oMRaOIGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvMxDlBE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oMRaOIGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvMxDlBE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVDX2416905
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=; b=oMRaOIGh/vAinRbc
	IIWDc0kEgaACGgan4xoD6xDYDPm+RzNyOkkz7TM51hbBKbOjQb1ILunCf5VbMU27
	sN3FAVVmoaU2fOFriiMN9P8xIiwH1+4Y9aS5wKiivJnqDP4DCqna4Y5DFSeFwBrE
	DDap1AqxDjV7beRhj3x3TKUxJ69iCO5SlSeOdmwmwMuVvw0cv3bQpv8TsFzegaob
	0EeooP4PM2j4QnWeyPeHEgONSvsfeoTRusutVcLXzc+1W/e92f2IXJOdiPMA4RfB
	ieflyfGRnweFPpXbDoSXHKTShXQqHER1p6oR3LMDFxUOKwLoS5VGPpNLM0ld1lx/
	U2iKzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjnmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 14:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea8a9cfe6so95001985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075747; x=1792680547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=KvMxDlBEGmP1aSNDlEzKZRI5ryvnlwJVwCNSHFWcuaC7ibn3t0l3a281057+KsfV/j
         OjDlH0q5DRmsNci+r7tWEL4mJLMrUi0a+KQUCUDLJwSAXhB7d6NR7CKKaIlQoqiLGjvq
         yS2bzpD2QqFs6oa1R0sZbp/IA9kGLq4ux4YEStJ7xVGhlEvyaP0+Knw/BrgJltoqM6Ws
         xQnrn4Y11qO6UWqK/O3lLIs0EBrltdjifM2fEc14g7pc+TYSqBaynL7jtIkuyRPYsPx7
         ktvGlrg0h04knHT3g16Ea8cT3FqvU2FZjqevvCabQ27Wa3b7vm0ljkB6XCr7CkSZbo1H
         1ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075747; x=1792680547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ieEJs/BWB4adN/CPzHmGs4+przVlyrjuLYc8uLfGhQ=;
        b=BC2n1l+yCUCuKkjTMqWYqjzpF3J7U33fCS4rccBeaI5WVFbZT6QP40oTrO509KpFJB
         KBd7mwLYvOIC3tL16Fvr7GIunOWTb+kNoXEcREUjbbE8CksJbkBmTHRWBVNVp9szCrnI
         AGxotVPwnECWqBdMYuiyoFU1SRDEbbE+c/hQ5jrW3ui71qPEeztWVnHQ3OpRSc8kzeml
         Eg31f/bZMmj4w1Naj1/kSzb7IFIvFACe15pLSlAupz3Yu/tydBVuQKhO5lp8wdETfm1f
         PlVduM/n+AQWvjg/uV4CzO7eVMc7aIUeg9/Xya9tMVURqGP8PmBFv/JBpsZGRe/xTx19
         Bo7w==
X-Forwarded-Encrypted: i=1; AKwUvBx6hvPjniBQKyEbvNZPyV8WWmP5e/JUZr3N535hV7/HQO0icJw/X4sB4llvKlFWuyUYmaei8z/4R+Wp+Vo2@vger.kernel.org
X-Gm-Message-State: AFq9FYKyBqQ37CnUPCdhHgEog+XJGjkifdJzQdYQcMv4uqBmXAVxCpQM
	GkMEaSA0m36J24UYlIUVRxOnQ8ZuvN/8Ci1hlojDi/wtg03eJjdULKNH5gT8xdcjSj4fz0a0L3c
	IsDARcuFeRceNd5LgBYo4QxXbPvW27fGp1LsR1+smOsvwhcSmZJMp1nk+Tv01yj2/l5p/
X-Gm-Gg: AYBFou11pxx8jhcLXwMFDtrpaxrM5Jp6Q5ungtjhuhtbwtFY8Fe0qZNfJFsXGZxT0Bg
	Mlosy3FSFWFcS5NLhfX72w5iv6ZEzQV3as3VHt7+mcoq/CliGMCzBW9EryuxuOpqdmiqxp9WH/A
	F2YHTP3CxmdLB/KTshpsGq0RtaAYglXns4BQBg65QpmQfQhvTmZk38rybEgzttAU+qk278B/bg1
	FIPQyWm/uf6GH6KZ4Ah0hL2r4vpw3ySac8PfBYX88y3lM1/lH6MCyKjo7GGl7yu73o/V/9vFNB3
	xQIZmTgSf3u+H8Z+oNDjvK+e0g9t9EkB2VF3ibMeQzBfQ43ai17U+99LvP69Z+r0a88R3mVbZoe
	u/urMnJeJQWLML82BLa424g==
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842943485a.1.1792075747433;
        Thu, 15 Oct 2026 07:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:390c:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f0a34dd2bmr842938185a.1.1792075746898;
        Thu, 15 Oct 2026 07:49:06 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aafdefdc4asm7442501fa.30.2026.10.15.07.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:49:04 -0700 (PDT)
Message-ID: <300889d8-cb0f-4939-9b67-c60d0b1499d3@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179207449898.13793.6897763208667873901.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfXwaLjCkmgMmwg
 R9uhrfjBNzNfYZNmkP1rReFu0pkQPbUOEOqw0g/WsVUtd2vULwlh3u5SQMaVv5tOOYsGpFyBq4d
 lvR/QNS0N9n+oIasyB9+677yqryHYJb0Og1Jk6dMNmY1SVRtw3pBCiqvnWVHFtfH7xcoNAsvWhR
 TjBVCbqcrn5GQLX/FXaWFPRuZ9cHLkW2ZW0oHfRw5joXlx8W1OFaBWk1CTTBh3PNHcW49cjHcr/
 /Qz2/X1A3ttIcF72KrjnYQn+8koSHX37BvEDbjPVILggPZnA9ZtAmgwZhSZdwl+wFWRe6khMcHs
 YpqqfGKFdok//ZdZ2yGfpiDxK+m38fiYNe/4SIW1CyJAMXJ1TsJnCBuxQe7e6Uc7H9Lq84aQyns
 p52sE1qAuobGDtgGG9VUpHchtwoVQXz6nSOiIcE1HHWP2AQmq5dbZ6ykfhXGPpnOX6va55g7Avt
 R1skHLKrJCZukwgxlag==
X-Proofpoint-GUID: NcbPKz-rOlm4RbfOY6XUQO4xFBTDZksZ
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e7e4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=-rt_0zctJVaUuj_7EdMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX7CdKNknwAJPP
 L487vD5QnZFEYwLCSk0kvcwACPKFMh7kl8U4R9yU/pKgOIzQ8ZB4DdSQPpFsgHBKhATLzKcKKEV
 j9nzrX503qm2H0G8GMw4d+0Zmp6SUnY=
X-Proofpoint-ORIG-GUID: NcbPKz-rOlm4RbfOY6XUQO4xFBTDZksZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

On 10/15/26 4:28 PM, Ilpo Järvinen wrote:
> On Tue, 06 Oct 2026 02:50:26 -0700, Gopikrishna Garmidi wrote:
> 
>> This series adds initial support for the Microsoft Surface Laptop 13.8"
>> 8th Edition. It's built on Mahua, the 12-core variant of Glymur with
>> cluster2 fused off.
>>
>> As on the Surface Laptop 7, the keyboard, fan and platform profile are
>> handled by the Surface Aggregator Module over UART. The rest of the
>> board is close to the Qualcomm reference design.
>>
>> [...]
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
> 
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
> 
> The list of commits applied:
> [1/5] dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
>       (no commit info)
> [2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
>       (no commit info)
> [3/5] platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
>       commit: e93536b1fcf775356b06ddc845461e64d4c87313
> [4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
>       (no commit info)
> [5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
>       (no commit info)

I'm hoping that's the tool acting up?

Konrad
