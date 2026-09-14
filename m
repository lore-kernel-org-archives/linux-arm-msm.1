Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116DC3EF0A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371549; cv=none; b=UQLY8gnTuzjnjGdlTlpwW/Scv0cT33KQLjMloAWPxPU6VfOXI99O9fjFUGBdy4GLAOwqCFM38zaOm+fj++xBYk2zrfAVNM+pcklK79/V5w0M1pa10ZZqwgI2uHIo4f+w/3iH3Iu2R25CsYKcZYYPpglznF3rMOWlZ8ikMwbgEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371549; c=relaxed/simple;
	bh=lPSKOLF4HEIse9WLPJPgQBawOJu8EfJdJjYwQwdsMOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCYElPvvHZUb/jJ+UtYD4Qe1dpHhVsF5TDD4xZXBk7PTpP9m2HBrLy5yiqO/hUp9+5KK9/kf6UUkY6PBoNBTjO1B1yMhmT06SauPrNCa7gXmNe8pqjYfpdxS8OhGDq+aPMd+O3CjvatsCiO4FceKT7cST2DSu/zNDEiTd+9ok8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHFKCBM5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrTKHtEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHFKCBM5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrTKHtEn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5imL8793401
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMOipzmvJTy8aZrG+SejtUux
	PskCA0+RbWPXbMYi0MQ=; b=nHFKCBM5bztJvOS1cIRinlPY4oqCTDHAwkrDPwK0
	bSCamQ7H7j4ESPxESDwuS8JAf0qGi8HSKdkDQP/n7lUmAz1hsxRyCbYMW4OKwFgJ
	/HcFqed+SLEJfhalQtuu7Ms4oKQ/PDvH7Xw6rt3Y3C/s1p8qOiOSg7YbO5/aZHSY
	5c2kmNhBeukNSZbmPgrCI2iCaQqVpyEP3Zd2qOSzN4K28rNQ668zyEVP2BJiKW2Y
	NRklVcl5W064oDm7//c33TEPSfbf9k6B/LkpmJlCSc0oBlE9JVYrvJfPX8+bHo2w
	5L/lluQzg2gSXy7TJ5S3vjXFaXd+436jQnyQVRSufpqGHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnh91-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:39:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so555621285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371546; x=1789976346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=HrTKHtEnUWunppApeSSloO+utSIQOELwpGaL/XLMtyieFRdgU712TOkiWSyv7+xy3P
         6tO59OXJLFtyQUY6NbQ6F76SOYp19lm6p0jH3XMykUk3XNu1cr8HJWtV/n1pgMFNNT7h
         dfpV1J1+mI7AD291XajjIPvuKK6C432u3AEL1xRBQm0iVLK5hVtflUTTNzyG499tA1ZO
         XY2tW55rg26D2FLuzL55tL4Xt5dkfMP2hDBkW+4bpigi1z5yQqSk9Q9nZJSJKzSVVOFU
         pupLpCZklyDLsIhW/a8uUy6Xn6brStwSN1zFFfmOeLRKWWA/DfvwgS1qRuCDQYQ3GdVW
         emOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371546; x=1789976346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMOipzmvJTy8aZrG+SejtUuxPskCA0+RbWPXbMYi0MQ=;
        b=niYJLyLnBmFZXcWKtegFA6C5z4Ea0OCg7HqnZcjSjG4EjIGKkbuOEhLyQ0nxFd1ZIv
         gLMtz9yAWPKdjDheLOYnLNPMdrXOXQOefpkebAz1niPqfO/NFMRQuHX1w/N48LUNyObq
         v6TykGty8vprKT+BH+PGc8RjeyeM3ojBermqI22CvAs1R7jzYkU+YYDmE6OfocgqYMMi
         xROp7DobgEYvKmujDuyFC+q7XovSUMq/3ptDNt6Xl5nGCTgeUmGmvrnxYVGHLTm9Pn59
         MywXsiDR9DyMCI8QqOu7dfjgLxioUj6pe39xqoMJQkM7jVC8BTsErndhpL/gNBVBvApz
         RMeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxO4BH7QakHqjTBnf4iXB7z0CYUXEf5zVu6fvYhFH4Ws29a2MkCaTKR4PnjQ35nf+ivALKv72h+zPwJtLak@vger.kernel.org
X-Gm-Message-State: AFuF++k4s3IkAZ2Pu6foJX67vxksFGw4eYkKGy5hIxK5OtnliG6FZsUA
	VGihUrlkhBpVLoxZEYnXpUvsXsYJufm0WYxteoek8VUh3vR+cZIAsHKld8jIcgjpO2Zcj37COKW
	yULojMr+WjJ8O20zuE4DP7qT1QNoAfVGmwwq8EmW7ZK5nqAzq8I2lcelgPFGn5xMtHvy0
X-Gm-Gg: AYBFou0kJr9KSfz2f74XvTn6Lsw81QW4UNEk3VvpMt1OMde4bdFRqRfNYlzm/vJOlmW
	poeRklv7AkM62syIHdO9x4LF2QU316FJt9V837Fz6MXlUTyN3H2dblADr7INKdw0NaUy/JV8G64
	92CTGk357QoPhm+gLgu8gQhhPw3psjoTPtKNxwzNIydvtXvgDTzpRe5xW/RcuTuumfFdKT57win
	0ucJ32dBasMWeIGHN1hCjMtUgnQR3SWpC7QVY+xa3coiRfYj9afSrU3jjTrg7l023ZpbUj2lWDt
	AZ9NHQYE2Hb/WPvVgi0rrk92f3Emsv57TjJOlNHP9KozdmkvzpVMjFYYakUZPNBH2FHoJi4Sigz
	0bj0OlIXAYDA/nmk=
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207450885a.1.1789371546249;
        Mon, 14 Sep 2026 00:39:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4556:b0:912:1206:ddd1 with SMTP id af79cd13be357-93a2970976bmr207445985a.1.1789371545682;
        Mon, 14 Sep 2026 00:39:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e71adc2ecsm168282475e9.4.2026.09.14.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:39:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:39:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
Message-ID: <eqvy6im4sah2nlull5w6qab4llvdhtjpduhz3ujdqrswkj57ui@s2odjdj25q5v>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1tyhOwib6CWS
 3dTwXDmDC099bNso15SX+iyqX+k2Iy7hFeUY5uorFcSO7uIWV/0+rPJXYiw8AYZ2INudzVEy5B1
 yFTQdWDCHNJgtkueRTfSbr+imfK6WdgptxAdwQI3qbTWrztByEveAOQ0Y6Lv9wHaQt58S7PePmO
 MBXByw5F/nO6ii9EQdNfnBvS+KXS/V3DUTUG4cdREdMCMII8EHpRLBz7ZS/Dsq1IL8Vg+bFZpGu
 r0qb4UiwkRDxnffOysgscRQrNofn2f22HTUNfVrVIX3+BdJ8hiJyKGR6mEOyLCQy8QIoKhUoShL
 zvQdCnln2mNztqYmu62ILBWbuuJQfjOHfXWt1bn8THNPJjYFpj87y0eXkwkGWH3jgrxWDRGL2LY
 8BrBINFd25Ag3/vITgcIYrGkJ/1GIJZN/TTE1bjbq4nSv6pxgvwPCUDkZLFGEvyhzck9kzBhCnz
 UcPl6GvXcvkssRKpDpA==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa7a49b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXwGeAWJf6aNau
 IElyI+mdVC5Zbob2qWqfic2hIVAv3f2cxzZKAY3izWmO1ClClfPslV9BJ3EIMdZvjnpaTnMvKPk
 wVDewdBE2nQNcSKQoI4w37Tr1jN/ejA=
X-Proofpoint-GUID: ao88ocwzkErgR5e6do-_cVfTN4jPlbL6
X-Proofpoint-ORIG-GUID: ao88ocwzkErgR5e6do-_cVfTN4jPlbL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:45, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
