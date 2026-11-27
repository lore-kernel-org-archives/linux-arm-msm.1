Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775175;
	b=SmmSFBxdl/xvZsTZZotNV0jpoMNJEJNjz7JGZ0Urc2mogtuB39VwfrEeJ69VkWP3OXx7
	 40oDWRjv2wg+vQwursfGUpcja0fA80tGe+VUmoKqE+5+uZLxBb+KgwplzBbPs0R31Gd8R
	 lh+oxzgQ7l9ZGd9YMU1vRDRewXMquize3T7DgxxrYcHbVh2LdgEM2b09SQiMi9WMpF+gS
	 zBOUHY6T0VqemvO/8RQXwC7skKSYim9HVeH4ult5v/jrSk1vahNLnLt7AeI47n2/tm9hm
	 1Zq8AUozmjng9eSx/JQ6br7SDHAbLjkjur4CMJy/adwG5ezcLDePlB2/6zcAQxlzcIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7iuTKetYgF0xuGtPMgy4x41+OjWK5q0whm0vMN/NHu4=;
	b=hORvchAh7kRsaPHSUPMJXEZ1asb3lq5HJlxFXrhdnAkXD4hKBM+DneoAukaQbPQVp6nw
	 jMyrD7+TYUH9YbhcpmUjXgryiId1aAqFkQll04cAuO0AXRVCvLzYJcMzt+SN0h9EbBnAW
	 RygYfLu3Pvgo24oSEgFj91nRsMRkGPVhJV9YRYlPW6vcurE3CsBKviLq+gVMVNxSGKG92
	 t2WQCLXgOMsBbE2gHUiX9t+rn3gtwn2NdLY2CsGEUKCtVE224V2DM8DwnlM6MxITK6VIg
	 efbaJh6Onqk9XZF+Io+3zpJgOeisA1nVfOJrO3SA7vV60r7AMm6pIrhzBVxIkS11T9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aIRKN3Qi;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73924606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 10:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73924606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aIRKN3Qi
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1ad0d0b72so715160e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795775174; x=1796379974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7iuTKetYgF0xuGtPMgy4x41+OjWK5q0whm0vMN/NHu4=;
        b=aIRKN3QigNuOJc7zHBz//H5yrJROVFHXN8VOTY54ffyPhOxfKZJtXIqSxLhnXFA2WE
         xtPMndW4NGyrauXJoT/MprprmgGdWE8BMkydP9As1ttLIIwl/ndEtJUoLgfiYNu3El8T
         +7RlbL2zPKRnCQYMUOB01cXx6dvMhcwwvLAgICD8nq/0o4jmpdbvJ4t/M6TBHXMktzA9
         s6QbdyovHQAhsidmj8OfArvYlR0P1837HO8xlDcJo7LKUT+sCzmZQ0pcmMTf3qGsqSy9
         JIPxOFO5m1s//Tduyj4xvWLUCoQanmjbDdCmpQr4Tl5tFyfv5zhVT3B1UFXZjyiWNJLb
         RljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775174; x=1796379974;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iuTKetYgF0xuGtPMgy4x41+OjWK5q0whm0vMN/NHu4=;
        b=YfmX6guQDXty0cd+FSP3vqhtS6ga3CJ7wHykzjGgKZTqya2pvNwZi07gxlQDUy2xCV
         fAOpzJ32WN7sIbsab7FjZ9774m26Mzjlya4bfd3hCFLTfqW/udJ5YIHNShF+P+I6hLeJ
         2a+gujZxsbh07hQ73/Eft5ioFLlgUPV9GfhNhbywfseXoRfclW8GElJOuaceyhSQTVyP
         htxLKeEnAa6SD/G4RNfemnapKLFM4RWWBi8cZipSPlkAna4BiaMphxfOjoMVsbHNWDe1
         e0f/DWNmHQLnap+V17GNj//PDGvNLYxJlHxg/RKw4zx/B+sT67oX/UnorJhvh7izk+Ke
         GUTg==
X-Forwarded-Encrypted: i=1; AL+hErEt7JptLRaUgXIJh3uWj7CGwfZEZLAYJLnek9PnjkWHDA6su4y3V0CwKb8OBmPDn4b+n3JLKSKJ00kw6IPC@vger.kernel.org
X-Gm-Message-State: APuU4Z/lQjjRH+q4P0Lrh2WjApJa3MN7SX4tfNKZtlVZScmzJ6JJbLE2
	LFRNX6MBstyw6CC7LYCBq+2wEto5fx+MrB/0w+AmR1QFTsAjOxFQhsAVHSeh2JM8/2M=
X-Gm-Gg: AZFdTZdkbPr6+uM1Tnjb76dnUE6en94wR2rti4WDkHlS/CRP7HX/sbQ5RVJy3v+41b7
	tk55nlQHu1azDSyd0BK5NE6eOK88fS9ghAJqFdLJ3UNcvs2VUYqflbbAvNv3ciEHUfyvCFicLUB
	4VlQfUO+pVNp33dTDcB+8RMhb0aFLoFUgkW04SbyFIjD/VpJZnv9WsxoIfBgZRMfZrh+Z6eRVrL
	WSHa76UW1UuijB/Logq7x+bTXbI2LhftdaTpjYojg4Mq/YOGiZj18tyIJC8vsz23+OI3RS/toDO
	JEFJAJ/gOFqSwDJt9M3RT8O8rBs0i51pT1Y2225O97tv+dU2kBHLvLjYp9D8UNb7c0Hp/BwA/Dk
	g9X5QOl5vr99e6r2PN0y9H5cXEjfG76d3/jpMS/Ts5aQAzOxO9H/CiLXFtP85QV5RAdNpL2LjCh
	SIh608xBPh8zvL+LhAcskuQTkCFQLs/ha99Z3BI1i4aP817ZWXAwawGHhW9hv1k71sugYqPgXAE
	PdY47FZfd4xLZigEoy8LEG64hZy/HZTDhP4LwysxmANYydm/xe5ZyoM25Zt2hj4SDFmjuIdubpW
	cYR2EV453LY+h70NwgW29kYHvHt6AxbI0PS5+yuRsXEKhIKAsEN18DLZtesCafSIKKmxJy92UEk
	bXOuSE4V7rpko5jLb17ksoQZ7A1PV
X-Received: by 2002:a05:6512:304a:b0:5c1:57b9:90d3 with SMTP id 2adb3069b0e04-5c1bc6d29ffmr7771450e87.1.1795775173445;
        Fri, 27 Nov 2026 02:26:13 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd06d1efsm6095833e87.72.2026.11.27.02.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:26:13 -0800 (PST)
Message-ID: <cf2be531-ab98-4e01-8933-71c0f40d5d7d@linaro.org>
Date: Fri, 27 Nov 2026 12:26:12 +0200
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
Subject: Re: [PATCH v7] media: qcom: camss: Add support for X1P42100 CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261127-purwa_camss-v7-1-b28b72e05214@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261127-purwa_camss-v7-1-b28b72e05214@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wenmeng.

On 11/27/26 07:17, Wenmeng Liu wrote:
> Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.
> 
> The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
> CAMSS. Compared to X1E80100 it has:
> - 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
> - 1 x IFE instead of 2
> - only the ahb and hf_mnoc interconnect paths
> 
> The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
> X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
> TPG and CSID wrapper resources.
> 
> CSID1 and CSID2 have no corresponding IFE on X1P42100, so they cannot
> drive any write master. Leave them out of the CSID resources, keeping
> the 1:1 CSID to VFE mapping CSID0->IFE0, CSID_LITE0->IFE_LITE0 and
> CSID_LITE1->IFE_LITE1.
> 
> The CSIPHYs are handled through the PHY API, so no CSIPHY
> resources other than the lane format are needed.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> This patch adds camss support for purwa platform.
> 
> This series depends on:
> https://lore.kernel.org/all/20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org/
> ---
> Changes in v7:
> - Remove the duplicate patches and rebase on Bryan's changes.
> - Base on bryan/camss-next
> - Link to v6: https://lore.kernel.org/r/20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com
> 
> Changes in v6:
> - Rebase on bryan/camss-next; drop the dt-bindings patch, already applied.
> - Include Jesse's "x1e80100: Use the lite clocks for the lite CSIDs" as a
>    dependency, already reviewed:
>    https://lore.kernel.org/all/bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com/
> - New patch: use the HW CSID index for the CSID 680 wrapper IO path
>    config, the lite CSIDs program the wrong register since CSID2 was
>    dropped from the X1E80100 resources.
> - X1P42100: set the CSID hw_id, and use the vfe_lite_csid and
>    vfe_lite_cphy_rx clocks for the lite CSIDs.
> - X1P42100: align the clock rates with the X1P42100 camcc frequency tables.
> - Link to v5: https://lore.kernel.org/r/20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com
> 
> Changes in v5:
> - Set line_num of IFE0 to 3. -- Bryan
> - Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
>    resources and use it for X1P42100. -- Bryan
> - Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com
> 
> Changes in v4:
> - Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
> - Rebase on linux-next and add Bryan`s vfe patch.
> - Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com
> 
> Changes in v3:
> - Rebased on the latest CSIPHY code.
> - Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com
> 
> Changes in v2:
> - Based on the old version of csiphy.
> - Remove Src clk. -- Bryan
> - Extend the register block of the VFE. -- Bryan
> - Add comments for IOMMU. -- Bryan
> - Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
>   drivers/media/platform/qcom/camss/camss.c     | 176 ++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |   1 +
>   3 files changed, 178 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 7183081e357846bbdbbc2c6bdf6e134d723e00da..c684de629e3a4685d4ff04b24db86c12f962b50c 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2054,6 +2054,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
>   	case CAMSS_8775P:
>   	case CAMSS_KAANAPALI:
>   	case CAMSS_X1E80100:
> +	case CAMSS_X1P42100:
>   		ret = 16;
>   		break;
>   	default:
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 86bb1df811ea0e96357d18dae0a5bdce6507fb15..0404f95a35fe659c6f9d945ff5bd32ce749b0991 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -36,6 +36,13 @@
>   /* Top-level CAMSS version register */
>   #define CAMSS_HW_VERSION		0x0
>   
> +/* CSIPHY resources for PHY API devices, only id and formats are needed */
> +#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
> +	.csiphy = {					\
> +		.id = (_id),				\
> +		.formats = (_formats),			\
> +	}
> +

See a comment below.

>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
>   static const struct camss_subdev_resources csid_res_kaanapali[] = {
> @@ -4859,6 +4866,158 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
>   	.reg = "csid_wrapper",
>   };
>   
> +static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
> +	/* CSIPHY0 */
> +	{
> +		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
> +	},

To save more lines put the enclosing figure brackets under the macro.

> +	/* CSIPHY4 */
> +	{
> +		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
> +	},
> +};
> +
> +static const struct camss_subdev_resources csid_res_x1p42100[] = {
> +	/* CSID0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "csid", "csid_csiphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 100000000, 200000000, 300000000, 400000000 },
> +				{ 400000000, 480000000 },
> +				{ 400000000, 480000000 }, },
> +		.reg = { "csid0" },
> +		.interrupt = { "csid0" },
> +		.csid = {
> +			.id = 0,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		},
> +	},
> +	/* CSID_LITE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",

"cpas_fast_ahb" clock is not needed for CSID Lite, I believe. If so,
it should be removed from the list.

> +			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 100000000, 200000000, 300000000, 400000000 },
> +				{ 400000000, 480000000 },
> +				{ 400000000, 480000000 }, },
> +		.reg = { "csid_lite0" },
> +		.interrupt = { "csid_lite0" },
> +		.csid = {
> +			.id = 3,
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +	/* CSID_LITE1 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
> +			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
> +		.clock_rate = { { 0 },
> +				{ 80000000 },
> +				{ 100000000, 200000000, 300000000, 400000000 },
> +				{ 400000000, 480000000 },
> +				{ 400000000, 480000000 }, },
> +		.reg = { "csid_lite1" },
> +		.interrupt = { "csid_lite1" },
> +		.csid = {
> +			.id = 4,
> +			.is_lite = true,
> +			.hw_ops = &csid_ops_680,
> +			.parent_dev_ops = &vfe_parent_dev_ops,
> +			.formats = &csid_formats_gen2
> +		}
> +	},
> +};
> +
> +static const struct camss_subdev_resources vfe_res_x1p42100[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
> +			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 432000000, 594000000, 675000000, 727000000 }, },
> +		.reg = { "vfe0" },
> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,
> +			.pd_name = "ife0",
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_0 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 400000000, 480000000 }, },
> +		.reg = { "vfe_lite0" },
> +		.interrupt = { "vfe_lite0" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +	/* IFE_LITE_1 */
> +	{
> +		.regulators = {},
> +		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
> +			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
> +		.clock_rate = { { 400000000 },
> +				{ 0 },
> +				{ 0 },
> +				{ 0 },
> +				{ 400000000, 480000000 },
> +				{ 400000000, 480000000 }, },
> +		.reg = { "vfe_lite1" },
> +		.interrupt = { "vfe_lite1" },
> +		.vfe = {
> +			.is_lite = true,
> +			.line_num = 4,
> +			.hw_ops = &vfe_ops_680,
> +			.formats_rdi = &vfe_formats_rdi_845,
> +			.formats_pix = &vfe_formats_pix_845
> +		},
> +	},
> +};
> +
> +static const struct resources_icc icc_res_x1p42100[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,

What is the source or justification for these values? I believe it will
be sufficient to set lower values for ICC, like it's done on other
platforms.

> +	},
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -6264,6 +6423,22 @@ static const struct camss_resources x1e80100_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
>   };
>   
> +static const struct camss_resources x1p42100_resources = {
> +	.version = CAMSS_X1P42100,
> +	.pd_name = "top",
> +	.csiphy_res = csiphy_res_x1p42100,
> +	.tpg_res = tpg_res_x1e80100,
> +	.csid_res = csid_res_x1p42100,
> +	.vfe_res = vfe_res_x1p42100,
> +	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
> +	.icc_res = icc_res_x1p42100,
> +	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
> +	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
> +	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
> +	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
> +	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
> @@ -6284,6 +6459,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
> +	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
>   	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..734023839abe9ec6a89b1a5c2a0bd5e545846c0e 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -99,6 +99,7 @@ enum camss_version {
>   	CAMSS_8775P,
>   	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
> +	CAMSS_X1P42100,
>   };
>   
>   enum icc_count {
> 

-- 
Best wishes,
Vladimir
