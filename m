Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF2B38F64E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 06:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737710; cv=none; b=j38AX8WRMpXAQ2kmtcMeB56iAJDRCe7n3uZpWXoz4+iL7L8BWClc6oW8kYP3R6w3N/fc1sthyThcAmtRF0lzB/1vc+EC79CBrQW4iskD5+AS0quyrdME6gnssmUNnE7jyKBCIwxwGzQVmIO77e+sLIimz/exbWpsfsXL6sLbrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737710; c=relaxed/simple;
	bh=lV0FNc2jGbA4z0aPBrbq09G9Arq65dq7bjEYXqJ5/+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVXHVIiXXcvGXsk0rUb+7gFcUw6iawv40EzrWzVYzAsjqjfkd5c0Nqu2bcZ+rQWvtxfiN5RbwWlD/O8Lh7HnMr52/gt8JKdgFL8C6ATv+IzO0C1w3PdPsUXgM0GrYb5zcPVVaTZH6klmS6xPiDcOWi8glVQD1g2KekWi1NHDWWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4+OJ5/c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=REYXmbVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4+OJ5/c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="REYXmbVc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736DmAS3883017
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B7h+X9G8Urq50HCuJaQ8lxLP
	AAO5dohspwHE3VjyRzs=; b=i4+OJ5/cTfBTDrvpwhUzMGxbJ3Qa2NfFGLDNfzm1
	nWw6sIHaPI0KVCgri5tJcQyoOUXrC1I/2zQ1P5TBP7HICjJuIQlcw/bwCch1RgmO
	yg4qJCSGG50ikGRtK1W9IwJsDHe1M7qXiGOM+g5aN59V658/RoOO8gSuj5YbJflp
	TRDvPfCuc14SnufVOWvVTv5rTTfOhStZ79yhJ9qIMPRP89EtzflOSC6xmhr2jYUT
	im6XaPQ2TLjnpybsGTbl7AiEVRWxGy3+IK+rXyk0hKIUp+IoKeo+Vpe4kg5u4e+R
	dbxLLWaGC4OYSvaFzSvJ/dnGE6M3iSSPl7MZxAgimIcIMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkg05g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 06:15:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so33208996d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 23:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785737706; x=1786342506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7h+X9G8Urq50HCuJaQ8lxLPAAO5dohspwHE3VjyRzs=;
        b=REYXmbVcLmZTkAMdv9xm/3pntfBrDRMekYic1fEckmMW8Ce7dkC86gU0azxdCym0AD
         wjpS86177Q0YuWwpyEI6GXe6WV25oFQaycfsQwGBHJ2PdE4P/GRVqNTG8sJeDnpo3e/b
         /BUFTovQjc7pJ5/+bRn1wZMZulD/lqqGGiaqKhOFEXM8taYgVkvbIn8qvI4JOzOYO0v1
         UHSJWh6a5FXCu/ht7e1FnIxAbI3ZPcbC7YNHXUqmvLJzHMH+/fuuGJyPlrGfiV9ZPu+7
         btVhegBbU4lV1dTj+0LrSECz4g3OgZkNWZmISr3qivtkQr3ECVji/LcpMLBQfRVgA4gW
         fk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785737706; x=1786342506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7h+X9G8Urq50HCuJaQ8lxLPAAO5dohspwHE3VjyRzs=;
        b=h1DkGxKF/QIS60itcd9FfzJWXx8NdG00YHS/aZhtPBYwHFlb6xsvwPZ75u6zNABidN
         aLApPP97R1dgRK9LqyefsX00EiuA26Dp0/EQA3jyR71shJnGsYyo7Mdjp1zoKn3F9/Qk
         gR7UAyrqhwrbs5V/5QrIvFTw3NyAhR8jv+kZ0cgFS9p7zxlPgc0YL1YdcknTnjA/AcH8
         KkX42wxrOiyDkv+KzSqbbAziPhnNnvdGJthH1bajkoWBTsBd1O4mrKlxYKpUKyjF7OHu
         R8ncFqlXT//aNkGcLg1wHShDD+EN5XOzqixydtKwPFvPr0dA8bTNyTiCwhW+K4uQB1Ol
         f0iw==
X-Forwarded-Encrypted: i=1; AHgh+RoW35oKHU2+Pff2w+OloEHBPTS3bhA0jVn1TcMJ27uNIDyBvl9be8e42qR2quvkO1Gu6TLeh4fhINruvb6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyP/xlkhvAd9sj9h13t7pULTvvksPz2B9fFVapxt++Vr87zskkg
	Uxzs5m2RZX3n/Mc6DyaQW1mm3NeDdbk37opnfsaCpC1P5Pe/LnvfH97I6mIE98ZKkMqGKqSMDRO
	2HKXnnabzaY+GY3xOUzcrcDeTXIMppVxtcEAmArn2DfLdNEJ7BSTVE3tXXQRUJvpt2R+W
X-Gm-Gg: AR+sD12fF7KWM3S1NYvMkooBl2JZ7RQp4f1FFLI/kRoJHMCwVE/q+wO0bTh/vPoXKWY
	aHCn0rIKIhTtfIcmpvOp0NQz9lWYDP35+4EJc0DDeZUawUAzvcYYXPnbi1M0AzQQaEx5jsB4rV5
	DZP6fUDyXdI21VMYd/Kow/ljbAjYt4Ll2207ZzVKRdfG6SP8ms4eMBhbHa/OPc/R4pIcm+2Rj7w
	Kzo0ysjjXk61ZT7Ls+GtvoQ8LamE1hkLEZaM2jiIOzYFguL4XGFIroLhwHKDH21/sA7YHaVbhc3
	HqQImtrdy4uV+cz9yvzwMCvEM5ojQ4VBu5UNEDAtVrqzqEJy2Pu7xXkftT2+yY0CTgzg/uLdthY
	aw2Hbv9XVh1BSQ48bQu6/dGfT13Mp7sgkRN6593wfT67Nac+gTlVXXT5InRGRGHU=
X-Received: by 2002:a05:620a:4104:b0:92e:2c3a:a15c with SMTP id af79cd13be357-934a0943968mr1814477985a.29.1785737706185;
        Sun, 02 Aug 2026 23:15:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4104:b0:92e:2c3a:a15c with SMTP id af79cd13be357-934a0943968mr1814470385a.29.1785737705658;
        Sun, 02 Aug 2026 23:15:05 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c19f881sm594920985a.29.2026.08.02.23.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:15:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:14:58 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
Message-ID: <anAx4kqb4PwEImeE@YUANJIEY2.ap.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-2-yuanjie.yang@oss.qualcomm.com>
 <20260730-alchemical-phoenix-of-excitement-fff9bc@quoll>
 <amsfSzgMArno9zRH@YUANJIEY2.ap.qualcomm.com>
 <2eb33f53-2320-40dc-8098-79fc4f48af8e@kernel.org>
 <28fb7750-bd46-4f3f-a3ba-7cc1fb88b235@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28fb7750-bd46-4f3f-a3ba-7cc1fb88b235@kernel.org>
X-Proofpoint-GUID: 20IANcqWN7UEnZZPYw5V0uXxEbNnwouD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA1MyBTYWx0ZWRfX95n0fgnMGJWm
 lT8bjexAQBZzmd+ZTP1zBigWWFLPpzO/Wv30i15fCp8jSchFp/MDrN+L5qoiyU7GDARzloQE7Av
 nX9niDU1r9ndt6T1aAbk2S7sLhFWKH7li/NNzpKQAjeawjiag2JcNqlVwV6iJzbGZyk3wgNWp0D
 xOV9DqzmwRn5suHw6qi4qvgcEIzD2ZdqRWesU6/hDO1ck9o3qeFxkclOET7io0AEzoJfoJeLxhu
 dwTUYNtpDn83SvkZjNNbUlz6kxTP8g1HlVgYzAoQsurT2MSGTGfxty9rhjldAocgmLdWJG+8tD8
 iak4FpElUnDjiPQjR/6nu+pHe1nzCVqjlrEioKD82a+kOM8gg8kCM9Cb+or/qRLTtuGR/vow17v
 q3RfD1jaG7OsdYgmS9njsaumozLc7QhsZsAhdAPPRffQa6zcgVy2E3ZqF4cJdr2NnnSfP1awgqm
 Pvyx38V17ApZLKRDIvw==
X-Proofpoint-ORIG-GUID: 20IANcqWN7UEnZZPYw5V0uXxEbNnwouD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA1MyBTYWx0ZWRfX8WP1Z9D1z/0y
 no6tFfG++S8M2Z3T+b6UOJJsNRjVO82MucTAE2Xc+0JUrompgo9cGWbYhWQhj5cTKYdFd4Rfomp
 gkhOK7cQ1mIqAFDwSd6ERqGpSVJ+QQg=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a7031ea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=m8ToADvmAAAA:8 a=HtLsr6L4JtS92wG4dZoA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Q0W1slMkcave-rSCEGgY:22
 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030053

On Thu, Jul 30, 2026 at 12:23:56PM +0200, Krzysztof Kozlowski wrote:
> On 30/07/2026 12:08, Krzysztof Kozlowski wrote:
> > On 30/07/2026 11:54, yuanjiey wrote:
> >> On Thu, Jul 30, 2026 at 08:51:40AM +0200, Krzysztof Kozlowski wrote:
> >>> On Mon, Jul 27, 2026 at 03:07:16PM +0800, Yuanjie Yang wrote:
> >>>> Document the device tree binding for the HAMOA-IOT-COME board based on
> >>>> the Qualcomm X1E80100 SoC.
> >>>>
> >>>> The platform consists of a system-on-module (SoM) mounted on a carrier
> >>>> board. The SoM integrates the core system functionality, including a
> >>>> SiP containing the X1E80100 SoC and its supporting components.
> >>>>
> >>>> The COME SiP hardware is effectively the same as the SoM used on the
> >>>
> >>> Effectively the same or the same? I googled for "hamoa iot come" and it
> >>> gives me zero results. Provide some URLs describing both.
> >> The same.
> >>
> >>
> >> Here is pdf about the "hamoa iot come" SiP and SoM
> >> link: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
> >>
> >> The preliminary figure provides a complete overview of architecture, including the SiP, SoM.
> >>
> >> In Block Diagram
> >> hamoa come Qualcomm X-Elite SiP Module is the SoM on haoma evk.
> > 
> > I see on that PDF "SOM-6820", not "Hamoa IoT Come".
> > 
> > I have an impression that all this and previous bindings and DTs did not
> > match reality at all. Or did not match how upstream works with such
> > hardware.
> > 
> 
> Adding more: I did ask in the past to properly represent SoM and
> carriers. I pointed to other examples how this is done correctly. I did
> look now inside and found absolutely no reference of actual product
> called "Hamoa IoT" or "Purwa IoT". For sure there is no "Hamoa IoT Come"
> SoM (sometimes COMe appears).

I check the hamoa iot evk board page:
https://docs.qualcomm.com/doc/80-77183-262/topic/Getting-started.html#get-familiar
and 
purwa iot evk board page:
https://docs.qualcomm.com/doc/80-80022-297/80-80022-297_REV_AC_Qualcomm_IQ-X_Series_Evaluation_Kit_-_Linux_Bringup_guide.pdf

And I see below info:

Dragonwing IQ-X7xxx EVK components:
The kit includes the following components:
Dragonwing IQ-X7xxx EVK mainboard
"System in package (SiP) "

I think the current naming of hamoa-iot-som.dtsi and purwa-iot-som.dtsi in the
Linux device tree is incorrect. They should be renamed to hamoa-iot-sip.dtsi
and purwa-iot-sip.dtsi.

hamoa-iot-som.dtsi --> hamoa-iot-sip.dtsi
purwa-iot-som.dtsi --> purwa-iot-sip.dtsi

> Look, this is a SoM:
> https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> 
> And you can find corresponding bindings and DTS in tree.
> 
> I refuse to accept more of this fake products trying to imitate well
> known industry standards in their own way and effectively pushing some
> downstream crap, just because that's how we do it in downstream.
> 
> Unless you can present us with such product details matching what you
> send, I will be NAK-ing these and future patches like that.

Thanks for your tips:

I check hamoa come som page:
https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
and come board page:
https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b

So I should rename come binding with real devices name:
binding should be:

      - items:
          - enum:
              - hamoa-som6820-db5830.dts
          - const: hamoa-som6820.dtsi
          - const: qcom,hamoa-iot-sip
          - const: qcom,x1e80100


Thanks,
Yuanjie

> Best regards,
> Krzysztof
