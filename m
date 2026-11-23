Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447670;
	b=wJQPpr74M2U8K9FEb+hT6f5mM/5IkSQ95eiS962vLhenu4m5oIsd94CpPCzhL4FFidlA
	 k9uRg1JsDwrdPNe+B5tczwiNr/BVMNnMGQ89H195bEJQ4D3B/4zntlOhXW4FYKFNnkY0C
	 W5t9o1Xe6YUt/rP4k/sahxUDi0RLDttWCkGadTw+iEy/KpIfkBsAb9eLkOcaRD11frSiz
	 9YNvilU2MqiTIAy8GYF1abSSNUJcsaMDq8AEDKrCcDEy7yyMSypgN5sgxqaFsop4ackj4
	 wI2Mfhh9cTObKhEbhxcvqcDGavHIYw56YOe/z64LvCmpULwGQdUgCz/WFRVKqbRYeqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
	b=B1cZHEJFNyY+zoS2iD1uDvbIbfIEbh/1cRMjAMHUvZkhyYDL+OLATJ/RyRhZgpPZH9iD
	 lHJZ7Rjbin/eyUVxuTvp5jeeqstmvsJdyMb84CE8o9Myk8+R1ChRuN2U9EtOnk17oHTvA
	 +8SJ6aSo1khVu/UoFU43aBEIwFggjTtEyDqQtWgf8iVfkRpK4CUp31wN6pOMeLtQN3spw
	 GoqFrjI+RS86lfshDeqL/pI/42KDwWGjr1kWP79jyPnwQyr60YQkcTQ1Mcldbjtsqpfs5
	 BFzYeNUoiOegtTcrrNJovz+SDbXXLZBCucGfH8wBt8hJrM2fLLFPZCKR+qBebgQhqMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TTcFXTzI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKGHrO3b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A5606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777A5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TTcFXTzI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKGHrO3b
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtCT3329279
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=; b=TTcFXTzIAnWUeCKx
	nACMD4ckphZxpj6v9TDEYgV+EOIF32+xjpCqu1nwpwFQfCr2lNBrOsk7rinxA52k
	zlpLL2CQ8GmnfOw1y9Szsa6cEg0fd5sl4mVMVByL8RHk04UutO/nSnYV+FRBOAAn
	VsO31AEo4c50WhM+Uw8LJR4MZdiZZjaORGPYHfGWVG2chqiWvF6U8bUYz1hT/t64
	GAShcZcd02ImNlRE+/ejIVFjYR8/Io6IhS+7KbsMPCsodrKOEXxEzC2srd36L9O0
	AThOx1ji3Um480miBZt83ZEcnCzwIEw0ODN1CGXxusEgkbiVlXEBuFLF6PtrWhLw
	1Bki6g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd22ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:27:49 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5edc82ecc78so102583e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447668; x=1796052468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
        b=HKGHrO3beBF/r0JbF0kNDBwCwajg/L8uZqSoeU69+ZW4oHPggO8555UJqGquLD77Zs
         ro2bWwmv1ZD7uOkU/SXwdA1ENuZUbOr2HKrQw0eXUvw4WhG2ZA9ToBE+l0LVHdLNZcYg
         e5TtCmbBKHPeozIMgcSr0ywXG6LwOzUylH8PmuKP8KR1MGCHcFg+IPOYoHf9afRGBMJa
         D2X4o3typUEKaPugEJPPhQJRYQ0GGoeOUyFEHIMJtMVGsO8QLQN56T2z7Nb46df0dei2
         lUpHRGTDcZ/8KgPGRveg4du7mr/2dRdTLraaLzH0D35H96Ju/D4WnIYG7kWJaPmZyBPd
         cEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447668; x=1796052468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
        b=hn5oN2eL53qNxiuxR7hChkoC4gzcxtpCnAnQIXr/QQAaDVm+PaHnjGPXE+SPP2zgDh
         TNwfayjB4Ym0HvlCBKPQynOqpuiV7NaHka1h+GaO8FGWDb398d+cVd02Mxg6DfkIOgfS
         cuSrZZv/w8Cqpug/A5ga91iqnI9ngpu7yVsEnSg7bCbqhNu+sEtsvt6iYVhCyA/tlv7B
         gf4n4WsRsu9OyIeyPnzgvnIPUasm38hC4VhDCIk6dD27CzRZ+2TO2gkdROZhgb1e1xWO
         Qkb1T6/84igrAE/9AazBd5mrEERwPhARLFc7Lg7f4Z0YaBesnJhZcGCcBOsMEl2GwmTR
         rGpg==
X-Forwarded-Encrypted: i=1; AL+hErEanG/45yGDdrXYU2R2yAMnifdMGZIrcLJ4va6d0oZl7m/HNT5Vb2eB04JWLiTjqYS6N1JBEiueNooi9VJg@vger.kernel.org
X-Gm-Message-State: APuU4Z/xup2ZvsxcsSQdqfbiM/XgVh8z2nuNauLW5Xsr7rpANgQDIfBf
	djsKLioJEKE9cogvXRR6xZmwqdieW3J7V+0oL7wQNBo9Yi+Qflpxi52GzVbdkgxl5kOXDZqDU/v
	OX13TgjUV+BABjdV2r8IgWdcvt8la/+OTJ8wh2Pqm6uPxEM6cvD2l84EH5/Vc/G/BYVEa
X-Gm-Gg: AZFdTZe04l6iu0tOIULweBOxXuFcwSpPn5LTuPdjbHYzjYnbKCb+ZAWdxhhuwtKqOBW
	qziHw9aVmkkszuWFMd02HHdvmux/HMYaOirRkhnVAh9KzhBC7g1MfaeiAVrhXadwH4Ymar/C+K5
	c6IJj/504RLao29XA9LzN65CWE0nObzLUIuwmcIad2SuqQvX2w2ttSid+iCPZwSjDyD57593w96
	e3FJGSswREcH/7B9kbOikD23iRcP7i/g8msMOZ1kkY/weyuZ7AViAm8M8UF3DBHdJUue/2t9ou3
	dXknjGn9WZLSbYXCziBVhsCxURyQ0/MaF4o669uWjtkP1xAYONXUXUn8gIiaZd6+OZAoFf8nLKd
	GIivGHjBHHZ6LxCToSGGXv3gEZu+8pwItjfAICTxq5K27NrYTMzrmZK5hpFdj1pRDYEh3x3k=
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr6702175e0c.0.1795447667731;
        Mon, 23 Nov 2026 07:27:47 -0800 (PST)
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr6702120e0c.0.1795447667181;
        Mon, 23 Nov 2026 07:27:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm410577566b.65.2026.11.23.07.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:27:46 -0800 (PST)
Message-ID: <c8eaa9bb-951e-4076-be58-7090150b5c90@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:27:44 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Fix the IMU mount
 matrix
To: emcp@enser.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261122-b4-hammerhead-imu-mount-matrix-v1-1-fa38561de9ca@enser.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-hammerhead-imu-mount-matrix-v1-1-fa38561de9ca@enser.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JFXZP4WKgdXIWfFF0l3wOiveoRtOxj8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX4mBmtaWtZ29a
 kZrPVeYcHR/xX1tYZlahS9uWlG6X6t5ghuNTfFPHqTv2BmGqkwhigcn/fRTYLbfkCkxmFqt8wmA
 NWPsH3FtyV9C2BvOQPkOD0dFv1YGXm/yc/qZfXZOKXR1UVr6mcllJ4A4qrK0zQDyMLOSAOfpQzT
 87lKB1SX6EibDBVgxK1xZAbvHzHuxN4O6Z4uCyBy1UJSqVxs1egcEq5Nfe/N3++wy/ZesxWjF4u
 4f4kS4zQtlj+/Q5/j6+NZc79QRBRassgybo32bO3kO5KhuPkYVl2fnZ+WlWEk817zEBz8QTq0qT
 a8S7/g1gC5uQDmH2OgnW+EAkfobgsm4p6byGSLkRP6YTGWSwgakeJFJgmx7dE0gUfo+Mj/UZilC
 sCRT1D5yKfY0VttI5jo7hULCtHQX9YbLtTtPVxEw8q4ubsQll2/wWPWyTwyg5IKPTk8QLzqvSJv
 Ezd2HCMVLEpRS3satBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXwPTD1WIQOBB0
 hZdIoG8lIia1jBTlDvzgiI8J77Fc3h9aY2EdC0POjDT70BbiJTLpHFrPvWm6dQWqBnvaoy/4XGm
 TvnM8c0Uvu/UWjZUCpKN9OOTiwJMdi8=
X-Proofpoint-GUID: JFXZP4WKgdXIWfFF0l3wOiveoRtOxj8i
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b045b75 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=l1nHKxr-XrZQ-B15pWYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230061

On 11/22/26 6:12 AM, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>

As mentioned on another patch, I need you to use a well-known identity
(i.e. generally your real name). I look forward to reviewing v2 of your
patches!

Konrad
