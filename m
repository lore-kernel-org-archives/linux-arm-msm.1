Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AF52C1788
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614049; cv=none; b=HoqVX5JiS43XbSRL5Na0VR/60EXd7ChKI7GJ97J0zNPRmJnpH/VgazfzfbKcCSCkPhSO/4/SYy2ccpRwdcqaj7ZvKPSZNw158KFI8jDCBHOZF566P5iNVXoW5+O8mXTLSjS/I8rR2tkBThRhB927AnMf7sM3pKXjJXmdfgFASZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614049; c=relaxed/simple;
	bh=omyFGu7zMrBNkx9/hINlWGA7NZzna/VDrEclEElieyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gtb9J7CUt1VWJET8ZyNbf8actR61vgxnHHpBGN3CiDrKO+usvVIGeRaf8grCWw/P6HANEyunc+QZ88M6N0+gveGFSDeeaFd1KEkPy9/9tWn0DbTu9zA773mJwbSwAZ9W+gruPnTVdgnA2VJv+tQKJDoenkeQhw7nbEWHYhZEKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPuoBMz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xb6MK5L9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPuoBMz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xb6MK5L9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMd3VW2600437
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vmcg7SYP8ZXHyrIlBC+RXOu5
	dKQEPDtZ/2EtBYdhMEo=; b=PPuoBMz0iWjOZ+VEsY6UE4r+NR800lU++LYwlbrj
	+giumJsSCGFw9IQPBVUSkUncrCNjCw5wIKWY/ajEfrG8mK758GnmbRQV1eDveEI5
	kg0e4GKCMhRRsVAYZuB6nyZlwzzbhZ4LrSAA5pnMxmBPc6C7h1h451V6SWM5yDGM
	Ab0fuWGobxPhREqeCnxKjQ9ocYcjxCWy8fqYdz8KoUmQJMql1/V4J/EDxffrFkQu
	d4ijJkBxZKlmHDsnNYCofG0hB4haWPEykkBpLgTG/lKO9aMAEhTGk4T4VqqcvadE
	f/bXkGipQb+3bsjzVhY1Fkkzr0WuuADKZ5+OhaULezI0dw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb36jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:00:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so425887b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 20:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614043; x=1790218843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=Xb6MK5L9q6e3CzsZwj/pJKSEid1pXeXhC0tTbRfkXNB87vxuWfVZqnmQOPzBPjEPXo
         8QMMLqG84xFkLBMA8h3sPg8e8M6O9BWACvq1hYwZ3N2aRtBYutdzn/grjmjfXz/8meo3
         xBfLNQ7VKtMq+MS652n+weDHZQnBJkZS8nACprqBwq28wKI7sEFnjM+cv7t5qrWEZfQ0
         nJ6aVhmU7T3r7m1TjxIbTbLRYaapB8qf9NiRWhRGW0b+K1QKcisIIthJysaszwfFesge
         e7gXZy7YA4k2O+bBs5Gh4r4r/DeH4wqMRDfulW6TrfQRefkGRlA3lmukO6olS56Jg/61
         IBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614043; x=1790218843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmcg7SYP8ZXHyrIlBC+RXOu5dKQEPDtZ/2EtBYdhMEo=;
        b=jOrj0sJBxeiwzD0PeoeVc8cUetgvyp9Jdx0iA7+G9zCAxNzowWWMYZAgbTUtU2lGDm
         GNuv+2H+barFWAgr9EC6cIaqeDcWgqbmsTcS7L//rgdI6rlOrJd5PU5auXq2++rutnZl
         1vr8WABDEOAURitTzPwTUaLrt3E0mwZg/8H8kWw53o67tVL7qwiUyrcx0Ui0Ahb2R7Ui
         kCgP7DBni1NU6ZMAGNcVI9f3e4noug47Faon8fw1ATVYbjgaLserlPaD5UshSjyxd6jJ
         Sm3hphDfFia5kyteZxZct3bxrxh6+ZCxNACrKviUTIp8M5SNb+XlklTyyzLNwrC2vjcu
         /8KA==
X-Forwarded-Encrypted: i=1; AKwUvBwoy9hhRN6KWMNiTYKPYxyACx7cNDboNBo4VtIyTiDqyBTCWuAsGXwOmkMnKgwgJo+EzghhDrTzq6jZF80u@vger.kernel.org
X-Gm-Message-State: AFuF++nPMFrVXqyS2JXvpEGhZt3HCg2CIC5Jvejq6gQp3EIaXkow2/KX
	3AezgHVs+Z7LwultFilTfL68XP236fn5JEeXCeZ1MYbTGIoW0h6P57vzD7FkRVc2IY5TxqClbHL
	jmwR6ijEOcPuDNqP59VTJMrd5ZuCTsa+zriOSfV9gemDi+7BwuulbfkAhgdHfP7pVRJ8r
X-Gm-Gg: AYBFou0AANIKteHFt1BgcXr9MGU3UiZBJ6L/dluPYzv56DxcfiHPKvOgQ5/IYu2NeA4
	jHCdIJTYgL1Ysrs85C8ARF9MnxBFWmhLAP9nUT1eot+XwWgm0qhHYbzDYXWVSXzgquqhMpQHh4a
	NCF+eMiDOHt7IxsEem5lzYJjyjpMMf/dVz3CHP/O/m6m5PRVBa3aOZ6E0r9MZYX7AvPMnOeW24F
	poWp11KGqlpK7BQxvt5udB+IloHEj5M1mgXcS5Dv1r5vy0x55yoAl8D/pFApBSbL1wYQ+SujQDL
	XsH/kPbSgUvdJTP0A36c6608qW5PVyv7jMMlICNGsmfuvuPnoaGDWMAPmY/EBYsYvEHEwPbP2aZ
	alvZG0ncon/ogF/+gKNDyI5Qm6X+xq2Kaipl7M0vhm1k=
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853301637.18.1789614042946;
        Wed, 16 Sep 2026 20:00:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:430a:b0:3da:6bdd:2308 with SMTP id adf61e73a8af0-3dd5f5d673emr11853194637.18.1789614042305;
        Wed, 16 Sep 2026 20:00:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5ac47cfsm10357234eec.17.2026.09.16.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:00:41 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:00:36 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <aqtX1Dvi2uyCEdMx@QCOM-aGQu4IUr3Y>
References: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab57dc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4j1a0SwZ8iOXVT74WvgA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Of19GvTtqCZKk5FKjrQPWoT4fgGJ0GCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfX+gb++gX0Zt8j
 TAYO2YktgxmURNd/LGxYIf21AOBvqh7wwPrkT4sI8YcNPwJW5mceFYTPvRz5lCEPb1XJ52JkARn
 Y/p93WAUOTtbQawB7kl4AUQ1Iiq7y3WTOiz8p2kKnY07sgNa7ERbfEBnrn8Jf8oSDPtTqWJT5zC
 mP+o5tiUzF94jL2aZHBf/riogOAJPkNJdphIM0d+ivc4zzsELnxEYKWSMba651XqFnQChiVVjGw
 XiXAQY7NPHslk+vWqdVKFxwXYbJggUz6x1qDy4/Tm6Qie+xBrah3SSbpS7Si7ygyMpthakxS8J0
 jLsfl0EhEgCvPxP4pa/sFc7dIR8MG6BnA42pj88KLkAVdblPrabLhxdkHHiDRQvv6VkRbALK0Jz
 1w3WLpR3Ces3oWQy/Kv6FvvHtVz9RkjlIRNBsPxuy+6uxFprldIuijw8IUDMN1QeB6qc+cH1+58
 nYHnMWBFNyRPmnIVwCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzNyBTYWx0ZWRfXylwvH9Edj8Y5
 KkYOk+kV+hlGGj3jBH6OAx9nAtoxtR5mPb5DiA6oRGbgFHT+txDabHbYUz7z+neWwB7uv/78oEE
 /g69kzUglipML8iz0+99LAj3QJZSOl8=
X-Proofpoint-ORIG-GUID: Of19GvTtqCZKk5FKjrQPWoT4fgGJ0GCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170037

On Wed, Sep 16, 2026 at 05:55:37PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.

As the nord base dts series hasn't been applied, we need to call out the
dependency in the cover letter.

Shawn

> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (2):
>       arm64: dts: qcom: nord: add GPI DMA controller nodes
>       arm64: dts: qcom: nord: wire up GPI DMA for QUP I2C/SPI engines
> 
>  arch/arm64/boot/dts/qcom/nord.dtsi | 219 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
> ---
> base-commit: 3c60a5740403002069d54463b6b0f603b9ba08bb
> change-id: 20260916-nord-gpi-dts-40456500b7b1
> 
> Best regards,
> --  
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> 
