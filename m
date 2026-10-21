Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585038;
	b=ETBgC5P9tw19WXroJr8wIvgI1KKl/7XLgY/A1vgbbDH7PznKXRFk6oXyBJ8tYK3C7yHV
	 lp48+4ozza1jkVRHDbpupogB19vJ0Kr8joTW1Z7tk0/w1Wyrbk2N8rnBTLHFy0kqtYnr5
	 ep3OuOTMeOAUkYs1UoaxaVQOSv0Aqiew0eWJvIXYw1YMVc7Rmazf7KmQ7wjylPXU7ZaoZ
	 fhEsmBSgEFtxg7oaPfIprnViyZBmjOUW6ph8Xb9Y82vaGllO97mcnh0QwdkaNP71OVHnJ
	 4xQa8h0dn//GO50qLRHJWWDP3hw95GIozEYnXMzVZTDRIRgCAcFUOownrmDW9laeeCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585038;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
	b=OmDVStFnY+EbZR477eFnlZ9KlwlaOvcf/GJKu2XUJVRIBiKoDw6Gu3X/WwnB3vd0OTUD
	 xmjOZN0YIKUoVTD2oNlLMqzsP4NV6bP4h+TmyM3xkQw7EnBVhV+0Damyfv95+mGVmey1c
	 2ePtmNV/Wfzf/wurnwIWFckKjih+xec7eNKP6tf1nKUb9EvCMlCxJuVY1JslgIjS5o89L
	 lRBFtny3pDAfW7ns00PZGrcUSpAkY0nhw1Z+nrW+bTvRwLLMwGFQfmg1gWeGwM4QMxEjF
	 vUgmzZIqc/43KxHr86qi0wrw+iVHlDTN8rPdHfRxPwULcax+d4LctOPgeHlZ6kVkuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD498606AB3A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD498606AB3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VDGEkuej;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FF7OHOZX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7Yb3830241
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=; b=VDGEkuej7SpcZ/Z7
	6mt3tjOhU2/wQB+7cvJ9tIplO4hG1w2wpWHH+doQCrVTjZk8M+t4oEtYcsFABUQ4
	oQgtj/moZY34KoHzck8DyWbP7Cdn20nkBmX4sLUpEBMfX37bM9KK0ndDEAQfFi1m
	plrxvk7na+nJ/1nSaLR7/lIfcNZW7U+gRayTt0bce8S6X8c/6JLn68klftcPI0xc
	HHBNuC7c/xu9A1F3EPIwBtxNa82kQlCtdUOZ2ap2zL7M1eIEFKqUerUdLAwyNnrZ
	SbdkORJhD2Fd2dqnjVA4WuVww3BuTISTENgBhG/GIAfTvNLFwTSPTLJhrIVYocZj
	Ebo7yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd47s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:17:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso6553785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585036; x=1793189836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=FF7OHOZX+VnMjUc86Jh5Sxc6tBHYOVWZm9/CHe3ZLgdZYKXwT5ChxMxOE+y3PB0rfP
         /q8uAeUTkZG/Qe8zjee9gahRG54cuayhFLboaj+Ccz9LIl7yVIBJf7SKt6O7qkQZ9MV0
         CrbHS2gaFaDyXGB9g1v+bYYI8snzX34vEsFwyRkCbcpmSgq9s+i8uLQ4+mcHSBoizwhz
         NOiWBD94xQWIbE75jAaBsry3Q9lKCrjkkRx/KtvMa2r1y7nWcZMDr4LYU4YNC/1VqNcy
         9H7lG7LkleCYsLVzWSrastiildGqd2C3EavonBGGpID9zw5FGJmvKDrmnYEV7QMZ200k
         +UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585036; x=1793189836;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF4COE1Ae4LGoQC9tcDTAC5sKVXGVzKdFIgFJ5d633A=;
        b=JLCwliajWCPdvJ1sdufqkO6CmmvEpRAiDOK9Ff3AKdfezCu1Y2BR9wx9nt/cZVqNv+
         gh/J/5t+A0Q2bu/nki3HhbhLWS6m+b+2gr2LmU19W8U56pSk5h2Vfx+rUadMk54k4Gtc
         Ahdhz76ME7gmnBjAnAJUK1ZXo+3Dl7cq/3o296mFKOZLGrhMmoFpC5u2SS+bRBDbeAum
         zpCOQU8mExQJNXklAcC5wd32PYthVO7ezWjvmsEFXwa9wKy1b9tvIQ0DpoP0Vh5LZPCs
         XGJAbnHOZSiV5d8GtJYiLnd9vV9bQ+5jzqLBNiD1/idTcZJWKsKuwADlOwdHpaXY4XZR
         KOLw==
X-Forwarded-Encrypted: i=1; AKwUvByx2+4BFHHT523NBy2NQjxySkusk/NM/7mvglqErZE744vsK+iSf43Cu7QOD4LfPwZMOJFp6vpM+TgTxZBE@vger.kernel.org
X-Gm-Message-State: AFq9FYLe7BUWIWbj0H2z2IdhIPiwZO34APIgHbN8iz0/OWU36T0U/n5Y
	NfmfpzFZ3FBYoezqbPT7iyZm0Bs5UCUYm8RLYFWABqsVbon7Rh7/Hw6Rs7sLveut+cHLnOgwzYv
	D2sNhgY+pQdtyWRqHytHZC411M5SBDwguRe6bIHWeHLKv+y3Ggjg7vrX8uvJah2EqLn7K
X-Gm-Gg: AYBFou13l9fUIM/Wjamio3A4j+Fo7P2ZW5cLriCtYBwjeG2jgT9a4Jnjol63GEYXeJX
	WdZiarA7+99uYcKoah2jAbmH8bZ0Zag6IFL+mb2g0Y0JXvqQ9z9VVO7C6FQNFADBjbkdI/e9GQP
	lyfI1Mf8+u9VHItR0Nn+pI+3xN8J4sz39BNTwcD9o0/Kb3sSiuyM5e298H9CxGAVaJaLqjkgjaJ
	bzh4LmgNkrZATwx0e406Lbku0SaK2bFXLWt8JywBoFD/+nYBHcmbH+Q+NxihN14In5QinoAO3Um
	hkFoXgqHCqpUU01sNFl+YGg7bT7mwi8OYFz8x4fdkK+O5Ir8TKh59Qyx1i3IXFKzg16YGhpcwmU
	W4r4z568d8+pDNHihUhJV/A==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469812885a.1.1792585035926;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr469805785a.1.1792585035047;
        Wed, 21 Oct 2026 05:17:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm789326a12.27.2026.10.21.05.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:17:14 -0700 (PDT)
Message-ID: <bf792247-69f8-40c1-bbdb-c02c5a56fa46@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:12 +0200
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
Subject: Re: [PATCH v2] arm64: dts: qcom: nord: Add more clock controller
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924094448.1030807-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfXz0r4W6LdzBIe
 r8bzVtmxjmpU+e23cS7WTT1xUSKHku1yI9shetm+q4JD//I2n71oNxSzyLh2ofBx8FvlAdrO/Cs
 gil+umhtnBb7F3VIQZyHi4i3E6FOz6UPk07WNTimhVy62Mzd95JoBcNkSzvsvRt5quHkcK1Svlp
 f8t6bQUkU4d0FqfW7toemnRjvpozi+C7oEP7sI5NA/IxPPJEac5abkRGk3uhDOXGRxYPLKFXkC1
 gd2K+pum+DmWbbXkeruTEz5K+fAlef8yOVoQLp9tA+zufc5Py2UMdorvRN+RYgLS3azmGtGd+s6
 Ep+O/LK+B9s0cyO5pJloegMmFjRjFrBbgo6ocXQyiT1wY5kEkWsKQesc6RiOCNPpluFVu826oKl
 JbcPsmkCDTjyhNu6HY6GDOtla8U/tTUl6OOPoLu102PwccRcyAq/lESY6nZEajITGgls3k4NcwR
 GNBgI8CYLT1XyDwPDlQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8ad4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sJXE05e3qEaUFtzxEIoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XVlNf6iigQ-Wd25VhSgk0VHMK9JTgCEb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX+xVR2c4r7999
 gWbXivd+yAoO43jm45z1sza6KCqN0LwV/prwwrqmY06mwSIsAKpUDS5SlmwUP+4VHdg6tNKsG24
 WWMIsBviUYvnnAg2UWGcRR4Yi9GfHPQ=
X-Proofpoint-GUID: XVlNf6iigQ-Wd25VhSgk0VHMK9JTgCEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210048

On 9/24/26 11:44 AM, Shawn Guo wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add the GPU, camera, video, and display clock controller nodes for
> the Qualcomm Nord SoC, along with their required dt-bindings includes.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
