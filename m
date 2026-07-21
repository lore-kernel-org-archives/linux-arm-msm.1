Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136A46AA8B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648069; cv=none; b=Xz2wjjnSmKhQF47xN4sWY9mDrUlg0OhZEhDM+3StvCQvAmaImvUYa3RvrG4xJ1MZYmFHhz0mycxmoDCQ/TWYYU7OfalCjB5tpCMJWDd5X4ePqFlBevUIn8E0+CQL4EQL8bL8GT3xNCB2N1roiwLyo4lgImoDrk4xkoL/liWFcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648069; c=relaxed/simple;
	bh=SSDwmoH8aO/T5vcH+Su9lRQk5+0ags4vNm66vIKFtjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzL3MAM2ma24xubXVAGcXS1a3QpevM8YH3GmCtZaHbKtdqsWGiVyNPkTd3DkRJAhjWMXBFyHvPorPiKbFToldkLm84zEZOIN4m+iO7sKzMUVH8LFLr7SfobWgOeEJ4xX6Ic0wOacBhF/1hLrGUWpL1s3HcWqc6hyF3bV7ihvPCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNG7ah/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5JsGMXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNG7ah/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V5JsGMXH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgBcM1971533
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=; b=hNG7ah/TaGf9ziEh
	qGVvDCv2rZz6g/bodDa0Xo4NX6tegHA7A56sgpjVHjX6ke+1plQo2zSJKfgY9ogv
	6SzCVytpWULsM2TRqI1wkeIhEAoc7xTZH/r2DTTqBYZLe7gPCcas/3f/zf893+wW
	fb+DV/H1XmcKrE8TGCv6yiHQra1ounN+Baf4hxAEPTJh1BAmV0TVaWxGz9TAZ9AY
	Mb13hwV9fSJpp6OH0mbjVi7EhwS2b/08Ww56C9dQvrHq+0+yjwehvcLjXGsjSn3V
	clwKPO7CeAKvCApLcSx5j7vh1WXfrPwrI4vQ3stiAkj3Hh3v7tmbCtquAX/6hrnR
	c1DG1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6861n4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:34:27 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9772b15323eso44977241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648066; x=1785252866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=;
        b=V5JsGMXHy0/tf/VSNrFjDBqZ/vEfWvH6aFSxfeVjbpbI/IwIbbkMLdbqELogr25898
         FEhIUM0KM3obFKdc4RIYGeM8UA5Qbl4YxEe4FU+bhqovXmUv7uemdw6oPqskRF0RsDB7
         RVBvotiH56A8Xh4Hp1Ev+Y0ET0gZNSPQrCvY7lyRUTNYa6e71GvnJuxiy90gnElwDBfC
         yBM4+2deubQxHkBp/TNV9UilxnuYLL5nDlfBIwSUzGsvqPBGcXidzEInLE1B4WnRPOAF
         xE0gHSK4P/fkVG+pmEvMK5bOzEiHFtX5XISAu3l2wjRJv3hZNND/HtRqyLYFvtLI22Qa
         MwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648066; x=1785252866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A2YN+DkUwl8UO0kVxHBASjeYjrLfZa3Zv4QVyBQOQg=;
        b=Ie0S+zd2OQmDXs4RSdSGijlEW1xlxszKKTWXLi/VFojqPSVRrVrgruBIMdQDM/M50f
         fwYvTIc7ZSjeC0ygjrG/rPD8gS/HjGTyek5NftD+Fd5n2gG/l1GmN3MdCgZuo7cT5Xky
         YsKq9H5Ur9gWVGMt8Le0AkJtS4X/aUXNDeLNnzmpkfwgj25/FInaPfg2j1ns3IauUgaR
         vRUA7zAvSrcghb8e22XXgOYWD9q7UiV4G0xLk5nYT17u6ecSRl1cOSqvA53n6Pf6A466
         l+uP1sC4QdOLlkX9zfjkod77wzYHh9iQ09B6TmvNmKzxo0Ot75ZM6tIENuMEB4yZ/br3
         n89w==
X-Gm-Message-State: AOJu0YyEQb9JsbH/N02FrwrVY77DmuD+J9O53V6M/dIEEcoD9fCJXDKS
	4oiKF1K5v+wkZzH93FORAlmO4gSubjobawYopaUUxObK1ZaatsipKZdqSjuWFtpA+MslSG0bH9c
	c4l00K+vbvXabpw3s7aJWY2MZWPqy0pLUURibTT3aj+iOFzpU5zLhjADSwsS9KqshBhuC
X-Gm-Gg: AR+sD12Fb782tU5K6Bk7rV5tyjfiv7OyYhHQvrUdoHP5UlYeY6mChsuk63xQR1MPvs3
	GlUQ8/tg+D1jsfi7bBojZFpsVqr3cPOfJ2lprgejSdanXFQPCVri2vnEW9np6hPwIpxn0qBxdYT
	g5WACLemZCeGjDtkMjrxLLOLcV7Tt4v2fbCDtw8sqAencNJCsqLjuavVts/AvHTtjVX4QyEXoux
	eMpx5HvycRMvM0IZ5ag1QZTqostn56Rqll1IcgrmHIX9r2xJtGxxbihRbsoxK2kzzy91XCFSrtN
	0e5uX7t3FUi7g5wzC33XBTM5EmMr++rlJLQ1uy7AQXvM/eGYEqIQtXpTLug9UrTIHGVIDam2vXf
	XspwAmbDX0t7rK5fQ/DhSQWo4
X-Received: by 2002:a05:6102:54a2:b0:739:97bf:9180 with SMTP id ada2fe7eead31-7475378d8aemr2311823137.8.1784648066490;
        Tue, 21 Jul 2026 08:34:26 -0700 (PDT)
X-Received: by 2002:a05:6102:54a2:b0:739:97bf:9180 with SMTP id ada2fe7eead31-7475378d8aemr2311819137.8.1784648066074;
        Tue, 21 Jul 2026 08:34:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1735f20279sm595979366b.53.2026.07.21.08.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:34:24 -0700 (PDT)
Message-ID: <e4a7f143-de14-4f8d-b652-3842b7367bf6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq5210: Add nodes for multiple
 peripherals
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
 <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-1-b060b68e0256@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfXyjbVEV/fYOw2
 6ZgbolGl1Bp9YHo6PJPNxQMYSlFTiYgXGKOAz1zYRGhvtIrc1s5rSw+l5hQjdy562HHWT4paZ0h
 m9BRvWCFUDcOlh+uLtFp1KaQ8Gq0PyE=
X-Proofpoint-ORIG-GUID: 0svySTyc99UIBrPAdHjaOulW7bubeAEK
X-Proofpoint-GUID: 0svySTyc99UIBrPAdHjaOulW7bubeAEK
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f9183 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HyoFnBF52fLbQ83PcHYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NCBTYWx0ZWRfX0BxufcMSiXWj
 hSQQhFOvymJK04jXAH14syMwdZceuIO/6hUH8Nhev9GzByGIzBIga8g2gTsOkHfXszRucuNDMi2
 +qq4AtXjSYQ98ZjVV5pEfV1Ui8WCnXeo13jdj87Vx4GqRdkbsgP3CBteoQa20kU/dwdIuSbeZNm
 QRw89tvtzXB6sGBmdyw/1j0akuxrBcW5SWjIjuahn/aP9FC4BhcQMaOQKZLedutY0EdtZ6GUYdH
 mUCnbVSBESfdqYRONnCEzsBb5EclXPXMtUjj0isUQajvq45SKUBMSg80scJcVdkIZ99VPvpnCGY
 +2pabJuqdb/cPaxzwKa7+pmuQXD7WtJMwPOMXtQEraFMfzZ2qEaD87z0V85wj8eGKYwvjVJfQvv
 u8lsiLe88gyOTeE6yWXCyMeHuA0zzxenbdUWXxfUNZMWEKAdeZBm78VyJ4bEJ9aRv2V+8G8+MYs
 UMuZqyv/yMcketR8a+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210164

On 7/15/26 9:11 AM, Varadarajan Narayanan wrote:
> Describe common IPQ5210 SoC peripherals in the base DTSI so board DTS files
> can enable the hardware they use.
> 
> Add nodes for USB, PCIe, QPIC NAND/BAM, QFPROM, TSENS and thermal zones.
> Also describe the CPU OPP table and CPU cooling cells needed for CPU
> frequency scaling and thermal throttling.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

[...]

> +			phys = <&qusb_phy_0>,
> +			       <&ssphy_0>;
> +			phy-names = "usb2-phy",
> +				    "usb3-phy";
> +
> +			resets = <&gcc GCC_USB_BCR>;
> +
> +			tx-fifo-resize;
> +			snps,is-utmi-l1-suspend;
> +			snps,hird-threshold = /bits/ 8 <0x0>;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +
> +			dr_mode = "host";

Is it host-only at the platform level?

[...]

> +	thermal_zones: thermal-zones {
> +		ethphy-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;

Drop delays = 0, it's the default value

[...]

> +			cooling-maps {
> +				map0 {
> +					trip = <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device = <&cpu0 3 3>,
> +							 <&cpu1 3 3>,
> +							 <&cpu2 3 3>,
> +							 <&cpu3 3 3>;

I think THERMAL_NO_LIMIT is generally better.

Konrad
