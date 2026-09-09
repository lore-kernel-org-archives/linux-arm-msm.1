Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F633355F49
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935627; cv=pass; b=q+IHoL6DfT5c991/hQr3vob7fMMch2hIGt+YL3RIHoShrIutY+buGk3H/uLleNbckVsEp6hWrxtRGqyAm5Uiw+e6v0WmowpyObWR97bRmaEtO2N5FpkEnkF+9Co3DCu02ACPtfSzci9j+gZlbdayoSdQ70UUjXIFhTevl0lucTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935627; c=relaxed/simple;
	bh=18Zr3UdkPL5YGneMwhBfVyFM5vzCFjokkjS/4aofckw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnjxDZuEBNXmOUJIvQfd96V4AwmYYWB0EpenPgzdhe+GXntwIBmnlzzVv7vfM8QLZ1t+pwUc9S1EsHXY2lXPZxUS+Q3ylgb9xxtIMpfxO7Ubb+RJtsXuULQ0wbmzypVwEPVw4aXormBPkZOkM3Fe2kQl74VQkrMZvmbfRlz3b+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zb3O9jTD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+UmiBp5; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zb3O9jTD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+UmiBp5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896PWNk337750
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F6ybEqTWr7PTGYwKjzBDvKVQ
	3R5C9k69c4zwqDv/bw8=; b=Zb3O9jTDa7TD3YF5CyohMezRJnRYfRROVFjO9ENt
	a6+cMTTOzkJ1jdnqKiEf4Snc/tZb1VvPHpMi4wYl866F0UHYbF4YCyXeytCHz+OE
	5aRd8+iqX+8qoq9kQ+6FrjSWtZab/I0T9Eg6Ddvg+zt3xZHqjzLWqaSUqaLs+YB6
	rC7hSZxYkdmMFAnWj2FYW4hTuXobdP3fxpCvrNvos35xcqov05tUdrMVI7bxSW7q
	91G/1/N600LxVgYa8hf78A/77fHItvLIcIyv4EECHJhkeF4+ATf46nvVstzGOiYU
	cYanulIdjdx2rvpJDarP9ttc2t2DLJlgN9dwPk0EsBlJqA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7jffw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:33:45 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cdb701595so6193684d50.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935625; cv=none;
        d=google.com; s=arc-20260327;
        b=klIE/d9vVJ0HXLroI+vQro9g6DcU9jkG3av9IVw1k5l29vTojxR+akC+CXweTec0XA
         0dYX4RSwpWCntARdUbgKHgqwFCAs2AI0S3Pv1iT7i4YsHwnRTeIPv19bRbqZqv5sROPH
         6qiXnWcdZWZedgyhMsoZi8FWqwNIlufcw/4VfIPRv5ymzCmMDpAemN4PZOCWAXLbv3Xf
         5pF6t5cL2SBgrP0U4ea0W7HLrPUd/hxHqOxpUXyBjBzOL7EGATquh2riQbwbiDxKNHyq
         Py7klPLXmxGjlj/o2fVsjUfq/XfOUYX9SeWSWD0Nypf7shH2+kQBufw1MxhKQ025n//Z
         2lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        fh=S+r8l/qV3OF75ecxIVH6Ora3Y7YZTy6um2LdynZqYME=;
        b=EwnpNdmEMIJPuakNgezxlJgb17qTNAU0Zyx1Sh4xS++djryAxmRCK7OGehGtpyov2E
         AsvBW4lOlJJrSI8mTIn09LpxKxYHpu3yw3z0hHtweRWX46A4UILbvIGUPxuvTk69IqPw
         uxgRN48/jgrMiaceVIPllqj+G8bnwpnWlHuh6FwCMx4y/J1QSN7m4uZj+qtbrRyrn+26
         loRtgNK1i7OwgH3++XJbSJe7fBz67rGlUz4U6+Iqib3xwNJupYy/z8d3RHLiaX48gfj/
         QrZLTYv7BZ3bK2ga5MQEQZmLS7+d1Gb9AAE/B6TzneezHu8epngmE+1ZFU71VupOyaPf
         GLRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935625; x=1789540425; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=E+UmiBp5BRAVIODiR25zkv7V9V5Fkeb8NFapeLUY5tC73bEleyocPmiNJZMIXuFxei
         OZlJXBScH63McmhsAsSZNbNbG3ImsgyoL2bfsJyp9tbvMX92K0trrOfT29krlsEmEuk8
         jG2OCcL0+yfWdBeYwIJBq16a//EeJmeOATum8ikS6zfJkID+yOzFXaZh2XiPs6rd68u5
         dG/BMtVAt5QJ4n3Eg/Sle2Xm78hq8JnfRghQ2Hojno5S02pcgDB2WIxu/pzPhBhOWOje
         CNL0Q8KOZ2GeWzfz9FhHdUis9+U1CIgRUc7a/F3iwrvUchtNvdmp2/jD2OLynU7DI0tK
         DveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935625; x=1789540425;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=F6ybEqTWr7PTGYwKjzBDvKVQ3R5C9k69c4zwqDv/bw8=;
        b=rxTwdixOSr/EKYdG+PVxfCMOalkepkQ3C9VcK47O8JYBwKpjDb8o3TU9fFANKIrBd3
         xSKstMpI2rabUvzSRqY/yKGr5CqfB2vJFPhULYnH+pdmU3I2dB82P1VV4NErmHqYVRLb
         ZksE5ASDr1uAIX0q1gyO7/njdjFB9uCJOo7c+tijCW8et5WK77W1emWrHrLhfcsdsKad
         lek/nEt4LsZ01pF5To2JDpHRN+X1dKeYEuMgVDg4s0l+m9Ig8B3whjHKTu98lF84A+OH
         oRxNduGJjik5tr5nQsvZxldNsZfMybLwvlJk+w6rAsWAhAKp0mlZKo8Zy0ax0QRElz1M
         2dzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiq6xRhakjuZm40KPpSG99v57uwu18EsA6aCcTKyZJ6E779TBzeqlKwe0Ai2bm8b13xGGsEsHaf45PT9bN@vger.kernel.org
X-Gm-Message-State: AFuF++k8mWUoomlNal5AGYwXsE8XrotnHi3gdksCIiHD9nuGyLq3pC/0
	sr/IJabOSGVbcXJImxMTL9t36gnCbd9t5epfTtkTZlJataDa7Z1MYGt8fBP5UtX4SyPmU9UYiIX
	yv5JrfrSwbnIXe/WbZO4HmhT2aFb13KeeWE0+HwJUZz4EABMCcfkIa17jfpXW0YBqemZEqNcW1S
	UUMa3EFLg1UKaPz+9KZay3AtE73mBEbLzUrg2IPxqnWVY=
X-Gm-Gg: AYBFou1EW5bH0A7qQ8QNSTdMuvv4F31gJDXova37Nbh0j3zqUomVKwlnmiZ/Y3WFDT9
	wiF+2i77JHnKlKxFl8a6i6b7x9zB7DPJzQZk6FAclw6nGm8NQk0rWaPivkYV2gy4DPB5o04d2W7
	mobVp4AQoJVrWrbX4oYhUR54IQIaY5ailp1S4qygqj9JLJbHnBSljPRIKCYQ==
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id 956f58d0204a3-66fc1be8c6emr6652763d50.54.1788935624948;
        Tue, 08 Sep 2026 23:33:44 -0700 (PDT)
X-Received: by 2002:a53:b604:0:b0:66f:c1be:84c8 with SMTP id
 956f58d0204a3-66fc1be8c6emr6652744d50.54.1788935624539; Tue, 08 Sep 2026
 23:33:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com> <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
In-Reply-To: <5e6d52cb-53f6-4af2-b1f6-d894d8dcca9e@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 12:03:33 +0530
X-Gm-Features: AcwNN1WQUsj5OMuHNikswDVbQA10l--Mx-WHy294kAjPi8kkiskKKrtmL0NvCDU
Message-ID: <CAC-tS8BnLzKrtz_rJ-ScQwbfcvFuj5ptOBzXgCSCgUaC_gUCVw@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX/CBkYGbsHb3T
 4plcvAPp211+gXT7eGcoILbDGstbXcpa9v3ddTQNE8o5M2BWvKdIZLPJA6md/lC5JCa79ErmQ4X
 SDz8AdWb0HVXC3jfZ9SUIpWYkgC+w88=
X-Proofpoint-ORIG-GUID: llbhhabIgUHNowMwouw9f7dzO8Dw4kjM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfXwHcB6jkOb8XM
 hKbQk2v4O1D8iWr/YUbwtElBElN8/+e2zjP3yikzEVVSPiccteVrIyHgLWZPToIGBOJVLLiEtut
 dZSKsoBHD9xFkKbwk2pKhRlGgftjbMZj50Nou2YRGpWRRDRDeiejtkawnxjoRhISnPlZUZSxaKE
 fh4kWxhbn7/2J7OxPJz99rn4yNa5sALQdNiX8jMZDzIFnFdqgo5yQbSsW7LeniaoCUqRqHnIBRu
 6UgP6kbWfqAWaftUSG6rixdiThx5+11gfUAyC1f1iiqIlfa8Lyzgz/iQwqLh9+chhzwK99lqH2I
 MJTpYhwq6GaLu5ZyCQZZ/UMuzAzXfMJuH5XvTQm5UuUZodHyJRZfyr0RO8NnFXIyX2GaiZDnndZ
 9+8SG682yVYboPAJNuyPjqBhzACOE30RiVQw2EtQj42HubgWBItJKz85PwmOmtrOGMYJNB2oyX+
 e1JtoyWh5LXunQpOQ/Q==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa0fdc9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=-dXBdVp_9Me3CGyqtu0A:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: llbhhabIgUHNowMwouw9f7dzO8Dw4kjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

> >   qaif-platform.c: PCM platform component. Handles DMA buffer allocation
> >   (dma_alloc_pages()), PCM ops (open/close/hw_params/prepare/trigger/
> >   pointer/mmap/copy), table-driven two-level IRQ dispatch with
> >   period-elapsed notification, and component suspend/resume across power
> >   collapse.
>
> I didn't notice the suspend/resume support in the series?
You are right, the cover letter is misleading. The driver uses runtime
PM suspend/resume (pm_runtime_force_suspend/resume) for power
collapse, not PCM-level suspend/resume. Will correct the cover letter
description or any other misleading text in the next version.
-Harendra
