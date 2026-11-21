Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795226424;
	b=4ARz5EHDn0VcfZs999E49cBcdqVEHDB2FEVBypmz+WQFx7asJ9pJlSK4bLJ1Q2oRiZ1A
	 WcinM1dKfoO50O8SAa+ejMao2mP0gxNLSpmOdK9cDi8HAtzVpfOjzpwThEW6lLLTU5Vio
	 5kFPzWOjpHWq7d7k0YOQRg2QXE4uef5QNLSIq6+/bHrB6KrihoJ2CoRTlbk/pkWQqga09
	 PfGYRkQ0MKl0AhbR0fi9h8KaQeFkLlqk3KHTlJ2ndsk/f/4BtJ7RCQNS1b0+JT7SHFgek
	 mwKiEI1nPLh75sp0aNdPnuCp+1e1URMOWX1oWrr2kjShW46Aw2jEvyztfvEjD1rM+bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226424;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=NuNtmsSWc70a2v31dfF0pqkhP31lwrqr5DJP1OcjsAk=;
	b=xL9XdRc9ag+tV1Q4NuSbHyVcPKXAUl0su1A4rJfmVOZSyl6OsA9FtXnEk2Ve0EYiP7Z7
	 SPg3ZhHOyIuUDNVi5sQTGOsX45LkoKv+sT5UftgDSI/Ytyq8qLJVNbEzUlnJHq94v5V9m
	 1L2kl2cUHT/eYNOKaBS7ldJtzmXv+CrFeQ47jK22QZbHOAnr3SKbCeTn4ni3fUfZD56T1
	 MdUm8oRbmjaXUGUAg13xtknJFzs3BYubjoT/CKPuUFU7NAtkbZCgJOPHAdk1pipJP/SVY
	 gBcm3Zi1i6QaMZEdPXLlOCF/YU3n3AQS74IenVeeIFE9g/oH0HiNYF2c0Voa1DO5jKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clZrhczJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41638606A330;
	Sat, 21 Nov 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=clZrhczJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF9E1F000C4;
	Sat, 21 Nov 2026 02:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795226423;
	bh=NuNtmsSWc70a2v31dfF0pqkhP31lwrqr5DJP1OcjsAk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=clZrhczJPF3KCwAxHs6YM0s7sJgCo1etONB63qpAvkV99JqHlZCu0tzvqlxj5EjIl
	 B+Bn7+/YXvXkNfcmHqlNzePcOCG1sIH4WnQx06TW8dReA3HMU2iTByRDkALFFtfqjF
	 SbUAUabmHD1imf4xX9jxKmhcMojMaXxaMeYdWAEyKGH8P3XDe6fEsnG+a218b4O1EP
	 wa6Q4E/CgWvNDDGhuSkw/Y5dsFh+IEhU/cjaNXVOzXvv0pRmVSM34owRMsi+ClxnsB
	 kjG+P4+4BeGfba6LLi8OZEqwLN08nd4ePuwJEa755NJB133bZBLPwaVEMV8ENF8bcO
	 7sRtvUkz+LrmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4447380AA5E;
	Sat, 21 Nov 2026 02:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: qrtr: ns: keep notifying local servers after
 a
 failed send
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <179522642228.886068.11407811998748570053.git-patchwork-notify@kernel.org>
Date: Sat, 21 Nov 2026 02:00:22 +0000
References: 
 <20261114-upstream-qrtr-hello-gate-fix_b4-v2-1-2fb62c2853bb@oss.qualcomm.com>
In-Reply-To: 
 <20261114-upstream-qrtr-hello-gate-fix_b4-v2-1-2fb62c2853bb@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, christopher.lew@oss.qualcomm.com

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 14 Nov 2026 13:46:11 +0100 you wrote:
> ctrl_cmd_bye() and ctrl_cmd_del_client() forward the event to every
> local server, but stop at the first failed send. Each send goes to a
> different socket, so a single server with a full receive queue
> (-ENOSPC) hides the event from all servers after it.
> 
> Log the failure and carry on. Likewise, keep notifying local lookups
> when the NEW_SERVER broadcast fails, which can only happen on -ENOMEM.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: qrtr: ns: keep notifying local servers after a failed send
    https://git.kernel.org/netdev/net/c/925120216e6d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


