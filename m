Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261194;
	b=x7WLr5Q+1KsLEj0oh43xZxNd4uIwl5qeDyxSr3K0SrMjuYhs6BFpEmZnFOJT0vgqzILj
	 w3WEtaHM6QP50wSE1onWYoNTFr+aDCjxTWAFyjoySP14mNk/Ne9fU5Ciw+JRKsXrcTvWB
	 l4OaCpnrOfB4vg7GSR2iWFWStKXdDoXykc/etqmi4Hq/Tn2k+LjQsXH2xics1LVoV0kKq
	 qli3UNVFBX9u9wNXiBFoq6F8OzbbyU+0BefMQBlWLnjVlaX/FwAPn8JWsC1+aEGwx/dkm
	 x0Y/4GZTlAUkTB/PyDzZV7R6gx+B4Fnkkdl10LRLMWtrjnftN03ZFT/yYDlQHomiTLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
	b=WETIZhCPzQYw+OxuGqDFeNPxFcqXvIksRcbFFUiAIIAJnVZJQ/1ilrBXgaq9PYKr6caw
	 GH7aL/mc0C9kKc74toszDe4B4iwFrkptqNaSUXVe1MyTualwoeiY9nR/gpcJof+j/Qt0b
	 ILky4X0r6iscPwRcnTj7xsXaX8qgX0cYdnd6x9S5Zb84sVfeSHLU4lzYTyPBtXqJOaF2O
	 Ie2NFz1DM+NqA0VoI1FwriOBOQRA6ZIHdzVw8H8Rpj5YpfF/GFLIDyz4AITbcFXSLtFsS
	 WG+SDPgBL4Msv4CwWtLPJc8q8N2hhi9IVJ3ow1E7KqJuxteq8BY6lVRXIR2d0/dNv9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC2D606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC2D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oHi105vQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QhDuiqLS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Gqv53294103
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=; b=oHi105vQq5+kupfu
	nkq7DiBxKhWo3JDmC2j8eL7/8U+tz4p8Zw9W+sxL0IuzjHJ/0jZaAfZnKFTQ+B/c
	mZFBVpuxaKh8LVZaKjauwNrJyHs1sZG/VactDeU+xFAytxJOAOc19F5Ey17V4psq
	NEdcnixVx3y+XrZOhZnb3WhEO++31f/W+7h8rty2tzbQFPFWIv2cQUbOf6XiPPia
	4fJjCIsHFx1lfPOqqcnaFEycKMMkr4cp3S8ZWuSXvvCg+Mm18UAqA6WAXcuPawUO
	F/CIry2q5OWq12oAS5gHui+W3WMTONQIIQ86q0krZ0dFRtcb13sFE2YBSvUmqR5D
	xF6dow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrs2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 08:06:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso42229785a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261192; x=1793865992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=QhDuiqLSfXhXHNRwQhFoxjcmAPzJqb0vMmDNNFHdxCLXdJ4kR1mJi9roZo5ii1rJgh
         3rKAiCFZh8TVM/bID49J4pOLZCBjq/LvqxkThAS9/3el75Scc4TFtj1NdvKWoC0uJ1yv
         mkblcpoVwSs44fDG/6oBTGCnM0PnJ/N7AO52MowL0n6jeFQ1dD6LmuvXTZwMgM+SKVmq
         phvEmRHa0CqVKQIddING31lOy74Nr4jUckYNj0jhUqfRraF9ehCRAD8SRvKTvjr3KSa7
         h6WhrF06eq4JiAljJMC2pL4gj+AyOyBc0rcQ+uB2r1RGXYncsI1BYloOC8mNzqXA6Asf
         Aj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261192; x=1793865992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8DFKSCsdHugXNIGpAF5J7g+hIg6cjluBUQHPY3ZgJA=;
        b=tIVaXovymhsCFsQLqr8qprLtc2JTajR77VIyG0DTN39dx65hTVSN/XMLCGAJYVAzVZ
         ktJeXmSwFld4wKi6ISDBwx0kEMCzy2lIAmhsG2jimG0U7byll4KWxvXD072yrblQO+2r
         KuQfNZvEmi6q9Yq1avpg7lUPo8ZBch0zyIiDco9dk1liPGZbdVx3z43vKm1lhubbQ4rX
         smm5Iv3nSVQ3v+NnyNw/pBQSBTAWs5r6CADCr0WqdgxufTfHnDTF/gv6jvwt3LMs//Qm
         Ln3gCHiYW0CH4QWcMyLS0YB0FOpUUAELtGOsSmzRu5zVQ6gPWZhxEvLbFXvmTSJ3IgT7
         7pKw==
X-Forwarded-Encrypted: i=1; AKwUvBy2Aj3YT77+LoJI5XBEOmk7OyqW9L7n+Gom48Ney0GX0dXLL1lmolqOBtoNhb1EOg3xckCpcCXrkBa9yUs8@vger.kernel.org
X-Gm-Message-State: AFq9FYI/ns6dTisKjDAZgIeDa9d9HciBxYbvGSnbgBFeoSxnwpfJklnw
	DXsTzuwgXUC4s7QOtry+P0KddNx7fTsNJl3bwzftBleeS5BPFX5qyNg73QOUoyeS75tZYHZwIa5
	eQNjj9qxsb+WlXcgebV6h00f5Cl7iJxKcWhoButpQgNBmj7ufepXAn+cGRNS4m56s1Tft
X-Gm-Gg: AYBFou0FE5Aoiu4X+p0hKlK/PbAOo2DrBi0oeCJ6CXMrbjqUYA4E6tSUDbK/dtF6ell
	oRneivDTV6G8FbiWoMO1rC7+i08OzjWmrDXD7I4XgHBEzNitzJBnC1bGdvdaSxyLxJq0uDUHAT8
	w8qLDhKwCRKWHMmklbWxNbi16d5GLdWKlBMxYvDrIWCiGFCufdRrxTlLLbJRAfK3NcyVcVs9pwV
	6/+0IBCtAx59ahLXghAKpDm1vU7AuvD8llIdXNHBuvgisGX/eN5uHd+6OSzt3zENg3Cxz8jPC5/
	ThnoobjrUaSIM/bF/jze4614rbHiBpQ9NoW2iqmEJ9z5SNALZXBYDsCGiDPcKyVQ7T2EPh2lz0c
	vRVa66cRQcwc6gAHX1nt+5P5CQL9Rajy6Rq85jODbIGIbXzYJXOLmbXMsdiobUP/TD0t3MUc=
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784405085a.6.1793261192089;
        Thu, 29 Oct 2026 01:06:32 -0700 (PDT)
X-Received: by 2002:a05:620a:3bc9:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-94408d42cd1mr784402285a.6.1793261191683;
        Thu, 29 Oct 2026 01:06:31 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49644e029sm2428460a12.35.2026.10.29.01.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:06:30 -0700 (PDT)
Message-ID: <ca9f3883-247f-4cdd-a30d-847b0c3f5433@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:06:27 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add
 vibrator support
To: Gergo Koteles <soyer@irl.hu>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793218514.git.soyer@irl.hu>
 <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <89f7e6e9988c8744be37093777b0bc065a0e2ab8.1793218514.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JySQ515VtNm-QswFtFViSAOP_NUgoRKm
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae2fe88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6KvQjkKwYJz4M-1xzI4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX7JhpN/PNUtzf
 b2e5JvwETiKpSMrFrYPIG3/MpkYvetGLSEkmIeL1lLhuHGEV+V3vW7L5MF8CgSY2BmmJvGZVJ0e
 P2//hlkevZn6BgH6OL5AP1zPG53Idiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX5Jr/G4HLSgYb
 2GQhPY0CiguLXy2i+TuMXneUhmFK46Vs/NQqlcHryccnOMVOv5g4SHI3qGkDZqQzz8oOuFF7mtv
 FvVj3cVpIXCZ0wG+W9SyEdE5P78bMaSd89bMweZ8TocK0Z154zXj/DmPBAsyYVOiEOu+z4836il
 DRg0kk45TYZ6LsNgFpA4QxrsLJMcgLz64Od8aAufCmchLMscwoOiFSbMbw2lOSfETPeV3hzFGcC
 A9Yb7yfsy+Fy9H+2rmE6maE6XknhcTT0Ri1k9PvYzP94t0DgkdufyhYFBnAKcQTHMQ6ZphJrVxu
 tZyYaLDovm7n2vbFnDzV6nbFikHxifB7p6Xw7ZrI7GgCxFoBVGIDwL2SjMihVc4FyHGvG/yiIOM
 WQCd1bDr+PjEqaKnJdQFJRsLZ7dGsVTYjSVfKLPfOUcy2BedadLkIRB0eDuMI9rXMhNM6+Aq2JL
 LhylRye/8Rp8s7ud16g==
X-Proofpoint-ORIG-GUID: JySQ515VtNm-QswFtFViSAOP_NUgoRKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/28/26 9:37 PM, Gergo Koteles wrote:
> Add the required node for haptic playback (Awinic AW86224).
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
> Changes in v2:
>  - rebased on mainline (Krzysztof)
>  - order by address (Konrad)
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
