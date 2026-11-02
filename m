Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633189;
	b=ooxevh9pAbZ4pnEHyhg7e6sKzygHFC7N+3IHNBqyF76XWGmwY3SK9fQcHLWX0RyCKM/n
	 JkJ4FOZidptTQDwBsEMw3KgKkd5X4/ePU0xjGSAw+etBm78fzbuhFbPjmJ2059lCi9qDY
	 RdJVtNkV4/f6tGs/7fugnwpuauKNHuXMzwzDZIgTz7aP1JtAUWGt6Zw4bI9hFmUTZ6Pa0
	 LKJM27BYbMaYX8gJLtOEE6rHJFHYpR1W/uUUM3uSAseBzN1SZEOXChLt+scrN0dDPj/ot
	 AD8CyPpt0EPiSRRnEHldqJhHl+LX5s8juD442X79N+cSkABrO6q4n1BG9S7Xl0jCIvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
	b=QtplOjGBFHLHdlrF+XQKE9kZ0l5vARSjhHoygpKBWmVQv/0PDc2wPBgiaDQtg23E++s0
	 e44TpknKMD59FXU+asEclHvQzTdeAedduKSM7fkhH4AgWVmPLN6BcvhyK4/kceJM8TYIN
	 S7waBpjvdZiPyrXfW2IAUBsWS1kJArDwxvroJ/Y5/SnvXK/NJwKnYOnP4e49bpNsE0drk
	 z5QoK8rnRCO59qdbv2fVwl8FWpNBpQWSiHurACsizRqGKiFtlK+q0nTiHjVVz2xaxv6st
	 5uAYytqYCE2tX57RETJ2HqMhPBFYYjlQP+7N8P8CXXOBK503TATf/a+MRXCNuzlJzmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fVjPD5/2";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL3eQZMl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D707608360E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D707608360E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fVjPD5/2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL3eQZMl
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DppWZ3716250
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=; b=fVjPD5/2rsrAeWny
	dY4kXttgQdcC8B2da4/JGFKlwB88zU2Wt+us18VB1OZwQ+AH7/UwypCGNuzM3nc3
	u8ZKNI3lps1ppameBkvboOCjTzKDvJsaNM2Fs9Y+I5WUxnRVPTGdCTLVJr8omCPd
	D38LG0xJBLYhh0+QZ89jL2tVARDXTPMlynaADDFK1bixIqZF3EeYyMC+9TiWlgNe
	dlBN53bF9lSLcHCNf90k+wucjcAbTG3V2V2IHUqirxUAdalbSJFoKT6zLGrafWpw
	UKeNrnd6WJcRHAT7WWuFGgb8Av267GPs51xoJ8o+nLMp4plyJtKWn5Sgl8UXvt4g
	+9EYEw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62g4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:26:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac78dbbe7so72248e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633182; x=1794237982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
        b=OL3eQZMltBoWi9CGbPiMIMuw1LRrS+wlf2WxDcLysdI11SXb3Mp9NirNxJTZMlJW6h
         OxwUTXQz8ab6IVv2X+yWSdAnx/hs3VezLIxbNzukRDc7ssFb/liRsb6wh8nYzL+Iy+sE
         mn6a8Ny9fNYvg+9kpbulC1RBGHHSHcOSgZFD86JrersLHgL+TDP9aauBPRBniIUwg+4Z
         s4qcu9vpYBw1AbpeL7h6jUvKXWmgmjzjp6P5TVWrayl2ncQoyRzQsf/VzU/BAiSlJTKk
         k2wyGHYLrkqkvFuswLOyMZNvcnFyF/2J9xhRrQ4PwIVjpP3bIj6eR9XvCHMvHq4DVmEl
         N8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633182; x=1794237982;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ7uDGaJuz3784OD9oFLUOQAlulPmdnktGy1Lcp2kIQ=;
        b=wP4SluFovutSPWYo7tpkqX+nedOFh+OpepcWvANKoeyO2IPnTiQhSE+pYalVC1U0ce
         fj1XAO17XU8Hl6QNueWMQelj16pP6/kBT94N+XyxyjzBG12EcX/np7HnPE3EWt0IHKYZ
         KQSHWGo1UFZyxEB03Q0sbnx7t9COcuwSx7sJs0+nwy8Wb4oXUxrtUTexGso9jtaQlbVd
         R1iEV3XBBk64PnzVrzjDOF7X4yv1xtvEjDcQpDK97rNcfoH76enSL/GzUDmRZCqiXbIZ
         yDXRaFFb9gavzdM0Bdn6fDYLjRooeoGNDx1gE5mbPHy7OEvGYTX9Gn7hn6MMRT8/EmsE
         r0gg==
X-Forwarded-Encrypted: i=1; AKwUvByis4+aONDFFEt+jygCk98S3sDdN3N2q+OzgWPqrBtWMtLuHePrYF6yRdrg8U/+lRFqNUkVyLmWSxagas6Z@vger.kernel.org
X-Gm-Message-State: APuU4Z8n0yGVirFcPZMSiKLOD6X4Ft24+Sc+6t2qDLANNLP8WDgU6u7O
	4J3M2aDzpOvqb0+nFKhiXHeMtf7A6i0Ww9i5TPUNXlZ0btxpfYtCJYFbIjUfuSzO8BqoKF1XnFo
	gLdRkC31AEruVqCzTONEFZCX8l+X7Qq+rC1oIqGmtf2HFHRqEItlPObybfLFikUnRt0OQ
X-Gm-Gg: AYBFou0uuId2F/zip4vHuf8AcJE1A/xb3w8KTdj1mjXm4Vnt5z9foTusG2mi+NQk3A0
	J4cBiB3tI1jUFFZO1QP4F9bJRAbxxuV9Oxp2u7ksG+4T2Qu+Q/n4kmIfIOt3mgHnISIPUkDSqLm
	QtuK+UySN6GMpXYerFf081bb+GEwWi+p0BJUy52w7/GFskwTpsXRlhpitqnB+6UJ5uSKYm8gBFS
	H/CpoMaJUkwf0VP29wJVav5x3WB+56oEQz80hZaohC6KF+FqEB/yqthX/lHfG/PLi6CpgIHPSka
	8x9UScr3W/AwPwS5Zf7nC3GwO7Dp2plVpqKXty1k7tYmZY3hY/HeJZ2z9ywgXKOKRQrZdmOJv4W
	Hvnk0fS/9maegtrGRpefgheMzTUODCrd5w77kc+1iW3hwOzVOr41jt8UdzTuvuieGbateJw==
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr2941403e0c.0.1793633182120;
        Mon, 02 Nov 2026 07:26:22 -0800 (PST)
X-Received: by 2002:ac5:cdb8:0:b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec7562c7c4mr2941372e0c.0.1793633181338;
        Mon, 02 Nov 2026 07:26:21 -0800 (PST)
Received: from [192.168.226.93] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebd3a2desm2237066b.10.2026.11.02.07.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:26:20 -0800 (PST)
Message-ID: <427972ac-130b-4e56-92b4-9d11d278d6af@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:26:18 +0100
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
Subject: Re: [PATCH 1/2] drm/msm/gem: Fix VM_BIND range check
To: rob.clark@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
 <20261101174911.25184-2-robin.clark@oss.qualcomm.com>
 <90ae1b4e-d83e-4209-9df1-7ebf778a881a@oss.qualcomm.com>
 <CACSVV012ncykN3PnXnuP+-tK51r4kJ4BUfiThcjV2JYvn_jXwQ@mail.gmail.com>
 <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01=19OWZ4i1Bc-j8m8u0+5jtfOgqPU-VfkLUQUQ_oVdmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C1sIs9bkPdP8D8Hc40nIQ5GCukeoNQtW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX1bPAge04xtw5
 NUmiNekScCl4dbkzsI0b+UTocK+xe77/hJ0jSW/RYsdSG496oSv2OKqeEf7b/nAHLvv1Yr+wbSK
 iB21yDjb5Z6QggHggGKnxW522rvErmg=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8aba3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lvvAgqv1s9cMsEWjrR4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MSBTYWx0ZWRfX40vf8vuyQEP5
 XP4gbNPY0sneeFcn+nF/lMxqMCwmVxPMoWIZVWpEoBZf2tEfGDt7er2oHKqhh92KihF7IovveUi
 XgzeVw7qFe13NvLg9wVUCemofG7F3L5FoxfykTsQVWtA96+nanLko2Sb+Oi3G/GzF7mUIJPf2GS
 gE+EZ2QJ2zz9pSpQPGqgilZH6LUvrH7Q23dRzmRoFtG8fmJmAef6sFx9HTwvRl2jsBea8EA9Wgi
 sZG3De6m3mwO5NVvFsawny3NSenz3hL2YzxDSZ7fz7I7RCB3LwKCfUAtKG/KHsDflTcCHHJJXja
 D2AkOzx3mglEXtW2fzbL59DpcgrtxTjR4Lg8UkvzhDzpmbksX0lEVpYg3vjUwMoT/EtZQzXNg+l
 BjwKXRlWQ4qFiOmF6cedj5VoQrQdtCrvFmuXjdMXPebdzkoBtBh8dBMuREA6BKW2nrO7ZkFPuMG
 ucuvt9bBV5JkDbMfPNA==
X-Proofpoint-GUID: C1sIs9bkPdP8D8Hc40nIQ5GCukeoNQtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020061

On 11/2/26 4:18 PM, Rob Clark wrote:
> On Mon, Nov 2, 2026 at 5:59 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>>
>> On Mon, Nov 2, 2026 at 1:40 AM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 11/1/26 6:49 PM, Rob Clark wrote:
>>>> Use size_add() to guard against overflow.
>>>>
>>>> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Fixes: 3a3bef68a6c1 ("drm/msm: Fix missing VM_BIND offset/range validation")
>>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/msm_gem_vma.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> index f687a629629d..16b3870d5e90 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
>>>> @@ -1118,7 +1118,7 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>>>>               op->obj = obj;
>>>>               cnt++;
>>>>
>>>> -             if ((op->range + op->obj_offset) > obj->size) {
>>>> +             if (size_add(op->range, op->obj_offset) > obj->size) {
>>>
>>> GPT and Sashiko are unhappy about what this does on 32b
>>
>> Considering that we can't have >4gb BOs on 32b, I think the concerns
>> are probably unwarranted.  But yes, I do look at Sashiko's reports
> 
> Probably we should add checks that obj_offset/range are not more than SIZE_MAX?

Wouldn't hurt

Konrad
