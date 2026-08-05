Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFEA3DDDC0
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 06:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911781; cv=none; b=rm2DUIc/9eV9k3NpVuKkhBnYGM8xyj7VIK/ouOjFet0c8SKwCBtVf546iH8Zo2pr8LGWTLjnouXMFZb5WF4o8iKkEkdjwupHXWMk1kWAnS4z636kZU0jwwK9yRkzxplD34VyutPviYSRExAVY3/w535jRLz1UeitO3Z1pq94NWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911781; c=relaxed/simple;
	bh=52egO2uR6QROqzSCN0wZSK0KPAnShyTrA4YdSfd3s60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvQZkWUbN0Ox65HP06lWaHm853fOXoEOguzavwhhKWMW9OcP2oKmr4UEfAfrxYaq4a5DV7pn2mquQYy3N8A85/x70yDT3V21hnXYj5mQfHYcCrVdXe61+2Y3JP3NkVf3SxWtbRcAHsAf7F3xiL0qtNSc7vxiST9zCE2xpD4nE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIvhiEAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbE9P/vO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIvhiEAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbE9P/vO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755kq2l3143093
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 06:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=; b=OIvhiEAIO/wMDvUk
	fQFQcffiErY5wNE0gC5Gx9MmhrH6ZLUtp6gZfYX9Yk9+dxItooFNNWX1Sj6dHYIH
	IOU2zfpx/2j2okoTK1xPoNNTlRu0QehJ3vCuP+satAGGh6UoJwWMv4bGqCUihMKy
	Bx9v5zTN4koowe7ZcUEQYAbIxCXBPlf/3wz//vRmym9mRCgxarmmL3FbdNEQFdpy
	QccblBuav88aNjWqAv+nzVAYhNygubPSfthw2JV9BwgxiORqF8IOUxH9+bkR5WOh
	Nk4X/RYEQg/sanJqu1wpK7tTJm/huHIjGP+uf/n+WyAhTeoQXtcKBCSotNJkdJ9U
	3ARV7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3uh5q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:36:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9489f62bfso6921166d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 23:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785911776; x=1786516576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=;
        b=GbE9P/vOP9E5GZAg4PjlpXR3JCXlF5EjkO6Q1f4QeJUA9DJ/O6Zn5S/kFuY3pzzbjQ
         KrpRvcMgWYojgVJDsJE+Njyo81AnE9l7+hTYLBcStVGQFRZp1+D4j/V4kqKrv4U6O/JI
         OMq3rNK+xjfrRKDWgjAB7/jxLdN9OHf/yavUVK4VAJa9dBDhsUvz+E5Mxw7dHM3AxbKh
         LOYz3ftNSZrk+kI0Z6LAtH2tZtRdjmucrZIk65YiDWz/qnoLwQSLRfSL0re1TfyPUSqg
         iB5k0XxyHM3dXjWwNPXs029xEGZ4iG9pU3Fra6T3x11hajdpTvmuHzfrFqa9BLHXkD5n
         Cpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785911776; x=1786516576;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hDJxZk+v8/RtvW8Qv9o/0m9zTJWoPN2O+84UE2RIt8=;
        b=dXFzSpp0W26PKLyGqFFMZtwQAnuay9AM/jP/g9CwoFYa3IS0Xghnf5ZojqUuRHyBbf
         q78qWLa1mXh0aizdpjhpER1OleLQkGhwElUlOBTf/SQv1tvcH+i1OO1N38sAVFFMTLvc
         ZYHdy3BKZQJF366aEayEU9YKZMCJsry5dmBq9iMEu9KdwNeNu78A9lQ0Nc1TzDwRyFkV
         qLBI8H+sP7TZ4lhZ79JcwgLlX4oGjzZnT7YJ5rPSyc4JDI4ze/QMW1ZXmvNiVXpFolId
         czqAFLlY/BOKos+OxBDUMteX4rSruiBgYVrf6q82qL39MQ/Skl5OI6/Chvl6l340AJIH
         sWKA==
X-Forwarded-Encrypted: i=1; AHgh+RrEnJ0XRDv/vexZgF/RBqwN5HLAXrOUx7Ogwvf0tedh2TM9roDUmLkRwgXDIZCYGIrctDDvIS1PfCS1sFDJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrei84TRC2LClLAEjLss8uVQJKnChxlhMUBpOtjaui/aPe/0LV
	FLw/iS7v213KknZqSLwgidFj+Lm5EXEn1sR9p8l2elhO8DVRpZzNweNtkbqmG1GhR5GqJzZo4P2
	1Iy2c4Mj9JLgEStRRJGp1noNjR2082VtTmBoGxWNLBLDD1GjTSYQ1x9aoB5uo1Xbz6smf
X-Gm-Gg: AR+sD10Lm+V6wXZH5b9jlJyGmQiHmNHZQW789rCFqZv9jaLMMga2yjd7PGcZlSLh5mI
	V+fVeSaDk7V+iE7KPBUoTcHk6R1P3sqWD9ZtpLxkZJROPM7rosYOmD7/kbcfq2kIL5Vsvl+2GsP
	/yxWqmPVCC8RnnWjycOstANCV2OQpxp3vMnzg5SNE0fNeGIKR6EqdYDf0DDyPvfpJziiUsaRjGj
	hZcbVx+iisAAld/PfpMbXPvTgQ7nToLkOGW2TuzP2k9poNKSZbaxHCkkULdhndcm5+zcj2zqQY8
	p/z7shOnGLsGn3KUh/0qbrYNqvHE4gb6VMgjyMQBpI/HrkERvFcN1QjXEzbkMXcBBzUyqtd6Pfn
	K5ny5pbt43evCW5KDuojlnG7L6mCzEQ==
X-Received: by 2002:a05:622a:8c:b0:519:fca2:346a with SMTP id d75a77b69052e-52ce610775fmr40114291cf.23.1785911776423;
        Tue, 04 Aug 2026 23:36:16 -0700 (PDT)
X-Received: by 2002:a05:622a:8c:b0:519:fca2:346a with SMTP id d75a77b69052e-52ce610775fmr40113921cf.23.1785911775923;
        Tue, 04 Aug 2026 23:36:15 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ec2fsm6226035f8f.29.2026.08.04.23.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:36:14 -0700 (PDT)
Message-ID: <14fd0c6e-4f35-4916-b6a3-b5ebc293c56c@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 08:36:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
 <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
 <b814a4be-7c20-45e4-8abd-5e67a6a3b5a1@kernel.org>
 <7089bf29-acdd-49c4-a32e-82e266019910@oss.qualcomm.com>
 <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8f29cb9e-04c9-4048-bb11-854a2d90627e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MCBTYWx0ZWRfXy/y2IrABedAt
 luRNxdH8ip5hGXDb49xUcGu074e58gISc4WwLEK0/tS0OXOFFOw2RKAUqxVSS5ByJdhIvqNuBg1
 xcn94meoNvtpwNgeWIDrF6AYLaI8fQE=
X-Proofpoint-GUID: QF82-MW5obwkYm29lfoPj5ygSWQj6ebg
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a72d9e1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=vQhtWTqkcnNfwhkucCQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: QF82-MW5obwkYm29lfoPj5ygSWQj6ebg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MCBTYWx0ZWRfXzC7SS/qCpakB
 UAZTRGJeUSpiQw1k/C26j+Lq/xRJF0mq1oW/0CC2iScEW3ikCrvve0T5MVlOcVa9fX71/6SbucQ
 musRVkuMdlGRNCrh0FMOSnmKlKtm1A2A6WqNntbMWGjGXRfj5PYS9L33FDF+lVKrmprU4Bh8zmj
 da7hpppWWUjFkGqPJmhYRADstGBR0renukA81laCgczF5XBwg0EP9MLgsz4jd4W4N00Gs5arI/c
 Ovc+aEsSpjaZQbaVY1wINokKUdAuJdgn8iz6gmspSU6aBQc1VTW13dijmTT1hRiJQ14+HIx10h/
 7goN5W69qtNNB84kQjFD0M9jc8MOP7x0T2RMHI3iUOckbHrAFwCFOEOKHcexFaBhQT5FUXWuMEf
 R0i7z23UR2uxyGDzpi9oCVuw0eCkNHkgVZz/jBnPR5Eztw8i+1CA2pEB/06kKEIl9lL/LfV7Xrf
 MPANMccie+h/O0rxRcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050050

On 05/08/2026 08:33, Krzysztof Kozlowski wrote:
> On 05/08/2026 08:29, Prasad Kumpatla wrote:
>>
>> On 8/5/2026 11:40 AM, Krzysztof Kozlowski wrote:
>>> On 05/08/2026 06:40, Prasad Kumpatla wrote:
>>>> On 8/5/2026 1:46 AM, Rob Herring wrote:
>>>>>>    #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>>>>>    
>>>>>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
>>>>> LPASS_ as saskiho points out.
>>>> Hi Rob,
>>>>
>>>> Thanks for catching this. The change has already picked, so I'll send a
>>>> follow-up patch to correct the typo.
>>> You received several sashiko (6!) replies immediately after sending yet
>>> you did not respond to them leading to Mark picking up this patchset.
>>
>> Hi Krzysztof,
>>
>> Thanks for pointing that out, and apologies for not following up on the
>> reported typo sooner. I had noted the issue, but unfortunately did not send
>> the fix before the series was applied. I'll send a follow-up patch to correct the typo.
>>
>> Thanks to you and Sasikho for catching it.
> 
> It is not about a fix. It is about replying that you have Sashiko
> reports with valid statements!
> 
> And what about give (!!!) other comments beside that typo? Are you going

Typo... what about "five" other comments?

> to ignore just all of them?
> 



Best regards,
Krzysztof
