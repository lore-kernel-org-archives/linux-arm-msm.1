Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674951;
	b=L3QgVaT9oUbDD4cxHXJrWdf/+QuRIUqWagMqun89sZVd55hO6+8vkTbBo/bnjxpuGBB1
	 gG880C3/O3OkbwViE/muag97+E1xtkoXG99PWMcvZYod6wnA1lA3Svl8th8AiXxWZhFQw
	 16Eiuy/5103cWLgvB2wqOpsI5OLiSnNlEH0lsPscypZ4rSUv/T7yryT2bMriEZE7H8fK0
	 TN/VkQJjoyQXsb6BptspBrPgUUGKx1WJ5XTyLlKuRmVWQoMIC5lGRbJzkAsnqmnHXZxmQ
	 9g61Hh8AK41NQJ2Bwe5tOLfwoS01F8xgfkUFSM4k6k1kbZkj4plPXqdz5zszoUlVjAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674951;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=YZnKY01XGR+ZCTensFj4mGZckPN4iV/HvR9ut8nAFJE=;
	b=oYbyrytV2MlWR2j821abT/KQtXnxsEa/wwKvsw2ZEHLY7wOCJjw9DgdVeuMZqQ/9vDam
	 /xcia8RijrnL+qCh7xndjHklPKPPkTAp2aVb/pZOmdKCUVyahQ40um0n9MJhV0rBiB5KD
	 TD5EXW72x6gyatIovzYXW7CdDFRiqPLBC9NqaC2gfV4+Z2HHh7xDep3RLGhVPJ5O5SZZc
	 QMxqvuh5BucOdD3dAsVwTzfMjPp/8BCqi029Yi5PkGWumgvh2y9jr2ImIf6SzHvjR6jls
	 YOJmlEeQ4UOkGoltlFDZ+WURhmyFsGQtQg0g92iPZ3wPa94xQ+sH8bj/n5G2rb/JuSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib339u3b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E318606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib339u3b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6351F000C4
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674951;
	bh=YZnKY01XGR+ZCTensFj4mGZckPN4iV/HvR9ut8nAFJE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ib339u3bd8M91pDQ7MtWFW+tF8bJziluIYekHJQadKwixLrY6p1dyo8ura2WrvWeU
	 ILOWw0uH19GkVlow3rnTXcmoWXG13LCbakWdHrNiFqukuG5GrCW+bXSpkMI5mhQMBD
	 Non6Aba9LIDyWnCQXtwi/N4evK3zLv8fZnPGxqZeu37L1ewoIWAMOgXQgEe6jQZau2
	 WQYj1p1fdJbYoXDmOnZdRG3GBUK3+B2l5BOOXYq79LH29xQUJ5JyLs2JvtZxWg8DZn
	 frqAw2xXKQXuKNiq5DiN6cltKUiknzWzXVy5JJ9vsksS7hqE3SKMZL6GwISKDAodbr
	 whm3+1oYBxkmA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so1772258e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:15:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxYa7tKESO/Wi/4GpxmdzIYF+rTw9NIUStauKsJCXKJIEhZPvIFY2ng+iDFjKOJ2dcDfGWzOuyR9OG8NcD1@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Mn+uRB0vRAt+M70d1L1JJ8efXjoP4QS8IjBK7ZLEdJMhF/B5
	8C0rabtEXtAoqgQ/C+QM83gZS/Glr/ut9rWUcISIYrbBilVxzDj5iUagDP3VZTf0J88Fhwg2KWc
	SbYTrHzMAR91FbkIgNUnWcXH/DCH0fOQotPE//rlSuw==
X-Received: by 2002:a05:6512:3d26:b0:5be:499b:6dd2 with SMTP id
 2adb3069b0e04-5bfa1c866f3mr1916758e87.8.1792674950095; Thu, 22 Oct 2026
 06:15:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 06:15:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 06:15:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com> <20261015023711.721837-4-shengchao.guo@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 06:15:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf=yZfDP4Ag95Aqezwv3-rM3HwTeN0Kmmn_QwVOUYHMUA@mail.gmail.com>
X-Gm-Features: AclHuK8tFWBVo8tvJfx5QLB7aiFCuJjCkCXnzdsSqSc5PZ2mzLhUrG0HeBMG-M4
Message-ID: <CAMRc=Mf=yZfDP4Ag95Aqezwv3-rM3HwTeN0Kmmn_QwVOUYHMUA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: lemans: Move platform resources
 into lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 04:37:07 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Devicetree lemans-embedded.dtsi was created for Lemans Embedded variant
> where platform resource like clocks, regulator, interconnects, pinctrls
> and PHYs are managed by Linux. Move them from lemans.dtsi to
> lemans-embedded.dtsi, so that lemans.dtsi could be used by GearVM
> variant.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

...

> +&ethernet1 {
> +	clocks = <&gcc GCC_EMAC1_AXI_CLK>,
> +		 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
> +		 <&gcc GCC_EMAC1_PTP_CLK>,
> +		 <&gcc GCC_EMAC1_PHY_AUX_CLK>;
> +	clock-names = "stmmaceth",
> +		      "pclk",
> +		      "ptp_ref",
> +		      "phyaux";
> +
> +	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>,
> +			<&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "cpu-mac",
> +			     "mac-mem";
> +
> +	power-domains = <&gcc EMAC1_GDSC>;
> +
> +	phys = <&serdes1>;
> +	phy-names = "serdes";
> +};
> +
> +&ethernet0 {
> +	clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +		 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
> +		 <&gcc GCC_EMAC0_PTP_CLK>,
> +		 <&gcc GCC_EMAC0_PHY_AUX_CLK>;
> +	clock-names = "stmmaceth",
> +		      "pclk",
> +		      "ptp_ref",
> +		      "phyaux";
> +
> +	interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
> +			 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>,
> +			<&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "cpu-mac",
> +			     "mac-mem";
> +
> +	power-domains = <&gcc EMAC0_GDSC>;
> +
> +	phys = <&serdes0>;
> +	phy-names = "serdes";
> +};

`compatible = "qcom,sa8775p-ethqos";` should go in here as well, as sa8255p
ethqos will use a different one.

Bart
