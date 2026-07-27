Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1337CD37
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162529; cv=none; b=EZz52qd7bpJjd71N5R1LXtHnV/Fl+fwKAxMK3RE0Mn+hEHwzadfSjMVd/ITUYrSVCr8iTkQiuDbHwNUtiKhJV318UH2Pag4BTwI98ZguODQjBrLvoGehNDPixRM/LF3RZ2wrUUFQjGngLtzbVbPEbyyaqNqUcBkY4y9jwI4Z48Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162529; c=relaxed/simple;
	bh=dtaCPwCxPBZsQU9e3ksDAJu5ustHqHFuIA9inl4S3Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiV2zeaHvXaCdLUB+5UumZCiE/HBjz9QrPdghrAyJniQWd/X0tKv6hjvW++2uyj+vVMynj1wCDw0ghVn9HPM0Tdd+8lhY8A+cwmWppBhn85tplpBI19JWbY4b4tJHifs0c4ICr+OK4pxiM1uQBR1yGIPJf5UpIoJh81Wxsby+KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+o0hSNH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3GwjbCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+o0hSNH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3GwjbCN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlfOn033185
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=; b=M+o0hSNHcjNeILVg
	B/EOF/hkawhWP5TCNt00nOp98TyC0DZqa9hDaev4t3y6xAok2AjW2mVCndmNWEN2
	AA5T+cAXEwEAgZJag4yFxZaZsN60WSCKcIkOeU7RqiugTcqGoTck5isPSyCUwInw
	vKwenjqiv6Nqjvmz1/nZFrT/VYTPLc5mUIFVJF0R4fh0GzUaakGO6MWWnAOe+hmX
	eDl2zEMLD6b6Q76NBFivsWvuB6X2wgwTFPb4ui+DbZF42f2guEmF3hC0kJhj8Wnv
	nwgswkcMI+YUD7KWqsWtdcCEHHOAXmcDj0Yr/W51wULTiKqZRIYnusUPab0YIzNT
	T9Pydg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c617uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:28:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c15c77619so6636091cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162525; x=1785767325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=;
        b=d3GwjbCN1TxWcAA7GWlafjLDqGGbioxLqKS2d7t4aU+JFC4dIj48+ApPsJFg1lETtH
         PGLbzg0jBuA2abNS6dvFnNwmd1Zd1Cdy3MOMeWaHXuCdUv1id7AnpvcsZJ32s8eXymi2
         XUQKch6nR14yqivJue3zCuS65b6ywRa7YaJp1aUX9pmTV0iusUrQRGn/hFzW39EFKPZL
         tgSiQBCFtzsqXixhUrvt2c6R/jAYNs/o3d2e8Q0XvDozKHwtAh1OT1/qUFruQtbqg86a
         R4jl/ArHqcnTzOPQ2N8x0O7n3Y+D8+gkvx/IutXYJElVcXg0ZO83Tp8duO6fF3ejmC1o
         W+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162525; x=1785767325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XwYeDvLJf9xoDaVgSmjefyJPwZ0kaUEFJBnHboR0txw=;
        b=bnMwLs2dlvLIZOJut8VusoMdJha1jNcxi9TVQSwRnscZaFkgnuwLkjnBHyFj62vz4m
         fBJBNcuc6o8+FYadRFD/Ggs3f/E3EegnUul63pNSAwy50UhiZZowWKAgpyDgYF/XAdVJ
         UmpEmOpDg+hl+/SD8SL+hiNH2pcDtgaFOkRElOsQ972DveGr0ttmtgyscNkWFtoEvnnI
         c/TyZtl4D43ZoR9hrysDN/RUil5pgha8UWuXdO4PxOeUOBTYnExzIKuq3bLvebswiKxN
         6ADbwGWnICxGKzTsUvoa9In7MxtqR1WoB7FV0T25LLlL+Uq7g4uMjnLlp4K2FcZUtvZL
         fWsA==
X-Forwarded-Encrypted: i=1; AHgh+RpfdjbXI+lzxntWCpqEkCZIEXM1zlmsEWsBDIJnIMhqe9ILpYLp6f4V0ltEYC5bWmrgTmsx6deT0IDgvTzv@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0aHf6Y7QFApAIYWBve8YnJCqVNVJbS/JP9rPtW5qCXc1irGJ
	2p2NhrQ1Efqy22gwH/O5jHWw7gamqVnnxDdAimb1qQFyv+i+ulNtHYZELPlKT+GqDD6KGAjf+ek
	JKagT+SMGvutUwmjho+k865RJR23zJP2y/B8tRVnw5yztMTgnSUvbu+8ihRVzD49I8OLHLGiAva
	RS
X-Gm-Gg: AR+sD13peAckfCABS1eewQH3I3bOsIIEPVZJ4LHbJsB3JUn300f/7bb9FiPa5cLy2F7
	cVk4ss8upVv0TfO/dK0vy+8J6rifWXYdKP32olYztu6hylgrw9e0nhOzFgKh5WAXgc6fJAN9jGT
	leaaIRYupL+f6klzcvcXu5NDjopA+nWBohZ3sSDjH3l8PZ8sFYcaXIX9HQtg+61SYXIBoinZLzJ
	uY9bAhHPGpJ2dtoVsRzRsZggxDTWwNVXKrPD86xT1bxRHGw98QoYcGLlIe0IjfA8Ha/uf2fyArh
	hzQn1gwINAdAqvEHmmlQYxA4r6sXUMqm2nTIjZLTrrsrK9aJ4yyyl+52qD0cdzSKKofww5yHKLY
	0RMU/kEbvx5XjFIjlB2eeOQB9
X-Received: by 2002:a05:622a:1191:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-529cfcfb62bmr3497461cf.2.1785162524615;
        Mon, 27 Jul 2026 07:28:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-529cfcfb62bmr3497151cf.2.1785162523970;
        Mon, 27 Jul 2026 07:28:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm670043366b.49.2026.07.27.07.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:28:43 -0700 (PDT)
Message-ID: <be2fb404-061d-4e69-b430-9cecea21f60f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:28:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] media: iris: add support for purwa platform
To: David Sheffield <producer456@gmail.com>, wangao.wang@oss.qualcomm.com
Cc: bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a676b1d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=_YIi2MdEoqMPYrfQuocA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfXxOi/ybsQIFPx
 dXOaFK9v4QN26ifdVbwO5udAzlu94TDyyp4uzv/3OzyaQPShUipC2mJ8FLeDblQGKIIXDK1bAvv
 PrfaL+4s416buNSYwSDNVFReVKoJGt4=
X-Proofpoint-ORIG-GUID: ole0rtuf8-1bYlVKz7AWr0HWPh01ow6x
X-Proofpoint-GUID: ole0rtuf8-1bYlVKz7AWr0HWPh01ow6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNyBTYWx0ZWRfX5GwVFZfUTDlo
 2mzuy2qbvNaEFtTRvcr09qUPpdJSwEUGphAHOcVwzCLOAtgcCnKPaMHEuKvkXCuVo+ESnY85qAf
 BgXcDSWb7ScB3bR0JwgVhWeAv+kYt0YMeNXUDtfpXZokKOmzeub+yifHJ+m0Y1L4WAqw6+4g2VQ
 9+nLyCAiLT/fxFi26LUrXtnDKyfd6Y0ZrY0psd0e9Uaa7O3MqySDxU5fsoIeAjtd6Mw13CgSB//
 QBwJKotkysANpmFfrivDqOtWaLtKMpxxIxPqDuJeZd8lH4+xQu/Vx5z5bHzbiSzkrxhV6DgjT8f
 KEJkTJm0P9YD0AsW0E7hpA8OZ8FWZPP6DoUrTs69viFhiwzWJhOk6fu555Rd3Cpf7W9BPyUwQPr
 BYz0clr4tY90apcqfzRoo55uXAETeNu3SygpXdH2+/rkMrhbUBOZ7J7oPFR8JFORl6OLFrn8Sf7
 eJ6PIACUoyMjc5/Ja4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270137

On 7/25/26 9:43 PM, David Sheffield wrote:
> (Data point from a production purwa device, in case it is useful for this
> series — and one question at the end.)
> 
> I tried to bring up iris on a Microsoft Surface Pro 12-inch 1st Edition
> (X1P-42-100, production-fused) on 7.2.0-rc3, using a device tree node with
> compatible "qcom,x1p42100-iris" and firmware-name pointing at the video
> firmware extracted from this device's own Windows driver package.
> 
> Every firmware candidate fails identically at PAS image init:
> 
> qcom-iris aa00000.video-codec: error -22 initializing firmware
> qcom/x1p42100/Microsoft/Surface12/qcvss8380_pa.mbn
> qcom-iris aa00000.video-codec: firmware download failed
> qcom-iris aa00000.video-codec: core init failed
> 
> i.e. qcom_scm_pas_init_image() itself returns EINVAL (the dev_err comes from
> mdt_loader), before auth-and-reset.
> 
> What I tested and ruled out:
> 
> - Four genuine blobs: qcvss8380_pa.mbn and qcvss8380.mbn from both the
> device's official recovery image (April 2026 build) and the current
> Surface drivers MSI (July 2026 build). All four -22.
> - Signing: the video blobs Microsoft ships are Qualcomm-production-signed
> (cert chain strings show "Qualcomm Cryptographic Operations"), unlike the
> adsp/cdsp blobs for this device which are Microsoft-OEM-signed — and those
> adsp/cdsp images PAS-authenticate and boot fine on every boot, so the SCM
> PAS path itself is healthy on this machine.

So it's clear the issue is that for some reason the loader rejects the
firmware. The fw has to be:

* accessible (do you have some odd file permissions on it?)
* valid (does it have a similar header compared to other MBNs?)
* correctly signed for the device (may it be that the recovery image you
  mentioned may not be exercising the video accelerator and it unknowingly
  ships a not-quite-right blob?)
* loaded to the expected memory region - some older FWs (as in, on ancient
  SoCs mostly) used to be grumpy about relocations. This shouldn't be a
  problem nowadays, but it's worth keeping in mind

> - Metadata format: the failing qcvss images and the working qcadsp image are
> both MBN v7 with identical hash-segment header layout.
> - Version/anti-rollback: April and July builds fail the same way.
> 
> Since Windows runs video decode on this same TZ with these same
> Qualcomm-signed images, plain signature rejection doesn't seem to explain
> it. Which prompts the question: has this series been tested on
> production-fused retail hardware (e.g. the x1p42100 laptops), or on
> CRD/development devices? And is PAS ID 9 with the OEM-shipped qcvss8380
> image expected to work on retail purwa devices, or is there a known
> TZ/XBL-side requirement (different image, different pas_id, secure-boot
> chain state) that would explain init_image EINVAL on an OEM machine?

PAS_IDs are common across all Qualcomm SoCs and have been for some 15
years now

Konrad


