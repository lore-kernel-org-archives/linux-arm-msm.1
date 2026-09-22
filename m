Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE91053A397
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075663; cv=none; b=BWodklkxFAwqubuUpi7/TwKwLDb0jyavfImocd5/v8kUMKFHcuK/6HRnucdsPctiiU/dJJN3GCKDDvZwlKR9ABgjRVWVwXlKOQFdhG0/WyjT5vuW/D7d7wqx0iXGEh5PH5C89Ey4UcrdRjtCNPGzImmQU0JxKrflPySDnRv3HAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075663; c=relaxed/simple;
	bh=CcNAs5xWCFjszCSyidOFofwkP/j94He1IFaeEa3uZPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b3AMkS+y8zOUdmxugiX5xDWZLROcTvxvYiRdb5iWKLVocQeKfxyomT/YgQXLfWijaX6uUUSktLKaj4U52QKZgnO+QQo62mUM5roQj+CPxRqsXfZojEN4r63lH9omiv98JmwLVc6xtleCvqddDi4LAJkGs11J+toTUxYGfuO5pWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD/mqh64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTpkYBcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD/mqh64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTpkYBcm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dIC93704263
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WrNX7iZteHGO30rYXtI5ccyGSk1aE90t9DJhcGcX9k=; b=mD/mqh64mSsCkjKs
	XTs+OPSugh8VGLSN5cvYNJVQwZmAcGL9F8XIAUuEu3k4PqDThDQKAZcSsSf1cg/Z
	/wjclloDMYXp/V7onaw+cAscrD70atk0s0f3EAD9GZPwPafvKq2QfwEpvVj8bc6+
	Q18hb+IKUwBwnx5J74RNI/Ngakj/5sj92KVsLB8Xz4DVGoCjIqTi7vkRx+x+rqpl
	DgOX6HnEUJNW/CbRhwi3QzU9paGtfrqhOHAsNbnZfcw/1rkvnfZ0x4SHANMuvdy5
	/27F+Gm1eopRnOPnaBbq8JZLInQj6lxj4G5o9iys+xsodEqHrxMtUvFhNqYN6owf
	4HKBrQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgm5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 11:14:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so54653685ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790075659; x=1790680459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WrNX7iZteHGO30rYXtI5ccyGSk1aE90t9DJhcGcX9k=;
        b=CTpkYBcmchFc0BaxZYnkr9Luq2L1sLXu7g010PfXUeb1M5PHUpzLcCXS0gwCgmMqgI
         YD27ooMNBK9TOJ77tGyHFW9wHiwXmXQZrUXB/S2Dnj97MMXQ16IhKmwyNqt1fzdggLGJ
         yO1klaIuqxTuaXuOn7QXD4Ap98XlaPRzVTSfS8FHpf913zl8MahO3jNySKEl4GmRXRVn
         sIV6+WWhEnwxw0hAKwUaLqLvRpcJ0iRdG2U9hskSkRTFie6YLITtRyqCEc3IAnn8GXct
         L8ILWvko1JvFes0bYX/5H1ikUhOIn0Dt2o98CBZB2N38y428BCclCujypTgNnqquv6kM
         22pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075659; x=1790680459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WrNX7iZteHGO30rYXtI5ccyGSk1aE90t9DJhcGcX9k=;
        b=x+gmvSUMra9dewcPU7R1q/IuUMIj/yQL4V29B0LXxKb2giBdoUrucAxRGl8juXGr10
         yXQbqNfXqjA5X42JXRFfUFxJZisHjjNeeqAk0yX+xgOySOXJXmsjlIsxlqD7Z/TeP0fz
         DONO2xwxLZNzqgAiMfXmAPckCdIDxMSkP+bZBSb81d4lvcv20/S2ESxg7CU1LdKtBRT6
         CACGKEWYESd8OmLHJJc8pbwXg67Lruw4NyMg0CDES6v02N8qt+m6Hi8V24V7pXmcD5D/
         /NJ/pJzyuDJWHFEBHGGmd/lTDfLD44gF3vHMrAJbumovy4NDHBxlbdXiIrKTC9CVq3Tf
         zaqA==
X-Gm-Message-State: AFuF++nIZDKvIggvz9biZESN4SoCQbbSipL34LP+3+Svpuz/X5wk+apF
	GIIGXwlCu6l3OHAwPWoXiGinFc2iioeS2nlSDmXlgYX2jutnKrgDqEU7CXA62MzRAknoZJ26+uo
	p3CUpBnnZVZY0wSTj/obHVIZ6t/P8ZBVDJd84qRGxf5l4MpYwm1jqM9nzhnSrvvD07LJ+
X-Gm-Gg: AYBFou0DEC1g4nMD6c8h4cyYjMr2EikKlScR0Ggg3yEVPn83VKe8u0oD9uqesh3mCiO
	mb5+V5GovC/lL51J/og5ikFs+vKbV/XCcvubw6Ujjnfrr/Ak9RqhSeZj1HkJV8t4HmInsR7Lqw0
	aItpM3yZASlXQTHh+xvfGxXorMFXL8evWhpFq+m0BBsS5zkprhDcNhS9eWY1Y0hg4hff0+SiKGc
	8Us9CSb49dgevM+WdzF0DDY7OFEF/RQB4hLYScv6VRf6I6HLjyFNpYPwQKnrr8nJ1Jvqj+c8KZJ
	uvFzb9PBkKdvd4YChg9d1y/hoES5zP67Tmtnjb81u3wBu6K1sB/e9DLeFh7ipTujmmbrYjdhLPQ
	prB0NXO4pwoMUbjNoxmn1HpiJJtNmUY8OTTJWHW518GAwdgf7VB1rr8ph5fjG2mAb
X-Received: by 2002:a17:903:3c23:b0:2dd:c100:9433 with SMTP id d9443c01a7336-2df60b69546mr9454945ad.49.1790075659276;
        Tue, 22 Sep 2026 04:14:19 -0700 (PDT)
X-Received: by 2002:a17:903:3c23:b0:2dd:c100:9433 with SMTP id d9443c01a7336-2df60b69546mr9454415ad.49.1790075658764;
        Tue, 22 Sep 2026 04:14:18 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d02fb15sm8331415ad.40.2026.09.22.04.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:14:18 -0700 (PDT)
Message-ID: <de51ea07-cfa6-4006-8727-6af67bd8da1a@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 19:14:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] clk: qcom: ipq-cmn-pll: Add IPQ5210 CMN PLL
 support
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE2MSBTYWx0ZWRfX+i+uZQQrODoW
 D3fB1b7YLOcyecUIbHuz68gB+aCQ6IqqqHN1oc99LUySTEQLV1ZXohjZA63aglHGSx+GLJ8oJYD
 DbQyKMbz/uKXFouCsqS9sgLbYowrw2vPHBFkgokxr8MJUmVqwpulj64+0PHt5VWWSoeacq6pAJC
 5ckg0IKKKm3mGQa6b+W4a0ifFYydLFXJk8wbnuNSFdQ/YKNKkD5ciN+rRtSS1FVf6n0tXRtzfpn
 t44sqLwKHvWhLBeLjKRdRPmvI24z4ZDYNYb4rZxCIbZAX2iPKE206d2mevlU4v5Zn3zJ1F7Tcwv
 bYaTAOYmW6CMDjWCt/Q+rKSnJKbvTFMV7ICk9D2qdbypRT9NMbGn/aAN/uF96ZwELLLMyE4ptZy
 9BCisx584zhDXN834/DKNMNW1Da4VSxj9c3XG+IpSvN3fXisKX0a4l9fSBtbr0S1WqVRj+LrUwk
 VOMV2AYo0EVXEHlgX3A==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2630c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=g-7O86lBZr47vv8Ef_0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: eKWKsU6hEJOMSwCN9w-XIk68LC5aM2D2
X-Proofpoint-GUID: eKWKsU6hEJOMSwCN9w-XIk68LC5aM2D2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE2MSBTYWx0ZWRfX8bFd7G5eZk3w
 nT9VaksndWnuIju3koYE3V/kNgmSvY/ODzG/iENrYWaTEY5SQUzkypj21OOb/cqD1kio3Erh9j2
 kXeaDcD1nUplBQH0jQNy6Q6NipHthRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220161

Konrad, Abel,

Thanks for your review of this patch series.

Gentle reminder to re-review v4, which addresses the feedback from v3,
for any further comments.

Best regards,
Jie.

On 9/6/2026 10:18 PM, Luo Jie wrote:
> The CMN (Common) PLL block of IPQ5210 is almost same as that of IPQ9574
> which is currently supported by the driver. It accepts a 48 MHz reference
> clock from the on-board Wi-Fi block and is configured to run at 12 GHz.
> The difference is in the output clocks.
> 
> This patch series adds support for IPQ5210 into the CMN PLL clock driver.
> On the IPQ5210, the CMN PLL block supplies a broad set of output clocks
> to the networking hardware and GCC:
> 
>   - NSS (network subsystem): configurable rate via 6-bit divider
>   - PPE (packet process engine): configurable rate via 6-bit divider
>   - PON (passive optical network): configurable rate via 8-bit divider,
>     plus a fixed 31.25 MHz UNIPHY mode
>   - EPHY-RAW: 125 MHz or 312.5 MHz for the SoC-integrated Ethernet PHY
>     (EPHY), which supports up to 2.5G link speed:
>       125 MHz for 1G/100M/10M, 312.5 MHz for 2.5G
>   - Gated fixed-rate outputs: PCS 31.25 MHz, ETH0/1/2 50 MHz,
>     EPHY 50 MHz, ETH 25 MHz
>   - Fixed-rate outputs: XO 24 MHz, sleep 32 kHz
> 
> The patch series is organised as follows:
> 
>    1/12  clk: convert fixed-rate registration to devm, remove remove callback
>    2/12  dt-bindings + clock ID header for IPQ5210
>    3/12  clk-regmap-divider support for CLK_DIVIDER_* flags
>    4/12  Register a shared cmn_pll_div2 fixed-factor clock
>    5/12  NSS configurable divider clock
>    6/12  PPE configurable divider clock
>    7/12  PON reference clock with enable/disable and divider
>    8/12  EPHY-RAW 125/312.5 MHz select clock
>    9/12  clk_fixed_gate gate clock type for gated fixed-rate outputs
>   10/12  IPQ5210 output clock array and device match table entry
>   11/12  DTS node in ipq5210.dtsi
>   12/12  Update IPQ5210 xo_board to use fixed-factor-clock
> 
> Changes in v4:
>   - Convert the PON reference clock's and clk_fixed_gate's hand-rolled
>     enable/disable/is_enabled ops to the clk framework's
>     clk_enable_regmap()/clk_disable_regmap()/clk_is_enabled_regmap()
>     helpers.
>   - Convert the EPHY-RAW clock's registration and ops from the
>     CMN-PLL-specific struct clk_cmn_pll to struct clk_regmap and
>     devm_clk_register_regmap(),
>   - Drop the comment above the cmn_pll_div2 fixed-factor clock
>     registration call; the call itself is self-explanatory.
>   - Sort the ref_48mhz_clk node alphabetically by label.
>   - Collect the Reviewed-by tags.
> - Link to v3: https://patch.msgid.link/20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com
> 
> Changes in v3:
>   - Drop the new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag per review
>     feedback; add a dedicated patch registering a shared cmn_pll_div2
>     fixed-factor clock (this /2 stage exists on every supported SoC's
>     CMN PLL block, so the clock is registered unconditionally (Only
>     IPQ5210's output clocks currently parent on it). Reparent every
>     IPQ5210 output clock except the plain fixed-rate xo-24mhz/
>     sleep-32khz taps (NSS, PPE, PON, EPHY-RAW, and the gated fixed-rate
>     clocks) onto it, using the existing CLK_DIVIDER_ONE_BASED flag for
>     NSS/PPE. Same output rates throughout; more accurately models the
>     hardware's real shared /2 stage.
>   - Remove PON's now-redundant internal /2 math to match, and rename its
>     pon_refclk-suffixed identifiers to pon_clk for consistency with the
>     other per-clock-type helpers.
>   - Reword the clk-regmap-divider flags patch to cite CLK_DIVIDER_ONE_BASED
>     as the motivating flag.
>   - Collect the Reviewed-by tag.
> - Link to v2: https://patch.msgid.link/20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com
> 
> Changes in v2:
>   - Introduce a new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET flag in the
>     generic clk divider framework and re-register the NSS/PPE clocks
>     as plain clk_regmap_div instances instead of hand-rolled ops.
>   - Replace the composite clk_fixed_rate + clk_gate implementation for
>     gated fixed clocks with a dedicated clk_fixed_gate type that reads/
>     modifies the shared gate register through regmap.
>   - Replace the rate/enable_bit/strcmp(name, ...) runtime inference in
>     ipq_cmn_pll_register_clks() with an explicit enum cmn_pll_clk_type
>     field, making each output clock's registration path self-describing
>     instead of implicit in its rate/name/enable_bit fields.
>   - Update the EPHY-RAW clock's determine_rate() to pick the nearest of
>     the two supported rates (125 MHz / 312.5 MHz) using the same abs_diff()
> - Link to v1: https://patch.msgid.link/20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com
> 
> ---
> Luo Jie (12):
>       clk: qcom: ipq-cmn-pll: Use devm_clk_hw_register_fixed_rate_parent_data
>       dt-bindings: clock: qcom: Add CMN PLL support for IPQ5210 SoC
>       clk: qcom: clk-regmap-divider: Support CLK_DIVIDER_* flags
>       clk: qcom: ipq-cmn-pll: Register CMN PLL /2 clock
>       clk: qcom: ipq-cmn-pll: Add NSS clock support
>       clk: qcom: ipq-cmn-pll: Add PPE clock support
>       clk: qcom: ipq-cmn-pll: Add PON reference clock support
>       clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support
>       clk: qcom: ipq-cmn-pll: Add clock gate support for fixed clocks
>       clk: qcom: ipq-cmn-pll: Add all output clocks for IPQ5210
>       arm64: dts: qcom: ipq5210: Add CMN PLL device node
>       arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock
> 
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   1 +
>  arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  22 +-
>  arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  27 +-
>  drivers/clk/qcom/clk-regmap-divider.c              |  16 +-
>  drivers/clk/qcom/clk-regmap-divider.h              |   1 +
>  drivers/clk/qcom/ipq-cmn-pll.c                     | 535 +++++++++++++++++++--
>  include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   |  30 ++
>  7 files changed, 591 insertions(+), 41 deletions(-)
> ---
> base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
> change-id: 20260724-qcom_ipq5210_cmnpll-0eb9a9615dff
> 
> Best regards,
> --  
> Luo Jie <jie.luo@oss.qualcomm.com>
> 

