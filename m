Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57150C2AC
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 18:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571700; cv=none; b=XmK+a0Mrlm16euYdOiJbSXlCWhrgJ8kMH8JiJAF/amgqSY5V6MdgJEUivpaKhG3tWTFuzaeC10RlnthHnsoMoZI+p5PKwotXk+TuyrvyV3qWJ2XmQryu7U3NnPznc1i2+7f0RfeOVx6c9bD5buQXdq+TGGq6CwoaAgiYskOsNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571700; c=relaxed/simple;
	bh=PSA30Gu2YSScCsrmEVlA0cGQSEUIUbYyS8c2ISOr6N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQhkEhcfJehsjHS7UROBJc2ybrQ3NNe25nWuNGp/0xeiBJIlH9UYYTxACWpJOaQ27LoxsG9WL3tn1BgavvoG8fAnDcDqwGeD4IQ69pc6PlOBxdZ0UJvZHMTst0fCFoIpwKquWNciaFLaimVlceOLnCCWKzwMlf+PfteBOFbg6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M0bAF7d+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlG8AQQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M0bAF7d+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlG8AQQi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZdme1879670
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 18:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jtA0Eo9d859FtFUw/2JWgY3k
	SSkkwzVmL4FautXCk04=; b=M0bAF7d+T1Jp1vpZmeagW1+h5r/Ec1QruyE9v76o
	alvaH5Ubtfr/4gNB6s59YvoruOCoFOorxEnyBHLUjv+wi+IjPQCl+ZOtZFl/I5+e
	wgR1eEqxiPfY5js+vxlPNAfCuRnMoSVOC2SJoYj1G8e2PkBrwv26Xf3ffSfiXeSL
	mGmnaO7nVjljRYMb+vlT0TcFmaxJEvyK2es+PQ25vhHODntMqTeuckpkRB02ZmsW
	Rdpdkri7axvX21fphpaxfGBU0gVa2Dk4347q3GH/YRaptG9orDO/2b5gFaJ8Tez6
	/eU6xeaXPzusNvTGKrDS2BH4dTYW8mMzQAbxB7hg2+nOvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8g9bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 18:48:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso739981085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791571695; x=1792176495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jtA0Eo9d859FtFUw/2JWgY3kSSkkwzVmL4FautXCk04=;
        b=QlG8AQQiEOMIGIyRBwAxfVQB1BARysdyLuAE0IP7y6z6u3cYsgkEdL6vK6C5Sotffz
         ondLs5jChgKu9nQP2Y8ukf0CX/PP76rNRt8jEj0aoDkTV8Cl4Ic0bimOsTLvUTwDzkeo
         AFqcnlPz+TbkgVezEY0ZWIctl+frR7VpN6i8C7sy7MUfei7Q02DSvTHYh60zYwPVT3V3
         t38bMv6WMXD8VfuIdyHr8CC6PP4ZQ4A5ajvZV9D8RrFTLgn7f40cbSy50HNc4olTKGO3
         DxP4DYpQv+4pePWDM30RUijWBpLE1SwhXyn+3vj818mk7iJXDu+p4YPH4B5nxiW0zM/D
         jJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571695; x=1792176495;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jtA0Eo9d859FtFUw/2JWgY3kSSkkwzVmL4FautXCk04=;
        b=VftOdiHpHP0bRMhp90V9HCUpTgjW40H/aIzoGPFb9nUfxrYx8FMfvNyKc9NrPVjI/A
         yfia7287iCsaGh9jYY3c4pM9FchdMsikm7J55s/0TUL/UXYAIuYPPbJcd0xHa23nfRq4
         l870e7U6fWlis+RSI13S/ewcIwsFGI+QgULnRHCxWHWrK0MvpDDD55jg76DE4/fybXYz
         ZV2AYQIY/FRKI/GR6d1jf85vYxnKWlvAbKjFNp2n1RrC9qFeCMeg/11wGWwfPVrlDXOA
         BeXAxp0qInBDNMMoLujnJyRAmBiNUArXc8lPV3zVOnnomdb0MCZy3La/cAbjgHuzGPGA
         8q3A==
X-Forwarded-Encrypted: i=1; AKwUvBx6cnuLGCGinf1AZIlDXqOqB9ciEH/xnT8R7rvuOeUSpfBKB3Ohm9XxM+EmMdxFkde75gu8/MOBMRPte1qD@vger.kernel.org
X-Gm-Message-State: AFq9FYJu1AWY3n3xPyu4uUzb31Dx2TioY/wbGBMXx+ywzZzJAY8STlMw
	bu65qtuUI8UoWYHPl+x+Tg2SBFEpNt26vSAFq/EwN4uHJx1s/XqW0+0xoVlnIbnNY1cLlY2whdB
	uZ3oigVBJl9qqVRStXihJ1T3onAU+WZ70/5YilmKemeJkcGDFSGZFRxuxtfH4XByalyaI
X-Gm-Gg: AYBFou130YafCbM5c8GhRYMwFgX2asFwY96XTMc7rLtRfw8Xk5fziVCHUuK0IOxWPrF
	ucYl4+0kA7trZlT8tilv64noWsfSd6xI/bqrJfwbclkXwgTtQmWsCx7dnFdoD3c5dhtBLhf23ts
	S6tqkF1Mps4HWtzwcbAvgsMYt9UImPIFHj4AbuUl1dz/QH1U6pVXnlP+RZErNhTYE6aj+yapFkd
	nw9NlPa8eUuex/GT3ylMyR9su6V7lW2RUyA3KhX9fXDGRnBfIi+AE/j0bEWqxvby/5Cukx3oKJz
	pRYVx/bgg9oi9/xy6sulwKR4JLJ/sKg+eyk/Y3nKnAnh4Amg+GWAgTFRYKwmOPCg7gjlryEP+6m
	jZeRlOu5L8wPBLlg=
X-Received: by 2002:a05:620a:2912:b0:93c:c987:7f70 with SMTP id af79cd13be357-93ebd211b0amr457762085a.21.1791571695253;
        Fri, 09 Oct 2026 11:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2912:b0:93c:c987:7f70 with SMTP id af79cd13be357-93ebd211b0amr457757985a.21.1791571694622;
        Fri, 09 Oct 2026 11:48:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bbbdd75sm58588245e9.1.2026.10.09.11.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:48:13 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:48:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU
 nodes
Message-ID: <ndwyviaeqyxuoh5jbgapqumgfyli5wegmmvejurauxwsue32ma@f36ik4usw3bh>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
X-Proofpoint-GUID: 1gBJ9cvLH9mf48yGBGRHH9RJPDYyzr_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NCBTYWx0ZWRfX53V5Kc26B4k3
 Lv4xiZDZx/HzZbDvi4staPRBmeSX/xLBAUs5tr0etQKjVct3uEmNjsU/QfHzLZhKZvKAciSfFZQ
 faTkxCKed0kV/HTOLnIOXBlC/MjcnYMEDgpFxIqZy87gpYfL5EAIhNDwflPtGMTJnXEjASnZWbL
 +PSLXCslCG6mU+1v5b3sKySaQPb3kPLLy1nIqb6E7R+G4Tye/r14nmgLlg0EcojYwUSotUkAiuA
 F+vXDUbx1mzfYLnmj54pyMctuwm+twGJrtQFXqUZKGksoNn9asGJ6ERUzTsqSLpl//w2URuJwI9
 ezNvuSUQkdAIvFLyrYug1Q6KN+8igS8BE0KzdE0JdlzkoKvgd5KLID2sQJi5y3wYqmAmz5tzkec
 afR5ZG5ZjCCpcsf1APyahc2IDpt9n2fM0c9qMp6P2Y/9Ke+0jPN+e6wOwuK6N4671bRBslJKLSS
 WedQiXK0q3ZLxnEm0mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NCBTYWx0ZWRfX/TUV6bfBJRjX
 DcLLTC9bSEJPSoKRIuJGHImTjmfOqA4maHiKC5VP2zVAHsBgzvbMfrlbeZ3NHnlDFZi87vbTeVP
 2mrDuiD5Ysnlklconu/xaZOoAary9cA=
X-Proofpoint-ORIG-GUID: 1gBJ9cvLH9mf48yGBGRHH9RJPDYyzr_L
X-Authority-Analysis: v=2.4 cv=ELeTQFZC c=1 sm=1 tr=0 ts=6ac936f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nvc3KPOFl3TcXWLbZhUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090074

On 26-10-09 02:36:37, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Unlike previous Adreno SoCs, where the GMU AXI clock comes from the
> single global clock controller, Nord splits its GCC into four blocks
> (GCC, SE_GCC, NE_GCC and NW_GCC). The GPU's AXI clock,
> NW_GCC_HSCNOC_GPU_AXI_CLK, is provided by NW_GCC, so the GMU node
> references nwgcc directly.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
