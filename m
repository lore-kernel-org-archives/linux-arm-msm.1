Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88CF30BF5C;
	Tue,  7 Jul 2026 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387666; cv=none; b=A8SIuk7cixaYIf8O/l6xZ1tbWCOHXAGpjYHIHtcdFCRU5e1fSA539YSSzxF9DJ8OCoubfkGqNT6y+gmkbK6qSuhTCgdmwe8nXG5Jnt8Z2aQoSOfuTY+2LVraHeMJOwHYLZQ56NjUnG8lOTR+f9kgehQzv9HR6WIDmCZ0uBn0oYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387666; c=relaxed/simple;
	bh=KqcVpdLZbbYUXHwew7i97dseYrK4vaxJRPT6p/F8ixI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuIjl8ZKmAE6DeCMvy6svyBequtMOZUbnw3NlBChkU+C/rdxqq2Lh1v8y7kAu+qja2vCMiGRFlBVSopM76jfGakBvDvPjmBDqvHeOiuVrlu/csEQYVPTrfdPRQ9l0RzArWHJDWSOEUR1/32jxp9zjjR5Xor6agcrJo8oZgMik4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AStvX15M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AStvX15M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C4E1F000E9;
	Tue,  7 Jul 2026 01:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387663;
	bh=Bpr+S1gCnngFrkJOV1Um17SIuEEHiEuDe7nxr2/f3RE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AStvX15MWfclfg9Fom53wBFZ7aZYKPOqTvznmnjgSILquBfuRrttUPIbgzwr38F5r
	 78F/OOHp8l6lIs3lJg3grvq/TO075Y6Hcp2llY7c7lKj9JJRhjSReHK7FG3GPnHqnc
	 qV8BsCs3dISEp2kISLPhHQezwMr7dTzD9ueat2HBNoANcNDO2SaOGmvejFUDM1vLfP
	 Lr7gW14K4Tz71Q/mf+kX4z77SdYs+wNQfYUsxtAZEJBQUKpaRVioiM3rrvnK6ytg70
	 v2b0EZqT/k4z3ePQO3rmCu6nmEKsV5kuYMecDLIzV3tkdZYd0v0sfIfoha8t1Hpj9V
	 uh72NUeo1V/wg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	krzk@kernel.org,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com,
	ajay.nandam@oss.qualcomm.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [RESEND PATCH v2] arm64: defconfig: Enable Sound DMIC driver
Date: Mon,  6 Jul 2026 20:27:26 -0500
Message-ID: <178338764552.1558388.8490184374339576793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427094131.607583-1-ravi.hothi@oss.qualcomm.com>
References: <20260427094131.607583-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Apr 2026 15:11:31 +0530, Ravi Hothi wrote:
> Enable CONFIG_SND_SOC_DMIC as a module in the arm64 defconfig
> to support digital microphone functionality on Qualcomm's
> Monaco and Lemans platforms.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Sound DMIC driver
      commit: 235aa29b39329b971fbf0c28fb04b0ae83d7983f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
