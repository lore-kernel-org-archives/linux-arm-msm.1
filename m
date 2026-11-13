Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545579;
	b=yBjGMtZqZtTUfjOlPqcK0gZ9yqbP9kn5QY3ZZ8rb3UVwCiwvgR1qC18+Vb8tj3+Ja+lp
	 t2QuAtg3RJM/djs/f6fRsb+hsIkQ/3EPEFonjrwP++G5QHlHlMww1DTikENf4weiSLr/4
	 kqOlY+yyIPaJTqlnunm6RQldx/Pp5JtA5MTa2Tkkmq9Rv0PwnpLyIRqM6BeP03ZdbzPaj
	 pRqpk0bNUnnMeKeJ28+chpsf/pm1G4Z2O0kJ0Lv7H6KEUfr+yaRFyrU4LtDYLtyL4b1RC
	 AH3+Sfw4IWA/IAAWUNql7hfyvS8tcWQkR/uuYVxoUs1MX+QaqIqflPFcFQDsw4/emVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
	b=h/3ObUrzAatwrxaiUZIz4hbvwDCo1M2N3Cf/5jQLkWovC97Hkf2DmRR204J0Bv1jVf/h
	 AQzzyAbeO5NEa9/qgwaiRFiUnVtPztZrArmgk/PO26oVRAB4djd6wYoUMn/6ZU9vnpNTa
	 a0hyYkYUaqjYElzczAlxoSBt+515BGQGdBhhh5VUV0bgsq9FlklF9LDgjTXhUv2rDLH2F
	 RnWwdm7Hrix9tYzIcvINEA+dIjZFnc/ziH2i2iJkS/FJ05P2PWDtCfdQit/N/9AZ1Ti0w
	 rOVqqkwqK3jDGi42V6eP2tUephrGgUGoqX2HH7snvndrvNQYjrCSPsrjfwfqh5xiiPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6dQD+NG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVivp0c+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EBE606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EBE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W6dQD+NG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVivp0c+
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K0TR3273477
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=; b=W6dQD+NGeIfbalbg
	fBXP1uYaB4rbxVX4V2s/40APqNdHqEZ55y2yBpgduq8h12Ecie9AUadWDYVgM4Ud
	h8nZNeDdPZI6R6uTnuUL7wzY5biXCfn/qtXLaKx0U9MuaotZUi0rmtYpyti9Ag8Z
	M3NwLxYgVNZarjrp8Xt4ML9bbSLBc6HllPp65eLVxZTKWGxdzS1XHOUgWAkRrZ+b
	tE0tCDU/bVCrsnpjai62L9R+ytvnZ1vfwn9Htl0uUctgxNYZzYfzwmzx3/8sbU3S
	pD5PmLq1qmU+2/h3TAXdBdvWNwyjNVaO3ta4LUErbYkRVnTCYe6BYrdQi3P7Alcx
	jVMMbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgrcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 04:52:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so442545a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 20:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794545578; x=1795150378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
        b=BVivp0c+KqRu0CY1O1zLMqHhRs44NWrPUOCkD0aMkwOAplU0kkDGEZPZ+hoyn8LTJH
         8nEmQKepVCVU2ci8HccgC6D4P9Ye3SDHqTYBLrmDmpGtEoNTnb0FdpQZtEc75AVJwQ/t
         wqgJYMXHMyLoytDmTIMvoUUEXzErR5A/XSzBT3lJp+0LAMl9xxACWig3Edzc+nRFsiIW
         Djn+D5QLPqEgqQwU05dpldLg6RqOxzgSW/9uuhEwkyAJ7LanbB/quE7KkH61M73TBu7Q
         5cUx2YLMpVc5EYrVP+esE6gQIxm6Y220V9b8aFkS4sp0yQ0kkBpBJmCj1C8gSWQcqGaE
         kaIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794545578; x=1795150378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQOyNq4wTmVvG1qOL+i4cjxIp55ug7AVmwSdeBhMIlU=;
        b=vyYohbiIdkOag+p/eucFtGeF4qcy7MpAz7QAfXIDkHWCl21gqxVba6ubAHzk5YBKeA
         w4Od0lOqhhk7/EP7zUdZBC2Sp5Moj2a4zYuso/4aCYZLhcwo/sRkJdvByqfjCvxUK06V
         MD/hzN+N7Rhp18DnyyPl5rkPsrQIALx97uuIY1flM9FnsTMV6SodfngLT/du92UbIvXA
         GXHypR6L+0u0EeBocbdoGk7MfPtpwqvPKJ0pFvPjesOjFCbBkd/2J7ZxOMNCWoDY7Uy/
         q9tB0WcSrNUqKnPRnfbWAnotNXKjy2MoP8ixnT6rYLLYMP6Lq+EHpI4KK9FtIld48v4/
         kezA==
X-Forwarded-Encrypted: i=1; AL+hErH7Cyg2dH8yNDzmWT7SOq/S8vDn0g5OMFirskWPFp9I68KreyAsP2HxXVRSIoa551tN3EHT7aAG/n1m2QLN@vger.kernel.org
X-Gm-Message-State: APuU4Z8a4NL/Wktmdl++VpH9UDXl51DXK9UYdWaXHwkRy48p3qQVu8QB
	UnfT4ScKeH5t2QqBf+1p8njDnjphhYtj0NxZjSHUvLwcpj3fbaUZoJs2FOYOxWXkfa78J3pMhd4
	XO1qAa/zjuSRI/J6bHrYYxDICXUm0z3jtpLFmhmGJ0vG3WnB+iyIAlfWGNnoboG8a9HTD
X-Gm-Gg: AYBFou3uDYNdf0Mj/+NeSuCENJqgUpwF2mY5bSt4oT5tlhOkOpT5Sr9rI3uA6yP+h8p
	GB/43pypsV20mS3lXMoT/1IWbyep6ILi+S0I8X/GIms3HmscmRjvlWWb4Nc0JipkUnuA5ZYF129
	WFCJ5IdPk7x0r6cyfC1bjPcuMxfYWR1BlqSoVIYHbQkrQ3Q4aYWvhQ42farlIybeAJswVPJONkn
	fyEjddgLZmOig8ikjoonFIQRcU3iBvZ+pSbKRZIa4IzzmITYoXhWzNAJzDPd0gEaRwZ/V6IBRou
	cf1FV49H4SY+h9Bo4H1X6VRTegbu+qhWFLFpk2x5TQQsKvU4PgsciPQ/h5y7COKcEYCkKYBDO8W
	QE/8T/611AlrHkFLHuFFa15v+PPaYBNW+RjnAf4sDkEB3hZ2QTG1ovAaQzBYqQw==
X-Received: by 2002:a17:90b:4e8f:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b1b0b53e79mr1213806a91.49.1794545577782;
        Thu, 12 Nov 2026 20:52:57 -0800 (PST)
X-Received: by 2002:a17:90b:4e8f:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b1b0b53e79mr1213777a91.49.1794545577299;
        Thu, 12 Nov 2026 20:52:57 -0800 (PST)
Received: from [10.204.79.100] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec43699sm2343811a91.10.2026.11.12.20.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 20:52:56 -0800 (PST)
Message-ID: <84eed340-905b-43fa-9c63-135401920e5f@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:22:49 +0530
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
Subject: Re: [PATCH v2 2/3] drm/msm/dp: Remove redundant force_link_train flag
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-3-naidu.nama@oss.qualcomm.com>
 <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
Content-Language: en-US
From: Naidu Nama <naidu.nama@oss.qualcomm.com>
In-Reply-To: <gfzdwaeouexratptiktpzodi44x6ztsfttqajzr5wxtrluyqjx@axwlv5jlakcc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LzShnxR8lFzR-yrhzQrSts8UBNPRYC_0
X-Proofpoint-ORIG-GUID: LzShnxR8lFzR-yrhzQrSts8UBNPRYC_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXwYWp0OdznP1C
 Ig4mQpezZgoWctzVRXd+i+273Ns4cCuvcGOqF0PV/NsKBurrY0WIWndDfo6tesmloNuEMi1uY8d
 fQT4KZGwpL6UhqD30FXy2X6hnIkeAGtHAESMxheUgUZuhTL2e5NRhO3xzJkrKDUgqMpApzizAM/
 NCCXtr31AqBwOz4TYqM5L2v9ZfM9YweX7738S2BfFeGefd1YCwxh8VYIUwNdNocqRzrDp830EeF
 aSs0/351S5j1J36iBhQlyNPDw+GIV/DA95hFeVFpDqFl57+YELbl+g8gqQ5WGnePOunpURkKztZ
 T2fPaY+TN/HiD5XDs5THNuaTrMoxnNYqE1jEQz3QUSF5heTbcH8CQcs9Co7DOFwrGucxsdLBRl7
 b7GuEbI/UIrLZkq98+hnfH0nS6eoXK0QbM3iT9G7Cv7J6ovmgxo6rmAKCwTS60Q4d346UoCSWbS
 qneqJYM4qORQv+T/8wg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af697aa cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QtFsyhEtc1s9TALtjxMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX8rvtSxRsHmM/
 Fve+SBFIXadR597y/QFBq3NeDQ/lkihHTFuHs+73myaTzf7YWXOyqkRwvuC/Aun29o4pgPECFlz
 /Ry6byoonKURg63VgdRM6rfLrRiLdqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019


On 11-11-2026 19:36, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 04:13:54PM +0530, naidu nama wrote:
>> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>>
>> force_link_train is always false when passed to
>> msm_dp_ctrl_prepare_stream_on(): the initial link is trained by
>> msm_dp_ctrl_on_link(), and the flag is cleared before stream preparation.
>> For active streams, it is never set.
>>
>> Remove the dead flag and parameter. Stream preparation still retrains
>> when channel equalization is incomplete.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 5 ++---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    | 3 +--
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +---
>>   3 files changed, 4 insertions(+), 8 deletions(-)
> The same SoB comment.


Sure, I will update in v3.
>
