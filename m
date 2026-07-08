Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE80A435EDF;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522676; cv=none; b=O6H7IngZmsPglEuauJCNEzpxUlUUVHRuc0JneozPkVRywP7FHSfeoBbhqNBnuN4xoIT5uWapFpuDJlieFFeUc1gOoAgSHWG0ILYzSaBYEcj2WGkNksXK/i2EK0lYDRuth5bkN5MD5JOhrE6eERAN+tpYaifCnPLwuI4uFL+zvuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522676; c=relaxed/simple;
	bh=tp52LrfSImDGSo+JlQyXbjMZIj+DCt3H9EfnuYSW88g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdMJip3yetKaGhkBkvpCkdwvW1R7a9XiVHSufoOqFHRkuwBCPULKE8AFSoeJ3+OEbuycE4uagEu7SATt0isskjHLYRrZcCr97ouWbGI9MiNAGhKLelvT0C38UOHEdO9jjJG74ZMp26GLAKNmM7jVS/uFG2x9WeKmJmmlo6HeBBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsnO1C7T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsnO1C7T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA161F00A3E;
	Wed,  8 Jul 2026 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522674;
	bh=nOSag16RGbDVov1huGGhdnX22kBaj9opib/mHTetd/o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KsnO1C7TSW0ApOpwgtPr0c1cVeHFREu6Vw3bUiXZWNFCZrDEb1s5OfHdbe6m0F3Q/
	 3k1MTCjsfO//yohbCkCuYeWINsBmiCfjZPN/Zj4oOk2I02HPEz518bvjNLeYYzqiP0
	 EGlAWmo9DGljACi2zP3Xk6NsTC9AEKRVxuXwqkADOXcF9KPQGj9lR2AQTuI0x4wkAN
	 eUUdHDD1XJO8GwfxARrOovDh8rGzW2htlFExD/OXM2eKT0UWa4euGhdIxs0t+OU0z2
	 NxgGdXqH2DOpTK8QRFwa8XXfIM9jwRTnZnjeWdwV67ygbtdxGhWQxmRS46ietTCe5+
	 ehdn0g0qDwoTA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
Date: Wed,  8 Jul 2026 09:56:56 -0500
Message-ID: <178352261616.2235436.8120334079218318332.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
References: <20260611-qcom-arm64-defconfig-bam-dmux-v1-1-599190f17fc9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 11 Jun 2026 12:10:10 +0530, Vishnu Santhosh wrote:
> Enable the BAM Data Multiplexer WWAN driver as a module to support
> modem data channels on Qualcomm Shikra SoC. The driver is also used
> by other platforms with A2 BAM hardware such as MSM8916 and MSM8939.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver
      commit: 9c1bb154d40b36434e919865cbb2b23da58a963b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
