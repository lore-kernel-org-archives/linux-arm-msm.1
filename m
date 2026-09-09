Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0452FE5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956263; cv=none; b=PEJPn+7bi/fqqwfY5Yt6xKbDFdRcZbQIbBeQDqlYEVYKy6ugCEjvpIL4F58cSncS0A3I0OaSnbRnEYPgy8OCMh9SzNSB7TgLjiZoc5pCtHNOyRnbKOWitq9lBJmeh00US8aJFgKwZ1MbNwoI1IkuW+d7+kNEFobOZj9VC6NwzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956263; c=relaxed/simple;
	bh=bXAgZEEwtA/jkRMEdLGdUvl1pzruPAiUjgoVTV0DKWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUZSe5xDqyJxR7n9G+1HpM/BYua6Mlir6kahSpq32fho0rCjnmJeajKTgh4JQaRYrf3BMNtSLuVAKnoxy5Z3df6bFO5dKKgiFL6S6K6rHf//OK9xp7+P7Zh+XhADp+nNpB3ai55gVdhMM9D0AtVIfABXaMSgHnkZFb0n10sy+/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfS9ydQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayynOmLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfS9ydQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayynOmLf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU3Tv1183626
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=; b=nfS9ydQ1+Y5bFxe7
	/qpgH6ob9X7llIkWofVSYZ/zLPn8907T6gClj9B4OEFaXZnr8GJUXaK0pHLhug4+
	+Zv1GzrgdQ2PdwsDqvsVrfydmv2USvmjGvQcWGYtzTYTl+JEdsP3ULcgDbLfkoMz
	uHC//EJUDyvTpcSJ5DTSGLoEvLWZq7poFk6Q4ljN0JHx3kR8jhv8ZNbrGsMhTRBp
	hfnPE205Ku0IBDdrrNAMv8gDT1TSj6b/ZMxzma5K/X4i2ScPCQKEIQgvWnpm+SbJ
	UDnP6wnFNcqTtbkaXcvE7Hg888vrC7ZSKYnaDVDT+e+5aD7mcvxKTPDnU2zJ3QXF
	jxPvOg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rhku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:17:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so170071137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956259; x=1789561059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=ayynOmLf0GzAUpesWKDOGdxpHISLjBHLtvBNtAyucFqpsHllECNTwu288vNdsbDtDY
         uCAEU+tt8V3YWaB8wDwF3dGqYZkX8jeJS/429tcfUY9w4Wiu70c6xahuomy7NlP5cDOL
         lkIpTnVFpyvHQpLoU0t+M9+B8WjN5PoquxYNd4mHEO0MNxmMbGawKvrrdgh+H7W72Wea
         MwutsAVn7n/smytMU8S2QWULnLiTb4TwjpPqTi9hXJaUATv3ZiFIobgnyimzyGZroPyB
         JeG2xb023n9pDxKZn9R0UmJGARI35C2RlCYkjNPUrmExSXfM957AiqrdDIwmC1maltUj
         nEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956259; x=1789561059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw8r91oW+VZku89S6mMUhr2xWMOiY+kuCAJf7oejI2A=;
        b=V8q5Iv1gMq+8R0ROXBmWy8VK75Y2tLJDKnjorZYsKDEnZXW4TEcbEzXKobeQZOqMm/
         jREeB7VyKE8FZ1yjX8kk1Teo982km7+u7Kz/3iUZqLA4ghb+wJS7OhmuxNRHOpG6Y+Fq
         4fh+sAAzjBGamgw/3c2/sLlr/HjOoQzq8M+OKdZnubWvsasRccIIPzI16edSTGmwBue8
         8RC9+Zj1PhOFpXU1BNBI+fsui7yxJx3C9wzVCCk/pflt3GLx2bbaYxqd7FmD4cHfQ2FR
         3ZEUEVMd3ujfSd5OGxt0DntzHkpYiIjrTsePmb8cPciCbDFr/IsTFx9ZRC6fdNfDZhM1
         5fCA==
X-Forwarded-Encrypted: i=1; AKwUvByeSaR417g2zg3pjaOfv4iCe7e4iMaYcE/jx2CG9TgEcLMWvs0nA2tAHCVOqu6KcXLnJABPxNyhveh7GWrC@vger.kernel.org
X-Gm-Message-State: AFuF++lGND5nZGGXbRyRbh0vqtPX5TkcETTD/P5kXJnIGdxA3uzpgGKw
	CPU9QvMEeJxyhk1WOy4GYsBE/jyICRUwfGOlrftf3KwLaHRoXq4yGO7Y5dSbTg8ft+2prvg2LR9
	/YD0Vdfacr989b2o/bIPWWRJYTzM4dUBMraqbZQ5lZTo6oMHHL0cPGWS4W3TeBbSEGSDo
X-Gm-Gg: AYBFou2jJ7Si/SWVbbPl8rpQYvS3kH7K68fmbC/TkTBUYBJPsHMEPoDgg2DRUiMMHpy
	AfMGGeEAX0n2tKc0/2bQ2e8MnlojWyEqPUZPOb5OPKYG5O4/fM7kAN2X/Z/RLmHRlIWMylit4TD
	wgI6YU6++QTdqt0LAdImHt4tyT/ruEuiNcq5vW375LsEhl2HCfyIdkwdc9osei/v9smI3qbCI8W
	4z9LAHKFITn3mJ35jWBvFbBjO+uiIcH9DoyNBTYM6Six82R8mkOPBSqh1bDfGv4ta0qwHCio5GP
	tpqXulZt/7DuaIPzAmLZYxdrOHocwOisphiIjr2/1/CQw6/+c4STUI/3fE5o57xmWscLeuwDXMb
	l4Dk2Yob1SS6y1rb+cKkNZg==
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553441137.1.1788956259300;
        Wed, 09 Sep 2026 05:17:39 -0700 (PDT)
X-Received: by 2002:a05:6102:4b13:b0:78d:3ee3:c558 with SMTP id ada2fe7eead31-78d3ee3c590mr2553349137.1.1788956254004;
        Wed, 09 Sep 2026 05:17:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293ac38ddcsm49873166b.41.2026.09.09.05.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:17:32 -0700 (PDT)
Message-ID: <e382fb22-0f95-40ef-8a36-afb22b3d79c6@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:17:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: Add initial support for Nord
 Ride Embedded board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa14e63 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GJqCLuEFmrbm5pLexBUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: E9a1vZ8XzUc2TnXnAzKmCzH3OU6PAz3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX8tptM7VASEnE
 ar3iSP9o494pzGuv+lxEzOVFpj/6kTRtaT1/sS9PTGdBtCidq+zQo7HrVruufyjVsKuxBYkcMg0
 gDRKTl3ZhpBXE4jTP1cgn067zmND8To=
X-Proofpoint-GUID: E9a1vZ8XzUc2TnXnAzKmCzH3OU6PAz3k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzNiBTYWx0ZWRfX+/EY+vg3qIdi
 EYIeQj+35sykS0UOqU6nQWMbscb0usf/LUHjvn3eAHJwUwzrrK3+gWGDhf6fMieJZZ57KtFHAdE
 kw0hlt1GHULHmwRjxyT+hzqGVYlVbCOM+r3Mpc+34shutcBISBcKfrc5UB0JM8LEg8T/4tOQNR8
 eoYLVf7Fsj2b6MkIvt+Im9nrawDo9lHkauq9ZauwGqdLw+Fodh519fSnDVHKvGIKaCaDd8TEm7M
 D1oSTj9/ha8xaIXKBjE2S+c2bwcbW5iK265yJvxPqMyTWnG+X2IphFclirB8SAoxp18Ph09ndUN
 JaIdK8k++LZOwY/paP2LRwM4mZKhXlPUonOFbd1nXN63g8KDkf+wt6RETiPKPbL7lGjiTVPNkCL
 lmDWSgGozqA+Ueq4LzzzdkgkzhqdqabzicHG5pCfGonje7C0wGhYNVTyK1HRc/j8NevxXcdggLb
 2UseK/qmAtUoiv9mgTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090136

On 9/4/26 10:16 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the initial device tree for the Nord Ride Embedded board, the
> non-SCMI variant of the SA8797P automotive Ride board.
> 
> Enable the debug UART, UFS storage, the ADSP and CDSP remote processors,
> and describe the board regulators supplied by the on-board PMICs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
