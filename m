Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50A35966
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418136; cv=none; b=gdNi9H1Nt9DCPt7yiP6y59rU+u4Uh7ft41jEg7YMLgsaKqe3b0SINJHkHU2YSe1xx3DPvx6U5Z2lOcrITIAkmfevOku/3k5F7rRB4Fc0Xx3MiAAbbPTIdIgeUdkFUxryvZyCVrbqMRWYPMW84kau85rOn6Qoy/7/4FBPRXsK35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418136; c=relaxed/simple;
	bh=x2KkVoMQI1NXabI2h0N7BvI/fSRL3yWbK0MtUn7sBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXonArPUIFUyjWspAcE3lsFirJ5LlaS6CVMgIR4oUIvJzmhvUCAwgHkrWLfgq/CJv2CKzBh0wrFdXGRigu759WKUCHOsc4NUroGWKroVOqe42JndS3K02QlztbfT5vouet2WrMilB5hvVhkUM4zbGJANVC/QGpgURM9Lr5SEcIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiKb4yPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYBwS5Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiKb4yPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYBwS5Yz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697Ltvak1346091
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 00:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=; b=BiKb4yPmNEbSAUIb
	14/I5FvUmndSoBTWkx57rSDWqaiDeLehQ5sxGe1Sn98VlfxJT91h0QuQaO4On1fb
	MH6TJZXimpc3VSgdRISOrgU+mBS9Jb7TRbAEDnV4xgWCUgpHzDwsT05EcGedJ+SG
	hkUyqBPEltDltkRKzjhU54UMgC6Gc9jVkho8TxSqVVaTegarMci1ett/Xsi5ssba
	R17vmJ76UwRl6ryUN0DdPfaG12Cxs4bShJpTkqGsoofitle/EKMn5iJFB0XS7ZbD
	FhhmJbb8H8V2AlCMDyBx06SkNwRImIAdiZig1f2kskhpe+EIpbIDQP7AdvgC1SI4
	zF71uQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe80ax6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 00:08:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so16329977c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791418133; x=1792022933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=dYBwS5YzVWY0iyt1dXYTMPQzjYlgB9JX1Z/bKd1i6IRbElfZ8yEO6GwLs7J0qY4efn
         WFS2yJQvUt6FK92yE0/4aldcskMXMz6hMa0BMfCrObU2Ikp2yjn7lPajI6mm+yFvC5Tc
         eytsJuUk2Q5Yku+gAzLi3Nl6s9ZNeyosIBWolvhGkF0xn1DskM9Ejs1CEnguaqAFP9g8
         7vStf8HG0B1Mis0cEwfsrY3KiiH7cl8IgeSri2M2VfdJkh8YZAKhYVSFh+GtiAnNVDv4
         kqdSibN1vRi7IigfYX8PqeD/mwhTtU34WPDNO2P09DVXRuOybBRprZKrnz3HFFCIjYQh
         8VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418133; x=1792022933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=JIoe6OcpFCV5NkN4EYJVHPztSnGFlY4O6zqAx7+h/PsR3UXcAtVuwL5l1Ftl6QWyWZ
         xLH//s/p0+d9ZHHoeSz1I9gVbXwZdKJANr2Z3Hdd9UqLpSApE1GdRGYttiZQqnVQNEjp
         hnHJJpUfWKimp2rTEsjzLfMfMyH6+b+W0Thn9RlI6GLbqqY1yZ0092FchAjTeQ0/9IXq
         hiYR3IV4SSEWXuMrf6GRPqj6htjPeBVkBUvvz1C9Q54umzVy0Uo9Ed0pb5bAvY0nJ5ny
         v0+7HANStWBPVPDwBicpCVpxLk/OeAPoDAUqrKD5I/FTXYlYTc0XfHriza3vKqB23xFF
         fPvg==
X-Forwarded-Encrypted: i=1; AKwUvBwMyXU+eiyFphTB5TsdkN+e40IjyWi6JPulNioNB5kwGk2JDkyj641X/q6YIB285NDqQ201Hn55siKUm41f@vger.kernel.org
X-Gm-Message-State: AFuF++lYOf+c/OAe2aSleBCVEaGvtc9hukjaHcxYoJx3NsNQz90bDGp9
	5X7wbZrk2yhBf21JlyhTLUDED6gM7FUTFQ4iLl+/byVWKCSHZ7mM5jftdqt2l47S4Z5IivI4MTQ
	G/rcnm2rVeIw79YQQVX5murRfJeWrD4e4M271gbYNRi4CH1DN0krOqQkK1uDNF0kwAiay
X-Gm-Gg: AYBFou3pvhsgdvK2w6MXSYJa9qA0W8HRMfnrbc5IdfZht0EJyooFYnDLCVB/5Pu9+7D
	3rmCYFi997olzjGRJ71OidEXKrVW8XL8+kWe1/bXQKeyuLA4Ng/eRVeZX29XRQeSbcBrMyamJyZ
	whQTqJHBjP7xYq7iKuJCJDQe4+saaSG2qg3HxwHsN5IQ/D7T5Fvsk22Os97BQGlNdxYUHHvjqXl
	zpiIS6ICuU77DT1lYx6lJVySKs+sGqSoqR+7q3+b+ULJLW8FQe8pyWH6W+wnu0klQmkzWtdvsk7
	rLpWbiJf5QkFVjAHaxJ1PMNf74PVshpUbVFslM+fhhpcjzuf7m19o3ZSamUAJ0un2Cw9f0lBL3I
	wVct0DP1d2vt/Mmzw3N3iMExkABgjaRXT4AIM03Cimg0kdXEQtG5BOLbAS0xt6Yg=
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490622c88.11.1791418132343;
        Wed, 07 Oct 2026 17:08:52 -0700 (PDT)
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490583c88.11.1791418131519;
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166216f39sm11910314c88.6.2026.10.07.17.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Message-ID: <46903bb4-67ee-49a4-bf53-e7ba2c34256d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:08:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: qpace: Add Qualcomm Page Compression
 Engine driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-3-georgi.djakov@oss.qualcomm.com>
 <20261001-hopping-belligerent-spider-876e7b@quoll>
 <fed665c5-3062-462b-928d-ab60976ce839@oss.qualcomm.com>
 <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX3DV5XOiY+ZO+
 7smDaQIjRu7plX4JdUBvzhdL/r5DolotRnCtO6GzP6MD5SfHtROUZJvMfWeyCx9rI/c8VQY/ooF
 5h4efVtbK9AwBCefQWGEdjcNwkrEzgDB+Zv+3+WCZWoYEMf2v2c7R5gG1Sm3/MpneFt+FzKPMwh
 D7ddzY9WxaCcgVZ1e2I+2ZPwSFN3tTUY371jiEYRIrMTkXZEzCtNWcFqYYNXtb5RaKeJ2jHPRjq
 AgusfmD6jsE3U3kM0+4elqkxc+noEaQ8bW1+KekJI+nFS6SA16Q2F34PKHM5Q0laVr7pE+YpHeF
 Ywo6U2/hcd8sDsTFZqwuZZCPfxheSzL8c5R4FAVqOr/MkBylN8AWeCYWFTRe/NENN02CzZoJDLW
 lrGqOxzry36E+INJWfw19ovFVyCUO/w90fALVfCzrdQiHp5q5leqcleN+WL2z+1BofvJ2zdlIrB
 2PKakqRJ4kRQ3gwKWWg==
X-Proofpoint-GUID: 0lXDaCg4a1z9plP3W8Tb0uEgpA2tl2AV
X-Proofpoint-ORIG-GUID: 0lXDaCg4a1z9plP3W8Tb0uEgpA2tl2AV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX5ZmIEgd/BkIE
 /n5AgRhKNQygGEauq9hyaMqB6ieBLDq9gcLSmdApg9nA5+3oq5vNhm21KuW5wA5UZHD3HaoYXqb
 Bi7JfA3pMUGneMsItYgqgwHkFtII5GM=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac6df15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8u56npouWohDfDDlGUsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000

On 10/7/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 01:51, Oreoluwa Babatunde wrote:
>> On 10/1/2026 1:50 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Sep 30, 2026 at 07:52:11AM -0700, Georgi Djakov wrote:
>>>> Add a platform driver for the Qualcomm Page Compression Engine (QPaCE), a
>>>> hardware block that accelerates compression and decompression of memory
>>>> pages.
>>>>
>>>> Provide the urgent command path for synchronous single-page compression and
>>>> decompression. This exposes the low-latency operations needed by
>>>> compressed-memory users such as zram, especially for page decompression on
>>>> the read path.
>>>>
>>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/Kconfig          |  14 +
>>>>    drivers/soc/qcom/Makefile         |   1 +
>>>>    drivers/soc/qcom/qpace.c          | 764 ++++++++++++++++++++++++++++++
>>>>    drivers/soc/qcom/qpace_internal.h |  84 ++++
>>>>    include/linux/soc/qcom/qpace.h    | 154 ++++++
>>>>    5 files changed, 1017 insertions(+)
>>>>    create mode 100644 drivers/soc/qcom/qpace.c
>>>>    create mode 100644 drivers/soc/qcom/qpace_internal.h
>>>>    create mode 100644 include/linux/soc/qcom/qpace.h
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index 535c8619197b..6bcb86dcd726 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>
>>> Sorry, but no. Soc is not a dumping ground. This has clear function of
>>> compression offload, so it should have some dedicated maintainers like
>>> other offload engines.
>>
>> The reason for putting this in soc/qcom is because this is a qcom HW
> 
> Every qcom HW driver is a qcom HW driver and they DO NOT go to drivers/soc.
> 
> Again: soc is not a dumping ground.
> 
ACK. We are looking at the crypto driver to see if it fits our use of 
the qpace HW block.

Do you have other suggestions for where this would better fit besides 
the crypto framework?

Thanks,
Oreoluwa

