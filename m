Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5491481AA2;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522654; cv=none; b=Nkd1OsFso2ByH/5mrQjpy2XDLqaz6nPEaaWSHCVJrL0+/yXs4uTtpBTBx0zHL/cvT8My1WuMUTTvyz3GhDZtToi8JFZ1X9euqEBFIFRuU2dVOQsC8M8Al5QFXPZmCW0cwSLpycA6QWgk/Ih+/NchxUTghyYc8w+/fRSrZYxBAMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522654; c=relaxed/simple;
	bh=H5UNhHNF9ZEx4X6nbiytNR1sMHCh8+LPGKoOr31hNIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxJuCgrHPf6oP9g4Ij2RflB4CoMfcFDA0chuyT7lw7kRObCqnse5I2VTgB6SS2trJVtWH4iD6uOayZvMP+L+A9ePm2gYpEa8Pt155bevamKBW0TZ9xxOYGET24Tgw5lJfjRhnqEMH62/YGJKSv5MTQGizPVQvrJQoPlIuBI6A+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoVP50l8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoVP50l8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481731F00A3F;
	Wed,  8 Jul 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522653;
	bh=rQDDAh1UqzZleTCamOtk+oazQ+HIsh2cI0Oi5RA0Wgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WoVP50l8Zpgc4BXcmg5/HI0saMNJXHuOfnKAo7H7bMmjthOyrDVUXXMgBG7gUcj1J
	 XEwe15H7EHn+bY+2JDmYey5/vMQ6uf6+yirCbVx9HU4TaW/ZiC5YePPcuoP6qXmOVi
	 TT4H3l1xZ98w8efc9jHasFtH/F/S6ocZhae0n1aZFsNsAVNcNXxLQs/aF1t8rUKc6R
	 JDwOI9m8zHR738KS0qLcp67QuIL5A74RZMksoAr7C1q4hNTP/cd0hMiBTQNRFYbauS
	 R0ofBJKGxN06eDafdfpftR5gLwtOK7M/QAzbm2yehugkyRlbNv/73T4CLvWaSxmMme
	 g4mbaa6zddrJA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: llcc: Add configuration data for Shikra SoC
Date: Wed,  8 Jul 2026 09:56:34 -0500
Message-ID: <178352261587.2235436.1532281778388805932.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
References: <20260531-shikra_llcc_conf-v1-1-fa405f5a2404@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 31 May 2026 03:09:01 +0530, Komal Bajaj wrote:
> Add Last Level Cache table and configs for the Shikra SoC.
> 
> 

Applied, thanks!

[1/1] soc: qcom: llcc: Add configuration data for Shikra SoC
      commit: 3467fec5322678463fa5e43556eb0216f6a0ca22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
