Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFDC37A83F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552949; cv=none; b=tKp2WNR+Ly91Z8viF1+S0J/uAfYhDZyz9EGs4gje4wlcAISH95wES9RmxRnPqNa6J5FMOjCSrghO6kHBdu00PRecHgaiJ/6yAkfUhHSsXjRMlMCRxbPUYy8K9l2J6qPsWnwj7+L1p/VOLJoWfjEV81q8CuzIytuBrEOyadZ0+iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552949; c=relaxed/simple;
	bh=op+XOYRJq04sh3gXNWeul76iO6T7iCZ2gTj1rKrfj2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPy5JeVRSXcNENbXWxr/y4SJdhzVDyS7TLXP/SmEvnhGkE7oR0lwvc5mZbaurX8MKTgA3tBVg84UG1dIzCkqcxM3K2ktKCslc73UwMTMTVaujKAiXmlwYUYAXmRzepB8uzKML24a6gIWCSYVlFoalcAQqcw0VqQm51Wr1Jgg8dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBT36tnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8ZdkiAu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBT36tnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8ZdkiAu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5Qx8L2041215
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=; b=TBT36tnGD2i023bx
	sTTJnoHcRadepDDHOFHmG9qrBmiXyqXMIJZCSp8iZEsS5wDQEu2XoziRHyrsEW9X
	Gbpa1V5lCgUNGCcBRKivhn2+fEXg+d7ZXbgSbjg5q/Vh4wWbaNSSNJW2+zhbfk6v
	H/tWZWkp7hqOceQ3+w/pyXhea9kpFqqhA5+7C5f4VUlD6tY1FDYiFrsGCIqQTPc0
	SnY8agL/LpKPGUvNdXovv2OFtL0bulOxOgj0qozZW1SUS1NjETkiAWrmVWSHDQ/6
	22I8PfK+elkfefrHJA9yaEaQNW0rh6qzAmOa/fRZbwFwW1oaiDi4HGffZWsHb1wo
	0786rQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7h50t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:29:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51cab6f7517so3671201cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552947; x=1788157747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=;
        b=d8ZdkiAubqSfABvlAB71Ieiqa7tb3NKcja6vHX937qmYGYrAx8OW0quC2F5Qhf49Tq
         Cz8whAVfYd+CDbRHH0kVcqF+kGo8iReJYuM8dw84+7DTvRgTecxDYxhcTXZ0SUGj5nZ3
         JyKR2v38r1PnWNuBs/W8wOTvb2hoLkzKJocDcD7fjms26ORfgbB24suLbgEieDOg1uP9
         /2KKkOMe8SEiahi1DgiBO3pxOnK2eFpd9+KHj3a7lHdujOFdIxhHgZrB+g0Y4SJ1LS59
         HazmYJY1rG0ojDz4PrxEfEVMDXzQuhUvGxG4vQ2IFgNoQ7I2U1ObnttgmBP1R88t8a7T
         JAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552947; x=1788157747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msf0BsVoaAbFJDAn5wjcuvBVEXnrv7/hlZQ732W3wxw=;
        b=m8kLGx+K6Julpdo6D5kpYsYf2vIFrokdHNdqwWnSHrP4PiVFAOooBZ7HCVxhm4A0da
         eas0uCB4jmaPwQ/1WIFG7bwrOc5bmw3zKXySR8pwBcpue8j1LHhniiUviXML6I/QwkfX
         oY9sgVh4FfFvt+JJV+SfOiFp4uzKRTpEHl6ntt38SQapaRVkRxzZSC/yg1sMTaccBTGM
         sk671eYnXBN4LkEEY1nMsrj4V4R0TLJdMcu4fVYhrUo+aNrNL9VPQq+ecZqCO1c3B6BA
         omB/CyF//UGGXU7tPWWPPbfm4vT9dkxdgN8VzralMsGEbw8opa5sob/sYt0r41/EfROb
         zFjw==
X-Gm-Message-State: AFuF++k/vkNiJL81NdFEzC+pe4aCIL/BisXbb7tETYIyDkdJ+1+Vpzvg
	ScDjF0RkBpBTlqtYTIkEBFHmdVk73WRlHiWt8AqFeFLhvo3eujcYwm4JeZf5Aw98k9pV86bFYts
	LWaXGWO5VpQ/2MBriG3rFZWmj7/dbEjHksbbwYJ5jTPGkjJece7CmGHx+0QPBxdSMnd45
X-Gm-Gg: AR+sD108Ff5o3WARLi3Ry133qdfV8+2VjcM5WPCis67O/lak1xtavxAaSuIk7CyqnDN
	Kwb0wVzqVkw8xMmCYBAvNvazOmZAqXD+TPwtns8ytwOZ4fgfM3Ssxoqtc58u3Mqe0qAC0HwQFnr
	hsoc4xe1C/mnaqWrg8KGu2/ckleaT+/p0rmXz6H/HO9NpD2+TKwe9UDGB9m8WNGyuWMPYfZfEcI
	CnoyYq4Os3QTLlHDzLNlMHWcsgc7Kx3aB/NCNmuOwJ9xGoqfS4w/lCGe2b/gWZxMqlaVbpnDZiZ
	95kqm0Ri3NoOGBIK+qRhvkx871BN7+cg/4kjbYvKDbEWPYlFn0ZMHio8P9859sSpIJivYkEMKH4
	G+F7v30umxBQUZH5ah2HbWGCa
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr173318981cf.0.1787552947038;
        Sun, 23 Aug 2026 23:29:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1210:b0:51a:8945:312d with SMTP id d75a77b69052e-52df549e41bmr173318721cf.0.1787552946673;
        Sun, 23 Aug 2026 23:29:06 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295632sm1211537366b.18.2026.08.23.23.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 23:29:05 -0700 (PDT)
Message-ID: <6a496782-1bfe-447d-81b7-ef0663963b41@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 08:29:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add
 notification LED support
To: Reza Kurniawan <imkyufie@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260820110347.98068-1-imkyufie@gmail.com>
 <20260820110347.98068-4-imkyufie@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820110347.98068-4-imkyufie@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8be4b3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=sWKEhP36mHoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=67D7fx9BXWbfjn7edTUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXyKHwyq1bb+dO
 1SNiDY/CaHizfPgX7ZuSHQTMdioUHYPERt05f8CF3+EhEnfQBYoJyl3bHzmjWHReZ+p9Xeze5l3
 WxOk+4QJ6n74JgjVYCU4kJqnhrwJdww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX6fmbDrQAWy9S
 uH9miqgCVVAK1creJmu1sRrdD8P2rKWq49FIyvPWX82Vo9TslHb8NevhEq4urmLK3VrBDdfEr37
 YdgHQC0fw8Di72g4E8Qhvk5aVvUHavxdPW+8f7XpMCynxLSuUTKJkZLWw7uEtzSaqnsPRq9Jk+D
 UW6yQucxfdWcZOzKntSi8K9WpKCWv3XmxSCUdEjufyDRbkHhc91kN9IDTAUg4ASkds32FlRqHsY
 ieXMzo19MA6+BOxmoKiNneKHrKz4u53YanudSptcEEdsZG5J8u8xJ7c1kJpH/cIawcCM7/cvaND
 ISdJ1ac/x1+ILXOD7L1C6B3/2ool3imBPpYbAsR9VXoXRnuVLQUW2Q2DODyhdWxXpQRWNZpbe+z
 ppj2KfCa8CfPQDG22M08D1xbhGEM3M8Ogo9Sno3vYSk07ClOhrZ6rN1u4GPLy6IAMnMJHaBK9Sa
 6jmDfjZqHYLt1wSY13Q==
X-Proofpoint-ORIG-GUID: JHHOKzJznB2CXy4X07t8ZdvyK6Q84n6f
X-Proofpoint-GUID: JHHOKzJznB2CXy4X07t8ZdvyK6Q84n6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240055

On 8/20/26 1:03 PM, Reza Kurniawan wrote:
> Add the aw2013 led-controller node for controlling the notification LED.
> Since it communicates through I2C, also enable the blsp1_i2c2 node.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
