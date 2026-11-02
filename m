Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627082;
	b=4rMsqaUjAmdVffloJnY42yiB6ggvCgahVpuhx3vgIjlELSVdKStHbrd7IPUZ6QtXlNYW
	 q0b/+xKT6ieIb0Y2POZkeQIvwYqkdMPV6gfvpgXNWUYahaGgN5wNzL5Fp8N07geHbVsYY
	 DaxjVAls5bmewo+kseBy/gtXKv9x1N6IrxM10cHBeFnBYm67QhO6rA/zM/zBjrdIY36/z
	 ntfFUAZYcE4FZRkz4Jl6pP/QnPZhwM082icM7e4X1un36uGCs2/PfHfOJyHPfdUmaGO5+
	 W5zFtWz+QFQIeO4sz1cPsYu7m2AmNyHfzqKQg56wU/M9q2I9osOe1cy05gfQfewl8BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
	b=Az/ZKZFqu/YIcEKCE/FW/GuQNd4PJfKNHHyUacaT5FN6yq+6GXZoH8kpYSXTymOEQFaw
	 9DxvSJuIW5FFYIq5DXdTuX5HdolmZFzfNaTiAL/hGpBJlETqEbhlRMvg7rle9dbvO+A56
	 AFytxalp8kZ0dAiBh+de2bBtBdQBLwlWlYxr6xWSbJCi9K8y0arZwoTL3ZUVjkBMlbXs6
	 myeDldcZjqXaZcJojZT1JxcagO+yyJNGJViuaXmz4Ougv9nOtCDvnIYEO776lp9K8GDCv
	 hxAdGuy86rLzEJ1yJD8or0ObHQV/tXiarB+uUM0cnFL3DGdUmYT+a6XNCqwtSgA/GOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7ZXNnyT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7NGPHw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A4D606A334
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A4D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j7ZXNnyT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tk7NGPHw
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAWR12902451
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=; b=j7ZXNnyTrTG3DEnH
	81h/yN3RpHTa0cumufUHF1oONTCUmIAk4Uh1VB+V71WDB1LlLFBnkO0CJNXxUNAn
	pQwTmX+60vHzwt+UKSpNV/BovivWDqPE+5e/qUW1xNg+MHu5BqEsShtFsS07hFsg
	QVBtfS/YUd0H9oFD5FsuCpmiWQUNjiZ7nf64AXPq3S2IQbImNKXgRxhniCHmWZqr
	3F1t6pmvDbQxECoJUa7jKm6zH3s3Z7ofUnmd/hK5qj0auKNF6zZab/N0vEwNzFHQ
	62Mc0X9CIrBDYLZ4g1vMYCqkXCeM2Mv9Fo5TMsuCeIWjQmKrpvuLxlOHNCf+rKb+
	dtBE3g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgjf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:44:40 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-843c6807307so3924482a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627080; x=1794231880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
        b=Tk7NGPHwhn7ohpa60PiwvT0bPUJdGdY2MITvU+GgAFDAiMe7gEK2VEosH4zNKqmNXb
         mbTmqYXRLhPmiZGQSdq5y6D9CnKWuxiGCeLsUY1IgwtlUQAPLunUCyiqvj6oF1/zAcAg
         eq0SeGsUa2TcSIu+k7IxxiacOqGPH8B9tP6Ac+BM8qD0j0fQ5JlrtxnCoBGGa84WHDlH
         OMHV1OCH9LvaJ2AdlzUuHq96rnE5TwOOwa0wU8WoImyxFJ5ryQzOsLTarERB7tlrHHVa
         FXvgzWzdxo5GdoQQgLv9HY4JIVeYXmyxA/gQaI60cL23xg7bIXu12PHVAuMZlxRJDeyH
         1/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627080; x=1794231880;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e8MBAdBKrttfmf2SLeeFXH0l/P8tVr7RM3jVh+74XjI=;
        b=RS7TicEpgUT/44zp2CFXwaCQfW9iuIAx0rCToSPRkxvBtTR11qgY4KRJ7MQ0BWFNEp
         KUJZs+XRhp1CPm/PqsANelQmfHLXblH0Qr1q8llAR+wyYtiyTMvKQ2NA7duE/dPqk829
         Q35pbr9lG8FcuqHeGJ/dzBJdKIzxXNeaaYjSzvmmT/ixpB9IUGCfMhxhSzRS0qbKctgy
         FFpcieGkFv7RsJ+h8EI6Md1+ObH/BzsnrArx6llpSLBfcBVJqpLDtxmOOMzvRBZ8I6Yw
         g0/TyvdouyXEsLp0FDmPM/x9GDftNZtpAm/dKxnxJlgNUFusW+wyQPehW0xNNWPb0I0w
         vgYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnR2SEbVHAk6fP++inihyLvKTP6OFb2wODceQgIRav8iNoYm5xvFNH0YmCAEQBRej7NZqH1vpYwFpes0Pi@vger.kernel.org
X-Gm-Message-State: AFq9FYLwqTGQvxHkXCkuDGBmU/xEgu8OAjZpN6RKjN4/3R+bzbXpCK5L
	c2GmdJXKuUcC9z56Hp12GOmuzYlQuscpd7zny9Ke5QPKiH+yBQA96o/xu9TF//boTASP/lW6rpF
	jmySudXweHJuKFzca5raJvIm9XHTwXLLWR8FnvKguT0fL1Quw6sTUB1GLbsWRka5dDZRF
X-Gm-Gg: AYBFou0BGeaDGRbc81CvLfEIm+w0bG3Q1W+SJGUebfk5t+gsFAZktQzDRevxK6vygTQ
	9K09Qi+GWoabiG9gdzNeODSJn/G5oX/vIaMEzK7W4QEppjoIPnVyzvohN9vINqGTyJFaQEObVNw
	Mj7POKCLmZVexyO3mRIbyTCU0EAUJvvsykBPwvob+PLpZLi88nIJIOSEcRPSPwoyEgllR47hDRJ
	fyujuzmpkZ1TxVrqCp2aBgN+DlBRxQg67HWp9SNUf1Kh9ghrD5fZFrlIqnnJRlYX4TKrZYtRqoi
	VI7Dqr0jR/GSLbAWDotoyBci+J3hMkmmIoLWWbcdN4b4d9XwAbo7OT9O6GsCpNQLlvPerLE39R0
	ErXHUMISzVtzCQdqpxO5HNBK8oaSwbC1a5L3zVRIUctQO+MzLi8b5F20hozRpOpS7VPJGjnHOuw
	==
X-Received: by 2002:a05:6820:151b:b0:6d8:d121:a970 with SMTP id 006d021491bc7-714f27a0151mr5260214eaf.76.1793627080067;
        Mon, 02 Nov 2026 05:44:40 -0800 (PST)
X-Received: by 2002:a05:6820:151b:b0:6d8:d121:a970 with SMTP id 006d021491bc7-714f27a0151mr5260199eaf.76.1793627079603;
        Mon, 02 Nov 2026 05:44:39 -0800 (PST)
Received: from [10.92.207.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2e5b450sm8780853eaf.11.2026.11.02.05.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:44:38 -0800 (PST)
Message-ID: <395a146a-5c60-486c-869b-d3706f5e85cc@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:14:32 +0530
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
Subject: Re: [PATCH v5 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
 <b27834b1-4ed3-4eb1-a8e3-a1239f20ad43@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <b27834b1-4ed3-4eb1-a8e3-a1239f20ad43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX0GS0M4o303ms
 7oFyVeKeQZh+lPZ1Fl+XDeDVYqn8hgc1M+2THalDOB8pCh4ehW2D7j1+kNmfXtc1GIlWin18PNR
 m53Hf28CyFLpnjK/iYFizI3CzNpOhrxbk26FObVZEBDMb9S6XMjhaMZ6NbqyMXkWIgcyriXURrC
 cigPKeoY0DxWSh2F5pRwDKy/+0Lh0d89zjRoViMasFMEMOqtLlLstXILNq4eqpoOx44s1BtStGD
 tr3V8Je0g/x3sDdPqMqm4uFaVfRxj6p4XnNsGUGJaD7og6yJvRxUBLmh9p8Ujq4fzDFcJzOYTw7
 6l8GfwjmG8FvaxH+N2FcKNmPDgWFoaMq1efCMQn80kJqRI3U7NkU9AhPKKRPQNZj3PtmmrHPp8s
 +Sn7xHdGCQElaS1GTsP3bez2eE8NdIQc4jPK7m2dL8GOP/IKsu1VdghDGYZYh5UvCxp1TDRLSl1
 MNG7s5YEGXnrW3dSTfw==
X-Proofpoint-GUID: gXpT0Xth1xO64DpZb6PPdbNn0GNBXp5N
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae893c8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CC0UIsglRpZkCHxahuUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX6Ceb64Rzd7ga
 YZH0yeXUUVq5J3SHd4CdKQ6cacQ7Ze9B6a5OvnyaziOqZA2ILJQJDJE9uzd08i1Wglja3JR2wlf
 Q/vkSsyi4rNezX3gZbKFGV4U3ol4cww=
X-Proofpoint-ORIG-GUID: gXpT0Xth1xO64DpZb6PPdbNn0GNBXp5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

Hi Amir,

On 26-10-2026 09:21 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>> QTEE exposes certain secure services implemented either within the QTEE
>> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
>> services can be readily accessed by TEE client drivers via QTEE's
>> object-IPC protocol if the service is registered as a device on the TEE
>> bus.
>>
>> One such service is the EFI-variables service, implemented by the
>> uefisecapp TA which enables kernel clients to access EFI variables at
>> runtime.
>>
>> Maintain a static list of such always-available secure services and add
>> support for the QCOMTEE driver to register these services as devices on
>> the TEE bus during probe.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/call.c           | 160 ++++++++++++++++++++++++++++++++++-
>>  drivers/tee/qcomtee/core.c           |   9 +-
>>  drivers/tee/qcomtee/qcomtee.h        |  10 +++
>>  drivers/tee/qcomtee/qcomtee_msg.h    |   1 +
>>  drivers/tee/qcomtee/qcomtee_object.h |   3 +-
>>  5 files changed, 176 insertions(+), 7 deletions(-)
>>

[...]

>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> index 60fe3b5776e3..4a523a95bf0e 100644
>> --- a/drivers/tee/qcomtee/core.c
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -898,19 +898,20 @@ qcomtee_object_get_client_env(struct qcomtee_object_invoke_ctx *oic)
>>  
>>  struct qcomtee_object *
>>  qcomtee_object_get_service(struct qcomtee_object_invoke_ctx *oic,
>> -			   struct qcomtee_object *client_env, u32 uid)
>> +			   struct qcomtee_object *client_env, u32 uid,
>> +			   int *result)
>>  {
>>  	struct qcomtee_arg u[3] = { 0 };
>> -	int ret, result;
>> +	int ret;
>>  
> 
> Please initialize *result, otherwise for instance, on mem allocation failure,
> qcomtee_object_do_invoke returns with errno. The caller checks the return value + result
> and may print garbage.
>

Ack, will initialize here and omit in the caller.

Regards,
Harshal 
> - Amir
