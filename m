Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781763;
	b=zaG15zb/cSrYxQgTKGfh797x+FQODUwyQVdJcY48oRYWO+q9anqJMPqZ6TLAAxkFBUHp
	 f8M9nN8owoGRGDsHRDDHrR8m4UoaaJZk0JJtzYhVEcFkqzOlKaxUbkF7/UjZqYwFr/UfM
	 rsgZYgNf7RjyLQqALsUMHEUPZOt6vkvYkGpUl46lAchMIfNDodCGEGgG4x/2NbZO9v3qD
	 SWHTYfSsLHQH0xw5VLNwTYi59D3/khf/KO+cXnCrlSYGoyGMak4OyeRijbzkN4Dat/HeF
	 AKi0DyuCM2f1gKIcmo18FTpfZecSIun0C5DDo2kOJWX+DZ9rfgn7+5F5vQVawIkrO8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
	b=1dD1KtjGcKMFfphf38XZX6oJjsQ6Hij78ZeDgc6XIaupCtaSNPsLxUViCdfb8qt/kQzc
	 pVEM1dn9KMXeVqRXMRiNSjPmUT6yf3MEySMSWO12FD/aX+7ynA4hWTh/OwgwtVFT9Vpfd
	 kbALCYQhOaABTCPgLuLCsc2NSaxoeeTESR7xZppiDT0IA4a9W/b2ef0f3cy9VEO6SgQ73
	 /OgEOvcZM0GRLRDd86G/bMf7GsSobZhK8wR3RDY3xymHIRC4atcxTSKtgjjMJcRpxCOQE
	 +qvwnh5GI7vJhJJxzIu59BGaGZfLfPokPMTLQ9Z4Jem+WrUrqPGBQp4Xw3+lopylcmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD677606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD677606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQWXj3vO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Er7oO4ag
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KYEN1874498
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lw46wr8RFUM11VZcrvo7hsTL
	HohV5xgIubBnDb9dNrg=; b=SQWXj3vOGaHUs3E1t1LtdfjT+Y+Vht8IOWIFNZro
	jIpCRcWR8St+vS2G37ggadoOdAHaTjjRNmG8Yp0A5xXmtV2UGGAGSlQK/uPLJDJx
	jrbpNgKwG6MecFYB78dPvarClx9SRaE56QTarE/i2zsaV+ZIOed5Ctedc6V+5A3W
	Bsewwh0mQ0DAOkuptIhAPA+7YxpGKpM3qm32gTJytzNyLE93w9NVqXt+3uppsCmw
	grq2hm982V0Bjimen7U4QjogHUx6q5BsN+JekISDQx7mnl/IZhsEZP7rlHLOuhRm
	VwQVzaN6or/UwGVgKFNKFN7fQeFHgsHtpBXGhCnVS4h0Qg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mtx9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:42:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea381ce04fso6235285ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781761; x=1794386561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=Er7oO4ag+ib81plkmsMXyJwxF76TMTKCmGDg1761CBbWdds4jxmNZKdzvy8czEaJzg
         hdPP/CPA0X5bBpkmtFfKWbrcoUV+PQBBuACnO+O2R4SnYWKQENWeOuG54fEIOc20oMPU
         e5ktAQfLVL7m9LohxI0aEGoefTnVfxxJBzvlN1qN4LIbyz1Z8Shuta15Fd2IUUb/HRtY
         kfQt8qT/Q0Io/J6kv3ICYG7YT0WRIng0RqyihkwbBXpeo6IXmBEIGN7E+Uet5ncVkG38
         9NgfIJk12NLo7U7nrLaAqA/CXExUPNucBdjumTcl8VtfPKHCcVrtqIzS23PYzWpVz04B
         SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781761; x=1794386561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lw46wr8RFUM11VZcrvo7hsTLHohV5xgIubBnDb9dNrg=;
        b=D6mvFgjy6DEex+T+n+Pqj8tXkB8DRB/v/jU2RP/+0Nf/JU7kNaNZChySSbh21wSsOU
         0q9XLezhiMeJ112eujOYWR3+Q9ahyaEpSDoRoV/dZEkQQLw357gxycHCGRTcz4y9X5d/
         /8GkOKtfu+JcpQhtSiSgL9xM7L/RmcQ/CLg8tqHnt5bJSKedOG+EMUMlFd6SUDxU1xlF
         YTKkjUhkPBKx/VEcW75k0FeDhjxaI2DRtPIIDxqm7EMudH5aLKER7Eh58p/3nt358vD5
         +Ey7xIy3lGbXngtborTsAaFSHIjigN9BMNWlh9s080Kb8ndl2AovhfQLraufYYWM0D+k
         /i0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNX5NvdKS98wYQmKfN1i4osoFVMVSKH5l4Fmmpg0UT5ubuEIEwaBB8+6wxFD+cQlZ7olPS8GhjJz4sLaHk@vger.kernel.org
X-Gm-Message-State: APuU4Z+EgXjnkD7bnPtqq/aNnDk5PzaSWZV9BVGVbGNA9K2Snz9sOZQM
	bYLYYJh3bkQ2H2XE89cEKLVoA4OEun5bFS/ZnXPE03r6K6tWYcqyFM2uR/WgGrWoS2EMvSkU1tl
	t/kcJ3eWQ2x/wewj6oW9qigbchgFopYTYiDjVY5G9KH6MMGShV8hbhvvlbKESdDPefJpR
X-Gm-Gg: AYBFou0p5SvuxbObVZA4Jpzd9uJPAVJchXEhUpIf1ktUz1az6LHONEuwuMp4YXFHqfP
	n35CAk2Z07+bn3+Ms9/NCSNjKHu09a+rVGlrTA+kCKlqqS+s0zr54cyevy9toKEKDTh8tkPhtZn
	PNImVisvIAfo1sRiOfP7IiMraIw4dTikV2h2z11f2EPHVHbmkcgCjlMo2Q2axKwQUgyrB7PIMkM
	1ZWLiAzL400z5++uAqDMarlpgwspaaeRY0a2WZUiMMts7n2anG4zOPXUQ0istDNsaYgKIiQnqO5
	BlZY3wown0aTxSgmcOC6M9GdoXbtFAxJIuEztqH7eOJ78NSOq4YpNe7X6UCmlh4jBaH/O3qylPK
	6IdDBPdlj+33u4LAehNeY1/I8o/wD9r2bJ6Q5pvjfBZ6LDdQz5kxaFkQcYIrrdjI3fcfcAA1VKt
	0FstU/11Khile9Qw==
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805705ad.12.1793781760772;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
X-Received: by 2002:a17:903:124a:b0:2ea:238c:4d04 with SMTP id d9443c01a7336-2eb364953c5mr105805465ad.12.1793781760280;
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed183dcf6csm126245ad.38.2026.11.04.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:42:40 -0800 (PST)
Date: Wed, 4 Nov 2026 16:42:34 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
Message-ID: <aurv-mqf4MJEiuF1@QCOM-aGQu4IUr3Y>
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
 <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
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
In-Reply-To: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
X-Proofpoint-GUID: 3lZdKUktJ8UjefwVKR3l2jym43jtqDD-
X-Proofpoint-ORIG-GUID: 3lZdKUktJ8UjefwVKR3l2jym43jtqDD-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXzFfsAL22f954
 4RFkY/uEloHTjXhcS4kOqz51tRmVBuVE8bD9oRQHrkb9gTTI+E2jJuyGli3QKdL3BRQ9h7GMwmd
 yaWfEtD7yUW3CD7ZZPgwfo7Zrlb10qtP1FM6KNpecAIrPPmbGR013Ujt/G/BXhbaCjo71SulAjQ
 GmOLzLYzE+vWsaC883pESEu0I9uz0exkuzvJrt0xt6/tvt5hY6qEWFHTJ7sR1Qa0swG5j9RTmt8
 /SM4DipHyyf7+VpxyqHs3UZpVhbAmk14du6dEzCD9FKUA2zXjuJsWbFHjzgvFTcHCNyjnY7vO3O
 SDjZ6EOIMhE6yzDL+lxB+E2fNePH5UZ1JoLXdnwdA+KPYjdFLVwc1+qIlWgZ5zzOJlqOqjqCwQE
 y7ST5iflN2DUXs66ZuFW5NL1pTVI3Q9rva7j9ozUkQM7pH4cZ3g+kwS54paeaZyhO9vmNWLUM/c
 mxXyl+McT4yjeElagpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfXzIZquR+C/ljH
 k+pWopOgSraTaaVEEgxnIucYOeeMcpfhRMwkrxtvIcfJdW6qCgx3g6URMIcX7KJIlsVvbvbr8WD
 fZ+WMHJgRrRrXPboujGi0xprvey6eY8=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeaf001 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KAsKvIRJHMjLmqjOIagA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On Wed, Nov 04, 2026 at 09:04:33AM +0100, Konrad Dybcio wrote:
> On 11/4/26 8:59 AM, Shawn Guo wrote:
> > On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
> >> On 11/1/26 9:04 AM, Shawn Guo wrote:
> >>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>>
> >>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
> >>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
> >>> and DMA queues.
> >>>
> >>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +	phys = <&serdes0>;
> >>> +	phy-names = "serdes";
> >>
> >> I believe this holds for both GearVM and embedded, so you can move
> >> it to the common DTSI
> > 
> > No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> > server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> > PLL/RX/TX programming driven by an SCMI perf domain whose level is
> > the link speed.
> 
> Right, but I meant the assignment to the EMACs specifically

The EMAC0/SerDes0 and EMAC1/SerDes1 pairing is indeed the same on both
variants. But the serdes nodes only exist in nord-embedded.dtsi, since
GearVM doesn't expose the PHY to Linux. Or am I missing your point
completely?

Shawn
