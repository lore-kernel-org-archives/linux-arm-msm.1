Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554419;
	b=UWrNPFuOlwwxRjTSxzYR9CNy+6/B/Vfb03ITZigV9WCmmdJLv1k72c29bPhhS0ELI43Y
	 lrVF50uHGmYxm3mqOPbfSIDefba2pj2ait03cTFBaSMtoT/RaW8hza6xDewQeA2vskviQ
	 CN4lH1Iu7qeM66fSBhbmRn6FP/MbTC2lctbupT+IGvcp+DsjANL9vPXxF0vMcC8L2dA0S
	 rxMjhMOGrqjg3lIQEhHoD/Wp9TRitW3yndYxjt3v98fK+PtbeEmOhkywgNP01MlFAakwN
	 3Fi4A+/0C3PthIko3/uO8QdkVDVw8yvxk7CGvrqj5kowswzxtAnQgEVC7OjqyGLiq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554419;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=EOcUz1z9MRlpObt/9oXs3kNZoy+9Pi0L3SMSms36Uro=;
	b=se6NoLevYoeHWa02PhjysWhSRJaNa6xeFqlRb4yQPsYfR5dIDyG4Xa3edTtz6tt08VYf
	 lSXD0wzHFfGcMSVjYByL/AFpEnC8+qSoinhNn+GR6M/W75HLsYo3l0swLAQqdmZPkmOqI
	 O4mdpcL53ksF0uoTKoi7/Yr2k5Wk+qTFXkdlk5OfzFF4AUW/eRJ8GcQChlyq2mtaaIZsd
	 M3zzdoshNgqVaaAag9wwtd2NJ/rhiqOklBopJ3R3Tf88CGVQjEAVIEt3LVb1ptKdhzdBb
	 g6oRXuzI7mAiBsYisBGOCZ12FhuDa6lJklxq+5/DYQCqpSuMdydYRqUNjZFJw4TITOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/+3jpkU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02A606A32E;
	Tue, 24 Nov 2026 21:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/+3jpkU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E051F000D3;
	Tue, 24 Nov 2026 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795554418;
	bh=EOcUz1z9MRlpObt/9oXs3kNZoy+9Pi0L3SMSms36Uro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E/+3jpkU7aMu4JJ/L6N5sWVKzRdUqtGLt/wHNnIZRYQdZ6SuEddR2jPXA/We4KshD
	 fb8hBOpoO4yNaftt5HcqWKnXaRjm7u2Lkgs+1mnv7ImzDteyUm1hTVDcJtF3IUn+Es
	 fSTL2jYNZ3CgwRo8rJYV9LQYbCd1dquX4bwC82O6Z9yoqhaGzJrggkSjH6lyvAXVF/
	 Mzueu1mm2gyM4C8PyxjnB+jR4JxneU5zHa4+/YNeH5iquSmWqWtq7h9RiUoFsJErZ4
	 sqHH2iGLnUEZ8kgdidLGhPxTAfa3YNkx68KqBd6ep/0scP3oOrSCQ+wlbONGJmc3RV
	 2w2J4t9fBEcrQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
References: <20260701-master-v2-1-566bf8b7bd16@oss.qualcomm.com>
Subject: Re: [PATCH v2] misc: fastrpc: fix context leak and hang on
 signal-interrupted invoke
Message-Id: <179555441675.417176.3239253132321821842.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 21:06:56 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 01 Jul 2026 13:41:25 +0530, Anandu Krishnan E wrote:
> fastrpc invokes work by sending an RPC message to the DSP and blocking
> in wait_for_completion_interruptible() until the DSP responds. If a
> signal arrives during this wait, the syscall returns -ERESTARTSYS and
> the invoke context which holds the in-flight DMA buffers and
> completion state is left stranded in fl->pending.
> 
> On the next syscall attempt (either auto-restarted by the kernel via
> SA_RESTART or manually retried by user-space after EINTR), a fresh
> context is allocated and the RPC message is re-sent to the DSP. This
> has two consequences:
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: fix context leak and hang on signal-interrupted invoke
      commit: 3f645f6884b5c753eea253cab37521a432c69105

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

