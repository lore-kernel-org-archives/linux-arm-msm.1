Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0479537E5D0;
	Fri,  7 Aug 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106064; cv=none; b=nCwcUEwAkUPUoBzqAb56TMJpqmboVB/g5i7K+TgawElZA3fgBOcGuCYy1jVKRuL2B4iiWWE9by43/Yv7rcgw7VuxN52j9WbEfXZfZwELmGvFREykYT21eCy7NmsMhAJsCOnRsqd5yvI9cyXeE+FtKajIuidL8H7lCwXzvGjsPOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106064; c=relaxed/simple;
	bh=EqoJU3AyJcHXSOn3ynM3JHBwe9CC0vYe5Db+xu++hsE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e3drVMuiXpcDXlhbDNTxmOh5iyyzeWSRI+YauTfVxchIFw/ZumuH00FPhUAfMt4vGzIQBLX+zxj+83crB+hH51P3CiIA8SET6fFmJLSSV00IZXW57AnWg0LV2DT3YonnFy2O0z1vE3wQXuVTQq4dCGunKfTe9hX8d3AiAZRFiB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HOZAlrOC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HOZAlrOC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE871F000E9;
	Fri,  7 Aug 2026 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106045;
	bh=Yn9pjlqdfb1eSBTBxF5h1eZXiVnuu7qMZZ7olQYY1Q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=HOZAlrOCWI0ekgndaLJz8KUrIJrL6Eo1i/TdH2myEs8OBa7MjOOlMpe/su83CPkZf
	 wdfYA7jfdWFmZP3zAXz2QXhd6q8JDHxlaxi8HgeQn0ir7DPQQyZr34e8NYvguImvIs
	 kVbwdKJwUlBL6LKRAxiUZKJUSbShhkPQ/+h3CwtDzhwPcU0vgQ8s2yrNx7tCHI87rP
	 Uoq1ooORwjQgxMB5WPoQNRdgL4tENUuwij4aE+jNgvleiHbSlyypl+dCtpLjAptNKH
	 sr7I0Y34c5vL1dQrdpdfI4TZg/JvKlBRPkH5/srUukpmKRl/jNi4J9xZ10ElvUvshp
	 gZXZbpVbLAjeA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/7] phy: qcom: Fix possible NULL-deref and runtime
 PM race conditions
Message-Id: <178610604135.740291.8433622032837294506.b4-ty@kernel.org>
Date: Fri, 07 Aug 2026 18:04:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 22 Jul 2026 15:45:13 +0200, Loic Poulain wrote:
> Address potential NULL pointer dereferences and race conditions related
> to runtime PM in several Qualcomm PHY drivers. In all cases, enabling
> runtime PM before the PHY instance is fully initialized can lead to
> crashes during early runtime suspend callbacks.
> 
> - Attach driver data before enabling runtime PM.
> - Introduce initialization flags where needed to avoid dereferencing
> uninitialized pointers.
> - Reorder pm_runtime_enable() and pm_runtime_forbid() calls to prevent
> unnecessary suspend/resume cycles during driver probe.
> - Use devres-managed PM runtime helpers for proper cleanup.
> 
> [...]

Applied, thanks!

[1/7] phy: qcom: qmp-combo: Prevent unnecessary PM runtime suspend at boot
      commit: 729e0af3c2b938a9405e6245aaab97d025e3f427
[2/7] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime suspend at boot
      commit: 991339420f6ddd299d9f34316866dda83dccd72a
[3/7] phy: qcom: qmp-usb-legacy: Fix possible NULL-deref on early runtime suspend
      commit: 8e3687f7e18fe84372e86875709d56c37e7525a8
[4/7] phy: qcom: qmp-usb-legacy: Prevent unnecessary PM runtime suspend at boot
      commit: a9b9feb37bfa684f495e3a3553342191d2b30eee
[5/7] phy: qcom: snps-femto-v2: Fix possible NULL-deref on early runtime suspend
      commit: c271a6926ea7d3c9566b033d63fd4e8c488dc860
[6/7] phy: qcom: qmp-usb: Fix possible NULL-deref on early runtime suspend
      commit: 142c5593379273264474f31d5956b1a0065cd576
[7/7] phy: qcom: qmp-usb: Prevent unnecessary PM runtime suspend at boot
      commit: fedcff16a9b60a94e68e2a0478ceda309566d61a

Best regards,
-- 
~Vinod


