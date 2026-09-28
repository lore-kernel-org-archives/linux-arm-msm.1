Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE50376A0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585898; cv=none; b=nhqvfp/znLL2Gi7hHI697f3BPKko2+pHoaOWUsKCNDAhr/G1VG+T1i058mn4hMLtVYMBAT5kxqSrPemjWPHcFVhLVjF688EgKTBzUZ9/ja1RbhN07lwMtvTBTeWQsxl1KIdIuPLLMLIP7kCTSp7OFTMvPpnGhY9txsoK3Iu6FpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585898; c=relaxed/simple;
	bh=QnGVPdRF5BQ4R3RWf2F3HmnJIaAinMYoLk7wpgpUFrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RRJZVtnxSmq1PsjLMJvEjcXkJOCTvmToKF/nVwSOwYD7UWubMpugD6oIr3L+lyBzjCWLcj8Tp2orDVw+rjqY0qp+O6T43+QQbN7w8zVchVW7Urb/i/I3TeCbpeY4V2KVnQFI1EiG2MpWu/vULaMwl+zIamNab1LPQjuxOrlBSYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdZsHRNw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GdbYh/WI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdZsHRNw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GdbYh/WI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S80fX33697146
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=; b=ZdZsHRNw9uXfAL5w
	BozeSD6/zbQlWxZsLW0vku1sEm9hDelF0RNCJyN3KJ6ONYtgvwOOvfzl9wSplsZ8
	veLGugP65+M6rfmhti6yLfDuNItWwE/TQ/X3v8QL1wtt0J7JNTryAtK4CCJFngrJ
	8jEg1LRNAdwgPlJ2vREghhmhsZPvMcmbxdTnujMwp8E87R975UiUbGvUgjOvb/IX
	ah3zo1TqXcPwBgDCtZQ+Tfgz92+OLISWqLMifNby/LN70b2x31p1n2p4zuPhGSjI
	92jUKi+GZK3xxINo8FXsUU2gmSF0WmL/ODDb+7iUqd2yxsOkdhCu6gER8q7ihen+
	SuBw/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jw7xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 08:58:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so4941873a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 01:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585895; x=1791190695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=;
        b=GdbYh/WIRUgEhB3/R/RdfutMklB9Ao/tTyoXHp+ZO6PD88NJHkFGP+an3vyq/6lCr/
         DCnIJKDiGXbwESf7HvXfdujYVfK37IZC4Xwl9orS2/7ndccO7ODycfH4R6Q8Ct7uhjO+
         rQsdncehxZxV5l6z5QZwpC982x5BNSGpVd14oPU2O48cv16GA8tRWDsFc9Eu+wfHahR0
         ctRQXeWyHt0TALS+tkHMTRDA8LCJSrkotDtTwI9z0rziX1KrLy5xdKglB6BNCnujR/hp
         TyGpwVM8U88RbbRdyQY/OILI1OF+Mj94zIHgsHslQqLZiIsyv7yrAfD5KV8ojw1Y6juw
         QLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585895; x=1791190695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaXj4PjqLEDQu2RCV2Zkjhys5ijdfJNEie7gMliYE+Q=;
        b=BfVXswJ4cI7QKXCZG0JxMOjXEZHuBWtb/wbyS4RNXv9v6VBK/G6MhergbzPj+d2BKZ
         Qn77twa6Ok0aH2nBlevM5K8netbpmKCPDLEw3hBmAw+B+FJzQB5twRFjlfV0HXevtWjX
         AOCwKTVqrSm3A8LVnk7GaJOPiqm7zaW+5xNfTk5brzen6tfuWzlO5i4g6SipKSr6TeFf
         e022+bLgIzzsbfWh2Hm1FJA84bGj/YFJ/qpZ+2M6rO9ojRbbLtc6HEKrCJhscLe82XP2
         UeRr7OLL35SxySnrfkPkr/gnazjFS6dTL1fBHPq8xGga1/6xK+Rfn2m380w0CYpIHHz9
         z14g==
X-Forwarded-Encrypted: i=1; AKwUvBzqf+8w7pau1N7pyaPb2rr2TPTft6gYtoyPVS7TfxkVrENGbCDxBnem39ksMQH2cjTzji/SFA/lnkUfgMDS@vger.kernel.org
X-Gm-Message-State: AFq9FYIE8YhGFk219O4boCHgExIhSuqX3h5Dq+aL955cm6ZqxZLGMo32
	+M/XD8dh+lTuspcoO+yJYsJaicl9U9oiL6U6N/hSgj1iEgqKzhp++KX5mTOQRs+GHiO3DrKwWnA
	8o8XIK5klgYoGrodgIYpcOZW5ykf7qrTAjaNUB8GB0pnOQB3uMof2gjldiWp43Q6xvpw=
X-Gm-Gg: AYBFou36+x4KJC+tyXOCrjN2g8QsUYdm7FioCUQelnTuFedm4WXpYfPHY0MeTkexWdN
	1SZQm5PLHWqfhcufEhnrYDa1p+R2ohbIkjjSwY0TYbNzCKHXPM+eVWVOI/PbHU32QWya4oBu3e/
	FJAI5U1ipSSd5jXkYxdSbqUaeEWx5gwoQAB703qleFxulz15NKviwlbzq/HLSyx1SaX4+Mlvnoi
	t5DycUHF75fuLOtps0Xr8OLFvVWeH8wtQI/GnFfXV4IV4fXZRmAynbOn8ySIpr2KBAox+Vr+evi
	70kpaSlbzYs8R+aJ5cKmVYNVsJk5UDGMTdd/XqjdXDd9sXo1m7B91smIHMx5llx8A/6U//TqGpu
	uIHXVaABzcKH6LWyoTuessjFxdYKXcFKo
X-Received: by 2002:a17:90b:2250:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-3a098b4b334mr10136993a91.21.1790585895468;
        Mon, 28 Sep 2026 01:58:15 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:39d:f247:bb3 with SMTP id 98e67ed59e1d1-3a098b4b334mr10136980a91.21.1790585894976;
        Mon, 28 Sep 2026 01:58:14 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.14.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm15313374a91.16.2026.09.28.01.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 01:58:14 -0700 (PDT)
Message-ID: <c0e3afc3-899f-44fe-b865-a32892e00cc1@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:58:09 +1000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20260907-tpm_qcom_driver-v2-0-71a6b1752da8@oss.qualcomm.com>
 <20260907-tpm_qcom_driver-v2-1-71a6b1752da8@oss.qualcomm.com>
 <aqyX3lJ1eNBmzbSP@kernel.org>
 <a8047ec0-742f-47f8-b5bf-cb1b32f06bd9@oss.qualcomm.com>
 <CAGgiveUA665UFwoojYBOB_rvCh=3NBug-B8xEBBVNPC=0jTCQg@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUA665UFwoojYBOB_rvCh=3NBug-B8xEBBVNPC=0jTCQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX2n1S0MGa96Gl
 ZUbxpeyoST1neDF1osDnrJF1rDO6BGI1fqB1C23Kg68OZezbxcUx0ihLuWsTY3KYWK2RZC4rfHT
 a/fmA6Fkhsh9wbyoyUuFHXKN/a7DaEE=
X-Proofpoint-GUID: tx_u3-5jgOB8O52tEPS2LXtpQenC0Fo7
X-Proofpoint-ORIG-GUID: tx_u3-5jgOB8O52tEPS2LXtpQenC0Fo7
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba2c28 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Pslwi5Fl4CR3OXkguhnOPg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=aXdvgW5Kdip_ic-aS84A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX8tUfX9QcYoFk
 iMyZ9XuYgu6YRFGTOempaUnQQX07ED2TTyaOZ+zyQjRNiZq96qvR/YYed58DsyDyPbI5eghYW8a
 Lu+N6mnpLoV7YEJ72eBLtoqweSqf54fYhoOxWFYV72seAWRmBKgohYUs20TRxnjCFhLhdZSJ5r/
 OwgI8BUJ12GDQ8Pdi22NeIYGOWSxISxS8Tl6uNYslLgqH716LZ54wjLshdpBkaiNJsZ8ymjDhu1
 2+qU4KFsLm0VJurTlfLV8zHKD39mo5Pie8KpWSV6POM3ZMnTGsxpNMZ7y5m3tMG76ZCRzxWRG3D
 obpJ3eSoFK39qrC02r6Wm/QTCRR/AsIjugOnwjRi7hxga7kD/tuhY20UiGRTIydE3kEC/gvND4z
 rownkM6zVQ65OMz4mLPI8HjBPuSveBchZ3T+53CzpGqfsL1HYMBgVjApYufHQQivxCxNK1OS+q0
 1wwfPRY8Wq2D68jfmTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035

Hi Jens,

On 9/25/2026 6:51 PM, Jens Wiklander wrote:
> Hi,
> 
> On Mon, Sep 21, 2026 at 10:10 AM Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> wrote:
>>
>> On 18-09-2026 07:16, Jarkko Sakkinen wrote:
>>> On Mon, Sep 07, 2026 at 02:58:41PM +0530, Kuldeep Singh wrote:
>>>> Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
>>>> is enumerated as a TEE-bus device, allowing a client driver to bind to
>>>> it via its generated UUID.
>>>>
>>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> [...]
>>
>>>
>>> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Thanks Jarkko for the review.
>> Can TEE maintainers(Amirreza/Jens?) also review this change?
> 
> Amir, please review.
> 

Sorry for the delay. I'll do.

Regards,
Amir

> Cheers,
> Jens
> 
>>
>> --
>> Regards
>> Kuldeep
>>

