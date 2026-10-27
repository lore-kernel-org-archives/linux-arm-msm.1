Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100779;
	b=wSCZ3+TLQR/nydfcgoTVrLAxqArEh8AxnT9iYm9A/sg1XWq6e94LM2qqLo+AFJ+DgY8J
	 EjEF3AIhlQfCrWCGHhzfRSGcP+aQ3dUsbP0yo9MXEdOnrlqt1Vy+GLOHKaT5fbRfqyFey
	 mN+gRAJXUu/uI3Y0qm6nRD0sYx+Qsmdp38uPskCNGjy0b3E1QSVA0CsAecBQlJyq6l5Sx
	 8McEhmUPEFDB1o9tKvd8KHLu5vEeLSB/3eeN+QBbw7BZKlb4bpBZEsOenQvyhTqSWRRs7
	 x2O0H/cbo/mXFQ4nAeVz3trR3RbioXXRTIbrCA2bf+cbrrARAf/g0FgUiTkG6zOVZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100779;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
	b=lt76AaNJj6GA4XYUIzuLyJiDTCeECdZCCmfJgqE3Mkl2mkSgWjqUjQDVIN0bvQVN7RC2
	 m0LDZCbXWnvszpaLtNUV4mSMBME2TUrXqOwETRl0ldj9GD351BuqVDMTnGW+lLKC+z0ZZ
	 yF4Jt9nzUhlarCp+XvT8X7ODQgLJfKYnC5bWAjkDS39k0Ik9Ojy28GOjF+t6ijsBbzcHH
	 ZHrTy56xQIRVijdo6V1uo+m116HoBHRsprJCzWDX36zuypOlHxcFm/X+LACh7ZwIHS5Bm
	 gAy+n7OcLPxb8a0zIZwxsE0DCF8jTwWEmXO7G16ez9iz4tXOCr2tgtN+6cRggWJl0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA060A381F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FA060A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3PR432382
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Ve9ui8PilMxtzrantty91Ae
	ttA4A9wQUP1tdJP+4uQ=; b=ELzUjXm4v7MAFja4JJbXr2MTcw/RSuWKkdJ+hy7O
	MrVDaMZHhSshavS3nj33YkeKPqWV806SwcXtqRqdXBAVAKjABVzQCstnCH/xEq2p
	XEFrLE/vwZXnCQidU0ldxENnTa99RkTMdSYYniz8Y9PDbENnMvHjG/MhfpxOw2HU
	Odplci2IeCh9CdxfWjQgZmTocOeGm4PhwoCAfUUH4WuCpVt1z7q707GLs3MoezAK
	W1UqYhv9zkbprhdgzAYtii8SccjJnM18nLKo8CMj5B8xJFVRAbsY0nBY5TfEgYQ9
	nGx6WbEm/IbX83ERcKSKLlBTiwSOjinbaz1M3Hg2QZTf/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kj3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so827678285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100777; x=1793705577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=EfQ8McQvH+DSDyFI+ak9B8ymsXvLPmTU5h06rgn2Hw4SgSTajH3f8rDXyTIOH7eNuM
         weMsyWmscxbSYcFZ29ankI9sMVZvYCX4xMhTHzddpvxWrNkL+gMwDrTh7daFlDaFdsAV
         GcUBogQZ37vrPLzmfqSbeo/kWy7YlZAGKE4AgUfjDdaNRAl/4S26ArjWoBs1i6srI1UZ
         BOIH1JLsLCe+v3Pkg5CllE2vS5qXnp7Bf+NHYRdM24Kv4Sz39ldCmstXM7ahoyBxd9KM
         AN44H9RD/kqOalLxwE54T0wT8/9QofIScvG+G6s1lAVwwFrDjDYNYcvQgUGb37PIBwIo
         aB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100777; x=1793705577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=hySS9X+ChGvzEj6+u5VhgXHrB1Yh2msmMDIJzt7PQibXKjog0L+xgPCTLmS2NOQv6v
         VZlzd7nNVTKB7lBDgaIPf06eqNx3U+V+yOYjImDpxBTap7PRqiHCF5q+tHVlZQVHdyGo
         VCiP2fdMyFm82HhtpUAKqR35xL7qBFCuKuhf/OOSzZ3eitDhhTF4hL/FplKCrpa1dUue
         TyvFN6XSTzhz8Tj6fXhF6FO/5C+IIndKMqu4TE0hU0viM+p6oYwDtZQx98LRBOe2W1Pj
         v2tZz0Y3Q5xdqLgAqZLQ78rt/FbAYkdxbRLgMDNMe2RhVRyXJNzYR+AG2v1CSPcHzv9z
         7u/w==
X-Forwarded-Encrypted: i=1; AKwUvBzDCThD/h7B/ad2UN4c5CmoL1nwvDHJhq/oPMiu5l9MFyxa3CNJQPqMz37KAQGA0BCnw1RoFU/tgUuPq/fh@vger.kernel.org
X-Gm-Message-State: AFq9FYJkR9jcbMzCsQnTTUAFWzNb2ych/bcixim9sNWCo/xt5eXnU7/2
	avFnup5Nh3IzjU99ZeLb7KP5YowEIyz/3q7dawp2di3XRtpHX7IYsgahLICCJy8/Rgx4iXWnJ+A
	u6D1fhPdLheOQpvMLymGX+8I+FqFVJ3/iwd7YtIDrT0JalWAxXdtAeEXo2iIQbp/4rxfL
X-Gm-Gg: AYBFou07X3YnYV28azvVxDzZXk0OUP/7tKEd5FT6WHuPEycjUQX82wxZwz+KmLNIS5B
	p8hgVNRREV2S7GFA7Zp06uokGbFOx8XIIRdzei7nD9plcqVWTgao6JL8Zb0s/AbwoHWXeqOBkko
	ohYWW3uRkdJ54EYHb9qefd/dfrLGEC14uy/BSg4bXPj6m9t5odlf4FDbVzndKnIUX8trwugLTnN
	EoEYbHhhYzVv6eePlD0CwDFG5f6biLOvsABF0rogH4P7dRKwnFTc1PW0qEXyD2/X+L16r/xXWcM
	rNMTjLYlGVtsK5+M0Q0MXfVCMuGdTnif3Eyk/O5KA6srwS/VcGdkkev6EorvNTmEyuAd6Gvhr44
	TUp+TI3xXqdw4E/zQ
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696046385a.22.1793100777121;
        Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696038185a.22.1793100776313;
        Tue, 27 Oct 2026 04:32:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19211985f8f.26.2026.10.27.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:32:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: patches@brar.si
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Message-ID: <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
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
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX58Kv1e4k6T95
 JNEklG1xtWufLJAkybn7/oBp3idWdevF73BpXZ9lMDqocxQ5iVKYmMBzIbNULxrWt8oBIIXUUEl
 AWO39pibA/HpR+WbiD5xJjvx3jlcQCM=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08bea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SYyxiif7jT7wlZCutrwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ysnHL-4PN9qpEf9dhSywLSYl-kEyR5-p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX5vtvkWCkTY5X
 wcgOG4GEWoHU9IiaLiG+Un10GbjcjMwKnxFGvB2KRfQtGCQnICX+V8KMSYyDUKUD5ovDOwDXKku
 B4xoRpEryfhUEHYRmJ3OVr3Mhj6lkmW6Xct56cSd1GSEagEnTVEaiXuopvE/KQ98QxCQ8jZl3FP
 5epuKkpGumgqR5xai+bMsOiRBpQHhWYVvf3qokh/bFj5EquJ07bvk62Z2xmhczbW5RYdLLa2gyp
 /I1zbIw87tnYoVebaR5xem2+ZmmTwwE9Pto9Iq0T4T8VPSvg4vkBj0wDQ+i61Ct2ATON6YxNM3m
 0RYhIPQAmYfTXCSPUS/eI5QaNeGN8W9wEFpv76PPGboXkrKDRLxQnz6cjLHFMoAOVwD6OeZkOCd
 ayg11C1kqIvmwLj7ckRjTQThoGp+xX2JdPYEEThqIXlTMZCp12s4OlwCOYiorvv5LL+F6Rt8/MF
 HM975wkH9jqHnzyMsyQ==
X-Proofpoint-GUID: ysnHL-4PN9qpEf9dhSywLSYl-kEyR5-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-27 10:05:02, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 378 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 389 insertions(+)
> 

[...]

> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> +	.halt_reg = 0x5000,
> +	.halt_check = BRANCH_HALT_VOTED,

sm8250 uses BRANCH_VOTED here.
