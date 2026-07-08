Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBEB492516;
	Wed,  8 Jul 2026 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522667; cv=none; b=JdjJKn3ITu+mYCFBULBb3MhkHufn3fRwHsq6nTsOZy2Wt5dCnBHlfrSbZUzq9A3TCvKBNliHtXWCSSxOr6J/8VT8ULTBwYu/8csF5INStYrSIxci3qJgUr2+1Va44ZYKmqyagC+LPtogZhLfoqt6eEnwfhxFOweOphD71zQgzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522667; c=relaxed/simple;
	bh=H9L/sK74LvQML2lns6Irf3N+iNtmx6WoCzS3iLBGRvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=INMgZf9nlkexPxdWRm/ei4jxNWNns1kXsBwpmMbSks8rLngJHuMgmsYVOdRxQpU4iWoEhzDnSC37uvAyVVejlibjXVkomzP8RtA3gxFiCbnvQGXo7RJ3Md5tiG1YkOUgHOo3iHEIY2eAf87GFFk4FG6xRil82peOwpxOo85bv9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwwaMI62; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwwaMI62"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11F81F00A3A;
	Wed,  8 Jul 2026 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522666;
	bh=TMqGK3RSrVlFkXY/h9yHnz/1jDzWjhIMi5EAjFzyL2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VwwaMI62FvX0oO1222RNcW1NFKetJa/AEsGMXAWSacuMhLiu2f1Smtt30cQkDANLS
	 dgFRLxzfXEY7XXL9wEwcNi9iLoCWhhMB07PEOqiG0gKSeYY7ig7YXNzT2mqKD3OUDD
	 UZRF0TJ/foqnfBbRd06QDCA0JOpgiYFEX/tZB746ncV3d51EPIXZRBuDv9QhO928Ap
	 q5dKSIVZRvWK7AFi/bUFgcA2kCWwSOzuAqCM6DGD2388mR+4fTNiwYopFjmorcprhs
	 ahBCUEM5mJ/e2V1JCI1t6JgOOfSuGT5HNFTgBLuX0S7KStzFXn1cYWDeIVj8w0V5Qf
	 YDEGx82ylSwIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] soc: qcom: pd-mapper: Add support for SA8775P and QCS8300
Date: Wed,  8 Jul 2026 09:56:47 -0500
Message-ID: <178352261588.2235436.1368730525012636201.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608084139.1468000-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 08 Jun 2026 14:11:37 +0530, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
> protection domain mapper. Add an entry to the kernel, to avoid
> the need for userspace to provide this service.
> 
> changes in [v4]:
>  - Added a gdsp protection domain for QCS8300 and cdsp1 for SA8775P.
>  - Link to V3: https://lore.kernel.org/all/20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: pd-mapper: Add support for SA8775P
      commit: 63fba7528f2c329595321187a92b2caf16141be0
[2/2] soc: qcom: pd-mapper: Add support for QCS8300
      commit: 17e26dfa92a502212577c4dbdb55426f1476d521

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
