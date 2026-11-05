Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884636;
	b=RVqOMdPOO6nx6AlD1U9nyLcEpbR59RkCTpWF1iC16Tr9BMO/zCZ1cM6QwE61blUAa8pD
	 IV8r43hU01u+kdrJ4K1Ju70JCo4VrZhBpup2EKLWVUiiQ59JgpWJSNpXoOH2Ih/qISaEp
	 rM3NiJhIVjSw6x266mSUhA7jqn1Z9KsFcaSk5tEcHIron2BaG5/0qR5OAZcDFFY3aiXGI
	 yEFLTYLI2EXPh2Aj+OOqT86HbIMMABXt5eWy0KObStRu7/dflNKcSiLzOTmKxJxA5HVzA
	 tHRy3wsB4O5hD3uejHzLUfzxScih1Gka8T8FSOJiQtjBHadMCsgTYtScDHdPMf4yyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884636;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
	b=qc94WUI1r6Xu7utXf6+u6+hHgxNj1xBuLV27clWOGrqCYxJCrXD1pLMUf3W0IfWsr3cG
	 Oeyp33XoKhg0tQDZ7kigaLD8t7DT9ArBGwNX1hqqiejJXJnV0PBKtikHsfAvjQomZEkmZ
	 NSWmAKdf/LjN8CK3lIymY6qr1Xc4arInIMSpRUBTd1vKgmJzYhZlCjmHfDjF+LBzjGSfh
	 AuFsfiZG8W5rM0vp0qqXiqItJyALOISOvkeH9Ywx7f2pkSSRhd2YMd8G1C6L2ZW/6OYtz
	 FkzCreW4v0fBGEE2xIRT7wKutuHddItoHZWBGqwN4GkxqwN6PF4jJMRTNTWbugybADQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DP8KHpP3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA3C606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA3C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dbi5h6Jl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DP8KHpP3
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tbqc1028243
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qc2jMiL6eFsHz6iqLjg5VRSu
	JjQ4citqkfgQCMTvunU=; b=Dbi5h6JlWjaYOfWrjQOqoghNj8LtnOidFwmRK8Tw
	WQKoiSsm0M0HDqYhlm+SMdoVcX8lXGD31qAlQlyNi14mpK95Y8AZfriSb/O/GTUw
	S0Cfh8SqnH8Wk34PlActYR5ETtWPhz23Bi/+7dChj9pwPfBiJydp+ThP7jKO0m++
	F6fg6PHAu6qWSrDU9gl5XZjUKlQwk2edaoohKu4CKpru8PvEvHf7Q3JggV+bBJZP
	6mWyYQvARxIHiNUe9gRcWTUzXa2DdIrxE+8DihXH7+hIu4ZUD/KcQ+yWFcgXzUNw
	TDFF/GkRXID9Ahjwfv8tgDPyanV/eqb7ioX0qQIa0qe+FA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9y5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:17:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so130995385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884633; x=1794489433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=DP8KHpP3danA6xMDBFzNHjt3t+xXO/zlMXwHE6VcUl5TPfUIohjgS95qE0PV6V1Js7
         5x5oRFhDVJyl5Juq3jKRH/uma0VvdyzBcpBWSuWBIX+Mh4STxoBd2Wi84gBfRGnJwP5i
         z+WMV8ze8uGDpgyWeglCxF2ps5cc8dqWE43G+gqlV3WGgA/p+lKuz50mvg+Notsrd4gm
         JTZ8hVw19t7xo7990ASHO3vbS6YHXOCkRuqlU8DmYg0vu5+hTgluVUEje/aXririZDRy
         IG1UVay+1zUjcLjxfAgCwaBZ4AWLluIqJ9M2XUFgkMIiNnGzFvP2MrtV0NmdjDkb/z2D
         KLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884633; x=1794489433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qc2jMiL6eFsHz6iqLjg5VRSuJjQ4citqkfgQCMTvunU=;
        b=Rayf9tmqUrBHj4MoSoTq3mWLct78b3lEuYntkAQtqmczKB4R2vwUsBfWiB1Biid/mX
         xEhoR0AKJdtNya+gfU32XxOoGXuN9OZfTpKlOC4ulTwqB9GR4aYMU7Ir0VdGFyvJv5WM
         w1R67Ggq2ysX2LRTy4WU3VmfIh1TdLlmX5eNnGwjliUlvmF/tRFuzlKncvttDU1OjyeO
         4XUq90CNUViN7kzXRXTWpi4nP/9Cc+7sTMTMGf6uZO9JmeNn7kGkZsA3XVDM48issdNt
         PrCkgheZUQxvmuJU/ZzaWrmIhXEs3zTYOW8LWlujFoSEQ/X2NTBzsVQ6xwFrQLUv8ZUo
         RzFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVso+5mCNRtAY4sQ9Ugclk8TTcpcs4ZuHtzqKTye4rGZSa6nUjmI7+RPI6z9oHAsDt+Ofmaodi1xXbDAb/@vger.kernel.org
X-Gm-Message-State: APuU4Z9+5eb3hvWXtcKSdF0Sh8W0QDkpuK64+Omd5/DLcULUj+IrdmlH
	xffl3dez/Lcsq/W9YHXWsaLY2tswJYsGsbgAQobK3BqwZ03QSuhEP4nLY8tXz/rnB80/UUIuqIk
	b/FMVXOOMcChmtOX1EjCs+PlIkObkjJGOkFwCSyUH6zHnapce9017OqCDBqCsSlN2yQxxqmUoj1
	al
X-Gm-Gg: AYBFou0U4AjGWRohRj1QrwqNogJ+0Xo3PjnX64FlnQBNJl9HcJEK6T1d678p8pywuFY
	X9WEnrcfczIFL88sWwtKt9v5ZOG5e/5/IUviaMFuCkNyKCS8xN4WvkvijCSKQ56TCVQEanSYNrU
	z/r0stHiKxzGXbhhSFTPFsNEDVHR2S+8w/5KKXCPye/cqy8pL71HXOBdf1wA/NG37LozFNYzpFa
	uFgLEI3Kz+K7CMrvlKPpP1Jxl3wNVNCxcHxVaJWP6qLWsFhMpHBKX68UBQZo+y6anTETcRQ5bbf
	iseSaqEDg0V2xxQ6KUHvhWK7qAc3wJHdLhyxvwY09IE/yAeQpjoZoWz5QpRQFVlc1KhUyxwbq4t
	g05VJd+1ykykLdoSY6cMepjxZvhdwDaSZ1G2WQyDnYbpi0VMrpzvTC8GUdbqHXmE=
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398575285a.39.1793884633329;
        Thu, 05 Nov 2026 05:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-945e17e2cbamr398571085a.39.1793884632740;
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm67759415e9.1.2026.11.05.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:17:12 -0800 (PST)
Date: Thu, 5 Nov 2026 15:17:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Correct number of TLMM pins
 in gpio-ranges
Message-ID: <rotiram4b5ah7luhhwd7f5hzhoz25p5qwz7yi4m6riu6spvxep@y7hwfdbmtcp2>
References: <20261104191700.676773-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261104191700.676773-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: qLfBsWmQ-pbzemUlIZ1Ut9yl1AuX0fF5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4dTKduZ4jx6E
 B0IeGIVqxBWfrtlg1NzF3xVdD2iGGDFBzlOQqc6T+y4kgzaEDq5IutnxzYnai0SjXSi2r1a/4E+
 WHYOCL79gTUP1RqE/0JxF37RgRbzMkA=
X-Proofpoint-ORIG-GUID: qLfBsWmQ-pbzemUlIZ1Ut9yl1AuX0fF5
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec81da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EGeSfPnbYMIGY1KhdJMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX0suhjGsqJO6F
 skf02GfQ3aAF3HwdpT7dq/aPSmEGYjqUhZpuK18ZQ1oacOlH9vmtNsSJ14y+uZdsPW/wle1zW6i
 YGYJSscc6aevWlw9yMR/jDRX1RnU7Vo+EudVqBZbtwh16WasPfQoGbAP3SV096JlatemQP7BPw7
 1sgwm8BalxsRAASFRDIFSSlmsn+vBlTVPzAV9wFw+0JO/AGd2hGR5FzW/ouIETb3kzpGUt2wqe+
 DG4g6B6E6mninmD3XXunyA2IAb5GdwzAncrClMj4UfSzdogtvuOPUkjrZ7sggTbOKpxZiQ+lP/E
 OT7y3EQW8K0uRl3x5giyW6BCvAeweOcTEvaDNEQriSlf9irc+togQvyS2DJ06xJbMeTpSkfcfhQ
 YUacdFt6/q98DK803MWBU8rd9LaQUVQxBKj2bx42iA8TjDglgbPzMkyYZ8BpM6CX0ESMn7808o/
 v6qqnza9Tp7W/6Ljqng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

On 26-11-04 20:17:02, Krzysztof Kozlowski wrote:
> TLMM on Eliza SoC has 185 GPIOs and UFS_RESET line, thus the last number
> in gpio-ranges, representing the number of pins in pinctrl, should be
> 186 so the last pins can be configured in pinctrl.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-0e88535a-02d3-4a42-9f3c-ca4f9bdd3b11
> Fixes: af20af39fc09 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
