Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE386384CD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138477; cv=none; b=nAnA80cl8iyjSEeAsF+kYeXZGllWlcPvkciY8wdbFinqr6hKsHlDHg56RZiNk2G3LzgzcfITG58n4DFmE2ByhEWl9PVCY+pNHW6u/nz/7YLb8GTGHk10fBP4amhTrt+GhZ2esL4F8+Efw1XAmim88vrWqfJsf5qIlt+LKNEJD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138477; c=relaxed/simple;
	bh=ewweEl0ILmlFEynfdw37i+tzRtA4GALlKRycg76XvTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/0uqaZMlWTxV8FZ+89puEN7CBEwVRe68ILkeO4uFCElKJtrA9OyBtMz5AOtsxKMLKYuK4bW8MMPB04xNx1Lo1E9OMMNJ57voVHmEbHiu/YnwxHYtWbX6TvId+5mCkPsN20MtKTi/cTaGWHbt2MiAWkXfVTg7xuft4jmrn/+7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eX4LkD9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UdH2fRsR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eX4LkD9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdH2fRsR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G89e0O1675040
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=; b=eX4LkD9QphhegX3G
	fJSC8i9CtvbMoISkCJqJj4tLN83yck3czz7esLSkPR/JWEMMHZkGzJigNb4qDoqF
	uOx79DkjoiaCpRxgvkHYJfoN3sBekrGG+NF76SBzOnx9xrn1uVPW5qaxoJiLBFM9
	pRjhVIWxE0hCPaBIrrONitdxgY2G6TC1zYyKY2b2yuLl+rhUYuJaK3uabdmWn6ko
	U/TRGHysUeKbImfIiYzJjR0Db+wOTlAu75tiBLSJnx9mKhJb5Q1pUIPkWopvZiEQ
	wUskhBdZHFf2DNKOWElvGkYf96aDAF5+NXwODb5LY1Y2Un/J1cQBifjOC1L1WaXO
	NME7eQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr0m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:14:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35a4d2e39acso7030021eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792138475; x=1792743275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=UdH2fRsRdHWcADLvg6WmgC9emaF25DmpsesjOLqRKZLVCAei7scoOp9nU5DkOrQAy5
         OrRkzhWF+avhiHXnea+dFKgMXKvmLacr3839YZ35xEdYi9rbs4xifPX19YgZ6STVFIdj
         xRceLDis0KN6dpzpT49M4CSOOhT6Hx0+DSBzBRCaHHOdKRPApWVxz3gEGD4xcaxAFIbW
         gQZ01CXXzqOIStTtHycom8RCc1gOfAeAse6lWOpAALOF9OuBDKPlZIascQtevkL5g2XR
         KBFPqbjEwPusx6lWHS5XgcMjj0QbPrMd5UQcXcfg3a5pTvUZrYC5Oml1xpVun4rKsak8
         9Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792138475; x=1792743275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rUpPh65ghh2SzJa+5Dba6n2zsetNR6ZekjY3hSaL+Kw=;
        b=zUOzn4OCt67LJMXWs2b17UcZzrHt7CJVUjp4pCaBn0kmyEo3WUE04oJ5lLRyaRABDH
         VKl4ZsCRRuJvQz23xU/l5HsZ2jGi1f5MrqbJrVdq6YuDQfPcCXs56Vb5bEQ9rvoOUVrn
         n7Z323zC3OQXdWRNzZ6EwFqotVwlvm+q8gUsb3DEglJ/d/Vc9awBJzZQYeDiauDIY+XW
         ZaQ3Sd/lRDBKa5kSRluajRr9h/3a5ej9TJBYMV8RALkk1EsN+GZJv66cCe3xpHh9YFep
         Ol6mVr2BlzJ7/yIce0MmIbpw+124zU1ctzGWLqX4v45wEN3Dd6JbIEKJODfEm/A8bV6e
         eHMA==
X-Forwarded-Encrypted: i=1; AKwUvBwjf7GXqd4Csg+s8G9SFLJyJS7y41NhyNaWHrDetn35OrhOna3C5tWF6x30Mt1mFB+91jw7qSUr0D53Mbed@vger.kernel.org
X-Gm-Message-State: AFq9FYK7HP66oUcxIOj+SEYr5Ofd7il5U/4PLg3v/N7tZYxvZBboStxg
	gISTcV+MNxW9mDANrZdfA6tI0cmLo+3zMw3GyWS8bwK6cdW99pQGOnJJdIQfZo5n4MigBydURek
	XD+z/HzBqOGGP9NR4q/O0XaBUtU/bQ6lmKKEogt7vnQCD4lP6/K4s4tb62PLM+3LHrJ1u
X-Gm-Gg: AYBFou30Rotnl/2NRvXVcznOWm5eg0fv4ysfLPYbFYYcALipqdGZnqMUVl7+Op3pGWD
	8txAfdWeRnd+XwEc/dQWc9t+vj3VZa4d7aWy3RM2uYusPaXowzhjY1dA/rJMlITNuCKV+3syRYI
	JdPocd2aSs/QVBEP/etkMc+BvAdg8iCYPzznbbgqbmzKSTljy+zFT7GB3xAcP3H5Gy+6iaYRN8N
	2j8Nn6TiARftfj0/LpX1MydVSGHFjQGIsRIxGASy3/a0mmfu5SrFGIERZnl2XLSRwikb/kqUKUT
	2EgtaDskgcPDLA5cOG0an4DjoMH8bSL3c4cIlKid7hJ8WI2vYVh+hbo+hxiqc6VGIQ4HLjd+r5y
	wLGfP1r9KWU1+gih/AE4irlv8OKp9khLZs2k=
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404494eec.15.1792138474349;
        Fri, 16 Oct 2026 01:14:34 -0700 (PDT)
X-Received: by 2002:a05:7300:6cac:b0:339:7b3b:236d with SMTP id 5a478bee46e88-3537dfc8fd8mr41404461eec.15.1792138473880;
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Received: from [192.168.0.106] ([124.123.197.75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm4528052eec.1.2026.10.16.01.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:14:33 -0700 (PDT)
Message-ID: <9a12fc9c-e766-45d3-a6f8-eb6ff3332434@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 13:44:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/9] ASoC: dt-bindings: qcom: Add Hawi LPASS macro
 codecs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-6-fb9f0667e613@oss.qualcomm.com>
 <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261015-grumpy-salmon-of-holiness-b6e9f4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fk_VRG2tKs6Iu6SlTvBTHXPVslnMFPJV
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1dceb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Z7qWu28e8E/v29kk1A4VTw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qLKQgrqcCyXtwMQRFB0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfXz+t1EWEinocF
 52pKF2usc58bcwuB+TvUFxbZ55LF3fdHk/LG+/NiBOTtuZw5EIeZEXIn9a2TPZg/nqQSi+Sw+GG
 6zMn3Vb5gEnz3qSpadZovJ0+BsbdiS4=
X-Proofpoint-GUID: fk_VRG2tKs6Iu6SlTvBTHXPVslnMFPJV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMiBTYWx0ZWRfX53qMi3I3Y73+
 WtBtdzzQpxXbYcoEUCxwqsTogFduVK+m01SK+DQ8I9gmlYbPBJzn+uMO0HhvtqI5M4aetx+JWzy
 XYNxb1/xb5VkhYNoqy5KhGglvhPZ9fXcaZxvBenTrUGWwLvgq774x3kVncQXZxDVkoRY7e2OYmd
 4hcCnQjLxInKyuWE1agD9KbvMcZmJ8tl7JjnFQarZs7f7h2NAo9C0WRrMGVHRrfxyOHbqVdWOho
 DzffwjhBSv9n1IGD3+iq8QF62dNpBtZWzwLrs7fQdyEKYZWcfZpbIQwPkTCekleajOVvF4zSJOt
 /4imo6ckIUXi0kdlzqCRpO3526ThxuqYzeJrL8GASO6kX5WQpof72cnWaiQ2+numOYj0jMhsY4j
 5K5PBtzIogf3G+jl+O+T/GVkZK5/EzMHcWhbW4rj1Yjupg5Hmpt8B4Lx4RDfOeh3Am8ACD76RK8
 u8up/HRKcNUubjDKglg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160032


On 10/15/2026 3:08 PM, Krzysztof Kozlowski wrote:
> Are you sure you are not using source clock names?

On Hawi this RX input is sourced from the LPR vote (LPASS_HW_LPR_VOTE)
instead of the MACRO vote used on sm8550:

     clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK ...>,
              <&q6prmcc*LPASS_HW_LPR_VOTE* ...>,
              <&q6prmcc LPASS_HW_DCODEC_VOTE ...>,
              <&lpass_vamacro>;
     clock-names = "mclk",*"lpr"*, "dcodec", "fsgen";

"lpr" is the same style of name as the existing "macro"/"dcodec" entries,
not a parent/source name. An sm8550 fallback can't be used here because it
pins input #2 to "macro", which no longer matches the LPR source on Hawi;
the other three inputs are unchanged, so RX gets its own clock-names.

Thanks,
Prasad

