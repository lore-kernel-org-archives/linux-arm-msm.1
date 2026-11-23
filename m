Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.250.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425531;
	b=rzADaPg74ekMjoIE0xOahGko5HFN0TmdbzJPliGdNehLdG5smJ0WYbnbC578iVIYwhMb
	 mrcnDWoRlulYVUh1ZmFFz5kJzzOu7HUM6ak8DTd3BTTM6ck0zoOheMBYB/4OsiABNpTHy
	 cDSWjcRGOGCABA5IC5hd8Pd5H9tKJj307rCRdV43joRuenY8Q/1VQRIbR+DyBN3bdW7JR
	 adC87PIMlbuL06LqZGofAXmJHvI+uhDqBVfzKFMqaez/6TIq51lI617eD1Zb31mS2aVgq
	 rC4MNe7ieoJ3y7LHyAltKNcZGKtNqG4jtvvT1cr8WtcJA3o7WMf9r6ObceRb2iH1wvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425531;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dqE/KOb627CRmOK+uhuP8OssUSJk2WW8/Qlivr//l+A=;
	b=fOIBo+zv9/Dc0CH435QpRK1I9iO7E5aoiTaykxMXn9KSDxf0tZXMKzglaBc58186S5xv
	 r9f3aXn1dCvP59GW9kFWMgMTBTFhFbwu7ZDAIDCzy5SFnzv/U7Pw8MGsOurJCJVdQquik
	 IqRVczvRLP1ekUlOrO3sl6f2dA1zOvoqClYkXBU9+69nzIHIIuZ1HJ4vCxKy+WOx2X6sx
	 4BeH+9dAubXBF0WjUo986X24KEZPkAZgNGYbafRLiJzRQV6+1UELeVOkePWO9mW5l9Lxd
	 SYDKQRN8/pwQVaMQjhZNZDp7DwN/pS1f+7zKJlii8LpVLgOlLbR73G497isYU1pauIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=8bytes.org;
	spf=pass smtp.mailfrom=8bytes.org;
	arc=none smtp.remote-ip=85.214.250.239
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF9B606A31F;
	Mon, 23 Nov 2026 09:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF9B606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549216fa.dip0.t-ipconnect.de [84.146.22.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3E0042436B3;
	Mon, 23 Nov 2026 10:18:50 +0100 (CET)
Date: Mon, 23 Nov 2026 10:18:49 +0100
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: iommu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] iommu/msm: Use identity domain for GPU and display
Message-ID: <awQE5aSSdXv9rTrv@8bytes.org>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
 <20261029212344.346069-3-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029212344.346069-3-robin.clark@oss.qualcomm.com>

On Thu, Oct 29, 2026 at 02:23:43PM -0700, Rob Clark wrote:
> Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
> select direct mapping") for arm-smmu-qcom, match GPU and display compat
> strings to pick identity domain time.
> 
> The drm/msm driver attaches it's own domain, which it manages directly,
> so we don't want an iommu managed domain interfering.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/iommu/msm_iommu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Applied, thanks. Patch 1 needs to go through Will.

