Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355135475F
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 01:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790818230; cv=none; b=a9c/3oJmrVTqjd75wLE/2p68osLloTyYGeRWqJRjJFkeMV7oLdF3jZVrKpQCKY6mlPAosn2Kyd4SQtntgPhJWktITJQEdAFOXTY23DtyJYy35e+eZCMHqdpguoigePsIljriAQS7l7PbxHLTY8AIz0LBik48aNmT1BZ32rsPGq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790818230; c=relaxed/simple;
	bh=ZXgnVr8vrxSlT+suTKuGSZBoYlHrJqfLt1b0lFvpaUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA3uOeGTjl0NxStwpaozDiJM+UtQgDT3bnrFMAV6oBIWzqdX0P2ESmxgLNGRSrwk2+S3v2TG9hoZMMrCTkjrVf1otYZlIqjw8ha7PAhvMWxz9WclQdYNwyZUv3wAj+dl1+2M0A2p5DYvFjoG1PgNUcLb8n2prGNkkeh6STeQy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlohJp8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKtZc36N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlohJp8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKtZc36N"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jwVY1545704
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 01:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGwclrvkGkFDi/gd8U3LJ8vU
	MTfgL1qtLx/RYSRBDR8=; b=jlohJp8/meS2pus0/0/GbJO4igfnxXNFvB3Z1YIX
	TO+6PiYRgG1i9OjsKz7xE9w0Wge+QTakFSyR8BuA9kKknRr648JMXbF8rBVJ3Kr+
	DQ3f39iOBaPBx1pu/FGvlkDn3BHqmU/GnTCvdOKyfSrn2ew51vOKENDoakS158xX
	LD/Htc8wKX5TI2XS9RtItvyMK73U2DNtIunQja7Wu6JYA5AifxCWNbFIU3Gg2p4I
	ONUQnURYVhtAiF8j8MtKmc+Uztk6Rybqg6LaHZ/opYlrG5lZsiHDUVk/DOdD5aad
	uoM/u4y+6+a6F7HFWxOX8QuXuINGB5KfjgLcJX5FE/iBVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n22e8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:30:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1202595685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790818221; x=1791423021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=FKtZc36N5B/C0LeKDO8TRS4rGB6Q8zNNCSB+BDINbVmkTtISblZkG7uvJVnp+Unshh
         DdVPQIkoB62HKkJUo98d5pWnShtgFowWhzzcibn3OxueyjJrQWFVxygXCmbzuk6yjKPq
         xPxPdQ3KZIpVZskbTV89M9r5rhwMKuA1w1BNR1r03EbTY9ZrJ6A2Qc+UL7ovuO79+Oxe
         1er36UoBzwnsYTynkr5BgNHPAzIYOBa8e1JqNgEy25/+OdnP7y2SprKYvwpjhCiSomCC
         ui5I9YnLnNyodiWHQhBoa64mMnYAjoSHV9bmWaLB+c36tDsal0afJpcYrihINpjq6cGt
         /x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790818221; x=1791423021;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGwclrvkGkFDi/gd8U3LJ8vUMTfgL1qtLx/RYSRBDR8=;
        b=SpnG35P2blqeCpFRX2Kdb2iwfL/qScJB2X40DmIGVHEnlTz182d3Snqnei85widlvg
         LgBb2HlkKd8f+lbzLw2DZAVP+4zyNNz9g1DOj0GkhcT2nkEzYOjSnMqQ/1qrTYCA57Sp
         B5INY2I/gQkTCYErZKezJqsxx3lqXVLdQb/e/o5TUdiSpKQblMM8+zXVy32U7C9Zvl8i
         oyymcG2qWKOrMBWBen5KqawLkaOUYsA7aTEQNAHIrvKbfMCdelx5JJuqtUf7CK6ZTbAn
         x71VrNyvVSVcNdIJMtZ/rGhzMMkY2h3Mlkc/nqhh/szL1IZalygqIRPhIzIU6vFWg+x4
         XZ9g==
X-Forwarded-Encrypted: i=1; AKwUvBzh9JD/7qvwrCKA0eRzUvGcjGr9xBkYJ7kCCpeDE9hTV2iQysTAGd1dtFuVxo2WdIeYEaxw2TUKrzaH/fii@vger.kernel.org
X-Gm-Message-State: AFuF++kcIiy/q7WpFOnFoXvn49hycpoj51QxmBo090FXnb5R+0mf+U5I
	zd9k1qvsgS6FdpTKvSOp9RMlKDZs/LX9CHNXDiM4qkHeVvB0MsuYiJJdH5u1vKVr1/3BD3k/pL2
	T8YSAm0OJupn1MCPPXfTm7sd/z3+JabvYzbPJZcHDHymnJZgF3ioGg5X4ko0vqXiLs08A
X-Gm-Gg: AYBFou3VUxYsWzl3jURbY4ySp8LXniV6gwA9cjtlzPrRy/epMFYKBXIq0BTbDVEVdRZ
	DkVj2TB7nU30Yjb+0Kd3HsAf1w9MBwnRPpskVBjAHVplXnqN2b2nDyYw51dplW/5ZUuw0OKTlOY
	I9k76DTFl5m3pO2Mm0tIjYbOd3E4K7e6fYXN+KpiySX1yrk+hg2hXEU0oa+0Ms/2PmalVisxD4L
	BkAEVpBYVTzyKwTHdTfoMRLO05L+3UBG5K5VAlKcBSLpj0TUhWi+BTE7VVsWGT13IgWZD0njDy6
	bkyTJ61tfKHvHiBsWffAYCGkjUTNq7lXu6c4yfNos2b06iIh8rjUHq44+q2PjJI2S7XpV1yPwZ8
	DRCTOJZ/iTn8NDCdFBID8WS60p8ETYTk8qFgpNTEEV7lFr4i2YwQBIX82m5S4ukytnnpPdiBjug
	bub7l1C4Hw4INz
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539015185a.18.1790818221079;
        Wed, 30 Sep 2026 18:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:440c:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ca9779e92mr539010885a.18.1790818220566;
        Wed, 30 Sep 2026 18:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba44059a94sm170385e87.6.2026.09.30.18.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:30:19 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 01/17] dt-bindings: phy: qcom,edp-phy: Document Nord eDP
 PHY
Message-ID: <vj37teqcz2gzmwjjn2exvadtby5vugpsloa46laktwiyv6yjlz@px7ludjbiub5>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-1-e25c073cf1b6@oss.qualcomm.com>
 <evvgtf6b46zqpolvybz6xfklakgoyv2llnvawrblgz6np7viza@gtmqflkwwmgk>
 <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5a4abe4-17a4-4ee3-a213-a9e136e31648@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abdb7ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vJekXL2k7A3vZJSvyLMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfX9w26Gne/tZ0P
 R/ENLTykMTLybtuWtj7ngTDZD7BOz7UbzQi2qqgNWnnc5niM4SGSkCJiE+etSDfy0J3wV7DvQlQ
 UK3CNyq+1b5l83pr5XgJLDfenka2DyU=
X-Proofpoint-GUID: -35gTfWnod4YcqD4fo9GOZCaieLvzPMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNSBTYWx0ZWRfXw35E3LahN0p4
 Q/qb5wiBWn9LBFFQfd7d1sLPIgemTMK9l1+TTeFpUk5zH+x0IbAXb1YijK9ZpQ165D7xcMjFg78
 xdqi93l0hEcikPpMAybIMqNIJ7/ml4GvqEudqiB8yO1GFk92mjj2sefH+x5j+yvP1wHAmZ3G6yS
 dwaLVOeigAhqSWcIdftyf2SLEiKixJX+wDg8JAJ/32eA0S1UIw9+2YCPjutiY4DMoP4L7EdNs2R
 6bohYeOJ8++NT+8CdCnbhsz+P34yx4JDOQ5tmm07bHrDlfRJ6ZDsuOtA5H7R99pZj67ZISctm9p
 FJLDQiCMaFVEx9mvmFkYSRRqxoCtIA6fJqSGbN5cVeVrleRzSTj6VgqKXLG1jWiuLc5z1DysQDf
 CExEJtE6otc/EOjynVMrHmvSL7HdiXg+iAdOwx1sA8jQO+BA4Bh9yiGCq0Abs3dup/9n+mjZoFc
 tGMl0bjWZuy/v6lGNng==
X-Proofpoint-ORIG-GUID: -35gTfWnod4YcqD4fo9GOZCaieLvzPMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010005

On Mon, Sep 21, 2026 at 12:26:54PM +0530, Nabige Aala wrote:
> 
> On 9/14/2026 4:59 AM, Dmitry Baryshkov wrote:
> > On Fri, Sep 11, 2026 at 09:06:32PM +0530, Nabige Aala wrote:
> > > From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > 
> > > Add the compatible for the eDP PHY found on the Qualcomm Nord SoC.
> > > 
> > > Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > Does it use ref clock?
> 
> Yes, it is using the ref clock.
> 
> [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem nodes - Shawn
> Guo <https://lore.kernel.org/all/20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com/>

Then why did you not add it to the list of the compatibles requiring the
ref clock?

> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > index 0bf8bf4f66ac..91d7a5c8e19a 100644
> > > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > > @@ -19,6 +19,7 @@ properties:
> > >       oneOf:
> > >         - enum:
> > >             - qcom,glymur-dp-phy
> > > +          - qcom,nord-dp-phy
> > >             - qcom,sa8775p-edp-phy
> > >             - qcom,sc7280-edp-phy
> > >             - qcom,sc8180x-edp-phy
> > > 
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry
