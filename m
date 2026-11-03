Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701581;
	b=4c/v0iVmpgaRg9o7POrDwl/IneLERcTWxoWF6s8Q1oUWexiXlQzvph1ZE9isrCg9AKhZ
	 kc8DrwDSaYiUsY5P8M6BzxBEGZpWDG4pZaDSS4abl+Tdm8Vpxn6gQFRMj6qEhnLKy5V0t
	 6UE9RImwRCIgUbx/pnVf5jv6EwlI9YILONwpAbIGsXkTXTmVRqByF2ov184vpNANM2G5U
	 S3qqaXSIEpfGcWOEOTe+Ia1hzPips4FAPufE/KugO1gvNFd7khdfsNCOFiQRdpzo2wzep
	 SyKS1Aa44YZsMPWh3M6xBwboe0+dfGN83aO44CwgvcCIAxptsKC7qmSvuLj76mpUYmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G/hFiDfbsTUDkAI0ETjqYKL/E+ZsQJUjB0QzXiT5OYo=;
	b=GYRWFhhpR434YhzPbKDZ/ijUTRAYe7BgBN/vqRnRO66sH7GvVAh5ojYdoaf2SmYiQcQw
	 sDyapZfcUclDSREEdO7qHipLn0EZ2btEIoGv+siLU8Dr0397QpDm0Zja7vw3J5BDPO65A
	 zH1eV+mUhOdI5+cbJ7v9FheMTf9nvrxKVh7fuYgErEwhIOw40s8gYfeQiNRv4+v++X55Z
	 8iIZ3RwEVyjUCWDd6WmkfD9i+6j12o+RtTjJD5S7e/Jm+5P+ZWjcwGbf1zUmGEOWSslxF
	 2WXfOBphXMHuZkLlXTB92gNbRPoEWsEMJjAmifAHdihQzAwXohS9gq6PYp2+qkhCdGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wx6+ayHp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRXLAxaI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AF608361C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886AF608361C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wx6+ayHp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kRXLAxaI
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA2qM3577814
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/hFiDfbsTUDkAI0ETjqYKL/E+ZsQJUjB0QzXiT5OYo=; b=Wx6+ayHpf4xQ5OFJ
	gCDOMPBkbPE7aKnDjqfaVGwvx+oayOEGfmVSdQB4LNmqcx42u4GlqZ2bdZSEU+p7
	qzzRGrB5rFwNttPwjAN1eINbVBwIBzk/GCIaJTVcjZGVZbpUdrjGOGGDhLJSAA1J
	EX1Dzv951fxzKLIVSP6bg5SomkB60aMJuT7HGFlWA+43BN0P7a3T0yf6dcKm8INm
	FHiWPEL/bp8YT0R47Jw6YmZPG2reLerrXnQOejjtQIGY7S1MxpvK5BG82Y1Ol8Eg
	26FD3f2l1okIs1v4dcr0PJHgUU6D4EZwibX6jJSR15nD7MTWCR7JTUZROXeQI7W4
	foWEhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d9nfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:26:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so779792385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793701579; x=1794306379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/hFiDfbsTUDkAI0ETjqYKL/E+ZsQJUjB0QzXiT5OYo=;
        b=kRXLAxaICA9xb47VWMyzpk7rc1Zr3IOzZCY0gNHmv/D88yUXh89BrH7UZR96rmcQFT
         ik+QbUhj6tjaW5u9y3PcF7ERchPfwhCNijaSQj/isoiTmsB3t7s5v52hVYPDBTGBW20t
         lVUIkbp8AqGe3yeRdJAU9675QOj3NLKgCgFSCF0dASEHFMpKyAc9Wyqb6ygTt9jRHhSz
         MZ+ZQIlCZI4DZ6VBm/oSq2sTJTk7gXqNzFAl5wab6Fa2Iyo/X/FCO0U2L33hFGNlRJlH
         womw7ZvbVOZqoGDIMdUm0xp5nzok66lV7aTw5AStu+2VQhSN1730/+j9c5MuLy/frUyI
         oLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701579; x=1794306379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/hFiDfbsTUDkAI0ETjqYKL/E+ZsQJUjB0QzXiT5OYo=;
        b=K5rp2G/Oxc5/GQ2K41sSpUyuDMJx3DhPSk0Vkc2PjIqaYq1XQ6FL3FqX4tvn5x8Fpp
         7oNSvuzjHE/ykdqbykydE8Fo92sJvXmPn90bXNAa2FeMUM+S//BYeFEMF25cHQ99i5O2
         e19EXWzdh9RKokRfVnTAsxBNQxxgOnUHQ2AG8/WuiHG3pkZUezHmchGhZMMsC1FvJDhV
         dl0wa8rgBxxG01tsnMj759cuhYmSuAXg1KOkpgf1LMPgHEsF8BfzdnmLLeZJYT5PeMwm
         jQ/nqMxp4uCLHQBfEFXXKw4mkJpLk3BfQnC51ffSsP7tQif8PAmMUWuFcnA66+1FyRp0
         0zkg==
X-Forwarded-Encrypted: i=1; AKwUvBw0rDrKxXgX2gi7qWfFmIIWzwWttmPoXAkrXVYyjL2eAb/+3JKZ8kyl4sjMGzawnxAekIt+C3fS9z7l3fTA@vger.kernel.org
X-Gm-Message-State: APuU4Z807Dt0sdvdSaKqxkVen5NoTRBx+3lFMPk7pbYxidyDFLo3SZz1
	/H7GsejXs25MRRu2sRNBgIw30U0+uhkJmeMResTztiRuWvjviSm8DGGDsFWlwOhAUblHYi8985E
	RyYbvKlR0Hk62PQu7BDa37c3hHHdA8GP6rd0ALQYDkrquEW5rAocSmUJObBfnCuXB1Nc7
X-Gm-Gg: AYBFou3PGBSzNrdEljn6/+0UPCxIPe2ZFuu/DjQgIA+MUihs/lBQlzz2ovnOIgsGdEM
	IfUqvxeygB8nAhwH1vYAWD2jGLyMGqcafdfX7IrIcmfdICZO7YjVXj6/9RuolX7izGh4voKzAjT
	H8FaKzIQf1pxToM7eRNJlUaQLyQP3m9OWsBPSu6y7HL5On4X13XCjTo8ONbcIFqJ60RESPmmG3t
	HlCeitwbU4iLilpd+y5Eci6o6GcH6OF4CyZoXy4PrNpzFFtw4m4OUNyRf1wwMBbM7T+85d7kUuK
	ZkP51nfe3l0kQCVzaBOdQRvER9OPuC9YlQBTzWc22SJr1xJV0wOHs8OPcQK4WAS159uGHSpTWua
	S5rjghb92ScinzQ7AAIeHTarTizGLbU3j3oQ1CiY+tuCBCC8cfLDaZuga7iC85pPWSgF+SeRF2r
	Us+yoNB/hXS6/K
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr2198196785a.63.1793701578582;
        Tue, 03 Nov 2026 02:26:18 -0800 (PST)
X-Received: by 2002:a05:620a:4509:b0:93e:85a5:226f with SMTP id af79cd13be357-9442180d5cfmr2198193685a.63.1793701578018;
        Tue, 03 Nov 2026 02:26:18 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm67243975e9.13.2026.11.03.02.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:26:17 -0800 (PST)
Message-ID: <47af5550-9f4c-4df8-860d-d4250b110057@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:26:15 +0200
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
 <95d29a93-fcd1-4aad-a6a9-711c8adf3854@oss.qualcomm.com>
 <CAFEp6-0RMZuQko=DdJmpGg64piMX-udW1ZG0jpGkHNTuU7ozqw@mail.gmail.com>
 <CAFEp6-2f6Bgv3btgry=hjeNug5UO301-9a21G5VeiUsUi6P9=Q@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2f6Bgv3btgry=hjeNug5UO301-9a21G5VeiUsUi6P9=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9b6cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=hV1mDHkiH9fXcscWVXwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MSBTYWx0ZWRfX7a4x8q3o2kwQ
 QKupzVhBSdlj48zQ42sot9pv91JJ4gyAcbnBNhrmWEHOFlQz8ZeNZRGNrk9Nv6JQBkwPXOXWpT7
 r6avjbBIGUuvXVqNWKXwglv6Eh6WxgI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MSBTYWx0ZWRfX1s76VGI+yMTK
 9uHTWKlhj/J6alYxxglZj0/ECitpRp87H0Q7G58GkBj/3C8y2o252S6PSkCAGs0WGBxBqQ3jd0D
 z7Cejqz6XJc7UsauDpQSKLPMtQ6Hy4UD/nkgw4EnoYZWZIl/T5sIciGEwYvdVb4QA6eMVhj73BH
 DY4Gu3PRj/bmbV1yGWJa340ck8g1hnd3kYLGHuc7H82RtU1KBXefT2c1lWMXkyQ3G++tx/54tbk
 QqexbCv1p1YAcHmJRzJV+eUBKVPFp0NhhlXQH8oqkndkv57FrOPs9DccBfMjrFw9WKgOuoEMowv
 g1ncg0RPTzQfhj0qc7JjzrOdYQ7L9NqwQtCSYIXQfE9dS9YOm8T3ZEm4PIdbdU3+K6i1Kn7pZck
 QY42FNrzJ4VSDo1XxBEMIIUJdj/yO1ucENAw4B7lsFB0R5pHADqXKjVCYN611LX+KuWY03rs6p4
 hqZ/xrzIFioRTFUFZyQ==
X-Proofpoint-GUID: yZcMv4VOqIzK5Zbu4eVx-czx66Z3n6f3
X-Proofpoint-ORIG-GUID: yZcMv4VOqIzK5Zbu4eVx-czx66Z3n6f3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030041

Hi Loic,

On 11/3/2026 11:56 AM, Loic Poulain wrote:
> On Tue, Nov 3, 2026 at 10:53 AM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
>>
>> On Tue, Nov 3, 2026 at 10:42 AM Gjorgji Rosikopulos (Consultant)
>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>
>>> Hi Loic,
>>>
>>> On 11/3/2026 11:33 AM, Loic Poulain wrote:
>>>> On Tue, Nov 3, 2026 at 8:11 AM Gjorgji Rosikopulos (Consultant)
>>>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>>>
>>>>> Hi Bryan,
>>>>>
>>>>> On 11/2/2026 3:56 PM, bryan.odonoghue@linaro.org wrote:
>>>>>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>
>>>>>> In order to communicate to user-space CSI2 SOF events we will need to hook
>>>>>> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
>>>>>> implementations of FRAME_SYNC have CSI decoders which support the event
>>>>>> always generate it in our case if and only if an atomic user count
>>>>>> indicates it should be so.
>>>>>>
>>>>>> A flag in the CSID descriptor indicates if frame_sync_en is supported so
>>>>>> for each SoC that supports it this flag should be true. Since bool is false
>>>>>> by default no negative enumeration of existing or in-flight CSID is
>>>>>> required.
>>>>>>
>>>>>> Subsequent patches will enable on a per-CSID basis.
>>>>>>
>>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>> ---
>>>>>>  drivers/media/platform/qcom/camss/camss-csid.c | 54 +++++++++++++++++++++++++-
>>>>>>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>>>>>>  2 files changed, 65 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> index a00791b00feb7..e9b399fcb9c7a 100644
>>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>>>>>>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>>>>  {
>>>>>>       struct csid_device *csid = v4l2_get_subdevdata(sd);
>>>>>> +     unsigned int i;
>>>>>>       int ret;
>>>>>>
>>>>>>       if (enable) {
>>>>>> @@ -778,6 +779,9 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>>>>>>       }
>>>>>>
>>>>>>       if (csid->phy.need_vc_update) {
>>>>>> +             for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>>>>> +                     atomic_set(&csid->sof_seq[i], -1);
>>>>>> +
>>>>>>               csid->res->hw_ops->configure_stream(csid, enable);
>>>>>>               csid->phy.need_vc_update = false;
>>>>>>       }
>>>>>> @@ -1316,9 +1320,57 @@ static int csid_link_setup(struct media_entity *entity,
>>>>>>       return 0;
>>>>>>  }
>>>>>>
>>>>>> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsigned int elems)
>>>>>> +{
>>>>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>>>>> +
>>>>>> +     atomic_inc(&csid->frame_sync_users[sev->id]);
>>>>>> +
>>>>>> +     return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
>>>>>> +{
>>>>>> +     struct csid_device *csid = v4l2_get_subdevdata(vdev_to_v4l2_subdev(sev->fh->vdev));
>>>>>> +
>>>>>> +     atomic_dec(&csid->frame_sync_users[sev->id]);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops = {
>>>>>> +     .add = csid_frame_sync_add,
>>>>>> +     .del = csid_frame_sync_del,
>>>>>> +};
>>>>>> +
>>>>>> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
>>>>>> +                             struct v4l2_event_subscription *sub)
>>>>>> +{
>>>>>> +     struct csid_device *csid = v4l2_get_subdevdata(sd);
>>>>>> +
>>>>>> +     if (sub->type != V4L2_EVENT_FRAME_SYNC)
>>>>>> +             return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
>>>>>> +
>>>>>> +     if (sub->id >= MSM_CSID_MAX_SRC_STREAMS || !csid->res->frame_sync_en)
>>>>>> +             return -EINVAL;
>>>>>> +
>>>>>> +     return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
>>>>>> +}
>>>>>> +
>>>>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>>>> +{
>>>>>> +     struct v4l2_event event = {
>>>>>> +             .type = V4L2_EVENT_FRAME_SYNC,
>>>>>> +             .id = id,
>>>>>> +             .u.frame_sync.frame_sequence =
>>>>>> +                     atomic_inc_return(&csid->sof_seq[id]),
>>>>>> +     };
>>>>>
>>>>> On first look this was looking strange because the id is used for the
>>>>> control id events not for frame sync. But on second thought it may make
>>>>> sense, but the question is how the userspace should interpret those ids?
>>>>> As of today userspace does not have any info for the VC and csid internal
>>>>> pipelines (so called lines). So with the current state of the code
>>>>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>>>>> based on VC. So i am thinking of two options:
>>>>>
>>>>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>>>>    and will be well known to userspace for which line is reported.
>>>>>
>>>>> 2. Add and propose extension of videodev2 documentation that
>>>>>    id of frame_sync event types represents SOF per virtual channel.
>>>>>
>>>>> Personally i votoe for (1) because it will well fit with stream-api
>>>>> support and usespace will have clear understanding of the SOF to which
>>>>> stream belongs.
>>>>>
>>>>> Given this in mind it will be good to open discussion with Laurent, Sakari
>>>>> regarding SOF event with stream api and GMSL cameras.
>>>>
>>>> I think both approaches can be applied independently, forwarding the
>>>> event through the VFE as event proxy would likely be a straightforward
>>>> addition.
>>>
>>> Yes i agree as well, but the first need broader audience and agreement what
>>> should contain this id.
>>>
>>>>
>>>> Note that the id here represents the interface index. While it
>>>> currently happens to be associated with a VC, that is not necessarily
>>>> what we want. Ultimately, multiple interfaces can be configured for
>>>> the same VC.
>>>
>>> Yes and that is changed with stream api implementation, and the
>>> following question: what should be the ID when streams with same VC
>>> are routed in more lines (hw pipelines).
>>> But that depends on what this id should represent.
>>
>> Yes, then maybe option 1 is the way to go for now.
> 
> Also noet that vfe_hw_ops already also have a sof callback already,
> maybe we want to do something with that as well.

Yes i agree. Apart from that for pix path we may need sof in vfe as well.

~Gjorgji

