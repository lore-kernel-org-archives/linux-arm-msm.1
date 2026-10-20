Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504747;
	b=L2ThSoxcgCPcHby75DbSOAgH/dPMvGuCI91hF+DNfbPkmaBL0l3YXfl9JYIs5S2Kqqjb
	 +okmryQj6hBAcKnIVb1dxW2MW1CnDQJYIArxy6nhBal448JmJ1c6skRPsyKcT1zhLg3GI
	 uCdQbcKaRMCm2ugKQFr3n99TfE6HbnbGNa58oCdkczOpjzrgOwILWhHHdzWKrKfAVc6Cb
	 ei8MxKB3b5YUVlHy87Cj+gCSxwv2sfbb2hQyiDqtYGMEuYptI4mQYNe5WO7C6SeeBScU6
	 2Wj0vPOqNo3cYJr3kY429fWFpjJyx7Bs5kwTefnPv0PuTkZWrbSWExKT5ZW+V95pfqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
	b=ZsdGoSeMbpQm1m4sf6B74VBl8Gl8MOueU2WpHtTFRvdr2cxpdhpjyWsMNSlCN5EVMF4n
	 trU9WSeCGjBJXnVUL4FcI12/nzGPppCCr/ubfczzQYkoFFiZQIyW/EEpIxzlCMD2UCQ/d
	 EfBwuKE0YTVlLjTTHz0TYSyUDU5eiCroDjccxa29g6bB+vPpjJCzD2Iin8mxjk/t28mqp
	 toPPSXdBX8xsuVWwIq0bMHqh4pZUjwluNTExJXb9drrXSVRkZTUWbOjfTOSPTVz2R3qO0
	 uZuJxLUggLvrPEiJSf1ibFN3q6jx5rlA7Os24uNCx375xLUghm7ufkGOBg4Xfcv82RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmdtD6K6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755B606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E755B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmdtD6K6
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA4mL271996
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=; b=gpIwOsiVuQkaB0Mu
	bfmPS4Pk6svYoT7gmHD5CDnVqhURDasrAq2OZtnaWrFu19VosjQJT6syIKCdtOID
	UXSsMMUyQKtNo8JbQX1os39o1RQXoGru5sIKVw8ia4yRFb0a7ib2QOHaCV5awtT2
	xHgfBeq4QV0usI43rBKk5KhLTb7MO6Eax3zufuLgUqqaCSmKQ6zkHxfdx/qF4KGB
	fPfrWLqQxAi0fTtUlnK1MvezYxRdQxxZFSrfw+j2mlVJ6mkXm8FaifTKlsSpbSTC
	hlFjOhDySC38MRfMg5dkLZ2TDsRmZH5BofYAtDl751E6V7pOqCk40AC1/gKedSwT
	YSx2zQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8f8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc50fb0d2so79039885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504745; x=1793109545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=RmdtD6K6wwYm29bCrblsIYbs0Ghtz1ZzMBpM1YETt2J8gD2ZNYYRIWySEwvLU1+edb
         aQ81Uf58DVpaBsVaoXGfXKC8+b4GcarSbkWV9fn/fEFveeKzJozvGKwCrO2YG56J5R6M
         hTygB0sUZsJSPaFsYGLgjzGE9rd0Su7oh/k7KcwVQxNrdgrKYTAQexV8x1itGIetytos
         wduo21ffuVyW9AfVHQgDn9ZACoO6Bl/hjTBguMEujt09upOnarmJ/kDhU1aLchre11Os
         0rM/4w3Mp/5drNcoMOEo6Jy3jj5UHauOMfRTfBW5vcMYfUtgekx27bATW5GZtpEWUACp
         ZMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504745; x=1793109545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=aTYJkDyuCsQqdIIa0YwIbgzTX5RtBygQYwMBI8CywUy4XaSwT5RV/g1hTYZ5LiAGSn
         8uGahQJ4811aLaiPuSMUdRcZfITIQ1xdlLgyspWmTQ9qDPbTS3lD5RxQqPwjQGAjwija
         iPYUhE+Y1XRDZnqxJ7oFfFkMLl1j8XDbvzGCcSm+NAW/TxiPal1RVZXIx4BhQZBOw/Xq
         GLCSS4oN0kvelHZiO20Ni7Xn6x3Ztqg+8XpFnQ6sV6Uoj9O4ZiAf8IC2DnjOZWuC2sbB
         yeRZfAPnv1CTmMQT1pSTSch8AqSQcT269PRKvX3j95Y+i6OrraQlu7iv8fzluzxah2SC
         6XBg==
X-Gm-Message-State: AFq9FYLMk4t13iIw5NuKX51ncfn+jq6g6PBTy6Y5bC0QibfLCs7/avZv
	wfuBmw/IWIAy2fIIOxzsMiING2AitKJ8QoPnDZ/DVLj2Vy44qpf/1GHTdkV72GXZapa6iXizjdt
	AwvPoGhBH0/hdb4tCmVYvKQbAZffuM3svW7GSXG9wN3zIDgUyIc/CVm4AoJfSex1nkwt/
X-Gm-Gg: AYBFou1nARVPHeRbdHN0dRI3H4Lpt3riN0IdVegs89Is82S/f2J2KKNtOxgsleXIn3G
	5ItBxVXC88tpdZQiOXRUTU4gxupBSDSTpvpLJPIWXPfr7pBH8rdOyvP2qIey+SYdo81VluYjqpV
	wn2qbqT9B2tZn1pb0PGNdl9IascM7CrcHGhfAfL9wt+V8EM4Nyowc6VHz01yHgU6pWBt8Hpj8ll
	0ZpW5vFQ4fHYI7IFXK4wNwe9a5ZMN8zgdn3WwYmBQutZbjLb9rqw2EK2lgBSlxuTdxMfC22UT4y
	SwTg6sB5dKz1z8NpMUwnVLCjX8CALqv0iySdmfACiaJ5VyHz5EwyMlRBHXmEK3+unUzgrJOEbkH
	83eL8d4D9eZJzuvx8di3uvg==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095410985a.3.1792504745157;
        Tue, 20 Oct 2026 06:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095406585a.3.1792504744685;
        Tue, 20 Oct 2026 06:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm5010407a12.36.2026.10.20.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:01 +0200
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX27G24EWV1OiJ
 4umLwNrTgyDMAin+pnMHqqFqqMNgM1ACXFxo1evXa4yCvacfSrX7cKy1VUdoZ47ntZKBVo7BPkA
 RWDM/B+n00PYOzGXe0nwaE9uBY9LAfvZtrjHALd3vQwPL1BvyWi14hJdXIEinj7UVtYEfGY3+Eh
 LOdp3XXGSJLTCQQFY4Dc5vg35FflFuo1tJXg8XTK8+lqXYzEiA35bpXgoNXkY5lnwyi1fOpkjVk
 Wp7WOzZoSUMlCvl/2IlY6mhujcueGjf6GTIzeXYGevBmXNcKovZLinwMJ+3G0YXB0K2Aw3iW3i9
 jzovlNYV3ZfFcED2RMtsRq/5mWhVWxTAXweuoxK8OJoUL/V3tDgwtQQrC13BhTXdiCqdjQro0uh
 AWfk7nVJrKQDySbxI3xr7iPSY//OOqJ6F0zWtZRDq8GFsmqn+Q5V2c6eTWeKW+1HvO/qxQd/aUa
 kWpZrjjdsf+n+BHlAmQ==
X-Proofpoint-ORIG-GUID: 8cy9M2kQ-AuTSfEOCWHHHAuXjK_yIgZX
X-Proofpoint-GUID: 8cy9M2kQ-AuTSfEOCWHHHAuXjK_yIgZX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX/O8veV+fJHdI
 aUBsll8Re+DSLhynHyEM3JIHy+GA40oRBvvFDHYBNdWTsBcOjLfLYjg94m0iB6wasdg0TBf19ON
 4630x2xnMl4BjZR+4YXzwF0S5dGF2PY=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad773aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QZ93mQGBb8gi70IaLVcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;

nit: ideally <&foo>, <&bar> instead of <&foo &bar>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
