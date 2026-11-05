Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868736;
	b=bw85+Um2DmpMvpZne9gpdVDRJ6tDO0X1Dy3gWsxOBg8Mn3NCO/FMwf/hQdDFv1oaHcfj
	 dHzns7nFRh9JeNCamLV1DbJJVQYAYAEsKWUEeyCPT3RbCvB/C5FjZS5AkqT2S8/cwJoOj
	 jrEfGQagoi6vlFpRlq64KqG4YIqmlPNxSkWSdi6QegA/z9YK5ydBdWzGYNYiBBUpemi0j
	 LWBByy5jL1k5Re6gKJ/Ur3CTGeaYhLVRq3buhx2UpYYVEfPja1EBWRx7d6uPEvJutv7oF
	 EIxORMLbga7DM8VDoVCl94/POVBB9/eOD3t1ztlGOvQ2FjBMx8Ygoe0EXtrXhmCsZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
	b=Y6QVOw4Q9mmSjiEv6T5U99SKL40/iAB6DrMd0tUb/i/kjHxjx6eGOiZwTSfHKr0FemIO
	 AbKhcSB8yjuudt+OMG3LNFpYlElhR/x5WqvPDQhG3BGdRyypMmwygMPrxI6emQ9Eu6mhV
	 9BDhhmQ5CHIzK7KTDI6l5sheWTcS1ajvWkZHGghaWXJXevn5jL8JrDXt46aLCT1BdD/oZ
	 K1coxvbr2CNwnxNnTEbmzFKi7gdIg0cL85oLsrju37qdc1Ps8QF/wiE0UYQeVa8vSP3la
	 Rfp/6Eu0kbBr4XxuNKq/Dfs2mHcdRjSnzo93B61HrMJjV8zoNZsLxixd3IKRpP3762A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTTlNXt3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A639606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A639606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duwbX2bq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FTTlNXt3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UDkE942036
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKMn93+Pdz1KflYpYZRmRShK
	dt6jXJBXPqsYlhldJHo=; b=duwbX2bqOb9603Ifb7XUTLPi79mBxD4P0AtDZQ/1
	k0SSLKBI05dxW5jcl2W9mROYKSNb12hR0aBBCDqIwRid/j7koacWsDufQHr2wHwl
	tb51kDKeRvVlMwr0fLkR8i19Fp9jwaATCbr+Xz9cS8e2CAZRwpwiyBtKEr9bBMTQ
	aYRaXT/V1l4WnrPLESMwRSCzMxbloDMjhItFQi83sb6d6NrkCcqh+CU01pu5NMGn
	XrJxy28HLL6gAA88R0q4eXGg6ofUBwG92fw+ef/Foo6tCQBrhQBv6aFZ6/KW0/z7
	cjpmS9P8DunvZcMZ+E086ULDnmonWlYefxRgRtGz8UuE3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj43d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:52:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so382418285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868734; x=1794473534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=FTTlNXt3EA4SB69KeecpahEf+Zdn9siIxxQJRA4t1HW2rb6TRv/p6FwEsqMOCmfxtm
         r0oZZ+C5PwwrOInrNv6qKm5Vh7O0cPyR7G+noIM142vYH1Ce/MVWh9ou3W8RlFI3Ou81
         iq3ETky2FC/XUQk0nPBK/gFEye8PNRu5wMstYsH7oq2ATymWhC+CeQ3uDRd/VpDT5FQR
         RA4OWWu52NTq9416WhkSYssNr5sCZxMMRuxF3SYoDnPP7gIjs286kj+76PSf+2TvS7fr
         G/fFdtm8/wnBwL6UJjStql4Lqn8tK/P3DMcrJwo8bO5RzUGS5mtoRZ04EymD43mn9lip
         w9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868734; x=1794473534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKMn93+Pdz1KflYpYZRmRShKdt6jXJBXPqsYlhldJHo=;
        b=v6/2N6h0OCkJJ23/reFWJ0CETrmpzN+olg5dEGuydPUU3VAtTdG396c/3htina5del
         hB377Cct55prmDQXRjNWTR0BxivvJXsXsH3l0KUUXnsLNQHq8fAfidd49W2xM3JEJsfn
         c5DsISjmLpcagJsJTYjfaCAUgKONdK4uwKsDlImoi3FgkvnfIhEQ5peSaNO5eeGawlNG
         Bh9hPkQy+3R1NjPzbn/7+r1maP0pj2eDmLF5MaXqU6pualU4IAvtWPlkb7j8q77erSuW
         /fOXeDzGHsO5jScP+jtF9sGtSQk/aApL4eY/son9IOaWaTjTm3jts+ZhzwvEyT7IT+Oo
         u5uQ==
X-Forwarded-Encrypted: i=1; AKwUvByU+yT1abdsMHfzbz7V7w/Cfo8auJDNUJIo0oXEnuHi4tzB9lZ9xWrVo3mkc8r0O6Vom+k6iOOXKVGRFasC@vger.kernel.org
X-Gm-Message-State: APuU4Z/yw9ItSNBuEhSeSJciZlCac1LQL2RZ6uf+8mzxhagei36X7A2k
	Kl/FSd4kZtJluwmOjLWtPhO0NNs/Are5X3ywLIGVTVK2XuKf5LgqHU6d4AaBSORqkpaUzU6h4Er
	klUzdo/TtyluDj8s52MrD1icxjduyFCQdSkOhlNeuJQ9MfBykZoBBIb1LaWdfXWR58v4m
X-Gm-Gg: AYBFou3irIaUITYJwwxyveSA2B5skrRT1WRtEWfZ4PudAo8KLIivIkYlgiJrn7FCYEu
	7HUJs6gfjZA8LGJSte8v/zwAuectOVwVct5myvE4gX2NaR126gw4f+hk2ZaYH3YmA42IN1/Fp90
	0Q9O7zO0mk6ZEscoRPwMVto4FITPnLZnJQEQ87BTgf4CtTj6TWEX5URaXsMr2hOQKabwkcEFVT0
	GfOY3Fkzk9tpu5rLd80tsXP1Ghh3GgKsaY2xHq9X3S0bIXFII7k3shmQabGb8bXakRGa/Y4cqhb
	AiPCkvYyjG8CUWAlnCuuIsHdxs6T2yCuXHn0fLoD3vSpQx6QHuz4nc+jg/Mn2d4ZRH0Hg/Ssj2c
	y6vnw4Wz9l3SZOizpoVDgaS3COh+CvzGvjHMNBqKz7WVDCMxm3QevxtGIo+cgz6M=
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865813885a.11.1793868734288;
        Thu, 05 Nov 2026 00:52:14 -0800 (PST)
X-Received: by 2002:a05:620a:84c7:b0:939:f978:c1aa with SMTP id af79cd13be357-94421581759mr2865810485a.11.1793868733609;
        Thu, 05 Nov 2026 00:52:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58243895e9.8.2026.11.05.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:12 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mark Brown <broonie@kernel.org>, Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] soc: qcom: apr: Reject packets with header size
 larger than packet size
Message-ID: <diddapoxu3cgqkuldldmlbnlmlt3dpin3563rhrie5gyvg74jo@ip7omguafebh>
References: <20261101190733.121473-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101190733.121473-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+avTBWTZr7Gu
 ViuqL4inYmrEWa+GnJwD3D+WIxpvlkfi8Rn36DyoOcT9xKsYMR4j2rPjUN0yPTOuWQZRGYqVZN7
 dQCsdaWkVCoaig1//jblwMjAshzyumlJci2USDw2H3edYr+IoYy8i4CWkl4w7P79rYSNmBSDvla
 BG/xqvIckPC0GZzag3r5DyjOo20mn+GIJwJec+iDDHszY3ouA5iLHr35WfaDA2hWUIZh93hSI/+
 rKUr+8zVZESxmap2SENIfxUUZuZkoor42cw0CQKHLyKDb7VtJzfpZ56VdS24KOD77c/xQ5cBi+J
 +34dljh44tGNZti6FCYdAKNB2fN+rTaBJbGSNAiH4wjad5dWyBn2zlwjoNuHwq7iRj5BF5oFeDR
 6/9xpu89kqUbcoGKZiPQBX9bfxP9GSQZjf4ldfOAUAbwr1hEPDC1IDvdKIktSyoOVj2cow/RRSa
 XzOwQNim11KGZMpGKiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+02J/tKCg91O
 smAmBzoUnXJjECmeVfFRMf07wvfsjd8pz9qxG3MGBClbg57KOQP1nxo1mJR8JD8gG3IEmbi/CB4
 Ff2zlqANpa6UVFOjHZSyvwAU4Kbe/9M=
X-Proofpoint-ORIG-GUID: Txocp8dN_A0BrDJVhDNdadgCGU-f2yP8
X-Proofpoint-GUID: Txocp8dN_A0BrDJVhDNdadgCGU-f2yP8
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec43bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 26-11-01 20:07:35, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
