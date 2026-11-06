Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001863;
	b=EteRI277Vded5C7bRekcc+LqsT7hJCP4WB/jYFQfFlmz7wcehxMUyvc2JVyqYV1Nap6h
	 Op4JK2Bp8uB7bUWXucvYyHJNlkuMCdUJ/Mr7H5MNvW3KleyzkrpxTZbW14CtVuv/dbnkg
	 Zak1ApEY1UXD0dXsVifvEQisvVUtYvt+lgPEzlkmhkHr+wOyOPfmsJdzds+oTR1EJTZsu
	 x1OXqh3xXZKXtwGesJsmqa9baiCFqV8mLG0CukdrAW/gPP5Ch4hdxXkifFKCGdeL5NiiM
	 ujMcmWlUWJQqsxXsfcv0IfcVv+1sK6ItS+Sb738qY4P2Mpd0jgPqzzrPczhEuf4VClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=iNCYwBZdgrtZcJalM2BjSEQM3MkkZ/FKImLgDlnfdqM=;
	b=EeSFhFJAT+Vn5S87EGEF4tsAP3FX/9hy1taRQG2+ls7qaOwZV/Z3fI9A9BwfeEn3tr/r
	 o5SOamILUxI7lvZ6CPFKzA5Zej87DjpvVb+DBkPjLLVSkbEZleKDFGSzOQV1amYMkiuUm
	 EJCtJyk9Uc34POy1c3K2Znwi9JlY+DMP0UWqr1BegLn3EB2CvqSUxq/Sr6txURL90ZUxh
	 Bzl+tFpHGSWhW9CR1qJnEy2KCqb6PhBgS3/dtP9n4soipKMjNscayH0Qd9eWBGtKnxxs4
	 C8l954FbPQXTdhra06KuC5BDiXz+Bmu9QjNKM/y4oE05BHiGSR8UxXnTA6vJCY2t2dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BoE7FxnN;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB75606A330
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 21:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB75606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BoE7FxnN
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3acde6b7b29so1305141fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794001861; x=1794606661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iNCYwBZdgrtZcJalM2BjSEQM3MkkZ/FKImLgDlnfdqM=;
        b=BoE7FxnN1K7l0CXFd8Wa+mszolll2w+Qb8d2wQ7vt9jO2Fn4RHZ/xQc1oBsHVglLV5
         o6jjm6WwoQ1UBDaNLKdA8Q19nho69QU8AFlZwkuXifxCXL2YAJPGEbeOLwkmjvpSvFKq
         7sSUBj7KQYnxaq/NxX6FcK1AeWZ85vXDqO4zvfEtZ4hKX8H0mBRQzKC7DjOwzQ51KroW
         zxaHIqUNH5qtlgv3W1wpfwp1WWBMW2q782ep8RO43KZ/wVM4AAAoFvvLOAGp4ZXMiLJq
         vh+aso0BhuX4BvehXxVLDn6ZbeiYN7zY+dBpDsCsOl2pJSMFxwd0bEzdOWd+kTnQbqTq
         oAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794001861; x=1794606661;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNCYwBZdgrtZcJalM2BjSEQM3MkkZ/FKImLgDlnfdqM=;
        b=sl5rfDs9NSEUXwZl7kTRaE/Xpp3Th5bHEVvDthLJ7Lsx/9fqdomxFq97XJ7DsHGFwd
         0fZFJAC6DicAnjin/h5rWvQ3JI0hFBNwFLVwLNrYSEX4Cy9V2A7+FJl6TnkMhrIv/rLo
         69M72XurymUUlU2rBrYziuDjGfluz1cQPzZuMZK+a27KhzfBQm3yuo4azsbjNbOJlChr
         ZaFkzrsx3gihR2N/gBIRk0Bt2XawbRbhSzP6OXIH22Ar9FX3GNtRbVBOai/0DXDSYKb/
         +s6WPhznWo5oYWQNbgIcZFZolaaA9SppYEyEAt8O5zRjtwD9rzcYFkbN+sHsB50CNfSV
         s6PQ==
X-Gm-Message-State: APuU4Z9fucLNHuOTMR2ktc5WkdWC6ZMhlxAHAAelL6poML7ROFNibqdl
	1EFzzDZeFZk7dLYvrlM9oeJQ98mitdyfEocKXLlZIsZr8O4daTZKvGpD/uObHsF7hNE=
X-Gm-Gg: AYBFou3S/7zGdWzwzOJcCZdk8d/SiqhGp+ILN5Bs8Dk1BlhJrzAClWucNaudP0icmL/
	IP0se9qjwHxF0cesCldntLdSuRbZpZqlb9gAPBxN27qbQ8sZVLfpx46hnRlDKLCYgwg/oDIi1O7
	Q7jKmfpyiUQn7gasW9JSK0v1iCZaV4Iiz0iyEnhvWXN4Ifw18RSpHz/gWa6XSJ2vlNY8Ie8YCRw
	NdCZeC1UgT3+3wgzxiTT5VfjNgeSdv7LM47P6scKwXQOIpfe/OIKgOf9it1OEIc0ihde6L+0T62
	v9hyrM7jYbBoc1zsETQTIePEc52dIGGWYKDAYOfUQ8WqxtJ2+RO1GWmvn7UpK6j2uuBB/yG0lhX
	vaIqLl1A6v6hWW9/eo7zmKViYDdu089a7EH/vRw4psnYQLhoTf+nHaQsuKpkQz0Hpq5XzXKAasJ
	oSQk0lJ8vdQ8ttQ2LzpzTLr329X2BSeliKQIqdbNtEEuZubEpsKJ4zTa0N9r8PDPgObs67+JX4T
	wHNZvQYOietg7CDvHPtIdkDgYbElA96OgrGdAGUVUr2m7c9qLOS53h0lf3ShqGGNDzKV+xY5IGe
	8wbPY8UUDK9Ylqt4zHn09G9vVbLdz+MecArlNll1UOzV+pnD43spOGrwxDec8mXQzlm6A2O3+v2
	pv4pGnQ==
X-Received: by 2002:ac2:5690:0:b0:5bf:ff57:b346 with SMTP id 2adb3069b0e04-5c003c44406mr1310242e87.5.1794001860247;
        Fri, 06 Nov 2026 13:51:00 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c002ed5629sm551625e87.12.2026.11.06.13.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 13:50:59 -0800 (PST)
Message-ID: <160aa94c-c726-4cfe-b8cc-b1f974b32f13@linaro.org>
Date: Fri, 6 Nov 2026 23:50:58 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: qcom: camss: Add support for SM8150
To: mail@andrewgigena.dev, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-5-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 20:35, Andrew Gigena via B4 Relay wrote:
> From: Andrew Gigena <mail@andrewgigena.dev>
> 
> Add CAMSS platform data for the Qualcomm SM8150 SoC. The camera
> subsystem contains four CSIPHY, four CSID (two full and two lite), two
> VFE and two VFE-Lite instances.
> 
> The hardware reuses the existing 3-phase 1.0 CSIPHY, Gen2 CSID and
> VFE 17x implementations; the CSIPHY uses the SC8280XP lane register
> layout. Add CAMSS_8150 to the version enum and to the shared code
> paths, then add the per-block clock, regulator, power domain,
> interrupt and interconnect resources.
> 
> The CSIPHY resources are reduced to id/hw_ops/formats only; clocks,
> regulators, registers and interrupts are owned by the dedicated CSI2
> PHY driver.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
>   drivers/media/platform/qcom/camss/camss.c          | 231 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   3 files changed, 234 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf799..5e7c2e67ae88 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1133,6 +1133,7 @@ static bool csiphy_is_gen2(u32 version)
>   	case CAMSS_6150:
>   	case CAMSS_6350:
>   	case CAMSS_7280:
> +	case CAMSS_8150:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
>   	case CAMSS_8300:
> @@ -1235,6 +1236,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
>   		regs->lane_regs = &lane_regs_sm8250[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
>   		break;
> +	case CAMSS_8150:
>   	case CAMSS_8280XP:
>   		regs->lane_regs = &lane_regs_sc8280xp[0];
>   		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index c54185c93a8a..da4d2213fd3d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1940,6 +1940,223 @@ static const struct resources_icc icc_res_sm6350[] = {
>   	},
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_sm8150[] = {

Drop csiphy_res_sm8150[], and pull this:

* https://lore.kernel.org/all/20261026224957.1115370-4-vz@kernel.org/

> +	/* CSIPHY0 - clocks/regs/supplies owned by PHY driver */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY1 - clocks/regs/supplies owned by PHY driver */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY2 - clocks/regs/supplies owned by PHY driver */
> +	{
> +		.csiphy = {
> +			.id = 2,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +	/* CSIPHY3 - clocks/regs/supplies owned by PHY driver */
> +	{
> +		.csiphy = {
> +			.id = 3,
> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_sm8150[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_axi" },
> +		.clock_rate = { { 400000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_axi" },
> +		.clock_rate = { { 400000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 } },
> +		.reg = { "csid1" },
> +		.interrupt = { "csid1" },
> +		.csid = {
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite0_csid", "vfe_lite0_cphy_rx", "vfe_lite0" },
> +		.clock_rate = { { 400000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 }, },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "vfe_lite1_csid", "vfe_lite1_cphy_rx", "vfe_lite1" },
> +		.clock_rate = { { 400000000, 480000000, 600000000 },
> +				{ 0 },
> +				{ 0 }, },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_gen2,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	}
> +};
> +
> +/*
> + * cpas_ahb is left at the CAMCC default 80 MHz; it is not matched by
> + * vfe_match_clock_names(). The VFE/VFE-Lite rates are set from the
> + * remaining clock-rate tables.
> + */
> +static const struct camss_subdev_resources vfe_res_sm8150[] = {
> +	/* VFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi",
> +			   "vfe0", "vfe0_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 400000000, 558000000, 637000000, 847000000, 950000000 },
> +				{ 0 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi",
> +			   "vfe1", "vfe1_axi" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 400000000, 558000000, 637000000, 847000000, 950000000 },
> +				{ 0 }, },
> +		.reg = { "vfe1" },
> +		.interrupt = { "vfe1" },
> +		.vfe = {
> +			.line_num = 4,
> +			.is_lite = false,
> +			.has_pd = true,
> +			.pd_name = "ife1",
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vfe_lite0" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 320000000, 400000000, 480000000, 600000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	},
> +	/* VFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vfe_lite1" },
> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },
> +				{ 320000000, 400000000, 480000000, 600000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_170,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		}
> +	}
> +};
> +
> +static const struct resources_icc icc_res_sm8150[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "cam_hf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "cam_hf_1_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "cam_sf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8250[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5725,6 +5942,19 @@ static const struct camss_resources sm6350_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm6350),
>   };
>   
> +static const struct camss_resources sm8150_resources = {
> +	.version = CAMSS_8150,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_sm8150,
> +	.csid_res = csid_res_sm8150,
> +	.vfe_res = vfe_res_sm8150,
> +	.icc_res = icc_res_sm8150,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8150),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8150),
> +	.csid_num = ARRAY_SIZE(csid_res_sm8150),
> +	.vfe_num = ARRAY_SIZE(vfe_res_sm8150),
> +};
> +
>   static const struct camss_resources sm8250_resources = {
>   	.version = CAMSS_8250,
>   	.pd_name = "top",
> @@ -5824,6 +6054,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
>   	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
> +	{ .compatible = "qcom,sm8150-camss", .data = &sm8150_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 7dc2fd9f03e0..74d8cc2921be 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -89,6 +89,7 @@ enum camss_version {
>   	CAMSS_8x39,
>   	CAMSS_8x53,
>   	CAMSS_8x96,
> +	CAMSS_8150,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
>   	CAMSS_8300,
> 

-- 
Best wishes,
Vladimir
