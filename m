Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478441;
	b=C/EFd9jAZJR2itw1T5Pt0m8r1mjgKquXumh/nLEWxljz/1qjCJiKOR9P2JighQDJGCHu
	 g1bfHPHVu3lH1nEC6mI629TGyRpH+/AQQkpjMwouGQLr6ySbJSjSzPeW9ubLWpKqg/QyP
	 teiMyJq0USCgKzGexQEIYjBQaTp0/yhu/72gq6yZ0sP04EbCVYdbSAEH3hAcKG1f8M0Xn
	 bs9b20zbJhsN1az7E4yr9qhJNWBCTGPrVpM9kzKvHW7vPAbvO50S4lmlhsg5/kh/9UCrg
	 b92fyln+eSnudqBfdLIxQvjSG9xavXKBB7QlyK+V59/jzct1DhGINh2o0u1lufUbq3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
	b=hKtjDn/U1qtU9vMKNYIo9ihMvy9dbrunKNH3gbEjHew2TpKTtcfFtrjkIj1es+OZQG9s
	 biscqY/myZRqbcwEinhPtUR8HhmKiCvmVMpIWws2WhF151xcr08hZws2zBhUpBHY3i+yw
	 stO/2a7sUzvrmLK4R8oEm7leRVuKEee+kI40TtSaEVDGJhqTE9sZHtHlnYyvToLsTjbqN
	 QBo706HE1tV31qfvOSveKrElno3csqDFnBbKRG2H76XNjvK+AOf5ADsJ0smHxOop9ZIGx
	 BgihcY5Ab0BWvs61KFsTpvDfO/psC/eoQHB84CAdUG0u35nqXrP46PY66caiZZ6U3sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIIzl0sG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6s9FZBR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC74606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NIIzl0sG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T6s9FZBR
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJG0CF3944197
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U5YmrFJ9xFF8sJ7me68N1z1N
	hFM5GxKEjaWMihJs3s8=; b=NIIzl0sGSoeqHRvyEzKaGiGSnfBuMhyy48qA5DvE
	FplqLBB6x5XJu+B1+L7nf5shPuAWoT+BpaARqQeqZ/69clzof8BdvDpll9OscVdj
	qz4JSNXcYjUaChxpju62SeHroIxim4zAqoySWCTeT2Cp6Ul4R9d0JAdHiSHikD/b
	CM/pWKpS+keNlsKu9WIkLTHb1nr242axLtGmt4GPB7HqVSoWnscysGDsSrCVUcfd
	JQfjmi76sbygprrMeCQreWmXlJo4OoVQjrGgzj2BpBQ3LVrgfq459DWJEvhvCFqI
	JhzsGzH2+qGgmVVkccXePEKxgqbIi0kwbUOeTMuIqOAvqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61ftaur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 20:27:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so454337085a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793478439; x=1794083239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
        b=T6s9FZBRnnmqOW7bFwSmLFmd+AnFLx1DNTjdlcPHYKAZoUMBu4/7iNDRuTbRD2WHi8
         aA67D0Zo9iyJ2oj4U5dT8HsNi5F5AaybXXS7fPJNKdb5GFS9TKCuBYIlenjglpI1iZ+0
         lVYnlOF57Yx+8qeMqJIzM3zuycUEi1QnzLRNpZ/sDQ+dBdnNSpuJFGegxk4ZqOK2UPS8
         XNGFADYAzpMy3xUtBXb/RzcRryQki7zCQO0xUvOpnSeoCQlc5ejwC0/zxIwvNF5hPhqD
         cbKutWKrhBRJnY0YMAW0amipzmIMYQxXgm0izDzt5Jm/Rm1lgWGOb6L/9ZppNt3xDpc5
         BZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793478439; x=1794083239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5YmrFJ9xFF8sJ7me68N1z1NhFM5GxKEjaWMihJs3s8=;
        b=xrpF8ejMW/m+edaGbcWL2MMUaSPpk9NkYrdt56gHAPKUcv5J0rAVKa6irQVX0K3NL2
         WG0dH+U17u2C5UKoPXxvmzMXQD/vynzF+lN87Cydca+SXK2IZSj/8gFDOybA4ZBErtio
         u+aTXGwAVUNE89uQHXCRp2Uwf5wrGiIDeKxZAlM+yUyjZW0pkwwPGzzeusjl1DWhfxhW
         7UC/S0oKH5UADCkd6cMwFDucbEaxF5DZkWjSOaSEPXbrf0Or09RTrMCqIh9v75hUxLpx
         hpiAqzzruzuFH0UVOooAmZxPBXnuWU8XNAZLWMJCPlSCAwPzvg7GizfQHjf4BMltQ7yq
         1twQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYEiutl7DOFdxvWp+AM6o3zwXCOqBwxJ0UAkfWcXFy6E1+qmqVigcV7kl/zIS+w5BTSW1ivJhsC2HaTtQX@vger.kernel.org
X-Gm-Message-State: AFq9FYLUvs644N1r/7/5CjolGYWiKsiFSERYWzZ1haP/H7dZpN3dfswA
	2zjfcMIY/huu1HXjVRQhIIBgg7om7O1YRlKtldt4dcfeCNk2qrcw5GaWFvgyNBwf4LQQ7j5dym3
	c1hqlv+tMJk0Ux2utKPp+6reF20BahZbS18sWpfukWZ7VjaDQ8/U2K+qh7R5GcXQHYGpt
X-Gm-Gg: AYBFou212WIXaAenEXw7VQ6JbPPf6B8aHsg3ye30/qcGpwJqNoxZFjOZdiUvEBqR0OS
	8fcYv4EUuqt+ZWI6vZH0Np6sRmmcyR+L1HVUDa+XXICJHafzuCwX2md0JeKzPAqm+HMLTS0t1kU
	EVrmbrtRb3WkJ23RKUkCBrIlHKOG4RJrT4GfzNir99tvS8cHK6Bt3m8g4nytX4lyz8UC9bJUTly
	QLhVOSKUBXOUMiaKfLQM9u4H0T/CpPky3AZWkS47oHGpfUTqbBdqUUYLO1tpE86EyX6k/zr31/y
	2TP6OGGGWclxrvCLFDUksYGiZoOHTQmsvTlhJyrRyE/Qfe6V2gjD8tAfvJta2teUAJZRvirIEFK
	d7Ym9JpTuR0KMuzxdMl3jlH4fFWFpzDG9wKDfN5NcegyjSW5fNz0merFne3aAm/ic1ntIIK/VTh
	yn1YVOaPefEb3kMeQbIIk+6n9PXTNSBzoOVgl037+aQg2TcmGgDfiCifL0piF5rA==
X-Received: by 2002:a05:620a:28c5:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-944214dce98mr1001816085a.1.1793478439346;
        Sat, 31 Oct 2026 13:27:19 -0700 (PDT)
X-Received: by 2002:a05:620a:28c5:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-944214dce98mr1001813485a.1.1793478438875;
        Sat, 31 Oct 2026 13:27:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072d19csm750618e87.40.2026.10.31.13.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:27:16 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:27:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dsi: add per-SoC bonded command-path config
Message-ID: <pql25o7nhpmdbwkprsu5b3xurusxmnht3p3xb3425ubdkxnzdy@wguqdarh7h2a>
References: <20261031150305.1107572-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261031150305.1107572-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261031150305.1107572-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX4zd3w9p4XCD6
 6zoTj0kRHjKRuIdy4EYVfp4CoBhj6l5rChKIAI+Xco1nrL8myEdnOAO052WXXXnAWgEuCyNThHT
 WIN3IB9cFd4PZowqhRkjARr64wpgqak=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae64f28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=luF8A-hlZe_ITdDpm1sA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Baj3O5zymYCuf5eqk6JA3YmVAugFPS0d
X-Proofpoint-ORIG-GUID: Baj3O5zymYCuf5eqk6JA3YmVAugFPS0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MSBTYWx0ZWRfX+nI2/eCw9Rwb
 u40P+xLfUPsmvZOa9p4eDWe76tZXRvCsTzH+nxae0DaXLTYE3jnNfd01S7EiCRPeUVNOKTtTNpa
 suildZnhrbAFkO2dS6THwDoa3Mzrpa0O+qH7x4wFpipXiAEc5JbYaQtRLJ5XravMpPazDXmb+Yg
 WVrI7Oe6HiXRyJYF87r3hYQPRUcvUHsIm+F/vFH0jWIheu3i8fqbAbJjMAzUqPR5b3YOh+5WZQi
 +solHDcX/xGoqxj5mIgFfgaJOcaY06nep1e5vmkRasHIHHiq/mWtKEg6J9mB5yo0HOEUVUI3C0/
 6pjmuKfe2wXwnNgB9G86tmWvzOH6c6sqIXIAyvzqjOtgeQ1cQs0+DKMoftDyL2TA4ofS4c8AA2b
 YL7dNS35XOQk8PLJafXVSJ2o15kEAH4dtO5p+G4roqhndIQh2gjrTo5ldxFRPDkeiZdUkn16nJA
 YAGYjrAKyl1X8THHqrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310081

On Sat, Oct 31, 2026 at 11:03:02PM +0800, Qianhui Xu wrote:
> The bonded command path carried its constants inline: the error-mask bits
> in dsi_cmd_error_prepare()/dsi_cmd_error_cleanup(), the CMD_DMA_CTRL bits
> staged before a broadcast and the peer poll budget. Those are controller
> facts, so they belong in the existing per-SoC table next to the regulator
> and bus-clock data rather than in the driver body.

Do they differ from platform to platform?

> 
> Add struct msm_dsi_bonded_cfg and hang it off struct msm_dsi_config.
> SM8750 reports DSI 6G v2.9, which selects the sm8650 cfg entry, so the
> bonded data is attached there with values copied verbatim from the
> current code. Use remains gated on the sm8750 compatible, so behaviour is
> unchanged.

What happens on the other platforms?

> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 22 +++++++++++++++-------
>  3 files changed, 63 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index da3fe68244..640ebe8244 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "dsi_cfg.h"
> +#include "dsi.xml.h"
>  
>  static const char * const dsi_v2_bus_clk_names[] = {
>  	"core_mmss", "iface", "bus",
> @@ -194,6 +195,24 @@ static const struct regulator_bulk_data sm8650_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 16600 },	/* 1.2 V */
>  };
>  
> +/*
> + * Bonded command-path data. Values are copied verbatim from the vendor-derived
> + * in-tree code; the SM8750 compatible check in dsi_host.c/dsi_manager.c still
> + * gates every use until the master link moves into this table as well.
> + * TODO(doc): err_clear_bits/err_cleanup_bits touch bits that dsi.xml does not
> + * describe (see reports/b5-per-soc-cfg-design-20261027.md, RFC-SCOPE R1).
> + */
> +static const struct msm_dsi_bonded_cfg sm8750_dsi_bonded_cfg = {
> +	.master_link_id = DSI_0,
> +	.cmd_dma_ctrl = DSI_CMD_DMA_CTRL_BROADCAST_EN |
> +			DSI_CMD_DMA_CTRL_FROM_FRAME_BUFFER,
> +	.err_clear_bits = 0x001f0200,
> +	.err_cleanup_bits = 0x44440400,
> +	.poll_timeout_us = 5000,	/* 500 polls, 10 us apart */
> +	.needs_link_clk_bump = true,
> +	.needs_sw_reset = true,
> +};
> +
>  static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	.io_offset = DSI_6G_REG_SHIFT,
>  	.regulator_data = sm8650_dsi_regulators,
> @@ -203,6 +222,13 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	.io_start = {
>  		{ 0xae94000, 0xae96000 },
>  	},
> +	/*
> +	 * SM8750 reports DSI 6G v2.9, i.e. it selects this very table entry, so
> +	 * the bonded data has to hang off it. Its use is still gated on the
> +	 * "qcom,sm8750-dsi-ctrl" compatible, so an actual SM8650 keeps taking
> +	 * the regular command path.
> +	 */

Huh?

> +	.bonded = &sm8750_dsi_bonded_cfg,

If it's a sm8650 struct all the fields should be sm8650 too.

>  };
>  
>  static const struct msm_dsi_config kaanapali_dsi_cfg = {

-- 
With best wishes
Dmitry
