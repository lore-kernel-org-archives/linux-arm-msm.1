Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800664;
	b=QVRFAucNtq/jFhj4ADX+nymgPXRJ/M9Jp7jVJkRu9Wkr6lVKmbitnQtdtUdhOPMsdt46
	 06MNTj2DfjInF3TZjvn0SUJhyg2CGWpJem25so8hLET48tTGULHJ/h07W+yRFfvDUQU6B
	 KTFH+9mss4vKvmHWK11kNqCQaBzjgvviI24m6wfV/hV7nN9ZQjorWjlS9aYV2MLjsPDDa
	 utIxoa5en8tHYONDFi3LvqU5zO7YT7IazmHS+S9kzzeq69/6Ag8POCmczABOWijD/BT8f
	 /jXilC2gSf/o3gRHP4n5npyDjIjwMzSUpsi5K/LXKZquNMRW05Xf3ZelewZjTInCWlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
	b=MvMnEFach6QK9xQb1JmZ/r7A4CC7j7fPhSL//HdJFEdrK6QfLaG1L5pqEgMExXT8bj3X
	 MsSfx5255zOVDjczGuW+4GVYlInP0UJ6aDr8K+RHvmSNfrTKVBX4O8wk4sraIZfheJoAd
	 +tOYtgCAPK4wDprtDmIku0MIWsOtOSJu6+js+er7AwyTx8dVRmEZoP0gNoyGMeghOxsg4
	 8DZX4DTVs0KHFzJFSyOzINniL/gPwC1/vqJHkJTZzE79WabTFZTGF/WkfM1AM+sznCrul
	 D7K8BUpMMV5S9+HCzjDnpLTnm+xTxlYgU5FYzVXNezgTyoGqIKPBaKHxCwS6NFcG+7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E44606A337
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 13:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E44606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqgyJjOI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iKmhtW9w
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxpe119406
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 13:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=; b=OqgyJjOIOi6iq+fd
	6/3OBwbnpSFHEDMFcK7Im0ACldgSNml8YIy0PJwjZAU1hj2G5fzGu+hHMp8056s7
	Olncqm0L78ev3PsNmS0/XHdwu61jdjOZEfqcqK4/0x6Y+D/hvNGkv30UNI/jO5y4
	8A7QyyMBeSaMmEs2VHEnZQo1rRVCZ6ZepqX8m9SCIEmSfeDBz9UA1ipEZo1x3dG9
	UHkaeWa7OpfFDAWhjEFmCsDrvthSADRAjhDR66qfTf5bH9LgzFQ+qZMryQEH7oPj
	yAH3gkR4bN1RZKuYPffLbDXg9h5kHvAIGCJd8fmRPWy7yukYEcps+E33R/cXv87T
	65Zlew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb0a9u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 13:57:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso2665588eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800663; x=1794405463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=iKmhtW9wZmHN45O287/KnhiDYIBjv8PNNqn6CK7AKAkJkNN+ycBQZzKEfjz1UC3Vqb
         /2P4ovSauS6AfbvyuwFtEoMhZG25InJ9gQVqe+eZTgO6xlbMmt+YpnbSi6Dc9HjdEBoJ
         OMGrZhP//IJZgbNVsMkfSV4TpZro1rwwF8YflXeeVD2hv5sbWX9NtaQdTlpFNmzkQ9Wv
         VfAsFO2ldbULk7fOJujKPCbwMnhra+YuKLUYHOQlOy8k/bQmX3Eg41UYaztGA28SwVRL
         T/F7OC+0WH5jQxVd1JJ06BmQ/mN4wtb5EXQndPtQf4a1X9luGr9SRDhY/qaWEopHQoKS
         HUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800663; x=1794405463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eo4Ci/+bsVZNIxUk+iOREP8Nc4wf2GCzgefx03HrhMQ=;
        b=x97JoTBuBs8IyNgtKkW+taJ0nNTe5TthdPGuyHfmwhghUihVucy+6Q+YKN0dKSp56B
         Tw0t0yhxeWu+pMi4DrIZ3P3pBQqrjRuuvSuwaBfu3beWK//SRAjWI5KFuDF9ZC2P8o8K
         loDEhwFXih7blzcn6nRzhC+GKneTYYRslWHYRLs7G3J4TthJiX1yAsm8RymI0Oh5EnjE
         kUdLe/31Rwx17UgQTHimKi3wy8ej7dBCz9fUrnkmwz3/ze1kbXnWvZbnrd8UjPzH6p0t
         oBptayx9kQ3iVZisDDOJ3EvEVqCogvhuGnMJCB+stM+Xt2Ln28fCCv8aiR2x2MdXZ5YR
         9C2A==
X-Forwarded-Encrypted: i=1; AKwUvBwa2Zh7ApFm5PpyuH75p6H2MN/oAOknctcYK46BJFBuipE9RZTjw/fxCF3Wo6iioLwqkl3dBvKS3t5k4ZIS@vger.kernel.org
X-Gm-Message-State: APuU4Z9s17QlJ5YKqgna+yjbKeDBuykamEO0Lm6hYbWhVmxZiygJuoIv
	OKGHcuTMDRmeMgtJJTGmkAUi8lx3+1+EYtu0M54hIgSFGL1Y6wLTijO58cA3Y8/O+AN4s9Cm1Wq
	wq1sKDYNcW/bANXjR8FhQ3p6Np6cafWht7I4AY/3P171XKJkKFoq8jIex9hY3gYn2cs5K
X-Gm-Gg: AYBFou0UYuFl8h8PPrjZJ43lzvFfLfmTEnhvEma19T40NDdcUwxj2NW//ir5QClZr+G
	oIJe2r/dyOvsN15jWMvdlIGSOtdy5qHzxyhzvW1o9nHMvV2DASVHUsZwC5nCNFV0E5DvleLFEH+
	w9w9IL2MkAIZ8MmMLRKKLJZstMWEWSBvB+ikqontJq0A9p0pc6XiljwYE1olsDywwsow4nyfopU
	9KonW+zoNDVXKV6Wp16CnsDaY8qNyNtAwiryF1s/G8V39FpnNlfDAZXd0uGZr2M5BNvz4R8P+O0
	RQTGE4loa2Md52AEu3UI855PnzEthnqM7lt6W7Bg2G21vHk/opfSofFE0QTa9cUrNpnTsLCVBjM
	7NCnXghdGnNaT+YYp1m8E8HfmzoxIDTZ1pne3YmvoXhCXpTFAQSZ1YwOhGkRygcdE+2AOtHsV+k
	0/uZL2mPWo+wr2GTZ//sVC2eHXibFMqoMRxDPmqN4=
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419815c88.11.1793800662396;
        Wed, 04 Nov 2026 05:57:42 -0800 (PST)
X-Received: by 2002:a05:7022:eb50:10b0:183:942e:8493 with SMTP id a92af1059eb24-1ac5a67f97bmr24419767c88.11.1793800661636;
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Received: from [192.168.1.2] ([122.177.242.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm7874697c88.3.2026.11.04.05.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:57:41 -0800 (PST)
Message-ID: <59c79112-0079-42b0-b6c2-d311f20e0dd2@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 19:27:32 +0530
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
Subject: Re: [RFC PATCH 1/1] usb: dwc3: qcom: Keep wakeup option default off
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103061401.2942139-1-peter.chen@oss.qualcomm.com>
 <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261103061401.2942139-2-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX/lbrrHMrXi8H
 ELWV/L1rtt88PDQ1mHAH6dNs8d/w/i50Rq6O7IVRciQ5Xcbn6uLz7a7Yb+H0cZsIvXFcEi3iW7M
 9rDCQ/1wtwjWaYnAkeer8ugnobPW4yE=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb39d7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=4cW2FY/XLap1olThQF9nEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X1iYf39TFmsXOEfCDxQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: IS5kZBI92Em4CEKd-TI_1lpJ0aI8kqRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX0z7wPMY5xfXP
 ODPbN+rWizs+5xo91QDeUxxWHSVsIUyGSqrECvzgLrNkiIqI44WuU67DR8jhPcCqNYkA8P79snv
 RjLddIQ9h9pknFOje9um27rXSDRc6FOQX3YwyAtu/3W5PZCcF5ce+FbWkLC7Gvp5XE38pBzzWWV
 tFWA7DGUM813bz9BXSsl3jHoGIy0+qK4ck0fAfdXFfPALrE2pm5sY8w9GF1IDEzWjpFAGbVFQg2
 J6lUUSvs/+yVpC1I4lZZZLfFzE1TIQoRBU3Wzz3DgF/K1LkBpQsK5WJlcsrvroucVqgXoBZ0M4H
 0jLN/Sihv8l+JbHU2jHf/n9SLH5/E0I3mhxS0/OwpJOqBKn7kV4F3e6DHbAkCEbk8s0Xh9/ht+9
 EMcWLUBicezVwcu7j0wlGeFL8kR40QU6us9ROgudswoJH6dpIW5cAhOQ/TkgkZdBrOZBu/sn4w+
 qhvGvFFJe+5d1hq6kJg==
X-Proofpoint-ORIG-GUID: IS5kZBI92Em4CEKd-TI_1lpJ0aI8kqRW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055



On 11/3/2026 11:44 AM, Peter Chen wrote:
> The "wakeup-source" property, as described in
> Documentation/devicetree/bindings/power/wakeup-source.txt, only says
> that a device is capable of waking up the system. Whether wakeup is
> actually enabled is a policy decision, and drivers use
> device_may_wakeup() to decide whether to arm the hardware wakeup logic.
> 
> Currently dwc3-qcom calls device_init_wakeup(dev, true) when the
> property is present, so USB wakeup is enabled by default and users who
> do not want USB activity (e.g. connect/disconnect) to wake up the system
> may have to disable it through power/wakeup, otherwise, unexpected wakeup
> may happen.
> 
> Having wakeup enabled by default also costs power. In host mode,
> when device_may_wakeup() is true, system suspend keeps the controller
> and PHYs powered (dwc3_core_exit() is skipped and the genpd is not
> powered off) so that the wakeup interrupts can fire, even on systems
> where USB is never used as a wakeup source and could be fully powered
> off.
> 
> For USB controllers, keep the wakeup option default off and only mark
> the device as wakeup capable, so that the user decides which USB port
> is used as a system wakeup source. Users who need it can enable it with:
> 
>    echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup
> 
> While at it, drop the local wakeup_source variable and use
> device_property_read_bool() like the other property reads in probe.
> 

++cros-qcom-dts-watchers since this is used in chromium userspace and 
modifications might be needed there as well.

Regards,
Krishna,

> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8116dc94c181..1451b5eaccce 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -653,7 +653,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	struct resource		*r;
>   	int			ret;
>   	bool			ignore_pipe_clk;
> -	bool			wakeup_source;
>   
>   	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>   	if (!qcom)
> @@ -757,8 +756,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto remove_core;
>   
> -	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
> -	device_init_wakeup(&pdev->dev, wakeup_source);
> +	if (device_property_read_bool(dev, "wakeup-source"))
> +		device_set_wakeup_capable(dev, true);
>   
>   	qcom->is_suspended = false;
>   

