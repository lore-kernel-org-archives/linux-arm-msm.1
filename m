Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698953;
	b=ARpOM2k6ONx2Rb8kMSVNAKX4g6HN6c/mXJdhhaK1UzBl5C7UKRhFZHvdI5DGzmv3QWOz
	 4xTtHeJ7BQILM+4qHDp19ECionAuixRjwBAwu8u5P7TxWUakhPzX3opRlRaeuKQW9QTIz
	 +IRo900LX4zchQyIBmyDJIxDeG7b5NayXSk4uTO1HfNRA47LlVNWstuPSZP+CiG0eWqq8
	 6Qb4s/ASsXlB5IPoaiYaStSjVqDsTyTOsAJcDDpePoddhr9/qjU2W2nj5cLHtZFfQxSep
	 ByH5/aYUDeGDjVqBAkfV6JuWa6SK1PDxwPqco6b+vfAg3zcLyMTcLp25werAiy4nfwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
	b=fXDnY+hRSTA9kHML0bhyN/6UEdGeWR+YgMwToMFlIul/ckaFeKB/TzRjQ4dvp7t1qWs5
	 FSPzv0buRWvJRdAJ3JMN0jTpnSThvfF4so7Njvc9XEhzJHlGR8OWJO8GlpNQLTD2dHTti
	 uKX8Ga3PigJi70eHwJkjdAU0rPYR6kztGK4sk08R/IAscDjtw/YtypG81m9vDktIzzZ3z
	 NEdAbHtPsNw8i8+7HCcSzzMel6T7P2EFR+da2bDug9jyD8tzdADkYmOG4OBEUYU+arrpk
	 iE/pzQC0TEReCXQbKT9VrgI7tfSch0iPA3yf7wC+Eqdf/hvVnbYRzW2DQOBSN+J3TTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD728606D821
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD728606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a782sjAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U8ufsOlY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37hT3E470786
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=; b=a782sjAFS4L1j+hu
	Z1tVUHZeSvfCskxsoiPmCFruD5xEsPWq6LKxMLkLcPk0YSUnlRwgQ2ZfxWN6P0S+
	BiHYhaT6ThKsOuDedIXFH6A9yYBKCH7mVRdaZz7ercDo3ayCyZV91j7iQNK5FVFn
	6Sz6njBwkw3ghKLIcGOKAOmXl4PGbjfRp5vTvZTlidGZ144O7F+Dm4DNW7LGwyC3
	li2AFpo6Z9IbOOi4kPW02sl6SHOLkgrbfVABAhEdeixFzFKjb0Lqnffv3f+HtHTc
	fBZa00qqp845F27Yts6nMDaVl4uvGe3SbFPs87wFZ5y16pdSaB/g7RqVhHzjKHWb
	ocVQDQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081u2av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:42:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc099197b9so3207433137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793698951; x=1794303751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=U8ufsOlYO0BQZUDrBNzSIZ2hEkTT3JvSQCGpK596x/fAij07xD9IBmJpfz3Viszxow
         WMfIsUOA9q/jlLwxT1CBDrPIi6AYcHagBPDhTDOQIzVdQ6/ZSpCONuTyu49v3RuCwfQo
         4ZmD3UmlvOPZzg7gXrVstY/o8KR+YgHPqPWMd9qswSSfCJOyjJlIUZsh4r6RHZQwRFX6
         lo9Hqod+kdefMYcm5GJLsAtzKyDJS8dSgCgxqmH49Zwsnfr80xfByevDFDSLoWuTSnXK
         /uTyMrlQpu+zcAfR5WrY4fkYWbfHxYeoQ1gfaZpYcE9ucW2pt0bnC7CeVaBR2gIiPHVw
         Lf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698951; x=1794303751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ3IlFmsPSWggRQ/22Hknd+F71Cojm8gDMGFW3Wmerk=;
        b=FXLyIL/lJHcyziOPp2Ltt63IW2VA0Z+kr/pZKqTXzECRbXcpa1nkae6hWe9Ei3oGmQ
         I7IVfC1SrEnIFxFtpLHOOM86p4JQIGqqxR54qyspqgo7iij3OhO6it3N/gv09JzR2JA0
         PXqvo5SV4d+FodQghtfruJNTPuHvtEWwhsPFWXfkH30WTVlHx8y1ze9gDJ/fXKa8MCZL
         3vdiRNHuz0cj24Qz5I2fI40vGm7wTj7WxvlyGfGNGhAZD45v1Er2+4pQWqaKHmFnlJ+W
         1CCTZgl9iqBGZQZYA5ipAhNoNOW7JIKCs1rr+rt6INfTfiSEDKw7BBKuMq+n1+wU6i10
         xgzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcoUWS6HWznojym4Ic4dyyxVnoWH4Vipgy+wpbAeU6973txAsTUMHZAf31a+g0S4Sv1Fp7vSe5W8ApebLM@vger.kernel.org
X-Gm-Message-State: APuU4Z/DhHkQAbUpvooxVjWzcIIM0euL4RD4FjQBX+MAeATMKKFLiWbA
	NJg9PXgr9dYNHo33i9G5mnHacyB3bTp1a6wJnuxQUifgmrAI2LePYOxdw8hd/6j2yInYFfQj1Um
	9C6dLnuPDl/cDH0UA/wwA7i3ZA37bfiR82GJhoAynxmuQNAnjOTLVqvLfVLib/BfP6UaQsePmE+
	Dl
X-Gm-Gg: AYBFou3amVEqbEpRpjFHSnc8V2eSQ4BgKFHUo0+xvV2ay9l/W9Drjdo0IHiQgU2oWkh
	ew8jYQXmWgiyFugDSvAPwSawcY9MNyUqcbJValYDu4Iz0huMQMl3cV0NXjtkz0PpY3/SyQEkF5s
	H2dR0Vbni9PVZSgO6I+L3gL8t+PST9hfz91TzgG+Jb4IxFgjc7mO6UQnrvX7lrGzmp+EyBYY1O1
	gzEAJU4XoqGknVDpi33phNDpzyYJPfDcmVaQuXeogOy+iX3iKgQASVciH38gNJjtgQrvhkoeqQv
	HpvsXEFyxe3mUr1AuYJDPW+gK81zu5oMcXm4xwE3broF7jQXZ7nhoqa/J9qqy4l6xI/ClJuwHhM
	8mcYCsIn6Qb2je6L+v0hyziYGdKzkDKHz6Iv/0oE352xpUYo0RZ9LKLMJnrN+EcvfYONGbLhyy2
	vvcA4unDzlH3Gh
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232511137.18.1793698950932;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
X-Received: by 2002:a05:6102:578e:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d072c3295cmr5232505137.18.1793698950432;
        Tue, 03 Nov 2026 01:42:30 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm24165306f8f.20.2026.11.03.01.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:42:29 -0800 (PST)
Message-ID: <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:42:27 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-25K=DURpYM96o8vMO8pkVr8uf=r2RAP-kcM=Rme=8JgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfX529uYGnZQkoN
 yq38A3Ci3J5Vb+y1WdTHU9eTE225cJzTMXbGaK6K/655UezhLJSKbEoR7i2YpQC8kM+pWfKfY3d
 w7i8CH8kfFDGZl71Yr3WJdDhH0xZuVg=
X-Proofpoint-ORIG-GUID: s0GvdQ_YyRjof2kwY5PLLyN6nCAeTf2t
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9ac88 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NJZkfsSwHKMJFq9xQC0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: s0GvdQ_YyRjof2kwY5PLLyN6nCAeTf2t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOCBTYWx0ZWRfXwgM9+u6t5buB
 FH95N0Hdz0Ij2WBJY6e7+Sto73yUSwj0g8OXKTgQPaa5Le/gDZOGG2OkkRrba9XNxz4m0wTLcOp
 JxFOM5QKTlNnBUKzPUlBsTL8yqq+aiPMAS16vpEcT+6ktumpJuss3omVoTlrO+EMsSWpwIDO2Se
 IbbxkB0Bz9+qM+SG1L5a3IMH+/BFjXU255GBEx5fvYgfBnbIkVB7YZ94fuwgnYqhhTz1demKli1
 Rz0BUxhrxwIqNSyaSipI4D5kTgwfC5i0cioamGaTebT9EvjqtT+787JOiWGiTBg0hIjX9U/HWpE
 yK+pMWerUJa/LiGMj013l5VL2TkezOYc2ttaidz7zzCKPg9fSs1ZBuugX5EmYoWP1r2OguAsYK+
 p4SPvch10fXXPq7r8FPi+PB6Jh3DrHsGxpgNNQwbkbxF0ShQ6WOkxlgoKnh+J1SzyO5RlciLkiq
 glBHj7lwe+ug3TkKq5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030038

Hi Loic,

On 11/3/2026 11:33 AM, Loic Poulain wrote:
> On Tue, Nov 3, 2026 at 8:11 AM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hi Bryan,
>>
>> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>
>>> In order to communicate to user-space CSI2 SOF events we will need to hook
>>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
>>> implementations of FRAME_SYNC have CSI decoders which support the event
>>> always generate it in our case if and only if an atomic user count
>>> indicates it should be so.
>>>
>>> A flag in the CSID descriptor indicates if frame_sync_en is supported so
>>> for each SoC that supports it this flag should be true. Since bool is false
>>> by default no negative enumeration of existing or in-flight CSID is
>>> required.
>>>
>>> Subsequent patches will enable on a per-CSID basis.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>> index a00791b00feb7..e9b399fcb9c7a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>  {
>>>       struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +     unsigned int i;
>>>       int ret;
>>>
>>>       if (enable) {
>>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>       }
>>>
>>>       if (csid->phy.need_vc_update) {
>>> +             for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>> +                     atomic_set(&csid->sof_seq[i], -1);
>>> +
>>>               csid->res->hw_ops->configure_stream(csid, enable);
>>>               csid->phy.need_vc_update = false;
>>>       }
>>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>>>       return 0;
>>>  }
>>>
>>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>> +
>>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
>>> +}
>>> +
>>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
>>> +     .add = csid_frame_sync_add,
>>> +     .del = csid_frame_sync_del,
>>> +};
>>> +
>>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>>> +                             struct v4l2_event_subscription *sub)
>>> +{
>>> +     struct csid_device *csid = v4l2_get_subdevdata(sd);
>>> +
>>> +     if (sub->type != V4L2_EVENT_FRAME_SYNC)
>>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
>>> +
>>> +     if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
>>> +             return -EINVAL;
>>> +
>>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>>> +}
>>> +
>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>> +{
>>> +     struct v4l2_event event = {
>>> +             .type = V4L2_EVENT_FRAME_SYNC,
>>> +             .id = id,
>>> +             .u.frame_sync.frame_sequence =
>>> +                     atomic_inc_return(&csid->sof_seq[id]),
>>> +     };
>>
>> On first look this was looking strange because the id is used for the
>> control id events not for frame sync. But on second thought it may make
>> sense, but the question is how the userspace should interpret those ids?
>> As of today userspace does not have any info for the VC and csid internal
>> pipelines (so called lines). So with the current state of the code
>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>> based on VC. So i am thinking of two options:
>>
>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>    and will be well known to userspace for which line is reported.
>>
>> 2. Add and propose extension of videodev2 documentation that
>>    id of frame_sync event types represents SOF per virtual channel.
>>
>> Personally i votoe for (1) because it will well fit with stream-api
>> support and usespace will have clear understanding of the SOF to which
>> stream belongs.
>>
>> Given this in mind it will be good to open discussion with Laurent, Sakari
>> regarding SOF event with stream api and GMSL cameras.
> 
> I think both approaches can be applied independently, forwarding the
> event through the VFE as event proxy would likely be a straightforward
> addition.

Yes i agree as well, but the first need broader audience and agreement what
should contain this id.

> 
> Note that the id here represents the interface index. While it
> currently happens to be associated with a VC, that is not necessarily
> what we want. Ultimately, multiple interfaces can be configured for
> the same VC.

Yes and that is changed with stream api implementation, and the
following question: what should be the ID when streams with same VC
are routed in more lines (hw pipelines).
But that depends on what this id should represent.

~Gjorgji

> 
> Regards,
> Loic

