Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF531E828
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744369; cv=none; b=Gfr3/ed8FS+9L6mHrbarZanvA6ZTJB46VzgoKDJHZ9igUWQuCFpY6nxzXD7u/QiaRGPVjDFxnA4XRpUD24/LHaVuv56gFoT2HsUJllaU3ftcSaWDgfW/XzVcWjiNetaD19M1zST8GGmergyXtLpWKgaEfNiR6WuSz5WMG4YzHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744369; c=relaxed/simple;
	bh=h9KLvKhk60wBGwe7X2Kpn4tVz7qaWBCBWsRClzb7DOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAm+ACwz2139a8ytzvDsXNp1MLHk+RjcqZgcy/nDXBaw1qh2NceREQSUIy1je6AEtuJP6sHe/vpljl08XJ4V1tOmCdTAjJBfgJttC0gQ6Osi7rCDIWg53kJgjQ1TT7N1BpcBRaor6JMHfb+A0Hot+LnBSwMotstJbCTfRobAH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFmgGIgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGlBuvfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFmgGIgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGlBuvfj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHr6rM1506686
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=; b=kFmgGIgyTTnu3g4J
	QX/XwcbLHZCQy0lVElgeHDP0QIRCH9tb2meYXOaP05BogeReg+vVJrXOWNJytY7P
	KDNkbYz68jJjFGumx3ekIdQ0176FhyLh7czPCk4iKOEPLzQKr5/6E8rqmqYdmzCp
	bKHpomqBTOlSGIPRzhylXH3rVsSnl3xxc7aYGL9J8WcHeZGuLYxbmmr3HuyEV6va
	4q+NZdw8mJRLzzClol4tPZk6AjyhdWImMC7h3B0pcAG6Cib7n96uZX4zL1AQWNA1
	PDyX1BgInUzk5Ghe+3AsQ8VV7KWdHksy+OkM32dqgs/uuJjzvfwS7xlr6EoP7+Ax
	6lrcWw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxm11cyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb733fc5024so6002985a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784744366; x=1785349166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=KGlBuvfjKCr+wEEUs67oZNR6gYqCULfIHngnNMsnZu3QLjdHxTZyNjRS/dWPcQeL2G
         d8CiyOZp+I34Kwb68cMaoLQjxaZbeoA29eRuT0n9szqMPR95+w2/qxjjXEr6hmDAGxnI
         MtvYgQawttUpKyrATgMw+q/d9gFVsPc6LfK6sDgKJjiMHNgCQe8rGjCHe0Eymz042d4R
         +Au5JiQzN/u9LVV8si02q+PfJ6xGhLYfcR2GLH/V2STNWvOB3bkEoAPbzLcgkFfYf/GI
         aFOrEK13INcKvPnxaJkxkqmpsxB+h6aaC28+6RStZcX+RO0XGacABQ2XeChGOzyKfKU9
         35gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784744366; x=1785349166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=VwyF2v3+xzqsaBchFvoty39eF0D1xVDWAtQ4ZyisgspDnhRHFf39WpMB8BTV2JvOFJ
         cRqUiRYonppUdDoq1obARHLyCxKBRhw/kooR3D7VdN5YGVnXI4vLS50HesPCiUQRohZK
         TjNkbwVfwZEp4bfiTUtwyxw0WC61yP7vwMZK+P8iQmYzsg0D+RgEEKimU0YwLtwu9M0n
         p3lgX7popSm9ERSQvjgpet/kvVE7JIq6SQmQ5YPKS1/XVYMrh/Qd9FOxl/FBiZDCZI6R
         kpH5f/YQ9/zuOyYMOI7DzC7cHR9wgbYuyA7x2qQHBdSOlg128g3KW7lLT3r5zmAnOIfS
         YpIg==
X-Forwarded-Encrypted: i=1; AHgh+RqBNFkk8eaZSlGn451UduHdkqMGIv4bTh9YkRXn8j7GmAN72cyDFnAv+C/H/mUULjxhw5j4k6UaUfba9tfl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GMCggO0d+7a8p056oiQU3arkWLW8J7TKM1qBK0blQOngy7sH
	hr+7Om/eciXl6J4vyQxXCf1TKaLxhcwF1nEPjmiD0iGshDOW5rZyHut5OBpIhrY43UE9QIrbc75
	ro+EMHPIj1935+CJGGDAHHscsFr8xedaK9jKpyZEZwtGkLFWhvxNvqXBD90L+eK4aa2BB
X-Gm-Gg: AR+sD12fMlNsYHfT/Z/PYf5Vw5GAWbvn/+VtIdsgqVLCdmCKO2UwHmPOPr1NyH9BG52
	bkpT05WRhMSnGPlDlqM5BO/E7584iqnrOtNYDMypI0wnBn24enHKEAHPLB21j4Vg2rLbcolXj2L
	aeHjDACe2EKrWj8bBpUurHbajYSPt4dbipBnAdy4SYP1aJ+KW64srU6qEnMM3422pFq0qd28cB2
	4sEZrA1rtt5Y1NV3/Pq/pisLm1fYf8lefw7oq+mgP/HdBYPThFlQbcrixVhlDxA6/5h0i9B45R2
	6tF1VG+3iG4bWxOtRtMb9PN+LpxqJasZxBJWBDsaQ0n/kp001B5gpHhrcNkPhhaILoStG+ksD0C
	G9UrN73BKG3LRDvVxgOcfoJLU++PWh/62
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270269637.8.1784744366185;
        Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270228637.8.1784744365633;
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm7813501c88.11.2026.07.22.11.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Message-ID: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 23:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfXyF2n/i/wEnHD
 EHlfw6tQHEUEa6VH84WOGMHw5CpYBbIPjxOiLIiYPqYqdWRqrin0aI26MBBwqMDMCNwviFJmLJX
 111wERo8c3MzTOgpUZ9Jkl/29+oI16Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX32gbc2klf5RQ
 NmvnZhTn15K5eVOIsefewtB7oL73oG7zCAMtyESoKg2KtmVcFMzDTTUGc8mU7YEXK72df29v5CS
 aE9pPjx7l/rhakbFqZ1Kv5vmjo5rqNnTDoAtFLBfJJqYJ7lZkA1VdcA+Lu80/soNXyDaZmllMEA
 GhNCx7xHpPUJaya778KO6vPYimnnZpt3hv1QY6csBb2MT0ced8J+epkBN5xkGn+9VVbBXGVfmL1
 kd/SfkOOfubCO2OYC9wz6J4lxjKcs4+Ot7ObwaU8IPYChRoA906HRN+CWbexChBh66j1opy9oCc
 E0y+jUrx+u8Elupj5dosVj7TTxIWnny3nAvIGvSd+t5h1J3e2gQzLeiu2uIbmaQTzhQaYnCc4TF
 FVt/9IexyP042Sr3YaxPBGrR5npcMYh+ebnqF+KIGP9jrKwe9CfcC0YC2q4HPUFziliQw2zlHyG
 2WtcgELXWENS5/lFdYA==
X-Authority-Analysis: v=2.4 cv=Rsv16imK c=1 sm=1 tr=0 ts=6a6109af cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e4paWlehE--IC7SGyJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: GUSCP8sRM4sNDfajt6oLpIcE6V7_BOxJ
X-Proofpoint-ORIG-GUID: GUSCP8sRM4sNDfajt6oLpIcE6V7_BOxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220180

Hi Guenter,

On 7/22/2026 11:16 PM, Guenter Roeck wrote:
> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
> ...
>>>
>>> I am curious: Why not use static initialization and use the is_visible
>>> function to determine if an attribute is visible or not ?
>>
>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>> allocation based on the available attributes rather than static 
>> initialization. The intent is to avoid having to perform enable flag 
>> checks in multiple places.
>> . >
> 
> You lost me, sorry. There is only a single is_visible function,
> and its intent is exactly to handle situations where some sensors
> are not always available.
> 
> What would be those "multiple places" ?

Understood, thanks for the clarification. I'll revert to static 
attribute initialization in the next revision and use is_visible() to 
control attribute visibility where needed.

> 
>>>  From the earlier exchange I had the impression that there is a large
>>> number of current and voltage channels, but it looks like there is only
>>> one each. That doesn't really warrant or need all this dynamic code
>>
>> Yes, this hardware only supports one or two channels (voltage and 
>> current). What we discussed earlier was that each channel can have up 
>> to three threshold alarms (warning, critical, and emergency). However, 
>> the hwmon framework currently supports only two limit alarms for these 
>> sensor types. I have not added support for the third alarm threshold 
>> in this series to keep the initial driver support aligned with the 
>> existing hwmon capabilities. Once the basic driver support is 
>> accepted, I can queue a follow-up series to add support for the third 
>> limit alarm.
>>
> 
> What does that have to do with attribute visibility ?

I was only clarifying that the channel count has always been small 
(maximum of two channels) and has not changed since v1. The earlier 
discussion was primarily around the limit alarm attributes. That said, 
you're right that this is unrelated to attribute visibility.

Thanks,
Manaf

> 
> Guenter
> 

