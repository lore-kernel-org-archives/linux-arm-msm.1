Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670204;
	b=ROhjcEPCQEpHH+zMpBFPvLGSkr2VMSvVBd7lXBpRhFNm1pzcz0xkmxSEdvZtt6OOjoXt
	 ml2b0UbwZFqeFtITbsnr0exRVpKKRWKohADyhfw1v7MNe28A5pqZ+nkF9WHerXci3piHA
	 9+9a09JoZHnK6Y6IiiPXv215+5wmyPSm2QejKa4wuO68cFsZr5QbizB77Yuow4Scp9dCF
	 n+EJDNxbuyO48uLRtmB4NZWas+T4xQpjz8T/vSlNtD8cLWbb18+q0eLiFpgEczn5akIDN
	 EFwBMoEQ9ctqH7f7CV9ZHwJS5YaHonh5IHdInKs5FSS5UbgyEhgWvd2tMIYJveq4nrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
	b=Q+evzGydwnLbS/u0uLlv3Gj1WnyzL/dHOWF8Mo0/Be9CBn+Ew+CFR5QpqzG0aW5vDb9o
	 /r0LbMOEVEHyCnLUIoGqss+nrXzcZp3iZz/fFGOv6UHC/ZfDgzd2GCAT0w4MLVDRB0m24
	 9K2sU02v5ZgPyW5tmNNRFC4q0V9LRNj6VLmDken70ozEF5I2rZZR61q0RPHgdM4BPn37T
	 uoropPj9l+dRFRTZNx9URpXp4ccKM5HD1rqYYFxDeLd5fQalVZvKIdYy4dJdXH9qtn0g+
	 A0yFNyzCjhAcWDStz+B2XGwjXxlSnUHVEuB8u+bGiSjWso8bW8G3MdJoG9JIm2FflhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKDUAsOm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IeduK5ZC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D480C606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D480C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKDUAsOm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IeduK5ZC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xlhI2573520
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=; b=pKDUAsOmRgKfxC20
	GXpJOf14EZJHKPSU1pXxDcd+/jf7vR5eHpqgbuAWt/kmQQdKj0EAXMuRKsqBg8f/
	f8kGC5KjBGLtFCGyEJwJFjAfhSxr/qzzov1Sy5AQnz/nGBqUFdArTtu/64B23leu
	EHea0Yi7uH7ZvbZslUM4JC6jS0u7zaNJsWrx38MqYrTUJKXo/58HNnfqTLc5Mztg
	k+iOqxYICk8kUyRHDvAPzwIPnYNMa6slFIkkCYb0omTzvxoP8+LCdWSJBmy15UCJ
	y/aycmC9fI85nIHPNFwW9tDWp85Og/dQsJru8UQWnnCjNxCXQXp/EhVzCTydKLg5
	pI/2LQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ak05j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:56:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so49559685a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792670202; x=1793275002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
        b=IeduK5ZCNoDsqa3A1TPv3k1hxDSTlB1KRzmHlWKFXF1KlV5aK7Q8ybEbX8VdaCJDNH
         Ma2cQR4lRuaDSyB3m04kltlT5X0xyUBWagB3FcYPOXr5yLLFYXKJikIQRQX1tXox6dJ2
         BRoOOqF6cy/DoNKw/lAvLhiIQDFrqnNHs6Vd3MbdGahtjIhAY3Hw3f/ZqmTU7877AtWo
         UsUG4qDXWOwzANeZfTAYpmjFYvvnucdpZ4ksGZmffF1uPta4zuOnSLipix9ucgkjBPwy
         LEkoumMWk/uvT1UX6Ro597nRdWCZdjoicp9vOVz0Q8WWh4t/X/NQt6iuJtxAJGOjwmtE
         iJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670202; x=1793275002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7MlXxQ9G55dinwaY7O9f6BqoWldfOEc0cObS2IweLw=;
        b=m0OiAsfDq7ndChz73P63pT8JVGP/oxfi3NFC950Q0+TfvrGV6zLh9S7BCic3EO49wn
         +gn6X240lrkvTm0oV74Z+/1kpgMcYisGxA3lmcfEhLkhnh3y5cWHzRzf+cGRpY2m+DX0
         iYZgAzCnzHrnPi8a5WX2JS3SRVqfKwzM0eC4Av9ciI96uRUNN+w7swezSapUvJLzqK0W
         X+Qj+ohMEmQ2eQB9R6MKHDPnE8TNuCSv1LeVme4u/pTaFmKmFvpDKYssSc7dHxqTxPvG
         dqeslVWhU/aWZI2pwoBr18eESlE0IhDv33sQ2ysBGPIYCqQYuyF5a4oQPNWaWHv6Z//v
         7vdA==
X-Gm-Message-State: AFq9FYLeMCXHYFCMnCvKJnMuBQwLNSIblG6o2qXk87TbRYkve0GTnR9N
	9NP1qL7vTYXZC2LJSbY/PN2ELm5qwpuX1n6KE0z3peHJiohhw4WIlP8T9J7GX/VwIisI2a1dzV/
	J9c7MTHRwFrZrPdfexkb/g8bREVdjghzs73FjnfSD3r8RZ98O9SABbv1sxIAH8wg+kzPRGqF7V6
	tl
X-Gm-Gg: AYBFou3iVZ6wgZpqVL35G5Eq4O4OQLmIoViXDEjEGYGSZBjrnYyUt3Mv77xsTxwSPQh
	yYsyImXN//A8fqozeRFF0IuSEJxQtnmTbQytlB8nPCA0N5iavtIxX4t6UHOhRY4vidEgp2B5O1R
	tEYAUwxMkMUOu1eABWrcmzSUZUa9QhnTk11DVp9qz6UOE5fkjTGw562BdaszKrAnfG2WV2rTgs7
	VEUBb7HafuiXn/7T1PEBsPOKOQG/Z2AJoOKbTBZOcfonI8hOIGVO9HErjf22LHKJ3au0eFGzzI+
	vVptCi2kOOgCrALBetGiwg/KiTwQvbbdNvQmxy5pw6iDxG91Up4v7v50ftVXsGjAXfvk6+PVbB4
	PqhFNtnGqW7OfYQBjS7n7PA==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1061699185a.1.1792670201947;
        Thu, 22 Oct 2026 04:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1061695485a.1.1792670201402;
        Thu, 22 Oct 2026 04:56:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm97381466b.65.2026.10.22.04.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:56:40 -0700 (PDT)
Message-ID: <c80eb036-f1ad-4376-b3f9-a97b685a0dca@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:56:32 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        redstonee <1516235445@qq.com>, ShiTou Hong <dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ba75Zjraf5-sFN2b51JDmU2T7lnDV6yK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX0lY21KPUgmwj
 TUDMlmU5FDo0un2jIcu0JT3+6VWhtEvNBKvKNUDRXndiHMSVySObQfyqGYRttXmr9lggVBgC+sL
 KoosQxNQCYpoWnCDPx/BoKISrh6kAsU=
X-Proofpoint-ORIG-GUID: ba75Zjraf5-sFN2b51JDmU2T7lnDV6yK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NyBTYWx0ZWRfX04I6ibF0KC+a
 YabyV7Xgj8lKzqx3V/RZg2MhHv6jFVHv1ph7/phAoZ3E7IHFPeGh3k6WZu6fWa8CVVDM+b5sBGu
 5mwL5Fq3KY+XTIeUOqfQ+jXhjZDQnVxSbzPKpPMwAxCtf0JC5SdLy15g8hDPkCoSCmQRpu7XtAC
 R2sN7BDRydwFFoIAiuqCEpVvUGEjLfSBYOQK6jAtEDwaYM/tW6HHAKSmjZEjf+cB+FDCoK/jhO0
 JrX6r3ldmGRF/J3+vSBvggDC98oYDNJDIpPX2y5qiFqZMP3Z4njThw+GV7LbBD9x9GtqJ+hCsGC
 V1FGvzgP11EQDi3x/+Utfmo4fNDzkJgTSU4+gtyUZ39+gIr5FporwqdGFqFcekN58sMbpjKCEHe
 u2AuCM39RazWcZQpq7cp2IKeoHJ8T/ywtNUu1X305uVuA6mVjc3FMWO+lDlCLp51JV0sjLuktKr
 GDy6YK9QxNzDyjJL8GQ==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9f9fa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=dZbOZ2KzAAAA:8 a=UqCG9HQmAAAA:8 a=hwkVP9_vMjZBhFNB2jcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220047

On 10/22/26 1:35 PM, ShiTou Hong wrote:
> From: redstonee <1516235445@qq.com>
> 
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

Please fix up your git identity, I'm assuming the author is you,
but we need that to be sure.

Please also write some commit messages - see

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Konrad
