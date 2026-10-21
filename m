Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579018;
	b=4DHF1DZTAn4u8gf1cgccD/2yPvDs67520GFgBJEGj0UIQPAwi7vqbK7WAR7TvmrUW+9I
	 dfRVNyClsllp3EqEQmSQ8Tn+vVWo/PREpeM/gd5Phoakal6R9F1avTnJ7vaZDVWS3w2ah
	 JTLQo1XEOj+LUhgr82jfj6M9OHrpe6Cb9yBDFwC+YBgmMG+Dz3biBffIOSjkPeJ3bAUZq
	 Tw6Tm7AA07qPm53GehSWaFeVQAjY0vR+apkx65Uuz9XOnOnVeictBgY4Auw/2dCj73hJd
	 PK35vy9X+XDrPyVKhGbOkjJCR0SHArV+f8v3RaMbs9dvN5IbBr6pV4jOH4Qy0PZ+imQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
	b=2cT/NX6JpuSoICf2AW20UvQonzbc5tnl2+BMO573j+GRyKZ+jFh/Y2Mjn4fTNBq792pf
	 BY0MUSttc4oaHbYJoneaJVyu9CqrFtV2MlwW/PaaBBDOtJN1XsRxs6kgu4cZCuFmkZ/wb
	 XHX8LYFu+lK74dqLHiMlDTIJmEwRACSWIgcGFQCM5R1uwpcbmWwpj192qudowThyVyDuM
	 zZIaxwxmSOF9PXBAS4RmZ+caExXgg+HYxFZY6q/UUEsOZajPSS1FAtHIeeXwbR3YZY00X
	 0wyEUnaboQ3dIRIpvO08Iop6+n5orp9Tu/CMXlrUk0tph3m42+nloX4/Y68fFHeXAsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vp4iHIH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB1606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DDB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vp4iHIH/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5oSY3620553
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BDJTCmz6NRGzzDUbjjpAqfjp
	VYc95zSzfV9UFDFGTpI=; b=Vp4iHIH/b9Q8rswfYPYJsKAo6rBa1Z4J48mcAa+Q
	7qjgUJF3HlevIxTNDJ6IzOuDTRRTW+HYytEVjAvPmGrA4QLm8/YxZygJNCoyURIr
	WdXV1Jajnj1hTDzjjZ6AR8Qz4KSPs7iOOVrJmOi+qkZ+4+IgryNPxvFAOYbSxzOK
	e8T6lXC4sa+xnzpXYbQUjAtgNsnCOG5ChtmkpTWNpxo8PCBFjkALaWrFQFhwje4E
	D2UQ8vXIsYHNvCqWwUQLQZ4nGK/sR513htDylgxhGCAuHCD1orw0nzZWOBYK/A7Y
	2gMDj6ZiKgnrkxY2JSCYeTNH61VBFTSQzRT00P3C8ejLqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3w81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:36:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so133747185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579017; x=1793183817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=CYyl33Ca8WDKE51GLV/8NaGnmzXbXbbc65iseYZf94hhlDUEO1gD6zbllAHeMWHwcC
         /7by7whn3uTE6/r1le3wHIj3DgfUbwAppFQ8RTgvV0euDROxZ7aAc71VWobSLpePvIqU
         hi3kWGVBohXG0Uem7BN+Y3PtwDq4Ct/8L/56yrUS+gVmWwjTd6AmnK160A7B7RI6hy5u
         dgTTY3H253fu1ivRxy7PhlhXAWe0ER8qSpuiFOH63bWQjTXUXUhnigwoSjSyESOVh7ts
         y72yYpTwZ62NNwpOTf9W9XJJlW8Zj9ES7MO65izExkZJGTeOabLncY0S/pmkM7Rd/vQe
         Fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579017; x=1793183817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=M8KR3AraP4TgZVUeLO+JDg4goiqsMnoq9ThSUKCxJyKA6dHidnozkLQmz6YyV1AnWW
         sNb0FUvIC8ydj03VHRsb0/M3EIh+veyeZsBbEawmDiWTa8eU0GVpRMHkUr0tGm/3CTrC
         l9qCoX06MXNMANTf+e2qk2dk7V43vZqpki0khBJZXlrN2RlZzfeiUVZeVmLJAu2Z4W6z
         fiju0OXWuwsH8LQ9dBZQdgkmJXKSeuO49dtmebeGDLw7ffQfm8ervuLYFETLjQ05QHmM
         eSYGhEVUDjVlFz+9T5b0e9SG67fa6P0Lwv53K2JjY8Q+sHlEUq0H9FY4YPBfaNyNuQWP
         VZ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfNo5Mblfv0cXgcbnAgqHmZdJb7Xr7fhlzo80NwGZTyTe9Pgmj+grvznMwJ6quzL2kVoHfSwZdPBUYxSzo@vger.kernel.org
X-Gm-Message-State: AFq9FYLkMsgBVRVkDjNFlePBmdtab3N8ZQRfyiOl5H2JWu8tBg+yNZFj
	on3aUfonncpFu8QfFw9osSdDaYS+2Q8M4NiaPBB02ly+rQwVK7nV+whDL8L+gnH1cqIVwyIdm+2
	ZBncf9GKAthohXxS9eVPjIbqZPmFfC+0XOmhFbNOKv0rH3LnuhH2yikDw+Vp327MYzxmo
X-Gm-Gg: AYBFou3sWYbsp1WuUa1bz1U8UuTtOe3tp8AFxkhUypeJZE9rtxVsE6koJ6GFO1CWIzL
	n8gSfINjgbqC+B+vqOf5ocwy4WCTKSg4zT2lOb7YjRJ888BcU+FwDPvhi8ku9L9kLPevmDODQcV
	XVhWuHEbEnEHSlN9zPik2eICBkKWXuYoNBu9VIpVDbmg4RHpGZOAZJIEofBIIuEqiEi0pOhqQHH
	iCywD3P6zyd1PSLRmlCeEAV7LWIUcXYlc+g0cTM4m9eU2kkNcCBKbbhLHscFp2jXk5itWz9dmLU
	bZ/wedvpXCPKflVNq2IuNp3w0JVIy6ZaXrWc6bWOTNparLnZhJvULR0ds5FRdjN3fCMs8guXOis
	l5t86fMzHuzsnsjZ4
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324736185a.30.1792579016819;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324733285a.30.1792579016246;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm20742025e9.11.2026.10.21.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:36:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:36:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
Message-ID: <mi4c3ld7yjptbubswccnzoq4xrlbj6yj55fkgwofnoaukzbmlc@l664p3rhjcmd>
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
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
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX52Uq0eGkJfHv
 0tX2E9OjujdLyv63dWqEkBl69KmiFpnVqjyk7eI+TeGGEWMU8oDbyLXQyOpyX/wmHdxWD7cDix+
 b3ni6L8Qx5+OvnWiSu0jplrdL5C0mPQjch+7fGATx0YWJUYkIMLI8M0KLWmuSM5NbqXZCT/c1yh
 M4gqjD3KjDCI26sMlKqqnR7gCD5yZPYC2EAsUW1SszzQgJK7dMP4JlzxMcRBTMnbc1iuZPGW1gY
 0g0a7CPRLtEIJyrpePf7Qr5CU+tdU7Vc5pxKZHmODqzYai3llOn5ZNMmrJhDqfYqbb5L8O7lKs2
 /s6RXvqxXItG0BHzAMHy7tdWfyy79FrdBEs+5XP7RvomtBxLAPI0alcDyygLk9xx5gXXzzpVgt7
 E0PSuBvNyBrdxXviQyt38qKY4E9uYygH30lyDR3QJIWx1KxO1a8rVHWbHdxKcgLHRv/zCNVXZDI
 YPl1fNwYC1WShqkMvOQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad895c9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NuZgWczD4kNqo5kl0xoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7gJXtC_C7d3vGtB57lgkZHh58ephvLGV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX24WLDjrd2gQ1
 5O7noigSwdvc5L1XIPBj69AmjtkwL/4VRz9TR217ojgHPj7cAmX+g/4JCPAiz5bxu2eEhjQv8py
 HHSNcRmvF26z4zPeXbWpyOt0ahbAkf0=
X-Proofpoint-GUID: 7gJXtC_C7d3vGtB57lgkZHh58ephvLGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210042

On 26-10-02 10:55:35, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
