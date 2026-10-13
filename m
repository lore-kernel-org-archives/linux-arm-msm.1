Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B13932E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791860953; cv=none; b=taso7pcYRjHKR6zaCTeXzOEIGSB8yolN+VPeKDvNRgzWp8zaMbEro8ChyvTn0ut84bzMwXXZAvf5OTF3C3OlZOMQvQkDHb6cJ48M9+VbbimwKTLFFZQekIgGm5WeMQCOOC5m6oa9KvD8+Yat0rI/tWUZ+nmHwzeootor8oYbTFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791860953; c=relaxed/simple;
	bh=2DaEZecYbqzdkows3wlJT/6rHLkdPtQeCKBsVysIRa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfbT7TY+BtALspORZqEvqBnYjuH7+cwlzcN5gmeJHVkymB1IAyJXyqPFDajXXfSeZWO6a81qNHk/B7KDYQnijg8QbSFbiC7wm8UHe0oPEZJSvmbhgGeqlnBnnAnehCFOcGhUqdLS1Uf76MC7tDxUZ9MeaivJdosNSpxWN57cals=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ONMnEjSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnyhHrjL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONMnEjSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnyhHrjL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D218dt3223771
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ROHOyfkd+2sJ+PYo6ghhU3d
	bvpfdOhK3QHU5GiExA8=; b=ONMnEjSdkFsg84qr8BwvQxnBWKmAH3jxBFV5+zi2
	I3OBTb2gsYOCkOLQsza4JVDkYskdHF30qLwAb/hI0/CqzEJL3csUFxrhYEuNRPDG
	HgoUrx1HXk7ZMVnZPYwmaF65tVltAKC4TfuUwzAcFai9QdTuI6MaPEiGsXxhVSN5
	zz00O28Ui/H8kuhETuzmALvIJc3Z5e73qRpcbLYTxuP+y50YaaqJ5z/JOXspGa4Y
	YFYqnfZ37y36/8sHn4nYRD8acy6lKxbbRMXl7xPoRRv3RVhcA99qNjf79Kc8lxKD
	D05k0SZMRBA5TsO5IY85KYCOwCuIUlXA6HGfzSC+HVYe0g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kv80v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:09:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-149e8e8ad71so2631635c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 20:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791860945; x=1792465745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ROHOyfkd+2sJ+PYo6ghhU3dbvpfdOhK3QHU5GiExA8=;
        b=TnyhHrjL8Ugndz5knosCKFfIEdMCpHImqUFhIWqkwxW5rFGPK9drcfEE3hyYtAP8PK
         wCMVxy8MfJ3zWPVtzKWAWtI+Awgms76+IBE84AA3rLgt2DbmnnZyY267hAXKfk+Wg1BL
         RLvD59pvO6VFSAo0fYJj+u35yUj5R42AqzgrYsjWV15nRuQCB6zLhds2hocTFVe7sSGM
         hg54yT6H3/cvjKn/qT4Jn/UwhlKLTlH0w2VWwNxvnZriMXIDVy4RWU6vI3aEghs8/URt
         ebh/XVCo+QNOMhk33JX4JQ1iWcKhC/DM/7dpZ9rrBWJcwvTRsVlRoLHD5mvvVn5SVTfi
         gsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860945; x=1792465745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ROHOyfkd+2sJ+PYo6ghhU3dbvpfdOhK3QHU5GiExA8=;
        b=BjE6A5rUdGjJVB4hmzyZ4fo2jEAXfmnrwoFBjy3KlVwXyLXnfRkKW2Mi8TGTktD+WG
         9d0F1kwx8nHbsJ7iFbChnSFUVAzMnTji9uibwuOxSlf+2h6Oxo4ki02jMzIwFK0LCWrI
         NbEI2j2cPzTL8pBalq5UYM4hYiZauWusOMxSczwT4EuODH0f5eGwUS+qt9TBrVW0nJkN
         MOPDiWyM3wr80XmDtMyLZAKavIFznwydA8UbOmGywmAv5gcpROO6EWc87qAmXuNTmvWu
         FGJ40p0fcZW0HzO/0q9xrB6bY7MkpRf0x/Mm5Zp66MO/bH4aLt7DVzflsp5QrvOB2+2a
         4KGA==
X-Forwarded-Encrypted: i=1; AKwUvByuWsgRYmydTuCi7KV1K8vtWTi45h71MN16jjDBj6VfyeOn4hAnKOY1xt2HAagTjVShh9OIfj4ARurb2Q7l@vger.kernel.org
X-Gm-Message-State: AFq9FYL9PL5ULORsLU+frmS0Ki7tDXEtG9RF5Lx2hbjmFHhECh2MVD7a
	/UCNViBQf9H98joFmNj0JMq6qWbD4lxIaXx9suVpxc2dmAkUEsRY/f6vOb4HkRh0CeF6Ol9eDB1
	aPne9sbOxSRfg8JwhabA5PT1cusVWGDlOvJk/AjiOipTJbbmeN/7CWm8K6vHhoMmE6Yeb
X-Gm-Gg: AYBFou2rpnSwZsNzNhKCWzI1kgY5qkKQ12fa/AJ7UPMTnMoW2cQ5U3mA1vFWyG7bD8g
	I4/BEEbdOrtGhG9XJwO1QrLEYj51+gPZefb4UL6Sk88TJWCNRL02qoF8FxM3gvbDfB9L0ForRkZ
	ni5srRzAV6QkEia4M4yHRQm34BfKxMI5A4jN9T7YjjphTXAiVDwBa4rtqmXHMlold2ZXoVipeRx
	/zXcpePkYqOPKMk7dGej2tGsEcRjqAMRYMHd+UBzENh2HNLUdqgjUDJU+il3RbcqdrO5pHGKg1s
	6Wr2ALW54RqZBv+nLz5NPCfYFBs+eBGwfpN+anG9PGBv/IMGDLOdAPHXPyqmvgrfWHxqsxMVKWC
	iMiSkAlqem7HckL/kYb5dhNlXf7j6CSKVmyIaZeazTQ==
X-Received: by 2002:a05:701b:4202:10b0:143:50a0:56be with SMTP id a92af1059eb24-16a5fc910e2mr14712393c88.14.1791860944861;
        Mon, 12 Oct 2026 20:09:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4202:10b0:143:50a0:56be with SMTP id a92af1059eb24-16a5fc910e2mr14712344c88.14.1791860944031;
        Mon, 12 Oct 2026 20:09:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d202sm37060349eec.13.2026.10.12.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:09:03 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:08:56 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock
 enabled via critical CBCR
Message-ID: <as2gyLK95eXM0WgM@QCOM-aGQu4IUr3Y>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxMiBTYWx0ZWRfXzaRFl7gMofBe
 sM/HTKmJAm2Q8/zyJQsFv6LLvSFYSD4ppNFV0y72XWLoY9SFUR1SB5qYc6cSlgqSQ2IEqKMQNfN
 v+6106Iocbk7a925e3rCGzuVJCDJxfnjbPjh9/VIzGvsfBUPV3vFtcRPTb0kv6DsTpLGKki0rfq
 DVgCfAoYKiNhP2HmtzNO/vj6AT/HtHKS/teCSig2l4yR2+fRnJTnC3NVmzABz9zJcQ36kgtLWo2
 RnjYKG1VmwLxXLM2Q+DNYjZMRr5mTdxjRlrj9WtQi18aoTLQye9Yr7c1XaF7TPNiXJoLctgpsvc
 n0L2faHlWPPQfK0RIuHNLrw4yyw0K1HxWqmJ/dHc4bfK0A3PnzqNFelQAA+Qgg7WP5xLi7uaZzN
 TwwyidtLlmTJsjWONg1TYb8CITJ91rRQYbtG84iOgsdI0j4jeijBANHrRL6Zbwuv6v5Vhcxmx5s
 sIhXchSEm6q5iqsJUXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxMiBTYWx0ZWRfX+4vqQI1sncZl
 vrMZQdv4AS+9ozYNxDdTLO8lr6ucoS5Pc0H9orMv724cMOl61/bs49WBxu6Gzazuj26w9w8RAA2
 u9TV1nsiGZzGfPXLerPiq9D9D3QVPJA=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acda0d1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=yUjrznqbfBiV5e72-0MA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: -pcGGafNND_OY3VA40cnBRQhRIrW4wMY
X-Proofpoint-ORIG-GUID: -pcGGafNND_OY3VA40cnBRQhRIrW4wMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130012

On Fri, Jul 24, 2026 at 04:25:06PM +0530, Taniya Das wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.

Hi Taniya,

Could you share a bit more information why this is the case? I do not
seem to get any problem when testing without this change.

Shawn

> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
> index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
> --- a/drivers/clk/qcom/negcc-nord.c
> +++ b/drivers/clk/qcom/negcc-nord.c
> @@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
>  	},
>  };
>  
> -static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
> -	.halt_reg = 0x34004,
> -	.halt_check = BRANCH_HALT_VOTED,
> -	.hwcg_reg = 0x34004,
> -	.hwcg_bit = 1,
> -	.clkr = {
> -		.enable_reg = 0x34004,
> -		.enable_mask = BIT(0),
> -		.hw.init = &(const struct clk_init_data) {
> -			.name = "ne_gcc_gpu_2_cfg_clk",
> -			.ops = &clk_branch2_ops,
> -		},
> -	},
> -};
> -
>  static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
>  	.halt_check = BRANCH_HALT_DELAY,
>  	.clkr = {
> @@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
>  	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
>  	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
>  	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
> -	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
>  	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
>  	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
>  	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
> @@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
>  	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
>  }
>  
> +static const u32 ne_gcc_nord_critical_cbcrs[] = {
> +	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
> +};
> +
>  static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
>  	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
>  	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
>  	.clk_regs_configure = clk_nord_regs_configure,
> +	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
>  };
>  
>  static const struct qcom_cc_desc ne_gcc_nord_desc = {
> 
> -- 
> 2.34.1
> 
> 
