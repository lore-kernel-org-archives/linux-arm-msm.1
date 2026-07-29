Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCEC4499B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785322312; cv=none; b=gqPNyekgkk5qalTzP/GAylZuXL/q04IqXkDo3qHXIkA3v03bbyCvB7V24iYKolHSqG5EFRp4+rKG6+0GgL30pSRpFYc4FiHrd/JBppK1qhqGuPh6/itzyxxOqCYgGN425QOp1kjEmeLmJZQjn/yMQs0DsyD+8HYTfrZfjfV0MXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785322312; c=relaxed/simple;
	bh=4JPrL1boeP0zkJkJ6n1n+sxuwrxfu+vFwO3zzo8geME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYIPACMbUzSxV208xfmY3Hc4WvXpItep/Enr1CzHhHTMEDZmjQXtkMzjk3DN25ywLJqw1KID5uE8IaXoRi9b1mQnjXQMvWxmP3/RGsI3fWl1U9LAoAjjJEdr2ZRwtoAnbP8ahresUXVJEZoyOtU8OvJQZvug85C+dWicswk70DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvbLkTSM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ct222NTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvbLkTSM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ct222NTC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f2fF1088697
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=; b=mvbLkTSMvhH6rH+K
	qf7I9UU+VM4teGLw6652DeNREAADp6eQAIyRbnS66W9Xxc6TO8jYdZTsSGxOBUjx
	jMUNCnlblom5znP1NWOtPMfURWC9fJAjDkE0TGf41BOmub1oyqNlkW6VAWfFD1cW
	ibocvoKfYrwNbHpaS07J76BfPAQaXV3qwF3GF4/UP5mG6Cyw07DWK7qOjYI3Aiyj
	w+8wic3mIbGzRUPfo+nRDyDzeJIITwiXyAV7jJAzzpZ5Htlax9tAQc3h/3/ohgLp
	qmHcWh33kBqHSC9UU9sgdACD7/FcaQ34+bSQS/4mV0JiIf1heVKfVoB0n+q3v1eb
	8I9mKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq5sajet0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:51:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso9263921cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785322309; x=1785927109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=;
        b=Ct222NTCji9dlQbt9Qs4sgLa1ePEq9ndcb/nsaeEvnxfYNC7erP1C1RSNj86FgXxsC
         6PkixXAMQ5ac73GD8o9j8T5Vjdn/fpwcxX15Hd5WNqwcVX02uEXk0eejwNpuao9bzHif
         0TSJKHW9F0l9MFZsxI7yiuC42dRUpjzhKP5PZ69zXm9al73KUCCxYt8w6h71rPF4nCIM
         HUyn/kz/elxmju/+ajg3fFKf8+fcHafvaCV0k1k3WI+XW0e0tNFAcnMVYl3R7qYp/SVm
         Ata3hq5RejwZvC4zb6i/4rn4KsQEEc/QNNynhp5tTQqXUoE1aJqe5j8yodehnoWsLZr8
         7heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785322309; x=1785927109;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z4VD1fGnOXstdgV6tE+n0grMbMG2QfBdfgX8jxY7iFQ=;
        b=awK7ActfXOg36dxNinNGBk6dr462w/OvY7boS+upuVsC9+MJGjoZTsU3vnjbSseVfG
         RAphfv8uoWGZUf1hSK++BR56uH3+tlaZk+TuhUn3MhPtvILMSJ0FTl9cSwTqycHJWX8Q
         umAzc7XE038xFLAsPnIoFIy+gxn6DkWnqzDmxrxj4UekQ094TV+VoMW0LKMLBMdr7LjA
         0E/h0ovaviY6ZA1MwT7kXl3u4mW+QwqenHrYGPoJm3FKXJNxjD0Bd3d7XtO6ejZAjdNA
         6v6Pem44nSDumHQ4EShmgDFU7PaTFiIn5/kMIE7bZksie8+bKrmcoZX3uG4BMsTlJ9Td
         19cw==
X-Forwarded-Encrypted: i=1; AHgh+RqcGoLoXzHt02zMPnmHEcbW++JLY++FfPWK253ty61gBRi5i7BvaUmURIo/Mzcq1FbWtpNMWHz9AJWHiKnw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3DLnthiLSzWCiPNInWo3Dt84NmWnbx9UhzsBdK7V8Gy/+hz8P
	jfMgX3qOJXJm+oA3w5YO/mliy9w86Qi1ySffcpIwCClPnHMHfhL0UfeaF6n0h+BoEQUUwOQC+8Q
	0+/X7YxBTq0or2OPjdtBd6nC/XFhxnGMLu/f8mjKAa1+yHsYxEghGEGgL77t6h2cR8CGL
X-Gm-Gg: AR+sD10fd96OSzl11qt2uOWlrhtfSD2OMyeK+YYHkuflePHq0T1EbWW0awa+b+u1GjQ
	2uOoAp7PWIduIu1F+pY6tA48YXoF0P2XtfM8rrKC3h3OHpEkt72ricsBZS2qK6fPJRpmTL/0ojB
	cHeBUuwAj3LwISgOOWtGYWheFfsxQd0EdZ+kghfSxF0vJsi+/hlT5AB5CGyEh/copXBcGMFmMo0
	+uIbdMa3Vyf+sDh6v0YM/szMm4vFBwV+MsSlfYlJ74uRXozPzQPOYVjjKBB817F9X4Mgpl193OY
	qiiS4vSMLL/xt8RuEg/oR9HJe4qU688VzAtm/Osaa8UKYJaucz+i9GIqohVZbydChGu4HWODz0u
	FRS9Hb15KLT1Be0o65AxsFPZBNCs4kGT7hMttsdFVpNUt2c3fNRhsEx16QxIH+CRGtlcwlxi8
X-Received: by 2002:a05:622a:1e17:b0:51c:7b12:1207 with SMTP id d75a77b69052e-529d728801emr49858141cf.85.1785322308962;
        Wed, 29 Jul 2026 03:51:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1e17:b0:51c:7b12:1207 with SMTP id d75a77b69052e-529d728801emr49857991cf.85.1785322308550;
        Wed, 29 Jul 2026 03:51:48 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050ae95ffsm697272a12.0.2026.07.29.03.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:51:47 -0700 (PDT)
Message-ID: <013e1e65-b9dd-4662-a273-68748271220a@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:51:45 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org
Cc: mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260728082548.2511694-1-atanas.filipov@oss.qualcomm.com>
 <20260728082548.2511694-2-atanas.filipov@oss.qualcomm.com>
 <9ac3c44f-2227-44fd-abad-fc85ee57ea13@linaro.org>
 <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <22caf78c-4855-41c6-8a36-4dde85e3d102@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yBi7NbIG5_ROqFnFKOaPxAfmqDzJz3aP
X-Authority-Analysis: v=2.4 cv=C5fZDwP+ c=1 sm=1 tr=0 ts=6a69db45 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3SnrRBytGKCmZdh1xI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: yBi7NbIG5_ROqFnFKOaPxAfmqDzJz3aP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfX0VZQRXB37jgV
 g3FwnP4vd7qq+ZzSEEaduvrPqjPCBn8uqPeEQ/HJP7f4zYnp7puNYHeWfQAV7fqzK+ZppI6hULR
 McyfKGumpeIg1uKYu0vZ3EoZ7o8SFHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OSBTYWx0ZWRfXx/MtZgvra1XX
 EvlO4iBuftEoMTDo5qED05ww7tgoz0Z24fq20Y+AS31nQSMeTDKBLYeanBnbIqHITHIgcgz2Y2E
 kOzaw0G4yWCDEA0rvHf0EaANl8kQS4fl3mwUtqzGLTBp1fURdQ6g7TOzAcubjAlAT7Q7Mca284N
 w/I2gQ4ZPXKeK6RTYWKzdwbGBzAQqOft72xt09P4YTk+ZKUMZG3Y7g0bG/L6mML6eGpO9cVM0W7
 LrXV7H1nmqBO2oy8/BCtdUGAH8OhAvb6cf0F23RcHi1lqP3fli60N2cBy9Yr4B6s4NHL0dZ8vOx
 vABRJPlKpvbJRdYg+QTesZOZN8TlYTJIafwiSqslD6UGDjlz449ey5khdcuJW4bEYkenOoYOuvG
 is02rUSTVYJ8F0gY0NJUD8UmujwN7I14CATqVrTFDElz+FvLYZS7/SkZie8dD/WSBlyKpsptxuv
 6ckO9ls9aIS0YFMmrcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290089

Hi Atanas,

On 7/28/2026 12:28 PM, Atanas Filipov wrote:
> On 7/28/2026 12:12 PM, Bryan O'Donoghue wrote:
>> On 28/07/2026 09:25, Atanas Filipov wrote:
>>> +
>>> +        power-domains = <&camcc TITAN_TOP_GDSC>;
>>> +
>>
>> I'd expect to see MMCX and MXC in this list.
>>
>> ---
>> bod
> 
> The MMCX vote is already covered at the clock controller level.
> The camcc node in sm8250.dtsi declares:
> 
>     power-domains = <&rpmhpd RPMHPD_MMCX>;
> 
> TITAN_TOP_GDSC is a child power domain of camcc, so when the JPEG
> encoder enables it the framework walks the parent chain and votes
> for MMCX through camcc automatically.
> 
> This is consistent with cci0, cci1, and camss in sm8250.dtsi --
> all use only TITAN_TOP_GDSC with no direct MMCX/MX entry.

This was commented in v4. Bryan asks JPEG node to explicitly list its full power-domain dependencies.
Please add MMCX and MXC to the power domain list. I hope that will be enough.

Regards,
~Gjorgji

