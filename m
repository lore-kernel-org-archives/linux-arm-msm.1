Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ECB3E49D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651038; cv=none; b=asqojOE439V5504JGXJfhqF12THbmr8tmTPAwp4qKQNsEV782557w47HprdBLsw+pbgDkw1IuQ0VfmItI8xh7uMVIDzbpEvP+WWrp2nlUeSS7wnZXbrqT/JlJ/Mzo7s6xpoUgrBROAjyF1UcBRCUhuHPOzcG8Dg5PGsh0ba+e3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651038; c=relaxed/simple;
	bh=O4wVnhMMQ+uaPI8Kv6KE57gAovQRnopHFObePh6Lvsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AXqEz9n4qRGnUctvQITQ0sHzryT/5mr/OCN2mx1RoyidK+UUW/lroutYXuetQ+LVqbgRh/B35eR3ObFOcXtk0Ag0q0XRLvlQw5s8ZVhFd9RqbHUCLWdEROw+v5Sx2fSV+c5dDgWH6ANNtAaiIhGGwTk37xSASAjwnxaJPmXkpDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAz59KR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GO8FkbJq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAz59KR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GO8FkbJq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpav2071461
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=; b=XAz59KR6aO4QANKv
	q0to/Q5mIShemq5pKb4ArAImK3AP6ctMJYGMICTTUp8Z0gcCdV4nVvBCnntjITkc
	1Mmv9cbqx7igAHe5s1U5hP1WWB+KlSlWQE7Xg9SThyZEQf98KAzaiOfqi+bTJi9r
	OAEFAO26F2lQNyr8fFueoXqRi2VOq/BqdPPgtyiksmK0bf43wTGwmjp+amc1oLpx
	LqvCQHRnrvcQ7Gp6hqsfq/FjbuG8FC+CvuI7o5ACZ9vwb9l58QOy8P3YpCZE1dvR
	f1Ds9rYRXWaD4vpv3iRKaZltCLsQB6QAHYfggolT1uf1+AUQiBi+TypW+GIxRAIe
	rV285Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3ht1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 16:23:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so16662196a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784651034; x=1785255834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=;
        b=GO8FkbJqaImuFq3dxmIIrO7vPv0Izh5s9LH/n8HlZNFAYHWrXWLEfXbEkEy3MkltaN
         F5PfaAwcjONN0zkd3DLRqk7oKqnNlMqRbTrFCvYhCQ6pwicCTWw9NrUKUNk3yNapW2Tw
         8zcuhnaWvjUsgv+1j4QpeYqXztSRBPtCj8Hc5dC569Azb21Yovdei4Xrxo1rA15ul6PK
         bgSIhZqQqRMZ/rDc6Ui9ymDkX8NUldIobMq5GpKkeuUahgpOueOpHXZyUnmTZPEyl3Xr
         URTMsGXB5Y1MFBj6PAXHGr5UvEioU4c75M+35OEx1r5jOo16STePMD9c6QhEQkT/UTtC
         1K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651034; x=1785255834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5oelxBd3zAgbhAM2GaaqJvi+znKFiv1xjAU+wGxpDo=;
        b=BVZWDXpkDGc9VcynTYQHA8WjIuOwYl1rs0aBB7sG/TEaPQI1LzyYASm72pzxlTIeyp
         iyQN80qKwXSG3quWA8meyeQ5WEjDgZav4Irahcm5OV0Twc1hWEyOL9YfbyL1+hAbh8dA
         a0EBz+5PAt9n4GDD25j9OO5p0PoHvpIhuXAUI2gf/c5L4LtfZK1MBbgTB5S8HqdaqvTE
         rmPJmLFAjzzB/so4xHNVI6HEH7oL8/xNEJyUm4DdsRefWn7spmicIOLkmWzK8zEA+MuO
         ZhPjCiiXqfCUT9nSc0QNHq8sK3FRF/Ao/AVk2V7xHUB0P1jlCj2LfYEA66asvLUwWgym
         CShA==
X-Forwarded-Encrypted: i=1; AHgh+RqKiDDO5513yMFeeGYkrC7oedChJ+cEMZ5LAt87VpilSOEmKcNnymOdTCaX2nWpn+JQDXRxvybU0Q/0/zuB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYiouJWNV6K7Cxref8Zg7QklWQIjuaEQ6KgUYQRFJT4fz1PJT
	z9KbKfSyGs3YrPdHAGO/VvV/CFI6XAbO1Q/pi/6TOkUMPvX11Ux27h2p9DX9vIoYgWYAF3EDbow
	9omziZLU5/8lqKaqWqF4V0LqLJWI1p6IslTwencxkg/d2ZG04MF1t5XMWTRKjNy46yNeF
X-Gm-Gg: AfdE7ckbfFVZqjZsgqrPu5TcKEniGGeF3lhEpeExpPRsSnzcgV2neitJbm80cWy84uo
	W/lPhOsNRkYwJEcUE092/elW4J5JRxbQB1y6r5QqIUmnyLPvvLh0AE4/DJRAO1V/kqTlVjJLlni
	iYdkMN5MisbgHBLsScE4OGcwrAg6QPgQ5WyKY7nK199vdIofZs8imrTHZbc1V/Cbu3qAkPKwmr1
	wOqoy2smrmDpmr2A1YSZ/O7kKlpkVM35ep8h8EVu+M698I8wT+8xxl6h/E0aaeY+5qLahXcAtev
	wV3wLLw8jIhMPpX/BP1o5AQhlzqf/d+s1EvQN5SQo8Co85VGCpGanDDjq9EYyzuNv7jFAr90TLi
	nj8T1OfA4tZzS+Q/11b+tdgW9qmSgewp/
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr21416062637.76.1784651034374;
        Tue, 21 Jul 2026 09:23:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3c0:9c19:6592 with SMTP id adf61e73a8af0-3c3ada36c4fmr21416036637.76.1784651033819;
        Tue, 21 Jul 2026 09:23:53 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm347633eec.25.2026.07.21.09.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:23:53 -0700 (PDT)
Message-ID: <2323abe7-ecd3-4504-8790-ef1a2dacec8f@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:53:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
 <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
 <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW3y0ck2k3H2XK4W7z6YCFO6nuENN6=SmKxjQjNUNKWPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MyBTYWx0ZWRfXxTC4KIwcMuhZ
 mlxE8uYBkmcrBw90he9c24/ZkZzYP449uGV9OWM62RwQny5pTXGBenSCFQSp1jX+4cbuvXFlwpl
 QCkr4l/24g7Jj2UoDykjEAma+3zAR8zkejlbCha/nUrunSQV6ypfzFNm6B56HivIOm5vlkqCrbd
 j5zT9c1SdFCgwT0XGkk36JCKvlbKAvmhCaQT+eLbE6DfcQTXlhPrF8EPZQfFeZXpfBWKY0sNqzD
 kO6hWIx/qSrJoVm/sq0neXDrAZ/UpyQSv685t8C2/8t5HJffaPhNty9GihvrzI/NqcmEJRVwRsB
 /SJseRciOe9ki3QLzxBJAe6lNYdAynH5J9zZnwPHAIoExEed6CFz84f/qRdw8TFz8NhBqyxsWsF
 4QgjybjaJ2icZ7mpH8wu9lp1BDvcnBnGHq1oo/obxh5m5NSrBaXPfQ45u46QXaKKzqF/15VoM3t
 dMSEl5rhka+yjmifFYw==
X-Proofpoint-ORIG-GUID: _EtHTarf6bu9cyZPV2kI6cOFpbBhXyVr
X-Proofpoint-GUID: _EtHTarf6bu9cyZPV2kI6cOFpbBhXyVr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MyBTYWx0ZWRfX8uPbSXHdjj9H
 ReS36uH3ERK03UWEM4Ni1ENlKt478qw0BuxqyVINasQ5p0qgILrsFAQJeW+z/iLHNrFU+8G/Qdl
 AapCZCvIVLPX00uYOOXgPlzsJkNhZTI=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a5f9d1b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fu1g7sk19LlnXAIAUm0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210173


On 7/21/2026 8:34 PM, Dmitry Baryshkov wrote:
> On Tue, 21 Jul 2026 at 17:08, Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>>
>> On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>
>>> The raw formats supported by Iris were previously advertised
>>> unconditionally, assuming UBWC support on all platforms. However, some
>>> platforms do not support UBWC which results in incorrect format
>>> capability exposure.
>>>
>>> Use the UBWC configuration provided by the platform to dynamically
>>> filter raw formats at runtime. If UBWC is not supported, UBWC-based
>>> formats are omitted from the advertised capability list, while linear
>>> formats remain available.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>>>    drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>>>    2 files changed, 43 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> index 4c8bc7aac135..9fee5f28097d 100644
>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>> @@ -3,6 +3,7 @@
>>>     * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>     */
>>>
>>> +#include <linux/soc/qcom/ubwc.h>
>>>    #include <media/v4l2-event.h>
>>>    #include <media/v4l2-mem2mem.h>
>>>
>>> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>>>        V4L2_PIX_FMT_QC10C,
>>>    };
>>>
>>> +static const u32 iris_vdec_formats_noubwc_cap[] = {
>>> +     V4L2_PIX_FMT_NV12,
>>> +     V4L2_PIX_FMT_P010,
>>> +};
>>> +
>>>    static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>    {
>>> +     const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>>>        unsigned int size, i;
>>>        const u32 *fmt;
>>>
>>> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>>                size = inst->core->iris_platform_data->inst_iris_fmts_size;
>>>                break;
>>>        case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>>> -             fmt = iris_vdec_formats_cap;
>>> -             size = ARRAY_SIZE(iris_vdec_formats_cap);
>>> +             if (ubwc->ubwc_enc_version) {
>>
>> Do you see a possibility that ubwc is enabled for a SOC while VPU
>> hardware does not support UBWC. IP document for qcom,qcm2290 lists some
>> UBWC configuration, while VPU does not support UBWC. Not sure at this
>> point if other blocks indeed support UBWC for qcom,qcm2290.
> 
> No, QCM2290 doesn't really support UBWC between the IP cores (as such
> it has ubwc_enc_version = 0).
> Currently the database defines a least common denominator for all IP
> cores. If we ever get to a point where we want to define UBWC params
> per the core, we will need to restructure the database.
> 

Ack.

