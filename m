Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A4F4A0C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413548; cv=none; b=axYheL/f0okX4ZlOFw+XobTJXto2OGYi2S2ZNoEPqz+UehhPT5GqvGGZkxI2OeR6dF9529s813Iq3XS/d+VxEvSW/JCXXin9LXKQDI2donIEVWpsUQxvg9hMvb+DioXzTOwBUHNmvOwQ3Hjk21j3PPctwoXn/v0eRqX5jHhljKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413548; c=relaxed/simple;
	bh=vFGazr0aQJt5RzuoQR4G3P0EOLka2JyrVxwz8bszgBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULxPf4ay9bOjPhhRIWucasYXJgog0xOEupO37VXtcjiXpFZKk/MxiSVMqSn9fnD120L5vv4Cm6bkarQ+89YwpaRRfKvHriDIzNjgN0H323U2L3cDGtNOH+LQknoDLQSW6nmHRJwG4e2LhLV+OvF6UttvP3SgunH9YkaEHx7OgD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VKfriVX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cwq9w2Fo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VKfriVX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cwq9w2Fo"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Omn01348084
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=; b=VKfriVX6+qAmBvUJ
	S8rJfWLOJCjLIbcmSEVYqEzztxPtl5o79LqZy5oHNHvsBo5dEqLzhI0Rbq8QUBv4
	yYcprXqTM4vdCJ8FPy+oUSH9oSC/uPvJ7ZlTyryUqP5qnFXXYfjTyDMXK8RVdpgn
	cQRhy7ChJwjoYmjQ1BPWNVDeE70uOq31+d7ei4uIaIUpgiblSPihTnRbHj/CksRt
	iSx5UgSfBavR+b3Y0hCrFvT3G0LPYYP5npEQDj9VlCymd32jFu3f3Lg6qV0tt10b
	Bw2qjF81gxaHnF6V1FyvcKsqCV0EutBxEowj0y1q1+dHtYwHk7dKSFRDrdWNjLPZ
	7mUaNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rh2tp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:38:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso37403185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792413535; x=1793018335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=;
        b=cwq9w2FoU4Je0ZSC6/u1Fy4IoqSnQcHEwJ3U+41qODM0xWP/M6q12XnCllCMoIGSA6
         hzJnZxydDRRt6NtH/W6gzVBkJYWFuk+F0vuqGY1ixfvVw7Bmv60qali56DGPfaJ0NnQM
         2VwU+0/T52ZRRuCWX/6eLOY6iIU3tGe1rT3G8rIEUptC82KVlWJiSyj3djQVs/NLOka5
         lFAXQthvE7+JGqItaHo4fEAxlgT99pjRexUMtAV3MVtVprWwrVbrIuOFg0XmBOUBsrEk
         oEKzOHNR6ksEgBOcZDBawimytQQn1NS43dxoIdklm7Dg2I/Yxcsy8DjeFB0/7jwSZaH1
         malQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413535; x=1793018335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1Zf5nmoOj9REwHL4lFlJcEi+BQNp7U+4/drZJjgFKQ=;
        b=YbqeYz+40+IDqTWOEffhQsSuXX/JaNM/PRHvvKMyusKRr8LMGDunzlqWj3N/17NUKY
         iq5Oj1HrLZshCFoAF5uY6rIeOsS2pw4p9bqy/LEfzNyqjLgE64RT5NQjQD12E04iBt/X
         BtgwC+ueuDBqVANSZwjQTbjwG8x07+gTWDcFu8UYObVZFx+MJvSUdc5qNgdj7F/W4mEO
         e5EG7686mIc0peqLVyQrmIvDyUKolEGW8rv62i36uiPU1gBUO/iiguZ2AKtESwuidbne
         Ow2KvKiHO1UuBrNFUQlASNWWhdqCaAhZx48qe90ymCRf8QQE50l+o9oi/CGRBxWmqapB
         s35w==
X-Gm-Message-State: AFq9FYLvdTGkbCValu9rN6HnCPtXkbiWkL73/qix+rrgmdZALbk23EqL
	te+4sfKzwoom5X0awKwx3jFKJwif1Xg516+UIlhXYG7jlAD/EhQk9hiXFklwYv4fnMLtE7Vw4fh
	51P/iZZA5bkn2JdEYWeqSNxE5eLi5putOwUKcZCjaloO4detr4Njj2qsfEYAGhv8HaLBn
X-Gm-Gg: AYBFou258Hxe1iDqV1Edg3JNpLuXJVZGdSaWcV4ohHyHJoNtGkvGFLuYQJrGptJmJ+t
	q/8BNbtU0y+Eac8mbjAo1U1kZXxPrRL377uqIPhCtjwFw4c2gX8zZXwphWUqNaVdcN0hbCPi3cN
	5U3rORhHSFM62+B5H4KiCJJp80DUFGJ47fxEhiQbTeNm+OyJm7p//f740j10btZwZpWSXmdGuqr
	vFBHKb2gYUoAbQcmj6RdzL5R3hY9U8ilPFp8V/dLlVXDxkwJ4igoNsFam5OOEu0VYi/5JNA1fd9
	JIMOc0rxLYxYAErWJyTkBM0yvMwmYnydvfzfYTRr5F2cmWkVW4EzxncxHlD2RS0DQXfuNUEYRK+
	QOTJoHzE7v9G1cGu5yQGP/A==
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1436766585a.0.1792413535145;
        Mon, 19 Oct 2026 05:38:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f29a0a71dmr1436759185a.0.1792413534522;
        Mon, 19 Oct 2026 05:38:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bcad6sm354612466b.52.2026.10.19.05.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:38:53 -0700 (PDT)
Message-ID: <577a1383-1198-484e-81cd-3de996cc7150@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/msm/a6xx: Add a bandwidth table for the Adreno
 620 GMU
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-adreno-a620-v1-0-4a7ed6210d7d@brar.si>
 <20261016-adreno-a620-v1-2-4a7ed6210d7d@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-adreno-a620-v1-2-4a7ed6210d7d@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: phpwXzLIwre1kyYJZR0vU68RXsUgxDM6
X-Proofpoint-GUID: phpwXzLIwre1kyYJZR0vU68RXsUgxDM6
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad60f60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=ODsmY_3wxSbvKopP8XUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX1mNkjtD//dB4
 OqgO389S48TLLC4ChDcm4z3dCSrp3VuaCPOq+uv6BxYrtSYd3nnANZ06hfYRfrqwpo7lupY0LVj
 9WfSg7w2pT3sCkXmhcuVxQ6L6ok38fEAibNuVqJtQzxAAgJhKyAioyaWqVtaxz5BZVyGYfyCG8u
 JfamyDx4oT0GBzaYo++aPi/0+KMwSOUiGU+4TsAOQY4YJs29yV/JLKNbtKNdLxQwFvnQ4wfJKJz
 4gzXY1PtCqys7TZR2nS3LOmq7P2i087eRN9MCX3Zz8ATHSknIhP6p7sQ+LGHrFU12XF6YUJejoa
 VzJmMAmWIPRNYRq8trpRnij2VOu7lJk5U7QCMWUcMn75YPDHMBUO3pxzPdLwLws6tdr3yCT9l8v
 xh5JHILqnMjFgVt07FCSJGyt26tOF8+2tLP6p/xN0neZd55Fe22q4VmLYsbKD+Z5tUAzAcgtE5o
 iYu/0l9IwirSxBz7mvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX+g+M9Rx67Z87
 2ghI170+XWSQwRTRvUpWvwAqkoxdEZHxyWlHhgNADBUBY30YNsnCOIjJBNWd9A2JobJJhj4oew9
 +9hKH74gF4QtL2qD/saK58M7PGcsgG0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190050

On 10/16/26 2:53 PM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Without an A620 specific table the GMU falls back to the generic A630
> one, whose BCM addresses do not exist on SM7250, and the first GX
> performance vote times out.
> 
> Like the A650 one, send a single "off" entry just to get things running,
> with the BCM addresses looked up in cmd-db. Add adreno_is_a620() for the
> selection.
> 
> Assisted-by: Claude
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 6b34e704a..cab7ffc63 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -553,6 +553,37 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  	msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>  
> +static void a620_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)

This is no longer necessary if you add .bcms in the catalog,
see a6xx_generate_bw_table()

Konrad
