Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D0411A1C
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386064; cv=pass; b=cnUpDMk6yVB5Kr9m5S7T+BWs0+nwEvAl4s+V7Xt3EWmHvN5qfX2l6TtJAsXZGK2NzSSYHsVxlR0W8+RWxVMHRmDA++E5EecaUcNW5y/fbAEzO1rERqBt04sLt5crWRFX9Pb7hAWSozl8IsuuKvZDzW0SZPEIZi+6X0d7z+CJXh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386064; c=relaxed/simple;
	bh=ACSYctTuKq0edv1YTfqzWElZtHfVIISbGm+LO+Emokc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkVj/gtNqdV4wvDl+De14CZPwJ8XQZJsvuvfV7Fi6+HxknVB3lNB2c7fPTN9/zLO3z0nGftSIIUgYniV3FXUTjxZZ+ud+WRqqwdy+qIUZNK50YOhxL4gPnxnD+CnNcTM6cag9sha9gRjyYpvbpCltrVoJrAtQbllJmgDlYxtpDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XV9JI6F1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaGS3rKG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XV9JI6F1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaGS3rKG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtTfO3250224
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 15:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=; b=XV
	9JI6F1aO7kD2JUhvL3KHAXP4DYBoiUBuHa/z27oUbz547pz2h7vCMFuZBi/a8aI3
	QkB/k9Of4H/KihDr3p3kDhNxnvVRB3FGfDDdXcy4oGG7m68MoNNjJEkyno2+k8AQ
	E1VGxspJyKAmuYJvn9ULFXWlFfpuT0ILQwL62OIgYSGYGpJxOkMWw3lGYik/M642
	6xFobhZsR+6MZGxvNz5ExyIR22mg0N0cnSVItzD7LlxX/QGPHeS8NfalxpIovXLy
	Z+yr0wpXs4rOQZmB25gS3QGAVJkUo9Vt9b1NHkhmnJS1WNn2w7/EW0CZkBIeNfqy
	obFi5OxyWtOuC3z2tRUQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mge11mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 15:14:20 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6dd1142710fso5238267eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386059; cv=none;
        d=google.com; s=arc-20260327;
        b=rZH1Ev6PbdBNLbFR7Y5an5A1bCjK3dAnLKykimGkqL4I2/cYMachGnSCdov5puAYMR
         z4aZza3wR/6t4uCIyM31LCwfxGguGVi2sxJSox/EznU2OBm8IXOrViQPn0EsYOYGkXLk
         4A3mqg4hPvRLsVVbs9IP/wXctFZVARNDoBaMpDWtbU7LEuXo3pgQjx48VcE06Neubtce
         +G2WzbkRG7Xv7jqGxDYCAgz3Y+RPIuy832LWKogL0uHbPb3SglxMiIbdxaSSLP2c3WJG
         /iJyAi5PuPuSTunkiPW3jPmWEhKIKdK1hUsEOu2pBNTR+RMmrgcBSvzxOqsRedEvfKiS
         8JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        fh=brY+dpw4d0M4SKFQz85Hek/hhBRuZEChumYE3S+UOrM=;
        b=mrBW1QyvnQusaPfzCKqvCgg7nP8wp8TOd6Lz0+JDrsd1YIhFkIJd2ViN7VBtUZ8qea
         5STAsuB5EYJPGEuC57tBaQ7lj772zQgLyj50vGDJsN85aKnbR+RT2gHFgjrHhH+A/W1c
         VTj6/Pk5P7ons4ZuOsaIBg+43KLV1p1cdYLWHrp3Ck26sQ94l1yGchMUOfUZF8ZvPW5l
         1bNP8Q58Vjksj6yKWB3/iTDE1L8vE2a+8Dx9K1WJaIBmVbAGjqItOoJJEisjSBl3tRhk
         62vQca1h9Grq7+fQF8eguDi54Cpn64VNgHeKV6vkzYsLhutldW1sOw7Af9h7X1U0tOUQ
         XYJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386059; x=1791990859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=DaGS3rKGJ1uJeKfodrubT818ojwNIg0lPKzP7XfSqPgUslHdZQnNdA51T8e7+gPpW7
         6X8LUIGCNYkbEP9GgRq4KFNHU3xgK9jyRXL3TKv330BtJZellvpcfX12foU0wcTNZ7tu
         Ai6BbBNnXP1wRE6oypZLEvoEsjFavM7ZPH4F0M+SuTtSq+lMMkoAAvwp+T2DihGZMLe1
         XlbTj/7SwyGEyhywszo0E05yka176t0upJY5ns89BZFAEFiupT0cU2teGo5qxt0Nyp4g
         FsIW4tNfwi0ravGxceRdoOqPhUyy9ty/USEimivZMqJkBfQTZjTdIR+CR9pxvlxq8+zo
         4LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386059; x=1791990859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=niaz7GvttQTU2X5/9MyuRq/Vh7CM/VPO7BQqdW/7JsFW77hre9kXWvvj5ob3SnmGdp
         JfDo0RO4vfGndDRBTqSFqkFd8mVbgqm5XcUWaQmg6bAiT2dYaMzy+oIbCQnaEOU5EFrI
         PZES4QEHpc5pvbHLPpnAh390S0HaYuPmsqAVTtMHNs3S23OFVk/7wu4bFgVyuK6jSYXf
         MdFDlNrH2yYviyjBwKvsqFEgqq+io1pv2QWZuXnhsAOvwVAmxG4mnPdR0Sj1JPa8kvah
         E57Qz14IqP4KG/Q4KonLcuyw1XlPwk23Pi76Gd926k17Xmohu8oiHdhzd8etSAIvhfZC
         vOGA==
X-Forwarded-Encrypted: i=1; AKwUvBw6ckAiiZBZ0yfa8+VGUQVSFg7ZD+s9yMXTWcBBJSJfDrHsIUO8TYNWQmtzgNkG1exsi/Xr7u6wzxHspf5I@vger.kernel.org
X-Gm-Message-State: AFuF++l8tdwQPF4Ag6UcjTrzlnbNS8MfLCxqoobGrjmrlWksqxW1CYfg
	eZr6HGBUqm7utPVvy2nutiUAneuH2fvMPttm0dS97fnHIB472LCp0NJ8s9ZYsQVpIWLWCrhs4j6
	afsHWOsHtkN29f9PIyub5x6BQiCg4RBQ1cBm3pFRKW3VUUMtLmUCq1zh+me2iD081TQJqgudWa4
	LY0FEySaXV/K0au7TSZTKnKOhnBThXV3MIEQYXbsxahXU=
X-Gm-Gg: AYBFou0MSagnKxUQsWxuWCDUSUPibZ+C2+kKRcfaUo8hsTPByvUj61T54wqzZMKX+4K
	GDecJ0IpdRxoL9L1FX3/rIEOj6yGYv1ze8gt+kmFDIwWriK6smrRfr98tGs/vWhH1BFHhSzZfky
	ykjcBVuRtKAZSphhKHdTsTtIETaJzKeSJ6zjYKmi9GxQpOBPgqVKVMKhIt
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id 006d021491bc7-6e7a729155dmr2528846eaf.46.1791386059536;
        Wed, 07 Oct 2026 08:14:19 -0700 (PDT)
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id
 006d021491bc7-6e7a729155dmr2528820eaf.46.1791386059053; Wed, 07 Oct 2026
 08:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-5-robin.clark@oss.qualcomm.com> <20261006132545.8BFD51F000FF@smtp.kernel.org>
 <20261007052330.39998-1-kmehltretter@gmail.com>
In-Reply-To: <20261007052330.39998-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:14:07 -0700
X-Gm-Features: AclHuK8EBLwtBO-Vlh8FHgDrHt105FPpsXtmu7CifdypQkUFfIWf2MiobeJA2n4
Message-ID: <CACSVV01gRju3CkSR093Y0-2qL2ghmi=GZXZW0fBZjxjue_e6qg@mail.gmail.com>
Subject: Re: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX1zRTEQZf8jLK
 m2YeUKgtFjjie2F88xYGv3Md4M65+gDYeKJFy3vvnhC56AvKtGtJTStU2ReA2Dsd22XIFhgR4jv
 D0VJeQGST8mQCgzf0zG0eOX+psgMkz4=
X-Proofpoint-GUID: 62KNRb8iYBtNU9OrCl50iCaURMfEYzBp
X-Authority-Analysis: v=2.4 cv=PdJqFShd c=1 sm=1 tr=0 ts=6ac661cc cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=2Fj81AndoEX41f5wj6YA:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: 62KNRb8iYBtNU9OrCl50iCaURMfEYzBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX8Ho01t9hz0cl
 6fCavUWKgTZNaSuHviOEfRFLc0hq0GkoU2XFX6xyN+4YoOcF0H3fOAeKxgWgMMG1jOqc2+kZw4Q
 26CKKo5pPCIJwY4nA56/s3bhGZZVmVK8ys0RRbsjQkQhYewr29EwRQtqLi2I5AolsS4M3TNkWWU
 Qbhdnd7qwMdkpUHbc5SXP5IVORX2J22Iw0y1nLd9A2IeuQuzurRM+08XmXziajTXVL1u9H5hDb9
 MT4381b+wafTTlt9E/ZGHBS60Z1BxnezbyYj0u+uzXg0id211XijHHYPHNZzrssHw4tEh+XfDCI
 IgIrHDlraGWolGojpbh8kzHs6oOXp8b7qh/HmmJMNWPi4pmOMFi1nBHBbW9mJBfUUVh5nRx9YQd
 z8VsBvqR9xxsGiohqahJmuzlWlqH2ayYBIM1Vvm2ocSeVmY+K3qiMM11jnJ4xCS9rFa6lghJ8Rl
 tViRYcddeALibNxv+5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:23=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > By passing NULL for iotlb_gather, does this bypass the IOMMU driver's T=
LB
> > gathering and flushing mechanism?
>
> Yes. On arm64 QEMU/SMMUv3, unmap_pages(..., NULL) returned 4096 after
> device DMA populated the IOTLB, but the next DMA still reached the old
> page. It faulted after an explicit IOTLB flush.
>
> Using iommu_unmap() invalidated the translation:
>
>         return iommu_unmap(domain, iova, pgsize * pgcount);
>
> > It appears this replaces iommu_map_sgtable() with a call to __do_map(),
> > but there is no declaration or definition of __do_map() available.
> >
> > [...]
> >
> > Similar to the mapping path, is __do_unmap() actually defined?
>
> Patch 3 defines both helpers. msm_iommu.o builds with all five patches.

Sashiko is kinda funny sometimes :-)

BR,
-R
