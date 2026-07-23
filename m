Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949B433E8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802993; cv=none; b=SKGpEzWG6UPm3RT1beuOGlp6l+7bTtu/kqHvH+GzErxMhlOJ24gY0Dn8ClRwSO3KA6fwogJAv7s6pp+8dDV6xA9Bgwuu3qLYH+kj6FAyp6Zd3bAFNthuOHkNPV/EtHlRNN1hkKhvtsfgoRW2Ox2GrYx17zxSKCt8u+q5IjLFxWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802993; c=relaxed/simple;
	bh=y5qoMU8Plv/qJ+DGaSaEWiuWyV2WGbtvMLTUzlU5Rko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7UHY3rF17pPY1uU4LtKEEI748h2R23yW5AYM2QVzNq8DTa2+/gy2hbxMNLoTjf7ulyvjz8SGeIBUs2UpgS4Wtt/9F7IlypZTfW4XssI0p4zPDvZjAThM/WEVAlqCXTSDmxRXEpyMGMZ16B3RG0sTO4pIGM0aa1vX9d4PdJjRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKOOfrW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdDC4P/v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKOOfrW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fdDC4P/v"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qWfK467153
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=; b=eKOOfrW6UH7mWuL7
	4nnbYDR3A8MgWCNOVGTu61028VIhm9Z8zCuCBpMN8IvV5t2BIMpOlDinZLeQCNiD
	Yy3CFtNtcvSslBoiBmTak9GCRiLeoPC9XuQXux9n9zjE7xfaaFcVqiq+Rivwyte4
	WGC90U/JYJjx6pJgXJSNYqlcUGdZEVx2bM9b/wCgwuedqlLCyJ09LeERhf8cDyGV
	3YJE8Xbs4g53HNI2UNglrc/vjlNihoZe7+sK2fbhHhMkSL3k0dA0zg6UMjlDx8Em
	K9ltjDIkAvkiX32vHIeS6zAhriBSZd1QWZTyDd6OtzN24NfkmkwjGYuYlErXeTMt
	f+TWGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xukrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:36:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c7f385887bso10988985ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784802984; x=1785407784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=;
        b=fdDC4P/vxiSXYrucWJMuLbqtcdEmk1R6CDMbIdMGTdIKzw+gyqJcmAT9am0ub5eNK7
         tcXE6aWj97n74ioUDTaB33ck4DIjUUk6JRvwZlgN2WHjZjtaMsGqpf8KEP5hEDjlfePJ
         Vk7P18WREQh1lyJYO8DRNGNgo/iQZuLqzdlpi5lN4IVtfy429XUjy/OOEDcPqKrDUV5s
         IBpM2aX6cN0DGQt0mLDIfZFsA/LyuQ4vrI4Bl0RR5/wbAPbIhaHj4sKTQ04sFUBPeFX+
         aQf+bsFRU9dBtKFTr1NSHzko/cc+BajOQF6YOJVqAuAOu54KfggsKa5tOGV1obpbKjKI
         ZJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802984; x=1785407784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8bXNiDzJKS+O8RtIxfJvk28Q/736rLVrJ27qCekjzr8=;
        b=H+TErjqAZGGV+oeDQl5Am2XGE+/LyHyRHzWNpnfWDUXko9BBytVcKlPVwQxH0Vo/j0
         fPbL4B0+nsh3lrMIJFRLf0cplRz0R9phUjVMP9ZHVnqMw6177/WV3WlNEdMMpX9tOkRU
         hnCgCoLO5e/CkmLMdEA8XrE3KpjNyubtq+Fasdi14oirshmq44L+P7HwAA6wskHs03MV
         CCavhzetqP4zDgHCSdE6xoU/2eAtu8QafZmoKOfqXeaDkgDy7dZtd/pOtSYwuZfwtTwZ
         wPlimU/KxeHOqMlC4TCnMhg1aCeyx90+owHAOrnNXdC9RsPQVXWeitfKU0DgbREb4QFl
         AAZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQMuA6aN9AsdYo8gkAK5JWJ9x6+msWj2iJOiCz1DSU8Z6QT8tKycPTxyO0AGYp+MAWqVEL4TGBskcWQ7Zg@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXd1uCPo04LPn70QWN50ps1Fj4EJie1xhSBeKxkqs9wcOhPPi
	tN81c1N7qdfT8lqOycjSu7RPRMD4RYd/6/0rLP0qQLcvUnmEUAdAnsGBYk4jvPQFZqAnbszQnHl
	wa6aqbEWZ4mVLL8ej7+ONludTU1CvjXRG7T5RTKEzbxuJe26Wyzl0dgdDgkVRIrNHc10p
X-Gm-Gg: AR+sD10t0yXQxXjK9K4w+V8jz7HxFfMCSkSaTYOMawDBeTKGjEOhCgokoggyXsx1D3x
	khBi/ge8TTIDYl3q+bpbvfE2Y5jGauy3L/2dA5xQz61lVlODPuh/Vh78/ltWLKST9UHEBlTNd+o
	kLJFkMccX1TKzmyqZibR5pD0nGy+kAv9uavY1UCLUcwAOXwisuQWZAG/4kwNr07UZlw9jLG39GT
	Rgn8rTWYnjMBehTHdbUrg/nEBwWYmc0B9iOSsNvueB5kf44T8mehutWZczZuV+L6qhUqw12PUC0
	flqZUlJ6VvxgMKBRlZSvMNU9rv7bslI9S4xGn+ukoxqg2VJiXfXND+ek9yUNbV3vJXqj5Vqseir
	KtUZy+vDK7SBxw88icjEx19bXOrQ=
X-Received: by 2002:a17:903:1104:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2cfa6b7d4b5mr32262975ad.11.1784802983541;
        Thu, 23 Jul 2026 03:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:2ca:d172:7228 with SMTP id d9443c01a7336-2cfa6b7d4b5mr32262755ad.11.1784802983091;
        Thu, 23 Jul 2026 03:36:23 -0700 (PDT)
Received: from [10.218.25.31] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa2f83sm31382035ad.1.2026.07.23.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:36:22 -0700 (PDT)
Message-ID: <4c671695-4266-47e6-acb5-04cf4f690d6c@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 16:06:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: iris: force stage 1 work mode for CBR RC on
 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260721-iris_multi_slice-v3-0-adc61a687e7e@oss.qualcomm.com>
 <20260721-iris_multi_slice-v3-1-adc61a687e7e@oss.qualcomm.com>
 <2pksblzjw3juu4dvi2vzvyeyawbka77f5lpc3e4t5cjghowujp@rdqzk5vwnobe>
Content-Language: en-US
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
In-Reply-To: <2pksblzjw3juu4dvi2vzvyeyawbka77f5lpc3e4t5cjghowujp@rdqzk5vwnobe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: U7ZLMMrnHB20I-cd_1ohboKhQjzl5zTO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX9KIJE2GRY2as
 S/44UTDIJMIVPskXblDX3sKxOCcGnkZks16YE4RBD8JqaTnUJLBVi4VXWjm2kvJ4+BlzEP9piFa
 cgCGnhqymJEHUGWsMv4VvMJRGMMeTpU=
X-Proofpoint-GUID: U7ZLMMrnHB20I-cd_1ohboKhQjzl5zTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfX1evQiGzREnEa
 MEwLe76gRIUBy/asopu9atZBSZVYASIWmuVmD5IM1eJAIUgMj2EGgzHI3PmhZFed7qO9YZDM5wy
 BWJCWcYbfWw24APdyCwF1zcP47qly8qSMrSIH63Fvmys1ixvrEXv7DbytEOTkeyX1ve/Pm5IGQ7
 4Zc1L2NtIlP7zzwwlrpQ4DU8TCpdw0T3XGp2Np7ts4t7GA//Mnxt2F5ZVzq5lFtsBy2h2ckY/tf
 qAHX65oGGjoBwG4xEnekYFB+f2iyZzqzZOfx8kZZKfQ0QVaprE6ZbVFXwJp90c0pkLAwe5zu/iQ
 hDKBZrxGv1g+lJpnrfhvmSF3GM5Km5XGu5sNemMwKMMWpZ9Wtth4gTIb46s9tbaJbMFDcAQIxva
 AhI6nehzS7RUmqm8kFYYEBZcddtGn8yQUzSXfPdpcWr4/71kgpgsxjRv93cJRHHqIm6gIamm1q6
 r17SkPk+wTMG3ZeUl2g==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61eea8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pKpYRV-URZkG9pN1C6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104



On 7/22/2026 3:17 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 03:23:32PM +0530, Sachin Kumar Garg wrote:
>> iris_set_stage() currently always picks STAGE_2 for encoder sessions.
>> CBR rate control requires stage 1 operation, so force STAGE_1 when
>> BITRATE_MODE is set to CBR.
>>
>> The BITRATE_MODE fw_cap value is used instead of inst->hfi_rc_type
>> since STAGE precedes BITRATE_MODE in enum platform_inst_fw_cap_type,
>> so iris_set_properties() would still see the previous hfi_rc_type
>> when iris_set_stage() runs during initial config
>>
>> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_ctrls.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> index 10e33b8a73f6..d7cbf6c3614a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
>> @@ -519,8 +519,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>>   	if (inst->domain == DECODER) {
>>   		if (iris_res_is_less_than(width, height, 1280, 720))
>>   			work_mode = STAGE_1;
>> +	} else if (inst->domain == ENCODER) {
>> +		if (inst->fw_caps[BITRATE_MODE].value == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
>> +			work_mode = STAGE_1;
>>   	}
>>   
>> +	inst->fw_caps[cap_id].value = work_mode;
> 
> Separate commit, Fixes tag.
> 

Thanks, Dmitry. Agreed — this is fixed in v4: split into a separate 
patch ("cache work mode after computing it in iris_set_stage") with a 
fixes tag.

>> +
>>   	return hfi_ops->session_set_property(inst, hfi_id,
>>   					     HFI_HOST_FLAGS_NONE,
>>   					     iris_get_port_info(inst, cap_id),
>>
>> -- 
>> 2.34.1
>>
> 

