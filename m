Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CB47798A
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790252486; cv=none; b=YMd4m8UCHw4NJ3fCx6KwV+kNPegg78+QozS4BUf80EkMdmBcMsUII17ANCvFY686RN/FPfnL3wAT/mGSapWLiG+sooSnAjQDfeJN5oqS6A4tLTtF60iAv29VA+K/CWbZA1wALU0YlXMwZPTDxGxSeXNDomS0zFpFRgKl9Q4WcVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790252486; c=relaxed/simple;
	bh=/oZU2iXNo+CbzykkqU059B60grjKuzDMZZXc8K1zOLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTi8RNvRMTcDmA9IZs7NP8nXmRKSEAy7etjY1FDeUQ/ECqq+8ab2gcjmIblE6OUdVesEXEW5Oms+UwDSabzdpOTK5ciXOZyENWkGHhXWayNQZHGGjW2eNyf1gG/QdWFJPmdLm8uvzrNNwjpEeisr8poGWZvA9kL89H2b5GyQB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DwIDURAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PoGwP84m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DwIDURAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PoGwP84m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4exW2594252
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Zu8lIQBQAtkKDY5ZOhEFQeqE
	h8xnZLBa80Wnc032cXA=; b=DwIDURAf3JwI4tyvVuY6QUrW/mZl9y0NIGJk/eEL
	Rb5yiftOILdAVYji7/lCyt8liyn3bAgOvI08jlRsTczxjTW4jhL1FEWwSjnkDYuv
	6hEktigVqMM/FDP2qXdHuqD3ddtBlObxxtHuxrV3B2QJEUc+oaSj/8X7R09bX1ib
	zWYEFKXE4cVYPNrR3K+yo26GV+OctG9VHazB2lH3P4Cfbg4Uixl/H0r/+nDQr5xZ
	dtyiwaYgjeMtGgWKJK1J2ai30B2OiGHvgnjgT6bftWaqqicXbRhUvVPi3aUQJQCf
	Cy5gFesTwQ1ugzgI8fj7/osxqUihltNhPB22mWYe9kZOCA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjgg1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:21:23 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so599134137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790252482; x=1790857282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=PoGwP84m9d6004RywTkznlOvfAAkhP9Fhyj2XMg6I24bZITyYO9gkObUcGE9zSIXGE
         fb53IwwQJGVMZiKNPbSf1C44HNKS70UPTESWQqgA+ZHyHfWWkSgO9gPSw/3Ule9aN6ub
         l+BY13ImaH8vL/2l3qqAHZcfJskyNqXX//fZE/Yc5Wmpe3e/iuXz7MGRb04thhDOVlk6
         898zEfPpmpxaMAn1c55agpkFsHoD6085KyWMkVLFoSIWUaORz1oqnzDOcT6kOzhCbQcC
         G9fIiO7D6AzDcH8RQvEwJkpxdLXzMdHQbsFoNmxG4k3D1Sc5pXcrwtRdSzxlYlcnsaCX
         Fmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252482; x=1790857282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zu8lIQBQAtkKDY5ZOhEFQeqEh8xnZLBa80Wnc032cXA=;
        b=E7HuxfS9KTd+ClU5K876Yrw4rhoKUNfWp/m3TtXbzCzWIHSgxYNZTIRt/m0294V7ri
         iBW14po6nuMLGTo68V9DkDJAIvn+01moXbYBPv5EVHlDYS3j2hTOwdk7wvWGv4eJyLGG
         JFEylzJMGcyviNcFjsKPVPd6W4CMjnVEbHcUZ7e5tFvB1bAQunlLny3BrZI6X4rHouvT
         TlWRgTODQlJEIhRZm1yz60fv3UsObBC5qmpKMQKK/8h3C6hj2IqA8Rd0Q16uLV7JAvGf
         mPOHjYD6iP5Ks0gi1gwPTKXj0MeHzDJHisjNyblf2slCVgNo63v1KLfum1GGvdjDaQ7Q
         xeEA==
X-Forwarded-Encrypted: i=1; AKwUvBwNGAq2000VPYfqRG52nHtZG/lEqlhGnRN0Fk7rAcyT5+66mK6sxjORNswKh/4rsR7Fjy+L3qjmvmCuB5I1@vger.kernel.org
X-Gm-Message-State: AFuF++mRHf/u/41EzuVsxaW72jp0vUJqEEDBUJRO1dOS1MesdxW3+fDX
	T0EA6qtwjqUhM3amY3GYU2Cgq9SFte6Ch3FSLWwaX3KVOU7IotLfUQ/ugpMhIcn3PEsuCrQM2X2
	lLbiWMujr2KnFpF6liblv4o2gCNmCNDI8XznzFgXvkQJ7iDqJBIDeQwMEqOjUlk1yHUe5
X-Gm-Gg: AYBFou3jjcdVPbSXqE1yQ0kfGjOTnTWDsll4ZoJ+Ok84KmfP+TRL4Dw4vNbwzOyKQ+b
	xGPOvtGgRaEniUtSLJ9JGvnhCCmoJYK5teoQPk3QSnEUf0rGE5+eOtA2XMmnLV1tVNZvXrSyQRG
	j9jkGpIKbrmn/ZN4kIURyePpWLrVudHwMQ9nyq7j+uCpdeue+lxq4TIKTAOCT7nwNct3ilv63rM
	/N/LN4kAjxs4sy7AXwpv2bLGXP/z5+yNFk1jK+YKgXKcO3DHcv5LGXxLZGN3RZxvfxdi6zx9qpP
	S3PDhG2hCGjHyKwXT7kVtReDU6vvpl6pWhcQg5AQwvLmDeeh2gVYGWAiXWlh9cF6XRLhCDa5w/+
	VKPX3PQ6n+dCDnnU=
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088306137.33.1790252482086;
        Thu, 24 Sep 2026 05:21:22 -0700 (PDT)
X-Received: by 2002:a05:6102:3706:b0:7a7:19aa:f0d4 with SMTP id ada2fe7eead31-7af1f619c90mr1088279137.33.1790252481364;
        Thu, 24 Sep 2026 05:21:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c1fdsm16655704f8f.14.2026.09.24.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:21:15 -0700 (PDT)
Date: Thu, 24 Sep 2026 15:21:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <nv5stigwlyrwgpdwo3d6ctmqfopy7tgdrnrhvfvwxxvz5yxwtd@4kis7hnqw4bv>
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: afPS6ixB4b1LOk1XO30q0dkxXdlbII1E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX8+9gD9LiOnDR
 WhlVq80jNzUYt79GYGvZUlSWJ1LhJ+JQ4hk4ugNOg0ch3xnTSffzEzaV1K0cbM5tOcxYUOQb16b
 Q/b/2S6DVQtDjP4wYVIIcPGbBRqdZ2ACorvMW6bOr7V692L89gJQkjGTLWTDsLx+uGYnQZjzAhd
 QJ+DavGkLLOaNEtj3dJkgtqv9Hf5CZqgeo+ib+dADlHJ3i0p8trBGWG/EqBa5lVVbNqufA7C4Bg
 O2VThhUzfOegedbOwEH2nghryY1TEYAj8jup/90MGaidxWw15squue4dReq/ylautLZa7t8LT/a
 8Xf+igR3iqTeSQ91Sjv5YwxL2VMe7BOiymUQ9ZruXaKuL3nDZV7RhawuG97NzhIj9ZGE28ZefVO
 y1rgp8bxRYq8QYenf+1+uPEFoSr4dQJEA+21OafYX99nvB8ZdR8YOfxPICpTUpl1TPAwwKHCChL
 lv6c0MnBO8Ba6c6Ssqw==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab515c3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: afPS6ixB4b1LOk1XO30q0dkxXdlbII1E
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MSBTYWx0ZWRfX1tA1ELKncQoh
 kgV+HkyzDrla2OcqH17WF2zlVhevREtvW5Gu4RMCWKiMwN/PrJENsHM9ycM9B6mRVqOGeK1eWaN
 c2WVp+dIWw6kH0q9sOSLk+5A++XyBT4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240051

On 26-09-24 14:10:03, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
