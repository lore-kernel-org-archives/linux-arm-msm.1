Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308841;
	b=Fpz75xHrYueU47fs0VTvv1C8Foexvywj6NNiIxbBjM+TiUKSet7Ic36aIy4v4zXrU+zM
	 Yc9hl9OLmIt5Aq44X7/m601WUBN5rKo2nSvSzjPFf1wInhf5F9fsAX4kv5qJ07fVMo/Cl
	 uwXZUOgRy8Q3tFfdyiMx6unWpWGU0cmK3ocWd5MaLCLC8a/1vSac613NS+fN6jqoOzp6K
	 grbiqyCuXu7kJr61CYTTdMSUOSHCJvIEx6X1AzNmzTpmSb0Jww2URezE9enpU/F2lhKxf
	 uGFL4TIluCWmPfCjW3RtYC/xBPQT8c5uqgWeDGasT9Q708hlsd7Cqr68IG8O0OeohaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308841;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZSMB2np0saGPi9BQgWmba3/r+83zAZaobmii7tWhboM=;
	b=mkQMd7V81mC1qVINI8Y4feSbePPxiwi/707p+BSJRlVjzfFiMN+F1pI4sKZSEDF2eBp5
	 HwnQ4nwbyC5q7hMaqAYqnJuiNT6TvybsLwf+UhF/npWw9DMPJNU/xcBY1t8NTJadR8ek3
	 oH++MJa4sm562aT6NPe2Zzk5Lkcap6qZsYj/CWAk9X61SwWwb4L1oheYWOozeFMvv9nOw
	 UFNobICSF8Cj5v2eKJy77Au1lNHsFsp4VoELexvVHKgklJMYOpyEVxDOPP3qU2lGs5OLK
	 +RbFWYnq3woOFB/r8VSGLAONJGj3H8++VWsEyBHd+hqSMwAuBN8l2WOgSnIYxl8otEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ANZHlEDh;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD613606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 21:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ANZHlEDh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793308832; x=1793568032;
	bh=ZSMB2np0saGPi9BQgWmba3/r+83zAZaobmii7tWhboM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ANZHlEDhdkMwH2ixaHgZGtlq/x5AbOL4mGea7AIzCPbMrNvW08KCNe4rIAZE6OlMQ
	 U4rPWQzprfVZCA8qpAUYsBiWZItJYCl5cVKagML5hFKgQXykd7FdJjyj/n1kPwZhDW
	 BTnqADitePGJrx3QFgzjAOvIxD07REtfH7gcFUk9T4VsroObMP6HhLQ+oI60RfhVEi
	 JTvR07OTaM+135K1q1m7V5J5MAExRp9/0xa9ZPSrUtRuHXRGRHTX1GphFZjBTwPvhO
	 HcNvr4W7DdF5zNeLs1Hu1B4ZtLhS8oj2+fTBBSymiAQvwQLyv3vn2W2Nt+Ao8w54VF
	 ubrgPmoZzitVw==
Date: Thu, 29 Oct 2026 21:20:27 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Jie Zhang <jie.zhang@oss.qualcomm.com>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/16] drm/msm/a8xx: devcoredump state capture support
Message-ID: <72mcRc_XaEFYOXsQm5r3_QWSIcGfu2OOwWlCRp086BzS5v9e19_2L3wttKhZOHho-XlIv1lZODbEYPFwnSVWDEQXgilHOfqgP5U0t2xsNcA=@pm.me>
In-Reply-To: <20261029201730.151754-13-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com> <20261029201730.151754-13-robin.clark@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f4967a0771fa19f5e415ddc6b26b2f632f0fe9b8
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

On Thursday, October 29th, 2026 at 4:20 PM, Rob Clark <robin.clark@oss.qual=
comm.com> wrote:

> +static struct adreno_snapshot_sect
> +__snapshot_sect_init(struct adreno_gpu_state *state, uint16_t id, size_t=
 extra_sz,
> +=09=09     void *sect_hdr, size_t sect_hdr_sz, const char *func, int lin=
e)
> +{
> +=09/* A few section types have no section header: */
> +=09switch (id) {
> +=09case ADRENO_SNAPSHOT_SECTION_REGS_V2:
> +=09=09sect_hdr_sz =3D 0;
> +=09default:
> +=09=09break;
> +=09}

Heads up that I'm seeing this warning when building with clang:

In file included from ../drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:9:
../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: warning: unannotated=
 fall-through between switch labels [-Wimplicit-fallthrough]
  398 |         default:
      |         ^
../drivers/gpu/drm/msm/adreno/adreno_snapshot.h:398:2: note: insert 'break;=
' to avoid fall-through
  398 |         default:
      |         ^
      |         break;

Thanks,
Alex
