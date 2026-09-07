Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DC13AAF6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788791309; cv=none; b=BrgLl0UvBxh4IPfxRWAnMLIu4S1wYNZzE8YRHP7ytdVqBlhMwgLY0rawDaO5DpCpNuPsHncXmXZuM1kMQhDOLlhMj9odPAusq43rnnwxU4TDOcuNPPut551gQuHsoggP+Sii4HuUCNIMHIscZl4hc/pRFBh7+zuGijtZI7or+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788791309; c=relaxed/simple;
	bh=FaD26F1hjDGU7YdmsMYF2tmo6eU1dKriXvKBCTWPLv0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sH0I9CKBgfMRtNfKIX9oMbY5/Xn8OAr5He+S9KoSCtU54xo9rnJLsAOhwkmMY+xheSYa98Yqcg6O7ubmumz5cX6EHk0lXCy0xn8A8bfW9DwN/aoaWaHOHzpV/GOqbzbeQNUkzEmg/lzViKMA5EJYhDQ3gsf/MkKPNUrcbTe1F2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cL6cWM3u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1FIwVnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cL6cWM3u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1FIwVnx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdLng1183581
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 14:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=; b=cL6cWM3u0hVwntwq
	gH0kPyquT4TA0l7KwGuexA4YqhmRMrGeuhz7E2Xbl8oOxlWqB+1FcN5HeW4UgSKK
	D1XGXet3UoMmAP+h+BfHzbl12t/BuU7E1BgxTYBs6mG1a/0unqU1c6F/CCvLGPWo
	gNlx4Sdz6qWsW9xjoq2NY4C1IGNLZpaJnhZ+6CKlfjdaoJHAibfZBtPoY818oPqS
	WeYpAITB3y7jABXquJ49hW5yb+7xYRAhXy44YxyMbvv8suzFCm+kLYq17XTMR6zU
	fZ2cdXKQaKuFAwZz4TDKZdjuNilYWvmFPks8HNKP3CuCxUyJmTwLWCkTcvJis0Y7
	iUDGCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua9t6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 14:28:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ff0dbeaabso3033481cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788791300; x=1789396100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=N1FIwVnxxJ2adMHDpW4BXY8lkre5HH8F9i5OtZywND3G7NGlTiNc3A7WUckEW8sKgd
         D9hQw/mIj+qnE3bLHTLxk/M7MQ3kz8MIL6+12R5rKPWVNo3MJxRvOpKhq/JQTp6xQ0Dn
         Jboekcwicbky1yN6miiDlgIOpS5gPfcUmmaVpvBSIp+qvmw9Ynsnnvqm0pdeSfGJ8Wei
         0/4YfIBpj9BqHl1SnjM2T9V3sxcZTr7bMQm9ew/py8Wq+lYAOgDrM7kjlcCkNArIojd/
         B9URUBfYvz0QD3SElsda6zF5GpBTmmK3CRyvUN7VKLmcBBkJh/b8G4P251Psoa/FliLy
         AtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791300; x=1789396100;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aESJFpz09VdSP8sMubuL81LkJsF+Eo1ATJT/zPwx+64=;
        b=eGuvwCOZH5oVjeWRDBPnNx8CYv5DfZxnL7pe+JNrq3zsHAARlCYRTaffAsO/KD91TC
         +NdHFcADqgRQqa9fMpfF0opd4Eqvm6Vf/KNMoKrTRTDCBEKB+XRkrRYVCHz+W/bKe9Co
         1HsjTk+SHwCNQ/9RamxyOvQM3n3KKQGtNbifDxcdu0Tj8FDT07on9+Zv4ekfgtbZYaHo
         rHFrFeeE+kF6Rt8alYAZ94gjeu9ikYMWKhMDp8/KA6etQwdW3puSjzxzy+Xc/+x57jeE
         3s7fWIHzv158tJFng9/k2j+GGDZg2/e3cZbty2l2o9b23d0pgCvRMxRO1Pkf/WxxIAcY
         cPaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkSJ+M01scCeCa46HKBdl27YeBfQOPDVRLU7z8qF2rqq5mcHtdjxbTnacWPeXFo24051bcGI1AKkWL4sAZ@vger.kernel.org
X-Gm-Message-State: AFuF++nNEfXWHyvfSEgqiilv92/9fgLavBXG5a0BR/+ddvKEUpUP5Wz5
	WYPUd9MEEuSr+81Ir9BHAUM89xC+MtC1td/ZroEI/gYkGPtBJBUoSwZBkgi37h1tRYj/Yoj3215
	L4gLWoCiPnDAVqekoHXqS1nOdaDk1a7GkIvz34IojUaKtg/iAv0Jco0GR4mkl/XfuRd1T
X-Gm-Gg: AYBFou3G2w20YiPl+PATXBbVEjl0xBg6KRZdga9PCrakvR4+eQfX1HSGdaJ5XN8fp+G
	j3j+D0sjouahMxqITGADDBQaYYrWboaiWoIELxJbkpUggfDkQl35VO5frswDaTePTVgQXWtRWZ8
	1XQxwDmFODjtOltSjOcB9jd6+oDk3OY3It7IG4lVSLn5qMyMNAX74I3KUUm1AdBlqVPMj0Thrj6
	Z8BbXO/+iLeeWPlHcUl1Lt/26FWklQgcbbSbHAp52lbEptexPuqrzv0K+RbYH2nhYNlYBsvGFUw
	juC4ydeBBS7xtNYPlnx9knRJwcDCwYTzggRdOhgLjdCEL37ynESao2lx1ss984ec/kWT0TfXYEB
	KdiNeYivA6MAUSwNdc/tnFztlEG3Bj96aFQ==
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135274891cf.0.1788791300052;
        Mon, 07 Sep 2026 07:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:51a:8945:312d with SMTP id d75a77b69052e-5306440e830mr135270981cf.0.1788791296478;
        Mon, 07 Sep 2026 07:28:16 -0700 (PDT)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm196469495e9.5.2026.09.07.07.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 07:28:15 -0700 (PDT)
Message-ID: <81915983-b16a-4647-a623-3176c70a1782@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904-msm8952-pinctrl-v4-0-671475ed1397@mainlining.org>
 <20260904-msm8952-pinctrl-v4-2-671475ed1397@mainlining.org>
 <ef41a092-cd83-4e65-a16a-7a8b838bcb63@oss.qualcomm.com>
 <f27df150-f21f-4721-9fbc-1bea7dd0f05e@mainlining.org>
 <d1ec9149-7034-4002-beaf-d389f0603fc3@oss.qualcomm.com>
 <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Language: en-US
In-Reply-To: <c8f9e9c9-d619-4094-8968-c162d6b2b361@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rml4r0iJGIariGc8rrCDFSS4GIPEzRdr
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9eca05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8L-9JjF5_uZRE6cqQ9cA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Rml4r0iJGIariGc8rrCDFSS4GIPEzRdr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfXwFoObKY5pBLl
 7ndRtDzfYghc4Nz6YdXzcCoOVwgnwU0OFOUvesFaBIJuX2hRtjRHXccxauKl/880BgPl0TQjY4S
 hX2SaRz6+sD13YLkXSOvPULPZ1dsmEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MCBTYWx0ZWRfX80yHrEAKP8XB
 LMGWjBuLN1Y5rIpjc6rrbNWpY/5U8UQDwPrjris7lxigFhoH2MuVwx0LBiO0svyHh4WjAfyIgcu
 YvoGkeiKr6G7JXcQttN147Yw+up0zUh8bEYR4vOd9EevySqbRugqHH0Gepvm1F4HV64FHgt9eTJ
 SJV36mkxC0K8z01WYIUX8c6AwBeZ0SOzyqnlJVNTVupwe+vYdbXBVz2y9jrVEf541+SEwwkV86s
 gDms/O53Ld1EsIDXinr/8wXmIqBlVnXsEG6H43wfLBeRUU7X9kxOJ7NAObB06qfU2s23oZkRBL2
 6k2xIVHE/ggSHe8hAMMVIMf/NrFTw6vALOWYOPI1SWkW/cRhlRdR+osXsHEoH/fug/xWexoDw4F
 A/8DtT6FZdtv1Tkd6TXkMA3AN8A6u5rKCF2FS+ITKOsfNnJtMkVBAq0uZqpbNRFf5LRqQjXMWZc
 RbLllqjbHcIbqtwT9qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070160

On 9/7/26 4:19 PM, Muzaffer Kadir wrote:
> On Mon, 7 Sep 2026 15:39:18 +0200, Konrad Dybcio wrote:
>> On 9/7/26 3:32 PM, Muzaffer Kadir wrote:
>>> Hi Konrad,
>>>
>>> On Mon, 7 Sep 2026 14:04:59 +0200, Konrad Dybcio wrote:
>>>> On 04-Sep-26 14:55, Muzaffer Kadir via B4 Relay wrote:
>>>> I told the robot to take a look again (and again and again
>>>> a couple more times until it stopped complaining)..
>>>>
>>>> The following feedback is meaningful:
>>>>
>>>> Hi Muzaffer,
>>>>
>>>>   `qdss_tracedata_b_groups` advertises GPIOs that cannot actually select
>>>>   the function. Please populate the corresponding PINGROUP slots:
>>>>
>>>>     GPIO8:  mux 11
>>>>     GPIO9:  mux 12
>>>>     GPIO12: mux 12
>>>>     GPIO13: mux 12
>>>
>>> I will add these to their pins by sending v5.
>>>
>>> But also I want to ask,
>>> does atest_combodac_to_gpio_native
>>> have any mux on gpio12/13/20/21/29/30 ?Or are they wrongly set ?
>>
>> Yes they do, the robot pointed that out too but I figured it pulled it
>> from the internal data and not from the existing driver. They don't
>> really have much of a use outside validation testing I believe, but
>> since they're there already:
>>
>> pin	func_idx
>> 12	14
>> 13	14
>> 20	11
>> 21	11
>> 29	10
>> 30	11
> 
> Hi Konrad,
> I noticed that I forgot to say pin 41 (Sorry about that).

pin 41 func 10

> Could you provide it too?
> 
> Also can I add mpm pins as a seperate commit in v5?

It would be best to keep it in the same commit since it's part of
the driver

The robot suggests the following:

  static const struct msm_gpio_wakeirq_map msm8952_mpm_map[] = {
        { 1, 4 }, { 5, 5 }, { 9, 6 }, { 12, 21 }, { 13, 10 }, { 17, 12 },
        { 21, 13 }, { 25, 20 }, { 28, 18 }, { 31, 16 }, { 34, 15 }, { 35, 11 },
        { 36, 9 }, { 37, 8 }, { 38, 3 }, { 42, 19 }, { 43, 22 }, { 44, 23 },
        { 45, 24 }, { 46, 25 }, { 48, 26 }, { 54, 14 }, { 58, 17 }, { 62, 53 },
        { 63, 30 }, { 65, 27 }, { 67, 50 }, { 70, 31 }, { 71, 32 }, { 72, 33 },
        { 73, 51 }, { 74, 52 }, { 81, 34 }, { 85, 35 }, { 90, 36 }, { 93, 28 },
        { 97, 29 },
  };

Konrad
