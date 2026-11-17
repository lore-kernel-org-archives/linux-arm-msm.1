Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915940;
	b=kB9nNnhwSbjFE1l4pfrcIAQaSJdakwx/ADLyFW8SPxEO25VJEw9vUh8M0fHt0ZD0eB+W
	 NXAIJtiN5/fZ2HmbDus/0beWHgEoZ62xGbCZL1gFCCDAGv5ltA7j38IInzuQZYmVuELj6
	 Cu+pElN3DDxopjeAHZarrbB1sQKBRamTOweDVaQOHlHADWusEBQJbu1NJxMxJkCSiRwAn
	 lY/cw9enXLjsY33Jud9QStPC9iH3EtPRJevH/34mXt4CHjIjplaPqyZShO93Hv7OkkZ0t
	 VWXYqvtPMRwv8iRyPCZevU/z+oOf7sTE/PZIaJCiU0wd6qabzqFbL/wqn6i2K1fKApQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915940;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
	b=IyIfu3ctMhCS4A+144i4nxXb9rEu/Ao91R/k3Wv3OIJKVAf4FItbTvYSl33u34i7XzHe
	 bchFDo9aYXHxnhrLeFIwtMGGjXhamlHTRQyXPbvwP90CjTlabBB38XcTnEYVqTfi4kA0m
	 AyRidAHOX/8HjOS4577BKJUM1PjOvCtBWeb2AwxQO/3PrE7NqbZjpzP/AhToEDH7IvLAw
	 qv03RXmkRvVDtyXb/3a9NnmkvCEAbGAZD8LR5eAfDp4RbZrhrVWKILQ14DLIFeLEn0Vgm
	 e9v12HclVszrMkHcOJ7qtfweeiNkIHmjV6Yk0AssE2sK0q25p1JCRcSZHY2lwc1biBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef6CtlAd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKGNStEw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CF3606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61CF3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ef6CtlAd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKGNStEw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH5e7DX3809962
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=; b=ef6CtlAdlzQsPznc
	1LfAdj7bPyn+8o1f88i9Yc6QEnL+vdNkcUSHPCOfDxcRGMTo9SYel6SL9eOJ/8rB
	3vhtc5sgq66Fdpbr/FiOqYtn/m6U/c46m/qPYuMYAybAciMR9iKfo2PrEVbLl2Am
	2ouCOYRzSEOk/8sDVIJ/zwKklVDMkTGhRn+/rcr6SO/yvRK4MfICEWh0q3U9PKVr
	Himln70OmQiqFzUIHnWY/Kd/AvKNOXNzQMtxlLyirG1MAxzUCOA1QW5ZrUBuKWfR
	lf9+yGmeeh2l93c87dtbZQck8oEwRXbqQ/upslIidr7qQ3AAFz+ZVhl2em+Ht6q2
	ogUOFA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htjwpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 11:45:39 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b53bfc9534so226596c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794915939; x=1795520739; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
        b=DKGNStEw0OOdlx4fL2M+MTRytbVB85jjL9m5pkqJHqf0a8e3q7nmE/JiYpVp2jXGKk
         8YOThlJKCbCSGcznv0W5EJd+gs4fhPlIKxOcbH6jlmjT34NlgCVLNkMCvC4gEuxuNeHb
         OfjLash39isBTiJvU2RDHw56tUOCzAC4MdDWO/qSlc43anTMjgZvgkKoxPSGuPbntCmV
         6SiMT8Md1WKUhAvCdDTvpfmTE3VHCvSN1LpJovCYRUqUVWayKn+3M1eaA2qUpnsCBrFy
         WgPFhEDvKa0ipS2qf0O1opHNm0Lojo8r2CJJtHxsx5xbukFtEnaA5IVTSgJRPmZ+guhS
         0j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915939; x=1795520739;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuldvTFGqvoThScV3eP1J10a3bvY6Jb5DSXjzpU3950=;
        b=ySwRvMrX6fdQh/hL4XOo4aYPcUEEcz4lv8QwZBCXmDIo0xgLJdkcQzdrFstqHWsf26
         ZNrH6U8Tb0NN4AIcQJo2C6IGI1dX7roHlw8hkN4G68NjdPjz0iC9NRtVelGPwfCGPO9b
         vJGjFYmRbMNuyDo0zY3CO8M17WJhxVhyeCOgcZ2VmVWaytEgRgDfPLdhylq/orE/rmVe
         R/x1BQyqUPPtP2UPJqhxn0QJCH/hsproYa2nCNDbQ3HnUuCp2nvaJC9iaSEaAlMnPzmP
         VRGtNpK3WUImFwGUC38DRSCEgyrVm8F6QLDiI9TKSMdVXJu++oEnlQ34vnr/hcL+IeHP
         uWVg==
X-Forwarded-Encrypted: i=1; AL+hErEphaXVEFeEEZQwehzF0G4kkf0yTCdl9TzCVb/vjb79G0nv2rBQDnwuNt7YY9RkgiNMtkD1pX3D4Q0t1ZGc@vger.kernel.org
X-Gm-Message-State: APuU4Z9PbG+45dJwiOquqUZQ+mGQecZu8UYuhZ3YObdbXcDdOqx5XrVk
	4sdhnejHS1zO3ahmq0l9uVbplQQWLMSZTYhG9rpB5q25pKxN+5afawr2JiQjYmznyhbATZmpddR
	h+rZNcTZlxumxlGbo5Q0McF2qK0MUCGEVjV7RBJEgO47MgkkJ8Ypylo0TahcwJKeTifC1
X-Gm-Gg: AYBFou0JofGpeSd8g3xGIau8j47AIbdTcfgbUbJE9EejWupiHMOi47Z+9+vuvhPZQUN
	Lv6oYWXf/84rafnJcijj4C+lpmV27gbMOUJEhAseSSfTcXge9/unF4Va5qOtlfaD4BA2C/ZUQDt
	p3AC76MVfWIj60LKgB7POzJcEylqWc+sm5Qd2cyPPmzF0IH2cTn64+wzgIc8z5zmLh2IBS0kbfk
	W0hPwPcUhooCVBKtqFBskAWD6FM5OZYmx0ZwQrkCQ+aCUBeyA9jhpPTiQaojPK4gowTzbRC280+
	gzjf2Hg3jsEbng+WNDjVMav6UTQPanFlHxgZDX74oDeHSdGDlyXY/nc8OQT8ohiSUVp1OFuuFzz
	4vhi/uhq+TEqM0OuMFUkH2QqSawm6+7mN/159yxQf5T6TsSW9WDMLCTQ8lGIUtBoQfB0+Gpo2r+
	Wlff0I
X-Received: by 2002:a05:701b:424b:20b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b50310fab8mr12608194c88.45.1794915938572;
        Tue, 17 Nov 2026 03:45:38 -0800 (PST)
X-Received: by 2002:a05:701b:424b:20b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b50310fab8mr12608167c88.45.1794915937985;
        Tue, 17 Nov 2026 03:45:37 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm46094903c88.8.2026.11.17.03.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:45:37 -0800 (PST)
Message-ID: <f8e072d3-3fe4-2538-d88f-26bfd3fb075c@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 17:15:32 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: Fix out-of-bounds read in timestamp metadata
 fallback
Content-Language: en-US
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <MHYjgQwKyl4g6PykXAKsc_qby-VHmaZ8ZyKEoTM1Fpmve-Cg_dUJaQT0a2MReqplHxr4JLS7xunPQ6qB5AlxVg==@protonmail.internalid>
 <20261017-fix-oob-tss-v1-1-fb86f4cabf65@oss.qualcomm.com>
 <c81473c3-e735-44ba-b9b3-ef71a206e4c9@kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c81473c3-e735-44ba-b9b3-ef71a206e4c9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX6sr1SL84pV+l
 9fnrClf/JX2zCDx17je+4+UeuzMrJHdhvF0ZiMeDsewCM5Y6SugvoXOaUi8gbIo+k9tdO/elOXT
 0rRNXXVPhoTvFsU/OBPWDopeJnPyVq8=
X-Proofpoint-ORIG-GUID: wPMkTqcQOfVDzWBGLXmHsqFAu5IJgENn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0NiBTYWx0ZWRfX6JQ9WD5//g/c
 dSvrXVMkxEDUTuiIPzW+GDOC+q22A5Ylk+YeHSg/l9r7ZxDT5qw1do06pfSnEjiQ22Mwhb410RB
 pOjZA3ZPM1Ty1KmK2PoAqGWhU4NPaMg0V4JJaAxd7QF2eSluUlDQFbeqQbnCmo1USNKwWuOCSCt
 ia9COZ05ts7TmNDlXnB9DQyn8v7hZlvs+VqR34XuktebWLcGrVrezri1zC4rbUMdwcU7AjqEY96
 bsxKqA+2ojYBXgLkbbl4m1WbhOgn6UB0A01ywQuqD61I6bXzT8SbefhtYysXsLeR34Y2lyf0re9
 8cJCrtifWEKbv/fsDGJ81X9w29rZ37RgoIkZaNQIkztALQBZa8kMoPkWztmXAxS/vQWFXH8JHxi
 BarT/3F7ojvq2WQNAsjs3YmY0tpQq0smhhBXVBp8aHXyBsPTe9JDIrrcx24pMHhCz8GUyuXMpKV
 1yM7ewSbI9I9xWQiVoA==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc3e63 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l-SxXqRTaWQHASsAo6AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: wPMkTqcQOfVDzWBGLXmHsqFAu5IJgENn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170046


On 11/15/2026 6:24 PM, Bryan O'Donoghue wrote:
> On 17/10/2026 04:25, Vishnu Reddy wrote:
>> inst->tss[] has VIDEO_MAX_FRAME (32) entries, so valid indexes are 0
>> through 31. iris_set_ts_metadata() writes at metadata_idx and then
>> increments it. After the 32nd input buffer, metadata_idx is 32 until
>> the next input buffer is queued.
>>
>> If iris_get_ts_metadata() finds no matching timestamp in that window,
>> its fallback reads inst->tss[32], one entry past the end of the array.
>> UBSAN (Undefined Behavior Sanity Checker) reports this as an
>> array-index-out-of-bounds error.
>>
>> Use the last written entry, metadata_idx - 1, in the fallback instead.
>> Fall back to slot 0 if nothing has been written yet. Even if stream off
>> and stream on happen multiple times on the same session, the fallback
>> always uses the latest metadata received.
>>
>> Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and
>> firmware response")
>> Cc:stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c
>> b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index eb8de60c1177f..31cba99a665c1 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -865,9 +865,11 @@ static void iris_get_ts_metadata(struct iris_inst *inst,
>> u64 timestamp_ns,
>>           return;
>>       }
>>
>> +    i = inst->metadata_idx ? inst->metadata_idx - 1 : 0;
>> +
>>       vbuf->flags &= ~mask;
>> -    vbuf->flags |= inst->tss[inst->metadata_idx].flags;
>> -    vbuf->timecode = inst->tss[inst->metadata_idx].tc;
>> +    vbuf->flags |= inst->tss[i].flags;
>> +    vbuf->timecode = inst->tss[i].tc;
>>   }
>>
>>   int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>>
>> ---
>> base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
>> change-id: 20261013-fix-oob-tss-7d317d612cf0
>>
>> Best regards,
>> -- 
>> Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>
> Just control the variable where it is owned/assigned - the index should never
> run outside of bounds - dealing with that out-of-bounds is a fixup that
> shouldn't have to be done.
>
> Don't let the index overrun at all. That way the next function that reads the
> index, doesn't have to know or care that the index might run.
>
> [0] % git diff
> diff --git a/drivers/media/platform/qcom/iris/iris_common.c
> b/drivers/media/platform/qcom/iris/iris_common.c
> index 25836561bcf3e..b2b9349c38ea9 100644
> --- a/drivers/media/platform/qcom/iris/iris_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> @@ -33,9 +33,6 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct
> vb2_v4l2_buffer *vbuf)
>         struct vb2_buffer *vb = &vbuf->vb2_buf;
>         u64 ts_us = vb->timestamp;
>
> -       if (inst->metadata_idx >= ARRAY_SIZE(inst->tss))
> -               inst->metadata_idx = 0;
> -
>         do_div(ts_us, NSEC_PER_USEC);
>
>         inst->tss[inst->metadata_idx].flags = vbuf->flags & mask;
> @@ -43,7 +40,10 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct
> vb2_v4l2_buffer *vbuf)
>         inst->tss[inst->metadata_idx].ts_us = ts_us;
>         inst->tss[inst->metadata_idx].ts_ns = vb->timestamp;
>
> -       inst->metadata_idx++;
> +       if (inst->metadata_idx + 1 >= ARRAY_SIZE(inst->tss))
> +               inst->metadata_idx = 0;
> +       else
> +               inst->metadata_idx++;

Thanks for the review. The issue with wrapping after the write is that
metadata_idx then points at the next slot to be written, not the last
one. After the write to slot 31 the index becomes 0, so the fallback in
iris_get_ts_metadata() reads tss[0], the oldest entry, instead of the
latest. For v2 I advance and wrap the index before the write, so it
always points at the last written entry and is never out of range.

>  }
>
>  int iris_process_streamon_input(struct iris_inst *inst)
>
> There should exist no window in time where the index is invalid.
>
> ---
> bod
>
