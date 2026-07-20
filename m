Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC03D395AD4
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518616; cv=none; b=GJc4vG9WR0jyDmeVbT6HhQbgWfFlt+hXOacbXueG2kVqjoItT96dyehbta9s7BXsSw+BuyHEAN4vSsFu6yuLDMCC0U1C1qccA4qnbVFOi31weEQDpAUGYDducYrLz2TztgyIGhFqmHg46WZfOzDkEXXCG65DnBIysJirpAEWfPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518616; c=relaxed/simple;
	bh=xLv/aWu330K++NYCqDc0UJZBLbxTXiIuOvcNUMdDkJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wm0/cNTsisD2bN2KC8qt7zgq2HnTw1qfy7GCyNX5yQXVvrdOszuwukT7qOi3VbxEQ5ITtAV+ENzygvik7sStxgM0sO7nZTveeC9zY9zUAfXwgptrYMKCJe9HDeDsw9SOCOTrL8YkFIF4Mp9GVByHHdc5e+Maru7esF4jgHO4j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzGwnh47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eiKtUU9r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzGwnh47";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eiKtUU9r"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsZib912276
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qEKVOtSGu6v1Xnn1gJvWyAkY
	8TDzed0RUUEE6gih+W0=; b=pzGwnh47vzDCNMF0WVXWhtl3v1FY9qJz7aRZOwLe
	mRzUQrFyXT9h87KVeq8LJSptvtIVGht5FXBlQx6YcDZZ7NteUmLRCateN7OzWy52
	jGUuZZmZGMPldFLMZQMITROZFSq5KreiTOeoHxWVh1PWlOqOCeYwTra+LukFLIhL
	h/mdnx4oX+DiuG3h1kzSuh1zvpSKJR+CJtkm8UC2AZCrW86Rq6dBzaXwIyjHcVGX
	UGB/wzfeMzImAaCRyKVHTcZX7AbYup8cZm11YuGp4mLAvT0GMarfJHJ3Y9fwQlRS
	vnE3L4kNnlNgP8YLotY7FGt5oIgfJ7Bh+lFpTjcwyq4feg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af45u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:36:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca3673560so173751275ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784518612; x=1785123412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qEKVOtSGu6v1Xnn1gJvWyAkY8TDzed0RUUEE6gih+W0=;
        b=eiKtUU9rrNdrBRdsGtNahD4swc1mLG205cGUhn+u7SzSBfc3y9HFKh2aEBOUktJ4iC
         +Isu7jA7Qe29yIPKENC9K3MRiCQ/8NIcMlXYiTIDhZ36nhEDl0MWiHgSl24aUm/9aVAQ
         jdYjpaXBYBPvwqS9qpxb7HTWffuK7cp12xEhDbzj3ZwER8+KKWQ1NIGpirvXkDEvTEal
         MwUp/eYLrTm7Qo36WzaOa+Y7Iiw0/ikbauEodwZokUXEKUa0ceOYCMMkS2Hp8BO74kUB
         PjxQ7EB4K7ST2z/AwHXlww3LUjE4y6Ms1kdSngHbCWgv4z6b97l14okJq6m6yYfildS+
         VfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518612; x=1785123412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEKVOtSGu6v1Xnn1gJvWyAkY8TDzed0RUUEE6gih+W0=;
        b=H9xKPq6ePEy0q3keKkFs66miVU4Gx8mb0siZLGYqojxUJ++h8TtVXawULfT+zzneH9
         TlDdk5Kfvi8nXfOa4cWZfRQwKnpSG+UwLQeGEHXkTbyI/J2ecFdmfBP10NGAHGppbNbC
         L5z9v24rdl45LHoOl3FIRBA4IxwE/u+PBecP+HrUYjuzfUctyl7sE3WKLa/5oyvTEvCi
         6B9h9AvM8sxiKxjX1jYU66n+uVo3nLXt1nQ0Gk5cDaqUhmevkq4yLd6MXNXTDkFKovL7
         i5IwSnbMQ9+ntFs12ESNgdUWymcJDu/koLgLv3YpZIjSBWxK+mCiGBfMVsFS+TgQJ4BM
         G3Pw==
X-Forwarded-Encrypted: i=1; AHgh+RqYP8DZyCTKd9WVOHNg76DBIkt0iXj2MVzE9vnVNryZLoB9GZ9EXqd67k9ZSUTUETYuSKb69rFjkaJ9xtIK@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrF0BzE21e2U3v2HfWr83xfVwHnMzyVIu/s+CmKM59JTshQjB
	PZ/06J0k2JHhk+RGn+wrdkg8AeCVeSO+bbZ7QjKw1IPYtAx121qi5A+lVJ0oWP/FwXrTc9Bs9Ko
	sKZUZOVK6cYEH+cOwkWryC2X/2VkLBjv4x6FiHVWC/kGLD15cYsOSeNGpToBxQdeXdajS
X-Gm-Gg: AfdE7cn75ld4HFXHB5MDZkGlwF2ZF6jMD31Dh07nguRB/rHnbAQwanIEFXvZzRhMqwe
	JfbFcUduGI1x5IRqDv+yCRYxV4A1jQ/vZRRDGB1t7sbFXJxRN4t1aXLyXfsOZyNf5FiGvH+bTyx
	OE/FsNhY65s47ZDmlxzlkWp8/hEUEu8N974+vXsPlPeaVfEKqJpfsS87T7x6cFqnRyI8f4MCc1j
	eWMghkkkH5Du2H242Kh759P6HPOOEA0v7EBf8kq0hWguSTY8tDNaC/5JA673+OkT7HJgcqXjSQQ
	VIGLajauSPbHFvSqL4eHX+rUusua/oZZwEo+3GRgVj80eD6wycoZnjVrUDeMLeidgqG/SrCsspq
	tEp2FHxoF16JE1UtNnhindEVFql7+uMwFT9pWbkHJy+r0J+E=
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr13718738a91.10.1784518612420;
        Sun, 19 Jul 2026 20:36:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4a08:b0:380:9157:d6c with SMTP id 98e67ed59e1d1-38e4b41043cmr13718723a91.10.1784518611968;
        Sun, 19 Jul 2026 20:36:51 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2a48sm22658546c88.2.2026.07.19.20.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:36:51 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:36:49 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] phy: qcom: qmp-pcie: Add QMP PCIe Multi-PHY driver
Message-ID: <al2X0Yx4GeRgA6mS@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-2-4f9e87a61463@oss.qualcomm.com>
 <alqrbpi3EbvV9RnC@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqrbpi3EbvV9RnC@baldur>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX7bcJzku6EF1G
 lJziKT9qG6hAaFVPI5IQHAVgMqpWfr1c1ggZ9w386A08oOJoBQN0/NUQX3Dpq4sRVDYXSARkQBc
 nkFlKT+vMCWZNTm3XZ+gkrzHDSVlmvI=
X-Proofpoint-GUID: OV4jdQbVJyQgZgvTjLIkCsX_wdP0V4Pt
X-Proofpoint-ORIG-GUID: OV4jdQbVJyQgZgvTjLIkCsX_wdP0V4Pt
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d97d5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Y4lf73eBQ-sTD4myGQcA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNiBTYWx0ZWRfX6Otcd9TJKGmK
 /X65ycZLfCLo3pPErzeU6SiMefqE6qOrb4VtuXAw32a+hKwUgmrAcXUjgyvpkGF4x544nV40E+z
 IVO2WH9vsBIc/Qt0PZp5SWWxdWIpZUJNspagBLCZVmNo2UKwCEp6nLoFru7vMfGjDGsuylHuQIM
 retbtWYXJJrToIVkwSudo9ea73mb3N20kuk63xqNpXhlSg+gzsGyX5m7xsphm1i4urUOFWWQJ53
 IG0ztm8MHaHhWheUT2strwps2II/9RGBigQhe9XxxJtWeezPz2cBOxGjh9dpwBzFWDBqyZjpEge
 CZABHoXCQCv1oI4X/g3nzahrTJsp4h7vIPI9CR2BvrBC2Tui6JB0XcfyQvCKqk5YpdGSSPkOuYU
 jPuFXzlwGO0sSRK/x+67PQgC+q+/3Hphcebc+wdI+1IyndJoZIMMOUusKDwTeu7cTDomchXJokJ
 L8Pd9kwcRKbk4yNCTyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200036

On Fri, Jul 17, 2026 at 05:45:45PM -0500, Bjorn Andersson wrote:
> On Fri, Jul 17, 2026 at 02:58:34AM -0700, Qiang Yu wrote:
> [..]
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > new file mode 100644
> > index 000000000000..b79edf2b7d5f
> > --- /dev/null
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-multiphy.c
> > @@ -0,0 +1,770 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> No, there should not be a year in there.

Ack, will drop the year:

Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> 
> > + */
> > +
> [..]
> > +static int qmp_pcie_pd_power_on(struct qmp_pcie *qmp)
> > +{
> > +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +	int i, ret;
> > +
> > +	for (i = 0; i < cfg->num_pds; i++) {
> > +		ret = pm_runtime_get_sync(qmp->pd_devs[i]);
> 
> In the error path you will put pd_devs[0..i-1], but
> pm_runtime_get_sync() requires that you put pd_devs[i] as well.
> 
> Please use pm_runtime_resume_and_get() instead.

Okay, will switch to pm_runtime_resume_and_get() to avoid this imbalance.

- Qiang Yu
> 
> > +		if (ret < 0) {
> > +			dev_err(qmp->dev, "failed to power on %s domain\n",
> > +				cfg->pd_names[i]);
> > +			goto err_power_off;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err_power_off:
> > +	while (--i >= 0)
> > +		pm_runtime_put(qmp->pd_devs[i]);
> > +
> > +	return ret;
> > +}
> 
> Regards,
> Bjorn
