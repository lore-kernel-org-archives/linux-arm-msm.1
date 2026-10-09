Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015B4D487B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545801; cv=none; b=Toha89N6XeDtrkrgFx193iPb5r80ab5Bbbnxgrnz3ZuI5QsNy9/RplPPpvIHmLy9aWTMr76UtbAnwgDxyvfPIC8YQgzb4EgCWgQYQx9UBQn1HG/rIMMFt2KwTIV05w6lqSN47i49jl7RkSvKOtk4ITOqjrIXWLtxz/kO/qqDBRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545801; c=relaxed/simple;
	bh=fSqnBG2yF18kOADnxH5nz6P+JiP6lhW/3+Fxloi+FYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/gD89RUM95VEemTET0zNb1Jub3E4kXZ43XyJ07PHd6kcuuzXo2dU7Vme4kd1z5DIbEH8rWFkqIgh/N2RGsOAVdlMCVpH05oulErIS6nGkI9vijS+CGQRGxOsciJU1Ldw1iWVdaX4eZqwGk4VJQJ9/bND21kvOTQSVr1f7lmKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmYvUBv/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hl3qZguR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmYvUBv/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hl3qZguR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KHAa906820
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 11:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LpoT01wAxSeGbAtr3r8DJqlxKzqo+vdrIEEQQ4fC6DE=; b=AmYvUBv/bs1sH++b
	a1yhg9FJDgQSLnbzQlc2Z7xH3CvA9h4hhopqh499NgtquM2X/2PeGRgEjkC/NV0p
	/rjmK88qTn6CifCrjWYlcRfdcGdcc/o9qqfXptPJB8A7yfhWMMpUoK0gRh4DYsXd
	o5n6BuE2p//kpV5D6HIk1FNmPdeD+3HNAg/jwGg89DENRJuMYMEhWNTOeoSxpzE3
	XGbb0qRz+USxTb0SEhf42fQ3ExDlAiE6+JpBWNj8+lgemwhHCT3iO+xVPl6iJMmh
	u5fl2+IoDRMzDogiNMo8EJxMMbJJ/ZBG9bLhu/N8OkFiMAdRpqPs5vcOGB0h2bVN
	0M7BmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqueau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:36:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so8345126a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791545791; x=1792150591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpoT01wAxSeGbAtr3r8DJqlxKzqo+vdrIEEQQ4fC6DE=;
        b=Hl3qZguRBi235XjF8AOLWaUMe/+brHbULdrRLgUwd8ZfIA5taCQUSXlUHIchShjWmn
         gEoDYE3cwbqRDI3w//8zXJvgzyosxFgfTmPeieVfv6bGmJ/eh74h76n9viu8GDMFjsgW
         OB6Ns8X99lzzxEf1vBgSWDNss6NUa+V+cRVH/p39sxEadfFoVVWX/X4z7KV+yTXSxo1c
         xSYnVd3IwEVKomfVNwQ8UxQqKGv6BeaHsf7BWL8lrKYOqI51QnSe4apzdLbJxVNgRg6Z
         oWSaXR7PDrvsesWVeMB6Z5A+oH6M1t+/TCny6I2xn95i+gGmtsLupBzoR3a1OgLqTJhP
         cmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545791; x=1792150591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpoT01wAxSeGbAtr3r8DJqlxKzqo+vdrIEEQQ4fC6DE=;
        b=A6A81P8KeSKKZFWFbjS6sWcYEl0RPH19+gl4z7jl4VZCa9hBgftpALnnyP9mxiIajG
         utL4iHgjcKuX44Da+dV4OJmTgkqGQueMC+/ciII+D/sFWUNStThEoqsVJY4wtBapI45k
         jzPUKZ2tBLCDFeBzjxStn8Oh3IfSSlvQtl5pwyviAB2ckRyQQFDHqLEQj/5sv7R0V2ky
         SNX2xKc6buOgz5mZdITFaUgk78StdLR1wOvqeAsD4rZ3GewXicdjwoGr1JTGw4PFC0ze
         acqvsiSSMVGFY20q6n+lnCy6FHCTg4fsmKkY/XlWvLK0ExlEqhuomBNYTWDs/bZYWBnf
         Lytg==
X-Forwarded-Encrypted: i=1; AKwUvBxY57fdV2zVPrlZL4Xpdvd4qHnZVIbjwmMxA1zPjHNy0ybfy1/JZ7HW6pGmRMOEWGGiaz3EEg9Lt8ZVWd3T@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6kxoM/Js2Le84ysVz3jN4j5aoCLO6ka3/vktLEct1vJhrV6QN
	46wmGx9ClLfckXLQrI66Cad6KVLkarLBYskGQWp8lzABKO4D6yMChSC/x0Ls/yV5AN1XNSn/PsT
	lL7aOkN0V9aY8rrEXnch3gRlVZhj44be3saK7RIke1vOvfHSuqK2N/7glgaNREBF8ORW0
X-Gm-Gg: AYBFou1HnKhz51mxs9uA8H4MkNqSl5mCCiJPwL7ONrlUMe1Ro8qubATzJ1MYzqYb9aC
	vK4FlG9kmV8EV3LKc4STxXgPKa0xXLNYAbUzzDUA/xe1SEFyoLTMdbM2sRpdmRcPiRZVuK7DuNT
	GFAdM2B632uqi7QJJdlMxlblx31AJMBIzd8WCU3b2G0AAjwUZ5/eyNwHbBSwtX3HuuQQWt8ylNn
	Ei7HP5RgxkO5gg3yATgHaYLZmVfZETnXKYoj/X66K+olwqJObi+y759/YQWjE0mf5x/aZUoOIcc
	zV3JquP8BxcGK8QUJBwIeScKf7+PcvN0yZTXEZ5rEGaKWV6uB3bGqoDQpp4h6a+nbJs6UXuj272
	xpC/EkMNg64W+6fzqnZnLv9VR2mdqMcoI8Zol4vvi2PJ7MQtG6kXWa/ktbgCP3/w=
X-Received: by 2002:a17:90b:224c:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ab3a8d16dbmr1720384a91.41.1791545790950;
        Fri, 09 Oct 2026 04:36:30 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3ab3a8d16dbmr1720362a91.41.1791545790450;
        Fri, 09 Oct 2026 04:36:30 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37163e21sm3634153a91.14.2026.10.09.04.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 04:36:30 -0700 (PDT)
Message-ID: <9afa48c4-b5b7-43b8-80e5-d829906a2088@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 19:36:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 08/12] media: qcom: camss: vfe: Add support for VFE
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, bod@kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-8-b2c583ef50e0@oss.qualcomm.com>
 <179149982796.2596899.756044515233442982.b4-reply@b4>
 <7452d85d-83a8-493c-8d74-5020ab72982d@oss.qualcomm.com>
 <8a2ff836-57ce-4df6-aaae-0db3f36e8b58@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <8a2ff836-57ce-4df6-aaae-0db3f36e8b58@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NiBTYWx0ZWRfX+bQMOtbM8xjN
 ftsNnHEzZ3lyAOWp0JWQhgfRCrBBV9F3O49ePe00MKslvIzUkkmG3wFnZzkNleRd3yx/7dxmmJq
 gnE6WBIMHaMUZsvpWX1uFE2gWE0lhGU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NiBTYWx0ZWRfX40TbdBIUhTvo
 GzaUCWmtfc3GeouZKjgL9w8KNQTBfCqdgNwYMescNw2/Osh2wwY75jRDYFdtV8Q2LYWE1aTE4LY
 PgvrQhF9MRzDZ4iCoEPi6b8Mzigixa4TAs8qsiHd9jp9ocLIq0Nlvgly4apZpcc2k4eCBl5NvDX
 TUZMwFdV+hTqkh8NtRzO2OMB5jTWqDFwwm9cvvn7tGGjHC6Imh4u1nxbclq++SAyBvU2bx+Pre2
 Mvm/Q6A1UB0ZW6WDH6rH79V0RtkP0bhbhZDJjAEHAg0ZF7pZrdFwIjGcD2GY2LWR17uOxhPLiYM
 htn88IQPWG3Y51GRjMcUjNPsdZgUPBxwiOu4FJtEX2R5Y1blWAUtym1Lg1UYqL0H3OTl7qrg7p5
 FSql4EL/0R6tkbgWeT2SKaQAxoYAG1oCRbxXi1vlM9KNRBzhpj0B/2EgV43dl6GF9TnWJqqh11B
 OYdj2YJ/9Td/dy0mFag==
X-Proofpoint-GUID: -0VF_6_tlVmYvmzV_B1sxIGCwe0CY76T
X-Proofpoint-ORIG-GUID: -0VF_6_tlVmYvmzV_B1sxIGCwe0CY76T
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8d1bf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CGVMczJOcLXbesxPaW8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090046

On 10/9/2026 4:39 PM, Bryan O'Donoghue wrote:
> On 09/10/2026 03:59, Hangxiang Ma wrote:
>>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/ 
>>>> media/platform/qcom/camss/Makefile
>>>> index 218ba3a95939..42a14e8fe1b7 100644
>>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>>> @@ -26,6 +26,7 @@ qcom-camss-objs += \
>>>>           camss-vfe-340.o \
>>>>           camss-vfe-480.o \
>>>>           camss-vfe-680.o \
>>>> +        camss-vfe-1080.o \
>>>
>>> Can't say I'm 1000000% clear on when reg_update() is supposed to 
>>> happen in
>>> the flow of the logic you have here.
>>>
>>> I'm a bit suspicious of adding a new flag which skips the update but
>>> assumes some other bit of code executes later and does that update.
>>>
>>> Can you explain this some more please.
>>>
>>
>> Thanks for the review. These points were discussed in an earlier 
>> revision, but I should have explained them directly in this version.
>>
>> Vijay once clarified that the configuration principle became more 
>> strict since Kaanapali. We can back to <https://lore.kernel.org/ 
>> all/662a21a3- de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com/> for more 
>> details.
>>
>> In short, the hardware guidance asks to issue the REG_UPDATE after all 
>> of the CSID configuration registers are written. Kaanapali seems to 
>> have very strict dependency in the hardware about this sequence and 
>> with the original sequence, no RUP DONE or BUF DONE events are 
>> received at all. While other chipsets can work normally.
> 
> But how/where are we saying that happens ?
> 
> ---
> bod

Hi Bryan,

When reg_update_after_csid_config is set, vfe_enable_output_v2() loads
the buffers but skips reg_update. The RUP is written later from
csid_configure_stream(), after the RX and RDI configuration.

On stream start:

video_start_streaming()
   s_stream(1) on VFE              <- walked upstream from video node
     vfe_enable_output_v2()        <- only load buffers, no reg_update
   s_stream(1) on CSID
     csid_set_stream()
       csid_configure_stream()     <- if need_vc_update, else not
         program RX config
         for each VC:
           program RDI and RX VC config
           AUP + RUP (__csid_reg_update covers both)
           RDI_CTRL start

On this path the VFE reg_update is itself a CSID write, CSID_AUP_CMD
and RUP_SET in csid_subdev_reg_update(), not a VFE register write.
RUP goes in after the configuration writes. Only the RDI_CTRL start
command follows it.

The video streaming function walks the pipeline upstream from the video 
node and calls s_stream(1) on each subdev in turn, so the VFE is always 
started before the CSID. What isn't obvious is that 
vfe_enable_output_v2() depends on that order to get its RUP issued at all.

On Kaanapali, REG_UPDATE has to come after the CSID configuration is 
written, otherwise no RUP DONE or BUF DONE is seen. I haven't reproduced 
the failure case myself as no BUF_DONE count mismatch and frame missing 
events are observed. So I think the information get from hardware 
guidance should be reliable. Thanks.

---
Best Regards,
Hangxiang
