Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715483AE187
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709460; cv=none; b=uq5ZD3GAmUI93uppxT1I+kk4lB9KTRcdmU5SLVRoNHNrGuq5XeahMkGxMmCCSuAFDiENJ87Nq9Gt59cjWqg+8TeQa36mgrtPpQZ3zsHPOyUk3QQOYebFznaIeN2HKDljNoz+dSX54WoFjWGuzJ/ssjt0U5PFR5t/pdxe7QKb8Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709460; c=relaxed/simple;
	bh=tFwCQkeZG7rd+dEXLx69Y65LPFna9EaL3Q9gAS/nNo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6BVgXuxuJhcJqgrWG4XHisM0HBYqTMmA9NapmMkmV499VN+HjZhTQxCY1LBWVI3svlH+896frEvImZTbRQM37jeGFC1MDhO8YaBNSpIXlLWrmZB0LQw4uGRbWl9ElTzeDLfZSKk/l40dx8fvFBL9ULnkXJYmR41e1NRm0n0Lk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AsMM0DWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T0rEjV0V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AsMM0DWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T0rEjV0V"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53gJX3917546
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QBgbeQa63G22sZojaUnX0f6C
	1ctoYWBtnWtNuCih+bs=; b=AsMM0DWuvL+3xfVIwlLF850rEIekmps1pPNf7chu
	DbpQMHKYVVvKxSMZK3rd83MsTBCAmxULYTxlOq4AfRFweGkgipX4zNEPB8aIGMtD
	pV3THyH6vU6U5jEdAZd29leZjivjeLRdTrgNilW42LMSV6qQGVeu9uY4QFxb9lFY
	Bfk4xxBtRFsPokK9Hj3b9WM59L/VgzHz8Y1XQw5yclX/HKvej49Bp0pcyiapzcmg
	ArP0beLIYSX6kQ0O/37MJWX7SPNSGAzZtUGScnlUakT8OT1j4IoQaeR+2sibxsgD
	uoeJKyj3c+FDpDOaxR8yZQ1jqn58ImuM5982N7MWxAka4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ab22u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:37:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c110a3b6aso143640891cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784709456; x=1785314256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QBgbeQa63G22sZojaUnX0f6C1ctoYWBtnWtNuCih+bs=;
        b=T0rEjV0VyL6jvuZVfWBJImPN5ojku7QsZTG6AIvTsROK6crkT6MNezyj+wvuADIhGI
         ED9mnvAIxkasPeQ9cyRRuBpgjiFjk4BxE0lqt57pxL5Zxkz/B7IFgmFWuo+GiuEZWsi4
         n0s3cBsbSuF28G3ArWlL+eZW7sbv9tUrPnPpmXmmz7wShVyRtEWniacnxdJKLEpAaLRC
         GMhCnnH4/HnfSIY9UCHWSftmp340gMh0yxnK4xJdCkihZFkPZ4J44fIq/NFrMssLmXvd
         +Hg/8MI5LajW4FIt97M1D/tesxYBeqCPXlkRnKHTO30mnJ2gGJkHg9DqCFrvNLOSw0vf
         FEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784709456; x=1785314256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QBgbeQa63G22sZojaUnX0f6C1ctoYWBtnWtNuCih+bs=;
        b=YfRt4RxfRHUWDB3K3FV0IAE+9EIxXmOtQnSHMtSiq4mfFYd3jXV7wF8tg69yJ/OH7s
         m42cQjhjg6w0MS8Z11j/VKHoIhJhVD1wjI7nKs8/zV14ctVOC8KzhM2AUr6DM7l92ckh
         65zyODz8W+WoZlm4ZMgl4Z69WoDaq9qqN1Oi/m/r+WZRUaqrSXbp51wz4NcKEJpjIBz1
         2NzthPLaThCgA7hqGXMI6Nx2zMr52uVeHRLpwdVTnmnwUeUSlrF9td1/x8Jh6HjeStI2
         DaWe+suQ8mPQA9s+KpewPqFP0pz0Z2eoF7DF9tN5e4A53qI3Vx8yiay/U0wR+BnK6jmV
         80Eg==
X-Forwarded-Encrypted: i=1; AHgh+RoB037hTBM+6ZOtNcv8wj7PqVJXjEkSTzes5gtcTNHtbJA56m1B/KQaGLd6v9HKuLLJUrqcuuhDL+Dhs21h@vger.kernel.org
X-Gm-Message-State: AOJu0YwPqLfJNWtsg0p9X+c8x3GokD16gTDsLYreSEgX46+s3DPqQyM6
	1FvpDDpPZRe3VakHGsgpYcOFW6TVqH0uYhLVQnpDydugb0cYw3Pz+fJVtDQqfXaWIOvVGL37+rB
	xYQUBF+wYEEQT2KxP1azl82JZbMcr1LldSaLPTE5YeS8X6hQbFc1FfLKDNolkuE91WIY5L+StOj
	31
X-Gm-Gg: AR+sD12yfltAp/pYx0+Ubd/10OB4IAxYYn6ODtzHoH4/8f7s/p7DqW3u2TWcMGf7CSG
	2Nd3GN9UK/D+YB5frsdSk15b/cRwCRJaeyroZ803qpPmStxHxjfnNRyf6iRX2xelKOtvP536Jz/
	5xTUBOvgUtRgF9SO47MlJLmV3sDZx6m1g7dSiUsCX3K8UwZWxSBT/iz/kRDtvwx1LfxPiCFosYH
	FZzd7Kj9McgFdfsXal5cc9sN7gX2TDYbwNgGA5qDocs0zmP4oMsUPlhsIXzvZ1ou1d4IGu/4PXx
	Ux6cihi0MHKBxVeKURSAP9xnwynJTbP77LulP3Ug3+oAVOSEe/SM79StT/J/hP4zkEHd1x4lUn+
	ahu+vNnsNmk3HB+EyX+3teegPHxfmnCzAGdG+g2pGOgwoujRO6YUVADPdpTAS3KTVjNsdaC9Smy
	QkV373EQSZUo3SAA==
X-Received: by 2002:ac8:5f4f:0:b0:51c:ace:de6a with SMTP id d75a77b69052e-5213d2b715cmr198048731cf.18.1784709456223;
        Wed, 22 Jul 2026 01:37:36 -0700 (PDT)
X-Received: by 2002:ac8:5f4f:0:b0:51c:ace:de6a with SMTP id d75a77b69052e-5213d2b715cmr198048571cf.18.1784709455717;
        Wed, 22 Jul 2026 01:37:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8bfa3sm347571e87.12.2026.07.22.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:37:34 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:37:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] firmware: qcom: Add support for TEE based EFI-var
 client driver
Message-ID: <w3oebwhvheb6scbdv2dshhr6t4sx3nwalmlw4akqf4sj3n2nmm@s7e3xtr7cuev>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <20260722-qcom_uefisecapp_migrate_qcomtee-v2-6-b8a8fcbe4211@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-6-b8a8fcbe4211@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA4MCBTYWx0ZWRfX98jl857Kuzag
 YzpFVSNdt62+jWfEediTyqbDBYZD2wYrFengP689ZFIxZ/UyiEZ/3Vc+5twYVSYcDyAaEqDXR+w
 mO9ZL+E31cpNgLzttPwRWf1FFQu/qh9v8ojlW2UFikwthKskMhWpc0UVokNc1Z8qqL7YXwCwSDl
 pytqEv0BSJ3DRRDh2e14zw8hRuJW7Xk0ztFsWvfyhZwToOKzUhxHVEn6rcote/mxfQb5Dx2aWE5
 3MjzlZ8yptSEH07Ig3gOSdzvfoUT5dGeCL5PdCWk5nnydPT6zsu4tJ43bRI/VC7UGOIFjh0F5XC
 +Y4ahro3ORLpzBV8+t5M+jXXEEpmnpA5x9GRd6V2DCStt+uYdKlHLDJ12YxbqGcad1QXNj/br+b
 1uefehAmfwRrAFhcmLnLw3ou5ylHM6dUsvKmF79MrPR+Jyq/qVFq9B5njhOCuIklgHGMpDXlHtJ
 6ZvWrjJQ340wtZKRyuA==
X-Proofpoint-GUID: ZgssQIjuxIzPQaOez0fPDOellHTT1jbw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA4MCBTYWx0ZWRfX860G7ubDuIcn
 IsIiWXL0ZvIGYXiL/W2X/p7BLg76jZNvLC//C22nC/KpeMUGz2E0uC/LzLR1D9HXUcyLVXzQTJ0
 3IwO/h46BcJZpu9TPXSWlqTW1cfbpQM=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a608150 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=BdpbYtui1GW-VTqxAS0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZgssQIjuxIzPQaOez0fPDOellHTT1jbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220080

On Wed, Jul 22, 2026 at 12:29:17PM +0530, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) which is only accessible by the
> Qualcomm Trusted Execution Environment (QTEE).
> 
> For Qualcomm platforms without emulated RPMB support, specifically
> platforms where RPMB is not located within SPI-NOR storage and instead
> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
> a callback request from the UEFI Trusted Application (TA) to the RPMB
> service running in user-space (within the QTEE supplicant).
> 
> Unlike the QCOMTEE driver, the QSEECOM driver (used by the current
> uefisecapp client driver) does not support callback requests. And on
> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
> QSEECOM interface fail due to lack of support within QTEE.
> On all such platforms, a TEE based uefisecapp client driver must be used to
> access cached/volatile EFI variables within the uefisecapp TA and ensure
> persistence of writes to non-volatile EFI variables through the RPMB
> service hosted in the QTEE supplicant.
> 
> Add support for a TEE based uefisecapp client driver which installs efivar
> operations after obtaining an object reference to the uefisecapp service.
> This enables the kernel/user-space to access/modify both volatile EFI vars
> stored by the Secure Application (in-memory) and non-volatile ones stored
> within RPMB.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  MAINTAINERS                                 |   7 +
>  drivers/firmware/qcom/Kconfig               |  24 ++
>  drivers/firmware/qcom/Makefile              |   1 +
>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++
>  5 files changed, 677 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10d12b51b1f6..e8316007370f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22018,6 +22018,13 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
>  
> +QUALCOMM TEE UEFISECAPP DRIVER
> +M:	Harshal Dev <harshal.dev@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.c
> +F:	drivers/firmware/qcom/qcom_tee_uefisecapp.h
> +
>  QUALCOMM RMNET DRIVER
>  M:	Subash Abhinov Kasiviswanathan <subash.a.kasiviswanathan@oss.qualcomm.com>
>  M:	Sean Tranchetti <sean.tranchetti@oss.qualcomm.com>
> diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
> index b477d54b495a..20ce8b58e490 100644
> --- a/drivers/firmware/qcom/Kconfig
> +++ b/drivers/firmware/qcom/Kconfig
> @@ -74,4 +74,28 @@ config QCOM_QSEECOM_UEFISECAPP
>  	  Select Y here to provide access to EFI variables on the aforementioned
>  	  platforms.
>  
> +config QCOM_TEE_UEFISECAPP
> +	tristate "Qualcomm TEE UEFI Secure App client driver"
> +	depends on QCOMTEE
> +	depends on EFI
> +	depends on !QCOM_QSEECOM_UEFISECAPP

Nope. The kernels can be built for multiple platforms. Implement a
runtime selection, which uefisecapp client is to be used.

> +	help
> +	  On Qualcomm SoC based platforms without emulated RPMB support,

What is emulated RPMB support? How does a user (or a distro maintainer)
understand if this needs to be enabled or not?

> +	  specifically platforms where RPMB is not present within SPI-NOR storage
> +	  and instead located on UFS/EMMC storage, non-volatile EFI variables can
> +	  only be set via a callback request from the UEFI Secure Application to
> +	  the RPMB service running in user-space (within the QTEE supplicant:
> +	  github.com/qualcomm/minkipc). Unlike the QCOMTEE driver, the QSEECOM
> +	  driver used by the QSEECOM based uefisecapp does not support callback
> +	  requests. And so on these platforms, the TEE based uefisecapp client
> +	  driver must be used to ensure persistence of non-volatile EFI variables
> +	  via writes through the RPMB service hosted in the QTEE supplicant.
> +
> +	  This module provides a TEE client driver for uefisecapp, installing efivar
> +	  operations to allow the kernel and user-space access to EFI variables.
> +
> +	  Select m here to provide access to EFI variables on the aforementioned
> +	  platforms if your Linux distribution has QTEE supplicant installed and
> +	  running.
> +
>  endmenu
> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
> index 0be40a1abc13..d780490b2865 100644
> --- a/drivers/firmware/qcom/Makefile
> +++ b/drivers/firmware/qcom/Makefile
> @@ -8,3 +8,4 @@ qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>  obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
>  obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
>  obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
> +obj-$(CONFIG_QCOM_TEE_UEFISECAPP) += qcom_tee_uefisecapp.o
> diff --git a/drivers/firmware/qcom/qcom_tee_uefisecapp.c b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
> new file mode 100644
> index 000000000000..9a5a6f145a9f
> --- /dev/null
> +++ b/drivers/firmware/qcom/qcom_tee_uefisecapp.c
> @@ -0,0 +1,525 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/efi.h>
> +#include <linux/tee.h>
> +#include <linux/tee_drv.h>
> +#include <linux/ucs2_string.h>
> +#include "qcom_tee_uefisecapp.h"

You are the only user, inline the header here.

> +
> +static struct qcomtee_uefisec_app uefisec_app;

Do you need global data? Can it be obtained from other context variables
using container_of()?


-- 
With best wishes
Dmitry
