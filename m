Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63233F58C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787288890; cv=none; b=gLouGKgfiVQHek2Gr8e1Gyy3lunPK+vQZ/IB4w0OYNzyZkjLuWmSU2nqbD+77asMRjhKcu0NKwKKdAvvRYSctU2ZsDLX0lPLUPUUF1b1Ay+A6w2KxpD3M7WzeL5HH16bC2oBzukVOwrM8nTJcaaGTbef09xmaIu8L5lJ0QRnDuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787288890; c=relaxed/simple;
	bh=VFeTyvhO3dmwfO8/6BCC4Nh6lcOqlAhTyVOUCKEi8ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO8EAj0llanyho0Dg4mSelPlRlHbDSPa1JHy+i3mJUgu7oww1DW51yjLegX2BTkjza4XdlAxOxDCfMfEisZI8qcK/I29AH7ya7YM9aB+mQGSnAfX5E5Ba+QAeE2rqyma5YFJFN0MJPikJSiyFTz2C41Cu7sl4RZGEqLTUhsF4EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiswsLLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+T17uP1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiswsLLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+T17uP1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21ob71344340
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vsvEYGqnRFfavhS2P43aITAf
	JtkIa0wv/PeozpVLNhY=; b=GiswsLLPirg0OW4Eb2/RelSxhNsIkWVD/MpY/noi
	R0LFMYaRKTkqGX/rpkOKdWm6ue3a8DW1NoQdP334r1XPNJ2qt7RoVWtny+18Xejj
	35TDfWWxVOpZsdnbeNdidXzpE1EB+TN4wIcixtW4tlE7XQzFVwKC3LTtXniIWagm
	hOqY/UJ6TrSgi9+n/Rs9Br6FsOYQ1rLYfOz1AuQD0hqikWA/PJrBHueq+ovKl62z
	r9i8H5WQuCrlwA/kTA2HVIUVvB0edQXsW3DMpWwDcdYr1Vgj8hz/s5KjreYhdEnJ
	2eIo1DszuBBi0oD1cnZucJJCMfkBZrv2SwlrwZNGYo62nw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8c99e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:08:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7475c666b20so612468137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787288887; x=1787893687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsvEYGqnRFfavhS2P43aITAfJtkIa0wv/PeozpVLNhY=;
        b=Z+T17uP1kVuTcfCr0IehWOyVjJwlwzsypwNVT8G7V2kkZzt2AeKiLAYQm+2t2gJK/a
         fmm1KfwyfPnd0uky5lPkffSlSE0IsvHG3zuTWsyGIE6Ivm/SpkF7504gxV9sSSFx1SPO
         OSyDjariS1Y4jzesG/fSe3yUhHdNcEwuumnA5fmMTPbb6oSlhUECge0zjT5ZnoW9h65x
         mhgq0RfLlcQBShp8mlhrpht9MGDBcWZc2L9uzyWKoA+dmZCAlGSXsawY4HhkBeBtdzjc
         8nZig4i+/Hz+h4djwhbgQ6Tmnf+tJw9m7XqxGLRVvPuk6oniPlH4gOqWsXSJ6O1jVrsp
         1Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787288887; x=1787893687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsvEYGqnRFfavhS2P43aITAfJtkIa0wv/PeozpVLNhY=;
        b=LLk/aSi9p0JqCo9C0rsjIq6oFEwbOcJKimvedgqbYbDdN1P0PHK9CgOqDDE4rLj24w
         E4P0S1NAooG1k3tzgHg6MbOrwshbwCJFR8BOxlM/rxvz0F5/Tq11fIg9+QuQKXD8RWYa
         +eH0fW/WnPBaR38ducjOnqPsRbg1HdelOMw2nLrEhWLQWZq2eNBQ6uUshVgcUfkgKghD
         Xbj12yTaWSZVV3J42gdhrqChWeXkXaMCL3PNqgPBFd4sZe+Cv/TsC48LwsCbedZpEjcq
         MfGBlGXzBSz8yR/DAeZ7ero/w8P6Va6tJ3uFhVmKlUMNDwPgmMO8ylKE9AW9gtZT7qYF
         EynQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrShw9hvHJWIha7FpujlnksfMhPTcXtrjWMLQhoBpXC5LrD7sEXwhBCQiw16i3DVbr+WjA5xg7WcmiVjSX@vger.kernel.org
X-Gm-Message-State: AFuF++nP/LrT8QzGJSFyJN/YtiUYNQhf/izJ0J35XF+osGkCmYChiyOo
	RPj4vn3OB8hUUowWwa5OHCkPGLf6mSbBcsTINzjNG0xRdm8V4D/l54eskA4RbFogwRNk/z9TDM7
	10CSOR4rb1ffeNoaERH16MBOCb/kBEF36YJOfaUDry0ApKvWGuDoA4+R0igHt5/KvcXn8w608QJ
	gMg5oswQ==
X-Gm-Gg: AR+sD11y7WQCzYO5n2slv3KTgYaBH0m6KlZa1LedW9GrMW/mL517zqEknKwJmAl+J+K
	GWmL/+ksWEuwsGlJGmFBwHTdJapRVxVDldZ0t2x/+9iWFQycGfsek8JRvRkqRNiS20O4DaBnuBO
	TP08BI3oQK2cLorWwDfrGkFjYxVqsBeajDz4h/gXlsi8nx76+MDukbHiwe1XrjXLQj9VDEg5mGU
	8j39qbIdE4+4aslFkhQxso+NYl8G6tuyJQPVMz9pR63bZHoLy/F62Ekwk2y4XqW4xMPcKrTSGrc
	oamnEs1mHgMP8ThGm7oRRoCp/w53kkdw9t+/ghH07GWf/vL9nxbmvOSfnedRlE3r/Mnw/zGWFCt
	kJpakUKbDThU6Nuc=
X-Received: by 2002:a05:6102:5689:b0:779:aedc:88c6 with SMTP id ada2fe7eead31-77a5f8ee20cmr1696240137.0.1787288887016;
        Thu, 20 Aug 2026 22:08:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5689:b0:779:aedc:88c6 with SMTP id ada2fe7eead31-77a5f8ee20cmr1696221137.0.1787288886513;
        Thu, 20 Aug 2026 22:08:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1567f8sm4663325a12.18.2026.08.20.22.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:08:04 -0700 (PDT)
Date: Fri, 21 Aug 2026 08:08:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix CLK_GLYMUR_GPUCC default and
 CLK_GLYMUR_EVACC duplicate
Message-ID: <j4jpmue7fmgm4smiqb4gubj4oeveaeybsgjopavswskec6z27j@uzxxutmfzwbm>
References: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX2HyYP4C57lxX
 BxWeJdTCCMuN5bF5uQayqoiJYZYZT8viQj9xll/xoEr7MnRJDWj0Q3tS20KSPUhyeyac2p55bhs
 woN+O+nIGGuMhXXp9WIswNrGvTklrnI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAzMyBTYWx0ZWRfX86ncWTuMUeTh
 dQx8VQ7vDZWv4RRG0gaEtH29DbnkkvdZ4NSsgszv2eFhDxkNXOxFUUOC/Y3GPmT3ScTcCcPukST
 t98KddCshEX+9Pg3EMKy3dit0hbm64urNtHZfa9vIRvjFwFjR+6CPpuRckGIFv4O7uHteGnwjWd
 OYmEwX5BMV5KzJeCCUKNMPouoCpPvS0aDvCRAJwtFQwkdMiGMw/MKSDMDxbg3upPLGOW8LkIlnj
 3Q1JT63KKShys90YDNgI3vJRV+SUOfcE4A+0Ym7rLbsrQML2iWvaIOs+9f2a5azrex2SY75sMwD
 BYpIOODMhJ9L4hbO9Ou21VEVrKPb/YzEtxas2x1d6zrWyIhu+U06VDYzE0mnyWlCT4mOOxCXkvA
 RYHDh6i2vG9scNsotTxq1wVfIQ54eLwat+Z3O5O3a3R8atk1h7FaGldz21FM/27igcttbor8UO5
 z9aJWf9hGHRLoA9mqcQ==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a87dd37 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=apnw_9Z6d6vNCn9dD0QA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FanB8Q7wq3RDbC3-YjzZC_nzx1YHWJxA
X-Proofpoint-ORIG-GUID: FanB8Q7wq3RDbC3-YjzZC_nzx1YHWJxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210033

On 26-08-21 10:22:15, Sivansh Gupta wrote:
> Commit 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> missed adding a defaults for CLK_GLYMUR_GPUCC and created a duplicated
> for CLK_GLYMUR_EVACC instead. The original patch series did't have this
> problem and was introduced during the merge. Fix this by removing the
> duplicate and adding a default for CLK_GLYMUR_GPUCC.
> 
> Fixes: 6b150572bb76 ("clk: qcom: Add defaults for desired arm64 drivers")
> 

Drop this blank line here.

> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e609a7819e07..7cd3ab277d37 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and
> -- 
> 2.43.0
> 
