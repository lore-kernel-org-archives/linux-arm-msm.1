Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771F3332EBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632324; cv=none; b=BQEB0AjHb8U+Sftnleb3XEPBx7MmtDqZaA5iVzMwfGDdECyO2pBMPFR1spFDesotvKggZJ01e/ecLHY3W3IodzrlELw+Bs/VerxXa4zHZps1kuWIeV1YkJ7PHOgbU7iJFAbh3f1k2N6YqAFuLnbe2Snoz+itOa3OSQDWsMsLkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632324; c=relaxed/simple;
	bh=Yatm9ZxnOj/ym6CjLLtiZlAqlYcNBFpdb3IRAxm4+Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2vMsPsl9Y45Wge5lSEFEx3ZyigNkAlIqj/OZajl6lHoUrSqTOTSngo5eqoxvuO/1KEfk5Ty7iU1B61hkYiplnvvX8EOaJjVj494f4s9xs7fnlr0QFnYNVO3DGiS24vhGC8HabtI5zK7lZ0Iyj71JjWzN/Hd0/AfZBCxMy0CbdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnhOE2cj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgTo4g5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnhOE2cj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgTo4g5z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARu4D1252094
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=; b=JnhOE2cjuVkrNNV9
	bT7H5zhtfoPr2dwS8x4fOLarH6mUm7Ve5wTexfIoayC0J696pD4ex6Be7TeobJWl
	0dw8T2CUaCMx06yS2lcY2gwevJB0ly3ORehZFUyZPKTtskjtvEGDxYgEzZrrcoSO
	itEvpzR4Xw/71OANgCJWN45TKiKH+LaYTX2A2jc0i+7cXUclWeuGMBX3jT5ZYYrb
	d7Gl29raXd/sLzs0v8ICMpXFwi4P5GX7osoVuMfpjQm8RVqblqLHEo7TyvRAr6bl
	4gVnFjTzEizADurp8JPNjp6rI+NIBLm5oA33dxMWd6OtlnZgGzZ99U5QiUBvNoa0
	ebnJxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcc3qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:12:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so20944311b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784632321; x=1785237121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=;
        b=MgTo4g5zdPtim0RcGxTCD6NJwwVmZi+wDyTHGL8856nLY9voznJZGhSYuU+G0/ZX3L
         kTknJ+W7EFT9UrPo36sCn4KMra/nuTB2o9psFP5qr/baGvHkofKy0kpprm6xb/oGpDjC
         3oTno5WPlV8Tk2vV7L+0vvlgi41vE7Dx4umXVbJLTESt/QM7MBXzQMpwB3iZ9LXfFz8H
         1QaSCd0uESTaZOq5jgg+N1nIZumUTN0usbRIjBMBCM6eZYfXU7bYMrVnn7XlhKRkk0yf
         14s0ppTwbsuKW4V9mEsSIEmoSMwxsInegYwXi0RvVMW4U7eLZAW8Ekv63X5MLn0a7YJO
         FUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632321; x=1785237121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlTRXKprfy8H5Qp0s1PDGixTI63RzoUst5XmEPyz0Fk=;
        b=XckQMN1UpWYrmVBWgzM9f/uw7xi7kjpQ66SJYJBgMxrkNlkIqRiNcotnOYwecLPeQq
         9X0oeMRoXILplNGC34RfUVs5NzsSmufoeMflJ6Ki+buwbGr98nmMow8euDmRt6lBOqXK
         yqZn+0UqaV0oPTUW2moWic/EFMRVPBkyNdkUyMAE7qAOBnykZM/j1XMr+V3SW5yxbAR9
         L6slG80sbmNGFYG+NMUBjJSZObmK67vRIalrCsLZZIsKqipVOQKgAYyUEMi/TGJedJDo
         FQukNgK2tL/CZZXZU/gu1vvwUkdnh5Q9b9x4QDQaCscLFc42oX+UMBXnxYGzeHXw8cmK
         b1Rw==
X-Forwarded-Encrypted: i=1; AHgh+RppWmtzXMVORRv8LYpQtKuIhaMpez+oRijg5+jbwPfKyS/hVTT/WgCITokTjrJzWrMQMwNCUSW97OcLU+5V@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5REnomC1jqw3GRbm94iXLaJc42ufQxrrK/wrYRGQzzXVQO6LW
	g+vIS3bwYDv7ju17F4apc/Yqq2jDeHBZYSfV1qQ9StW1RqrHz7QvjvvxJiuQaMa2dc9fFmVXDOX
	Eci2oRn8u3E9rWhDgtfQNQLsGr4JyzUGXVSmozDZiYuSecsiitMFLjYLq2d8sfPkw5Tmg
X-Gm-Gg: AfdE7cl/5ORl86iJG6+vFWOAMNoE0ckBsSWNsQjPgJNDN1xOqlsEEukJF8I+HOkX4bk
	rM5RF8uP+PzVLcON0kWYg/SVTNIU9MwiH+yF5XhWkZzYgIXFExXDXQlM0iwFY8+Loa/7oVJctzt
	wNyQQO3FH/NQORRJJezF65rcBrN9UUCbinPlXalmVFC/cR2XNR3ZEeNWdpU82YKwgbhhGZfqChe
	X83XBj0C8ij4hC5wpwOdRyRcj0qDbxxPnW16wexx3xe9zmQRv5EHnqAga1i3qQUhJ1epd8l5ZqE
	QQl3OFHf9Ci8iHylvD+sccSud3KRVr3vUkH50DFJ71sLpcXKIsDEBP75drHCJUBaLQSm5vnIWTS
	J4UE860rBjUfOheZt4rIylrn9E4oLtrZ9qfnGDiA2ITET
X-Received: by 2002:a05:6a20:310a:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c3ad9bb494mr12815173637.56.1784632321209;
        Tue, 21 Jul 2026 04:12:01 -0700 (PDT)
X-Received: by 2002:a05:6a20:310a:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c3ad9bb494mr12815141637.56.1784632320698;
        Tue, 21 Jul 2026 04:12:00 -0700 (PDT)
Received: from [10.81.89.22] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm47287844eec.23.2026.07.21.04.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:12:00 -0700 (PDT)
Message-ID: <94b10cea-7541-43e7-bdca-ab79e5729d55@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 04:11:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: gpi: Fix SE ID and SE Protocol fields
 widths in SCRATCH_0
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        bjorn.andersson@oss.qualcomm.com
Cc: praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com
References: <20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com>
 <34b0bb3b-d756-4cd6-806d-75b1124f4397@oss.qualcomm.com>
Content-Language: en-US
From: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
In-Reply-To: <34b0bb3b-d756-4cd6-806d-75b1124f4397@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfX6vHDSNUadc88
 63oErdr7jAdesypcvLt9lFt1Djt65ECuXflPhHz0gem3ccbM+ZkrbqbaNRZsezsHpOjTQJTnw7A
 hziotsYFUAq4OEW/saUh0eJ7tduv0co=
X-Proofpoint-GUID: fTC4q9l4o-JSEm49jVJ2sfdNwgn01a05
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f5402 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-nvh27Yv-2H1FMEgutIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: fTC4q9l4o-JSEm49jVJ2sfdNwgn01a05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExOCBTYWx0ZWRfXyPhla7TKcMWm
 /BXkOE9RN9tyc+00i7NFGX4D7SRwlZevjJb2WRC575CyAgJgssXDrYLXcO9R+uIMsBJlrDXs4en
 r606TyXAGaa7EH4ehQ94pIeg6rEYi8L/hg07zAjcV+w+hkLqvuABW6zrnKd34rg7EYs4IU3ytHZ
 +0IbqeRTuVTLg1w4/pxMprdlUj+OnmH7Wz75tPnTEVzhlKLVja0gpD7o6CmXBzKvii/yv+pn6TI
 0wUR5ARQac1S64NFVfJGhp5HDXCa8fy284E5w7KL+PVxcDqPZKxSrKUiebVJakkeH1yBN9ye43m
 ryL8QDnKDZnBNnVVS/2cldtyWtEIb9M4iVSzGlQoCgaTRYMQNtpVMHUFEio0Ux7+ZzAQg2Crm1c
 ZwG/pfwj2GmsvFtnJIjPZJuuxVzYJZCTNlB3rHqNDY1LAaGLcfvgNwW+6Ngvn6kB+Mx+HDZoaTj
 vB9FB/IMgs9+kkZGnuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210118

HI Konrad

On 7/20/26 08:47, Konrad Dybcio wrote:
> On 7/20/26 5:27 PM, Chandana Kishori Chiluveru wrote:
>> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
>> 3 bits wide. Serial engine indices >= 8 get silently truncated by
>> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
>> causing the GPI channel to bind to the wrong serial engine. The
>> channel allocate command still succeeds (it doesn't require the
>> target SE to respond), but the subsequent channel start command times
>> out waiting for hardware to complete the handoff to the (incorrectly
>> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
>> for SE8 and SE9 serial engines.
>>
>> Older documentation, such as the SDM845 hardware programming guide,
>> describes the SE ID field as bits [2:0]. More recent QUP hardware
>> documentation defines the field as bits [3:0]. Use the wider definition
>> to match current hardware documentation while remaining compatible with
>> existing platforms and enabling serial engine IDs greater than 7.
>>
>> Also update the SE Protocol field definition to match the documented
>> register layout and keep both fields correctly packed.
>>
>> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
>> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
>> ---
>>   drivers/dma/qcom/gpi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>> index a5055a6273af..8f09eaf4e714 100644
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -207,8 +207,8 @@ enum CNTXT_OFFS {
>>   
>>   /* Scratch registers */
>>   #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
>> -#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
>> -#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
>> +#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
>> +#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(6, 4)
> There exist protocols, such as QSPI with id=9, so this surely can't

Its my bad, The PROTO field should be [8:4]. I will correct this in the 
next patch

> be right (unless there's another bitfield for that?)
>
> Konrad
>
