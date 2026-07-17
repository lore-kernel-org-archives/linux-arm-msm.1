Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCD32B111
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278102; cv=none; b=nE/4HSBve+kk8I8ihXWgqJmTXR8yg0phtw1oRkHMtJamOjcegx/T8fqV/oAsuCTGBr44rnkfheacZKDwe2VvrFjXhhUz86UGvSWUsAqtzXj5is/gqaL3bPhW6LW7hu3LcSI/kje9GWtcPgm46PR5GbhnGAQRNR5V54nZAlBe7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278102; c=relaxed/simple;
	bh=OXTvYuIrTYj2yqcMWQ+UUH5JKGO7YAhoI+uJlb6ojO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUG2/y2RaHfp6bzXpnc53VgS5GHAr8/dJwbkAufMt1wO3cqOsiW3CBeppW8It5jFPsJbS4144GLGnlyVkreI+HRlu25PBgp106sXGXZzDQ5NXo8JG1W0FVBb9ASIajG5fA8pJXlDBGPh28t5YnaTWFfr9EQYvxj0TccrYLdHYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mwf6N+gD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8pGU93b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mwf6N+gD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8pGU93b"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQes794251
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=; b=Mwf6N+gDqmQeB+MF
	gCIffkZmamCU3vQtthCcJufKjkarHk4uyCo1FU1fc9udEyjN6sbrITXYO+6lV1mA
	s8UdZutvCLSKuQV/KkwIuU4D9MuOy0kno9pp2O2E0TLOLdRVFRmLsHNLLgtCRlBR
	MT7PAEAA7dgisrmr37yyV5yhfjcYz1cZXYP41v1PHVz0M3Yzzz+fUkF7kd3cp+7e
	B7N3nd3DSomfuxNYisLAxmYHmIrccR7OwRDgvxJR4L/OGIiSQG6NwNxEq3MOjVT8
	QXHvRElMJmiT0q0vvDrl/0EOymu+WOMTawFDl4qdgKfH97Fwo3HaeEfdE1zTWAU3
	THaXNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8jwwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:48:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eb5f54b6dso155008285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278099; x=1784882899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=;
        b=f8pGU93bgm6Oxl/TdYFoRkD67hWa7TJLC9dg+erYYnqSB6p6VMoquU4qDywd20DbVv
         RPzmWhxlu6+Jzuz0KYln3VGPfR12PGv11mhBQryjkIKd7EMWW4h41gIwPqs8Q1JC+7H1
         MAqD/iwroXXXk+BPbkaWUEO5Y2ETNckwlJrGWLOyUbgliU8BxLtL1n7kRSkN0Ls8/6Vq
         TY12pRofbm+BJ7WEPUcPd6gv5A3iinByitFkkWMKVhlqNTCi0GLugfFVLgZAlzJn1W+B
         83+mKqrdeLUth4VzU7q6g6dRJKxG44t5NQkNhYt/j4C4cUYjQU6INxHf9Q76OY4smeIi
         KudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278099; x=1784882899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qafs3q2lCEGe0hturJ5yo5oxGn5+x5N+Xp4+Yu5D8aI=;
        b=tLlZnbPIqq+3jJQaWfRXTmARO68w3wi6YTM0+/oVIIHOZMbbIZRUPoWjP9tEGg66TU
         zZPC3f6yFYNOD03zABi4oObUjuGJbwTMvIeBTnDOjSsDgt3ETQjUWb8cGYODw23G2jUq
         NCUoxmi/t/t+W4K6bpUGlqLmn0ZN9JyGv3D53GGacYxprVp7c82AgK+16AnbvfL6mXQW
         xuUr8jl5lPQN3n7OD29HVc5BvnhI+Y7kCNHbb7ZTCTieWAIrAhgYHc9JdtCiaReKtmx/
         /XSTf4FU4dMqUNY4AeO0UP3lNibv6cKgleFLjHt2GW6L5yypclqV/qYgoFZXoG0kP7zn
         uAkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rot9w8JFn48Oj5WXZhn5PvvMBJranpT7lPjYg4k+yZurhaOnckq6suWNPAEgWuTyc3hRgalcW+W5ddhpVZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YxIK4z83Kof4D9thPmonL+TwCmAu2HPPCzwBu4F2443hRctrB/s
	K2m7+ddipzViQPnFnjSZkp0ZPBZwuy7kDeE+IweYeSGhY70m7s9DDxVqlmMzaI7wNkjqYKvXNs7
	hhGk/mHUu3GEQDWLvK2PRfrrE3KNB9nGphh9nEDdYNqKITV3xGVh5V65bLQASPUl8DUxb
X-Gm-Gg: AfdE7cnGT2QGcDKSXUz96qRGrmXNJB58+lhiAPvYq1DXLzgca5FBvgyVgLAxhaVAguo
	BP0JKuF6QMQHkkZ4LxwxdLP8hZjIvDzbNM1N78aiFDEEZ3A1yM2UMPf2GKfGjUCiN7YLZAll1So
	Av5E+sge+iSltldJ5BrspA1MkDbynNZDBzzceLd5vJHYC3ixr6EF12dQpM5cRIzSJ8F5GcJck99
	48rR3ZHS6jmDG3urRNOlEVuVP25hvpIacEYErmvqY/wPljbM3ViIlp9hK6iRsEWorkjMqpany9+
	0XnX/s2EFloJjVAebU/N78ogWnXqJNFQKlYeZPgpnc6c0T0RQprRcuGXNoAonOYZh1LlwZdJPPx
	dBvrIgEqixtvCFNsMUB7QjmbS
X-Received: by 2002:a05:620a:19a2:b0:92e:5023:78b with SMTP id af79cd13be357-930b41ce6admr140720885a.5.1784278098876;
        Fri, 17 Jul 2026 01:48:18 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:92e:5023:78b with SMTP id af79cd13be357-930b41ce6admr140718785a.5.1784278098500;
        Fri, 17 Jul 2026 01:48:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fee321dsm330199a12.6.2026.07.17.01.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:48:17 -0700 (PDT)
Message-ID: <627d9c30-5b6f-4634-92ef-5d70d3843102@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ESgA7BfhGfoOs_nNb9syg8Ny33a8KYw3
X-Proofpoint-ORIG-GUID: ESgA7BfhGfoOs_nNb9syg8Ny33a8KYw3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfX31vbc0IS3mgX
 D51ZgmjhSkdXgvO785Ue1O3gTCc7Zgt3sgo0QVnULboD396QQPeIYuTbUfinSKC/CNEBH2Cg5RB
 ZaHU0kEuYnQE/wBW821TS7eZv/6/RRg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NyBTYWx0ZWRfXyxzoJojlMaMy
 ALh9l65b6PPVUjOKI1/J1lLLxErrD4zvOr9WXPMb3AGze1Wi6e9+1aZlTSH1sBff/m3elgICfjf
 81ED+w2VL20n8/YD+N/xb1wLi0syor9mOGeKHfS7uNBOcpmyN/FjzdxrmYmV+UzCsILLvHIh1Wt
 4PQ/qRsDV9VAyiF52O318ANcYwmsjh3GXoRnojvX07EWo/Gb1ZlA+WQiOsoI2oJSqlmLAo6ae5D
 NX4h+ia4gvRfTEmEmY12t8TFPzffByTM51ma+EsRY6heebAEtCJ0PYxUyjShbUdTDMtBtlwKO2z
 aqUpUpo1v6F1eUsMM4MXFI/XdX80b9fxVEVJz5SEV0fvMT0aJayt3Eu3LE0sznCb9+Z/iaQcbJO
 lp5bFdfe4QEYxxvE2+bfH64ESRI2uNfzrBjfk8LHzuIRYKZMamm5XCG7AklYvjFnj8aqqYhKgbT
 Mk5AFHNq0BtyDGnchmw==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59ec53 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qRxF3_AoLalPgMY6OWsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170087

On 7/17/26 6:03 AM, Imran Shaik wrote:
> Add support for additional GCC EMAC RGMII clock frequencies (2.5MHz and
> 25MHz) required for the EMAC use-cases on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

It'd be useful to mention that they're necessary for 10M and 100M
speeds respectively

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

