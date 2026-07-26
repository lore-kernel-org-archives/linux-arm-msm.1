Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710D941C6A
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 03:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785035524; cv=none; b=CddGvMzyWdACFpcMc1yo5osCLpQlt9fQyysrLM3jWdSPzHxsJlov8MaYFFIqV4VdI9SG86xGwSP3zfrGaHebFv5uWBYV+u9+b6G9GRLFSVytM5n3pCtUO/7SrwgkXI9MC4VO1IwkCKQ86IKiWjTR/OX1PpRwMsTE+Yj0cJZYIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785035524; c=relaxed/simple;
	bh=RUmq/KqShCLQnBRouuNXUMTHrSMj/75edP/6yk0c88g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CheEV8AFMe79tdWoHTC3bQPGysHCuc8bxuYeXSNjynw2dVs/nTvdUucKotge/mWNs9h8OM9fe/8VCon1IxLGPCm7CS7ndzbl2Bf2i6tf37W7xoZYcQuMu6LS4sV8FRdrpkX2mIxe378LvIw4wqfvRjG1jdzJrpvnXg5O/UBWeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=T39imFOy; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="T39imFOy"
Message-ID: <9843990f-a7cf-419c-9abc-2351aa6ca6ea@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1785035519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7Kad4uuPGvrMIj2Cq902bzc/PIdhhr12i1ILxk+qeU=;
	b=T39imFOyZu2Vf1bZYxyOEAaj/f0rgtcM+hOmzd+gqGuZ2i+XW0jUyDsrT8zSHqPs3sBA2Y
	0MuIotL3Qh1tZmc4u0eQbCF2uyokOqeMIpfjNunwX9vdhhRAVicIWrn3yRfkOC5gyckwOW
	6o9vQ7u6ToAd4P63mUEMVxcnQg5SZUJFzixQG4bjLJFZtMeqETxsW1RHe1/NfKwQIEpTcm
	h0wD8/1T0V2vgXAVrf+etnoqw7yLr99NKnP0Y5YNHDAWPsp1RW+PKb8GLa0OBeMcBEtXG4
	8UXd5IOOmupPpG7K3yrEbUADw2evxuHspRxqQW/vDYGrOOfW/IDNuKFQ5dTDUw==
Date: Sun, 26 Jul 2026 00:11:48 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 usb4-upstream@oss.qualcomm.com,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/20/26 11:39 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> The PMIC GLINK rpmsg device can appear before the platform device has
> finished probing. In that case pmic_glink_rpmsg_probe() sees
> __pmic_glink as NULL and returns -ENODEV, which is treated as a fatal
> probe failure for the rpmsg endpoint.
>
> If this race is hit, pg->ept is never installed and PMIC GLINK clients
> never receive the service-up notification. This may leave the system
> with no Type-C functionality and without battery/power supply
> management.
>
> Return -EPROBE_DEFER when the rpmsg endpoint arrives before the platform
> device is ready. [..]

Hm, in the Linaro tree there was this hack patch to accomplish the same 
thing differently:

https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/8c309c7e852a49118ddc2ee54c3d8b7c74466f6a

that claimed that "Returning -EPROBE_DEFER from the rpmsg driver does 
not seem to work because the rpmsg core doesn't handle EPROBE_DEFER(?)"

Was that resolved or was that always wrong?


Thanks,
~val

