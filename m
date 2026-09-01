Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46B47CC97
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260491; cv=none; b=Qvx7M3XfuC/tKwiovMv2IptiJ4hpG/ttaKhgZaWSDVMF0jfn8KvLwstmqnwREz3UBXROS3pmBGtYwd68B0gLA2mVnRefFgLpJpr3Hff0CAsuqPhXCgy8BczPBg/SeSAEzOactoLQpKuaoogYULOiSONAlFG5nSUuUhleaM+7Lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260491; c=relaxed/simple;
	bh=rUg5RDcbQwv21+EeGr6tJRVYoyYOYvydRnuXEoCQPSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njNO8N6JonX+0Z/cTUc8a0RWaK3vHHWcyL0PsGPtq/vFbkRxAD4ClsbVnSefEEVHHM6DO0ZXLRDmM7o3aJpkH/9utrQI+cuRfVmiTctMR20IfiZ1tFZIsDK+9jRzap5kb4PLtbzrzp3lgFLzsK3eIzeycVo2rBMKRGKL1PYb6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CW83/wQb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmIiYnIr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CW83/wQb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmIiYnIr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJe1s1713145
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=; b=CW83/wQb1Y2K6z+G
	0dyFxJoDvzG7dR2702RceUiMPF8VFNuTNnJ6J2A28NyzdnTMriZNJnfYIwzvcraY
	VSfzLNiBLOn0MTSucE7A6S0FPP2m9hmQUXmAP7XD6hZMlL1kBS2g1pUS4xfL02NU
	sSowKQX9+f/ZWkf7JHo26vnDLo0sc03R42ERljW6qoVRho3NI37/DEbThiLYCwQZ
	25yzSE1uJylfQJj8TWRbLsWcnCYIKJwBW2CC9LYUOhvii0W4SNq6IRZBU1wCK0Rs
	zISEzek6R9Hmyf/0LK7ugjLWZxSiISeP73/ct1g/wTdzf4tdP4OXhcJIcmHWf4YF
	sKPXlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa5cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:01:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e18so95597395ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788260488; x=1788865288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=;
        b=RmIiYnIr8z+S8YBCgI1FJ7kpFszkiHr2gJbwdjGTflyU7QhWVIzo98/RMgRBf4ZH+j
         ZEWkwwsn2ofyso+1tAKIIx/Zs+bt/E/1NiVHfoj6wK+wBcNcy5l5vcAyPCHicfCKcOGy
         2WmEtIC6cnYTkoV8sfw3pLjc6AsFKlgovkZMhvXxnGoAEZMXm9YDp6pHjaxKTc7kvb3H
         v+CFXg75qiRxNOBPmlZzGbDyDQjkUPnHId5VXZgDRzwxwETa2VTWzB65JIlbii3coBY1
         LTnE9TxXZdD5NRe1MpV5D68wOVEBLQYhKhKXSSQPG/3tAcOgG9hQoLhGGl3t90GVNxRv
         RSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260488; x=1788865288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZF/DA0i/vJB8ETVhi537WGfCwLGoiddks1hUp3ZHR0s=;
        b=DTOCMDUG1w3CzuPCRVuQPDNYNT4i6NRyepdVXhO0pDM9oqitIYJ5UkGyIDryYid8Ua
         uVDkAsx3lcXDxe37mNaty7QcEpBtPZ+t0qmUD1KeTbYLi0Ey9xLU+l/xZz8fSRm9uxsD
         ON00vcbmhpDNmLJ1Xa/CpUOsdNaWoufIRs9BjE2+cEiJMiihhdG+AvmHIAH76YMCw0y0
         AwevhTbP6ealINUKhwGb6TwUtrwnrZEESKX/jVbmaCxzujwUkn3tu0FhSdN/RiKNGdri
         6g1nOKIJ+K2+LX2eRPbnyE4uuy+MsDKiUo6aHsNv1Oezt4xhHGfxZAIN3u8F8gveMQ+3
         pwjQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/XqxSz8ygeQxHo5sr7WCv3M6VPO3OMuhkIsjKfuDxGNHlus4Nrf4O771idHT3g8bUk6FOwKGxOdvYu/9l@vger.kernel.org
X-Gm-Message-State: AFuF++kUK0bN6D1wC0k4aw54egCUCvon1M5BWbVw9mrz4DSIimk48ysj
	FEj0mtmwXiHoqMfYwBilwX2meeInjrbB45Kf6la47TXS+VbpPWujrL/zuCpx4CU1LUwJevxGZXu
	1VjmU5HZn/ZpuVdoH6Kp7HRLJ1aaTr4+YsqsWiEec23za9BG9E9Pk6jdOEs/89MsXzOOh
X-Gm-Gg: AYBFou20LaJ4xmE89y6JdA1rOkLwn85RbIVTFIQia7jvU3OUWPZLnf5iA3x3sYyISFe
	egusjBy0uVYANNTwJjcZoZR1IWnXsl5zal2tT0PY2mazoaTEhyK1dcn+xJy5YC+0pFEosrHGCK/
	LKC312X1U8fziRV+K8202rNNVORgr+blu4lyusaO9+aKymszxfcSTZcDjODhrj5fBfxphn6a/VQ
	CQtTqHVsXn4mtbTqGtTarRs8LhV/K2EKWcQ4zOBQzWtE44He1YKS5eZp6wjT0OFFipD1H19/jv7
	n6ICd0qohNPa94NH7J78uMn9V+Zo5cndQBhoihZX7fPgVM8x1/yYgH22ZM8qyk5+Rs+UZi/AWZp
	0RcG4+jfokOMmLTnF1YVi4I0gX16skw==
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr110370435ad.17.1788260485729;
        Tue, 01 Sep 2026 04:01:25 -0700 (PDT)
X-Received: by 2002:a17:903:1a2d:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2d94a904ffcmr110365825ad.17.1788260484072;
        Tue, 01 Sep 2026 04:01:24 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm49707335ad.37.2026.09.01.04.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 04:01:23 -0700 (PDT)
Message-ID: <5c91768f-b8b0-48f8-aac3-b08b76605e1d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
References: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260826033803.475-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GmNr9-4dBvmH1uSRPhpBfVB5n-fGiflp
X-Proofpoint-ORIG-GUID: GmNr9-4dBvmH1uSRPhpBfVB5n-fGiflp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfXySThtgU5z9LL
 nERBdQMjqFk9t5Cq8ASFLyHD4e41GaBS/mcJjL7HgYGi0XkoxrIldL7ptj4OrQJuGbnRbTmg6Tw
 YExqryJync6mKRbmOn1lnEctIOnmD5Y=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96b089 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MOthyIZreOk6ictk8Y8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OCBTYWx0ZWRfXxdlH5JwV/P2R
 syrRFtWCjE3u7MCObVk3oGmVPJtNX/wS2rr3q3miQLKUkazjc2BrLRIhPfijWWMwRYAqkzq6yDi
 P25dO5r7eYgILFy/JKbVYZSlauYO0UHCHKP87t7xUKb4FcKnC8xfVLanQ+j2aEbEnyUJGHiXEiF
 ugMyhkTT2jGqqFM1FXjKXHSWCaPhngGJfH01JoXSded3W9sNHomAsgolq2UQ5TEMYWEsMUQvqLE
 bPkwXCk6Hi4QKajTvItFShf3CnqnCTiTrXyQ+tNYarhJ2I9Iyq+1ZSwL15jVSrDcX4w+GV0Jjr7
 +OXOwWk8cjkHLIZW7MZ8X00EumnGuGfTHqZM8lva0vVBY3J/n39Abm2UwLppaLN9OOFBiQlfb5Y
 IsMWo4mhYZuYlFfk2Lq8LEoD23W0X2/aKogLPMNTdum70qKRa1pj2g7zbvRW07q3cXA/+0yGU3q
 SbX9ULmUsdnsS71oP0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010098

On 26-08-2026 09:08, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> Fix this by allocating the entire Audio PD reserved-memory region during
> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
> userspace-controlled alloc/free and ensures that memory is reclaimed only
> when the DSP process is torn down.
> 
> The reserved-memory region is now mandatory for the Audio PD domain.
> Rather than failing rpmsg probe when it is missing, validate it in
> fastrpc_init_create_static_process() and reject only the static-process
> creation. This keeps the fastrpc device probing for all other domains
> even on a misconfigured device tree.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
