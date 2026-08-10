Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A3039CD09
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345634; cv=none; b=qVSn9Imbr4ObcveQys55hzI3+XfbMBmpr/nfXIlwjRgq0enjUVVKiYPcgAK+vtJ/9NrqePTDDixBVSATNpMVaV5uo3e5M964rmXjJFGfxVyG8JILZ+6u4vdVMxpvUF48/iirPt7FwUDqnJvpFHRbW9v24CTrgOWfbswFM+DXSUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345634; c=relaxed/simple;
	bh=NIGH2awKS7UJRQ3fWRPCPF/2tWCZooz6JQ7qrm7/QuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df54FX3AonebsknzgJIAvx7x+y/nqjWuVlMJL/EqMxo6dDYW2kkRcTDidaV+In4xJo0UJWwUwoIy9qtwl0DYlZgNn4dGxmErWzjDF08XrTz+dGX1vQj7ghshbtO0N7k4kNDw7v/ZsKigyFBebp5OTBaDl+VQhzK1tYS3UbsDnvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBpb8i6Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iy/aWdyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBpb8i6Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iy/aWdyh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A5q99k679042
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q4RNLbjHE/O9Vb/0e8rNRcAH
	pZYJIJ2LR+15s2rJjM0=; b=KBpb8i6QYaGzfLvMPOv7vN7bpBseTbbdxGJzYBk3
	gVqX74XbNGPPISvgXLExfN95XOwVtqv8BymswLmalM9NrUOjqCVV9MHh8slaPIoZ
	gOg98Ws5wiC8Ry2Ux4rvHC39XAHeaSkw9jd5j18w1QHl+SjV/vPEBby2fn9JG0wA
	m1cSodUcu1K7OfGnReuejSVRa+ICH1pR1FKMchOirIJvsEMRx68SP1W23+ec6Sou
	KSP0EytRBMl2kHqLhLZdi8sN1OtBZBqYApQGZu8jfRIK7lZpz0/v4L6HswTVyuSA
	V0jgIwsI0jr/thMUa4RpfA1tvLEqfFfx/NzaKhkZXBJfVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8vhg7gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:07:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso10852561cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 00:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786345630; x=1786950430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4RNLbjHE/O9Vb/0e8rNRcAHpZYJIJ2LR+15s2rJjM0=;
        b=iy/aWdyhBnmXh7TJ0MWGlsorMVIFCatSD7oc+hHsfuj1pKgsDwuOa4IgBzmLbz69GL
         yprJ/Z5mNxgVh87XR5eDEo7+5CWlvy537GZwtsal7R210gk/YILxAXBWo0cmQ2cveL2A
         z02neRO5Via7WRySV5OgylaF2fsaC61BmhDsRJtWEpwuQU7Li6v6dpIgDFGhYwKX6Sq9
         TJ74Cn1QWAPvHU6BRcP6AO/biW4eFM17YiRag2vpRBxM1Xm0U6oNAFbwnwvYa9aBXaRP
         dxAVVHzbZerQPnyR53zjApj0wFzs53wpCQUIS3VPgKb/dzJP1Vitx8I+Nzb3Bk6TGfX9
         NUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345630; x=1786950430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4RNLbjHE/O9Vb/0e8rNRcAHpZYJIJ2LR+15s2rJjM0=;
        b=Y7ydAZh/2zgurOTq0wWBEGcD0lCKpqFPJlyJl5KXusSQi+k9WbZENImQtmPcho4LUa
         BoRrFYloldBJLQHzGm3ft/Gp998Xw6qtvsSHn6IyLhM3YPrSeXgCV/2iGn6EA6z1XID0
         0NLfutgMXEf/7ZFoMzXS8qY3WdGAhzc37Y9QW+992P2BR/btuZrmX6IsgKHtqdr1Aej9
         o0FjhViTer8Xpn8du9C1yCiKvJF7ziHfOJ81ps9FPju67kMYR+2bDZEb6e/RgUoWYVuS
         Ll9ZN2m7p3I3GtjvXT3qyukW2U9ws7QoLTgWLrSvg4uBFARNQCdD2BO+Kk9thBHiySCN
         CC2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpUZJuyh5y0TUS/T1c4pJ5yTKzreaEJsVXjgK412FCVAs1OkaaW2lKvCZWZWUBFy6Aaj9jB21c/V/mBFiqt@vger.kernel.org
X-Gm-Message-State: AOJu0YzkRZdOgHD8d5ihSts0ztnZYwz2c1Hs36swHlUc6eyQ2Qx/KiGI
	RW/ZESxV+XGoUQcV7NDMivdNQI8rp8Z7BbHlXb6sZyjgqJFSJ5dA/YIZ9qKjL/3kaPmMy6xA5Mo
	811RxBAVvYRM/HE8xFxwieSk3Dh6cPHLGpY9/BYb+TOvtY6XN9l4ds5FIrgdagQcxP9nf
X-Gm-Gg: AR+sD11Gc90d2m/dndLbDPO16jePMu/vWKE9w3MiTXTOf+aDUb+delMVt5qO0hGEGqV
	LkpVWQWDOZdn6QiXgq+iCy+hBNHlDyWbFaegpYgQdJO8CHtkJhnko+oA3dOesB2WjhKX6ZjCme2
	JiNHeXyYRoNT/q3EDgZ8A9FFUNlo6Rx7hhIwHrcKUqv0TTw+f2pslH5NcE1U9PoaUtG/rNLS5+O
	IGzwlUX/ih+E9V+VyFzBzW1AOneLqqGDK1egJrUtdRT0S+GL7ia3NWL/G+L9mT1nbYrOYVH/A7l
	umRItyhlQewgDcTO0INKe8+mlpesDByQlfB0uobbfRKY6WL7e2QnSQtPMYoYqa4b9g6JQS9PpZW
	dPngrYOFX5t+Av64m6WAIqoSROUeTqvZXVtsUX4mwxp3yXChvyEIHNQUkmxtDPBb1FZk27Vqm2+
	Fi022vAEsN1DUPyA==
X-Received: by 2002:a05:622a:1792:b0:51c:1408:6c13 with SMTP id d75a77b69052e-52ce61f0ccdmr407198411cf.44.1786345629944;
        Mon, 10 Aug 2026 00:07:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1792:b0:51c:1408:6c13 with SMTP id d75a77b69052e-52ce61f0ccdmr407197931cf.44.1786345629456;
        Mon, 10 Aug 2026 00:07:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b304fd1ce0sm1791508e87.17.2026.08.10.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 00:07:08 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:07:06 +0300
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
Message-ID: <oicbypv7rpxmweclopi5xxpcfq5chnypp5tlqd4uix2pm5e72f@kd3bibeximjq>
References: <20260722-qcom_uefisecapp_migrate_qcomtee-v2-0-b8a8fcbe4211@oss.qualcomm.com>
 <nfijwr2ptpxqvdw625yedep7tmakwvkeavyeobrmig5hbkw77w@rcqyp7h4y327>
 <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db27820a-2b43-45e4-bc4a-0e9e81aacd93@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=MMtQXsZl c=1 sm=1 tr=0 ts=6a79789e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=P-IC7800AAAA:8
 a=NEAV23lmAAAA:8 a=IRZECcl-qLxfp-yAvsMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: SkDDl9AlOrUa8j05PMopso5a_C8vhOuN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX/et0JfJHyHFd
 w6UIMzv5gRJ+vFJnj5qcX22forYF8eMCsdGIBpHeFe/za+/TWitmzJlmYFfxsi/Ne+ROuX+DDxx
 1XooutryKxYLimwxoM/VqyQoZCrn5hV5bA+SoU9Ws3nJB00QcHJxEyRj+FsNOTe24hlAWuGhOZO
 MF+pmrtmdRqfKv4DGDp+WNQL9Th8e7wkIOXkxzGTpBCRCx6FhU5VZIMcwwczV73bEEJMuWH5/WW
 QnGu1oCLDHTdpoTipYSOphvZUvZeJLj45QX7EY4UrXiowCSXiq4pJ2kXSCjyGOZC9L1pZ/zK5gG
 kCzM+l1tGv57F0iweJ2V2V1F6jSXCqad+YvujwpmUFHT9UtQSbugXVNX1FarqJpTu+548czZi8P
 jbAW8USJrYV8U8WhloXMtAku6NNwxLrk/fsjcA49OIQScWCavGrnuLC+fe6wRuwUJMjM2ebDBtm
 PlqzoCoRmakSi0DWsgw==
X-Proofpoint-GUID: SkDDl9AlOrUa8j05PMopso5a_C8vhOuN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA1OSBTYWx0ZWRfX0NtiIIGBqd7V
 AVsPD6f0nv6qb6d3VKp75U3YYHRh3dTXt/c83O+Ah9Aq9NM1eeiPCcbww9kKPanl0zHl8CKQkQk
 97oSEydXx6pwxHeWgW1EDqOp8rw0aJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_01,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100059

On Fri, Jul 24, 2026 at 02:43:42PM +0530, Harshal Dev wrote:
> Hi Dmitry,
> 
> On 22-07-2026 01:56 pm, Dmitry Baryshkov wrote:
> > On Wed, Jul 22, 2026 at 12:29:11PM +0530, Harshal Dev wrote:
> >> On Qualcomm SoC based platforms, UEFI stores EFI variables within the
> >> Replay Protected Memory Block (RPMB) which is only accessible by the
> >> Qualcomm Trusted Execution Environment (QTEE).
> > 
> > Is it so? I think RPMB is accessible to Linux...
> 
> I should have been more descriptive here, RPMB is accessible by Linux but
> its frames can only be prepared by QTEE.
> 
> The RPMB key which is one-time programmed into the storage controller to allow
> authentication of the RPMB frames is generated by and only available to a TEE.
> So on Qualcomm platforms (and many others platforms with a TEE) Linux can only
> route the RPMB frames generated by QTEE to the storage, it cannot create and
> write the RPMB frames itself (it doesn't have access to the key).
> 
> While it is possible for Linux to generate/program/store this key, on Qualcomm
> platforms we do not want Linux to do so because we do not trust it. We trust
> QTEE.
> 
> I will re-phrase this and make it a bit more clear everywhere.

OK.

> 
> > 
> >> For Qualcomm platforms without emulated RPMB support, specifically
> > 
> > What is emulated RPMB support? Why is it mentioned here? Which platforms
> > use emulated RPMB?
> 
> Emulated RPMB refers to RPMB on a storage which doesn't have its own firmware.
> Primarily, NAND/NOR storage. Unlike UFS/eMMC storage, NAND/NOR storage does not
> have a storage controller where we can program the RPMB key to be used by the
> firmware. So we must 'emulate' RPMB by moving the storage driver within QTEE
> and making the driver hold/use the key.
> 
> Qualcomm compute SoCs (Glymur, Hamoa) have RPMB available on SPI-*NOR* storage,
> and a driver for communicating with it is also available in QTEE. And so, these
> have 'emulated' RPMB.

This needs to be explained in the cover letter.

> 
> I will add this detail in an updated cover letter.
> > 
> >> platforms where RPMB is not located within SPI-NOR storage and instead
> >> located on UFS/EMMC storage, non-volatile EFI variables can only be set via
> >> a callback request from the UEFI Secure Application to the RPMB service
> >> running in user-space (within the QTEE supplicant [1]).
> > 
> > Can it be moved to the kernel?
> 
> We have a plan to move the RPMB service to the kernel similar to OPTEE:
> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/tee/optee/rpc.c#L449
> 
> It is a work in progress. Once this happens, we don't need QTEE supplicant available
> on the Linux distribution.

Ok.

> 
> > 
> >>
> >> Unlike the QCOM-TEE driver, the QSEECOM driver (used by the current
> >> QSEECOM based uefisecapp) does not support callback requests.
> > 
> > How did it work then? I think Windows has been perfectly using QSEECOM
> > rather than QTEE.
> 
> It works because Windows on Arm on Qualcomm has SPI-NOR storage. A driver for which

I have WoA devices without SPI NOR. Windows still can store UEFI
variables.

> is available within QTEE, and so QTEE does not need to make a callback request
> to Linux to request RPMB frame routing. However, in case of UFS/eMMC storage the
> driver only exists in the Linux kernel and so QTEE must make a callback request.
> 
> And so, if you try to use the QSEECOM driver to write EFI-variables to RPMB
> on a device with UFS/eMMC storage, it won't work.

Yep. It seems to work under Windows though.

> 
> > 
> >> And on
> >> certain Qualcomm platforms such as the RB3Gen2, attempts to access the
> >> QSEECOM interface fail due to lack of support within Qualcomm TEE.
> > 
> > So, I assume, on RB3 Gen2 the QSEECOM doesn't report uefisecapp as
> > supported. Does it?
> 
> It doesn't, this API returns -2 if I add RB3 Gen2 in the allow-list for QSEECOM:
> https://elixir.bootlin.com/linux/v7.2-rc3/source/drivers/firmware/qcom/qcom_qseecom.c#L46

Does it support QTEE-based uefi variable storage?

> >> On these platforms, a TEE based uefisecapp client driver is required to:
> >> 1. Access cached & volatile EFI variables stored in uefisecapp's memory.
> >> 2. Ensure persistence of non-volatile EFI variables via writes through
> >> the RPMB service hosted in the QTEE supplicant.
> >>
> >> This series introduces such a uefisecapp TEE client driver for the
> >> aforementioned Qualcomm platforms which installs efi-var operations _if_
> >> the QCOMTEE driver registers support for an object-IPC based uefisecapp
> >> service on the TEE bus during its probe. Only new QTEE firmware versions
> >> available at [2] provide this support.
> > 
> > What about existing WoA devices?
> 
> New Windows on Arm devices like Hamoa/Glymur work perfectly fine with existing
> QSEECOM based uefisecapp. But they will also work with this new QCOMTEE based
> uefisecapp once they upgrade their firmware.

Do extisting commercial devices suppot it? For example, does Lenovo T14s
support it? Will it continue to work with this patchset in place?

What about other existing devices? We have WoA devices starting with
MSM8998. The QSEECOM driver works on them, but, as you mentioned, it
can't flash updates to the backing storage.

> I need to double-check but this firmware release for Glymur on Qualcomm Linux
> is probably carrying the support for QCOMTEE based uefisecapp access:
> https://github.com/qualcomm-linux/meta-qcom/commit/728251fcbe5113980805ea6c571e33235062ee71
> If not, the next release will definitely have it since I have merged support for
> this in QTEE and talked to the boot firmware release team about this.

Does it work on the CRD?

> 
> The next planned firmware upgrade for Hamoa will also provide this support for
> Qualcomm Linux. And similarly, for all other targets being supported upstream.

So, we are forcing users to upgrade to the new firmware? That doesn't
sound nice.

> >> Thus, QCOMTEE now maintains a static list of always-available object-IPC
> >> based secure services exposed by QTEE. These services are implemented either
> >> within the QTEE kernel or within a pre-loaded Trusted Application (TA)
> >> usually loaded by the bootloader. The uefisecapp TA is an example of a
> >> preloaded TA loaded by UEFI. A static list is required since QTEE does not
> >> yet expose any way to dynamically query and enumerate the services exposed by
> >> it.
> > 
> > Can it be fixed instead of having static lists? In the end, we can't
> > guarantee that users update the firmware.
> >
> 
> Unfortunately, no existing QTEE release out there currently has this support.
> But support for this is currently being added by QTEE team last I checked with them.
> Once it is available, and a new QTEE firmware release is out there, we will add
> support for dynamically querying QTEE services in the QCOMTEE driver. 

It seems you are still rolling out QTEE-based support. In such a case,
please go back and implement dynamic detection of QTEE services.
Otherwise it would be a nightmare.

> >> To facilitate object-IPC interactions from the kernel-space, this
> >> series also introduces a tee_client_object_invoke_func() to allow
> >> invocation of TEE objects similar to the existing tee_client_invoke_func()
> >> API exported by the TEE subsystem which allows invocation of TEE functions.
> >> Some suporting changes are also introduced to track and handle operations
> >> for TEE contexts opened from the kernel-space in the back-end QCOM-TEE
> >> driver.
> >>
> >> Finally and as previously mentioned, access to the object-IPC based uefisecapp
> >> service is restricted on older QTEE firmware versions. A new QTEE firmware
> >> release must be picked up from QArtifactory [2] for all upstream supported
> >> Qualcomm SoCs to enable access to uefisecapp service via the TEE client
> >> driver.
> > 
> > What about fused devices?
> 
> The procedure for updating the firmware on fused devices is slightly different.
> The firmware images need to be signed by the OEM using the security profile
> of the chipset before flashing/upgrading them. Security profiles are now public:
> https://github.com/qualcomm/security-profiles

Will OEMs release new firmware images? What about the devices which are
already out of the support phase? This whole story rotates about the 'we
are releasing new firmware with new features' paradigm. However there
are existing devices in the field, which typically can't be upgraded,
From your cover letter it seems they can't support UEFI variables
properly. However they do so in Windows.

-- 
With best wishes
Dmitry
