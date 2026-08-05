Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282953C5536
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 04:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785904853; cv=none; b=dPgh5O0hfTbR4V20K8UoPIMZtBuFP1uJ+GgBjkC9Mnbsl6FxvOTisngQVcYgu+KXO+TGuZkeJrzb20RBxbBFoYQtU687843fKf57Jjrps3sOaT66NkHmPcnwW4cnmmlAPb4dI2/x3QCbv2JkGW74JyioetVVLVUTxpIyJxwIkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785904853; c=relaxed/simple;
	bh=wER8YsqarG4t6cQsloycf4Pe11T8bsSMBoAy9hE4X0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yg5AlvlCcXF9EE+F9KCn9+CP3NbZ+ykoMFPjlMUwSta4URzRaOnyT9AI+SQP+5J5GyrsyYmr8p8Q/Ec/AiUEWq2t9cjxG6FwU2yfuZIZJB3MNSDl9U/LWmcf9YLPCuifDTXrKmvFyrdsptuussiqG4ynrg74/hi3I+Z4HEGfKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCQIehpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g68xxw9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCQIehpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g68xxw9T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752aoUI1305165
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 04:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=; b=ZCQIehpRVGWRbFqR
	SmyXf/YAu7tHhgfejJQtoUrdkbD1mLp96uPIcF6wklAe+8YAPOXqCMLtATD65joN
	RhWb6x2ST5knVnlqwY9GOqHSg4qoj64e893s42SBozQ4fBdlRZJzArUvjamBLyes
	JW+19qteXY87FIa3ArvSkC954qL3nAfh0eJbPvUUjyxk21+ZH+4AE6rHAPZc9T9m
	ef3T4q8NLET4WYXcqiKv6zD3XngXuIsDMZ5uGRUdjL54+KZylQOi4teYoRzpxlOZ
	AzGS5dwf2rgSu1Hp1GbQKIydP6jru3aPry12UYexI696zv5LRibi1uO0wyePjyMG
	l/osUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmgku1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 04:40:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso8597255ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 21:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785904851; x=1786509651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=;
        b=g68xxw9TaHBgcVHZ9BCAlAVYN04kMyggo7/TGnewy7lf3hTdolT/l1kjjegOfI5HB1
         5hDys+TIK/Bx2UcZk5iY/xaTFULfM7/Byh2kPwC6YozEKHzMqKXLCeNetIaNGioCMyig
         /Ub1eBw/I2+5VWgJRaD8n6NvQJGdhHCqxjPemGqXVCMMDYG++xLLVYvDiurgB80qdVTS
         UpWpd8SU4JcP4TOcPBpd5OArXSoupVPTQBQU7j+0BoCx53yRbtn8s4nU6frZ7iCaqnex
         XE/ll5n8WdjZI9kBYmm06phENV1G2CzoODKABTGjrrUFBOSzc6reAwqTNjRCHEFDHlIh
         s/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785904851; x=1786509651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=;
        b=mRBJPOqjqa5xQrMPIi/kfxz8ftcznVgQfSNC/AlV8UAerbSHslY0NW/uvYj7YvKmCV
         mqFtIXL34VzZL34FT/JJCwWsdesce7bL/SfEhpFam0xsUZHsSh+KHUx0hjuIpNn9JOjB
         BNBZzHYffA6pl77VQQSxVdJR/aw7I9t/8fhepU+S/uVzCquLLV2sv6LUh6gZBc/WvZzz
         pNBk4YJD6464XrKl8mA0bUFTD3KvnrygawlTRhvbxQ8QmITDvjD+zfN/rZuPMUv91TI8
         CFxW0T7O31dZmXYu5NIOxUIf0TK/It1qo4rvg47mmcH6cV767MGdQEE/crszjcVygG3x
         tsQA==
X-Forwarded-Encrypted: i=1; AHgh+RqVt5G+cNej//al1pcqjIZ2Ba6kkSvmbcDuHf1/ArOXkj6QZsdvQMT5nS/nbaKS2Vy/d4Jd2Vi142CF0YDt@vger.kernel.org
X-Gm-Message-State: AOJu0YxNS1oO3UtC+i0Ee7V9ENsztT2GOsvCLuZThiInYg2Mr4YzGmxM
	FotaZ2rnQbSlhMOgVef+vHHdyK/E+MmWePv0S+Uh7Yp8gt2myJU4G2g6nqrE5o5OirLGB1OFgjA
	IzlekdwrI319R9BsMvzG+wvP2fho6QJhdAmu0JOeXkSZnPFWzLHTJVzogxzd/geGKYppY
X-Gm-Gg: AR+sD10lb1NHlOJDR3Jm28k5Dqm35zHKG6bWgomPpGSbe+rdYa6FLFajG69DLiyjtq/
	frDR4Kc1rCey5uebEfEmvKFmX80hxyQCAz0ZNC4idUJck0LcEz61Ir8pwDoSHq8lwmNAbQi6idg
	jpw92t2l0HsqnlciRU2KlcS0ZBqtCDQ6Wu5bIdPkcYAM7O78ZWIOaaP202tJEG8FH4530thZxXq
	z+rMXGHgWtUv2uUdR/R2c3L5dXiC06HTM0YMOoN0E72AOdIHEfli3cnjKb0qnVEyZOiImV/PGLy
	etIlpK4Gzu+zsQ2Z7rKx/564cv+WA9yAiU83DOU2DsiNX19f622wudAsI8T78T8YzBJgwzPLdf+
	GibEU+XfPBOF1ua831MOdTwUEt8/3QJwtDfk=
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr43882385ad.17.1785904850794;
        Tue, 04 Aug 2026 21:40:50 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr43882035ad.17.1785904850409;
        Tue, 04 Aug 2026 21:40:50 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a96e4sm10496339eec.26.2026.08.04.21.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 21:40:49 -0700 (PDT)
Message-ID: <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 10:10:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260804201645.GA1781336-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAzMiBTYWx0ZWRfX38cDBm9JRplN
 Mj0mRi9TLdtzNLrx+orUvsQpWXeLbefOIjy5rSkzW/NlwVuQMcAGHai2pmdvMpaHZbHmCN0KsBx
 mcEBq5Cn4JMxe42lM5IY5Z/RQpesGe/0CMVv++SEhmxO3qZx+DMV8gGl/h37iBg5bRlHHaRVKvp
 EITZJ3rXyJxZ8sXskwTvQIugcZHzAWQKl+37ioAhCjuf/2A1LRNqo6wr5Q11PaFt17vS3NbSaif
 5avsUQ65cYsjJM5M6cNGOSFn4UjOiJfBdsEcQ+zVXVgVOlTbwlFFzEpYMXfrUX/0pjxPfv0C9Ms
 oKl4TR6x4CoOkT6cNcf+dGBLLVgUr+CVrRbBa9uC/TUgDshHzd+GHqCeo5eqIYMA0AU8vZOva5o
 yzBqS6fm/NXL5hnUOTaT/0cNn5YUJadwwXW1PT2ctX1nDcn2VqS7Pl1OvNKzvYILUsRmwcehviC
 zOSt6MK83D1VeXPk9gg==
X-Proofpoint-GUID: PU-lV6g-Cm3zDLkj9DyFWsIlv14KWCdP
X-Proofpoint-ORIG-GUID: PU-lV6g-Cm3zDLkj9DyFWsIlv14KWCdP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAzMiBTYWx0ZWRfX/4kjHXdYCY20
 L966qDogDcOKzNxX8lL+bGkEjsxBMrhr3ivpGHlKQ0XDcHjVzXM/GaRxzgrTdRqX+1vNMjnqQvx
 ZVtbYdN765DiIWC547OtRv6dpumMsnQ=
X-Authority-Analysis: v=2.4 cv=XYC5Co55 c=1 sm=1 tr=0 ts=6a72bed3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=y1gZZZBYtMqdAonGNrYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050032


On 8/5/2026 1:46 AM, Rob Herring wrote:
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
> LPASS_ as saskiho points out.

Hi Rob,

Thanks for catching this. The change has already picked, so I'll send a 
follow-up patch to correct the typo.

Thanks,
Prasad

