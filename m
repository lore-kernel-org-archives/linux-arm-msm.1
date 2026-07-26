Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D0E2931D8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785043357; cv=none; b=Xhqs37evS+n6QXrmdqYoh9Lf8IZH47G6TB7My6maSv/UrUhKv44GMqa/tedu0ULqNoSJduDpxf4DpUsAUNts+TpRl6F+qVAWKf9wYQADu4TRySsoPhfGEHhD1tLSxu2QaIsM80Fs7ThH/nDhzJRJhW48vfYva2aD3rax4G4Q3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785043357; c=relaxed/simple;
	bh=7k6K1PiBApSvejyZQ0+Y4VjDSn3FCLyz9zUoxrkhYnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3yWjwZvXwf9HYtP9orylCyHzZ3juLWyMvc+ZZTTqmtKwcviJ1d0Z1l+XvEmPX8MeuNB+uQmxMXtXYv7ejCtq01aLoe0zjOuiM90asY5o7QY9XHRI7nL/Aylsq4nRNTcvwX/C9AA/CHg6emJ1P+T5P/IpzC8tRzRiGhdJkklGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=F2v5CmSZ; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="F2v5CmSZ"
Message-ID: <1118d9c2-4efd-48fc-8a3e-c2cc3eddc940@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1785043351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0k0s2W35VkEDetI14N9g137qyuAAsxnWK+1IQemxjw=;
	b=F2v5CmSZjS/RlEY+wFzcgQgRKhsnGuyysBqRBi3svQbQHjkKzlWH+6DaCce856s4Zv13SM
	vbBlmSeDQ51Px0o65Tvb8SZhfwMiwZnK4H9W2VvBJY+XiDBdifO4d3h/xnR/7QKb4zx0Do
	PjZ/61pC7nawNrpzWS7jgsxN3Hu2o9bU4gZvlqjXwpQsX0xcxPKCr8C8qVSC1An2ZAox4f
	+JryPuTNiHxOYuUpEiMz9sxNU665SqgoAO6MUUdvMt5Gpqql6RTzODZwew3sxSttSyqxef
	1oh+lPEXBoPdo8pFyFkwbsoPcL/Kn5TAW2oQz/smh10EguqElr99MRATy6cGag==
Date: Sun, 26 Jul 2026 02:22:24 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/12/26 5:52 PM, Akhil P Oommen wrote:
> With the introduction of sync_state in the genpd framework, any consumer
> device of GCC and GPUCC which is not bound to a driver will result in
> bootup warnings like below:
>
> [   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
> [   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu
>
> To silence these warnings and also to have a proper state in driver core,
> attach a driver to the GMU and set it up as a component device for the drm
> master device.
>
> The first few patches are preparatory fixes and refactorings. And the
> final patch introduces a driver for GMU devices.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com> [..]

For the series:

Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455

When I first saw this series I didn't think this was important, silence 
warnings whatever, but since a couple months ago deep suspend started 
randomly not completing (bouncing back as soon as everything got 
suspended) and I didn't know what it was… just now in #aarch64-laptops 
this was brought up again and turns out, yeah. It was bouncing back due 
to sync_state not completing for everything. This series actually makes 
suspend reliable again!


Thanks,
~val

