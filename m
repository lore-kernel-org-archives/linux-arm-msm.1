Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA922BEC2B
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765628; cv=none; b=BaNcwLOgB4MvDfsOL+Byo7J3Z8WGRt0TfSeV73wl2hJIyHpBy9X34Ga3tO57tfjz7IAc58Lq/C8Zubc6cwvjMhY7sMGu6So7+XRUwFyX39ELcWztFpbMM7wzcbCl81UmPQO/VfHSa/A/Ovz/mEH8XeBjHgnacVk7mfdeSCRfHVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765628; c=relaxed/simple;
	bh=RjeFzdCXL+NHFyMq3/xT9cd8LkEcbtMX18oNa+YN0BI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UciuyHtEoFbyiTE8N+Bnm9KIA7ImY4/3T3OdXv5AetVlzZuW2/RiRF0gV3UhlGX7Kg9kMrryT5CPQjYm5dJgxeRaOIi7973+VwzNbXXoIRftLyVWV02ci/6pW2aATmudsd/4GCN5YpiiNQ48rFMAz/T5NKEzfrZ943NVXQ8zOns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr7i0/Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqhPAIps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr7i0/Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqhPAIps"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRp4W1047165
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 14:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKfDnl36SXijj5vK7jAVVLNegdlF1dNn5bPXXAHyHOI=; b=nr7i0/GdV00Fgv2s
	Lp7UPsWwvMlcl2PbGW/rEJf6/yPPdBaB+ABwH/ID6bPVjh945vRDcNjC67MGNv+U
	B3jgX/60smLpjl5myqKYEnRuee1salsn2bxzkp0Y0EP/1Fv/XrEJMrL/7d/adKhm
	iux0ELYKYfYp4F4kKTtqvThBzmXt8vc1Gykj3lrhDUuZ8a60Ccs6VkgPLz2uimQw
	QLHc4wqrbOryBjgEvaZByZHZMp4qYMOhGkrx8LiDf5prEgWer/esrxi/ST6JQ6CD
	Af9Ownj/skwR4FP/RNwtUCd6W8G5rQAsXTHJRouXJXSPD6NIoIO7ROprc/EUIiUB
	YNTO0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9uwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 14:00:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso5759321a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785765623; x=1786370423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKfDnl36SXijj5vK7jAVVLNegdlF1dNn5bPXXAHyHOI=;
        b=eqhPAIpsnOH4LJYy0VhjdLCg53XcjvbZukzoq+4rh1x3u5a40vTKglsbG+eTliGhRl
         mKv1XBRWMSVcEYmGRowlu+G0CI/0P401+3S+mTJbwhOJOVZg/58F5mGYCQro0pntiWZM
         dMBAVD4x2A2uq9LoKKIcqiKT5EjGGIQIeO4fWHLk/tFFp2CSVycT7YhWMvx+IlwXD295
         kn90qEE4uUq31nZe3wcms4pw4H5HRNg2rTFmIyxwLIvARj0N7kI+/b2gqQQqAWGkUU9R
         WEWEAjLzejakZJ+WN/JKPoghwYFKwph71J7DlJ6CA7eEeHVcZiE0n5Z+BafFvh4jSIpp
         GTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765623; x=1786370423;
        h=content-transfer-encoding:content-language:content-type:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKfDnl36SXijj5vK7jAVVLNegdlF1dNn5bPXXAHyHOI=;
        b=fhvcqkiO4u242dTtysXGErcDXytzeaj36+Zi7a6Z1Vf3Z+RQFURXgAFH4hXTrvDMpm
         JBXMHgb1SCaqQxskrFbFn2oLRSI0cqUk5DMniwhgbiBdQQxFZ9PZa6B1/lJlvjAanZsY
         fp5FieZDRxpFSo5zoToduidEmAVT56Be3MUeenl1i85nHj2odOv5th1LC+5Ce6GyDrvD
         uAt8iYP/e6TgrrUzRgtW+xDZBDsg8wiqbhd5ZgRP7b3s+B61VcytrbBscJBIfE/g8JK8
         rGlYs3c/cc8haE/mO4cce4B9h5Kw6LCe0yjLWTHxzr3kqYLAHhLp+heHIUKCrrQEEJa4
         BlJw==
X-Forwarded-Encrypted: i=1; AHgh+RoRP8fawY8f/IzCpfLjvXKIX0BmqbK+WRxT6rjm4k2CFL7aI63zI9S9TMVaWSGMnXU/gC+AmVcqjXmbFKlv@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcwTwp5WvAAHi27+kTvJdHE5hxMxYURVHjdeJzVXw/84DPVF2
	SAfT2zPmRFvvperDUxnquEEv204oJOrzGW4LTT9O1PYZbcbUWfK/lYZB5s2Ni0mVOIYmzBcW4YP
	EviI3M//zac33zq9/kEaCs8brR8uHBib/+mN57xvTP7cWvZND76mW5+Uv4iJL6WDNpAFMm2Fr2/
	yy
X-Gm-Gg: AR+sD13/RK04Jq024oVkPRhuW38GFVzOSY6oCWm81MnBMXAE2nNptrH9IvoGpNE9YEd
	4/fRIFELo7VRUqbZcb+N2JyjdNQ3A4MqQ0Yud79dqQYewNUAWRfWkfeotvXkocuYuRiqX/jI+d8
	TVmACV7Nl8ZXBj9Jyjq7+cEhrQ10pa7WF9ozbjEY5wMwhceetgkY4SFYihMw2F1jAQNwCej+U4o
	Q/r2W4AhWxuiPcdh8pZt/mlbDbNBqO1sqMNA4TEaLg921UPYPhFzpvIQ14HyzbN2gWpSz9o2wls
	wkHk3wzbRqWA5edHD4b/Zb6o0TC2OpCf4w4t48FvpUkMe0mbasdrR1+BcgBt9LBdQV++KJRT/lJ
	7xCZrxGjfXyEPmk4Mx+DNHfUT7GwxHA==
X-Received: by 2002:a05:6a21:4683:b0:3c3:b57b:6455 with SMTP id adf61e73a8af0-3c92a846c3dmr11146389637.49.1785765623223;
        Mon, 03 Aug 2026 07:00:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:4683:b0:3c3:b57b:6455 with SMTP id adf61e73a8af0-3c92a846c3dmr11146165637.49.1785765621378;
        Mon, 03 Aug 2026 07:00:21 -0700 (PDT)
Received: from [192.168.29.77] ([49.43.218.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e107sm43434358eec.27.2026.08.03.07.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 07:00:20 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] mmc: sdhci-msm: Reprogram crypto keys during host
 hardware initialization
To: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, quic_dmukhopa@quicinc.com,
        quic_rampraka@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_gaurkash@quicinc.com, quic_sartgarg@quicinc.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260730140822.1976635-1-neeraj.soni@oss.qualcomm.com>
 <20260730140822.1976635-3-neeraj.soni@oss.qualcomm.com>
 <20260730191823.GD3139@sol>
 <6c795412-ab63-22f9-0b64-8bc746fc2773@oss.qualcomm.com>
 <20260731061246.GB57540@sol>
 <5af5ea26-9cf6-4cce-8cdf-7b5acb773608@oss.qualcomm.com>
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Message-ID: <4ca7b3c5-7efc-bf60-4f24-caefd96c391c@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 19:30:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5af5ea26-9cf6-4cce-8cdf-7b5acb773608@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyNSBTYWx0ZWRfX+e3JXzkMINS9
 lItQsM8NU4Q1Iep6sEUwdpidpz8R2VThptsNo7QPMfqMizkDHBPbMsNSCyCADasoHU3Ped2SoKa
 PHAN++H1DydtAaAfz9WsooW6BPgR4hc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyNSBTYWx0ZWRfX6k5RvZWMoJve
 OTIGM7IMKqGFGHutKPyEyTeX4nldPH5EyRv7xa/EERfo319mY8/11RzrWJMIaOXhQA9qanyB2Xj
 dm0/+zXCtq4UG8IKpXO0o7FZL3yr/X0+gnszW5TAcMcEE734QSLaZhMFssYjENLYUe4l/69F0Zw
 Mz+F5V3aYOP73lFBLqyfw3BHuqbyu7Jy8O/fe8FUOYTWt2WhgrFhvX8HOhDYhO8Cz0x16JbJasI
 5otBtY2ZJrjKFbKHC7f3bmw/C7mcBhi73zodmd18INaNWo+oVRiEXaqkgASt/vIFDvj+oDEZqka
 6QngYnw1309Q7KKtyGV+X4h80aY5IJQalt8GkmAr4q2n7Qy2FIrBKONFgJE07KKXPySl8steUVu
 CZGnIHhikCkeLyGkWokt50hY/OdOlI0pmPThaKuL1w+Ji2jSVkWjL1BadwQc7tqNZ2y+/Xdostp
 56ACJDGA1P6U9CGJ4yA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a709ef8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=9qtqvq33Fd9BUailxVlm8w==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=LDBv8-xUAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=kJZwEO8prvA8Bnpbhs4A:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=DZeXCJrVpAJBw65Qk4Ds:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fcQxPMlMOteukCYg-ah__kKJCNW6qPUB
X-Proofpoint-ORIG-GUID: fcQxPMlMOteukCYg-ah__kKJCNW6qPUB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030125



On 7/31/2026 6:14 PM, Ram Prakash Gupta wrote:
> 
> 
> On 7/31/2026 11:42 AM, Eric Biggers wrote:
>> On Fri, Jul 31, 2026 at 11:37:44AM +0530, Neeraj Soni wrote:
>>>
>>>
>>> On 7/31/2026 12:48 AM, Eric Biggers wrote:
>>>> On Thu, Jul 30, 2026 at 07:38:20PM +0530, Neeraj Soni wrote:
>>>>> Host looses the Inline Crypto Engine (ICE) keys during hardware reset.
>>>>> Re-program the keys while intializing ICE to ensure that ICE is available
>>>>> in the same state as before the hardware reset.
>>>>>
>>>>> Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-program of ICE keys
>>>>> is not needed during MMC runtime suspend/resume.
>>>>>
>>>>> Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
>>>>> Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>>>> Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>> Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
>>>>> Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
>>>>> ---
>>>>>  drivers/mmc/host/sdhci-msm.c | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>>>> index 4aff965f0e2e..7d71dc6f388d 100644
>>>>> --- a/drivers/mmc/host/sdhci-msm.c
>>>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>>>> @@ -1958,7 +1958,10 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>>>>>  				cap.sdus_mask * 512;
>>>>>  	}
>>>>>  
>>>>> +	blk_crypto_reprogram_all_keys(&mmc->crypto_profile);
>>>>> +
>>>>
>>>> This still does nothing.  The crypto profile was just initialized, so no
>>>> keyslots are in-use and blk_crypto_reprogram_all_keys() does nothing.
>>>>
>>> This is needed to address those scenarios where device is running in a
>>> stable state and only the host hardware goes for a reset, for example,
>>> to recover from an error state or stall.
>>
>> Nope.  Please check the actual code.  This is called only at driver
>> probe time.  Again, the crypto profile was just initialized, and no
>> keyslots are in-use.  It is a no-op.  Maybe you intended it to do
>> something else, but that is not what it actually does.
>>
>> - Eric
> 
> Hi Neeraj,
> 
> earlier change for blk_crypto_reprogram_all_keys() in sdhci_msm_gcc_reset() was required
> when .hw_reset from sdhci_ops was overwritten with sdhi_msm_gcc_reset internally for robust
> error recovery but this changed after https://lore.kernel.org/all/20220408080045.6497-4-wsa+renesas@sang-engineering.com/
> 
> we plan to rework recovery soon and we will take care of key reprogramming as part of that.
> For time being you can drop this, as Eric pointed out, this is redundant.
>
Ack. Will fix this in v6.
 
> Thanks,
> Ram
>
Regards
Neeraj
 
> 
> 
> 
