Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86C289E13
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439908; cv=none; b=WkBFFDBmruabWKmk3W1Rg4JFvLyn5A7RElhY5fhdSRY0a2nBLiu1oq6HaN082EHPTCgAZZdmGsR1E5hNY1AfrRgiQlwkGmEHV0U0dqPonUqbo3nvmtAygLW2l6ioKQlBEcewC14qgJPtqS3eNEMSl9w5TAefgz8hIpLoAA9BUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439908; c=relaxed/simple;
	bh=mQM8iO+zt5QYIp0Zyu8xKeOXW6PSpr6CP7eG/xPY764=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QB/AokHCbiR6NnmuUiCYdVU8nqmeE05Gw2VMVgKDjuJehzoDN2hG4OKUBxm6bqsBlD4+U52J4ZX0Rc9us2Z0GcRlwVn2PG3txzW87VRQK3GrRUtz/usKmDbukvJIfmzHilvGobbyNqIQpR5+exZhB2IOIVesf9OMW7M8fRAN6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C60Yibao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hS2T5Uck; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C60Yibao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hS2T5Uck"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BfcT754012
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=; b=C60Yibao8onkV6FM
	w2Vqcu1Ki0Yr6cfzts0IeIUvieAvOvsXjV4alKG8EFG2PXC+l+CYbcDTQTMliPWq
	c9ecXeXC6vhJKzKBY0rzPCtES5jeYjuG4JzBbu8sp6M13BbBS0zsPLx7y2Kd5MIW
	WaZbZbUnAbNIjEuBShDWvoO+csLWikYp5zCRjHkj33hSjw+3MIK+bmAqjr71Ijk4
	XY988HPKjnP0FwnXLvCrTEq1PFA80pq7IabbK4RQAgCv3u9DGx87eOBZVaZUkMVV
	2PIx1kfdbcWnlPqwx6d5NItHcn3xDzlFl2/cEXbmFWc3NYvt+yldy37mnnGDjfpK
	3dYMwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39bgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:11:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso5031181a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791439905; x=1792044705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=hS2T5UckQN9XFP9im+jfLOvLB47uYHsF9ZTCeyE714GLon6d7aMaAPOFM64MCDLWfN
         /jYh7k17otkIPMWluOvmOwlgJq2ex+zJ7jRTYL4qAaVDA+1ndNrpsBw/0afYMj2G90Pj
         29pSvIkb3CyfFG0aKNVYQgrlOG9FY3sac0As+Pmpnjo2RiUzrYbooLpJ2d63N7d4aS9s
         zCvusFZOusctupzdelsBrXYGPEk/6bxzFFMIX6gq836QdqmN2FqNVn+k0x8SB5ZxDFcm
         gReGXjJXX/46wgf4DNV8kmSlM8iOcijDF5OWfbkOqnRBeXGTyh3lFr5I83t5UZFNkXMA
         qPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439905; x=1792044705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86RBZ7v3wJ4xaR5/4wdQH3fkTa46s0FM7vfKFSF6MSU=;
        b=SbA6jxrEN8CypkvhPCmlvXMnOrhditVu7CYLdXxPYeFiIpbXKtRRdGzd62fcAGt0W0
         Ca5Fko9ONGrjrbjqh0mRfq8kiKcCDTMPPD6nhyZMK88tHFsD3N+McgjOfJvOp2Bx4YrN
         MZpJeqPbFTOIy0sXJSX/tEQs8XjIQCQ6qikolQ0Eo4sVbFt8B67MkW5+6W+Gl1tmQ2gr
         tGkHJmUoIpOReFIHXh+S7lzZE0CmtWCmk6KiOKZ6gw/+G7fANQqPhS2CYA6GX2yGw2FT
         y7VS48fXckx1qqUyJI0txxvmNYRedeEl5Ao4mVJCLHXfgtFI/JChaEcPbznyLwu5+L9Z
         r6CA==
X-Forwarded-Encrypted: i=1; AKwUvByPsWovzYNnEFs0WlV/QE5SYe9rB1x2Q17wqUZLTtzm0Nc5qLFeQ++uTrmU3BBQs9ffZAqtBUCA4P3MN8xU@vger.kernel.org
X-Gm-Message-State: AFq9FYLSKOEEY9r7ygB4GiALF0XNM6dEiIpCTABYQzLJAAZaIC8e2ouK
	/xYuZRBeqsVx+yru7qbOY7OKtYM2d8pVKUtlLqFAEKw/iCYjhooOf9uBLUI+VOpeU9eEMybjaJx
	/lkEwb2mprkt3NDkm1tn5F3i9WSvpmF91/UO7Gqa6B8o+1/i8W97Nj812Y9Pke/EjVb8z
X-Gm-Gg: AYBFou3wsT3s8tRRlC+cAg7p/lIxGvuqX5zZkYqF1uGjsRdaW7u8OSfHHEX0FjRvetU
	G5KMIC4JLPo+oAd8mELb7cl7tHoaYZL8gSnIyJkJVMrOexQK3rOqVdmioYi7YmKn6DvjZs4L9N3
	2fpEBaiJWXe4/zfTBgjzLvr4ZYZ5WD+RD7YTltA52NcKtkYrv2gQC4Zqg2GRz9s6NHNguh22KaV
	Ls/Pv23BKjPPlTG/LJDUV8Hf71XBHNUot2h2qLHjCWZMjhJo6q4VIM3t0xQPKePCGK3IpTYhL4e
	KGDPLsTFIpBSN/KL3hrC7e1JR43RFHNY0uYJKUeXcEmf17IoZeyUvEOdANbZYp+AG3dIIUwgCmn
	HEEMc6QBspYcLXrruMqnlNnKPFmaod64=
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571767a91.19.1791439905519;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
X-Received: by 2002:a17:90a:a89:b0:3a8:cb54:e135 with SMTP id 98e67ed59e1d1-3a8cb54e725mr1571754a91.19.1791439905042;
        Wed, 07 Oct 2026 23:11:45 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d416348sm4247427a91.0.2026.10.07.23.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 23:11:44 -0700 (PDT)
Message-ID: <4ab383a0-5fd3-4cda-a0b4-8d9bd5d015ed@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/7] bus: mhi: Load DDR training data using device
 serial number
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
References: <20260701-sahara_protocol_new_v2-v6-0-3a78362c4741@oss.qualcomm.com>
 <20260701-sahara_protocol_new_v2-v6-5-3a78362c4741@oss.qualcomm.com>
 <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <ysumvduurfx5jq7r2eaa4ik24eqk5at24frvjl3zyif4wc4ojj@2bhq4vzuqlnw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WmMFRhyhVyFewlC2gdGauBN5isejQoe4
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac73422 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BmEjwzUHSYKQsWGf9k0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX6V7jujkmd6P1
 ddGBLkScBJk8XyC2S4qhcEuBHIuBwhcFUn6hEWMZxrePmwdywOhQqLf4vvugOTz/Oa3P7JpQKzF
 Sr2h4dZN5tDTpeg8qrPrqYztYTq68lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX8Ln33P7se+al
 u/Pm26RShyfW+kfuGFjp6V+P1+Pf7yiqhonh5lJzn7ZbCXU2xpFYA76W9gwt9JItHd5sbtBIeg6
 mhn58YjpwvqO0YTUNAd/7S6qWE5ZXh8OmhVeJ0pWKD/Z7A2moQfOoVjMP+iWliaSA9VgqyIuoKX
 P1DPdZ5i0M615ome25lN6zaPFJWavz2B5Z/+WCUx7umVYSSQVFSnZonvapivoa/FfUeMQUbGewp
 t283tSTuT1DaF8hkepQFOP9ifJhCD2UNHjzkx7WIailV9a4Qmhztov7c3E7reByBQ2dakp3tctu
 AYTkRxiut0jMIBmfdqt0R88++Itdutrv9IpIbOjwAi/pS2zvAJY8dx9sQ5OACluLqcHD/8kFier
 pSNmgj/b0LXoPmVQZUKwNCJARq3svnwDHgJnzspKEUnnVPVImJDdM4AOUo1MMmf9HK+Yk6IpWBl
 uhQ7t7oxluLdwMTRbDQ==
X-Proofpoint-ORIG-GUID: WmMFRhyhVyFewlC2gdGauBN5isejQoe4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024


On 7/9/2026 11:51 AM, Manivannan Sadhasivam wrote:
> On Wed, Jul 01, 2026 at 04:07:39PM +0530, Kishore Batta wrote:
>> Devices may provide device specific DDR training data that can be reused
>> across boot to avoid retraining and reduce boot time. The Sahara driver
>> currently always falls back to the default DDR training image, even when
>> serial specific training data is available.
>>
>> Extend the firmware loading logic for the DDR training image to first
>> attempt loading a per-device image dervied from the device serial number.
>> If the serial-specific image is not present, fall back to the existing
>> default image, preserving current behavior.
>>
>> This allows reuse of previously generated DDR training data when available,
>> while keeping the existing training flow unchanged for devices without
>> saved data or for all other firmware images.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/host/clients/sahara/sahara.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/host/clients/sahara/sahara.c b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> index 9adbd84859073d8024ba2a5fcfa33897439d6759..b5ca6353540dc3815db6539e7424afdb749fd3f6 100644
>> --- a/drivers/bus/mhi/host/clients/sahara/sahara.c
>> +++ b/drivers/bus/mhi/host/clients/sahara/sahara.c
>> @@ -59,6 +59,7 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_packet {
>>   	__le32 cmd;
>> @@ -226,6 +227,27 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   		return 0;
>>   	}
>>   
>> +	/* DDR training special case: Try per-serial number file first */
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID && context->fw_folder) {
>> +		u32 serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +
>> +		fw_path = kasprintf(GFP_KERNEL,
>> +				    "qcom/%s/mdmddr_0x%x.mbn",
>> +				    context->fw_folder, serial_num);
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +		kfree(fw_path);
>> +
>> +		if (!ret) {
>> +			context->active_image_id = image_id;
>> +			return 0;
>> +		}
>> +	}
>> +
>>   	/*
>>   	 * This image might be optional. The device may continue without it.
>>   	 * Only the device knows. Suppress error messages that could suggest an
>> @@ -235,7 +257,8 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   				      context->image_table[image_id],
>>   				      &context->mhi_dev->dev);
>>   	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +		dev_dbg(&context->mhi_dev->dev,
>> +			"request for image id %d / file %s failed %d\n",
> Spurious change.
>
> - Mani
ACK. Will remove in next version.
