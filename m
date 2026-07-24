Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5803A6B8F;
	Fri, 24 Jul 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883564; cv=none; b=WA3vp0ZmPzhfxCLkEX+iaPGNnxjW/vSGaGtASPabubRuaUJyJPm7IoRJfITIvHOR0TU5Ol9vkLiEbh7m5DVwzi4Apmho7nqWxMUV0DZiqzlXS+E2dcaLmtRxviEGRO9zPkqsXytQbGc5BGJZE3AY08E4uW+BkrbCf54Iwg8Qhps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883564; c=relaxed/simple;
	bh=3t56hJKFP3Wtm095yk4nBN+lgGCFte2lG8ayULr2/EU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rEFkQMQbvzpHHMkdojAKXxN0UlLn3uCSagYccFg1/MuX+bh1OnINqxYlvC3tcq0pYdUfeNa19bbNJUPFwMWaN8ClrYnNyyFYpSXY36L8O4gDYgtwMW2md1F6zkkJqTeTSyys5zb16+esOMJClTjYgaB/HDU3s7BMHFlFUiFXQUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCi7ZHeF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCi7ZHeF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93341F00A3A;
	Fri, 24 Jul 2026 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883563;
	bh=dKusVM3kVcOjE7foTNZ9eX/mI/iaqI4t6R4iccmzPeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UCi7ZHeFNxXXCrLbCxs/iWD0b3gHpfgqHbcEQShM1fejtpNghYh2TB9HjV0wMM+Ed
	 ZMK4mQ3ITFDkYOMkUWYcsJmva0eTUPyy+lYNmQo9LAPLnlYFPD5ptwTprf3TB8lXPA
	 9JlpZSC3U3TmAOT+nRMp3BwpNHQGQzY/OCEDJ8UwfFW9HLE53Ovc8q0Imwaihl7U1v
	 rpmjzxCHiTEMPD7MFvEbawC55AoVyN+ssZaPJJsJdRK7fbz+ehqjzqa4hCn4oZ6KpF
	 BJq69eENhCMci1RM2VMw1x3+rN8maKWTMbgUSEdztzU9m7UnnAkohz9Av0lwYud8fX
	 GxSJaqseCDjXQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-msm@vger.kernel.org, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
References: <20260713052236.3033744-1-ekansh.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v13 0/4] misc: fastrpc: Add polling mode support
Message-Id: <178488356170.437795.14308617091553113236.b4-ty@kernel.org>
Date: Fri, 24 Jul 2026 09:59:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 13 Jul 2026 10:52:32 +0530, Ekansh Gupta wrote:
> This patch series adds polling mode feature that have been missing in
> upstream FastRPC driver.
> 
> - Add changes to move fdlist to ctx structure to avoid code duplicacy.
> - Update context mask to support polling mode.
> - Add changes to support polling feature.
> 
> [...]

Applied, thanks!

[1/4] misc: fastrpc: Move fdlist to invoke context structure
      commit: a73359512125b686b010c25530f8768cb0fd4632
[2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
      commit: 10555ba6126ede14a98af991c6613151a2cafa5a
[3/4] misc: fastrpc: Expand context ID mask for DSP polling mode support
      commit: c49f7643576630fb602adf927eb17399b19da6b0
[4/4] misc: fastrpc: Add polling mode support for fastRPC driver
      commit: fefb8b2aa4cc5273e7564903941ae49540e0dfc5

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

