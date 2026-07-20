Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F738449B08
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 20:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784577988; cv=none; b=tSXsl9XSeWrJOIklu5AckJEiL6F3YCQPp1qDg90bDs5Ff9nZe3WqWxJkrQLe3fBDN6GjGnhzpFnVvC+f8siCD63eO0WxKOxyRKEUlGoxcCiy5lWRlOjhYe8sAtfSXIFQwTnac7SdAvo5gYJ1tFT4Tuhu1vQSV3F6WHpAZjXUf8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784577988; c=relaxed/simple;
	bh=Qr4/zlfGO+ip6wZ/F+qhAFCtp+uypkDyk3NHaUSmcAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwzgkyM/jFoZBoEDwun4vPoI5DIarDbR5jyMQucwvr5sBUX60CHcSS0DsP9Pma8IRnhkCTToglQXD3KzXIIpLCoqST6LRlbLsSBn4DkBW9nWgkypAue7cgdbFXEyYJtHfw9C4XuV+rqrV4YU9pT7/KZTbx/oVyRJ15Na28nZQeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obf6Z7Vu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obf6Z7Vu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495590dde14so18100765e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784577985; x=1785182785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=90hzxiWfvmc2pNodPHMrUN3Ni18ZS0Dy7y/7ObcbFrk=;
        b=obf6Z7VuyyGOhzSPoOj9gBchbqPF1AqPM+ZV3CYKQt//aU6ejYaNH76wPcMhD76tuM
         5RkfRagJf/sA1NIVUdGPAUOjnjLYRrhFZ16WrJ/eio08mBChVV3xERFl9TvqxaTpLd5A
         6vzsDJYgKVYTUHO4HCS3KzgaTz4jNfIdmKOzwDVJClz0P43MVL4Uf+DN7WgcHnZHjH9W
         oomXxnB3BP3qp17/Jd/RSVJr0ch4oC7IiCLC2WPUqdvWhVn5Iy3n6SrpfszFQebVDtH9
         jxdZohD2WJk55ELGgV6/4c0Tt+yuTg4rkgBnWsBYz0QnI0MYK08WlLoTKbszKnkvwt/e
         vfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784577985; x=1785182785;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90hzxiWfvmc2pNodPHMrUN3Ni18ZS0Dy7y/7ObcbFrk=;
        b=jyWPK4sAnW/ZyxYvKgDNuvc7P8Jdj0ZCzFbN0p8N5DQE+QwzLotUnK+dnuvq16HcQY
         jo4BLztXnlBMNbRyD51AzSRslr+JJDB+oyLLksk6zdPeoy2IfgBEYITXR0gJ9i2BmVjr
         Xe1cu5m4xUvOvqfGbBM7OZ0q6yNb0B6KIiRnhWsx9gZ7FrDh1MZIwCMqLJgP32XXnCbf
         4m25CC3Fjybybr4hzIcTjAp7g3vyS2L7pCyWwQFaEc/2PQs36eWLB/nzpIUUteu4CKdj
         nCDdwHiHKe/E3d/AKcB71DudcY6F14lPhKVMjF9Q04Aq457+827GcVWPHBXvGyCrmWXs
         eRsQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMMpiJ/i9gmYIgF4T2TkQ26aTZKQlZIGNUYdSe30XOc8gBWEV2BY/JV1Q6FqKPNx7mddV/whF1ka4eHZ5w@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7qjJ58Aehg1djv8M8c6hTsebWPnax49wpqaWk805zcBGftC3
	RiCWGiHYs4HRPepQ6XBlm+lvYCsGPqiPeaw/ahk+hAEqzGcNLSbnZnXkWSeUUjOeCUM=
X-Gm-Gg: AfdE7cnBkVydfVu+WC8LBOS8XormHIaIwfb1zLeKYuJZgT4YkY6IpqxKEe8M14Q7avC
	y4iJYD160/Vs7Xn/7eql9ATL9CDvCJz5CelpVlyV1+74Gre9UmXq+4jV1bTOw0t3rnwx8pYzOJc
	YIEsY51IHW28E65PH6+z/QOCOSsqF05FNigLbfdJwPoS08dJaW5P0HtfBU6pX3R0uAMbPphmZX5
	z6GxbuC6sQFuzN/tz2vUYYaDdw9x+hdooTbwpGms2DPwU0dLgTYjLZ59E0x5ictChxDJJv5bpkr
	9dcilIIMlF4aULlIjKjIp5TPQzFvmozM3S7ye3rooO28fmgedYRz5vhic48eQoCBWBUiKAXecqk
	0gyusiR6hvpusz4XXmJoJ7Aewypp3qV4XOVa+yVJ3mL62NzBd0SQsT6VQ3DzwnXI5IGbVd6NFr8
	86zJ7OBPhoUkFnjlz65a800vqG
X-Received: by 2002:a05:600c:c04c:b0:495:63e4:3a91 with SMTP id 5b1f17b1804b1-49563e43af2mr28266835e9.35.1784577984824;
        Mon, 20 Jul 2026 13:06:24 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.26.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563e4573bsm28844795e9.0.2026.07.20.13.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:06:24 -0700 (PDT)
Message-ID: <286a1fc6-bd58-4ade-b183-e53776ba7a09@linaro.org>
Date: Mon, 20 Jul 2026 21:06:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: qcom: camss: Program CSIPHY common control
 registers
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jigarkumar.zala@oss.qualcomm.com,
 gjorgji.rosikopulos@oss.qualcomm.com, hariramp@quicinc.com
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
 <20260717231331.1229693-2-anusha.nandi@oss.qualcomm.com>
 <CAFEp6-2epusvgnSthNRBvOq0vONk3hu7v6tq6SF-HjnSWgpstw@mail.gmail.com>
 <530a9493-24c7-4812-8ada-591c7b63b651@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <530a9493-24c7-4812-8ada-591c7b63b651@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/07/2026 20:38, Anusha Arun Nandi wrote:
>> I don't really like this big camss-version switch case with magic,
>> which also introduces more magic values. Maybe we should have a
>> different version of csiphy_lanes_enable, based on the phy compatible
>> or revision.
>>
> Thank you for the feedback! We agree with your suggestion and will
> refactor this to use a version-specific implementation of
> csiphy_lanes_enable, based on the PHY compatible or revision, in the
> upcoming patchset.

Hmm.

Please don't do that. Instead work with David to get CPHY support into 
the dedicated driver - including whatever additional work is required - 
perhaps nothing more than reusing the existing dphy_opts structure for 
cphy purposes.

Proceeding in the direction elucidated above would mean inclusion of 
four CPHYs into the exiting infrastructure - that's not "stopgap" that's 
established precedent.

A big no from me I'm afraid.

There's a real upstream gap to be addresses for CPHY. Let's address it 
not work-around it in a specific way for our platform.

I'd expect to see some kind of subset of


include/linux/phy/phy-mipi-cphy.h
struct phy_configure_opts_mipi_cphy

or perhaps we can reuse/abuse struct phy_configure_opts_mipi_dphy - for 
example could it be changed into a generic structure to contain both 
cphy and dphy data - with an appropriate name change ?

My feeling is a phy_configure_opts_mipi_cphy structure is required but, 
perhaps both cphy and dphy can exist in one structure or in a union of 
structs.

TBD

deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel 
git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
➜   grep dphy include/* -r
include/drm/bridge/dw_mipi_dsi.h:struct dw_mipi_dsi_dphy_timing {
include/drm/bridge/dw_mipi_dsi.h:			 struct dw_mipi_dsi_dphy_timing 
*timing);
include/linux/phy/phy.h:#include <linux/phy/phy-mipi-dphy.h>
include/linux/phy/phy.h: * @mipi_dphy:	Configuration set applicable for 
phys supporting
include/linux/phy/phy.h:	struct phy_configure_opts_mipi_dphy	mipi_dphy;
include/linux/phy/phy-mipi-dphy.h: * struct phy_configure_opts_mipi_dphy 
- MIPI D-PHY configuration set
include/linux/phy/phy-mipi-dphy.h:struct phy_configure_opts_mipi_dphy {
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
include/linux/phy/phy-mipi-dphy.h:				    struct 
phy_configure_opts_mipi_dphy *cfg);
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_get_default_config_for_hsclk(unsigned long long hs_clk_rate,
include/linux/phy/phy-mipi-dphy.h:					      struct 
phy_configure_opts_mipi_dphy *cfg);
include/linux/phy/phy-mipi-dphy.h:int 
phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg);
include/linux/platform_data/media/mmp-camera.h:enum dphy3_algo {
include/linux/platform_data/media/mmp-camera.h:	int dphy[3];		/* DPHY: 
CSI2_DPHY3, CSI2_DPHY5, CSI2_DPHY6 */
include/linux/platform_data/media/mmp-camera.h:	enum dphy3_algo 
dphy3_algo;	/* algos for calculate CSI2_DPHY3 */
include/media/ipu-bridge.h:	u32 dphylinkenfuses;
deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel 
git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
➜   grep cphy include/* -r
include/media/v4l2-mediabus.h: * enum 
v4l2_mbus_csi2_cphy_line_orders_type - CSI-2 C-PHY line order
include/media/v4l2-mediabus.h:enum v4l2_mbus_csi2_cphy_line_orders_type {
include/media/v4l2-mediabus.h:	enum v4l2_mbus_csi2_cphy_line_orders_type 
line_orders[V4L2_MBUS_CSI2_MAX_DATA_LANES];

deckard@sagittarius-a: /home/deckard/Development/qualcomm/qlt-kernel 
git:(arm64-laptops-v7.2-rc1-camss-v6-ife-bringup) ✗
➜

But to be 100% - I'm fully against burying inline CPHY code into CAMSS.

The long term objective of cleaning things up and reducing technical 
debt can't be realised by - adding more technical debt.

And I'll reiterate the right-thing-to-do (tm) is to expand the kernel's 
understanding/definition of PHYs to encompass CPHY for the benefit of 
users and the entire community - instead of a qcom-specific hack.

---
bod
