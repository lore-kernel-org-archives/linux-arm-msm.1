Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA88346AE3
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789191272; cv=none; b=RD2LcJPudK4k5Hegd4f/4BJVoLfv0litw4IODsYunDqi0AEL8gcKAKH0UoK/57NfuYBDWsBGP6W1zZe/uR1poRc15yCVzudOCPDhxqLht1JAVoBOjAjSnQItgPgi+IHWqGGGQW1wFZm5lnFoBvUazqlg69IscPyOp8t6Az2ENko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789191272; c=relaxed/simple;
	bh=sJo34rQVqEpNknLIgZe57oTNIiOHak2toH2+M+rhl/c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LoPV7XeExzMG7y6rS1YIuuvEY4xXwnM1mLyK4DiaYO9E80nlgoDxcssvGTPaivXOn5kIg/wgmYELXcC0NfOd4CVgvQnsuvY/SI7fnC3aA+4LdQwU62iD3U0xVkTORo5NsXRYGbKTQerzDmznxp8f0tRe3nW1TdyaLkI6lFt5nhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXsNZ1C8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JttYIYRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXsNZ1C8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JttYIYRQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C4UQtp2053370
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=; b=TXsNZ1C85kfGa4Fa
	Kfh7VpGMDJUWnCJcTNwFBWtiPCf2cKMGiaYFpFtImLn+9XJKncI01crLY4TqQNcw
	oWQ6eUWiw7ANuHGXPvhoY5aEAUdm0v+WDpNk6eoaRWkCHt5KtNq/7P3YHSmibFF1
	GFhcES+MiZs/VHzqhAjVYZA9uq7AFM2egctf7Jixt3tg02kaRmRtMK/lFg7u6+jc
	6eNdy0Or+PJqf4A+FbQ2zKIMKnzyNwyCXcwxPTqUoYZwlL70TISJ5pZ5YP6Pjt7M
	Oz6T0UqsnX7+cgJBoXWOuIAUIL1YARxLVrCRKnWPXBQgsnoRTHCUMrMnUa2ubRgL
	4ruRJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d05eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 05:34:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so66588385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789191269; x=1789796069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=;
        b=JttYIYRQfxJ9egAKejk4TnQ6e0YOsP4XtVzKjf5TyxMcS6Bmm8jArOg4Ek68/mWI9A
         TgzfFywKB/yASt/FB9gOPtjxfoxqa8zV0l0CuZjNo5hWNgQAWbXYJjesuPIuP7PWU8uR
         tVcUtfAgqC7RafZD5zBai+ppggJLai9RiS/hhIn6WntSkL/WC7u+JvBNnWzDOXbtfrVJ
         zrEYxipVNjoiGLxZk1SQJRqCw2BedOJC0skSo9w+o4f6NTkVn//EvioojqftbwsQS8hU
         9kFA9GYPYHLEjYBwTPGCcoFAtz/4w+PqtfhhPE4erYvu1q++6eK3k5yJljdTTrDyBx2E
         MrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789191269; x=1789796069;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5iF7h3QVjHnRytjjjc/3dTT/X64vIbM+wfEJdjbcWWE=;
        b=pfhj4Vo2Zk55WH9kkB347lsvjG1cz3KQJWYLwxSDty2iE8KQBdJSGs76O+5CtxPvLM
         w9HmZuzLdD2uhHeKSfLd1Cr0VPfS4uEb4eBatrOGyfbA5jT35fcJ4TMA6RXGP5tvpn/W
         P3Fx06xpyh/lDzZ1pXpiU+5U1PcbE1YzUU6Yyh1CrrfMBMT34OVQjPdTHEIkK7DhqeeB
         dt5zt6SH4h7QZSNs8HUVO8CPc4SfOdP6SlQwSbHsuGNpnN02PDegpHU5Jg45Ev1H++vg
         MEP6A9oNUOq+SVibAvtkfhpMGz+1L7VToq/Y2QbPBeAjeldMvhIdc/g9se4q/dZcyS7S
         6usg==
X-Forwarded-Encrypted: i=1; AKwUvBzL1IHydyO2+MwkiqDMVRWXFkYHuLcq1oIl2ktoTgTQqS1yDrLNWzri3EYNrB4o5zIW1OsZrG0KMteba0Cx@vger.kernel.org
X-Gm-Message-State: AFuF++kwv2Pq+eK53Y6DS1D+41XvvWCOJEpUlt4h4C81IpcaUZxjvH7/
	mqGrYsk8ISBqy85Vulb9uMl/JqiZqzSYEaD51r1tPxiL+Zx0OO6e2AXuYAaqkJGSpwosHX66Q1Q
	jhJfCKOveFfVrfXVeST9YGt1EMJz3Q6mwAU6DZ8naRTocAP2ZwQTqiCJGteolqpY3n0D8
X-Gm-Gg: AYBFou1GDC+pzE4dywwsAKP4vR/WCUYEqiX6NX5zkpRrF67VcRQrtycMOXEI8ZQjmoD
	Q0oOoTY1EA/h/W6IcEaEnMdhvnbJxCa9skXkgJZhiWhweNicGssNh8w34MEGI24JaZNm/prW6vE
	+tiHaCMsssbgcY/48CynvDqxTjneinU3CDpsgBz62iPI7sCxXuVFM4+4/cPoRrYbyXxZJ4Ks7vG
	2aYdktA8RrIyk4uO0ZU0Ftir7fqE5Z1RdDDBBBUQQ6sPpGwf79DniblAM4hmabwoUmjZtGc1FAW
	2DQpzqmskK7YN+fOpDRV5/vj/wBIYtIJaDm5/jEtZdi5EEZQgsd09J8LneriUhjxTZaSPIrYUh7
	D0px3bI7OczgSY8I49G6sHDAbUzGzsY82sSRiOsIj
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr214105285a.5.1789191269294;
        Fri, 11 Sep 2026 22:34:29 -0700 (PDT)
X-Received: by 2002:a05:620a:288a:b0:939:ede4:a499 with SMTP id af79cd13be357-93a035f328dmr214102585a.5.1789191268738;
        Fri, 11 Sep 2026 22:34:28 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm186614475e9.14.2026.09.11.22.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 22:34:27 -0700 (PDT)
Message-ID: <58ca2ad9-cfc8-46e9-bbd6-4640b5edd69c@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 08:34:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
 <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
 <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDA3NyBTYWx0ZWRfX4dsBRpX4Cxy+
 7OexlmNR/d6B7iK3z31Q2uewsTVgdG00XXrBPn7JzoFTKkaDlpP+EUHX/itRDLWLAAgHXkZUD8S
 iHN1MTltuCCBxhvQ5lD6xMS+uMEgEtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDA3NyBTYWx0ZWRfX2rSjmqdnp00j
 AeiB//IMZhaSs7H4+u6JFFJeNLBv/qJEWjDpSOm+e9UQzMDFQwHs2hsZTZAiNLl40+8nzaZpEkx
 RYxMIDZBseYDdHtYH6RJGcuqBKSKVH7valVYaAPJGFpV/ND6ADgtzZfiW4x8tFD3b3Vn5aNY//I
 AvVqnlhoKRYbtN2RYNLd/3llcICddsJQws10I5oA5LM45j23JD+oPy815Ziwbm4/U8JamOI0p3o
 0J4n7t5OV9a/+b1WmYd0TPOQC0FMQdcanKEdRP8DPHdRC1xhSqmczJCe8GrIe6+jA4/jOgywlIM
 UQ4R7xj02u/B7Tt1zuY7OJ7lxYuXh707lCGYpfZfNKXGi3r3lvxrjUdpsnsChziBwBu6HNS97lD
 p9Zgrv+v27AO9SBKYnCmC8okzPdrXdRjSyQR4byEdlV3EtY3vhGae/w0F2Ijj2Wn4iPC14pxnau
 2rBCJmGJbFJIR9J+uIg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa4e466 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=F_M2Yv-rfSBzxpAF3TcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cZLXnudY3yrhNd5GQkREUOyaOXjRiR5o
X-Proofpoint-GUID: cZLXnudY3yrhNd5GQkREUOyaOXjRiR5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_02,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120077



On 9/11/2026 5:17 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Loic, 
> 
> Thanks for the review,
> 
> On 9/11/2026 4:30 PM, Loic Poulain wrote:
>> Hi Gjorgji,
>>
>> On Fri, Sep 11, 2026 at 8:22 AM Gjorgji Rosikopulos
>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>
>>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>>
>>> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
>>> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>>>
>>> __csid_configure_rdi_stream() now takes an explicit data type parameter
>>> instead of deriving it from the CSID source pad's format, since the
>>> streams API keys each stream by stream_id rather than by pad. The
>>> existing configure_stream() path is updated to pass its per-port format
>>> lookup through to this parameter, preserving current behavior.
>>>
>>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>> ---
>>>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>>  1 file changed, 51 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> index eadcb2f7e3aa..2512cdb16d94 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>>  }
>>>
>>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>>  {
>>> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>>> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>>> -       const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>>> -                                                                  csid->res->formats->nformats,
>>> -                                                                  input_format->code);
>>>         u32 val;
>>>
>>>         /*
>>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>>         val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>>         /* note: for non-RDI path, this should be format->decode_format */
>>>         val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>>> -       val |= format->data_type << RDI_CFG0_DATA_TYPE;
>>> +       val |= dt << RDI_CFG0_DATA_TYPE;
>>>         val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>>         val |= dt_id << RDI_CFG0_DT_ID;
>>>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>>         /* Loop through all enabled ports and configure a stream for each */
>>>         for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>>                 if (csid->phy.en_vc & BIT(i)) {
>>> +                       /* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>>> +                       struct v4l2_mbus_framefmt *input_format =
>>> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>>> +                       const struct csid_format_info *format =
>>> +                               csid_get_fmt_entry(csid->res->formats->formats,
>>> +                                                  csid->res->formats->nformats,
>>> +                                                  input_format->code);
>>> +                       u8 vc = 0;
>>> +
>>>                         if (tg->enabled)
>>>                                 __csid_configure_testgen(csid, enable, i, 0);
>>>
>>> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
>>> +                       __csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>>                         __csid_configure_rx(csid, &csid->phy, 0);
>>>                         __csid_ctrl_rdi(csid, enable, i);
>>>                 }
>>>  }
>>>
>>> +/*
>>> + * configure_rx - Configure the CSID Rx front-end
>>> + */
>>> +static void csid_configure_rx(struct csid_device *csid)
>>> +{
>>> +       __csid_configure_rx(csid, &csid->phy, 0);
>>> +}
>>> +
>>> +/*
>>> + * stream_id is used directly as the hardware RDI port index below. This
>>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>>> + */
>>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>>> +{
>>> +       struct csid_testgen_config *tg = &csid->testgen;
>>> +
>>> +       if (tg->enabled)
>>> +               __csid_configure_testgen(csid, 1, stream_id, vc);
>>> +
>>> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>>> +       __csid_ctrl_rdi(csid, 1, stream_id);
>>> +}
>>> +
>>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>>> +{
>>> +       struct csid_testgen_config *tg = &csid->testgen;
>>> +
>>> +       __csid_ctrl_rdi(csid, 0, stream_id);
>>> +
>>> +       if (tg->enabled)
>>> +               __csid_configure_testgen(csid, 0, stream_id, 0);
>>> +
>>> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>>> +}
>>> +
>>>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>>  {
>>>         if (val > 0 && val <= csid->testgen.nmodes)
>>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>>  const struct csid_hw_ops csid_ops_gen2 = {
>>>         .configure_stream = csid_configure_stream,
>>>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>>> +       .configure_rx = csid_configure_rx,
>>> +       .enable_stream = csid_enable_stream,
>>> +       .disable_stream = csid_disable_stream,
>>
>> Would it be possible to leverage the existing CSID configure_stream()
>> callback to implement the stream API? This would likely require
>> reconfiguring all CSID ports whenever a stream is started/stopped, but
>> if the configuration remains unchanged, I do not think that would be
>> problematic. That said, we probably need to address the current
>> ambiguity between the concepts of "VC" and "PORT" in the existing
>> drivers first.
> 
> I have experimented with something similar, we know in advance which
> streams will be routed and active using stream routes, we can enable
> them in advance. The drawback of that was that all the streams (even inactive)
> will be enabled when first stream is enabled, but that is the case even today.
> 
> What you propose is something different, but that will require changing of the existing
> api and verification of all csid implementations, i am ok with the proposal 
> if someone can help with the verification of other devices.

In addition using configure_stream and one api for multiple streams will make the interface
more complex. We need to extend the interface with stream id's and pass vc/dt for each stream.
I think that current enable/disable stream is more simple for this implementation.

~Gjorgji

