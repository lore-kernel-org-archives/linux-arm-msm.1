Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F189F3B6BEE
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356986; cv=none; b=Siw3SLxRNcgqN3WKPA/ele3XjSPRDwz2lpFdz10hYPUlH4IgbenUcFkiKwhyHHT2lZFtcIb0t7bljeQNdjOWYSukT9TSGmsSzLRI0Vi4RhpNQV6cpMSMkltfisjMSAZvBoFQ8QzRf/DcCKs8DBJNaw+n0n597uiiD96rsZLsOYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356986; c=relaxed/simple;
	bh=6/f9wmm2awoewJ0RJjhCNb25rGgSGL053o6mzKpTT4M=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=IJ+GdUQdbgG9BfqcIIiuxBW1DJ8S0eNPQtt8yf+BAFbg1YPNeBaoqlzsIhYjomfRhWzP22DGcSxboOIzQokie906iKu4nqdJlVh7u8IQCqd4pJ5Gku0Kvt91V5Oi/Kwl2HSC97RmKUkf5Z8W7ovZLFatZC8JmwDdJtSvMC5lZv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=fK8c8oGp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="fK8c8oGp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a156627e22so5922506a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786356981; x=1786961781; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=fK8c8oGpIFlqTtRA0txdBW/cTc3vYYR7auns6Dv2Ygd7T8VchqymaRk3esZaMM4dr0
         fl6qDpx451wKA5s0FoPBbAGePzydjaGh5DpTIZErh1AH6iTTNKgJ/81khcZd5vrHUhQN
         F7AU3wSAuP694rIqtYQZLjIHL3Fs5ZkNldSMPyTRz5Ftbj8S8oATMk1AGSOkndz6z6xV
         fT46Uca4zOFrf+ZGXbs4D3agPRqOvn8IQK04zk4exqrR1GTRNkQKb6TChOsaE3PeAcIY
         OWWqP0TLVPm3zrsrhPU9AuEIFC8yurMUuJzMB7yQ7Su8kbnOKkUQBlwafCwIoR/peiwm
         NqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356981; x=1786961781;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0DdJ1gMHWzOjplPr4v+9JtrcaHIdGLk0WTVEXhfhPJg=;
        b=o4FwGkNrVLM87OJrT18FJhuLZrgecELK51uW4T0tPOAq3Zo61/reUKXcYepf54YUhm
         9dCH7u/YSgFxshtauWHsd6YGfO5H5eg14CGjcrlEL/xE0eUOQL3r0s57U9peK6FbuepD
         5QbhFtn/nZVjts5ueLaPJ4zCWmCGpKtUth5V6zCae3cToX5UICRicLyCz3T9R4kqigWZ
         5spDQv6rjUs/NpDlU3Se1mlLKNO1RaZ+PNZyCCXAE/208pk7uT/Fr6pzfnkiXzQ20Q9h
         2TqHDTEHWem0QwSK8UkP1d+YSCoByYSXsWOkG9jtFs7E2WmXPRZGxM8qDajcNqNlX6e5
         eKiQ==
X-Gm-Message-State: AOJu0YzPLaiR0Kk2qqUfxkYTjAiTEQ/6BwKhg9sb5BRMw8BSWpYCAjI7
	EMTsEkxgeVwSoUM/Vc5Fa/SqKJVZyXUU89ST6RjbbSX+0R8DXzUJ7MPubsr+sJ2qwq8=
X-Gm-Gg: AR+sD12hcEevw2zbvpPCPRTM4I3TyEpMhybQYkWgrzD5zqfp88cqZuF4NMCKZCTuYyB
	S+hkRAYcgf1JfB6s1Pu93F4rJK4ThiePnL5uR8ZWcMGe5tGUQV4Pt/tFGfK77o6RbmWljEDwaRS
	hS55JFRPUh4+QUCyfxB+K1DbtCquUETpUb7r8GRT0+8Ft1vvufl+RcbrtHgREsruymeZHZ9FlYQ
	73djWyTTa7HkP9l1wQCWBlscF50zzUkBrzjbfpQdi94mViUpkx/31EK95+b4j5aJvMBYSd2fnxw
	iVGZMYFSVl0qsi9TDhj37O7lapPns6e5ePOKg/txMgY/4E1skIK+OZupup5XLVHIJLFraUEZmXR
	us8o0tp6pfIOmU2XVuV/NvuVj5bOK+QB69TDUptKXXGDyejc7lRwVaX9Jzhm8mY0HVknz3YAkgt
	yhWJIzTojlipp6f/je3wJ+KwywVe20WkwWuStz25GLGWY8o8pDauqDW5lvGVrm91P9fqLVgVE82
	g/Mi2w7CdhmVIpeIGEM4UB6nqhUu6fp+Q==
X-Received: by 2002:a17:907:94cc:b0:c1c:6d29:8a11 with SMTP id a640c23a62f3a-c208d3ec3cdmr919652366b.13.1786356981152;
        Mon, 10 Aug 2026 03:16:21 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a33sm357250966b.2.2026.08.10.03.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 03:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Aug 2026 12:16:19 +0200
Message-Id: <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Joerg Roedel
 (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>

Hi Dmitry,

Many thanks for working on this and sending this patch series!

On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> spec, however they differ from other Qualcomm platforms in the
> implementation-specific registers and also in interaction with TZ.
> Venus, MDP and VFE SMMUs are secured and require programming only of
> CBs, while GPU and JPEG require full programming.
>
> This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> and adds only MDP, GPU and Venus (although untested, it is required for
> display to work) SMMU instances.

I do have a patch series (sent years ago to the mailing lists as well)
for CAMSS so I can definitely test this in the future.

>
> Note, to get display to work properly one fix is necessary, [1]
>
> [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@=
oss.qualcomm.com

I've applied this series on v7.2-rc7, with the extra commits between
that and linux-next for qcom_iommu.c backported so that your series
applies without conflicts.

So far I'm stuck with the GPU not being able to probe, adding some
printk's shows that in msm_iommu_new() the call for
iommu_attach_device() is failing.

[    5.971154] msm_mdp fd900100.display-controller: failed to load adreno g=
pu
[    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000=
.gpu (ops a3xx_ops [msm]): -16
[    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
[    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach=
 to DSI host
[    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa=
1 failed with error -16

~ # dmesg | grep iommu
[    0.127014] iommu: Default domain type: Translated
[    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
[    0.739899] platform fdb00000.gpu: Adding to iommu group 0
[    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
[    6.006877] platform fd900100.display-controller: Adding to iommu group =
1

Have you seen any issues like this?

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (12):
>       dt-bindings: iommu: qcom,iommu: document the MSM8974 IOMMUs
>       iommu: arm-smmu: add global register definitions used by the QSMMU
>       iommu: qcom_iommu: extract context bank programming into a helper
>       iommu: qcom_iommu: support the short-descriptor pagetable format
>       iommu: qcom_iommu: handle the SMMU global register space
>       iommu: qcom_iommu: support non-TZ-managed instances
>       iommu: qcom_iommu: restore context bank state after power collapse
>       iommu: qcom_iommu: halt the micro-MMU while programming context ban=
ks
>       iommu: qcom_iommu: allow faulting transactions to terminate
>       iommu: qcom_iommu: program BFP (prefetch) settings
>       iommu: qcom_iommu: add the MSM8974 instances
>       ARM: dts: qcom: msm8974: add the IOMMUs
>
>  .../devicetree/bindings/iommu/qcom,iommu.yaml      |  16 +-
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  85 +++-
>  drivers/iommu/arm/Kconfig                          |   1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu.h              |  10 +
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c            | 445 +++++++++++++++=
++++--
>  5 files changed, 517 insertions(+), 40 deletions(-)
> ---
> base-commit: 6c5c106bff878247a9cc7255077aab9040df8bf8
> change-id: 20260809-msm8974-iommu-upstream-144b1e2a15f0
>
> Best regards,
> -- =20
> With best wishes
> Dmitry

