Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBE1A0BE0;
	Mon, 27 Jul 2026 03:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785121734; cv=none; b=fV6AjJEIUk562V0C0oVBwxJq4iOnJPqNlbT5wR5lrcQrI3qTN8fhl9Uwomp33yrO6V3G82J+o6JydD9GXC/rabSBPaZisZde6+UxW1EVyE9v9gy3KPWsk3ZrzlSw8JWAc2u8kMVfU9a5Pj455er8aT06wox5JH/9Y+1fAoQEUqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785121734; c=relaxed/simple;
	bh=6QHp3/ubXQwK+p2GpvX7O+6/lmsAW5FR4tAQM7WYA94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT35+qng0EXhKs7uSHP1owOrCxIdALWL8SgfxkIp4UiTOUpt0QcoxSSSzbk2oX6qHe0Kr5ziyuTL2KU25S0lF6bg/RvNtcQmFEAoz4R5Kp0eUfVqUzHWMSyOBZ3ol5uzbFJhBDRL4isqEVO3cGBU/kMrQE0sFjcBFSfiDqAIeq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcwSeqsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcwSeqsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB72D1F000E9;
	Mon, 27 Jul 2026 03:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785121732;
	bh=fS7ymxv3eEPwNc/r1Xxde8ivyrvBC/eS2NCy79nNj9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IcwSeqsEpzJKdv8f+gczfLzAssZMPOYMwKZEz/9sKo4/YRx5Oer1IOFoAdXF2htIP
	 ml2g3EPRCyqefUmJYrcLmILmuukHVWfzHW1IcSU/x7L+NQ/a8ZY/KoRDD+1hxpiUoR
	 TKC1Q/kL2vIIccw3qTgudVk3/+/MxkZJlgtxyoazV6z4riLz7LYVHgS/WHO6lUseNb
	 nqGs182nHsulCjM8XxGS/CU053xrlocKZCuLVzoQUk0lSp5toiDzGDaV9cdthky818
	 4DDmhmAQxShQiOiRxORBDh69OpYO66yGiPUU9D/DnoWLwAVOwRBc0ZfvgGQlJ2anIX
	 IEeeL1PEuagcA==
Date: Sun, 26 Jul 2026 22:08:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	usb4-upstream@oss.qualcomm.com, Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
Message-ID: <ambK6rb5QXB8FN6C@baldur>
References: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
 <9843990f-a7cf-419c-9abc-2351aa6ca6ea@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9843990f-a7cf-419c-9abc-2351aa6ca6ea@packett.cool>

On Sun, Jul 26, 2026 at 12:11:48AM -0300, Val Packett wrote:
> 
> On 7/20/26 11:39 AM, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > The PMIC GLINK rpmsg device can appear before the platform device has
> > finished probing. In that case pmic_glink_rpmsg_probe() sees
> > __pmic_glink as NULL and returns -ENODEV, which is treated as a fatal
> > probe failure for the rpmsg endpoint.
> > 
> > If this race is hit, pg->ept is never installed and PMIC GLINK clients
> > never receive the service-up notification. This may leave the system
> > with no Type-C functionality and without battery/power supply
> > management.
> > 
> > Return -EPROBE_DEFER when the rpmsg endpoint arrives before the platform
> > device is ready. [..]
> 
> Hm, in the Linaro tree there was this hack patch to accomplish the same
> thing differently:
> 
> https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/8c309c7e852a49118ddc2ee54c3d8b7c74466f6a
> 
> that claimed that "Returning -EPROBE_DEFER from the rpmsg driver does not
> seem to work because the rpmsg core doesn't handle EPROBE_DEFER(?)"
> 
> Was that resolved or was that always wrong?
> 

Returning an error from probe of an rpmsg driver will destroy the
"endpoint", which results in the GLINK channel being closed again. (See
rpmsg_dev_probe())

This is still on the todo list to figure out how to gracefully handle.

Regards,
Bjorn

> 
> Thanks,
> ~val
> 
