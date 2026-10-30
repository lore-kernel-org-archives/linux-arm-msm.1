Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374153;
	b=zRqFGs7ISQzM1m2DBYTIcE7L8gY0KZTmWPKuSwiSSxTakPlIkkXd7kX+bQ8YMLxwNS0R
	 Md2qE1ZSWhvGdwKt6o62AtzE/1Z/kFqF7yaNUqraRNE19kDwF9dKqxoYO0MFL3iP1JFcm
	 I4JH2iFbuqEahnSVHNfvK3nicJ71fKyL4oKFA8ec6iekBUBMMiQS4m3rKlx7BL/y/xHKk
	 iQCd708uzUkraYn+GWVpd0L0ULBhdOaVpfOIeGpbP43V2Mu4hVj6VK3ecmG7134zTNz6v
	 GQUIO9Q76sXtCtSSplXPkkAt8qt3KL/3RKc8TzWukfRWlP+M7tDQe+K+M6KBFVeqMLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
	b=H4a/cDwy4LNSi1ZLkQGxPagr+7F+dUbkBOrQWUKBJre/hWV/S/bbf3LkxCpmow9TyHX1
	 vpkGrfdHsAplXrUiCZlUuSGph462nutAWyBX6fRpllPOYr2QNdMLMfwp4Vgr1V1f8LiQ0
	 gg9F7cv7RH/Ws9q+YcmOgzNHWTyJ+JG/yLT1mUY1qY5PRMUE1Qh3ZkSTF6vNZhWN6SEE5
	 R8QZ3R/3VKcoI3G5QfKbEMkEI6b73ToEEXcs+lY8iIscS47DEC3unEqQbGh2CfrK6qkXf
	 opNYbzA7lPsjHPnZg/7mi4vgDMTCxolDDzrj0OEX40H/QTyv7OiaF41cvCXNk94YpwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43303606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43303606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF2zeuvs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjGU0fPd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER327377953
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=; b=bF2zeuvsw8xTU40d
	HT3A/yDe4WC9oljx4DKP+7HSiqoE9+lGkf+ymTN21QJD480GTyQ1CJtgBZB3qrHU
	ImLYsqEaLETN8Bf3czzoU4YN2cyGFE1+OuswgKdL3Wb17SXpYgb7UYpW14Lz/qxe
	yJK+863j/y17yMbvgKRvcWSZX/dvSVqxQpCk1aoFQGpm8WJqnFL13Xbj19Y4SZFF
	mK5KdJyby1L3t8TcdmxyONIf3mU+G0I984B4n4ksG+ySVoLL05k1v3iTvqXL56fe
	RflZcfEETNCUegj4fE3ge8WiWNvwtmiiKtTOX/I057m+pb0IojphXTVCyAxB3sOL
	USiJPQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme753qw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:29:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e942b1cc86so9792965ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374152; x=1793978952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=XjGU0fPd/FoAjh95t5/VvQCDs+5TxtUzwmlg+vVR6Dpxf6XDog4JHmvr9vH4te1zW3
         6NJ1VUuC+jf8CbusDtfj0zFwmd/1PmAd/+qlSa7cpbmsDKR/Lw9XRyrka1TJ/tyRdWCx
         ZATq2yi2YyuSI2QUlFO4yINsS3HTRsnMTiM2qw4/XgitCmivYMn5LnoDdg7+J2vHWb6y
         kT+mYdgXV66stbpPUJ/hQzAHj2Mp3LA2aryyrKV1L8o37faDdaVDtOMsZ1YvboFy9Tym
         Cfg4LB8c4Z10Et12cQVkP3tIze7K/ab3efvtjqS6k+XcctVmPY/5TOt5wchMG074JAc9
         BGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374152; x=1793978952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpfxxF1BXeKYsOQeqaWCrwdbveAmxjDzeY39sdHqnnY=;
        b=FdFl6mGHuIXC3vuLMEZBqxJmatwnwBRwW2gBi2Fo5daclrgEoQItdCZ8Zo493h9Mqu
         +SfLQK9sJOL2KMQ8uV6eCk89bdDc6wJ7gjiRtAGSRaOPkFPViOXJEWsKlSVjpusSNg/s
         oc6h4mY/GqrcvX5zQ8NOWy8Dj2xQc6LVuuh5vkvYVxjCjaf5SH1358RfQeOcKBN4JP2i
         oerrB2075S06466PBnQN/L8xbAuIbqRxSCwAQrO5xmc/J7GmAlc/In/FSS+V74rzKds4
         PxxxDSDKige1TnchIFrfjFkyDMbv1JQQyoIj213aI4t+d0wrq62g4FmaMnZk6RHvlgKx
         GMaw==
X-Forwarded-Encrypted: i=1; AKwUvBz+wQj5jUOr1lxs+hhOvzIMK/ea39Z87cYuXUClhqZ7jMiTBEAb2ONqLSBjlZcHA25LAoLqKqbwi1DWJeYi@vger.kernel.org
X-Gm-Message-State: AFq9FYJsKE0mhwf7wIAWk/7j34YML9yYFquvGL3RSdNwIJ1kK8rw1hGL
	OQsY56jvjSKDL2gwsEsGI2JRxa5QXfCK0tax4NXILgQPvKwTY29ZGZHfY+C1d38ziJdx7uPwUnm
	Q6hbhZZ8Tjk6XaWUh4uDKBVgNJzoWv9jYawsQdR9PC3Pgp3uc1q8CeyoxgH2kLIGzUPCV
X-Gm-Gg: AYBFou2ZFcwsS6nWsCCAREY8PzAYebsUHvyvQ/bcZ5z14f8VrAj/SZwwJtfusF6eJBb
	x9upzXt7vzkx2ODCQof+tDzYGYYiC3DFcTbAOkojrZr6ZUFIdeyDvzMjutzLWMMcUHA1xdk/yIX
	wz0VBgC4dBiGSeGDXoW/ynUgj1xOpPgB7JMV0/UWnJvMXLHS5fRqgL94PSFViSXWb+Lz5vQMICE
	0+NpuIgqhP0x3RK9i2kkzH4mSu/9H0tBSt9fS74B4EV1C4RbcA6reaHour2IAkpfazhXF5VH51b
	iJ9rLMsAgOXEb1oemPSxJoU8WHcDjXd3fvwjxvjnG4Ko+H5wSzd5uMu5WRcuakLtuVazbWLzygZ
	sm/8nuk6Pf+T7uscod79QiSVJDSmQY4PZHEsNw6GvjC4wNhwUlHZqUNc/1hDp7dxTxJbIgz0vAc
	+5Lzzl35/IVNwT6OdsnoJAWjR+3tx3aiP81Yw0
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024375ad.6.1793374151734;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
X-Received: by 2002:a17:903:3804:b0:2ea:fb8b:258d with SMTP id d9443c01a7336-2eb36401e95mr30024015ad.6.1793374151265;
        Fri, 30 Oct 2026 08:29:11 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392add5dsm9202195ad.68.2026.10.30.08.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:29:10 -0700 (PDT)
Message-ID: <7d443972-d4fe-4bb0-b758-49608bd27446@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:29:01 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <23845ad3-dedd-4e24-803b-5abf3b030c4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vBJXSqhu_UNY2TuGxBJRT6RtuvBKrepU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX3fKQBHLnz05Q
 Ex3G/4jAbFcspU8beugCn492ZML/oTHUql5OhB3z6jZTQHNq5NMXAD4gsnLgm1Ituk1JTcUxrqZ
 rYZ9Z9oIo2x9PzL6uu9odf/wfX7Eiwv18ULJ91irY5OeWKJahuOGtnEQFHIlWM7exva4pKs6nrY
 8cg0IZynJtGx8tLJs77Ftj0lrXBYFjwvv9k7bhoIuS/fXCOWwStlYL8V32hB5hNsDNvL+Yqhl37
 Bf8DHdG4XYXDKzqdAe9rBJOstrUA2lSmDHTYtsO+epqTYYaxbr3AvKkmtPnJfzOWICk/b8AwpUO
 AfuEAwDbFkecvxo0BxBbkPDjg+WFGKMpBnT5X4D3rFRk5ifKA+uz2lzYRTGhiFn5zsTAXuiHkpp
 vDtCVFv354W08G9m4bW3xDFLx4rhaGqweOu0G+OX1lUvhrlu2ozyygMXuh3b+4HHOgDlL9P2Gi9
 niQ7Ze6UijrjxRpyv2Q==
X-Proofpoint-ORIG-GUID: vBJXSqhu_UNY2TuGxBJRT6RtuvBKrepU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX8gWEJznjASbL
 CF9JH5UMZJWwKvKNqBmSuUdCZoJr3qGpROscb3xNkXUyTFcQW0ZH1jIWrmfE1V1OfE1pItcoZDX
 bEMiD00NjDr+6/5D+06akMBjuvX1zPw=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae4b7c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=l-QsVsxeav8zdcdG2uYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

On 10/30/2026 11:05 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> @@ -6113,6 +6341,7 @@ static const struct of_device_id 
>> camss_dt_match[] = {
>>       { .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>>       { .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>>       { .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>> +    { .compatible = "qcom,hawi-camss", .data = &hawi_resources },
>>       { .compatible = "qcom,x1e80100-camss", .data = 
>> &x1e80100_resources },
>>       { .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
> 
> this insertion makes no sense.
> 
> In fact glymur should have gone up the top with hawi underneath it.
> 
> Could you please remediate ?
> 
> ---
> bod

ACK. Thanks for pointing this out.

The compatible order should be checked carefully going forward. We will 
correct the order and make sure Glymur is placed above Hawi.

---
Best Regards,
Hangxiang
