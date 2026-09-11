Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299AC33A9E1
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135790; cv=none; b=nTuicISSW6EsBvi05ZlssFWfdaSVp5B7+i2aHAhviJa5eT7lDYEHBXEfbqIZRKyUyFwmJjZRURDLXlEcOxxEs/YLHGesSrgQnVBBa9BuWJttWWnJY6N5L/XJO87A4D3Bq6HLqFTfw/U7XUR+FITyjyVeCu70sazC1wXzvficMY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135790; c=relaxed/simple;
	bh=8fwE/CKkLQBqwDNOvHotNuwhswsPeK5f4jYmO9oFJbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRvD/CpdxEms2Plerb82GR4c9i+cDzz+Aj05PdJHydKtS5WqTrTH2ElMoORkQOGb3cL7jFE5TMbV2OH78tUnxw8XXBV+ZanuZQnJCHygkHAVll7E6iuPI/7FRWUGLjzfDFvXQBoMqyeWd9SY13daBUACiC8JhmzJtbB+ishEJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzBtSN2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlTmtHMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzBtSN2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlTmtHMT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCiXM4815374
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=; b=FzBtSN2Pbpd7xhPl
	ztd+31jDyrmQLUSpTio+l8WW0Il9GFKeJ/KPTXbDm0XiP5zWLL3IE5+Z0fkNF97K
	pmWDon7KMVKdphptMAG8D3htcV9/BU1/JGrVFoT1qkE6ufgyM9Y63vg90hKKfT1A
	cb1ZNeISaQoEVsxJIHd4KFYAXih9pvav5ooxWPu++IafhmEPJ3I3zOFm3aBtyBBi
	1eZq+yHf6Luw0CXbuF6TxaaXQU47urFcQvdQ6uWi1bzuGZ4G6MhB2cU9E2oaJPrA
	bvSTpnhw8rldBo21MzZ1MOeOYKBlHtSATunkUKeS4bea4OAHxwHBmnMeRYcvnJKi
	kTYZ1A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd3a409-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:09:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82f879767so1063060e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789135786; x=1789740586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=;
        b=XlTmtHMTBTFLcOod3owg4XemhqVa/Qd4fQvYrggys3tIq43bNhE0i2Vf9FLeyT8jQk
         NlHxfsmSgmqb04IP72thWmC0ZLRAUtqjjaFg6cR7VIjLNGIdpRwzATU5RtHlQCYQOLDQ
         xGFYamoA1MxRQAzJULoh4/hj9eRhtSsMXEJU/PzIxWnienXu6l94T6zeerALhhkp9V9y
         qWtmm4uqtT9AA7ItsKJAtg2UT8B8VXirxZ1Mo8sIcj1dC3mBn2SBaB7hpb7MlsiCuMmI
         HMN7KZUSFVS2hz6myrr2L16I9i/7OdhpX2SHlYsy7n2wOOcsQ/nFIKWcOjjiHrV5URXs
         JRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135786; x=1789740586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iskblvIV/JjBo66wrPr3qOCymToWNOakKQIIxBq4R+g=;
        b=g/gVVnj2MionJRfjr4R2w5gSz4eCrWToms85nPCcFU54sZXbFegDtvQloxR1+2j91w
         /aeBbmziAkfbtGekwXPKNqTlsqMkRr0k9Ain/EzJlZZ+Sd/FagdOq1h5NOkTPW4/RQSQ
         p4ooe6tdRUaDzlZlLhiWi8/5g9thRN67PhAfflkLRcwdVHmwnebfaHpHQc0SsSpKhutA
         ZPx0/Uv5KxL9iNuHjfZs8TmnQt65+vIEM7UqMkRdERsmjihoQsCJfhf62ld/rKVakuh5
         9n460BP4pQ8u8dNuYD5anAu16csprcqk+ygUYVC+/WdO/OC/BOARO25hzLANnaCcpKH1
         YLEw==
X-Forwarded-Encrypted: i=1; AKwUvBz9iR6jijRYDq4vdkGVClpNMAobH60XDVSCC29Uu1FjI4UBPNzc8hb/RVlzZAzbpaS57dK3vCtFPhspgnMa@vger.kernel.org
X-Gm-Message-State: AFuF++mDINGvopLZjNErHCh4PviEc8OeTzeaCyTl1lWZYj6u8aWuDqlf
	rbKaHSI52YBc+Z42sPfsqNEOj1pjvIdbkLZpbdFNyDlVHNpSPHC50UhDukBKP+upZgjcd/o1oDa
	9fnn1MzM7EfAGaEzpR28wUiOOPCBa2N47VB1xhkUTeladCmajV5m1mn06ZENr4cTB6alfC5OeRZ
	CquHM=
X-Gm-Gg: AYBFou264t56irvEuiiborIuPyDJ2ipIsHZDCWvkr+7K3WEDng8V802dJdIvnYcaxKc
	4q35BtSdsnCBt2ogZwl4mCnVC7v12hW7NU8YvumSNyTVpMJlDuDwcMkr/fr1cdClM4qP6Erd1Rl
	niyNbj+Ihj08gVTBlr4ncDaiVo05oLmsOJW2iyM8Pbj2vaPdslw/m1tSMkQ27s8tjjjU8UGc/g0
	a5OdCRBzgs1bfseRAZg4IRTDzsgAkoPUxyQoVVUikXqCyXKS1ph+2n8N3Nkv0F6NI32RciWr53Q
	WknJXqvYhmq2RWlOQ85Vnvs0sIqmQ4TDL8DyB+WjwsWx0yrAGooI1oax5N2OS5QWj70AtT3FtDU
	LzMmFJuuRnQXAk893BK8E9ERCYrI5KHb+hTqUakEv
X-Received: by 2002:a05:6122:4f87:b0:5c8:2852:36cf with SMTP id 71dfb90a1353d-5c84628223cmr6396017e0c.4.1789135785896;
        Fri, 11 Sep 2026 07:09:45 -0700 (PDT)
X-Received: by 2002:a05:6122:390b:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5c846307c10mr5360849e0c.8.1789135720634;
        Fri, 11 Sep 2026 07:08:40 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm6426044f8f.23.2026.09.11.07.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:08:37 -0700 (PDT)
Message-ID: <684d02bf-e575-4229-add6-a0e45186f59b@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:08:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: qcom: camss: Implement CSID streams API hw_ops
 for gen2
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260911062213.195007-4-gjorgji.rosikopulos@oss.qualcomm.com>
 <e3000a66-3fa9-48d6-a82b-b4ff52558e5a@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e3000a66-3fa9-48d6-a82b-b4ff52558e5a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv8IUoX5 c=1 sm=1 tr=0 ts=6aa40baa cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iEnAxMS8pMPacfR5st8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: qo_RyQkojhWH5QDT9Dm_b6Q8_yMzRp3J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfX4iSv7Q8pX7B5
 C+JYlFtP/YyDDrY5crPypSbkHCB1KC3heoMUavQ0wU/yDvQlXYVwEI002CSlr6+aVJmYMsAwIGL
 NuJjHvXYIgAtPdyGeVFLMSi9IXlEpmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NiBTYWx0ZWRfX4NxqBo0cdzEA
 CaZB5oXmarN1Ywm1rnRyFuokpNWUM7YRpJ1gyKleA4w9I2S5pn5u5fgQDzZTTySDA/8V313qO2S
 umH1Iw0HT+5JizDQFvYrjU8nu8LkP1BpN1MVSA81wVBbDbQFki1BoM0SYG8jFEbTQ1WiEWiLT8S
 s+oXjHgFkjRExLVLx2Fbzlk40wwiWJe3ViBIE5PRUh3feb6gYCXq5vUrkpi/14Xdqipgb8EdhPm
 wDCks0SHDuPiXcHOoFBhCUJqEB6OcQvi8kkyQJ0SsBEWd5IHuPIrLJbPW3WP56McTAe8a5/gWB+
 Sx4bpG1cc5fBR7InaPtHcq1ztlq4mXzdK//c8X+ueFNm3BCvErOVbCxVzv2CfWOtUTl5M0nnvQp
 FhkYCleuvpX9nKcyXU3yKK6OLxdkiIUI0V/ZL9Pf4gKmSxRxBBh47fIkFMrHtofLmpq45bWn6ze
 kzURz6PkE7CIYuA13Ng==
X-Proofpoint-ORIG-GUID: qo_RyQkojhWH5QDT9Dm_b6Q8_yMzRp3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110196

Hi Bryan,

Thanks for the review,

On 9/11/2026 1:46 PM, Bryan O'Donoghue wrote:
> On 11/09/2026 07:22, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
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
>>   .../platform/qcom/camss/camss-csid-gen2.c     | 59 ++++++++++++++++---
>>   1 file changed, 51 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> index eadcb2f7e3aa..2512cdb16d94 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>> @@ -253,13 +253,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
>>   	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
>>   }
>>   
>> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
>>   {
>> -	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>> -	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>> -								   csid->res->formats->nformats,
>> -								   input_format->code);
>>   	u32 val;
>>   
>>   	/*
>> @@ -281,7 +276,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>>   	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
>>   	/* note: for non-RDI path, this should be format->decode_format */
>>   	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> -	val |= format->data_type << RDI_CFG0_DATA_TYPE;
>> +	val |= dt << RDI_CFG0_DATA_TYPE;
>>   	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>>   	val |= dt_id << RDI_CFG0_DT_ID;
>>   	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>> @@ -330,15 +325,60 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>>   	/* Loop through all enabled ports and configure a stream for each */
>>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>>   		if (csid->phy.en_vc & BIT(i)) {
>> +			/* Source pads match RDI channels: pad 1 -> RDI0, pad 2 -> RDI1, etc. */
>> +			struct v4l2_mbus_framefmt *input_format =
>> +				&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
>> +			const struct csid_format_info *format =
>> +				csid_get_fmt_entry(csid->res->formats->formats,
>> +						   csid->res->formats->nformats,
>> +						   input_format->code);
>> +			u8 vc = 0;
>> +
>>   			if (tg->enabled)
>>   				__csid_configure_testgen(csid, enable, i, 0);
>>   
>> -			__csid_configure_rdi_stream(csid, enable, i, 0);
>> +			__csid_configure_rdi_stream(csid, enable, i, vc, format->data_type);
>>   			__csid_configure_rx(csid, &csid->phy, 0);
>>   			__csid_ctrl_rdi(csid, enable, i);
>>   		}
>>   }
>>   
>> +/*
>> + * configure_rx - Configure the CSID Rx front-end
>> + */
>> +static void csid_configure_rx(struct csid_device *csid)
>> +{
>> +	__csid_configure_rx(csid, &csid->phy, 0);
>> +}
>> +
>> +/*
>> + * stream_id is used directly as the hardware RDI port index below. This
>> + * assumes a 1:1 stream-to-port mapping and should be revisited once
>> + * per-platform src_streams data (stream id -> hw pipe) is added.
>> + */
>> +static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
>> +{
>> +	struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +	if (tg->enabled)
>> +		__csid_configure_testgen(csid, 1, stream_id, vc);
>> +
>> +	__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
>> +	__csid_ctrl_rdi(csid, 1, stream_id);
>> +}
>> +
>> +static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
>> +{
>> +	struct csid_testgen_config *tg = &csid->testgen;
>> +
>> +	__csid_ctrl_rdi(csid, 0, stream_id);
>> +
>> +	if (tg->enabled)
>> +		__csid_configure_testgen(csid, 0, stream_id, 0);
>> +
>> +	__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
>> +}
>> +
>>   static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
>>   {
>>   	if (val > 0 && val <= csid->testgen.nmodes)
>> @@ -425,6 +465,9 @@ static void csid_subdev_init(struct csid_device *csid)
>>   const struct csid_hw_ops csid_ops_gen2 = {
>>   	.configure_stream = csid_configure_stream,
>>   	.configure_testgen_pattern = csid_configure_testgen_pattern,
>> +	.configure_rx = csid_configure_rx,
> 
> Keep the namespace consistent and include _stream somewhere in this name

I agree it will be added in next patchset.

~Gjorgji
