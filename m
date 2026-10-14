Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F179565102
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998204; cv=none; b=M5SFsEjCx2uudUPNfJ2FqAAb3NrfQirm6dFw/GR4oK+X289zo+ZhFI36lzmCycyob/twSBYEFLF6QHleLAk1PQF4Qe5cssJsOnWlmV/QA2z9lmLyNOWOAZ+PAuP7LZURiT3NATSFMzYz7WpGsH6ydS4QZdmCBxZKV3f3jqnKUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998204; c=relaxed/simple;
	bh=NtivolCQ1nJosxUI9F7OWFpX9s9PxlP7yMWcyfGE/8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0MyrYMOeTW1WLqYVXv3jgSkg7InS3Kokc54iY3MYsYUkytc8d94OSyupCdEDVMplc5RGUGfI4gco+dATWmyfdzXMcD5KyfCB6VBKh9FzchZNeFg/78RAD/gsHQv2V9KT4PkW8UniOqaK0TJPCxXqI2FQ8wy5uWRFLGVzlcJ3tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R26knpqw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qlb5Q3Xa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R26knpqw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qlb5Q3Xa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbSv13813172
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=; b=R26knpqw1ZB66+aI
	TqCgaSoGNuEN0u6AeVx+S3yB2Pexc+EhmlDjA0flx3pzmD+gKmQKYY/kMm0mqZmH
	aJNVMVVNqaJAcJv2TvH3qeg0GQixhbcaf0oBmUz9G6WNByRlHRPFrFtXhrx30FnQ
	vwafSFqHqMBodongiS1JL64lTb3vD9+07fenxT42P3Xn2+yM0itCNahcfR0dSGXh
	bUofyG0b6iH2btQzMobU5KFwm0PbWxcBPCiapTU74jn4238vbI8gQrn5FdxLs1dS
	upbL8QQYpg2L7grtH+epf4ghq9FHkAGS2DUN4VggHvTbnwEIDFk1JYQUxsSbVz7R
	wzMv+w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2qry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:16:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso2231959c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998191; x=1792602991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=;
        b=Qlb5Q3Xa8/DWZwcNLMBTqOasnqolO5ZKIWnVRJeqPbCZfagqniVhMCrPEM6jToguVa
         qR+QOtrit8r68N1cd9jQhrk8ZDa/+/UBVm2Vr8s7VaHEJ1kGDgWo/4y3PZtM6/Q8o/t9
         l7npmkiXPY7xec3H2NH3NIrtPc1lechC6hDaC4avUn47KtBpqK2O6qQIvIsyW7lF/bXE
         2de0tupBQD9sA6Ek+smGV9MxY+iM9l3ttiUQ45cJKop/p9ln9b0yqBGIXpMY3pOiniNC
         YbVhQevIgc3zil8tTCP08o9rJRSLC22cwRt4tpr/wD28YQwkQdqFFc0sk4Uf1fMCFe4d
         o5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998191; x=1792602991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SbRzAQqOqMGFrGen933aIJTTXXFDtSgDohs9rQuHzc=;
        b=HAjQjaRyxZnzg8lbYQeOpNt9I2q4TlQ2QvnYDJBmPRGbd8cN+eBy8sJmB1K6pQnvn+
         tSX7H8AKGnNH/gZwDuKYb47yDITqB65rLa9dB0w48nHYnFCfO8iHnt5zPRoIgtma10Yg
         UqARYGdjCDhH/eHRozhg5TX36DOb88uSetoK8pPlkZv1Zqwq4wHUM/aqVVjqGK29EJIE
         EqZHApv0G1LzxCsyPZcLjcjatQKYkjC1NMV/Y5g11d/bnKDOxwYQXdMqInGp/+Fn1uvr
         lY+hnb1qE9haRfLYgT/9DcAPurlC55m0jcKGmz+pWgzQgEL7xPeo8D7fw33INezI5Bw5
         js6A==
X-Forwarded-Encrypted: i=1; AKwUvBwLOQS3IoI2EqQ1rVTih6z9n4dXQgLreZUxtlJ/55LvRFjmSMqzbDbs6iKw7g2emk44UTuhO5zyPRbwvIOn@vger.kernel.org
X-Gm-Message-State: AFq9FYLZRA3n++zOO2DyBRhBC7jg9sf3qAYbAP8cmQ79ZrDOS1Blr1OG
	VhwW0iAPTBDxSqers6tMX79S9ueJyMo4MQXTNdCba2aqVMOsx19gfJmq1mzJCqG8usshxZl/Flv
	YT1z0DB0HXs2Kfb/RpMpXTJAknumjCd9jOGAbzbyJ0bauS8o7LgP4EuWTrX1bsiBjHtnW
X-Gm-Gg: AYBFou2HHC5SNWrI2WiD+D5nHoqjHhciEX/uWPqMSb5vAlmtnO62z9F/P/Q2G52Dljg
	UzEKhUDBXoy1JnQFFPlRZPKV/K+JN3+4NAQNNuq91byUhQEbPzLjVEYlqvnsqccEwBAfBCP+s/M
	0THOI74aTTM93WNRqA3VnaPQy8FYnU4jXUVKMsYi2jKvwqZxOlp6fLRjPLjD0/AXuh6qDnV1kHj
	gfwza+cFurl3X/PIVdo1JOY1ddt76bWjfu4pD79stfO4SQBLyGhKx9FcLyw0oSJ45Gvakar1n6T
	sv4RCvdydO+smzyGUWXITxzu3c8rJYMoqySPXJttlfntZKp1wjg+kqyfOryTsyQc0PiJjJklB73
	hXMmWvtYYNZ3HYMLPuW5hs6ZEkcJaU3MhNn9xHG4=
X-Received: by 2002:a05:7022:b9c:b0:144:fb42:52 with SMTP id a92af1059eb24-16a61d5bd24mr35223580c88.28.1791998190399;
        Wed, 14 Oct 2026 10:16:30 -0700 (PDT)
X-Received: by 2002:a05:7022:b9c:b0:144:fb42:52 with SMTP id a92af1059eb24-16a61d5bd24mr35223517c88.28.1791998189644;
        Wed, 14 Oct 2026 10:16:29 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-17dc865cbffsm11282540c88.6.2026.10.14.10.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:16:29 -0700 (PDT)
Message-ID: <c8c453a5-3c4e-484c-9567-4a8d51fcff38@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:46:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-1-0c1897f21ccf@oss.qualcomm.com>
 <20261013-supportive-imported-spider-c6e28d@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261013-supportive-imported-spider-c6e28d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX+Zfrn8gEzMfV
 6zluIMOHBhzfzWwdktP6LrMxV8lTm2IEDVv05G1S7sD0UyOnMtSdTWMvLS0uqoMN8kngfNubq+8
 3zuJA3HBNp/vF9zy8FM0rxD6NGUuScA=
X-Proofpoint-GUID: cUxpv02rhLJREbrTC0-Yn1yp-B8o5kaj
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfb8ef cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=UYrAC0ybtJ6TP4zHPckA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX5y46T9gEtveQ
 PSauVEgijxSzqCYbvSA+Vsreh4PuDuHxXnHo9ZBXzFCdRp8OrAgDeNNOx58cG1VuXFjbVa61+Cd
 6ForwGF382Yf+7hXnhocqakXxONeUHofRNfCcGkcZcMvhhbfWF4cq5dy7qk8FDnK58kigvoXZC5
 IO5ut71S+EkOHAZnhIeV25VvMQqaa5dnBhHlRTWakQZh4uUanfnud8c4rZ7bzRYQ6ih56OOHsR8
 FDO22XoTnUoLGAUN1u64Kg7yig8uovcLq8CQcgmYBz8+ChP5uq6kXqPhVcTAP9QHu1bDcp6IFAr
 s1YsZS8gaDecsc/RS2MLXxLSpUBCBctnlJecjaPPCKVfoAAax0qmphUjZVr1DZ6T5T44LOoxpbZ
 Z7xRoDjBjQOyR79fkiPSend/YCRUefxY40ap4Y65XZLkbmOnnUpcFz6Ik1/dTw696d0kXX1SkTw
 EyOYYQlABQWCSSzWT+A==
X-Proofpoint-ORIG-GUID: cUxpv02rhLJREbrTC0-Yn1yp-B8o5kaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068



On 10/13/2026 12:31 PM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:47PM +0530, Mohammad Rafi Shaik wrote:
>> The PCM1681 can use an external system clock supplied on the SCK input
>> pin. Platforms that provide this clock need a way to describe the clock
>> connection in Device Tree.
>>
>> Document the optional 'clocks' and 'clock-names' properties and define
>> the clock name as "sck" to represent the external system clock source.
>>
>> This allows boards using an externally supplied SCK clock to accurately
>> describe the hardware configuration.
>>
>> Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> index 1f0e6787a..1b3803518 100644
>> --- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> +++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
>> @@ -21,6 +21,13 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  clocks:
>> +    maxItems: 1
>> +    description: System clock (SCK)
>> +
>> +  clock-names:
>> +    const: sck
> 
> Drop the names. If they are needed for any reason, then use the same
> name other device uses already, so scki.

Ack,

Yes, the clock name is required as it represents the system clock.

I’ll use scki, consistent with the other implementations.

Best Regards,
Rafi.

> 
> Best regards,
> Krzysztof
> 

