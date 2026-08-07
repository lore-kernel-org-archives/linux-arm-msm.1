Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837C0205E02;
	Sat,  8 Aug 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786200663; cv=none; b=ChTbIk7rLV3QT72Jc5/7dspCpgAA4umHKQzjWUKBDTVEK/H5kd6gQomZdpSRlZ1QfHtofvvTFuuRn37AR73/Hv9K+xHjmE8QvobyElxvaWqb1Lb0C6sEmPMeEzECfZ1rGMccuchuLBKk4NkTyzsrN2VQFyOL2cd4LmCE3bixJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786200663; c=relaxed/simple;
	bh=VeluKauizy6dWITZWwogRhh8l8O20xyd2a9kA2CLghI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Kh+pKQ6iHsPU+k7J7Dra+TOfBIOPXwoa95iqG6rzGmG6bWszzFpTc3yRvt0AAXKi+5D7nC1aV/j0kbypNjETgdx1oTfQPIWrFGtnaYfnwx2q1f0mQ2yBlY5Zaa83MdPJoAoCpscgiZIj6iwAr5OA7YsgS5oyvRn6uSvodrFRHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPXzUAUC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPXzUAUC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490F41F000E9;
	Sat,  8 Aug 2026 14:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786200662;
	bh=bzahbLX/x94iCtOTXaS5dTsfdzrUXlh/+3doRRmXjIo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cPXzUAUCfI4pK9UxYuhQCKeMBvPrVBG8HNFLwmjMeNt20sLb/YC3vezaCsMyqxcYJ
	 oMQB61r6Nvn3m05Y5lqx5OYhT0bokOVvmPKDj35jMC+UEuPnQHGBbuaPK2LGreSwhR
	 bGfI7dMnucw1crLbC42Fpt1QWW0odmhIei5gq51Pl6vRWmxFkExb7Zn/zIjgJ1er/m
	 YXspojppFDZTzKLIlB+fVELNwLQBSAfh3hVplbAZ2fITflnsGoAHC3EHTTt4WKQRyV
	 eLL8M+dQC3Ho2Au2XIivdWaI9dlwN4QPl2c9RkYQQebQO8HlnJTzVMHahOaRoukh4X
	 tdCdaK/6C9IYg==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maulik Shah <maulik.shah@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] regulator: qcom-rpmh: Support RPMH address
 reads and use it for rpmh-regulators
Message-Id: <178611288910.279158.17918700988011387220.b4-ty@b4>
Date: Fri, 07 Aug 2026 15:28:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VeluKauizy6dWITZWwogRhh8l8O20xyd2a9kA2CLghI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqd0JTHRMr0/rCxgs1FlXnlI3/qiv9PF4sKUZzl
 RqRuXu0TJqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCandCUwAKCRAk1otyXVSH
 0CQcB/9ClKs5B1dwWTSR/+303IR6NYYQ/dkw2HDV55wt/fgiQIhvm96VkG2r5eKkV9CfdpnAkvD
 XWBMGFaS4AWvhPt5XCC3dB3GUIuRhFa3CfyrbvZFg/7HR8GpNMH+KugedboX9M30Y+Lc+En9H5N
 H+F/B/o2562vvbYc9+P4SO/IjiJ3ZjiL+mV9Q9/yvasZEVPGV/nIvRdrDayVJ7pZgcmGf/v7PYu
 5LBPVV0IcVI8MMDKhrzSt1Y4TAzPqsthXHCf+iP6yhBhGpRSJ2yXIQqZic0x3GdeR6nswuU+faS
 MJCzH72cU5orBC5qPukLT4xDH1zFpJfhsq5tORZseum0Mwmm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 01 Aug 2026 13:30:26 +0530, Kamal Wadhwa wrote:
> regulator: qcom-rpmh: Support RPMH address reads and use it for rpmh-regulators
> 
> This patch series adds a new `rpmh_read()` API to allow reading RPMH
> addresses. Using this API enhances the RPMH regulator driver by adding
> readback of the voltage/bypass/mode settings as they have been applied by
> APPS during the bootloader stage, so regulator framework can get them
> via `get_mode`, `get_bypass` & `get_voltage_selector` callbacks during
> regulator registration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/4] soc: qcom: rpmh: Add support to read back resource settings
      https://git.kernel.org/broonie/regulator/c/edbafe65eef2
[2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode handling
      https://git.kernel.org/broonie/regulator/c/abd14bebb87e
[3/4] regulator: qcom-rpmh: readback voltage/bypass/mode set during bootup
      https://git.kernel.org/broonie/regulator/c/09d99ff7fc3c
[4/4] regulator: qcom-rpmh: Fix coding style issues
      https://git.kernel.org/broonie/regulator/c/216e8873bc80

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

