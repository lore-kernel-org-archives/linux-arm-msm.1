Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810953;
	b=SuPFGEp7irZekQclKDqokL4pz1SIcJheqhzMZEXMPGmmnmEUBosjS1FMuFdzKdyKGrjo
	 aPKq3PjnFPpTSSx4MN9kHgfwwBw7wgY8JW9OGTyv4n/DyABQunFK4yXxaTVATMYIpAplH
	 SB20I7tW4mFKQdFlonQZcJaCi/dnrsfqJ6xZxxjJFJAWQJ4PhC+alQUIFNl/5cH6bvFuX
	 qiuu2F7HRfpbI1J0hyxC48PhO6c95+gyogX52chhegNjn1snj10wHCd5PyBzQQ2eiOqXJ
	 x9ifg+LpDC/tvYhj4TeFFdEcoGbjPnmw+7sdg9j+g8v4lyGc2UQxjOeLu7TVLUKrS+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
	b=r6N2jxC421To/k14s8RAeZJLNkUEZblZkyG9t0j0veL/Qu3787wl58lKQ4Jo4zURMw6y
	 cp3hCH1FJPJRAoW7GLfgC9PnfZW1JcgrOL4ATslzVBWYrg4k9nSRY0eUebp+McHv/u4hd
	 zbXivIA5C/GNblkGYU8otImwo5dpGMq09odnocptfuKeT/cqpf6Hp/9DsfbciOfF1Kuyi
	 raYoo3rgRKr3UlJpV/e19wj6G6Z/lHqboAyhtXamGTY0q0CTGtWASWvDImryrUQ1A/okq
	 ZiMDsXiYbwf7DHy87ooHNPmdLaxcgFikmlG1eIhR5gAygNvJCGvDrq9D2gOJmlAd/uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTWi+var;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEE3606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABEE3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bTWi+var
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-703be215729so670877eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810951; x=1793415751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
        b=bTWi+varfY9Rygv7fXJIqInHPqmdQK63tOExRFbuFBQ7Ku/iWcxqzChZ8OxOAGAwtz
         BZMsrH/Ru1qgZU6i/oCOJBk8sa1ZnERq3EAR3g+uWUQgPRSxAqIpsuIcqTzvh4xocEBm
         alVkUBb0mL/OnF4B6ReVS3o3OkQ3ENl4Eaq2ZQq4lVl+fv+TUG4Ql2l8qxVYVSz6x2w0
         9CWi8gWd3QHCwAvzLERwIIVdLqlAeG2mqD9+43SO+eY5KyGkMxf2+R1lAJKzQ8y1kMZH
         9kY1r85oyzHhxK2Z7uzVZe5UahUjgBbQsuz+QhdKJnjGrWYvQs+XE9VJQDOO8/ZhrQC7
         09Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810951; x=1793415751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKDcIDvOzdwB9vAnzcx1GZSR5/ZdYdoONGgGuOdOQZ0=;
        b=bbLEb5AfpptBEqIC9KIjf0OVCyHG4ImkgU1OEr7OPqnwpJY7hWouiKYMPPnOYTWtpk
         04b4jRvNfNTXJecL3uqDS52XrmFTWd8o31rjOHyCOePWIp3AsVYJR2GKlyOPacb0XP+S
         aw040fjF073gc/hJ9F+uQusZeOxY3y5EmEZYHDnD8ZpuNcPmVD0H50hkovr1vhZKpP11
         4E0yIKUOLzMYn0xthj3ZVcwt6sVJeKZbgjU2rv7pkfFwe4VuoeMrgehPAgYZyl+fSO6Y
         svO4uI9p6KkblX7q/jzFFsLAfzSEK6JemJ/TMSbgulbx3x5FlfHOI8wqzLhd0kqm6MhG
         j46Q==
X-Forwarded-Encrypted: i=1; AKwUvBxsOzCMJVC88QYexfmvwCmT2nLaqOjBbHHKGWEm4387Wow3jT4M9sWvn95Zi96NQx2LFKLkSAZtDLb0sbOF@vger.kernel.org
X-Gm-Message-State: AFq9FYKJ1Ni/5q+xgjeAAUmNRCnTUBr095UKaNNThNZmvlpQC699Mhr/
	Xg+7XftLwYGZTpRCcwW6JkisnE2OQ3HUr1kGRu/C+0AKNC9eLgQzFVzp
X-Gm-Gg: AYBFou3VCmU6W8CxKS2R4QcoJjWN9DEmn//C5I42Bnwqy0whqfFpk/DgZ6FW4RP1213
	AAg6l0aEUvyg2KGNlDhEp5iUQSua+hP3vWd1orR1G4gWxdF7mQw1ssKV7N80iSrrIfprI54mtjN
	DTmKAFcUe0acJkbHcxEHHxGAcInsILPXMmKb/XdXztnFlKx7dPiClAQP558OX3TW6QiEhXovqek
	ZAuKsVF9HbXGlx7UoKQAEHobE01yli+2/f7PcIugSE/SO5Ah5TY8+46RQy1ANJJ1M65MI+VzEQm
	QG8FAGaODc+t9OPBXVCYAEv/URwDf/3RveWRCD4jweIo4ii3jUaweKYYnFyujea3zdniNmqqmXw
	2Z6teNWz+/k6qrK6en9DRF58ASUo/3kwWsyxhxkkCK7uiGzaXcKMcmGa9hzwM26yoIF0NkPkble
	54+Eo2B7oKkQv6OG4nr8TwSI/6Od+0mAns0Zz01tGNJjiSbzfQfEMdDKDLxudQAi5c80T6BWbP+
	FIlWRTn6fXik5rS6HFwXGytiIQhmwE5e3qZigi3jIbFGBqftNx9TUWZQEFGAQzI30Ed3CuFvWvV
	PmkusJqLh6btb5DIC453x+2VVg==
X-Received: by 2002:a05:6820:c0c6:10b0:6c0:7620:fccf with SMTP id 006d021491bc7-70ba0ec9f71mr274394eaf.57.1792810951596;
        Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:31 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV programming from qmp_v8_configure_dp_clocks()
Date: Fri, 23 Oct 2026 22:01:33 -0500
Message-ID: <20261024030142.13643-10-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:25 +0530, Nabige Aala wrote:
> QPHY_DP_PHY_VCO_DIV register does not participate in the
> divider of vco_divided_clk, it can be left as it is- No impact
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
