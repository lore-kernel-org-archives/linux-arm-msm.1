Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9B13769EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787292264; cv=none; b=EbH3XsdaLLgKilCxbYVzkvKPenhcHdAqj+0J8123JXw36DfhOJx7YN8wWWi602tgzsesq9lwQU/1BoMfgVFUyBVKkfKoTDkJ1m49X87HNSxwnMyjqfmQrmgdSs4Ax4mozmnqWQ5VAij6p/XJaQaFErlXB3WBb5rI8Xkq84otSaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787292264; c=relaxed/simple;
	bh=7PVFDAaPiARKJ80fEmdaT/hxirTTD1gcbkMFy0WpkzY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eGYiSNoafqFs8YcQRRHCDS+LN8xKXDuOjwAq4d42uqzcrKzwmtR2ZyZ97za39+j8zO5eLg8DL8bJmUWPS2xGdmq54dq9bcN7oeCjwg1hTNV5XSy7pOnUp0HMds6RzAjYd4MF7cDXfWfyNi0rZiHnJe7xC87Oz2wgTKcqKRzMf/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT7ODpVK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfmV0JQw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT7ODpVK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfmV0JQw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5Tfht1796256
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zt+Ru4E5d5uRmTKbivun8Ht6e3mCZiXAX8zojp8Yn+4=; b=PT7ODpVKbCbme4KA
	c3zA8I2UCdGhQy/h/VY/t2rfuB8a8ZhfD4BG6NI+jmge4Xx9xboCUYUHStSNE29J
	2P3uT7ycursqzxnyYVH2ERIgUJWnQD4X5/G/DKXx5NtunRR+Wnt2LXiJOGV+UTQn
	vZh3nqV9dLK/RSBm0UF3jwhXxWEL1NoGxV/z5lZEYet24sqklmK1YUCuHePiToTl
	EqNrnjSxy5KG8DlsH9iyYWaAnU/4xZ9/cQSjJLHyUNyOcmxY2VrxijyK921iKDnX
	ZvJvNsi9B+F01SS7g1fZh/m9xuP8txYoC5uAVbdRhYIVWxUGu7GB6qOkO886AFF0
	I5i+KQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf04c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 06:04:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso18367265ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787292260; x=1787897060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zt+Ru4E5d5uRmTKbivun8Ht6e3mCZiXAX8zojp8Yn+4=;
        b=WfmV0JQwshxE1yrZ7I9yNkOV8ouM0JYb2V4D47uHDCAxCPrXYXiVauAGIZvBq2Jjhr
         iR1KLt/Dr1TouwRIeQlxreNTf5zJIB2FTJrpUioIvStyziuuIgo7+P8L33iS/Ventv86
         smYnBPXBy5j6/2e2zwZ1Y020VXDB+xskLl22dXI5tnwUH7mHEw7C6Ew5zTpNfww4f7s1
         qKTU8WFsH8109JXrWfzaTNvAE+S9JczVBnskEj1qFF8En3B05HNigK+OCvmcVuvjI78r
         vEjCflShi5icG0PK+A94bJJngqNrK6999AUvuJys8voNR9V6QdWWnijzYYzNM9aovuxL
         xXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787292260; x=1787897060;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zt+Ru4E5d5uRmTKbivun8Ht6e3mCZiXAX8zojp8Yn+4=;
        b=ZVQlErZHBef+m7FgFsDgIOQGeXrAM/Xds4l3UmNP/B7VTYJ4sDpN8O8oj65ySvXLaE
         r6rFQCKPb3dM2pRKgEk7rnYjNAFmEi71ZqBz3qTEteFPbm1gPacQXiBhTvkGhmPblaoN
         Hii/uXnpR8bhsEl6VRyGwo/Dmo2LotvDAWqlwqJu5jq4Aly3+Jucp1MiamYdR129Kx5E
         bt/CYN0WPwzFqOeKhI55J1j518HMHoWTqEim9LVcDYSHT7oMVDkTpzFRbIFapSjkhALB
         tMB+fbGpzJecyCxKR9HdO5ava85Z3+b8iSZJZH7yGa4+A1hzDmh6b4MENfXJUBWuH1r9
         dSaA==
X-Forwarded-Encrypted: i=1; AHgh+Roj09ATBYZknIb9YswoF3hfxyVjWjv9JedWfEF++CT59Xz+qZIbVr/AyGawEXRdGRgeW2XGDy9vsHkg8B5A@vger.kernel.org
X-Gm-Message-State: AFuF++mXtJ5mI5BbQ5hgPAToWZGGJZTL+zDGQIE3pmQNFnO7pe2Re3r0
	1IRbqxioyr7+RWRPrR1yWpuJbHuF9QXNDIgkalOiHI552fvtciGD7bD+UgUeVLTRXvPr5FgYxks
	FBXh4GKVF1/J5s0yD2GT3Si7pRwnvVtAPH20bQpWPoEM298Wk0VOr80onfUjxhm4YeS7l
X-Gm-Gg: AR+sD13eD90QeMkR4EZIbYKBQCZKjrFIdk5qkJq3lcvBpU2o1w1JaJ37a2o6ZE+OXPP
	t3PVz6aumfRy+ocq23ZBH7yLCLkSrsqxirMMQuKHxMgeKxlMgk4/spYkldGD3ItCpIrlYUeHuOs
	cUpD6wAHVY7aCFA5+fbtvJsy5fnbSlMavYgxieeLsckaq3z0bu7gCdrMqsTNW9R/h72xaputCC6
	IdAtItM9W+f/eHqjLxAFG/QsTMW3vzvCX9kMmlnCLtwl8b/rBOAM0RE0XRSaiWMxCeXqkTxYnBb
	tmNcK9IK5Oj6UfdxRifkaFRnjPxFd1A6pucdYKPbXba1vijHW/QIZF3uOZx0xFH883YwkCkTbDJ
	bF7a0n4zoeGYLOCu1IP+uQqxNbzBf
X-Received: by 2002:a17:902:fc4f:b0:2ce:93a3:c168 with SMTP id d9443c01a7336-2d64afe9f5dmr81442905ad.7.1787292260294;
        Thu, 20 Aug 2026 23:04:20 -0700 (PDT)
X-Received: by 2002:a17:902:fc4f:b0:2ce:93a3:c168 with SMTP id d9443c01a7336-2d64afe9f5dmr81442345ad.7.1787292259692;
        Thu, 20 Aug 2026 23:04:19 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1d8sm14656335ad.52.2026.08.20.23.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 23:04:18 -0700 (PDT)
Message-ID: <00c317f3-5320-4377-9e68-8f4c80f1d799@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 11:34:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
 <5a5sgj22xzjp3sosnfjvm62waz7sf4d7w33takzsbzpiojrc2h@z6a7bjazyhks>
Content-Language: en-GB
In-Reply-To: <5a5sgj22xzjp3sosnfjvm62waz7sf4d7w33takzsbzpiojrc2h@z6a7bjazyhks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a87ea65 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0-_UPcr4ncOa8GKeU5AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA0MSBTYWx0ZWRfXyEvJxRmFYDxc
 DqgkclVoAvS5lSBBXE2Q4x88sqptFmbrMGZ6wswML0bC/yrNIqOa5rrD8TXMxTX9KW3xgfpInAW
 /jQigbLXol0wOE/VB6f0EncdLGEf1L92z6bJDnMRF8lTus8USMQ4GflErljF5b34YpDWkWaHWYS
 S6XPW/ZQ78miqrV9BoT/SfRnibGX9yM1BpPoD47693R5NEwxoZVkGJi0MBB5gBAjkrZbiWnJRVE
 wQUl78NWQn7FDw6qKvxcYy5Q1fYriqPmPNcM5LoPrF59jABulRjfhodVt3bbVJ1JKoBpaYjboKG
 y5+YrBEca6Nz6hEOxA6IfKiKJV1y/EY3FLddNCLni6x7SjY2ytkRp4fwb0QLk4PlNg/Jnp3o1km
 +nErWFTfiS+ggiYIY7QDUDDeow4pYnrdqBbjw74zVrWvlXfQbXTlRkKxfLqGJYq7RKinHdF+qna
 HXtuN9koU9RXoCQz/mg==
X-Proofpoint-ORIG-GUID: rnouBFIqtnaUVNXmLutG3Jy3q5kYbWV-
X-Proofpoint-GUID: rnouBFIqtnaUVNXmLutG3Jy3q5kYbWV-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA0MSBTYWx0ZWRfX9lDMeJz6uy5g
 nKbGKvq7u8Dx63OVVue5bzkVIm1q/Du/IChlH9Dl0hsZ66FrEUZVJqWdcXwa3FvwiMmg+I5rpAG
 Wy/LVajNPrC9ZiFdxykO00gHJ7ouVWg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210041


On 7/22/2026 4:56 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 21, 2026 at 10:48:33AM +0530, Nabige Aala wrote:
>> From: Ritesh Kumar<ritesh.kumar@oss.qualcomm.com>
>>
>> The existing DP PHY PLL and AUX configuration for the Glymur platform
>> does not fully follow the Hardware Programming Guide requirements for
>> DP over Type-C, which results in DP link bring-up failures.
>>
>> Update the DP PHY programming sequence and PLL-related register
>> settings to align with the latest HPG recommendations. With this
>> change, DP link training completes successfully on Glymur-based
>> platforms.
>>
>> Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
>> Signed-off-by: Ritesh Kumar<ritesh.kumar@oss.qualcomm.com>
>> Signed-off-by: Mahadevan P<mahadevan.p@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala<nabige.aala@oss.qualcomm.com>
>> ---
>> The existing DP PHY PLL and AUX configuration for the Glymur platform
>> does not fully follow the Hardware Programming Guide requirements for
>> DP over Type-C, which results in DP link bring-up failures.
>>
>> Update the DP PHY programming sequence and PLL-related register
>> settings to align with the latest HPG recommendations. With this
>> change, DP link training completes successfully on Glymur-based
>> platforms.
>>
>> Changes in v2:
>> - Use the DP-specific v8 COM status register definitions
>> (DP_QSERDES_V8_COM_C_READY_STATUS and DP_QSERDES_V8_COM_CMN_STATUS)
>> instead of adding new N3 USB/DP variants.(Konrad)
>> - Drop the qmp_v8_combo_configure_dp_mode() implementation and
>> reuse the common qmp_combo_configure_dp_mode() helper, restoring
>> orientation-specific DP_PHY_MODE programming (0x4c/0x5c) and addressing
>> review comments regarding DP_PHY_MODE handling.
>> - Include phy-qcom-qmp-dp-qserdes-com-v8.h for the DP COM register
>> definitions.
>> - Update patch author to Ritesh Kumar.(Konrad)
>> - Link to v1:https://lore.kernel.org/all/20260419-glymur_dp-v1-1-ad1067a8e8ae@oss.qualcomm.com/
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 190 ++++++++++++++++++++----------
>>   1 file changed, 129 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index cdcfad2e86b1..c98abae40a32 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -50,6 +50,7 @@
>>   #include "phy-qcom-qmp-dp-phy-v6.h"
>>   #include "phy-qcom-qmp-dp-phy-v8.h"
>>   
>> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
>>   #include "phy-qcom-qmp-usb43-pcs-v8.h"
>>   
>>   /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
>> @@ -283,8 +284,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>>   	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
>>   
>>   	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
>> -	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
>> -	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
>> +	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
>> +	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
> There are too many changes squashed into one commit, which makes it
> harder to review. Could you please separate them into the logical
> smaller chunks? Register layout fix, tables and other values update,
> configuration rework, etc.

Ack, I will split in more logical chunks.


>>   	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
>>   
>>   	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,
>> +static int qmp_v8_helper_configure_dp_phy(struct qmp_combo *qmp)
>> +{
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	u32 status;
>> +	int ret;
>> +
>> +	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
>> +
>> +	qmp_combo_configure_dp_mode(qmp);
>> +
>> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> If we are writing 0xa4 here, why does qmp_v8_dp_aux_init() write 0x06?

Ack, According to HPG in both places it should be 0x06.

I will correct in next revision.


>> +
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
>> +
>> +	ret = qmp->cfg->configure_dp_clocks(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
>> +
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +			status,
>> +			((status & BIT(1)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>> +}
> This is exactly the same as a part of qmp_v456_configure_dp_phy().
> Please use it in that function too (and name correspondingly).

Ack, I will update in the next revision.


>> +
>>   static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   
>> -	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_PSR_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> -	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>> -	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +	writel(0x3f, qmp->dp_serdes + QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1);
>> +
>> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>> +		DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
>> +		DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>> +		qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>>   
>>   	/* Turn on BIAS current for PHY/PLL */
>> -	writel(0x1c, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>> +	writel(0x17, qmp->dp_serdes + cfg->regs[QPHY_COM_BIAS_EN_CLKBUFLR_EN]);
>>   
>>   	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
>>   	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> @@ -3361,8 +3420,8 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>>   	writel(0x27, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>>   	writel(0x27, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>>   
>> -	writel(0x20, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> -	writel(0x20, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>>   
>>   	qmp_combo_configure_dp_swing(qmp);
>>   }
>> @@ -3370,48 +3429,41 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
>>   static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
>>   {
>>   	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
>> -	u32 phy_vco_div;
>>   	unsigned long pixel_freq;
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   
>>   	switch (dp_opts->link_rate) {
>>   	case 1620:
>> -		phy_vco_div = 0x4;
>>   		pixel_freq = 1620000000UL / 2;
>>   		break;
>>   	case 2700:
>> -		phy_vco_div = 0x2;
>>   		pixel_freq = 2700000000UL / 2;
>>   		break;
>>   	case 5400:
>> -		phy_vco_div = 0x4;
>>   		pixel_freq = 5400000000UL / 4;
>>   		break;
>>   	case 8100:
>> -		phy_vco_div = 0x3;
>>   		pixel_freq = 8100000000UL / 6;
>>   		break;
>>   	default:
>>   		/* Other link rates aren't supported */
>>   		return -EINVAL;
>>   	}
>> -	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
> No more VCO?

According to glymur HPG "QPHY_DP_PHY_VCO_DIV register does not 
participate in the

divider of vco_divided_clk, it can be left as it is- No impact"


>>   
>>   	/* disable core reset tsync */
>>   	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>   
>> -	writel(0x04, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
>> -	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>> +	writel(0x09, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SETUP_CYC);
>> +	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_SILENCE_CYC);
>>   	writel(0x08, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_CYC);
>> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>>   
>>   	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>>   	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX2_TX3_LANE_CTL);
>>   	writel(0x05, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TX0_TX1_LANE_CTL);
>>   	writel(0x01, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_AUXLESS_CFG1);
>> -	writel(0x11, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>> +	writel(0x33, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LFPS_PERIOD);
>>   	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN0_DRV_LVL);
>> -	writel(0x1f, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>> +	writel(0x02, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_LN1_DRV_LVL);
>>   
>>   	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
>>   	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
>> @@ -3558,7 +3610,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>   	u32 status;
>>   	int ret;
>>   
>> -	ret = qmp_v456_configure_dp_phy(qmp);
>> +	ret = qmp_v8_helper_configure_dp_phy(qmp);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> @@ -3570,13 +3622,13 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>   	} else if (dp_opts->lanes == 2) {
>>   		bias0_en = reverse ? 0x3f : 0x15;
>>   		bias1_en = reverse ? 0x15 : 0x3f;
>> -		drvr0_en = 0x10;
>> -		drvr1_en = 0x10;
>> +		drvr0_en = 0x30;
>> +		drvr1_en = 0x30;
>>   	} else {
>>   		bias0_en = 0x3f;
>>   		bias1_en = 0x3f;
>> -		drvr0_en = 0x34;
>> -		drvr1_en = 0x34;
>> +		drvr0_en = 0x30;
>> +		drvr1_en = 0x30;
>>   	}
>>   
>>   	writel(drvr0_en, qmp->dp_tx + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>> @@ -3584,6 +3636,14 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>   	writel(drvr1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_HIGHZ_DRVR_EN]);
>>   	writel(bias1_en, qmp->dp_tx2 + cfg->regs[QPHY_TX_TRANSCEIVER_BIAS_EN]);
>>   
>> +	writel(0x03, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +	writel(0x23, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +	writel(0x22, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>> +
>> +	writel(0x0a, qmp->dp_tx + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
>> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL);
>> +
>> +	writel(0x3e, qmp->dp_dp_phy + QSERDES_V8_DP_PHY_TSYNC_OVRD);
>>   	writel(0x08, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>>   	udelay(100);
>>   	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
>> @@ -3591,16 +3651,24 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
>>   
>>   	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
>>   			status,
>> -			((status & BIT(1)) > 0),
>> +			((status & BIT(0)) > 0),
> Why?  Should we poll both BIT(0) and BIT(1)?

According to glymur HPG expected readback value is 0x01. So only BIT(0)  
would be enough.

Thanks,

Nabige

>>   			500,
>>   			10000))
>>   		return -ETIMEDOUT;
>>   
>> -	writel(0x00, qmp->dp_tx + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>> -	writel(0x00, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_DRV_LVL]);
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
>>   
>> -	writel(0x2b, qmp->dp_tx + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> -	writel(0x2b, qmp->dp_tx2 + cfg->regs[QPHY_TX_TX_EMP_POST1_LVL]);
>> +	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
>> +			status,
>> +			((status & BIT(1)) > 0),
>> +			500,
>> +			10000))
>> +		return -ETIMEDOUT;
>>   
>>   	return 0;
>>   }
>>
>> ---
>> base-commit: 6946bc5406f7fe2cb024419eca681bb0280f3461
>> change-id: 20260720-glymur-phy-conf-fc878ed134b1
>>
>> Best regards,
>> --
>> Nabige Aala<nabige.aala@oss.qualcomm.com>
>>
