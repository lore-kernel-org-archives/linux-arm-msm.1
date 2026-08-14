Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D2636195D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734984; cv=none; b=VmxVT4ba1DBzr9lUgunHUUksCihgFdby4wuzpv+SklqDOLOiP0FauCf/jc66b2hvgUQUAfht8ZNGVvVTdifQrrR9KWENXi3399jZMw8M1IvoZkw8fQ//pt9iPR4pmUOlVl+z4LettNBJjYEflGwtYwTg1jNdMB0YJhlEO/6517g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734984; c=relaxed/simple;
	bh=y/AJRLI79pblbLOofvlsaBO98yMXk4d7aQZ5IGWowyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhwAoAPgUrwhzVIBE2tZ2qJAWis9miEGbSEtp1u4AYghv7VvKEbtc3u04/5d8AFpFchh9QSxXMAD+ceZmOFEz9XIn8KP0IYPhcNTiWcHNj4e0ahpEcOTG0CZ+kWxy8oqQFRwjcCRs9cRkv9P+QiNmyeK7IBW6X6YNB6qDzf+TAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS/7k04i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpE/zmPe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS/7k04i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpE/zmPe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EGi7KW2608546
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3K1UtnTIooNfwxe0CoLAE5m27qkcblQuiHmrpFYzqs=; b=bS/7k04i/xMvmFJy
	DuabdEtrnD9QD7GtmGclFbYDsgf8HJmzD4s4TVcYv7s0DLSlJizYHpCD39zXLc9p
	2Mxa6gVeEu0kdx1jTnQoX3Av8Z1ZX1RAlMNf3RX3clinqjPsrwo+jgvfdhZoRCDx
	j//s4ShUc5X80BvEVa7NGuNo6hs35pypO/ffUeHWf7zmWnW2pXuKnF01bPUh0Es1
	vkolZG5wHFo5icFCcdSu0E20LZZ9RtiZf9F2RQfgyiR0gmotP0rdVCArnHgAzbbj
	TygAQFFKWv8PpUftWbmgs5SoC5pgZ3e2Z8FtI/ZbUApA+fq7OX3mnyCbBKAZFrS3
	hZ2nVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g26j6gna3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 19:16:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so1453126a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 12:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786734981; x=1787339781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3K1UtnTIooNfwxe0CoLAE5m27qkcblQuiHmrpFYzqs=;
        b=HpE/zmPeq7ZlCpUHrMHk+J+aJEOYxQPgV8BPtIY43GuuTk6GnsuS6NFNE6f9LnxRly
         f+17MawpaDKR+kYL7frtEaxs/ZGLkPpFA5X+ySw4i2u/m6npSQ8+tY0vvs+cAPXUDkk/
         BjXiZiV6doSShTzs6E9ujJuhojV2IvyoDJvHjM6NRCfJ8xzt5V2cUqVOcCROpPcZqWa+
         9y+BSwzYn7dD+79h+HbsuOI587k8jrBlKgXnjqh5fckRO+UOUb/4xfl8C9ohSfN8E782
         YyM9c7V1ufWm58yAC1f9ZcLlqspsNbZ7PBLkxD043GpIgnJcsjcM3BOZqR6O0rXjzwux
         dx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734981; x=1787339781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3K1UtnTIooNfwxe0CoLAE5m27qkcblQuiHmrpFYzqs=;
        b=g4GDKn1gkaseh0DmaIP0SuGsomoInWiSkgVmJOvhld6/UizTMgUBKq+G/ZyppG2vOo
         nRJJRGOwC7MYCqHEcObr7vp4Zyn6nfewIpIS3i6r3GCVQlDpVzoakF1Rfo+dNA9T6VWy
         RulOXvcd3uHxhHuxr4YYEKArlcMGOp6MiitV3waYlL9bq6/xNnFmnU7rethnBG8kLv/u
         MiqvoAsACOMrVQ0Jhu2pZtYW3DkyBbcfUEQLOTPsGGyl3A7o2xg5rVnnXGPDbvHnDGKN
         Ze2vaiFsXEXzhItZyqYJOK3aKQsgFFMyMwNm1AalevzFwpW579SWRl9ZGDsmkU7j/FBR
         01Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqtT002BM5gL+VVSI0wPmjdicX1nJWOVdaf6IAebEUNtpWH5E1+yIGhOV2ohLIOBjoWKT19GkKyAKHD6Iue@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUt/VaokLu8t48Kj8AYCERGKKy+SX9DpwWMrj6kZlaelW/Ge0
	9B0OfTGw601elRmVtJ2/k678VzTXyMrvxBzJYo1Z2NPAgT/U+43ILG+yzqXqkQFk+QfMIVhiiv0
	IpT7x0nX3t58OT/eKkL6bau9D+qwBU+iZrJauy9ccOoChvtwClPbW69BlJYhHNAt3rmhU
X-Gm-Gg: AR+sD11G5Zf8NzL+/kD/e/ApVzMhZqcLS0gw3a66zS/qW8cEGlpFqbf+KXQceHHtGT+
	0peRj7cQWSsCIPLVV0JDWha5Gg58sJglHqcjdeQrWG/ewaDjgwACFAB/qcgN1jrc4gYBpqq/RSj
	M6VNrmRskUv4vtmww7zxzzdaT7gA/QTNbgvIwC9KIV7FD451Xyfpg4wOAkTOjIKfnjobCMOcOUZ
	z1QLiEgtAsSOs2RY54xI4QKwN1Dfjmj2JWRXtN4P2kRFCS9tVm6JJef2Joivpkf6TVvkezlRt+A
	xKyebLOb1lpK3IBeuHK4DxqeoC0yB63LBCio0A9IXbZ91VH7sFH0IRy2gnE90s1a54FlFF4lh/r
	8DJR0jPJ0vtBeGWmtMWjfHZQmrr8W0gi8+DvSYzE60Fmwc9RaRM1S+w==
X-Received: by 2002:a05:6a21:4ccc:b0:3c3:94a8:7c18 with SMTP id adf61e73a8af0-3cc71fce889mr10317258637.37.1786734981035;
        Fri, 14 Aug 2026 12:16:21 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccc:b0:3c3:94a8:7c18 with SMTP id adf61e73a8af0-3cc71fce889mr10317200637.37.1786734980542;
        Fri, 14 Aug 2026 12:16:20 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm7110853eec.2.2026.08.14.12.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 12:16:20 -0700 (PDT)
Message-ID: <e046aaee-2da0-462a-a72d-f2d65273d0ec@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:16:18 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] accel/qaic: Add missing <linux/device-id/mhi.h> to .c
 files
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MRxxb2Pr9eJy4xtYrtlbINQHZTy_AAs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE0OCBTYWx0ZWRfX1GeoI313/TiZ
 NYNxds2OVij0cvj6ct37NsSp5xH8QvUew8EKJqAPtHaD81lkIM3KwdkiBRgHnrKRERmLiw3Vl9n
 Dxn+yzrczIQMAceuoVfbcNjkqaw4p3fcZL8jnCnCNTgmN6w+uBrxYp4qKtFDU7UVR5gpDf/THR7
 qoNI/OlvGqP14jX8buPjrLSwzLg6+YkZufLf+14h3oPE2/GyGDAb2z0Z2z2gabPbSxjtuQ/t2hW
 4qYN3p19sIG7txTI1tzNLu049lluv2254s2V87jjYrixLhNd+2yiBTCxDopsfW4Kb0MaLxsjH9H
 d/i38EmJO7FPQ5BpW17jdNfnXSxL4rPD9emdr2EBYtV6SD8geoFtG2WWcyxGZzahVdWWFFoaz9e
 LKhsxXputYiPpbUMMORfJKY21uP572G3k9O3TjbYmrDLB1b0zKafBrcMDE3KQ2emtjYhBQwgFac
 2eruRMG+dsEXLfQafOQ==
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a7f6986 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8xJ19RJQd52KcKUxID0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: MRxxb2Pr9eJy4xtYrtlbINQHZTy_AAs8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE0OCBTYWx0ZWRfX0v69jz7T/lnl
 oMVzZbYufd1iEpfgYbsFqI3H7ulufMpqwximmZGU1zvLLq80O10PpHI7aVclnhoPLohaALuC5Rj
 GoUWpNyjyWv3iH0lQ6z6zdb+/5jyOuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140148

On 7/27/2026 11:33 AM, Youssef Samir wrote:
> Although the qaic driver is using MHI, it is missing the inclusion of
> <linux/mod_devicetable.h>, or the more recent <linux/device-id/mhi.h>,
> in some of its .c files.
> 
> This series adds the missing includes to the relevant .c files.
> 
> Youssef Samir (5):
>    accel/qaic: Add missing <linux/device-id/mhi.h> to sahara and timesync
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_drv.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_debugfs.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_ras.c
>    accel/qaic: Add <linux/device-id/mhi.h> to qaic_ssr.c
> 
>   drivers/accel/qaic/qaic_debugfs.c  | 1 +
>   drivers/accel/qaic/qaic_drv.c      | 1 +
>   drivers/accel/qaic/qaic_ras.c      | 1 +
>   drivers/accel/qaic/qaic_ssr.c      | 1 +
>   drivers/accel/qaic/qaic_timesync.c | 1 +
>   drivers/accel/qaic/sahara.c        | 1 +
>   6 files changed, 6 insertions(+)
> 

For the series:
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
