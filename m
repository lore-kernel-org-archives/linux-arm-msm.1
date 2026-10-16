Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C604A8FD1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160217; cv=pass; b=sqS8btjqNRYs/4Kn54QFl37OIrYzZGJtDsKX8sWYxmSBY+Flyu0pMzCmcDtFsZA3070q8Cy0WH2zobpYXnu3clY1Nf9TnIZFM1DIMX43Q9GQQfMoA+RtLHa/8CQ7RBC+I9eTFqBVe+6sNGGb6NzG80XLo6WsYXiu8Dtdb6gFIio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160217; c=relaxed/simple;
	bh=3klzoEwdmDgtgiYwzPd8wX2mLz847+bsOmduGxrInEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p2lzzut6GAmOJXGh6jYUHk2l5LM2gNu2dCPYsnCtEbyduPdKCpGGB2BGsbBmgvJ4n09uJ+a705I/L60yJT01c1qmZ3wvQZnAlNtUTNSJRjlgX9Ch72H+nxSNR3zESLSZqqOOHoQJAoCbUvkKb7vyaFWeKzyQATVg7NZJI8SecMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C1Emuyl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsbLXz5W; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C1Emuyl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsbLXz5W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5gGH1613410
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=; b=C1Emuyl7VV7tQeNc
	hflvsy3osABsc1JcCpGtvp/8KkQ2E1QkhM55GeINa6zhov/PzeC9viOB4XXMbp2N
	LHYkVkncQvai5JxENQ34qE5oZdulmWh7c0bWLmwgmJGvriaikRtQh22YDmnpp7oJ
	Vl2lYuuTbN0St4Mn5VWEgxWQiT3wKUKKKTmZIWsvxSya5o/fiVAjyJL1NO6W3VIc
	Zgv9MPwu3BpzWZdiD1bK7ILsnuc6ZrwR+1t6vi6EHc5f09Aft2o2J2LhuGpU3/KC
	UZeI4Xtksf4EaxMOUTvih9xsZxgiBQaf4jf2KmnllgfX0WwGxYwKawBZ+vvbFQLg
	KZvjQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0jgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 14:16:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso197078485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 07:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792160214; cv=none;
        d=google.com; s=arc-20260327;
        b=ZDWMi/MjHctriGdH+3bCsOkD/7KiOKBTEe7cwxxlFZLPgZEhXSbvROfPPQeYq7DyEJ
         vp9jSlGKkBi8CcdlnA+434zOud2hm0N7eFtMXvWV7eJLae5ysNhzU/uoebmXLFXvwGeO
         ZBE7VmtN4jdQK8WQTBLqrJY7poycYXe5gQSUj5jE3IRH7EV+LOfmihQUp0XU5rpftCAD
         dWm7KRi0LsO29AEAMaH4ujtuaTWhkwRXg+tCVanBlguzTE4MyRzqVHGaH+wM8q69cVfa
         LNG3wQb6qnYiwX5tdtHvPlP+Ci+GmVsKpEMbDs6+pBZgBBgQ93o9gIF8N+E6zoRMl8QT
         1npA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        fh=fvQbPzJv46t11qyxxn5RZo3d3JNkb/qHB6vgSKtYYZE=;
        b=rcyPUo2Fq2zQMDY8H1paplIYXvoY1F4aQLJypksHkvgQmaNB/uxZQaomDSWp1WRoym
         enB3owYIQ/MdGqZdmtxyA3kMPy2aqSaAM5ULCS0BUamJ8M+yhDCSe6biW2M5cPRprRn2
         1DnBDcnzHm5FnjHZdanEZWlrU9d5DpJW0/eml8fU58+EYjBXjbBjLksn7xTx9OI59pgN
         Izs7uAqmrUPP/2Ll/ygBdXTYOkSqYd0fIlpM2Fts9xN0/YKLivRK4Nw7e+e6pTwrhm4P
         0v8DTpvTypLIiJ6HnD4aIcowcV1wUeH7Bno1y1yczogTkXbm4xTad0wlAcfJ43e4oRW0
         hUhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160214; x=1792765014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        b=HsbLXz5W48nM5B6KI8wiKRqTnh0g4ER7oMBqf4uH/uJLd1fFYoBKwwnsr7jk+nDWYI
         DrSw4yu79AY+pgAZ1Dt1TY+82a9MJS4l/J4rJPkbTuwg0KW0fQi7sp0AiT3yoSSkcFBn
         YLaPDTKxXUMRswtX4y2aeS1OAwskaifPU/kxxTqVsbbtXrdXHcOPWwf4tffpuVByOsB7
         D7vmQxhJ0JJpaB8gWrCOUEbYrCLx1OUpfldUXUY0RR+ULdR8NBAvI1120B2NaNNDEe2k
         3zSOeZZhRoeGIVvpeo/9Vk5CFiecA4pIEoOpT39wbHmK3Z5uLP0Jkt/5HgBH2wuXKSIS
         zoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160214; x=1792765014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB1atSZg29gDXgN5LdUkRfrmaTO7JZmGwqn+wbyaUhU=;
        b=BKim9fLx2jZYA6Wm3DaOmAHjaNazdv7+VVtp1ZARAavEPVT8rjT/rqIkX3kAsfEkqh
         5R+tNFP577ULU8+YmDD4t6J3mll77bAqz8L6zlSgdceZgEoz9yApfZPb4lGac8usPWBp
         EqwBlqLr2YpotTNpObioAIx+E3qW3XcRAZW0VIcdEWzpNn2GMZoY7kkq3gv8ABsICSVZ
         FFQakCuuxzOncT1tj3vXg53XC/zC4EwcZBqw2ryr9mGSGlhMSrYya/I/fPrgbd3QyZ6n
         iZeX3DIhR1i1wDFfa6ykmi7q0vgD+sN7WpaO2tylDpXyZ3mCUUHEeYTMswrfZ3Jg/I4p
         TKNQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0G/rz7XuLkAMf1LGnVFToFIVHHf9Rl3XYr7mFk3Iuijb01aHXM2iCYNnazzPHgYJdkYiXOgMTx89wymxM@vger.kernel.org
X-Gm-Message-State: AFq9FYINkWQsFF1JLsqFlso13G8hIvJXE+k+OjSRF1bUmXDAKl7NCef/
	irDk8xxlfnsY+SioxydMxrWQ4P6dG5/a9JZqkIVCYZ9EgYpm6M82NhsXQ6iT4Xx6ycxv4qnFsl1
	bPE53LWY3EkMd6Nh9jVtzWL/TI2XI6hHGd+vxVz/SQiRyfQ81S9/i0vqk7hOdW/HHQ/pZ9rdNxa
	D/RCA6Az88RJmOuQhWnTq61FRgEjiX4dXsPyolR++oONU=
X-Gm-Gg: AYBFou0OplUg5OnN1iRBNpsrFgexDDzLP58+FVL929smgW3Zw9Ay3+rjBjAwVRlIpoT
	HJ7C3ufOYd/VRNl7WYK6mxILbrKiZRBOIoliGc4x6lJPxMWFq2CRb5fntu984t/9Wch11G6VX62
	aJsoH/tzcTb80Bz4piAT9TeRAZhQbgkO9nONzl6FBq5tFgVy5I94spK//U4uk4hcH60UhHAwWpJ
	HY2gR3dwBZqHu/6LCTzecSAB5mbUBoM/f0PcsOg9HEcHOr4oKpdB8MILDV4ZMqcWTHb7OxBNwwx
X-Received: by 2002:a05:620a:2550:b0:93e:6481:c8e0 with SMTP id af79cd13be357-93f17d83913mr539586285a.10.1792160214220;
        Fri, 16 Oct 2026 07:16:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:93e:6481:c8e0 with SMTP id
 af79cd13be357-93f17d83913mr539577085a.10.1792160213520; Fri, 16 Oct 2026
 07:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
In-Reply-To: <20261016-x1e-cphy-rfc-v2-1-377654253193@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 16:16:42 +0200
X-Gm-Features: AclHuK99Hd_HGOMZN5f2R6Kx3faR2NTk9mAbjl7PJ4fmgQ6YLOcNMULcCIH6CbM
Message-ID: <CAFEp6-3RN2e3-wjLoyjQfLEE4GnjhC-9SJiz4FW6GdBKewZTNg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/4] phy: Add MIPI C-PHY mode and configuration options
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: D9ND2x4FPZXZzEy9vn83ruQOz1Sg9Cmx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX0IBH8bPBJQ0X
 Rw5NtHjEaPJjG5IUJ1fENwD2pGVg32Ff1a7HjtV793iXFfC7eYkC5OWvb6pUNG4fpbR3qf4Z2dN
 qEruYFJqxAjowbKlKbearVzK3Ow1w+I=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad231d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Tql0FWbOqO6HYHnYiHkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX5/WW4EzLbPLz
 btKHSYeZ8EZeLs4XCxNEdlj+ZzbzxQ5e2e0X2whPbW6ZCBCW4jlHNoMBXUslQ/iCMXrauyp/yQl
 MA3gdhMwTI8sTGcLLsKyj9I/qgjtf3JCoLyzVMP/AOsldnQbxmkoaRrINIAbdbak7WkoXDgMGIp
 mhml/ycrBEMPZSE9c20xdamz+pzZivYe9oYLEMHMd9iSEThWzdsvu7c+EHHnjOSFn/6muLLm1gs
 6RFnOmODSdWJyBrAM/plMN8iQBMczN7hwFaF+/f9lhceyOgdRzmOWH67TYqYi0/IzCLiNmBUDJV
 KktCZRe9aaCESQVO3cL4eojSL88XnRroRDPoT71jHqErZ/KxFejniGpTwMNbZynKK3Z9JS/ncbZ
 pw+ZyiUv9HA71lTf0Wi0hf7Uyt4dsK/rLCw49J2qMbUxzvDHCMkUI7YXSK6n+7xHCsQ76tdWUJD
 SzYhfsHw0E0Rk9bOoNw==
X-Proofpoint-ORIG-GUID: D9ND2x4FPZXZzEy9vn83ruQOz1Sg9Cmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

On Fri, Oct 16, 2026 at 12:57=E2=80=AFPM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> The generic PHY framework has a mode and configuration options for MIPI
> D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
> that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
> phy_configure_opts_mipi_cphy. The options are the two values a receiver
> knows: the symbol rate on each trio and the number of trios.
>
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>  include/linux/phy/phy.h           |  5 +++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mi=
pi-cphy.h
> new file mode 100644
> index 000000000..ef6af61de
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy.
> + */
> +struct phy_configure_opts_mipi_cphy {
> +       /**
> +        * @symbol_rate:
> +        *
> +        * Symbol rate on each trio, in symbols per second.
> +        */
> +       unsigned long long      symbol_rate;
> +
> +       /**
> +        * @trios:
> +        *
> +        * Number of active trios.
> +        */
> +       unsigned char           trios;
> +};
> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb4..f12337834 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>  #include <linux/phy/phy-dp.h>
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  #include <linux/phy/phy-thunderbolt.h>
>
> @@ -42,6 +43,7 @@ enum phy_mode {
>         PHY_MODE_PCIE,
>         PHY_MODE_ETHERNET,
>         PHY_MODE_MIPI_DPHY,
> +       PHY_MODE_MIPI_CPHY,
>         PHY_MODE_SATA,
>         PHY_MODE_LVDS,
>         PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>   *
>   * @mipi_dphy: Configuration set applicable for phys supporting
>   *             the MIPI_DPHY phy mode.
> + * @mipi_cphy: Configuration set applicable for phys supporting
> + *             the MIPI_CPHY phy mode.
>   * @dp:                Configuration set applicable for phys supporting
>   *             the DisplayPort protocol.
>   * @lvds:      Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>   */
>  union phy_configure_opts {
>         struct phy_configure_opts_mipi_dphy     mipi_dphy;
> +       struct phy_configure_opts_mipi_cphy     mipi_cphy;
>         struct phy_configure_opts_dp            dp;
>         struct phy_configure_opts_lvds          lvds;
>         struct phy_configure_opts_hdmi          hdmi;
>
> --
> 2.53.0
>
>
