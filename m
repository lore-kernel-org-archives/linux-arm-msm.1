Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D4E443E5E;
	Mon, 20 Jul 2026 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568075; cv=none; b=UJThIKu9ZfjBe0/K7BRw6yHEt3fkeRmPJ77qINc81iDwIQr1ndt4sYa974UiXVAFrXU+xdJKh8OcRWwzZbaRtNU6Zao6atducyeLru++3Vbbf2U5XUM3OmaDrSrSCW9DGH5WoHlcPwdDgMbxyXhqFZhUD5s72iAb8mJoVWftbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568075; c=relaxed/simple;
	bh=WLy4QOT9xW9BlsOB0aPi0xnITHCmbjAKcgbSHiFOXyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ikyp0Lv8H8kPk4SLlOOewc9ILsr0RViqsbgqNZC+tZmBOSFC5lkGPB50i+yLceY4YTksFl9Wo3D2vf2/xhHQIcj43p7ABtBhSQIfLWHpUpDS89oo0dXG/ptm3Mrq4ue/gGUpX1dumkVp5sQPknWGVuWhvibSBtd6we1x7WzG50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJf0emg2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJf0emg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236E51F00ADE;
	Mon, 20 Jul 2026 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784568071;
	bh=sisM1Ng0TdFVGfOckftuWnHhoq9H6HJyqsJIsiOCWQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WJf0emg2QgbbCrbPLfYzpGuXBgFEbTDT7jWEF/W7x9UnKUX84xWAZpPvEqwhLRkuI
	 oKqNYws8hqiTY4mG1eqY/m5sCUWng7PoXPO8jqJvETwkgrXrONIK2KzFI33aLKDho4
	 Q/Qm84BLCaFA5brAx7H+XJpRAAW9rM7Zakvu4+gZXJKceVUBXjpZ0B0zZ761Cz+xrv
	 ACnfTa0t4mGsjms4EBaYxFORAEtfiRLEjnvvtNDyg7miOY5p53sREKKKLrEAAHfCi4
	 NrUrplzPjZtE9dx5rBP/GRMnaN8HSquvfpbbOAZoeyUokurOUb2TkhSTITKPi+vzux
	 SSFcvd8I7PNLg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v2] EDAC/qcom: Skip ECC interrupt setup on Shikra, pre-configured by DSF
Date: Mon, 20 Jul 2026 12:21:00 -0500
Message-ID: <178456806271.1732507.13328048572156290624.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
References: <20260713-shikra-edac-v2-1-22fcb3ca9fb9@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 13 Jul 2026 15:28:52 +0530, Faiyaz Mohammed wrote:
> On Shikra, the DDR System Firmware (DSF) configures ECC interrupt
> routing before the kernel driver probes — it enables Tag/Data RAM
> interrupts and programs error thresholds in the LLCC interrupt-enable
> registers.
> 
> Set irq_configured in shikra_cfg so that qcom_llcc_edac_probe() skips
> calling qcom_llcc_core_setup(), which would otherwise overwrite the
> firmware-managed register state with redundant writes.
> 
> [...]

Applied, thanks!

[1/1] EDAC/qcom: Skip ECC interrupt setup on Shikra, pre-configured by DSF
      commit: 43584144a46bccbe90482cd8eede9596d8fc47dc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
