Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957726;
	b=iGXlm24LUEEyGi5yMjXqSnCz5XT2/lgaM3yzM0CAIO91rL6FC6vSyj/I+GY5jhWJVFTz
	 QtOjZxcaUTfWW/bDnSYhqDva/yc7epesMHleFHuhn49Lx3I6Cb/huCuUukwK3FScRv9HR
	 4tIxWymTVPC4bhU+LRnCxKx8x/+l9rIFi6jRt0yhA0hoJT13Bk0pFhOZZaWcLpnLYKVwH
	 KLY2/RnaNzeeiMWF9LDc0e2fMmJAH0burFQDufI6XaQBnp8Vh+tkLy590eQJouIEaV4pD
	 JKOd3wzPtQPX9jBwXtSyYaG3HNBSBKOktK3/V1cOr6/P2pb940punROzGemMDikh0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957726;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ygUD6LKaufwsn6Rjs6y4Bk6NYn5eKQXWH9peKVdR/gg=;
	b=smLt/5NFf2ogDEK3Cl/dfp7SbpcP5qUSWjEtXnJe/LFHKaII3PnKMlK4H8/L+C3QVN8d
	 0kKmMsMvb58HcOEPs8zpsk3Ks3w9s6f6cjEOf/ZUM5jrhne6GO+5qAupSJrc3Pfd3OCzj
	 CMPVyWn1twaq02ftFx3g2tl1+yBh8pkB3c5U5oeWwX0oEsbE3yQAj5QU0zsQLLp41mQsG
	 y4n4oGvho9FSdZyaSt+5g19DjJUc7yDPaLE1IuX/OOvklb2+UFySCVzLMLbdhJ4KaBvtx
	 LX9qs1mxb+Mr3dOHqvRUT8CnXbbi+TP+VpWUx/ddBX8y8Y2iiIIKL/kGGck9HfXWSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ncjdvree;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28893606A31C;
	Tue, 17 Nov 2026 23:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ncjdvree
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935F61F000C5;
	Tue, 17 Nov 2026 23:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794957725;
	bh=ygUD6LKaufwsn6Rjs6y4Bk6NYn5eKQXWH9peKVdR/gg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NcjdvreeN5L9GELNEQybuEBsK8RiQmTQpeqWbT6ECPt4b69jxzLd18vfS6duwbA3W
	 3uAxA7IFkFu+MwzpvCXY1c687Zkx8BKNEnvJGDkZhQ74d8lyejhuzWa2Xvu1OfbeFc
	 ukhe1s7a2XQLCe2aeMdtAxxIK9nYlvPPKAJBxjorz7HmDLwDtFvevw+imjmxoXhjdN
	 fFce83JLtKNIRuerg69c0/iINqK1s+BNcmsqCQrAU8CuMXT2ZLtyWdWimCawrDEH0z
	 4V9wPSoNF6GmbYFdn7BYzFqC8uIvBTg6NAjC6pn13FVWphdKS1BlEIWBsYf0Ym1v+c
	 d/ngLbIvS4PTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jesse Casco <jesse.casco@gmail.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112160942.27909-1-jesse.casco@gmail.com>
References: <20261112160942.27909-1-jesse.casco@gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Don't overwrite the initial mode
 with the boot readback
Message-Id: <179495432153.2707353.3044269872667802859.b4-ty@b4>
Date: Tue, 17 Nov 2026 22:25:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xAIaSDEb//e5VUnSkayGFDoP6L9h748N3X9P91qPRdc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+PJw12ZX7h1zUhP8PJy65vyA+IE9xjsaWyh7GU1e3x
 8cfSt+2r6OUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATaXVlZNgSw8Qh43RsmeLe
 7VqRwlJsu1gnLpY9L2P5+er6CfYt9eIM/yNi66usg84JNubfMq6dIqRl7h0mqb1b6kt/4vljFzO
 D+QE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 12 Nov 2026 11:09:42 -0500, Jesse Casco wrote:
> regulator: qcom-rpmh: Don't overwrite the initial mode with the boot readback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.5

Thanks!

[1/1] regulator: qcom-rpmh: Don't overwrite the initial mode with the boot readback
      https://git.kernel.org/broonie/regulator/c/d979b7807189

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

