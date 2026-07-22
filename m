Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A30335A3BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728054; cv=none; b=St9WSSD7pZAKZMbC0RyRmfAiYRswn8Si4N/OF8hC11WtAZ8NNl+vJqJ0syBrX6c9pC5BlCnw5TrGPwiJBVoASCzDDP7gFITAc9OGCY+l5EZ5fIwWudGuzd9UlKThtO5y/tjfaqRgWUGqgfTH3vVvJiLme4+oo+UCNdVREAEbhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728054; c=relaxed/simple;
	bh=wW0T20dhjKI+T4OZcylvOHh0DUZLhH0N1xi4ZsiKy/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8V41Ni0KXDtDqQrj/fuDDcZdkORH3g4/0h0wgAAW6ZOh6imRsbXcwvPu8yjdfS1fddUiKYWQsFLr77Cbe9r7pNny98/P56GZHx7JlgC4mX2Idj1TSnriRY9U3MWpsxlhw/IAlNrzV01ZbgCYtHszqAB0zQTcqqtfXiHtGCcf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2oVv7sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1HTGpQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2oVv7sd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1HTGpQY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWXhb1027199
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SLLFRlAXF6EMp+4dl4HjiUGz
	lwmcmpB5EGdULOLx/BU=; b=B2oVv7sdHgZcuc0bvUrB2ULhZz3oIPfy+SKRLmNO
	ILd8tzRMBTdPFg6czzcyQnNA2HxH+HIlSAJkt1UAa5A7GbWv/JiYtOvYoIcFSKfn
	v5vRTJ2PJeJL9UIRQw9V1M+shW9TYKPAJZiWBrLR7Qwmob8q+Ftd2Sc1bICqLL3A
	w1HQhOrKSFF8uuToY8fkyWURB6Eav/dQjXFWsabwo7AHjr+c4oCRFK7oGxN2Nojv
	X8AyMiYqals62SDQPU+FLMUu427iI/MkyqrlFC7u6Dnbw2jjSLceLV4zF34zVb0s
	xw8uOu+UJ38J007G3oi6vlHARorHXp0zeSfYBwMCcSLoYg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7999re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:47:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73986bb438eso14351793137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784728050; x=1785332850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SLLFRlAXF6EMp+4dl4HjiUGzlwmcmpB5EGdULOLx/BU=;
        b=M1HTGpQYQTxhAAx1CpUXMU1rkB3NCu1EgzRpCABhvObqH7lFdHPZIJ7T6cP1Ff5OlU
         1qjKA9nXlhL7zJgFgVU8RRsdIVibZ0YSPh7yKtp0mz8Sf7oAz+30e3FJ9vyMk+VjpMmG
         hAmKty7ee20CU5FrnG5Gkw0WSeRBexGG1+ZUgBteGCxlEJ4YuzNjB1ropK7xYTkrUWo5
         A4FrZLcwAsEDUZC0csvTqA8Wwuoi60RyCAM3G3mpr2NvsohFD/sEfBIYHTpPBZ82JSU/
         /FOx7gSQuf1fTN6Yp898ZBvMfXMgMbfz991Khz1gYYWsseg/bPcvW6q1Rg1kbbWQXNAu
         1jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728050; x=1785332850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLLFRlAXF6EMp+4dl4HjiUGzlwmcmpB5EGdULOLx/BU=;
        b=TS069509NMCRw+pGpjmR0ANZT2hKlnMF/K4uZIgqISzCFqS7KSBNGrPzml7NMnZ1k0
         eP940anGtvyxElk8NUnV4dH7jeoKtrUHSwUZiQ7vZTYH/DhYZ/gJxteixdp2YUlx2dQV
         Lfpjj0gVb1ttqwrWdzUbZO9ModrGYNAdOPgBsP0DEf6hvT2iXdx8cTj2aPhhcbwp0VVM
         jjgB+GVwdDuskcn7i9EP3Nup20/GfDa/kApe4hPQTLUOETW1JgKClDtr7q3b3k2XBUGg
         m7T+pumvjRMgYndMSeopXL0kEy+DWSnmuDt3AW0OQaB7wkNKensCyHS/4A3OVrDvouVl
         QgUA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw+1Rolvoa/NfmQs9i/jtR8zg3e7lO4bWeASRvLYucSadhpeKeVAaCVR+jno9Nc7KwRj2sXSbgY3C8hDXS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wSjHdY3vM+rmNABeTi9b63CWihAkbmMG6SNmuGQkigHlAjCF
	0SdIe8tjSJp3+wlxK5/3FH+g+U3qbyIwLOdz2Wg4kp0ginIT6T0PuhqmxC036vwOQOgzWnzu1go
	MVcmZuLZgBD3Jfu7OX4DCguUj0dNgrv4o8g0LLfYTG5o9Vmhd8U10IxpCzlD21EceTVMlF267+R
	H2
X-Gm-Gg: AR+sD115a8o8Gcb67a8mez4C6I/zoct+iPPjMGU80ROSVTxYq5Dg0TpDS8Q6TSU5gzM
	5FM0DfHtTyUpk3Q35xoU9glh38B20v9WRbqvEhiI/b3IvknTLHKrwfwjiaWimWVayYUn8uZ+HsC
	Hb8whQPPmC24yUrZ/tMa6GIWppTZQQ9gJI4/fr8fRhc+fXo3rrYxiZGMiVW3rk+EXDaEA5eMcor
	pWyCelCFPjswDpAkG5R31fRsE20UmcaSEsO6TL6IPZQvboAd94fDYUzGD470FfY4LZSApUYQNs/
	aG5B/fSXEp3+FPZIV4jEhUe5r6E8n6SNtJKxWdF8kt60Yjg0AFdItAY/yjZ9dHHJbjwOC9jBQpY
	YYd7/vSG5FpU9J9KxoDI8r3CG716ZHvTp3hA8+3is+pLoJwDe0T3pPrggN0bxRi2dMUUJjYFwCY
	0QqiK5E+eajXKT5w==
X-Received: by 2002:a05:6102:5804:b0:73e:5068:823d with SMTP id ada2fe7eead31-7475361cd9fmr7968787137.18.1784728050141;
        Wed, 22 Jul 2026 06:47:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5804:b0:73e:5068:823d with SMTP id ada2fe7eead31-7475361cd9fmr7968768137.18.1784728049555;
        Wed, 22 Jul 2026 06:47:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm5151641fa.10.2026.07.22.06.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:47:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:47:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
Message-ID: <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
References: <20260719022242.139472-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719022242.139472-1-julianbraha@gmail.com>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60c9f2 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=MPo670fqA4mZBiISBWoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: kYersExYnM8I7NqZ_Ssn6Qmb4VRhFV4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXx+tyh33chZhv
 u872AVhU45knS5DoTTyDidi70G8Zb9DFo6vtUSig3i0xcpqcmGCB83dMu8r365fqIvQtQL5AGS3
 K1Es3AbmK+DJcHqIK12DsVQaBLCLVKHNtKyF3zeWqBtf1adZju1nevWBvNTTqVTof8KYnIIhfbG
 3JYdDivxqtvyydioFbFKXyBeW0qskyFUyUzn01MO+/xYshIaNYiFV2+FRsORavhPmMJhZdhONU+
 YPUK9wYM1+sNf+UIy1vYaP2IJ8Y9iGUwFpC/X6GgT0Bg4ksWAVQdb1w9MzsLXWt+D71LXNJY4Uf
 TMfteGbxbD7wEYqzo+u1r0xGdUIepSXwBvhJn0QTfs9n/7ecNmC5j/8ix2ZfToyZxrcNfzDlsu2
 zA+5NxuKw7kZaMjQWtECKBwR01gBPtVk9MJBM1QVbViXC68a2FRC9j0bwGmVMoE7yiLQtyonbRr
 8ltWYZJX5XwQy9MC/Pg==
X-Proofpoint-GUID: kYersExYnM8I7NqZ_Ssn6Qmb4VRhFV4z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNSBTYWx0ZWRfXy6Q0sHE1nrzL
 KFPmsHc9YR8ZTNy4sh0VjwJyP0t1YE36IeX9QeO86X4TxSYe3JRd21EgBgLFQYHd+yd5/mNH/6b
 tuZSnloL0sxx9BVx9UHhWi8DHjhxoEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220135

On Sun, Jul 19, 2026 at 03:22:41AM +0100, Julian Braha wrote:
> QCOM_PDR_MSG is defined in an 'if QCOM_SOC..endif', so its selectors
> QCOM_PDR_HELPERS and SLIM_QCOM_NGD_CTRL also need to ensure QCOM_SOC is
> enabled. Otherwise, QCOM_PDR_MSG has an unmet dependency, such as:
> 
> WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
>   Depends on [n]: QCOM_SOC [=n]
>   Selected by [y]:
>   - QCOM_PDR_HELPERS [=y] && ARCH_QCOM [=y] && NET [=y]
> 
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
> 
> Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")

I don't see this commit in linux-next

> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  drivers/slimbus/Kconfig  | 2 +-
>  drivers/soc/qcom/Kconfig | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
> index 60b0dcbc0ebb..5dded61191e0 100644
> --- a/drivers/slimbus/Kconfig
> +++ b/drivers/slimbus/Kconfig
> @@ -17,7 +17,7 @@ config SLIM_QCOM_NGD_CTRL
>  	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
>  	depends on HAS_IOMEM && DMA_ENGINE && NET
>  	depends on QCOM_RPROC_COMMON || (COMPILE_TEST && !QCOM_RPROC_COMMON)
> -	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SOC && (ARCH_QCOM || COMPILE_TEST)

This defeats the purpose of COMPILE_TEST.

>  	select QCOM_QMI_HELPERS
>  	select QCOM_PDR_HELPERS
>  	help

-- 
With best wishes
Dmitry
