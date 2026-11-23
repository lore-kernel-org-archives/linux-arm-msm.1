Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461665;
	b=dyxcdygeTOyXFVKRAnxe+5wz28D4Qd0YGaprrIIJCZp6yn6H7gXPDiFuD5Pr93NcSuV1
	 S05cIfiJmMXsZ/9TiyuJmltaT1YZBF6vDoiAk5hazgoRJTcFp+GQQZN/6y4Dav+QMZSOg
	 oTR9nv39NshpBDzm7/TZ0Nul+ghJuBF+XcESJweJwnFaSk15s6ms86RYW6NCqnqAQhCym
	 FPeDUdWWCC//KiW6F2Z2I0MGSSZHr38P2xSYxvryeYgPcROwoR1akrzMrKi5FOSz/L9kY
	 wVg+A2p0w8ke0QAMjqPDwRL60EhNc+q4VuPBMogwCap5CdhGaS74g5bAfcF+0xb8EvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
	b=bhxRCo68vjOsTREOpmux43nYALlqAGRrrDv8ZzVQ60VhG7sfQsM3VM4AQRBcq9MCvQEB
	 UpdwofgFTbfMVHffWnTD0NsG50laB9Pcs5G4hBasZybOdnpz90bsotKzAr+ohnLj0OW4D
	 pvqWJfSij33na6xFjKNi2BWxpb1DUNYhSAZQ3Z1sibggM0m3Y27yERPzWdKPK/9iLk9Ju
	 tCzcv7R3k+VG+fcYFfOTMrjXFxadxtqLIrJ1iX1dygVBZM5RHJQA/DIIN56s53hiC79e4
	 Ea26sM8ReDbU737Uy3OozzXmbAFYqbgCsW8UXU+w+g2EFy96llxTAim5PEtthZoqj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hwJWs/cD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8A7TNxK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65234606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65234606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hwJWs/cD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8A7TNxK
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlYx3730161
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b7Z+rgnjh6aqXXsMxABYjG6l
	nOAyHAQOqRDLzFPl3JU=; b=hwJWs/cD9Yf34FOb7BaA+BCeWtYdD/oWhHWqGgYb
	dnH404x4OVO25K+YsSi7OPC9k1owvMQdZ/K6sK3mmLYOqM0NXu++AmaGhzV0e+b+
	y6HvHXTK0NoRFhlGpktw1N6ybKL0IzJ5NLe4EH2DzXUjbW2eatSAlxl90VnquyWK
	qrnkTZEfBRNOQ1Xz22qxmpTiHhEUx/HtIZXiT2MOfWLGOc7ZB94bhNTz+0L8Ypnh
	ckTzNxKTgDOX4MXuaQmx2oUjYvZOMxoe6C9kBLPfut6J3OaQrhhKY1Dve1vMlQhF
	ZnPjv85aqb3pqneZTCYaHjg5b1RuuyDh3jPC5jkmq6xsMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd345c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:21:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so597387885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461664; x=1796066464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
        b=b8A7TNxKLZEuzMY7SQwRyqme0bUxTx/daV5zKT+YKpxO31998wnCHlzLnORL0i/4ca
         m+gdlfGGVhQN6CCWL8oUTHVL6WUCc/CkD6WQ9Lmp9oxWgUoTvmoE9SIPYFVj6nj94IUA
         RV2rakaVJL5gzClh7lpPVxsoOhq3XdmKS8M66Cok2cvdPGXCAka8bddpaQ9zzpcBsQSI
         +AknkuFmYER9BcXjpYtfRQLkXVbMkan1QVwmCeX02EO2XhAlo4lM/HP7dqyqIs+RAfFq
         IQDknTJ8Ev3+cCTmPlaDBX87He2k5AYZaT1fksMfN78JlAq2g5xjxqFZPiytGGJFeKiK
         rMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461664; x=1796066464;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b7Z+rgnjh6aqXXsMxABYjG6lnOAyHAQOqRDLzFPl3JU=;
        b=gYtuNN27cgueJRyXUAmrqvV1SY8NoLbAoZ5LMsFmvHHCa5Et0UgSNEvEX3QaRAMu7N
         tDHSuC3eEj3DIWwMMRr4z6fFCUfLmMDatr29+hXWpIWTYZziyr9D/CX/AQqibToJ/MCe
         satdey+ZuC7zCIv0TseKir5j/mamMo2l2RmhplKFHlXX6LIInFKXEbl13e7q3CJtsa8A
         Mwfiibtz+rMYnJOKqnH++9hKkqWlh5hGJlaLW6bNAScF+33DMA0xYcyZRSNBEE/aTz0A
         f51zLBFYxZlT5zngq1rjH0VJDkxgzvrL+eV1pqw3s7crHzkvRsNDGmHOqpIL+nWVgz7d
         9q9g==
X-Forwarded-Encrypted: i=1; AL+hErGAUcwN1qP3YNqzF4pni8Til1WRzHJr1PXuS6zV3ojxYovDGndvZ56E5TAjIHF+5Exq855E3obilkkWlhWK@vger.kernel.org
X-Gm-Message-State: APuU4Z9JKdhfNJlEntILManbIs+0l2rgN1LAzZGOYfJe+il9d4a19KX8
	Y6e7AjnAF9dRDGTcAeSqGJliqXgP+/ObJs4oszXEJ9UIrS03dbrXqhwV5Z+IYvNR7fq6FEeDArZ
	oBpL635mcW8ubC0sBlsGMQNjozn6chzLHjkEQZK3tO8UjXazZ9RRLAP7OP4sRqy8SLwVh
X-Gm-Gg: AZFdTZfZ+cKzxTWI/GuPbVF+KvjLRN/mm1FHVv5Q/OLtP3Tb22cuaqP+6vxcEjltGom
	ZsvYLYy9ftQtQo3g5FUdIsgNUGZWmLDzwrkz8YqE+6n0Bje8NAeSDm0IKe+TYLlqidsH67fTjpC
	JCW3fH8l1oIjl2L+2H32fLwp+9ENQgII8gjijcDatDCFWoNXRBDg7RIga7zJvKIMBrnuO9W5bI4
	BVq3nyQ8w4bbi9Wnv3fjOfYo7Z5162Iy7NZdcU6tRvC5l5f11dqy97Aytl5ekwiTTEQCp78Hbjw
	1a64X4AjRXIPBQy/6bp9CxICyln+xbWrvXBko3E7dc1X1ORYipDUaOI6GWgl/imZNdW00A9CECp
	BUFvHV5hVaPc6njidAlnPwn87Zyq85oMPpi3xpBjqa+27kwR9prdFI/awiEe7Mx+u
X-Received: by 2002:a05:620a:130d:b0:949:5e26:e929 with SMTP id af79cd13be357-949ba99cd71mr2170105185a.33.1795461663478;
        Mon, 23 Nov 2026 11:21:03 -0800 (PST)
X-Received: by 2002:a05:620a:130d:b0:949:5e26:e929 with SMTP id af79cd13be357-949ba99cd71mr2170098285a.33.1795461662838;
        Mon, 23 Nov 2026 11:21:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm581572375e9.14.2026.11.23.11.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:21:02 -0800 (PST)
Date: Mon, 23 Nov 2026 21:21:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: Enable MSM8917 GCC by default
Message-ID: <dou5fbqvtfze5rrnnr3sxphwo7llxzzgftswaluoubhasunkvi@3bjieh24ex4v>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcom-kconfig-unify-v2-1-fe56c8fd15bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k9MgbND1TjD9Y53W7HDdstmGxPzJCH-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX/8SQvpg2ZyoK
 sbbMsIwHua+U63QTXCGnvmJjWVpY08rF4t7QBrR4xgxIQ9omIfm73M3cfw1I7ARhQaLVvg3n3jx
 4eIekQm7Xd2aztzqXUIS5vMo+QTWN4FWlxb9uMTWQ/+AvswaV9qNhYvmKOEoyu4CnVyZmh2IFgQ
 GYV73FQPC2wlXAKB9lBg7e0P7nbCClTnDnKXJh1FndWMPTNN9B1sCY8HugF48imK8DVGkuDj8LS
 BZJ0RuWmTnk/cGpQ2LF4a0dy4T9tLFuXnJZkDbQ+uIl5FNhOHpq9qyIt0/+nda79BzApx/fZ0Er
 IyYZaTPdPLKHtxLaFxjaQD3OdOAddij06q2tYxS5zcwHDE6Lwnxa+LstRf5AMHgJ1tUGBeMzBAr
 06JpmfEURyPvdbgOxY9CqunOVAWJfw+X25tD5u3YwHDOhnd8yrPLk9raZaS5QjV2frgJSla7d1k
 Cgc4mQXoYHoRCdSd0mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXyn/68ceDyK0q
 lJj8q7ow7xHMBBe8UyTbdBJj7L/lJ8uVjEkrT703XJa7iyvBqvIz/yGkGfHXEoclwkRdm7XVn+O
 zPf2TmQlLTi3JVK6IULVHuRPsUQOScw=
X-Proofpoint-GUID: k9MgbND1TjD9Y53W7HDdstmGxPzJCH-n
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b049220 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i7WGr1rN72OSpxvVzh8A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-23 08:38:11, Krzysztof Kozlowski wrote:
> MSM8917 is an in-tree supported SoC, so its critical clock controller
> driver should be enabled by default.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
