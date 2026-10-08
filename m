Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4749B5C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463130; cv=none; b=oJoq6FRelmhtp9MVsUrlod6YaL1HFLmRJlEkkBDLupO8c4+5Oep4kPcWbWWywCJAaEO9FisomBJhI6V4c6AdBx1cfVHpIXiA4UrJppFFjqj7HOeO4g7iDJiv9EudN0HuNwKu2RHlAh7CI7Vvou6t2RgFCmZdc2LlIr7QEH9R16c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463130; c=relaxed/simple;
	bh=zMqRuzzgdFJ1fm/eDvxR9LsZgHUvQ/RSkYZbPH5r4qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbU/c2BMOjwB6f9olyGqIhtSONP77NNBi4j2fWEOJksi3qyAq6Nhz1t97MwIc3bHiAm8xtha60kMy/8DJapKl/xcTAdhp0EkUYHLPWQcftzsRe5Cga8yr3hCb9tiVLl4QMcr3BGMu4XK6s8U3Q31Jhgb2d8kWoRFOTnPe/KfJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTF6loD9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxCLNWJx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTF6loD9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxCLNWJx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698CZSYQ2892595
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 12:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=; b=NTF6loD9JAkSxy1R
	zytdg1aU5L1MCUs7qngI973BOMNsmKbzjPWA4w7KqlKD1Fku6AHuuafbsB3v7/5N
	0AnOjjg6ZUs0OQovTwuTeC0BDj3hO5V4CjM+X4EngcwDQLAEx9cFtGekGv5nBfu9
	q5L+/LtWydsq4N8rwBGDzj9GzzabsCzkPt9ZomfDPaxUeStPZKI7pvZpZVWp0tH7
	To30l0CPhCB25eyBBgYn07dWUvQQnnUu4wGKCS0fZVrhVha5fN/1I/L7btDp5aWz
	kMRV8Qi7ccZ27SKAkpYRSw7KoN2NWJ3BhxdYInDSGtlKDLzrGxcjgQoJGVgRxzPg
	JQVqpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj00bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 12:38:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so202410985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791463127; x=1792067927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=;
        b=VxCLNWJxdYyrtIySfwTwGhUImewwCIyuBGgJf/uuFA3iQ2ciiLvdH5KJwXTS2V2iO6
         rR1vvokkcj3p/T0gFgO4/oskaZkY4oVPFCMNgNkojv0GccK/GM2CXCAxswH4bnSLlqAM
         t/lewuoozDTBDeuuwaVgR9oiMfTcZKQS2jcvrEjCMVAI4jGgr34QSA9nXfLdMTNUpFcl
         pxPcnRsAq41BZanE0FrX4jVv1/qJQ2DMJoVlBqKXM2zGhdtSLWhOIz+eysDiWvgoML/4
         hV5374xWKzgElb1BII91y9d+utY0MmKiOc5MDm/l4Pi41mpeeMPC593AmrRVCrb528ra
         pk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791463127; x=1792067927;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w39yKARDa1FO8OXgrwzakXgdnRwrZUAfxXED9nTH6Gs=;
        b=k5ZRM/qFBjqu1dVA3fuLZrADujAs3LJwfHWgHvQJkejFcLExwULzsE5WCxpIz5xrEC
         lTh0XZ2xgZR+kCLnVZ3NJN8oLDwDomUivGxpyX3aabnApH91JWhlHiaJbjbw7MK0AUJL
         ugqqndxNHXzeAJOvRRm85G0tdjwiTDQQBdSXG4QSCVqfTJ17M6WJx2tSlMAI7hKt4moZ
         jXwvS3asq8yQX7p7/tCRzf8b/KM3xt9tzE1fcRPGExq1AdP51+UZJACnfbhZAsdKxTcM
         uQ+2Hz7814kSwTH1AYCV0ek9cOPdZikvxzgYWogoSfxsvO2P5DaXKNUPHvjtWY8c+hfb
         ubjA==
X-Forwarded-Encrypted: i=1; AKwUvBwgfTw06Q6qeXR0T+bQ4Zk03mBcrhq8bAGMYc7isoDUHi4N3uQO9jJu44VhtLH5L3p3ERHYd6+JqxG5AZnC@vger.kernel.org
X-Gm-Message-State: AFuF++lXizf/C4g+oWQaweEfQD3dhkp70sc4MGwol8DuScsjIFB3W0++
	nzswtnOOLh6FJnP0JtsmuDUh26BDoivR/l1S7KFrJKOGamdBgeulwUIbxc4stNwCsI21CNdXglx
	lxu1J4mo8M8hOdgW3hLcj3ZjA3RmOj7qSqbFxPTTYnYGpdVidubeEsdEkX7GJ+6sI3C1B
X-Gm-Gg: AYBFou11QYKQZyrz9Jxr+ICnyO4QewLMk1JmVzGD7lH+BW5dRXokCE2ndXm4MMfugqy
	U5m+AP1VYEuVeoJZFkPfcW/XhQBTeVTwZpAG39k/J2ENXQn8ZWGZUIkA7VibYzNg10NJHIvtlA+
	cSTiKMoNAZgAWrSONtaW9Vp9TRNVxCfLEvhCpwqxN4kBj81QewI82KbgOpeTK3OWvgbxVBtsBpn
	ENRf56scgPyOBNoYJWVwWrp3GUDARYdd0BeVDd9C7d8qDw7bgZZO5WRJpMfW5JWoPDoWic9CTSb
	yj272GM7PeQdqh2KZBVed3xrZg7fQ2RekdBl/yl2zR6wR+lZvu7UspHXtBxkIyfxFSGk4NxfZMn
	2cdwsv5CsSOxxZK9rlV3b2FE2oO7g
X-Received: by 2002:a05:620a:3712:b0:93e:9808:2e17 with SMTP id af79cd13be357-93eab16feedmr408128485a.36.1791463126569;
        Thu, 08 Oct 2026 05:38:46 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:93e:9808:2e17 with SMTP id af79cd13be357-93eab16feedmr408120385a.36.1791463125801;
        Thu, 08 Oct 2026 05:38:45 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991fe1a1sm466011285a.43.2026.10.08.05.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 05:38:45 -0700 (PDT)
Message-ID: <02307f67-7767-4bc2-a701-f97e7343ee82@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 18:08:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM aux
 device IDs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX9B7e6wK3AH6V
 vAYlss4utbxHeItT58EAxxKfYhll7rtoHoECSH7Hh0AiKMBudpBkgPpPcXzBUw5kMIqWl4P2wBL
 IkoDMAKALIDA7kKTMKu+0C8T9zL610cyeo+dI+z6pEwuuFS0pZDBj/BRvrx1noqWYgSxjOIM8to
 4AXS55K1I155F1AkGSPBjBjo5x2P9q8nN0fMIkCLhwJz0HRNTmRtc7qo4Qgh0dZuYZ7cy0krajY
 i9iExI0u8Zoz6cjS3wfnPqejaSYRsc6XLfgO1kbXV1G22dXgWdAGGscHu7vuUHfeQ4s7tj8P5u2
 jiRtljmugTVYtlLMaTN/iBouzN8/mU2vrQknv9zs2nuvTNr94C+DEMj3DXBG6HvbJsR29/oScQH
 HHxv/WGxBoOfW8299B9CiDXXN9DafzGqkyQRMDLoDMs6MGEuktqHTcBl1waebG/oecBa7TiGCBy
 XIia2fvq2Fz+/Wy57NA==
X-Proofpoint-GUID: j9j8_Sv7dW4g1oFIyVM3HAjbVNoWo3wS
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac78ed7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P0qyw1g9NGlai0uqiZsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: j9j8_Sv7dW4g1oFIyVM3HAjbVNoWo3wS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MCBTYWx0ZWRfX8bYqR1c5UBmb
 CkttziTzItHsnMpfFe/9RXdlyyPDmdBvpI68eRHD8JOB+dDxXzFHhsgP0+zZBejJuh2ayhGs7QI
 GaNOrlRXuErI8t1CPMsmCbttp3Me61s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080050

On 10/8/2026 8:41 AM, Shawn Guo wrote:
> adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> to register the same device name. With ADC_TM channels on more than
> one PMIC, the second instance to probe fails:
> 
>   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
>   ...
>   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
>   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device
> 
> The ADC probe then fails as a whole, so that PMIC loses both its IIO
> channels and its thermal zones. This shows up on Nord, which has
> thermistor channels on two PMAU0102 PMICs.
> 
> Allocate the id from a driver-wide IDA and release it from the
> auxiliary device release callback. The ADC_TM driver matches on the
> device name only, so the instance number does not affect binding.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/iio/adc/qcom-spmi-adc5-gen3.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> index c68c6c5f6aca..f0b2544c1632 100644
> --- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> +++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
> @@ -15,6 +15,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/idr.h>
>  #include <linux/iio/adc/qcom-adc5-gen3-common.h>
>  #include <linux/iio/iio.h>
>  #include <linux/interrupt.h>
> @@ -608,7 +609,14 @@ static void adc5_gen3_delete_aux(void *data)
>  	auxiliary_device_delete(data);
>  }
>  
> -static void adc5_gen3_aux_device_release(struct device *dev) {}
> +static DEFINE_IDA(adc5_gen3_aux_ida);
> +
> +static void adc5_gen3_aux_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&adc5_gen3_aux_ida, adev->id);
> +}
>  
>  static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
>  {
> @@ -642,9 +650,16 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
>  
>  	aux_device->n_tm_channels = adc->n_tm_channels;
>  
> -	ret = auxiliary_device_init(&aux_device->aux_dev);
> -	if (ret)
> +	ret = ida_alloc(&adc5_gen3_aux_ida, GFP_KERNEL);
> +	if (ret < 0)
>  		return ret;
> +	aux_device->aux_dev.id = ret;
> +
> +	ret = auxiliary_device_init(&aux_device->aux_dev);
> +	if (ret) {
> +		ida_free(&adc5_gen3_aux_ida, aux_device->aux_dev.id);
> +		return ret;
> +	}

Thanks, this looks right.

Reviewed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

>  
>  	ret = devm_add_action_or_reset(adc->dev, adc5_gen3_uninit_aux,
>  				       &aux_device->aux_dev);

