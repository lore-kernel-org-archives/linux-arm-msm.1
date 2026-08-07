Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330033F58C4;
	Fri,  7 Aug 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106050; cv=none; b=XB4muA1pCqyGYaN7N2VyHLoXL1hc53Q4HwI/z0bptz3acfgdGT/Jx06vBCuo5WBIkTgM5gSmxVxyj32dz5JUo+R5hFrgfcDEkKA5oyxTI0f7YcaqrvjT3rrUvig1fHU7gt/zNmtpkcSb2pcjnAgsZyP6Pk3pia1wQ2QYwgbjj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106050; c=relaxed/simple;
	bh=gj0plADp80xSeKcD6YvDbS6lq36qLjPP/fg9KAULUAM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OA1MEMmUSeq1joAil7Z2pvvaKSdDSWsb6yOY927MJ0jGIT3VaVsaGsgWw0G3tQSXNcj74lb0rwXoM2EsKbLbd5mvP+R2KrouqxbI4QwHTvRC9NVRBTWzAwvaeif9PGdd+hJ8WJe2GuPf4a6hjyr9pAKZvUlLZ1d7To5Ti/C3lOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGt6h145; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGt6h145"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB46B1F00A3E;
	Fri,  7 Aug 2026 12:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786106035;
	bh=2G5QrksURiMeIT/q/6FHj47gLmRyNC1EX+w+zin3eP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gGt6h145un9n000dCvMK/LNWXZQkqckAB+D8aozy6tsznAGtAW28SjTWmKmAUwuJS
	 krRAsvGcFrGFa4IgPTh5ADDjsSS2qG7GTkUE57tHOICJWtb4/uQaRJHHVB4VMCX4pJ
	 TdiSEE20QM3Fbe5Of8G8i34BJxEAuYmYHk88upQByfXD9BrLcxS/6yCsXn0jseo6di
	 A2skzs9qq5lX5jL5+4XbLneLULZ6G5ZBfHViPqvQUqOnKprwDHRQuiMBUfJoj8+BOW
	 z0XqniZoVWpJ8HVm9rpGUFl/LIneT5Te3XGtVNpDvJx2/7g4YVrjGqEzyCPrdSvvUj
	 Q81f/Qy6gfGZA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org
In-Reply-To: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
References: <20260722-qmp-drop-duplicate-v8-v1-1-795eb7de0322@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom-qmp: qserdes-com: drop duplicate v8 DP
 headers
Message-Id: <178610603149.740291.7533615155584245879.b4-ty@kernel.org>
Date: Fri, 07 Aug 2026 18:03:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 22 Jul 2026 13:34:42 +0300, Dmitry Baryshkov wrote:
> Commit 212cdedcac11 ("phy: qcom-qmp: qserdes-com: Add v8
> DP-specific qserdes register offsets") and commit d10736db98d2 ("phy:
> qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> added identical header files for DisplayPort-specific registers on V8
> PHYs, having different names. Get rid of one of the copies, reverting
> commit d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and
> settings for Glymur platforms")
> 
> [...]

Applied, thanks!

[1/1] phy: qcom-qmp: qserdes-com: drop duplicate v8 DP headers
      commit: 4b04c8779a50ab27afb0b471ff1ced3061e440cb

Best regards,
-- 
~Vinod


