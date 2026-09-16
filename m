Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBAC47F3DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558172; cv=none; b=mzkNN9qlrmz2NN9WSCOFT0sbzgRG5wjGUP/72mfLop+4Y2sCDemtMwC0xWhDX6WG7mt4upeUuIzQji5+CdHTTtYZBu4ebt+VRaWDKj5Nb4YJS7mB2MWSBQC25KaJ+d2aapJuOPVQXWdGFHDzDpwkONmNUqr/mhmHmpJYvdnrZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558172; c=relaxed/simple;
	bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qevwPFXlL9jMGmQ8sNHOLPGymRN8e6uJwBp0IwLVIDz05epPBIJ0mauLqvAlvdS3z6Qmuf8TDUCbOlGuALfxwomBUkRh8JtN4v/JdNlirvRLaE5IBGbKmMeKTqhPz2qWZVRpCxgZ//fkrRmW6mTpNUj2AQPFOXbMCmzvafD4QNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpaVmxwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRqbQr9g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpaVmxwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRqbQr9g"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92aGa3169020
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=; b=RpaVmxwmyMOzIZR2
	kDtAUBfg0AgHqU/RCVmEPDCrMJeJojOW1JMJj6bcu2EMqnq7WBC0udXk2Z9Nn4UW
	8Cmq/9vRW1eYdIGR9/CTrlJrXIyOwHBVv8Ie7Y9cZZ1yfX9zfvLzAJ3tO7xo12FL
	GZwZDFYhxuXGaNmO1TZccEbIjv1vnzM2V+Fv0R3hv9JdvaBWxstghFMkByY4RQIX
	aCjUOWdgbJZO6o5qi+0odHi9CirbRcF4CZXtPkOrJ9NRQMy5OhfXGqXcXLyL5kiA
	IizjnMqkj76flYJdyB17ezA5H5HjLXjY1IOMCJhErwSiIQH/uRF2PwOdxt9xuXdH
	+KsAdg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rwsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:29:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e1bbe2c30so1203679a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 04:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789558163; x=1790162963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=KRqbQr9g6uozhpNPNonaC8YUaeV1WNp+16x1ZV6eD8EwRz8ugkqLCMqKWsmofP+Owp
         4h8fJqssxjMtnWK2Eo+D9/OHvZTseb4sIPx1NFr64R1k3YjKHhiwDQIHROeNaMXbeeNu
         ZW2JC0h36WR2QKB1OysxPMBMzCeDcOyWKE6b6ysWzMybPXt7iQX/xQM20vMvAIMOncBz
         RRUORFIOr1ca9TQVZyCscNuaWtiWuBCcRKz2Sjwie/tJaJZdG88G8IhLv5AtdtCPsObj
         vxhKfrY6b005/mrFRa7S+26YEtb4henfQgHh5j4RQ/ymjDwxvxZ6LEVT2XzsRiT/LGT7
         VmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558163; x=1790162963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOrL3sm+i1neD6iGy2zkTnSLDE6KJfju951dBmahAos=;
        b=b3KGsaBDmNPdbIoruiBXw96KsVB52fZvZ/QHuBBvN5Y1uPYGcBlb9TMFX4L9O+p3/1
         VlpzGiAj0Yp8FdkPSoqVMcSCij4koUT5+n4SB23JgD2hJn2HAagj+8hICa/tgGcL90Ho
         v2oJndUvb6e4ujT0MffsK66LmUNdTbXqpeVvCsBxQTaP2CovG9YsXpVkChjU8Q64Axly
         Rto0bFBQPMKQ/+KHiLv0MUCjl0vDAeSD3gqtz4b2jOJx0UtF14npoW97EdNotaFWZtFu
         aVr7j0u80Sf0hj6wCowiun4sqXs/wjb2hzDS3yw0B9Yt+JnxdEaMEBHotvH5CApoyNBs
         OaLQ==
X-Forwarded-Encrypted: i=1; AKwUvByTaecbMD4Oo3M++7BgbHIveYBiPGgSBC1/uc5pOSHFR3vLAbYqtvjxlrsLzr2xfDwY3ENgt+ugs0d69tQJ@vger.kernel.org
X-Gm-Message-State: AFuF++lvPu8HJLa2RSqgyeOwoKmm0xMIFvHIgL0Ze41FWVqVSzaMsQsy
	+C1IMT0sT+axsROBZOJu8IITVUrgCA8J7gmQqwH2iRP+lpqRl1mMHmn/VfU2+UIe1fcxNxMhfqk
	b+EZLy9xm6YUe6Ws+UeQ9LRTRRqJMxHHJxcisDwaN11Ncw1kw1R0G9bQFA3nlBMSy5DrK
X-Gm-Gg: AYBFou0n7y+16yPCmLA3pZ/6/pPXXBR7DTHzjzOaD2FH7YUo6cXNARlY0jiFTiMv8Fl
	eXm8dRP447X5HPA06QwiHS1l2ohS9ZVEDpuS+qCKzECpEwvuKL9zsFFW4B0Ww5X/Dfp8W8nEgYp
	r2/U6RH3EGowUV6qk3B5X/9DCH5B8tF71mwwsTuZ74wcWSCXze9vh3g8ZJaLCMmJz0ye78/sA01
	qy5pgzJkvqjnIHQT2l4nS4gzDuAGGS58TLK/uiSPEyf/ryZ8ukqx6lBvzLIZ1GOnfbd3xQGk12t
	/IF6nvEeGUT0fHs8zYP5ta5Fc4h6y6XrSmqpTvTl/BhtNwdA4IUqQZGypgWUjFZOSKFSpjPj8ul
	ojrCKV/X9rmJNrrQRFulk7Gd4oYXT
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919087a91.9.1789558162631;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
X-Received: by 2002:a17:90a:d444:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39e1e314c60mr5919013a91.9.1789558162159;
        Wed, 16 Sep 2026 04:29:22 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b71428dsm4356441a91.10.2026.09.16.04.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:29:21 -0700 (PDT)
Message-ID: <5dcdf9e4-6be6-4481-b5a5-0d3a7784de9a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:59:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org>
 <3a2f535c-7ccb-4b50-a6fc-f73ec02d4acf@oss.qualcomm.com>
 <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <78a7700d-32f7-4592-8a50-c90175338972@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9QhZ_prin2r3HF24gAg666xNJ4G9U7FA
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa7d93 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yuRkgBCuwwUBbEn3D1QA:9 a=QEXdDO2ut3YA:10 a=Qzt0FRFQUfIA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 9QhZ_prin2r3HF24gAg666xNJ4G9U7FA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfXwJq9kbvo1seM
 WDiB+V3+HUzlsRyYfYKe+ASglR6Om145CV3OVvOYnyUSR2yasjgUw0hOF2An4b75tvdUb7jF8Hz
 GPdJMTDGKnR8HzVqun16aGUtOoHWH6wzRT/iPUK7RzN53J8Vi7RGe2rAa9zYqnk+ojZm+XcfGbb
 LyFBA7sw/kL766D8UZh2x7LdKXotIkb83OcDo60mmssUyBIjjVa+8Ad1yjdbU7V8rAiVjif+Zrp
 0Fv2cGzKaPoMfvPGYWpd5pJTWPAYVk1MhSDVgJYEUITk/adFE+V3S2YCqV1mafWi0ykVJm6HtEq
 974ihJuzFCjjtHB8H4V572fC/k5A5OPQss7cGFoDMvQXj74yF0ocPiKvg2vpodbrSYRNSl+isTb
 Q5ekNwcDvEtohfQAtCc4qar1wcCnQA5NfczJQ8vIilgxBMKs7tx0TEp6WT8CJunLwmvct9JNDRA
 2xj+rodM8LefpNbEBQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1MiBTYWx0ZWRfX9VhGY2HxPY4j
 uCeXu/dvo4NoQn2Kwsj9zyOVExwtUn/IyWSH595oNzpZk4ctWkmMMzjabhqvL/eMkSfXI51ex5/
 oZwXs4zmLe3qSukh0iYw+HLGjW7F2kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160152



On 16-09-2026 15:47, Krzysztof Kozlowski wrote:
>> For the series:
>> Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
> You cannot test a binding, so why replying to cover letter which will
> make this tag 50% applied wrong...

You are right, apologies for the noise.
Bryan, please drop Tested-by from the dt-bindings patch.
---
Regards,
Nihal Kumar Gupta
