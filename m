Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785689;
	b=YhPGvn1NqdXO19tB1BBqnaFL0S526iaOGwfihOYX7zAUq1nDZhcGOTszFcOL0YeZqlnG
	 MJnwIax7RUDpDYyK/5F+7ls811rPPJ2FE51KWM9FyG7CxNM4J8aw+b2t7zgBCkxCfWRjw
	 LhhQQNkwo/p5XUPLfmqndfo/R/8IGzxQnDZz5QT9PS1vN5cFMysXaMFuw/nODiITyRbLl
	 2hAOFO6/7X/zCywn9WTgmJIlbZnP9ThmRdWkRa4VrSplCx3J1Wb2S0kqKvU7LeQ1Zp3gz
	 LF+kHgAs631j4umFhm4xfdnYzSuO+GY3ilvvtLJPzlY5JsNzX8bTeuauv1sPv+ZTpfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
	b=uLA8nX8hVUUapBPas/FisYXoadFfbbMNYCSBE9gwYO3JCHWnW1MCEM8tiUjqb90foPT+
	 knSuHTasYvfJmsLFNBhc7ol4qdqUAZ3FCFiD9+4euwtk5OSbBl3ok23vkffBEw0Rgh8ie
	 jIxoejIOWwvrfbyo62LuX1eC8H9fLgj8DExeMLKF+5R6Zxf+5CDIQuEZVdTTkYSj2BJ/1
	 d0AfSbkxHlavglavZ/T+3b5UgPzuwRY7iMzIHQjmn5M8L8UTGk2vY988wi2+C2mHl2FBx
	 kP69kEXCMpz4VNQglOZkdw8mmjpbyxN0xJqnchR7kFS/8oJzsOvV/7KThnXATX3BgAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yhf+60Qp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGRS70XH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB37606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB37606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yhf+60Qp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGRS70XH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChEba296508
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=; b=Yhf+60QpWDL6yiuS
	4RkUnrssYuCCJf4XvxrTXMISQkK//XPdmLy4b1M1c44SQZ2EfSBZ+gyxw41jRias
	1iZgsrumRd1DhwSmou97dw8JHKa2zOM7CU4k89EkbAT/yno2a5jwT/NGGPoJGZRu
	TIsPc85PFCqFAdQglLP9JjmRa8lGPGdErX3SoleosXI/Pr0/21lR1ZISCw2CfB3l
	M2fdjqbF38qhpXSiJFTS3YxcBont67Fld4O2WhtYehb777DzjeDI8CayIi8PiohE
	BQVOvjfbZUnTzUwrVRlbmkbIrE61UBWEvWLb5V4xKL8DFDdpQkaIHb0R03+NMS/F
	ZxbsQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sk91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:21:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so11667743eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785686; x=1796390486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
        b=jGRS70XHvcjZWAmz1F36uOlYQu50PB9FFwQn6V4U+PJH2eOPzRGZ6og5Rk6wRWJkiw
         WZyjzSGDBX+O9ngqrJRA7yVmNev3iIQqUzw0tiAjYHQ9ZeoKEKUJX57qsvZZClidRNmk
         b//wvoYzfrUE7XxHitgbwe09BIU2QT/1Stf5+vLx/RPNC/O+Vg331YzCsqU4QTrcbG6K
         tzDDRSSOgmS5DlPCH27NXoxsfbTfqVp+/IOIDqhLcDDXJHC8APkcrekpZ8XNTeKp4oz/
         XH+T834eNRz8BmOuR4nw/Vce7MYHjXihaf3xUggBM4m8txJCI1E3Ha0CH96QaBdXhIKc
         lslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785686; x=1796390486;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQA35lXIFx4Gl4uwWusbAEX4ajQDIefFfbPrN6cDsbk=;
        b=Bjq6xDohcHjrJpAMpP0FJ8YvaaA2D6GH3ehBBPCyGk3xUEMRHILxeKkl020uWA/W8s
         TqbixeZbD/gt5Ew7aAU6a+P1CXrvsAJkDuptcz6LHcOQSOqHIWiR2/h+plqqa0+bzF3W
         PUgQoZ2jUYXkkuskAQG1Y4wtyqCbSNpeULIfN/Bkv20bhTaawU5FPOVxLDMRzusVEwrb
         7vRiNGx1NL9kdoEaU7FoX3MR4bFwuMZZw1KL/0yFVnGbJG2g0qk9Lym1f90cbIS/dYlf
         L4WBiH2P+CEimIczv0FS82NTsGGe3KP0NQupE/I9vsQkiQTIjEVFY1jTe0e4dvmUc4wO
         GotQ==
X-Forwarded-Encrypted: i=1; AL+hErFp/c4APa9Z3N/pwm4fC6Gc6TfnGcJ4RZ5A+XZUFKZBxWO6UgiRaIQX4UkaeqsxDnoK/2XMK4lPGp0iUUfJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/SFmCPF7x1mDY3YQr9++UD6xfZJwGVKEavMJ9EETrWJDiOf0RK
	2iWs68BtnIzE9s+zBOLORDuuMZn2PlG25xjmBenXS95njvqj/+pqBPkQUSrcOtYO7S0T8ZWq9ol
	wfXX2Ca6djLJdt8fXjV9bSNQ+cC1oKte75TnoPi6YsDv4EL3N0skLd4HvEPX+Ro3vtd36
X-Gm-Gg: AZFdTZc9ZpDD8yX+XcsJhM6NH3ijqbGL0vBADGKil48fWTZyqadV2cqDOD+MMxMuXbm
	3Jda9xhSree8Nb9tubiEzcRyxiwMEAZc4vw4UFoRtCBdn8qvIJTvi0Em+FxKsfFk36QWBvqvjuN
	cKzw1mZW0SbnuTWX6gVVS8YSBNrjjCl/SIfq96I5V3NAJqFPhBQLkF8aleYnE+1OEzU4P/IgluU
	wc+uqK+UbiMLgMYBrYpY1dIMuV5Qb0qKhsjT6rUHcN66EuK5S5MAJObWmMme3lIenAku6bF1q/B
	qxZDCruzwLP0eh6bQFu71z/lRvu9VYQ5Ig+rHNToB1xfRCYkskTkZqeWBSsJom8sNQhfkW5DU6L
	ABG2jdNyVUmL751oZS0XHOLkJ/Fp2ibMqfWA56Nl2fmyK/0C21t8wfl7Tv8t/hxxGA8QqMfCYJq
	gPv1+8Rw==
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr15012438eec.34.1795785686302;
        Fri, 27 Nov 2026 05:21:26 -0800 (PST)
X-Received: by 2002:a05:693c:890a:b0:386:a93c:a637 with SMTP id 5a478bee46e88-386a93cad9bmr15012407eec.34.1795785685711;
        Fri, 27 Nov 2026 05:21:25 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm88438325eec.10.2026.11.27.05.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:21:25 -0800 (PST)
Message-ID: <79980587-fe29-4b6a-a1f1-0cfba7da492c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:51:17 +0530
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
Subject: Re: [PATCH v2 1/5] media: iris: support decode-order output on HFI
 gen2
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        sakimidare <ssmzhn@163.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-1-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-1-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PHC734hdwjPK9uf8AAyf9RvaS2hWcjFG
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0983d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=QX4gbG5DAAAA:8 a=ksxQWNrZAAAA:8 a=azMBqCJUQdMnf_Vbsx8A:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX3XOqSL4fZdT6
 VltUUUZ8dmRKeQywvkYcBA3XEgV4+uGRwCuRKNTcLZcCOS+If6RNAH8XICFNHjqbZ4U6vCEs9TU
 mbbfny3Tcdz5OhaqR1FGImoOF6WZQZc=
X-Proofpoint-GUID: PHC734hdwjPK9uf8AAyf9RvaS2hWcjFG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfXyVrmDaDYFyEA
 5G3qbP7luZ2ICIHxyL8Pm8MhvBFbGgNhudJyP+kjnkEVixxvE6CHiTxsiZoxJn7WUjl5PxhGOd2
 Al/6kyLUPUQqS3SGoV5eTKhRWcDMi0hTtElCjPN4AtnofNhLEyBpmRnlURx5jxruyR2kX07++Ua
 B9Qj2oG2rY/nMr6eCLfz4Czlr8ua0zrcluLFgHxEr3W8O36klkYlXjWy/7CQMSR3L2Z/IBMHzFy
 rHGT3ODGdCN+P9ecDobusCSvnYjHhhqFXQKwX4jacDI5TTff8VdL3IG/I7Twm1oGzYjdJo3xg/p
 4//0rrgswTPiOAnyQAAAlxt1fAPLQFxQBZq/h8wRuSyQXzRQo6x0qNgj/8TDQMA6bFqzjRTIA5Z
 KatBNWiX2fYzoGcpwwq/UqK92HdmRiYz6qedIiG4nV9J7W+t5c0XuisMaXZDRhlEQ0ismFcp1HR
 m6jCJYnk+3RrVogrfPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> Venus implements V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE and
> V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY, which let a client ask for
> decoded pictures in decode order instead of waiting for display
> reordering. Iris does not expose them on HFI gen2.
> 
> Add both controls for HFI gen2 decoders. Enabling the display delay
> with a delay of zero, the only supported value, selects decode-order
> output through HFI_PROP_DECODE_ORDER_OUTPUT. Display-order output
> stays the default.
> 
> Tested-by: sakimidare <ssmzhn@163.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c        |  8 ++++++++
>   drivers/media/platform/qcom/iris/iris_hfi_gen2.c     | 20 ++++++++++++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_command.c | 18 ++++++++++++++++++
>   .../media/platform/qcom/iris/iris_hfi_gen2_defines.h |  1 +
>   .../media/platform/qcom/iris/iris_platform_common.h  |  2 ++
>   5 files changed, 49 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 4f2633bbb49f..0b59fc79971c 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -163,6 +163,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>   		return SLICE_MAX_BYTES;
>   	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
>   		return SLICE_MAX_MB;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
> +		return DISPLAY_DELAY_ENABLE;
> +	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:
> +		return DISPLAY_DELAY;
>   	default:
>   		return INST_FW_CAP_MAX;
>   	}
> @@ -314,6 +318,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>   		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_BYTES;
>   	case SLICE_MAX_MB:
>   		return V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB;
> +	case DISPLAY_DELAY_ENABLE:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE;
> +	case DISPLAY_DELAY:
> +		return V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 79bbd06ef8d2..7a1204da17ca 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1106,6 +1106,22 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {

Take care for adding other platforms too

>   		.flags = CAP_FLAG_INPUT_PORT,
>   		.set = iris_set_u32,
>   	},
> +	{
> +		.cap_id = DISPLAY_DELAY_ENABLE,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 0,
> +		.hfi_id = HFI_PROP_DECODE_ORDER_OUTPUT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +	},
> +	{
> +		.cap_id = DISPLAY_DELAY,
> +		.min = 0,
> +		.max = 0,
> +		.step_or_mask = 1,
> +		.value = 0,
> +	},
>   };
>   
>   static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
> @@ -1818,6 +1834,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   };
>   
>   static const u32 sm8550_vdec_input_config_params_default[] = {
> +	HFI_PROP_DECODE_ORDER_OUTPUT,

No need to add them under these array, which gets picked as subscription 
"iris_hfi_gen2_subscribe_change_param" property by driver to firmware.

Please use .set callback to set these parameters.

Regards,
Vikash
