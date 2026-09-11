Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1D93515E6
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136235; cv=none; b=uV0iGc/Tls+OvY46P6HTa8CE21nWKkmPJTCEKpV2pirw8haMEQX3k/39exgKfbBJq+a6b19SNtXg5rcmCWJ14vXObAdqirIsmm36G59YdZjBHchRcMyu6PiLkh4ckkb1DyO63Ad3CBdk6ajrCVKxAKj8GgHw1wXE0iwnEeCkvh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136235; c=relaxed/simple;
	bh=PdUThxGT2s2FT2q3FWPuvhvZa7Myac50FYCC25nfC88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHfQ08appMuJuTK93wJZwYlLFKhMgtkQLvUtTehXaycRcXKaOfO/wEaeg6mCt0PvACgePo2XsuTf4wHrQZbgBfg62vQWtOmBU8sgW77qMu0DPEb/j757wZfbENirBnXPg31zFvrw5YucUsWGIRGmeIG+GfTxXzH6AkR21diNALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4RLqJvh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLMCZval; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4RLqJvh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLMCZval"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCisxc2978648
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=; b=j4RLqJvhcX4IcxuG
	WjvrwDfZ6upeNkpQuwG8cKwYk2XajN3wrIKcCmidK9S8QMvH5boSOSwwOFB2Bd7P
	wNDLKeipmBqut4PVzoFhOlgyxemzrrLjSgS6w0axvwAn1f3iNmgaGN02byFKKSlu
	NubByTBDPe51KzoNx7HI6kFyIvEKiO0vcLzYcdA0fZzKELlIXTJLXyrVKvkqOiBl
	cEl0lB0HJAm2U7CG8aA9VgceyBSSX1rNyX+JRdrxw43EOg6662i7lZKZZYlFfH3z
	SwXqR8dxT9O52tCahYfTQ+VxoNa+RaNG4lhvYit6+gsTTJrW0pu5PG+Lu6TlCHVX
	TcBVjg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucjv6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:17:12 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78fb21aaad9so825125137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136232; x=1789741032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=NLMCZval7R24+wRks5lF7On9DRdTY6HSmlzxMNB/qXq7NXCrkE9uznx6RGTmR4RrOI
         QRJ2Zrw/rsuC/JVnWnbNzz9/Fhmtg/1K5053EsTYqWpkc4LCfRL2xBDFo+xTiLEWHGqi
         Un/IGZzasAZ/BwAc5pmI9QNyh57DQgPZ1gdyUcFE6cNA31JUU+p+lycRf02OVxb1jgX0
         6oikuDzzwVyQb1QkTbqJjbyHgXPsKguvvXpWAqxQ/9ekMD/MCVIdTPFjBh3KfamY3Lvt
         Fy5Tu0eLZifdF3pNKvBHubh/Xl6cSoIWBLwjOdgWOPsU7xhdVyCQ2kEuh/RDxqCRQKoX
         Z4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136232; x=1789741032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vOdWM4x7tWb8pGfXz6ppZ73GwTF8uMM71InxBYAyQY=;
        b=QHoMgQ1XOU7fk9n0wygAbJeTRHEdv37E025ZPgAVELU8emM0KU9+tn2iZrudB9s+vw
         /elpJMyZnHpyVMLGe/LAFfiW+dh55amZCq/lbOSEE7z0YqGpruCKb+jrZuvl9CNJ8wPZ
         slIzFc1/20664Vj5yqeu6HTczqNrchUfRGlXFDxBZ0uJmM/Qbkp3pPPyf0cQx8GuVUmu
         NwRaYLnaskHV10Ib+Mke0BV2ME0rKeQEC1vVC5qGvX6f/Ufl+7d6OzficJ5D/I0WbLph
         NT683rnjHh7kJjGRVx7cOkr34otLIjJMqVBL2aN9lS2RmDtiL9VwMbFR5zQvMgeAB+ZF
         iopw==
X-Forwarded-Encrypted: i=1; AKwUvBy5+ginQSLzv07ipkbSbG8eRvu4Gb4i+faRsC8BtgdDx9ZbxmakQrnl+pgBeS3kxQV+SPuomzSyDHmH3gWW@vger.kernel.org
X-Gm-Message-State: AFuF++lzb/kG2vtv/QbE+hP/XI3GcFGFCW3DQ/ZbmSMwQL+AmTHrbE+z
	x0GE/2NWqF95cCIy3zW5tj2KZBjEP7nbKSGyB1MXtTfL0zMTzw8ymCofPVCkKi+t+kHnjlzkFsD
	lkrZpWKZdqoLEmRM4lXq9tdcqMn+sR4bTsTloNHS/SPp8Q8d9VmhwyPapAyeGoPPa0AbL
X-Gm-Gg: AYBFou24M8hUbL0FjcEagnhR3hX8fCScXQf9qYmJiUiSvNISVpsfhtlrAwbUk/Ds9AW
	ivfEWPBAqHG0hXGR6aBon5aNzMotg1G8UE3Wu8Ds5OhRE0jdbaTYQBedSsZM8nvY0AYoZyNX210
	SP92wI9zfHrgINp66v+NX7p8IBJQOnuYrojpxMpWcZcNxSjJqOnTV6fEx3nifxrnns62SxRF5Fd
	ukrGbRsRtQIkQ01s/PzTykLn41iWcsxxqgNxyZkntgFscqivhUpEy1YNqaUOnKlG+zxfuUwGfh/
	/frHOOHScFoSFViwec3ZcjYbOkUJxdgVqVW9Yuef9HBUrmtbHjUg6ZxeeEuDOSPR5sQoa0dQIQ1
	v0JN7SP9cVLLvd66JfgAU7J8oQxHn4hCSJGTR11H5
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008680137.21.1789136231581;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
X-Received: by 2002:a05:6102:2410:b0:78a:5bc0:4b7b with SMTP id ada2fe7eead31-790db5f66f5mr4008643137.21.1789136231130;
        Fri, 11 Sep 2026 07:17:11 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6687a1basm33854135e9.12.2026.09.11.07.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:17:10 -0700 (PDT)
Message-ID: <f8601f35-75ce-4419-b4e0-4b2dc162f3fb@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:17:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
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
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1+g+kpevwUyXb2+0M4H5NPtz=2bc-CRfzyhOukRAn7VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa40d68 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JnRjegRK6RYr0dtFBawA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfXwNU+3ifJVMn3
 HkS7VV+d6GH93qn3D/3f4H6kpkJn6mpelz5c011fGCdE3hX7yjEdv8/vZt24aKB5Glz1IKQ6hOk
 ujEqJPHnDMEcMYOSy3TNqTuOgB4G79t66iSRswJeSDn2G/uNyTR0ei+2tXMNN6mQVrU7t/ond9I
 ByLWVZY1uFtJWqVSNETDzXHzlxOMbXaEwSipBTvIslXOyvPYMO7q55cSFCe0OZXebDaA84BofLH
 Vcn9Av2/JRqLUQDHzkp2VziwuDs5Y5fqtIPFUMigyB0oMZeK/nKb3yvW/2KWbfemNDJsO9VJarR
 CJ/mznHkLUEHzWUI2q71YsuZME8CRBgRaoVFDTyGqhiaHC3RzLq2WXCBU3b1KiADJWQWkuDnDZ7
 6DrMTI9ig2v88NPVHtckOzxyfGYgWlzcQHBihlwnpDeirSoUNUDcnbA3+ZCkJI7rY+XpRzLREsE
 UqE+5fWIQy/zXF+yk1A==
X-Proofpoint-GUID: qNpxbE-iZQ3jzPsJ_1-NDv_yRxKScFES
X-Proofpoint-ORIG-GUID: qNpxbE-iZQ3jzPsJ_1-NDv_yRxKScFES
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMCBTYWx0ZWRfX3aieViayNWjG
 Da3KRkmDuhF2ISN5HfbGtLLDuJD5pWhmDUfxqAhtuJD7OnL2xbJZDpzBQvQFJnRq7cNNMAfore8
 eW6s4iUxK8bR/X8/mOaJDEDStl+VcaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110200

Hi Loic, 

Thanks for the review,

On 9/11/2026 4:30 PM, Loic Poulain wrote:
> Hi Gjorgji,
> 
> On Fri, Sep 11, 2026 at 8:22 AM Gjorgji Rosikopulos
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>>
>> Implement the configure_rx/enable_stream/disable_stream hw_ops added to
>> struct csid_hw_ops, for the gen2 CSID hardware backend used by SM8250.
>>
>> __csid_configure_rdi_stream() now takes an explicit data type parameter
>> instead of deriving it from the CSID source pad's format, since the
>> streams API keys each stream by stream_id rather than by pad. The
>> existing configure_stream() path is updated to pass its per-port format
>> lookup through to this parameter, preserving current behavior.
>>
>> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
>> ---
>>  .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>  1 file changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aa..2512cdb16d94 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>         writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>  }
>>
>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>  {
>> -       /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>> -       struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> -       const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>> -                                                                  csid->res->formats->nformats,
>> -                                                                  input_format->code);
>>         u32 val;
>>
>>         /*
>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>         val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>         /* note: for non-RDI path, this should be format->decode_format */
>>         val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -       val |= format->data_type << RDI_CFG0_DATA_TYPE;
>> +       val |= dt << RDI_CFG0_DATA_TYPE;
>>         val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>         val |= dt_id << RDI_CFG0_DT_ID;
>>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>         /* Loop through all enabled ports and configure a stream for each */
>>         for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>                 if (csid->phy.en_vc & BIT(i)) {
>> +                       /* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>> +                       struct v4l2_mbus_framefmt *input_format =
>> +                               &csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>> +                       const struct csid_format_info *format =
>> +                               csid_get_fmt_entry(csid->res->formats->formats,
>> +                                                  csid->res->formats->nformats,
>> +                                                  input_format->code);
>> +                       u8 vc = 0;
>> +
>>                         if (tg->enabled)
>>                                 __csid_configure_testgen(csid, enable, i, 0);
>>
>> -                       __csid_configure_rdi_stream(csid, enable, i, 0);
>> +                       __csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>                         __csid_configure_rx(csid, &csid->phy, 0);
>>                         __csid_ctrl_rdi(csid, enable, i);
>>                 }
>>  }
>>
>> +/*
>> + * configure_rx - Configure the CSID Rx front-end
>> + */
>> +static void csid_configure_rx(struct csid_device *csid)
>> +{
>> +       __csid_configure_rx(csid, &csid->phy, 0);
>> +}
>> +
>> +/*
>> + * stream_id is used directly as the hardware RDI port index below. This
>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>> + */
>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 1, stream_id, vc);
>> +
>> +       __csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>> +       __csid_ctrl_rdi(csid, 1, stream_id);
>> +}
>> +
>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>> +{
>> +       struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +       __csid_ctrl_rdi(csid, 0, stream_id);
>> +
>> +       if (tg->enabled)
>> +               __csid_configure_testgen(csid, 0, stream_id, 0);
>> +
>> +       __csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>> +}
>> +
>>  static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>  {
>>         if (val > 0 && val <= csid->testgen.nmodes)
>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>  const struct csid_hw_ops csid_ops_gen2 = {
>>         .configure_stream = csid_configure_stream,
>>         .configure_testgen_pattern = csid_configure_testgen_pattern,
>> +       .configure_rx = csid_configure_rx,
>> +       .enable_stream = csid_enable_stream,
>> +       .disable_stream = csid_disable_stream,
> 
> Would it be possible to leverage the existing CSID configure_stream()
> callback to implement the stream API? This would likely require
> reconfiguring all CSID ports whenever a stream is started/stopped, but
> if the configuration remains unchanged, I do not think that would be
> problematic. That said, we probably need to address the current
> ambiguity between the concepts of "VC" and "PORT" in the existing
> drivers first.

I have experimented with something similar, we know in advance which
streams will be routed and active using stream routes, we can enable
them in advance. The drawback of that was that all the streams (even inactive)
will be enabled when first stream is enabled, but that is the case even today.

What you propose is something different, but that will require changing of the existing
api and verification of all csid implementations, i am ok with the proposal 
if someone can help with the verification of other devices.

~Gjorgji
