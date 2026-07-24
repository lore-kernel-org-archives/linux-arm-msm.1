Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE532B114;
	Fri, 24 Jul 2026 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897343; cv=none; b=jbnZozA933tZtvKF5CFd5mn7YUvIU0gCMiP02x/RueLIuUVnfxrJcUXPTCR+LIa6RxW08HzN427of9jZTgLIM5HRPv9s/grhuov7aqzjUCS3ct6MKd1QdObUaxAeN1Q90BR5BF6IvC/F3vCVJZ57hEopRqSh9Ylm50uCQq9Ortc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897343; c=relaxed/simple;
	bh=jdBYona0mdtTfhX3pVB0TxdWses9rpLR6PNuSMCXGFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=addC6Bda/5Lhy6GEFPNiKvoFmBQNWbVjiolObLQtPs01IqZkj/N1SEcZwkNQsOzfdIFKj3Yc5rJUYRbQ1ZnXOOmEFgzO2dIE2VhzhNT6O8RtR0OfNt0C6c2RxoaC50vckBM9YdTazLSGZ3s8OALyPEzmLR7W5hIlSbpae7bFAd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScjKHLR6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScjKHLR6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0851F000E9;
	Fri, 24 Jul 2026 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784897341;
	bh=YA9Sd3ewmMO3XzCP/saHSm69ZTcvMcJWFSmYn7wsMlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ScjKHLR6E1dHSnChIQs0DZMrxkfByZYYEm9h9E/7lJH4kOjMu3ueYhOBFTMjmfYb1
	 jiEilaeu6jjpMCirnolNTFCViPIzGsB4+NW56JH4vG4EtQyNM6e4zwwj9nf/6KwW1x
	 F5QgmgXR8GKXCAoyvGrgcryQ7GVzTPQkUcZ7iTm9/jyelEGQqgwjozILmGhYo0cKtm
	 MW5cq9ROm7Khy7U6P36Wj8iRTNj37wVELPQjGtUL+CuUmCQSwPgzqQBjEyppV28a9D
	 xpSt1bu2UaVbn/lmS6sq3Io57hiB7ReGAPPhbHtZib3PrPXlYputg9y+4uY+WmdbpT
	 Lj6YK+PvJNHKg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C094D1AC5AC8; Fri, 24 Jul 2026 13:48:30 +0100 (BST)
Date: Fri, 24 Jul 2026 13:48:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <amNfHiL2W-uLlPjY@sirena.co.uk>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
X-Cookie: Take an astronaut to launch.

On Fri, Jul 24, 2026 at 04:13:02PM +0530, Kamal Wadhwa wrote:
> On Wed, Jul 22, 2026 at 05:46:37PM +0100, Mark Brown wrote:

> > A get_status() operation should be reading the actual hardware status
> > right now, not driver state - this should be reading whatever the value
> > is right now.  If the hardware doesn't support this then just don't
> > provide the operation.

> Actually we are reading from HW what we voted in terms of ENABLE/BYPASS/MODE
> and we are combing these in the `rpmh_regulator_determine_initial_status()`
> to come up with the `vreg->status`at the time of probe.

No, that's not the point.  A get_status() operation needs to return the
actual hardware status *now*, not a cached value from some random time
in the past and not something that was written by the driver.

> So, shall I read the HW MODE/BYPSS/ENABLE value in every get_status() call?

If they reflect values that might be dynamically updated by the
hardware, yes.  If they are just control registers that the hardware
will not update autonomously they are not suitable for a get_status()
operation.
