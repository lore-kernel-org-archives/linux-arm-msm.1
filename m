Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676422;
	b=JEv6SgrMbd3dLnR2XVGzHrhjHTUIj0SRqi/2Q4+DdWL4FYNn5WQClmnMHZgAyY5isL4J
	 QrVexbvutMGrTTKYfUHxHLs8CP51kNtHjEoauMrywP+GlkJKfHMwD/eS8WFc6JozRo2dv
	 6o2UGc8U1eSf9+LHbnMwVqTZeM71LVNnHan49Mj3O23qYhSnDOaSj+3+EE7eMPp5vvY95
	 Pk4NNxo6V+36qpERkW3EQHboO7a7w//o7q2mbeFRa/WkWKuNI8EL2ixyeij5hCK7fPuoq
	 qslaUcisTKAGwmRkhodnnt/o/57AZaT1QlwEVJNI5JjPBEDcnzQugRP5RfYU0WOXp7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
	b=SMctfHzigTFL3nVb1E4g5NGf4perEtcN/YKVWeC/UbVRPE4A2/MLB5k4VxZYf++lG5y1
	 H+7Pxn82rt1950Hmv59DBtnUGYYVuY5WDyQx27MMIDbn+R4SW3ILxzULc7CQol4e2AJ2q
	 fO2AYHvCZ64HNl0AR+NDAAdoqeMIFQYsRfddrn42NYdAQURCJ6UYGMDfFsroYTWkUaMJz
	 N2mLyNqAbEtxA78U1qvUahn0gQDTBgYSwKfF/XW+3RkzefO8mUPayAxnEb9sfmviWHr1p
	 TpibimvcYSLO81McqWSR3ti5jAY5xrt7SuOz/bNj+17LcJGA7UWLIgDgmZp5V8ud4JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQHE9ns;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wf5eHh4x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FFF606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FFF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jOQHE9ns;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wf5eHh4x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Jg11812745
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=; b=jOQHE9nsO934AjXL
	6eI4s2hT3Ut9arcgad+qRKj3BXHkJVD6xsI1JUtqOs128cq/N4bQ8O4Jy/H+2O2t
	t+ZAsxHf6+tYOcPHJA6jDyPHYb9lo5Lv/EJlc46OHzRk/Zf9A/hqVc0iou+X+Bls
	YuNJ2Wuax9S7ba576miO0lwqI3nDRu/wCsknRXenidp3WnEXS6yfEpcw34PORZpX
	ccMONITFfJbFTkcXB+75vdirU/9umBwaA7oWgc9HopQiupKzkfXOvGPAa2v9hBF5
	K6BuTr834ZHhWs35WCOJgwxqTK9YsrF38H0SzE06VuROOCsgBBngS33wodVmZWuT
	qkLX/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak0118m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:00:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495af07676so1023982685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 23:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676415; x=1796281215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
        b=Wf5eHh4xkmMmBf7S2ekVF8nKLgHYoRSR89EvlKxilxqr2durEr6xZnD8lKVfdt2mX1
         +NkmcV/srVJ5uQsKEIElSKpdv96Pgcil31YRKsiS6SWqhQM26GTVrA0YxnUIH6jQhC1v
         3zqBdPgADHgdKytuphrn67n4lb/FDyX1RCg/yq3Qi6wkR+66MqwUpUcJkoMwb594e9CY
         l9iXfm9Tkgk+EaT5u0ffLkjFPRvcEmCNVLWJ+WtvTwbSlzfEkRe25rl6QHlneVsNv1ip
         kOHNWTI2IcdYKaYhA7y2SHPPXZH0XsCKbJ96EBt+cZuo+wqHEMCzQ5nkpyDMwebw7bLG
         kjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676415; x=1796281215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAGZI9h77fAEVJOMFwdusvDKaYM8J+TbnUlWkWl59RI=;
        b=qs2G9UEHSAD5FgQrbkAZGH8eA5ewy5h5QsLOnn8Tib+8QK/rNTR/JXEdfvrgsfOUKj
         lcO7u2SGTU0+77IjD+9HRm3cugInWx+7ab18TX63iNafqxc5cC9U80LQCJgOm98N9g9k
         al/6d68dQbZPg6FpBQnoqLzgIi25oBfrrZdxaVwSTKnJ8GqpF/bjdZJ/pC2ZswcoY8Rc
         BKrMmexdkvGE0te7xkiOJ2BpPR4GlLpbGd6ZF8Glsoo636sbAhqoDeHkfeyrApuhCy3z
         Q3lq5jg1eNOjq+5/3infkPPe47RkIEDlNMCWPBli0jrny25MXPYTrtwQQNuRCv1OxDX6
         sDQw==
X-Forwarded-Encrypted: i=1; AL+hErEt3bEuItCgL7/2KJC7liGt8riGCcI8tfVl1ftb01T1c5qVgntc7pE3MzlOqzCVTw2f2IcklZzHiaox/OCL@vger.kernel.org
X-Gm-Message-State: APuU4Z9W6IXYN3KhJ0lwvebKNMKxhoijgWKQ48Cq4NwoR6EqRHXNfvz9
	i3vK763/Vvox0ZJYzJACbkHfFRPH3Ul8vliRojcjki2mu7dazcRHxuQAEGF9Br/AROSkrlAUTeH
	/RfX/tKCskockl2/tXPy+8s0ffWpRPYB3eEYqXYMBitKIbM4IWTaARMqQ85FzVipyul4+
X-Gm-Gg: AZFdTZcidkKleSX23xqUIQtK/GodEqX/kjssHhMUnmOHdqYnlpcf3/flpWuqDb+JXiX
	CYZM0Sp0ihYUbfCrugsc46ODBm4Ki/nZbRN93ubxcGfD+TjzEXv+ox1iUHc6DqfUeOAwJNvNE6E
	mQXPWx+Nz6nvwHJOhL7LmVKUI8KRInT9Mv6FXZBLWmQF68ROftFStZ0JkogAUIb6T0CJWCeE2us
	H/poQppBb/xml42Fa419kwlqiQOhOGwlxYpm7y4xoz4hjqgS/j9yTwNwv1i05lA+nXhDITgefmk
	od2FbYQC7oTh7eocYLJqDHFD1utJ9Q/QjMTdmKUR+RTlYHGAD5TQjmT7dl0IjGo48ubITWL3ByL
	V0i84yaefWGx+MZn1w6A0nKi2RPhMckWQronlIrn2vu0R33y7tFU7bjuDlrAgI9GfCZc3Gw8FJH
	2aaUES9a5xif2cwg==
X-Received: by 2002:a05:620a:8802:b0:945:b967:475f with SMTP id af79cd13be357-949ba956648mr3487516785a.16.1795676414289;
        Wed, 25 Nov 2026 23:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:8802:b0:945:b967:475f with SMTP id af79cd13be357-949ba956648mr3487505985a.16.1795676413443;
        Wed, 25 Nov 2026 23:00:13 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm794422335e9.13.2026.11.25.23.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:00:12 -0800 (PST)
Message-ID: <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:00:11 +0200
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
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07d900 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H5SKo5UfUjvo3ROSXWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Xo-PHZowAQDtsicYcjLU9_oievtChs9S
X-Proofpoint-GUID: Xo-PHZowAQDtsicYcjLU9_oievtChs9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX5h5a6LiQjg6T
 3IMkCFqlLDxDpTykhiegoJVhqW/wJ0P7vTdnLtDuQQnLqGuTjCqQ8/McHFilU6prw4ZZoJGtMgR
 HbHbrp0zXTtWpuaBArWL8u5skAt9+yUGrGlt8s4fyiGnCMY3YUrxK8FNr00oh50sXKICtGDFHaG
 U1riXw4VIhZw6gATFXI++4PfP+k3P2E0V9I0MV6q96Gt7kIAAjcTa/UAblgBsUHsaF4IeuqMZfL
 pgYiBQbWuofJA9OoZV4F1ImEahqD5rH5Ol9WuJKoTD5z3AN/ZlhSAbTaex9e0/ac1Bear3Hv3ke
 xFdh95ihZ8tqa+JhcmEnGiBGdkOmj9k2ddly9NoTRFzHHJPPlrS+iFWcY0JnvNJroefxIpUpTnW
 La+xVpx/4kd60IVHu0kZIQ0jtjErqm8qitn/Ch5DDfAJbvXQekXeQO8fjdjmZj0DsXPd3TVQUDm
 RlOTwYvWYjVMVDvhSbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX1Z7Xi7e34E1/
 rQL4VrKeuq0vPvdGNVwbcgddPSlG88U2z3aEtTtc04hR4iuoFi1R3rK+BKtENFEVRVAUvUzEdEu
 tum6dsQoob2e84NdfJzsnoZ0fKO+1cU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260026

Hi Loic,

Apart from hw timestamp propagation some other comments.

On 11/25/2026 12:19 PM, Loic Poulain wrote:
> The timestamp reported to userspace for a V4L2 event is taken when the
> event is queued, which for an event signalling a hardware occurrence is
> only as good as the latency between the two. A CSI decoder able to latch
> the start-of-frame against the system counter knows that time to within a
> few microseconds, whereas the interrupt handler that gets to queue the
> event can be hundreds of microseconds late and is not consistent about
> it.
> 
> Take the timestamp from the event when the driver filled it in, falling
> back to the current time when the field is cleared. Drivers have had no
> reason to set it so far, and every in-tree caller either uses a
> designated initialiser or memsets the event, so the field reads as zero
> everywhere today.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
>  include/media/v4l2-event.h           |  9 ++++++++-
>  2 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
> --- a/drivers/media/v4l2-core/v4l2-event.c
> +++ b/drivers/media/v4l2-core/v4l2-event.c
> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
>  	wake_up_all(&fh->wait);
>  }
>  
> +/*
> + * Hardware able to timestamp the event itself reports that time in the event,
> + * which is more accurate than the moment the driver gets to queue it. Fall
> + * back to the current time for the drivers that leave the field cleared.
> + */
> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> +{
> +	struct timespec64 ts = {
> +		.tv_sec = ev->timestamp.tv_sec,
> +		.tv_nsec = ev->timestamp.tv_nsec,
> +	};
> +	u64 ns = timespec64_to_ns(&ts);
> +
> +	return ns ? ns : ktime_get_ns();
> +}
> +
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  {
>  	struct v4l2_fh *fh;
> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
>  	if (vdev == NULL)
>  		return;
>  
> -	ts = ktime_get_ns();
> +	ts = v4l2_event_ts(ev);

The documentation states that:
 
"In order to queue events to video device, drivers should call:

v4l2_event_queue (vdev, ev)

The driver’s only responsibility is to fill in the type and the data fields. 
The other fields will be filled in by V4L2. All other fields are filled from the v4l2. "

So here we are changing the driver-api. I am sure that there are drivers
which does not set initialize the whole event struct. This will introduce new bugs with
some uninitiated data send to userspace as timestamp.

~Gjorgji

>  
>  	spin_lock_irqsave(&vdev->fh_lock, flags);
>  
> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
>  {
>  	unsigned long flags;
> -	u64 ts = ktime_get_ns();
> +	u64 ts = v4l2_event_ts(ev);
>  
>  	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
>  	__v4l2_event_queue_fh(fh, ev, ts);
> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
> --- a/include/media/v4l2-event.h
> +++ b/include/media/v4l2-event.h
> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
>   *    fields. The other fields will be filled in by V4L2.
> + *
> + *    Drivers whose hardware timestamps the event more accurately than the
> + *    moment the driver gets to handle it may also fill in the timestamp
> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
> + *    drivers must zero-initialize the whole &struct v4l2_event.
>   */
>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>  
> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
>   *
>   * .. note::
>   *    The driver's only responsibility is to fill in the type and the data
> - *    fields. The other fields will be filled in by V4L2.
> + *    fields. The other fields will be filled in by V4L2. As for
> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> + *    CLOCK_MONOTONIC time of the event.
>   */
>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
>  
> 

