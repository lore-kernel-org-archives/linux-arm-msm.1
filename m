Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD2D374A11
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565904; cv=none; b=oVpq7sIcimkdEv/xEEPz1KRIiXDlsyu5NKVmV0pQuCKhLk9qSr8wwUnZ7Z9wwIx3CpWmAy4/Xl3aBIwiaaA15SdHHMUgPqRWWqRPaFMYorK75CBS7as89G6J7qSaJ1q43mspTJkPAntzOsIIdk0oC7E0ceyoDHa2rnw0e0s1efA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565904; c=relaxed/simple;
	bh=tCXPfjbfeyr9jATJREVrmtfpm482cc9JqBuaA4EqFHI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EzaoZriM0bqIWbVLBSU8Fk9AsvFHpXcsWKu7MEo8+C9F58dXgv9lGXSZWrcTm8XqhhaibiAR1FFZ4l3lMYZMETu2TKRGOIfYtz9VLr0wk+gDDoV2jQiiDsf4bYkfWY/A9UE+z5kKAG2qBlTTq7me6fWv0gOPUxKdxqOAZcZfTfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FCBuhCT0; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FCBuhCT0"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so5478189a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787565901; x=1788170701; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=FCBuhCT0871eeU4ZYP52s11ahqGF6N3bKzYYiLQMSApSVBIKcHKc/2UKLaVWmpyk1n
         UzuXMN3+vc7B6xgPo7M4WJ/M1AZpKUl00x3VuCjGcS8cXKJlUFEYOcdWTwaZjaD3G5WX
         jVcs84dRh7lvIbYHBdBoikBaezGS8cfijt5oOPi4+3xWIDCt0rl9XvxLsLzmeutc03Fa
         qWnMPlXKK5jr2EdudCmvirFuftof2ez8KSbmxhU7S5RD8eKL2+fZ3lkU4HcxjTh55rER
         G8f7xH4lE399IaeszXqNIjc6pHIixj4ifJPZwB2FxooUYfVhkE1736C7sMYtwNjLCxUI
         CRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787565901; x=1788170701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+EXhzdCNyL7BX1v534o+kUhKJJy7+6exCGtwlOH/1M=;
        b=JUsuTgNNLftqCsiAIV+Mla4oDhFEOjxZ0QLW572/FCrckvwkrWdH0YXG6vZJBDrgZI
         gUovBJbfQAI8XLk6bHj0mX9qKHsq//fX+VXPDoQWmN0MmfW+Q+cwGN+b+GcltVUMwMhn
         Z7voPzU5Df93xq3Q02HwQzE+ZanmFr5B6v49OcfnZFWzYVlI+0xOCNm/R5KdiHeTK7bb
         qvJ1vZvtKy+/zacfQIJQ6rdlgSRgPg+Em6pcIBAkHRhtKR98/DhJh5Bho/Yejhbh6J85
         WM3Wn488j/YrdJgCyvrOocMQll2jdw4P02wsZqD+iOwFiKaaQOeVYYi+0datgBdM1kG+
         Vm9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq+8KvoaVmzQrK1JXrEso0gAPNhLSTunejfRpJvt9hNQDsAJnOVEaJahhon5726ArkiV1L2ngMr/qxcvZH7@vger.kernel.org
X-Gm-Message-State: AFuF++nZ04UHuRha7Gtxgz1ayInntiJblW+ypKr5u0cxEWAV3SZPrqEv
	fLKxCR8RSMaCiwmWsPMbl+Kf1QyCbthFcRSuONJtm52568bDSJKANwf/UY8KWK0bGoA=
X-Gm-Gg: AR+sD109bhHRKILJS1bEUZvaDGSdbB5DsN/oO25BYuXbayQ1JHinsZaQ3nuP+1QSp55
	qosp1yVAmgC5zbOyo6pCVgO4MCoh4zbzVTtJvI8fThjIa7Nq7limwshA1plwtWTv6CLcIxTAzQO
	eT7Imlh3IAhfqVtFqDThEVNN+nIm/OyIdCLZeycgebjDK/wFf0p66xAF2AQsnwJEWtQHDsVBPKc
	PBs+7elaCRBdCWLA++nnDCGrqNUJ2wsODX14Ow7UurL6jsMeVjzjk/8K6O+352YmQoBwfE1g9fz
	CTIWeE57p3DdXQ17KlJvYZHaTQw96I4Wu5hVMP7D/wLc9Av0meNjZeUU+eQ+9zY4naeWpihjWCX
	ejIjfnTw2Q4s4+Pc5fiJ0A1YPwBMeBCw2VUxGk9oNjjFfJ6IGmBrr02MEatENXxlXjBseFYrWGN
	OuyJSj9KQM5Qk2VlL/u3JMrAuCga5eEk0ePpjl9fWGpWrmLNm8lk4tOqxiPbjo9tRpzNO4EB81/
	5VsEsCvwc4J453/F7SmxZWtcQOA1tSoOg==
X-Received: by 2002:a05:6402:21dc:b0:6a3:fee5:adcf with SMTP id 4fb4d7f45d1cf-6a42f14d952mr27894029a12.1.1787565898379;
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8922721a12.29.2026.08.24.03.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 03:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 12:04:57 +0200
Message-Id: <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, "Will Deacon" <will@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Clark" <robin.clark@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for
 instances on MSM8974
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com> <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
In-Reply-To: <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>

Hi Dmitry,

On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
>> Hi Dmitry,
>>=20
>> Many thanks for working on this and sending this patch series!
>>=20
>> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
>> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GP=
U,
>> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
>> > spec, however they differ from other Qualcomm platforms in the
>> > implementation-specific registers and also in interaction with TZ.
>> > Venus, MDP and VFE SMMUs are secured and require programming only of
>> > CBs, while GPU and JPEG require full programming.
>> >
>> > This series skips IOMMUs which can't be tested right now (VFE and JPEG=
),
>> > and adds only MDP, GPU and Venus (although untested, it is required fo=
r
>> > display to work) SMMU instances.
>>=20
>> I do have a patch series (sent years ago to the mailing lists as well)
>> for CAMSS so I can definitely test this in the future.
>
> Ok, let's land these first, unless VFE IOMMU blocks display on your
> platform (Venus was blocking display on APQ8074 DragonBoard).
>
>> > Note, to get display to work properly one fix is necessary, [1]
>> >
>> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d=
2e@oss.qualcomm.com
>>=20
>> I've applied this series on v7.2-rc7, with the extra commits between
>> that and linux-next for qcom_iommu.c backported so that your series
>> applies without conflicts.
>>=20
>> So far I'm stuck with the GPU not being able to probe, adding some
>> printk's shows that in msm_iommu_new() the call for
>> iommu_attach_device() is failing.
>>=20
>> [    5.971154] msm_mdp fd900100.display-controller: failed to load adren=
o gpu
>> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00=
000.gpu (ops a3xx_ops [msm]): -16
>> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -1=
6
>> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to att=
ach to DSI host
>> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d=
6fa1 failed with error -16
>
> See the patch [1], it's picked up for 7.3

I missed replying to you, with this patch the display lights up again!

Unfortunately the GPU still seems to have issues, I don't have a log
right now (I think even SSH was dropping then with a bunch of log lines
appearing in kernel log on screen). I assume kmscube + more complex
workloads worked fine for you?

Regards
Luca

>
>
> [1] https://lore.kernel.org/r/20260730-fix-qcom-smmu-v2-3-18e0daf2d836@os=
s.qualcomm.com
>
>>=20
>> ~ # dmesg | grep iommu
>> [    0.127014] iommu: Default domain type: Translated
>> [    0.127052] iommu: DMA domain TLB invalidation policy: strict mode
>> [    0.739899] platform fdb00000.gpu: Adding to iommu group 0
>> [    0.741358] qcom-iommu fdc84000.iommu: iommu sec: pgtable size: 90112
>> [    6.006877] platform fd900100.display-controller: Adding to iommu gro=
up 1
>>=20
>> Have you seen any issues like this?

