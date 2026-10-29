Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309778;
	b=Lw4ZvA9MT8YsZgOUBitlmOhp2DNZbhFupiodF8wk/w+SBnZVYYcPvVoW/Lfa2xLiqSD4
	 I2wy0LyWSxUYr+3jEDaxEbooyGb2lK3X7sF6rg8ucHidNgcggvzlcVbebdpdU5iQB4r9/
	 RSKINkNqxvm0eV9+SrbMLDvNMoGfr1ptYWuxyoMxcIXvQI9M+JMfnEIKwELGhMor7C/Tq
	 hZ1FWPIDR3k/+x0lTiFGGdPbzYOGknNX9VB795FmbSwLQuDi9AalCFkaNECWkZzWQh02W
	 Lc2iYis4h18S+PvyjlJ7EaKcx59F2ZObn4u1WgLadmbrVMDdG9IakEADir8yhWCnQ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309778;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=f7WfxrRogWkC2VbFyxZ98k7BXu/Nz4K5mmRfBODJm7c=;
	b=XxF3zh1pklUyHyPV/GOCD9st1DUeEtcIz6dZ57aX8SjchulgZiRYgW02d7E5RxLjwZ7L
	 NaExuN2AvVTA39EVBjy41gfQ3bk8f7otm6q9V3Qyc+Hr9UsZtp/tEQi7e3/sV/rVsvmY7
	 b9wVVNqywh3nipbRmhNsgNdAdmBe+nWqKjjRa1ClekzzPlrYtZ8gSlDheGFFwW1BT2V+8
	 LV+dRqhuc3u2Sn3o418A6ojjwkR+RT8yp73uYAFInk7os+ffJHAd/qkxF7l/cckPR0Yug
	 xXmPqB3krt0+AwyWQwsT6O+2pCIRXWKVI3g1KHZo9Mbk+qK+ka0eZtlVPot0EBhEHqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RGRz4RjZ;
	arc=none smtp.remote-ip=185.70.43.100
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F65606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=RGRz4RjZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793309775; x=1793568975;
	bh=f7WfxrRogWkC2VbFyxZ98k7BXu/Nz4K5mmRfBODJm7c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RGRz4RjZPwzVZeGbBToJdHMo+OaHTQts6Ik/SS/fwmTkeCTMcz1zWKqsm+x/ZxADT
	 T2KPKeEexN+gI9XqMVz5uiXc63XmcSLbiWl8Gu9xKGVrxrhJw8Sldj172bZSN0gOIo
	 Zq639wiNLAqct5bc30Dl1hTZoMmzAPcd2hxeec7PkX1PCy5tuJ48m0QKLl9oeTIj6O
	 sTMcx7QkgxhwurPmLt2HwObYE/eJbsnDnrMmAccWVgvYM4y1ss9ucCgsHvTTxWWSDi
	 ngklTpKdgiZW/PSlrpu7Hd+44uL+WltWW7Vja+LswLtJzMXTy1HCMBKTE0UAMeMhXT
	 1csCluPlIsP3Q==
Date: Thu, 29 Oct 2026 21:36:09 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Jie Zhang <jie.zhang@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 00/16] drm/msm/a8xx: GPU state capture support
Message-ID: <VVkrFTcMMRB3AjgGdwPgywO5nl0lDonm4QscNx9WTaYDTcuVQAHLgWxxkr7ool-1L7F4AHzjDKYAaq__MogbXROR7130sNTIzaHqPTyE_EE=@pm.me>
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 743194d165c51664fa7869c239141108936401d4
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 29th, 2026 at 4:17 PM, Rob Clark <robin.clark@oss.qual=
comm.com> wrote:

> This series introduces gen8 devcoredump support.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a=
)
