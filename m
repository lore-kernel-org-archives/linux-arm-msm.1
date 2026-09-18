Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C35D3C1D40
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718464; cv=none; b=XXFbY+8fKZKpqGNgTGb2dbO4EMQwDTk21XJTXKap5h3Bi1dgSc8+hzuYsENOojrtHA8X0zvC6ShIdd4LcI24qYMy1+LCErv/4/lPgBevscsiETTxFcQXIHtlzaSe0iRqCHtONTXJDu6RUWWVDZ8CtqIW/6AhS0eA0AhNEwxQ2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718464; c=relaxed/simple;
	bh=8+ZoiSE0QUXpLLvwBa7Gs5wfMdhLA1mfwYrQghFEgkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IepQCORDiNvMnzO760RhdimgEKTWsszGvMPQacyIXM1+fwubOrg1CGJUvx0S1WPPhoanoXE5o+EuVz6FgExPPu8iH1oIrBPItqKXhMydyB/2JWujuj4K4mCHv+X3VLdmTK1ct1NA11Er0UDG0O47KUk5QHq60w9LBJMuG7tg3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks9JTybr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDsY1U9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks9JTybr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDsY1U9E"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I603wn3304835
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=; b=Ks9JTybrqc2lnucs
	y3ziplJwm7iDeWksqUsdq7pqq2FOoWFjLLJoUv0RogJDMf+Wy3lx7lec+DZERuFn
	vgMQX1b8LruQnv8O9dSG0MZRwv+LGG2tHazMqz+UnDy/y3chb6w91uRx+LuoPhWU
	jDKS7p1J5XO/1vTBGvtIYDmU79pzl6GAeZmVAqUhp1MshHYkroltMTPY3mWG7wEr
	s5e2fw79mMyDLXhfTBQ/7funrJyBNIdj/p2RCBjOCeX8A9ZBbFp07Wu7MXt8z34H
	Ey3k2tDtB7My/UwydZCa5NdF0XehRVqI8XsPKtV/LwNneeAIvFYM+xeJmBD2PPNf
	hKEJzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ktftf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:01:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f4002c1aso7655985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718461; x=1790323261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=eDsY1U9ElvBRL7ngUZrvhZ59ZerneF9ku6KKoi+ooVRcaYy2f6lf63UEEi223ZHQCM
         8HXJBfsQYcnfoPtqY5cdO54M4ivUFYI+zE4blqtdt8j/brCbmmmsbFhAJiUP+397vwEv
         h7qWo/iwr06sBx5LJhRdwXEw2lCFFE6DGfw1JkPlcgiPWMVDitnKsBlXimxV6vv559rm
         XdDusqioWIKn1PPdAxGnUNbf8qE5dsEzxV1pJqRtP4qj9lQ15y4F46hGucMRFUcDweQm
         ZSnd7j7//T7o0BUU2BmKdKaDcOrKepkxihfk8hDQZQ1gyCHoxwqATz55GAy9i5LDaon5
         NrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718461; x=1790323261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYCS+iH2jYyOJrRu1AhW0y/AISLrS+T3SnQPYRrrt3Q=;
        b=kAUs2cmT+piKLkLUfJ9MEUAmDEtE8puXvJTvYceh1ZqEoRYrq21/PRPzItnlZ/QXIx
         7necaF/Uwf98UCNl3KZgJdk49IWliUe+HxwM+uy+2GdWvxvzVe69tliUsk+VwN1T22Vm
         3q41WZm+4t8i7vI/bwODIQUNvjxtv0Q9AiuIZ8jEuJbjUB1DE0ihiDAjNX43q8TCavpP
         Vgk9j2xoobm1eehFw6wnA6dmMMB5u5fJHXMY3YMu0OwXCq+sPX61bMyfDj1vCU4yMcpr
         /7r5UQs35RorN9a3a0Nepns3R6ryHBIv/hSoW9In9G0O4eGV45Bi+G/+kwtprJ9sClYj
         CBIw==
X-Forwarded-Encrypted: i=1; AKwUvByeQwBlDVB/yew6tjC4tSMEDxKR2ALGfjrIF6kvFsLQjIzk+lFqe1879D5LloxLWszf2tb2+7sjBRm65nqB@vger.kernel.org
X-Gm-Message-State: AFuF++nm5k6Xjv2MeX8gMe3t7SilOIEeiGYlHuyNV5nUJzYcLeSWmOfi
	6SRQjTtIBn2ZTFCVbkKSbC+aqylNHGLSw6MZVyUVFGaNevJHsM2Q4jsHadxzk2twuHZtZ0zJs/N
	dKi3yYVuFOThg7NAaWcpRwk9EdsUwP9St1NsBW3wEslnzdY5ZoqNoTBOAa96S+qBZQ04c
X-Gm-Gg: AYBFou2B8Bj5ZuNHNr2t6GshYJiVlIcMW7JWxLF8ExaZIqWo5sK2MJNYWoFfalfgYWC
	KV0APvcPQJ6aS5mVE9PUyFj4j0ACbuA9guxzVe1fDT3a1fVNlVK3V+bLR0FsddTrQtcPNqR57RU
	8zCNe9tNDqUlxJIa7LtP4/+VErlB4efjdX+A6rxSqoTVT8GEMIjn/JFFzNF+MPNOD5YoRxyiVor
	A8Ni5Gt5e2nc5/ZjqNpFo9a3wOADcB0lOuHtGCm32KGDSHfb6bb7cNiJsVMOrXJMzpFm7GSS/Nu
	usTvqfmw0nrS7qKFP1naJsIdjcAV49DAr2sj8FqJnEKJcVlvHBJqVULwCUw8X5ixn7iah8AtX4W
	UCmfAUuXmjrq6owHwMBlDJQ==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151696085a.5.1789718461086;
        Fri, 18 Sep 2026 01:01:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr151692185a.5.1789718460747;
        Fri, 18 Sep 2026 01:01:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb45b0fsm30000666b.35.2026.09.18.01.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:00:59 -0700 (PDT)
Message-ID: <8d32cbea-fd17-4f3a-aac1-6f44a50205e7@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Add const to reg_names
 allocation type
To: Kees Cook <kees@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260917211009.i.312-kees@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917211009.i.312-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfXzgUzTD6xbVlr
 5GZdRbUd2hQxn41t2kZtmLMNosnbUbCl1qlMX3xQ5StqeqC5P9YTo1fQvbC1qdw7JybulSkw0tV
 TPGLPM1ab4nWD2yUx5LfgeOPrphItd3SyLyDFE1bZkExACKTC9mGbdKKbdqCEaj34CmWAW97LhD
 ieXmIqBGll1lzfSwUAN5/L0VpM+bugEJMvV0Jz0Y5UEDeKBc6B50kTpGgct4CoLS6OfjFJCVg8D
 Z65yS/2KashqRSFeD7ElhGhjBureIQccWattoxqvOIhizyiOFc/Pj5Y4LPTOrdQjkyqoTCHo2w2
 p4MKbYOMIkJz9kMk6rTuX69gVsBHra06UgFTt4nXsCxWAU7ZaqMr2SHlT7B59mMvCFfMBxyfLDK
 018VMzWp8ZQLhtWTfJerYASDcZSnAIKnjG8n0Ti2GmJPmCaL+XyrLMNPxcrKr7ig0yNHRm3oxTh
 YEilv1neCqJW8E9KyRg==
X-Proofpoint-GUID: 6--f8VvHKI3cIYqe4A7FzQmENxMO3gpa
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aacefbd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xPH-2WeAMKhyT3qgJ8UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwOSBTYWx0ZWRfX1WvPFPh22oLC
 WkwlNpORncrtvV5OgdIpgx7DG/Pqjqp56w9yBM1qqMta8knbgLBxuwXI9ybF0elJeHB2dcNn1rN
 RUrg9CsFa9wyG8C7K1BCNYPEfwLGKNA=
X-Proofpoint-ORIG-GUID: 6--f8VvHKI3cIYqe4A7FzQmENxMO3gpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180109

On 9/17/26 11:10 PM, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "const char **", but the converted allocation type
> would be "char **", which is the same type without the const qualifier.
> As there is no general way to safely add const qualifiers, take the size
> from the assignment target instead. No change in allocation size
> results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/qcom/tlmm-test.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
