Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0439E197
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784519055; cv=none; b=r8bvMsuH7bINU7XkmrmxMtpwr14/qSUxtfEoANoBp7U+0sgYgaQtWjWzUpGMtsIsX99aGnaIs29NgJx+ZVsmpBpV6ld75QXZVOdjxvakML/RpV4HJo210lutu528taUeEGeB9LLHWWrm/WanLLZBu38QM6TqJ1Szp/hIjzx/e7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784519055; c=relaxed/simple;
	bh=9kP2oPGlSyIkkGJTjURneGoynUlG5ruJtbWzZCAiO18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkThNxXNJFDnxlRZoqRv2iL7hdWM6trMnAT8x2DGjYbn500IjOTcW8qb8KdHlM7iHf6jreGMPKCaSfNTjjhxZcewsQMMvLnGpBoVqLAleoVeQqcjEGBV+HTx0fMgO0J9AnaC2kljpg2XvHqanTIOEG7+aRu7aes98wT3XQZv4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzU8xxKM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vbv07rod; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzU8xxKM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vbv07rod"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsFnj755937
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:44:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=trT3juczJpImDbMhvopx4zts
	L1HEFUZShfNhFaITGZ4=; b=DzU8xxKMu0zPhmbZGbe0eS1ej1Hq7hQrinKlk2K9
	uzctM2Iund1xEK9pkIrr67OWy+PyuFW/KpD62SwwnZfeIjj9gsfCxSoCIYu7+aHQ
	ldN7QzqtUk4PRcxJTdK6nH4R/pcJloGdqN8Ou8wQijMNsYd+kXYiJ75flWS2W/Zn
	eqXj1A++Lkp3Ygym1ZgRC091g0leHfufKqAsqRBVUSiBs4K7Jg+2U7bhxPmjui06
	3S/+fHLZjAJWZZYet4Q6YMRpmS6nVmnZAg//S1PSQ+q9YQw1mrvw4VEs8iiBto2E
	bkpdRg/ytY22hvk8lcAqn0dqcIjsGW4Yn+x/WlTXUMxHqA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnm6tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:44:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so120625875ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784519051; x=1785123851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=trT3juczJpImDbMhvopx4ztsL1HEFUZShfNhFaITGZ4=;
        b=Vbv07rodSpT/shph+QqBP/PmphEpmIydjZwszj9u0jggMKhNdc8Iy6UtU8pMgE51BP
         +F4990YvC5DmsG8NzA9GP/L5eJwBMkL3ViFCDO9Ma738g1ZzV925jmNV7NNlT9X8x6uu
         tvMxtnvFktPaa+mUf5NCJr81m42+cJAbaWd8uv/LRdYqKExnIHRGBnzTVjQdUN7bK1P4
         cXesTgwWZ1sa8INpgpb7yYDQxn3ziJ0QsP4tzVlj+agzBaJMvk1vagqGILLl8sqec08U
         +YLbX4HZhjUd5MIuhDGwESjoWJ19WHZomAL8iq2oRpopdoH8icksQ8ZvTakwwRN5d0lm
         NOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784519051; x=1785123851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trT3juczJpImDbMhvopx4ztsL1HEFUZShfNhFaITGZ4=;
        b=KoGMMqvwXvrc6vsUyyL20HF6BkJgLC/i0fRASDbhzmCSGm3pbTn7MoWiviDdLL7Dvw
         4qmrQ4yxHGne5uF6iBTerkf13sr56X4sQC1yJLaav6BKuTmvvVGoHAAdX12mRCu8msO1
         /QgzN7faoIKwUEgE26AheLgOSmDB7XnUyH/oUo6iUgzwivcAEHyRNIvHt29aOQ2/X4yQ
         iw+PfdIS5YMI8Geknyq6Bs5IHFJnso965hID7NGMO7IEbbOlulnzi5M1IFb8eNXiNMn1
         8kyU1MAisteW6ybFI2nutHbi3FZ6iCetL3pIZBMd9mrUK/zGgZI3c6SJEZx85xUsgKkg
         Y0xQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBcay+eD9NyGMk9dHKIyTyZhGo9QIUFN2FFSCztGmJCCu17XvWkyrhnGHCOQbtIcI5RQlKDCN3pKveEES6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3awH8NVuvk8t6iG5XWOY/ftbIHhXMv+CVEK5jfxMmglkbP0bo
	SDyuJlffiypmbV7AGXMFxWHXjYlKQy4bMedYg+IbCDtke1GWPEp8IBhjFdQbIWYwyku6Xj71eZR
	tJ1V4snhYNss9oPFZhmAjQNqY927DXtsQqh9dAabqpPUpXuiiWE0/hPMTsCMmOy3ublfQ
X-Gm-Gg: AfdE7ckF2lua2VrkV8rFIFSj3x3barXnXMdtyClZCsL0Y11zyYH1P9UXCZHdXywJUxM
	a9SMQXOYfHoWlcX6F/HdZ3IDZLJwdYjn/qA7hRBi8urdhzXucvHGOb0jBuH0dCtDvaeD4Ydkjn/
	v9vrFezGHkG4oiTZXp9PLV61K7rP9HJl5ydvGy60y13J9dha48bM+yqyl3GtonHUg0kfcc+biqA
	+KEHQbYncAY7CEvBuvn7oiG2PCST+Zo5AbphsTvKKbXm8+L32OeG3Uw4yPlo+JQ/XUGFE21V7KH
	fZZW26xajbJMthFPydzLfM1BnwApBRbxAd+vG6bamqJd1kNUc6WxKtV5BDN+fxFkx1I7BFssCjo
	qqzgUqrQ5ixOq+X6B3vvtulkqsiWR3D2rP8Np1DFyUy17jyk=
X-Received: by 2002:a05:6a21:48f:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c3ad9d1bacmr12837972637.43.1784519050701;
        Sun, 19 Jul 2026 20:44:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:48f:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c3ad9d1bacmr12837940637.43.1784519050173;
        Sun, 19 Jul 2026 20:44:10 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdbd45sm31009945eec.12.2026.07.19.20.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:44:09 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:44:08 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
Message-ID: <al2ZiMcTFC6s7hby@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
 <5f20426c-d34e-4d68-ad80-d01e2fc4e33d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f20426c-d34e-4d68-ad80-d01e2fc4e33d@oss.qualcomm.com>
X-Proofpoint-GUID: 6ddIUGs6KS_GDVwJRuqAvoQew-58dA-I
X-Proofpoint-ORIG-GUID: 6ddIUGs6KS_GDVwJRuqAvoQew-58dA-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfXyJXt/VpJD0ZO
 wydM4KzMXP2O58KKgNZ66H6i3LKFiY9ab3QUXJnYs6FyPN5ZPkUbDCVbT0L8AOtkns63D75y/dj
 wlH/S9ujM2oa2i1wcDd52sEdxF5VS28p6TsnVhBiiSoG0OD7TYBQCpDmD7ag+1pEru/2Q3BFj6U
 St4r655+n2n18SLEGdhBifXB8CtpQLqv0q4jICMderHudDSZLOey1GatT/Z8LwrVo3M5BpSjive
 Osh99+fxkKoWAoXMzGPfBl4RvC29rJ+YCRHypLBa4ShSSSYt5WYPjI0osFaGxczk4NUXWQ3v5Ir
 +YpxNLbDPPngABvkqvrdTixZCcnBiAS3dbAFvoJeS/BLArnrzGYLLYQykEWLkmman7c0z5gyWFG
 5vwVTaeeJV/JP9zsbNlRh2vr9r43eNPsFyeQO5+GPr2MC+kfhTi3xuAhztH3WRJtEcKNKcdEh03
 3chzXzCaUxaAD1vxC8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfX7vnBlbI5g28p
 iOHSV4d6akmcePOZUnIF1UfgtNrzpiLxOlmZRhIGmN1eGx08KoVkaaeIwVliw3CYlqcNb0Dh1M9
 YIwR7eK+H9caSvOvysyrK/mtb5dMICs=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5d998b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Az1h_F6XyeYmpGR1YZEA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200037

On Fri, Jul 17, 2026 at 06:50:23PM +0200, Konrad Dybcio wrote:
> On 7/17/26 11:58 AM, Qiang Yu wrote:
> > Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
> > that can be bifurcated into two independent x4 links, rather than each
> > controller owning its own dedicated PHY.
> > 
> > Add a pcie3_phy node describing the shared PHY block, add the missing
> > PCIe3a controller node, and point both PCIe3a's and PCIe3b's port phys
> > at &pcie3_phy (index 0 and 1 respectively) so each controller picks up
> > its half of the bifurcated PHY. Update the GCC pipe clock parent array
> > to reference the new PHY's clock outputs instead of the placeholders.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |   8 +
> >  arch/arm64/boot/dts/qcom/glymur.dtsi     | 336 ++++++++++++++++++++++++++++++-
> 
> These changes really shouldn't be in the same commit

Ack, will split this into two patches: one for the glymur.dtsi PHY node
and GCC pipe clock changes, and a separate one for the glymur-crd.dtsi
board-specific supply wiring.

> 
> >  2 files changed, 342 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > index c12808abbfe1..e8e81bf9a6a1 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > @@ -750,6 +750,14 @@ &pcie3b {
> >  	pinctrl-names = "default";
> >  };
> >  
> > +&pcie3_phy {
> > +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> > +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> > +
> > +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> > +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> > +};
> 
> This node is disabled

Yes, it is disabled because pcie3b is not enabled by default.
See the fake pcie3b_phy be dropped

https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/

- Qiang Yu
