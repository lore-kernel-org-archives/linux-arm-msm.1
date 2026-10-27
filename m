Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100203;
	b=q2kxlk6R4HKuMhMHGasbjdH80LP19Ek/IePMDEKFIqJxhN6fdNQviYJ2TOQeBLNHXd6v
	 ms2vvxkkxDZAhz4HvMtrwQObo90mbBVTO6i2uh2W8hOv/km8S19fbzCUu9LbCrRAo6wtj
	 nqiLKqIcSCWKiYyBhOnD5ZQScS01i7T6a7FWBAKzinbnFJscdUNsyKBkROFD6nEv8Vykh
	 uBJL9oKBqfhuyWnMTCehV2FJl1GL/8E7e/VVIORvQ2ukGn/Ej1IG+gTFBbWzUPI3+Mijg
	 emBt7M2mt4PGguPwoF9BwkKw+g83L8jSjHMk2Q/zpAZhNG4hcx236alD3TRLY+1FC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
	b=Ha3HgaIpGMVLqmDQimcDzZqKvZN+xVap3qWu2rNeCnTy//HNcNyx9lrAOIioWaAPzA5U
	 OIqF9uZQtZ6czIxD5vPLzhKnQxJLyhZ4G+Q7cv8OKOTGZANKwJrfUe9vjOnwlaohn5hjc
	 7KbD7IJwglDZbWI/u3hdT2XD7Sx4mf70xt/ZZEDYAznHlyGfQZeXUbKVqOJQZhl4jDbRe
	 zzwkjHQJ2A01p/d3Bih1D5PvWqlC8Wc7avrs/cUto5EHDyRFOkuEo9lxucHdsKdamUA3k
	 0tbTdN+vVHm5Qty2tbJUiaduFzEJ3fBWLDuwy74QegNHtpqhjs/oEleinImo/p2xgJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD0B606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD0B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D0SkzBCp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKM+lQbB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeJsN1427416
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LCLGT3dGFbYN1moOX5comzCH
	ld4bgy4ncy8r17Egy90=; b=D0SkzBCpnj/p7gIAvgZJWNa4gx96i7m/IaIl34+6
	nDvIVb8O3g28rqcitQCqrjNmvK59YLW3XT+Ivs5gdufNBdyPjIY5MabwR0Aq6PD6
	holb2bkwxif4Dd9qfkphphkYORji9BV0SqQtgsHLXMWe4Phrva4ojg/8F3ID5ix/
	cBm/7O3asPnPiSK8qlzi8ieX40a8E3hbbePq2dmSqKipyetD626oUAQVZlkDSSqh
	JHTwN/1R5LsSS+KViD//rA4rNxhY2QkuUlVlPiysTD23Ht8X5nGRuXJMXvV684aR
	LsM0yBjh5rQvV8LJCMTky6aUAwMuFiLr07/1CARLgyfXww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmbamh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:23:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so741558385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100201; x=1793705001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=JKM+lQbBCMimTyITmAUUODC+CuPTHnQv4ze7SP1UbEt0dzJHp6UquHwCaxDeAuI8TE
         VMiIxphUvpTsbfQBXrh4I+xFpKwxgOl4ZniJ4hYQt6AaTqijDIsp142mjbVtwZSYTnEP
         AZyDtDg5Z4YWuhpbnGpxB5okhnoVqvUs/DlQhL8iD1qmJZ+ka5VoJzOUQ1eNEA4b5SMK
         t3sfownP24/dID9mOn73avgDWSsKhMS3aJATmb1vycdO5QCC4/ZMwK29b/BlgOmCbKas
         lmnOdbR1O4rUJsbOSedQSRlnn+0upLOHMzl1tqV8A6tL1+lcfqH/4/6xLGqN5KSuPHX3
         SSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100201; x=1793705001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCLGT3dGFbYN1moOX5comzCHld4bgy4ncy8r17Egy90=;
        b=WTMWB4nnu9EN87kq8TVOB4LW+5Dfa/01QVhUfB2HF5lAvFyiHhRT+gjNOwXcavgxZQ
         s6wWQOfEgGpUi02H5L9tj/ZAy09u35XNXWY6WnN5DlSSHDTWEIxcxiuMx5AiU2g2LOZR
         0s3yLSrWUDFH1ukZSnoXfZOI5sy+xd6GrbBoWVpu8HGLSZ4R4FGtiv4QXbfpLpqWcH/z
         XQ8+z8NuRtjQLmcljdXOaos1uZ39mjidxAH7et8f87URSNvp2N89ErdBjDSos0Emm0Ft
         4e6xDBAUj027KMH4C7D//jQ/6WbdwjvjpMYTK1D8jhmbxozlvywGL5VLv/9WkQutslig
         unPA==
X-Forwarded-Encrypted: i=1; AKwUvBwpOzLPRg6bvvKQV0rTOcyVtMCLWFhhhNMB7Oomio6XajfjPmvvR98nW+AHDePpSAfRnt+O6RZDcL51xENY@vger.kernel.org
X-Gm-Message-State: AFq9FYKSV+97vujerSL9TANsT1wwX2Udg8x7U2TQKBi7y7+w4aiML76M
	ylZTlJAsxfumTP2PoFAJRbATjdVWnZUdmORz2W+TwjHNnuwapIUkTWvqR6GQlZ/7VcqV09o9tW2
	psw1E1c5KhH31H/keadablamhNSvpCE/VLjwwj64DJ2gPELYJQa2IEYxNeqhyMLvjGO2t
X-Gm-Gg: AYBFou2MqIqNsfuqi0ubPXhDtcSYYYsOO6QuAYseKVKwKsDO6pXQvkTddtULPDCzGgw
	8axvcrsqcz5OTQJs90Fsidjzn8Ouz1bBiCf69TLc+B1b7/sN+r8NWn+NmDhdssSz10VsqIDCdwL
	+3s8cp4NjvpU33UiphLAKF911zjBldBx5NAuZcf822mxU/lGJw4kpWP67l1BTwGQaf8vRBS37oa
	b1HoMPJcxXgVyXmbZfRcLLmwKb6GqRxVKiJjG2yXW2uRCIfmB89UQGNKy23JjwtkNOXAr1BNkCJ
	k7u2NoBYHPHbgXYzj0/rhaRxpJOsVGT3fhKqbkp8svE3MvEySPG8owCfb5sDi9ZX302edFNccGc
	AlsoYzGyS7/O9AASC50NiIHs2BVhjC2XkxGqrrO7lof0uSN7RrAw1SI3zgu3mqNIDiQ==
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437221085a.11.1793100200680;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:914:afc1:c66d with SMTP id af79cd13be357-940ef7b5363mr1437216385a.11.1793100200094;
        Tue, 27 Oct 2026 04:23:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm175048735e9.0.2026.10.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:23:18 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:23:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Robert Marko <robimarko@gmail.com>
Cc: andersson@kernel.org, abelvesa@kernel.org, sboyd@kernel.org,
        bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Message-ID: <xzlcs4jdxvndta2lmbnofb4dvekkbea3gaodqxjomn6o7ibjif@lakwxrxx2is7>
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-4-robimarko@gmail.com>
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
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXzOGNyaxPiPRU
 82GYdkTvAEh2++zRlF8YBPUcWzAx140hXvsEDFs4kzy/tt204fuX2DsKykJgfHgB/FDsXKMyWwW
 XA0+1Ze4EtJk24dOj7vk1aCb33iFeYE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9eTxIoKlnR+g
 1KfjMk6HqT26Za4N4F4b4elFE1ccDZC68RRfDDPSuqTdUqqrPzVMGc/toJ5B54GlDWawu011J3W
 L+qajFKn6tcYBcUPt04eOhF+pkHbkM2UjidFB0m+U3aS56HYgRKTDXslU4FL1kvynTXJDoqQcdL
 ZL3jDDFmGtucjm20MLE/2cBMEKrsEaeRU0tt74tp7h9jzkWd3HHeiifHVH//b4PTbil4f0PGFPt
 JZNhTZ/lGpbDugXs4/RWXq3JOZu72yToy1vR31ucEYJudghb7C5AbhbVkPKzXJaC3l8XAJ67wNG
 nloLhvAf+JKQ/7SLjT+ipLDNTWrciTrhEcTjAdWxY2XhMGyZYyNKXuTZ+3hVsCP3MCWjC0/wDWz
 b/3EveS911EAUeGbkqXrcl0nwkYMHFMEulHw4wk/ijqVS1p5wY5GKwGvvvHpFSlSxP1/nZTzcQc
 pTQazGKWaUxkIQ9p0LQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae089a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=w-uRcYzalQcvdjeGYpgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jfhpfgUFdQtX3Kk-8smfs7zSYjE2eYJB
X-Proofpoint-GUID: jfhpfgUFdQtX3Kk-8smfs7zSYjE2eYJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

On 26-10-26 13:08:15, Robert Marko wrote:
> Add the CMN PLL node, it will be used to feed the required fixed clocks
> to networking subsystem.
> 
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
