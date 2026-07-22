Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEE2E285C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697923; cv=none; b=V4qG/G/7bI7fOzwFDk2R3yNblYwwnfVZS41NNSrr08BdnOZ/9EvoFwf8UNd44dWcEryst7vFKpsDp+CgoMIuv8NhUlstRTDSYBeXvziWrZjZmIyvcDdxO7zP3ctBKMRZp7X5Kr9Ml/nEqfEnV1vxlgJkqnAuDsIrQcRJXbiwo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697923; c=relaxed/simple;
	bh=5ayDULpMk8hHG7OhaFCanS8CQrSX6NM2+R8ihs6w1e0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tngy2B+5u/pxaBlDEz0NHlxV3dcgMxuxmQidDmJhIoSutfqeO7Rb4GnopsgEihhjLYjsg6YzxVPYNLWhzMFxEl6nb/MYCCQvhxUlx0iL8VmJ+lZ3tFyQZmqwPRijKWE+Sp1qwQjRdsNbpQHOOcj686CiphAEQaxfGHTDrEER6b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGTSlxlx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBOuwfFf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGTSlxlx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBOuwfFf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M5482r4027826
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0CPv89+vhijrrUJHLgTqDg2ulQOVqGpYMe53CZkhxZ8=; b=IGTSlxlxJG5YYkS/
	cceHnDqFUJmzi3Rgbf8UMEgfPJ+d0P54tjrN+2+U36pTQai7RgSckc7i3y2uhwUH
	RTJ77J4QyjBKAhOe+geo3EPoNgYTwCXvRma/vCUWiUitrYaA35HuRWRezXng2vF0
	LTmbJ+kU2QY4OeB4w+TzMvSddiIrS4cbxL8CQSb8UGWISukZchcxMyW29CrWQXyo
	PWh2iSnEpind9LIW1wCLEddATtK86HxAE6jyJmdVxbycA2FdPoVs0UJPBPThrXxi
	z+Th83MVArIgCvWTJhh+xe/Id59j1zoWI80jMAZTJR5llailY1LICx94ntyb3Obr
	90MHqQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbmft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485d853b08so15827913b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697920; x=1785302720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CPv89+vhijrrUJHLgTqDg2ulQOVqGpYMe53CZkhxZ8=;
        b=MBOuwfFfgg8ULNLJEFCvM2savY9LYJv4dgF/LVu8OVrrEgVay/8Qt+MSXHCma1tNDY
         HdPFy/DPTQc2KspdjHV6eL5AQ4z3Z3OQBiiOKXL/HGzvAgRa02WSMadbSo6JrRsH2MlI
         2D+FcW5Un9zET6oq5lnTtbLE6jliKIAMVnQkcXGqbDDT8araTgYnM+0pHlCwhwuUDLG3
         siNizQxtnTXM+ewUwd7S8z1NwUnSyvDWVyOOKL+U2jouFEI4WabFGveQyvtFoNtra5aC
         TiMtyYBYMj37TIlRiE6Ryp9qvAaGjpXwDY9i3ac2pHde/hwaB7zHhbLv4ngEu8mDRfFt
         pStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697920; x=1785302720;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0CPv89+vhijrrUJHLgTqDg2ulQOVqGpYMe53CZkhxZ8=;
        b=RKRD0UrC3t4TBudNHR61JpqNQXykzrIPQcK/Nlxdzx0GuC5y2pYSb7tiuQgpYXeyE4
         Gkk1YUH4iNvBNOPYI/KpLnau390GNtcfx+O2pADev9KWeYd+6S+9+63GR/JrPTsz/jYf
         PEOY5ts0CBg3DGoxImvtoqRJk7BVSHiBfGAbh0hOYp6QC4PGpc2eXleO+lGB1pzffuuo
         otctS3KmhmQ0zB5AkJpGeUdjZ3D+C7nhDrnVMS71iKxYAUVTLqWXy15j5N6s309GXTXh
         J6BN3llv4ylhZzSKp2M8Z/41xxdgcQNmvhcsbdh0XU58SIoko6Fnz3kZS0Z6bLJd1HzH
         GKnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9BqyuNnhkh/3MD56TavDU//p0TXueZaz8M2wK6OLEoXz/SVG4mYZtd0v9guK3+zO1HmVtfqTyPoOajBtM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb+YRd8U61FPIPmU9T65Bpcbhm79WJYox44LO4wqrFD9SQ9KSk
	my0mwog4RJ5q5cAIh20+5PwaamiKPSG+X2mYjBs5BPSDKa0I+FyffxY+MZ0L3t15Nw2po8RUUwB
	1PLBGHZUmZfBgJ8MkOWM6R0UN0Uarbt7m2K8cUyOlBNQqRXwz2v7zcMM7qGXztL3o4Gts
X-Gm-Gg: AR+sD12RqU3JDSbHSFvD7FWXCGPyTEQleXwgZXDQgINu0U8A84FA+Op2RXIbapj6/oj
	XJedSSmr7SCySj9dudFM0tmJ22Y+/1xZ39WfnU1MSjPPDSilWbkbecVUjIXgdpv/eKGypVtKEvh
	LjSA7kxQ56srju3k5hrgIaqQhPwjFFQYHTdl8TFA7Hw22nRsF7YeThe78S7qHCAAdOl0x3zgTRu
	tQ88lpL/jK2NHW1lChXThKp6DyNov1Dlmo+lymbdFE70+g6CV/XosxegqskMDdQQEoEwZ3dYWEb
	1bzo07Um05HTFUlToMp7jvnvK1yXfpwtL0Hkm2FsY6y66kZ6YAdpOziIU75XkBZUn1IPsuWx1lL
	FLqPiGTWevqMK97x1vtMLG2NhynsNmkBtdmg=
X-Received: by 2002:a05:6a00:438d:b0:848:68d7:c673 with SMTP id d2e1a72fcca58-84c2948848fmr21272967b3a.47.1784697919621;
        Tue, 21 Jul 2026 22:25:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:438d:b0:848:68d7:c673 with SMTP id d2e1a72fcca58-84c2948848fmr21272952b3a.47.1784697919169;
        Tue, 21 Jul 2026 22:25:19 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e172376ebsm736724b3a.12.2026.07.21.22.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:25:18 -0700 (PDT)
Message-ID: <e1e38c71-5f79-406e-821c-ce37904102ba@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] i2c: Add dynamic transfer timeout based on message
 length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FbSkTJnEYAxLHGAO7CR1XcaE16x3ejz0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfXz3FOeGWojpzT
 040sE3mhcM/tA/oSlzisRlIEi1z4mzpZhGTAKRbCvkZa63g2oie9NwSASM+dvYQN22hvmnRabL6
 9Z/fckr/sWmrIA6sc3Mth8TUCxscNc8gErOiLYZOYs9TO6MglZlZAiiZQYKzFSmtb11LFHQilvT
 DQz+EUad1bv9fRAZm0jIl14mXk2Jad3eSoowcV446CdUq3NEB9P8OXGIDOriMGJ41l2vxfoYzCF
 0KnWVFZbmmDlFzDkmk+HkIpJbceCAC8p1XB/B2nv25c2ziblBPnYTcpaRnFUQf8hIdbbCPodVWr
 VEuM3MbuamLXux81kAeArHYIuzoKLEgNFUNohHh3yoyF1Tj3tb/RHRxQ4Au9vHy2L/1zlzGIwER
 bclxpjgtcLs3zRwASCBjmJ9l8/w8YOAFdpjKZZJp+LmP5wEZf+hssT7uqdCa0R3tCbZTyOpqysv
 EbKgZNO1S1dlFjJGCkw==
X-Proofpoint-GUID: FbSkTJnEYAxLHGAO7CR1XcaE16x3ejz0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfX7dHV4A1jE7Xe
 G/hqYVhkZGdHLZFBWrW+l/ngru2TX7x0cQ4ikIwhJ7IVMdMHDIX16EtvZYtG3dIyrKyUcz1gLS0
 c7KTjeeuRx3UcKZYIbZqiyCRzfuF8IE=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a605440 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_aoH3E5U2PYf42VYXqgA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220047



On 7/20/2026 5:11 PM, Aniket Randive wrote:
> The I2C core and most controller drivers use a static 1-second timeout
> for all transfers regardless of message length or bus frequency.  This
> causes unnecessarily long delays on error paths for short transfers, and
> may be tight for very long transfers at low bus frequencies.
> 
OR can be more than 1 sec for big transfer at low frequency. Hence 
better to make it generic saying depends on data length and frequency 
which you have mentioned. So limit it that.
> This series introduces a generic helper in i2c-core that computes a
generic helper function
> transfer-specific timeout and stores it in the standard adap->timeout
> field, making the dynamic value visible to the core retry loop in
> __i2c_transfer() as well as to the driver's own wait sites.
> 
> The helper accepts a safety coefficient and a minimum floor as parameters
what's the policy to accept ? i think should explain here.
read from dtsi or hard coded ?
> so each driver retains control over its own timing policy without those
> values becoming public API.
> 
> The second patch converts the Qualcomm GENI I2C controller to use this
> helper.  The 10x safety margin over the theoretical wire time and the
> 300ms minimum floor (to budget for clock stretching) remain private to
> the qcom-geni driver.
geni i2c driver
> 
> Changes in v6:
> - Split into two patches: core helper + driver consumer
> - Moved timeout calculation to i2c-core as i2c_update_timeout(), which
>    writes directly into adap->timeout so all consumers of that field
>    (including the __i2c_transfer() retry loop) benefit automatically
please Add suggested-by: dmitry guzman < >
Also add reviewer into to/cc list specifically.
> - Driver supplies safety coefficient and minimum floor as parameters,
>    keeping I2C_TIMEOUT_SAFETY_COEFFICIENT and I2C_TIMEOUT_MIN_USEC
>    internal to i2c-qcom-geni.c
> - Compute timeout once per batch in geni_i2c_xfer() using max message
>    length, all internal wait sites read adap->timeout directly
> 
> Link: https://lore.kernel.org/r/20260715101805.3615166-1-aniket.randive@oss.qualcomm.com
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---

[...]
> 

