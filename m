Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699732;
	b=f2qKhoh6PlMiz4HAj9di5L/b/C+II42u+hcArsKAbyS72ZOsE+l6hr6XYr3TOIwZVPs7
	 vH0UGioSfgiMndvKJn7fq52kRnDIAKiP9Gy9Ove9ajWjZu4b3+kiGnoC4nkOzSc/kMc9s
	 g3Cj3Xr3c7q/NmPQVeuJAxjX/Y12NpjWpUo6S7ne6+9rQPkLLEpbWKygV8JkSrmULVqDD
	 NcM2m246exeeVWwxcBQEaotoLAnA07A90iOm1N2luid3ygO4ve28cbWfN8Z3xI/aLBG2S
	 MLQT0yZErrW9rLG+AQ2apFSef3PQ2MwLetIMX2iwqbrztujGpn61U2BqUFOeUCvXccw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
	b=fmNHTUqOGHycQWlZ/4dafBAAAb4wLRtzbF54GhN9QRw528DrZ7mfZScDXuqNKpQEjijA
	 jqgMErd/QKGvAnr5ydREYYdN7A/js64fmMqQcfjln/5IC1WMq066tCo2i2ZOzlONGtMEM
	 ZvX7a87hovYnGCrosN3PBYVr7MBXN0sRSgIWs73Qn9ks8xONKAG+m4/wqvmMZ1/OKGg/j
	 P2UgJEUjrSLa3a0xqiIS6X6BL11LZI4sLbIBUDAHGTdVCeWnRllVmHXr1PdT8NcMtUvJP
	 CYTKrJN04eZ1bRMCxyj47XISdHCnNQwoaftIenPfm/yKLMY0HxYSWT9vIldiiZJkpYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3BC60A5BEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3BC60A5BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=glhrtAHh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ty7n23cr
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37dcuS1434181
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lXjhq80fJFnA95T4d1bBkkRW
	6z+GaA4781tkMP0d2VA=; b=glhrtAHhzZLRW+IrXafw84382U0f16rTqbiYh4Vi
	7+Sf/7CsEBqESU6eeIHRCPw/ONkAz8mYPo4gx2DCW9rLkzxiYRROihFQlNpEMffc
	hUAYscpA/6kXrZ7stvW5lVYHR0sd0IUbt8WX8gaqyth3dB9IHiwy1Z0syKzU0IvN
	EmoICur/+6RJGX9LhsXhlDM8QT67Yuqkhaw7arPd/H1iQ5JltRZMgABJoos+hNJ8
	WGWW1ZqNP2iZHZND0eS5t+IYKVi70TIGkH9dulJcS+5wdwaaBmpi+y6+qB24A4C4
	/r3iNfBwUI3DEEh4jV1CWr4YmpNZGy8lnQ0ahSOiNb5TXQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acjhu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:55:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d091514509so380774137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699730; x=1794304530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=Ty7n23cr7OYmfDt+wk+54hQv28oea+opR1DYhddK155zuu9PX/BylhjCEKxfDOIYjR
         g5Ia1gxe/vFsIDf3epARfppXirgRu686Jc+GG845sU4yW1WUA76qHw1sMKv4JfFvWZ50
         5S7gx4oNzEa/jaC98UJN45AgzY3yp3j0LOIJlpN/alTBOOBK9gf+ruqI27HVLzV3LxY9
         YZhoEQRDsZWwup5RTeBPelfvmI8fgCF0e5XfFmhL12zi52UUuiFZBSItEvAkY4f3Qt+U
         wVcwYwbrIDMdXVJvu72wslJfeMIDSnYoKdzh1rXTMWiIorld6WLS2xUPI/nI20h79+dQ
         HAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699730; x=1794304530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXjhq80fJFnA95T4d1bBkkRW6z+GaA4781tkMP0d2VA=;
        b=2sQi8gbbb0LMHLwGex+07j/CTUkCS8NusMQObjfY3jJfkbFOaEKlGEDIJYMD/How8H
         hzGdl/3+hHUKdOUja+bQDrvkhDvrhdowTc6ju1gCHIPF1baAmmNLGCxx6qYnnHS9LhFK
         xiuTrzex7csWtltl5bhzApTZ9LB5OfUJ6NGlRYI3Hcjw7G2/ZVP1EWpStvyGdSROhTT1
         tWCgUDZVitJ8NpN41T26/hHGP9kiR6en5k9tmS4WQlEdL5pA+yQ3eHMJZhWeRy+ZzMto
         W5ZUQ27AdBBAe3ewbLiEjdV2/27NKPf1u4AVrhMXuy4UXeI98uK21iSKA6uozoacxVZn
         hg2w==
X-Forwarded-Encrypted: i=1; AKwUvBwJSXV1KYFg/28kdLiXa26BMBSi0zq34uMEqIa2bojWPnAmcGFf3s0/qk8elmNbd+Qq/jekbDk4fI/jXMxg@vger.kernel.org
X-Gm-Message-State: APuU4Z9T1Ph9R86CJyLhf3e74vlqV19o3JmN3w8TZAYTpB1iroJ1hllm
	jaFbh70Q3x/7iW6T6/qmWralY4tnP3Ge1m0/SmN9TegQi2E+0ATTnbsRzm77dB+zZsRCdNPkEtQ
	UXnNEbbyrfqvDwbw3tMbID1oxSSUUXn4KNS/ZFmiaubfJ2z5wvw+9LM4lHl+B9VCXoORS
X-Gm-Gg: AYBFou2Q599x9zjghtnSJtaL2qfzbjRapZHCBpHJrNmR6VfqMSuDhYpShLtaVJsX+uY
	dzPEYzmFo93lWmIRO/zxgWrlHSB8EHfxeEi4hVTbHDs1Lo/yW2T0mK8x8dDP1VvT2MaYnud7Tan
	puVSNClUR8N2T2nvhJvskjjsgFQenqLPtoGVDxa9tXEO8BPwG4UUWnhJh4KtAmXkRJWwgxRylHo
	QbcyNawraAe3t6oXNyQpCjGlISoJyaIFuPaR+W8RepYX08Xy5dXCF+/k0+KzMfO+6lLtxtyiiLJ
	W3u2Cr2BuKQq7IxWYcOKL9FLci6kbhVt3dvv/HMjYpvd4e3G60efkfBdxNyJ8Bccn9HqhQACVIT
	+Ue1+TbOZ00sSmytii9Aq17t/1s9XodDGdNJBNrM7G80pS+7/CiwmOpwT2ppa9Ow=
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873283137.28.1793699729864;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
X-Received: by 2002:a05:6102:4b0d:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7d0542ccbc4mr4873269137.28.1793699729142;
        Tue, 03 Nov 2026 01:55:29 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm23166849f8f.56.2026.11.03.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:28 -0800 (PST)
Date: Tue, 3 Nov 2026 11:55:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] clk: qcom: clk-alpha-pll: fix Zonda L value
 rounding
Message-ID: <k3pobjkp4kzshfftvszrzc2jfdezsd7hauzzbhi72gfmyisyji@a67eggd7tvxk>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
 <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
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
In-Reply-To: <20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9af92 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aa2JovKfeZIn8VmDcRQA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX1i07F/KpMB7n
 AMY7ms7uGHYJ50gwlHUXHd69gVl/g3HHyWNfiTCpW63jJSOuFCZvqz0jDhFJa+Ldycvl/hSKfk9
 x/mztrxg8R3Kw78OUtfDDUdlYRTDEFZmRoYh34HhyrfHhbn6YpWP5wM7SuOrAkd/qhGx3i5V4s/
 KnNUEpM6hTrbb7y4l2IzScYigA7kqkTZW9KTNA+TTK7jmBKeR/17AoDUERsF7nCeECkubNwQz6H
 rgrmqMXb+e8ZgONHA0rkKNxbWQ/1pt6pUsHIUV5zG4L3++Mv7Yl+I1E0lJGXVobwS/1HzFoGrO4
 rSqniKXeCGnkbe3I1NegZ9ElMCsuz6HaJDKN0KKfMEfqTVNCSHzBe41OkG/AZrnCb7/3hGfljBu
 4OpEza40fUzKI+J5mO9enHGWJK0q1WXxtm9wqli6VM4ivgGIhxl1pBW2YLpo2qwLN2vx47lbpNO
 sQy+jlf8yQV9geUGMYA==
X-Proofpoint-GUID: bG2kEDvMHvfu3slnYm64sAiQjdb-P4D_
X-Proofpoint-ORIG-GUID: bG2kEDvMHvfu3slnYm64sAiQjdb-P4D_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX+klJuQimSJA4
 vQ/JBvEz2R62VEtiVIer0Qp1KJxn9bX2IEMjXBCYv5qRLXHeNg/v6Dg1JgMLaO/gdk7/4vvXz5U
 lRZFK+VjsibpZ3+UemhBbtXhsY8ueac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-10-27 23:38:26, Taniya Das wrote:
> zonda_pll_adjust_l_val() obtains the integer quotient of the requested
> rate and parent rate in quotient, but writes the requested rate to L_VAL
> when the fractional alpha value requires rounding.  This programs a
> nonsensical integer divider.  For example, a 1.2 GHz rate with a 19.2 MHz
> parent requires L = 63, but programs L = 1200000001.
> 
> Use quotient when calculating the rounded L value.
> 
> A GPT-assisted review reported this issue.
> 
> Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> Cc: stable@vger.kernel.org
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dc66fa5-47a9-417b-b8ff-b3a61ea75678@oss.qualcomm.com
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
