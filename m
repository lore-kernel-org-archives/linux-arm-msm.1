Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDFD247280
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784169364; cv=none; b=klg8nr+OJ5RO4xp60d8wSOLVQ4hq2KF4Kw52BrMxNK97MScDnkqZAzvJXCQcAlpaCjVG36noDPlsqd39xmVcmOzkGZOzhP4cLpjk0PLIk5M8XLTzNKPXHur1HHHp6mT5gHnbKOIXzo2zCGcs9BZcnRSvGfcz6/98b1E9ul6LgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784169364; c=relaxed/simple;
	bh=h1UZyikz0JDoM1JObJv4IyOGznkDwWbgrD2GEUT7r14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzpN/3UzeSuZ2ITifmWkm5tLaJdLEBPSEDKAag27dNGsdMAXbQLDc3vLwbabdTH+5hM/lg7gumAHF9p4D7Kymxa6bPrKuAoSOrRoREfcw7UxfztWIo7kN6Ub4hfimGLp+if3ih9KbqjDJJORBKrRnJB6ekauxMVnZzaPkoe8qAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIyNH0o/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/+j91MH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIyNH0o/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/+j91MH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XWi92241523
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g05Nqs0a+DO3y0LDbu2S/rRe
	I308lTNH3/Hk03QO/Pg=; b=eIyNH0o/a4myHg3bP/nbm19i2mgZUwFhTPhCQT1m
	8kuhmlCX763vDqt1xE2rLsIvrSOPE6fRWv4JlFn8xVzfLWhqmxgSKqkgqEgPm9FC
	zMdaKjVkn2g+H0JLV5XKj5PjybgqcqMlt2FuTCD2Lv+eBE9CWtHFkAuD2KEMmNHg
	eFWFfynIZ5UKG8+XZvfima8ViXnnPdmlw4X7rnoWMxl7zFEkO3+BQx6lZLeIMaMQ
	Z935+HUeTVTNPxg9ZIM0CkBxZQz0lIgyOAPtmmZO6Q5Iehj5TQnS7JYhqqn5yOY9
	nx6MQ7XhXBFjzlcEZZB8RXSlaOGWYo/4bSw/mzu+ZQ/UOg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe68wv28u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 02:36:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2735682a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 19:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784169360; x=1784774160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g05Nqs0a+DO3y0LDbu2S/rReI308lTNH3/Hk03QO/Pg=;
        b=E/+j91MHD5jp6lDdmbMlXaryyDFubCYuCRArzTvPzqVbjz46s++JDPfTyMO9QemfTi
         jmz8txmTKC4+oGvzFw1KvkauZrsDihDiAmZzyNDtqJzy9RURS+4KZmZCTZixdT/ce05D
         tjWfc64+4vCGRJ69/48onC6HG6qt+DkDN26XjEqrDsivZeHaCTi36pEUhrsice9a8ZmU
         3qMo0yneREfA0GVkaXryXLE5kLdYZgOAYwliZZfiAkmokvQfiicIvZTVAGX4kKelXpW6
         2K/vdVOi6V0WcaS6+NvzkbNvJQUMBq8/3AMYDSVzmPghj3o12WEgEXrFvKLEAzt8GdJ/
         G9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169360; x=1784774160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g05Nqs0a+DO3y0LDbu2S/rReI308lTNH3/Hk03QO/Pg=;
        b=LPN+CIZkbGomxCuC7CXppY1ZBTYRtIXYjKRQxgV2fGCd0EdIQJZjjdbTAy1VIt5nES
         hbmFIXb3N5CiVh+4S+wm7ZN8tnzhxGDay6jRHgTBLQhlMsAqSzOEZzzBG41MjJeIT3tB
         8fUgExrnsxVKDRCLnXY1YWTTW0m6ACjHyHoTVerfLqB7eBsNusIjrUHT8Py2wTirLVIp
         T03ekpHl9t/dD1Glj+CpWBMWhqbft6Uq1EhFPGTI69uvU84GtbaotR9/589Vz6yASoCY
         GVATtkgvHRL+lvwL6OkcOYHi/8pneLFetsmPAyQJjS0Ji8akcbnUuCQmmg2fpGONR593
         5j6w==
X-Forwarded-Encrypted: i=1; AHgh+Rpy2BNPjCzLi/9Kttf5W/PAIkfLXt/mYM3178JDgL46oMAmrkseabu5DPr9RrkPBpk6flb1E8atVp7cq+1x@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf4K/9sXyubbeVQQs9u7TJzmH6mr1tj4O6qvyrzifK7BzOA/4w
	KZXmy7ERruOYHlUebvfJxcpSckvySXm0kuqU9fm4S8OcT00Np/IpmadDXOjaVBi5II5ZI3xXMqk
	zzhF5boLw+90cygLmSPD2Qj2EYvJwSUeTLqaqYrj2da/nFgiKSZFai8K23+WW87GmztO7
X-Gm-Gg: AfdE7cnq+3eSSZ01TSJhryXezkMbAr6zKMIM0DrhXfEBup7QL39aaSZpVrWJ+s76RQQ
	msB8GEVSNGjBhww3rO0/Kg/teRgXD98JKcKOVzNz2YZkzC3tmadg3ZBd+rSUrtQEHBHaRlPOrOo
	eKku9zJGFuqa2OOvN4HUGyuW+gb3wVITgDO0ig125WYA7BsOAyvn6EJDG8SVI3A7fufuzQ+MeSq
	98gB2HikIZryPxT/dI8HpMinmQc3M+wk5dMj6VHqqZNTGpZ6p07ljldD0zuNgzS6+xsw+uh7deE
	mNuXveB09Hm5q7oM8lx7+NnFWoz3FJQXeXtDQ/6ltwpHTwfq9Fnd9RL/vXFhpKA/KmTyla9I2Jj
	L9v2IDj54zqAAhQb93H4HNX6fUHFd6jq+LC6t1ccC6Z8EEK56AA==
X-Received: by 2002:a05:6a21:4cca:b0:3b4:8a40:85ed with SMTP id adf61e73a8af0-3c11077686bmr20992757637.7.1784169360277;
        Wed, 15 Jul 2026 19:36:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cca:b0:3b4:8a40:85ed with SMTP id adf61e73a8af0-3c11077686bmr20992729637.7.1784169359836;
        Wed, 15 Jul 2026 19:35:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd42a155bsm5829661c88.7.2026.07.15.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:35:59 -0700 (PDT)
Date: Wed, 15 Jul 2026 19:35:57 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alhDjZ0gJZq_7G6z@hu-petche-lv.qualcomm.com>
References: <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
 <algVe_XD5xpB_w2c@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <algVe_XD5xpB_w2c@vbox>
X-Proofpoint-ORIG-GUID: vkPPfHzap30IYvNG9z7Xc350ylgnCBS5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyMyBTYWx0ZWRfX97pk7sQo8TZB
 e+CEKlKr+PCd7XnSjvl3Tfar1n5knOyC2CHEnqDPcW8/KFhWjP8ZP+RtAKgvhZ3m4apQBtshE1H
 scQQYMLkrGD8JUWdV8ArQcuPxnT6yH4C+qyD5J4XfqnMt1apj+Yt9RdcjdvD8JP0oEiHPl2PIZB
 uSnlBxuzbbwiYATs288QnfT/eBdboRPspXQuupIalamTn6HFG90xm4/jLcPfvrKLxAu067r0Ckq
 2z/Znm9iH/EDYJEIYqAbFeqg0GMUCcT7LrUIKMqkqcBNP2gaIR2ml6v3i1YQWJ3lITw7CYfckfT
 6xlCj4d0RO8iyntZiGn3/ePbhITLt1drITb3PholEcPBY3LCK76gTkytF+xzDMm9AUAiGqXm20N
 PF1x3sqD79TCkGbKOXly/sBnT1WrsdLv4epRWzGU3HSpoQ73aTEZq/tvrYIWvaY+vmGuBIdqWMV
 wsf9nX8qiEDcF8NFFig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyMyBTYWx0ZWRfX5nUup3opjZgV
 95F2im1IKAonc7UoftdgGaTNEawr9MfIctzEnxXjKmHKHE9RUsG8tFCAZ6fLZI0gGfct0oIo+QR
 KIbaOxtw9W+t912jEpo2qi7GwsxbCJ8=
X-Authority-Analysis: v=2.4 cv=LbgMLDfi c=1 sm=1 tr=0 ts=6a584391 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ozYoIpVpmoLeJXfkQ_kA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: vkPPfHzap30IYvNG9z7Xc350ylgnCBS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160023

On 26-07-16 00:09:47, Thinh Nguyen wrote:
> > 
> > Only the new user for adding phy_type="eusb2" at dts needs to check the
> > controller logic, and this is what the user needs to do that check the
> > new added device tree property logic at the driver.
> 
> To clarify, are you suggesting to introduce a new phy_type property to
> indicate phy type? If so, that sounds similar to qcom,has-eusb2-phy but
> more generic. Also, where do you plan to define it (dwc3 or phy node)?
> 

No, I meant just adding new entry at below usbphy_modes array, that's the
easier way. At the current code at of.c, it indeed mixes description of
the phy interface (between controller and phy) and phy type, the array
names phy interface, and dt property names "phy_type".

diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
index 1ab134f45d67..5cbf17d493ad 100644
--- a/drivers/usb/phy/of.c
+++ b/drivers/usb/phy/of.c
@@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
 	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
 	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
 	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
+	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
 };

line34: err = of_property_read_string(np, "phy_type", &phy_type);

In fact, HSIC is not the interface between controller and PHY, it is
after UTMI(+) or ULPI, and similar with eUSB2.

The API of_usb_get_phy_mode is mainly used by controller driver
to know what kinds of PHY it is connected, and do corresponding
configuration, the configuration may not limit to interface between
controller and PHY. Do you agree we just take "phy mode" and
"phy type" are same thing, and delete "INTERFACE" in this file
and add "eusb2" as a new "phy_type"?
	
> 
> If you mean defining a new PHY_TYPE_EUSB2 constant in
> include/dt-bindings/phy/phy.h, the glue driver needs to parse the
> phandle args, and the eusb2 bindings would also need to change the
> number of #phy-cells. That's a bigger change.
> 

No. Like you said, it is a bigger change.

-- 

Thanks,
Peter Chen
