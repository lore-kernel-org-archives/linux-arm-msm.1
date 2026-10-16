Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F671392811
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148853; cv=none; b=LbSan9n2Q2XFRK6U/o4RThLoHTCneszJKHn7jAMBL+5X7PGBgNEWr2CwMAnFOOiRLE9BQi1jQn/7kVpzkePxmZ5r3xj87qJeMUys5tlIeEpvqCXeyMBDHLbYlTfMhoHr4jmayK9jU3S2bZ+X0vuDKmVRLp2x96fetlISXcD1lCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148853; c=relaxed/simple;
	bh=ZDcMunxd98cuO0F7FMu7fkkixoxvBN1tgMVTeIp/JyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ls3v2QG6mcwy13EdR6wm6kqy9R7LWTTYO0CxuqzMAR+u9oGxruGYhKJiJsCJ9BYB3WYTLb+AcH4LuXzrD8SoL83z9VJuGtyXA+K09hZQ4BFTgQS4Wz88FWGu4iAZ0Li99NO1ZTmBwnhEDfpfHlQ8LNUl3xUeNcihvM0SIWMHzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEI93Gb2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEI93Gb2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so681276f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792148847; x=1792753647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=TEI93Gb2ZyoBvpdGFTOblgsStFhAC3JSuO97n0HpNO3ASPk97RzKADz1fxDZMZjSwy
         oXajyXzKpXsvMoDo9X2smFfQDWnqOHsZcYB8BuNlD6AUonngN+ogpKKmhAbMq/gkA1e0
         kK5LUn2U/rnz3ItwL7QYKna+6PkvH+eSzBEL4D0WczrHs8jnA9Uwfk+qPbtBte7KH6lp
         9LvRkS1V0tzOjX3WHtj4pegDx4fDF+xo6axfPp5UjkvfCLriBAb39Fj9k1Zp7Xm43O2J
         S+Vwzaf9yLluE1ML4v9cY3hnj/T7mXw24h7+eZJZHr0rh7FHlitUBWOLwhFxo/3NYr+u
         UdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148847; x=1792753647;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJqf2rITdCzziip2V1CcQ4gA2chUDN+IaUybbZl++MI=;
        b=uzK31XY3GmNFA2uVO6M4zpk4IUjhSDl8G0Fv15uXaK9HSf68ZKjRjgl8SwbVU2Y4Bz
         1c2zCL8lpoWhxxhaHgHovQF6tAqPi/blrOnmVcgP+z0luihGy2G2H1axEk/kHcHUW35N
         o/PvR+XSm1mHOS9ki9gOvYmL9rAIC4mppoicz509gPpXMd01nYLNf9mneJ/aSYu8Rcff
         7/XJDVFSbvoN4JZqvqPoA2o6vz+NMV/W6nNwubM4xD8wJrvXA9BZ/ghnmbJlgO+ZkNPf
         PaqzXXFZTMPVklVOJarsyFq5nHyy2z+jsE8/elkZGaWhFmyfstu85821QCCAtm0LI1HD
         qkrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDtJc4OdTbkkl5a1VHVo1Lf07Vtsn7UcWm127vqUrPZ8Zm+8Zi+mGKgufmgydeYJ7P3sgBv5WOUwkrShxP@vger.kernel.org
X-Gm-Message-State: AFq9FYI/qz0KI1b4y0FlMLLM00KFhLnXnRfDEXQ/g6JB/T0doMrAdn8Z
	CdcjBvoDX/OKrI8Eaz6CL4GfkDIoijFPFo/GISo+UmXu6Fh2rclaeKQ4vRNjLo+8sl0=
X-Gm-Gg: AYBFou0MxtivBO/qfOi2IiCrOMsPyDSinF13Tb88TEw1HJZP06TDvlvezmNpBGTU61D
	1FjQLxxYOE7985JFXpXBZevm2BCEE1f7y5xED0CtBOC0QOCi0dwSSpG5nC+QhMrEXfBGuKO+4Rp
	03S14DPePGvKPVmljXDWIYp2s4Ja5/kFsAo99e80wPmAjQwEZYU5c7rJV8/A6A9ioXeiDFJmvl6
	xPNtw7xKloRusOohlHtC2zXIO5UmVKZXlODuxYkTYCyno3vAf8YczyL6TdX9LlIvhsH1POiA9QA
	CyCwswKjsNwlsy95EgTYMOKHg2sP97YCAUY69dG5aBoHsiOhCH8fIHQn32/37lVFJs7QuPHFqbS
	ZQlv2AVlLQnRQhYygGUJzgoKGTY4BX2lLMy0+ydwtxvbsPY2XWdhl4SIUFHIZvfdc0N2PIkqJGs
	Z1bhMuZFPjEYZAy1IXe8CogKBZrmkf7XSBpFlHFN4hj7Mt5Ui2oaj+V0ef57ms9z/575BOAsQZV
	czC5S4KAB8=
X-Received: by 2002:a5d:6750:0:b0:48d:ed2e:6f3a with SMTP id ffacd0b85a97d-48dfacf53edmr4363835f8f.5.1792148847254;
        Fri, 16 Oct 2026 04:07:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.78.92.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm4468353f8f.47.2026.10.16.04.07.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 04:07:26 -0700 (PDT)
Message-ID: <27382104-14f0-4721-8d76-03fe9f2c1ba5@linaro.org>
Date: Fri, 16 Oct 2026 12:07:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] phy: qcom-mipi-csi2: Rename the D-PHY init
 sequence
To: geocausa@gmail.com, Vinod Koul <vkoul@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com>
 <0mIVMmu2iTCn5IeBYzGgIAH1kG2MFMNadT3axJ3D5fX-n2f-sXxmZeicphrhRwRt4YUTZBY-4uEATZz7IiQEGQ==@protonmail.internalid>
 <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261016-x1e-cphy-rfc-v2-3-377654253193@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2026 11:57, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The init sequence and its size describe the D-PHY mode only. Call them
> dphy_init_seq and dphy_lane_array_size, so that a C-PHY sequence can sit
> next to them under matching names.
> 
> No functional change.
> 
> Suggested-by: Bryan O'Donoghue <bod@kernel.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 8 ++++----
>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98..b2d4ec3e8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -246,8 +246,8 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>   				     u8 settle_cnt)
>   {
>   	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> -	int i, array_size = regs->lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *r = regs->dphy_init_seq;
> +	int i, array_size = regs->dphy_lane_array_size;
>   	u32 val;
> 
>   	for (i = 0; i < array_size; i++, r++) {
> @@ -372,8 +372,8 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
>   const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>   	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
>   	.reg_info = {
> -		.init_seq = lane_regs_x1e80100,
> -		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.dphy_init_seq = lane_regs_x1e80100,
> +		.dphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
>   		.common_regs_offset = 0x1000,
>   	},
>   	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007..0d6031a4d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -48,8 +48,8 @@ struct mipi_csi2phy_lane_regs {
>   };
> 
>   struct mipi_csi2phy_device_regs {
> -	const struct mipi_csi2phy_lane_regs *init_seq;
> -	const int lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *dphy_init_seq;
> +	const int dphy_lane_array_size;
>   	const u32 common_regs_offset;
>   };
> 
> 
> --
> 2.53.0
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
