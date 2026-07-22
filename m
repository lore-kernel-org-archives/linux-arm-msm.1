Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB0B43E07B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708820; cv=none; b=asj923ODMRgRLsgfVODeH2hG2U/IU97X9ieUaymv0fx67IkhwVKr2ekCC2DCYOyddV5DRQExkwRKZYUfBkf9Ss/ZTnsroHi9sFcDCwEfLwCA9WyU5gjtbLqqFlnOTCn55Guj1XUmNxBeDTwmqYqCrAHnxuaEiw09sIksL2z7goY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708820; c=relaxed/simple;
	bh=NLQKFArajH94tZtPgTIE0gUJwL1+IPxwWTKo6HsqFwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwUlHJZs+cr1iO3GAqm/57qk04m6cnsDK85vZuxwvj1rNc4uMM1sguFzZvdQ5b9gXbUy7O/opi5ldCkRdv2tvYPBGJNSJgDnipvR6JJJn3ih6hT22si/JdVfq2rrh96Lz2UNQnC5Lo6CUKkIw6Ae/QtHLXFscK+koDrozTnZepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5A7sXnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jsbKNisA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5A7sXnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jsbKNisA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53fcr4054962
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b8PrbCTjo875NEYFMM6d6TIP
	iQeoWqfr7uJWThGFKkY=; b=Z5A7sXnh/uGzj80jumYnX3bUbMVUs4CnL9WnmM8f
	Jwr9BYQi7FTCymzGV+yD08w4NsIBTF4pPwrFBWQrayM4NL0YrqTI4//WeQ6nz+3R
	flBAkcMUMiMSuCleSI4Z3yUcTCki7XJ3g5tnY1ruEj53qFyM6SHlw7EYk8MXEtSD
	jTDMjSkcLeg+KSFhGszblgmwAK5/tcxq1QNlhURpkP9J1mt2xhN4E/zbvtmoCu7A
	G6TDCVRTHwKkmbtWK/WR2ErOT1/cH+RaK7J+qWZYGXa6iBzVRreZExhi/ep8Rd7X
	1AEisWYnhAaOwzNdZ7CpD7VS80JcrVYLn6ou0QtL+hujKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdgvkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:26:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a87ef9713so85445531cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784708815; x=1785313615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b8PrbCTjo875NEYFMM6d6TIPiQeoWqfr7uJWThGFKkY=;
        b=jsbKNisADHjD9RFqbulVqDA8UtRA4dfdeDmGT+k67BZJTJX9xwCOTFeMcwRdy0AC6I
         O4Jb+PWmXbilpFCZ7trnLQBueRYwO3FmL/q1mRIj9V9iReGPcyfF13lwEeMFuWscqIrV
         Q7vVsZw+cH8uotbovzutqKb/wHGpWfzagath/ovjoezRU7qGEsmgs7Pcq26SgzusF8EC
         9UFYrBWcWtWtIajBd6x17OylGwemkKM1HeH0dG2kX5Vo+2qTBqzKJshuE4yuiowbr0Om
         IjIO8arFqo+DDeTpNdsddCuZ5EMBTt4vL1CSuO0ERT3/ii/T5tBLCn005PaGO+mEhvbC
         sUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784708815; x=1785313615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8PrbCTjo875NEYFMM6d6TIPiQeoWqfr7uJWThGFKkY=;
        b=fGHv0JON9bFsDymm78WL2gL0exNRoxT5vZVuNi+ildGyOy12GL8QS5lIG6ojNqG6dm
         fKjPtcMiYon2BK6O3TiQ3aKShnNZVJslSluGKAgOfkC8vldEXAEyhMQDGMPl9xoebEDz
         WYabyjolx3q7EhSdRLUXihw1XtsW8QU56lqKrm/HdxWTZsylRIpvq8hlMfeq7zW9Rf6U
         3NyNgh+23zbhEf2SZ2GQSy3IT5M1Vn+YyJQ5SlYdIjAax9VI3YtFc73UGwFMAe4x90gs
         4QFLcpvznL/fDi0IiU+rdYcJJW8PpyHb3pWHoGGmonwTQDtYhBByE6dDeXv4G3X/Iepe
         p3fQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXrF1kCxBigAiIngn8LUgW4LhamIabdfcRqZ72cN1yPLcFanm/DUr37x1KJXFzEs2cvU1OoDOvZsha6C6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8lJKxEJ+MSda8MrWibAMhUHKyotEx8OxV5Ik1RmF5tTNTiaW
	jwa2KUBP1kqPutIEvlRUiwUfY8bejecRaYHfJW4gdQPtTXnf3dnf/3S6xdaFiTMB31fsHWyjS4P
	dv4E56okIH7bbhCKga41kJKbg2igMybfS1g1ZtDI+VC9hZyzBmzJ+sexh5rG0Zbh9OUon
X-Gm-Gg: AR+sD11iM2qSOTNbi473En1rTOsE3K0AytfVJPPZnRFVq+7I9dXRPQaXDwcQO0uAVds
	WFHfMnMGZlzHdq5ctqxDa+wvPBWxR04U52qunIGS8NXEqg8iBKbgljWieLiblix1lr0tQKy9YQP
	q45g+Pvic5Yiwc50KhM73qr0/jjaYAH4ooNb7uknu1ZaXThxLN3sL2611gxV5Va12KYHEuTlK0H
	ezApLCUlxgF92M3/04UzP9X3v9S+AhN9BYJGb09OWNazftRuyUguv1XBg9cF2UQVcFzsjQANTvY
	ofWHz7f76+2JQ8Q+WPmQVqfl3/r04T/Ktnc67VBo+eo0aLNEECt/wToyqqF3jNCLi3PvigET4Fv
	SD3sSldV8MPokCukKOwVQvk17zVY/5ngMWHBoDIL3hQ56O/vm41bIV+xZW6YaQ616euaL6YlsrX
	RxMdeS2G/2VqMHfw==
X-Received: by 2002:a05:622a:1b8e:b0:527:7756:3ee9 with SMTP id d75a77b69052e-527a2cb3ca9mr31562761cf.0.1784708815375;
        Wed, 22 Jul 2026 01:26:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:527:7756:3ee9 with SMTP id d75a77b69052e-527a2cb3ca9mr31562661cf.0.1784708814900;
        Wed, 22 Jul 2026 01:26:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e4534fsm335621e87.63.2026.07.22.01.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 01:26:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 11:26:51 +0300
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
Subject: Re: [PATCH v2 0/6] Add TEE based client driver for UEFI Secure
 Application
Message-ID: <nfijwr2ptpxqvdw625yedep7tmakwvkeavyeobrmig5hbkw77w@rcqyp7h4y327>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfXy58T65swPrqw
 rH4Hr6IDFMQtk7VPyvCuhmQelOrLdp0wxE3OAXTL3fgjuvgQFXjN/LQWC5hr07getV3W+V1xhBC
 bWugqsQpFUZDRSHuOGHgwmQoHGNm/CMa62bB39hIHhS1J9wP3fJwWvHZPxxkMoFLjtK6Rct2eTA
 SW2NE3QrjML5vrwgtXOYvh4sxvOpdtxqI84T74IejIuMjhUAHa9UX5dLN+L9lOaDy6E7c3mZnFq
 55Jjb1KZSJU8NaCALnSbxUbQU/gRwrPZfNl5kiCk+DBvs99Ndj+a1VbirkNYZv//vQB2WFpcAvh
 crF9P3BQYbd50m2QyhrtbJ2Ialo47/e0B0rUrExmb+Fg+iwWOqFTMxilCIw5Y9PU/y8GUVEA2JN
 jTe8CDDJN/bx9Msp4GopMYxpLeWBQsA/75JleIoLBumOBaEsnDaYhHJ4yvSQdd9CoUEkoFO0ydj
 a7TCJAp83BIPHHnOg0A==
X-Proofpoint-GUID: -c8fmuE2iiAfjRF-82zvLHgnOQsDf_6A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3OCBTYWx0ZWRfX2EgbxXJf9sEZ
 ekhhKm38nB/m6ezRcgziY4dqONMtnFF/PSRDIIHWspoEuEcDSDx0OLKR051FxkWYj8g2Rtlyunp
 8ZHxrjBaeC4NZqIs0YqyqgFnMTZ4WUo=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a607ed0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=EPKcpx9xAAAA:20 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bb8mIWsUJEVNQjRnNgUA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ZT_8zCgGubuJgGonBfBE:22
X-Proofpoint-ORIG-GUID: -c8fmuE2iiAfjRF-82zvLHgnOQsDf_6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220078

On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> Replay Protected Memory Block (RPMB) which is only accessible by the
> Qualcomm Trusted Execution Environment (QTEE).

Is it so? I think RPMB is accessible to Linux...

> For Qualcomm platforms without emulated RPMB support, specifically

What is emulated RPMB support? Why is it mentioned here? Which platforms
use emulated RPMB?

> platforms where RPMB is not located within SPI-NOR storage and instead
> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
> a callback request from the UEFI Secure Application to the RPMB service
> running in user-space (within the QTEE supplicant [1]).

Can it be moved to the kernel?

> 
> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
> QSEECOM based uefisecapp) does not support callback requests.

How did it work then? I think Windows has been perfectly using QSEECOM
rather than QTEE.

> And on
> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
> QSEECOM interface fail due to lack of support within Qualcomm TEE.

So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
supported. Does it?

> On these platforms, a TEE based uefisecapp client driver is required to:
> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
> 2. Ensure persistence of non-volatile EFI variables via writes through
> the RPMB service hosted in the QTEE supplicant.
> 
> This series introduces such a uefisecapp TEE client driver for the
> aforementioned Qualcomm platforms which installs efi-var operations _if_
> the QCOMTEE driver registers support for an object-IPC based uefisecapp
> service on the TEE bus during its probe. Only new QTEE firmware versions
> available at [2] provide this support.

What about existing WoA devices?

> 
> Thus, QCOMTEE now maintains a static list of always-available object-IPC
> based secure services exposed by QTEE. These services are implemented either
> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
> usually loaded by the bootloader. The uefisecapp TA is an example of a
> preloaded TA loaded by UEFI. A static list is required since QTEE does not
> yet expose any way to dynamically query and enumerate the services exposed by
> it.

Can it be fixed instead of having static lists? In the end, we can't
guarantee that users update the firmware.

> 
> To facilitate object-IPC interactions from the kernel-space, this
> series also introduces a tee_client_object_invoke_func() to allow
> invocation of TEE objects similar to the existing tee_client_invoke_func()
> API exported by the TEE subsystem which allows invocation of TEE functions.
> Some suporting changes are also introduced to track and handle operations
> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
> driver.
> 
> Finally and as previously mentioned, access to the object-IPC based uefisecapp
> service is restricted on older QTEE firmware versions. A new QTEE firmware
> release must be picked up from QArtifactory [2] for all upstream supported
> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
> driver.

What about fused devices?

> 
> This patch series has been validated on Kodiak RB3Gen2 platform with UFS
> storage by attempting to read/write EFI variables via the efivar tool [3]
> after mounting the efivarfs filesystem. See [4] for an example.
> 
> Merge Strategy:
> 
> This patch series could either be taken from the OP-TEE tree or the
> QCOM soc tree. I would prefer it to be picked by the OP-TEE tree since
> all except the uefisecapp TEE client driver patch in this series make
> changes relevant to the TEE subsystem. It would be great if the QCOM soc
> tree maintainers can Ack the uefisecapp driver patch.
> 
> [1] https://github.com/qualcomm/minkipc
> [2] https://shorturl.at/zQU07
> [3] https://github.com/rhboot/efivar
> [4] https://docs.qualcomm.com/doc/80-70020-27/topic/manage_uefi_environment_variables_using_efivar_tool.html
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop using MSB of the object_id to distingush kernel and user object invoke contexts.
> - Introduce enum tee_object_invoke_origin to check the context of object invocation.
> - Link to v1: https://lore.kernel.org/r/20260707-qcom_uefisecapp_migrate_qcomtee-v1-0-f659cbd5d04c@oss.qualcomm.com
> 
> ---
> Amirreza Zarrabi (2):
>       tee: Add kernel client object invoke helper
>       tee: qcomtee: Allow object invokes from kernel clients
> 
> Harshal Dev (4):
>       tee: qcomtee: Track the object invocation context
>       tee: Export uuidv5 generation for TEE backends
>       tee: qcomtee: Add support for registering QTEE services on TEE bus
>       firmware: qcom: Add support for TEE based EFI-var client driver
> 
>  MAINTAINERS                                 |   7 +
>  drivers/firmware/qcom/Kconfig               |  24 ++
>  drivers/firmware/qcom/Makefile              |   1 +
>  drivers/firmware/qcom/qcom_tee_uefisecapp.c | 525 ++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_tee_uefisecapp.h | 120 +++++++

I don't see any changes to the QSEECOM drivers. Is it allowed to use
QSEECOM and QTEE access to uefisecapp at the same time?

>  drivers/tee/qcomtee/call.c                  | 205 ++++++++++-
>  drivers/tee/qcomtee/core.c                  |   9 +-
>  drivers/tee/qcomtee/qcomtee.h               |  12 +
>  drivers/tee/qcomtee/qcomtee_msg.h           |   1 +
>  drivers/tee/qcomtee/qcomtee_object.h        |  16 +-
>  drivers/tee/tee_core.c                      |  24 +-
>  include/linux/tee_core.h                    |  23 +-
>  include/linux/tee_drv.h                     |  18 +-
>  13 files changed, 952 insertions(+), 33 deletions(-)
> ---
> base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
> change-id: 20260408-qcom_uefisecapp_migrate_qcomtee-13869d45e014
> 
> Best regards,
> -- 
> Harshal Dev <harshal.dev@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
