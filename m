Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611661;
	b=VvkeuXCrLdU2kZT1tqpGTFQBNF62BVuafrNUd9FRORyVqZQM+0EmuGjkmzDRqrgClMmT
	 z3Xi5Ns24LNMPe+lSA1kNlGcmB42xOBTB6zNVN7kIKWh6BJ+ffFX5emTGmdHyBNa1zVih
	 0eJO+1LinDnZHY2aMrH8PbZYkWj0mWns+2CVWg6VSOQEu18WHAp5wLyRWo49HC1e9xAk+
	 Bqe8nItL4/LFr7rxgfyE25uhF/7yMkpNAIC0plzthcE4VyARNEUfxqXSoVqZ5h+KfvGR6
	 MUGVm2bnsXBx8TY9Iw86RXIosWtjJCAoIALKE/t6V8kC/JzQg3z5zea05kvVIA1DxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611661;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wMT3sGjjHmqscliMLCPQRU41ouWwPakEZZkzkueikn4=;
	b=mgJd+JLkO1eGrPEONKcsLQJW5ds9OSEMan8CkoxBYraO2IG1HvpeNrsGG4DU1rSu0GwB
	 I9JmkHM+O5hu+SVh0JTmhHXY6TXRag4TZN26uNGJxRl7QSOnuPVka8IYjQtviEPYh6PKc
	 vMhUWAxk0PHZyNA3tIUESFDqysIGhJJbR5/1y7OLY0owtJuJ4IzZwfGgImHHI15bnyqqu
	 wHDxqPPmS5/oVxqiYC0pUCscTDE2dSobRcxp1/ydXOOcVLo3iMonMeODzUXzlSmp7tyCE
	 fKf4vRr0Rng+FzuJH0V3OBWW6xv5EhewCjhNNnaPJfrNQGCNcU4v6WQNuMBLh0Cge+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7YcZYOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D0606A321;
	Wed, 25 Nov 2026 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7YcZYOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0C21F000D0;
	Wed, 25 Nov 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611660;
	bh=wMT3sGjjHmqscliMLCPQRU41ouWwPakEZZkzkueikn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C7YcZYOdrAuHlwAqUB4iN/Xmpveh18+YMEqDjbE+L5Xcf4n6YPgRcr8n0grmXVRdh
	 cxxfXJbSaJoCe/bY5jrGMxr9t0clFP24+eb76T6eq7wkf21y1ezVqWblpCQ4TilDZB
	 FwU/RLL9exI0DKvC/bEYS7nKwMhDOpLdCYQYWygPh2gZ2FBMtKjiFvKAWW6JmS8++n
	 49vasd9ZKhrFWUNnvBHJpDZsYvU5CulF/Y4cnfHeMdZzaIVtHn4kFGFUE7Ph1B8Jwu
	 ecoztIknTwuZTWJQBjjzcm7O1jaZi5YdJFgmDCh1yIcQIy708B555qCf3+PeR7JlCs
	 5YB7VO9G9zvyg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Yaohan Li <shunsheng1218@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 sumit.semwal@linaro.org
In-Reply-To: <20261118072353.1259751-1-shunsheng1218@gmail.com>
References: <20261118072353.1259751-1-shunsheng1218@gmail.com>
Subject: Re: [PATCH] regulator: qcom-labibb: stop the recovery workers on
 teardown
Message-Id: <179555159675.947306.2422744584875591941.b4-ty@b4>
Date: Tue, 24 Nov 2026 20:19:56 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FU4eAawKaLVAHPdISCLU31B6hyq5HjtIOVT+sum0wJE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ7nDFtjd9XXr/tk9Hh9iCq13OP5flhD3Tn9EfuVvmc
 ZVFWM/0jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk51pGhkuHlcs+iyh4Bh25
 +Vu995j7r7K9TAcqy/I7cl7GPNwW+5bhD0fJtJAFXydtZ7n4JPL9lh/VLcufVn43njPHpkq5sOh
 nOzMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 15:23:53 +0800, Yaohan Li wrote:
> regulator: qcom-labibb: stop the recovery workers on teardown

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] regulator: qcom-labibb: stop the recovery workers on teardown
      https://git.kernel.org/broonie/regulator/c/d23ba232a8fe

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

