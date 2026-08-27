Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A240F755
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830687; cv=none; b=EWsV5kyXTEt2tlEgH7T7djahAp5JlvHCvr6HdUpKDMQyFQfVaEt/DRPBg7x2JgQXgahaziriIXIunAiQi4704jXbhnLscnAzm7urzsfanjfaP1t1NemDc2DidatHCmqMpVF1bqiE1/uX0vTBawzyu6q5/EDnfY2N6o+mqC4lBFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830687; c=relaxed/simple;
	bh=DHfB6fF3Y9dl4O2MOokHQ847AmSCvn8npv2+J6NNIAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pff+0db000Qdyg3IOhdLKm5tq46B2U1Sl/WTC2NS/atTkdXHBx8aChcScr9Itpc9K0kFrGks+mHtQJVG4TOqUxKttaudySKdqQ1GKH9QlvqUxuqhD1WRVqj5qihRPy9AdGBS4fprIpStCBoXRRxP+08BQLeo034JMSNOcxbvv/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRPONmCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YgbWslCl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRPONmCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgbWslCl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RBEEhq3912787
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tafzctTQEvoGgo7QvUnxycO7
	XFdE9SlO42qbjkPBxKI=; b=XRPONmCpollYKHQFdleOUtCNA22Cu/jiFvQ/FZGg
	sgY3PAvS0rNi/rbBq10whMOIXF5Qx8juG8vnFR/2y6ZvQrClm46GzEFM+CiopIo1
	y9WwonPOTF9t/P9Lsde+N92FbkzWDd7VGEqX3msHx+NbNdtHOL/nk6J3iA5U87FJ
	ARMTm88n84pTjbxjh/aH0puQ3Qbw6xCwsiRzwp857Iz7BtPHpI6JkUXdKyhGoxeB
	LH+UO6xRgeZN0Cn2iJYNIWtXtrtP2NJMjxq/DFo54bVpc+bMG3CdlmLm+QMh5wJ/
	UbRcMHMlibt0PxADg3jVk4HoznmzWt+9glFvfdlG9ZGbqg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fg2ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 11:38:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90cd14f82c8so9586986d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787830684; x=1788435484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tafzctTQEvoGgo7QvUnxycO7XFdE9SlO42qbjkPBxKI=;
        b=YgbWslClXCijrDQHNTZj8GIPN5WCWyDZjH7/uMkZqr7EZOiGwGbtt82LujkO/pP3+V
         7PkKoqlfFFPF10y85MFBXA8NhqzReHW+3sQ666IA1ZD2sXggyhMIcGNdHLpZ/El03Gmn
         /uFOvOezY7Ank3HQ8aiLopI0tFZzvHeIrCVuSQbW4vPxj0PEaPVB4N3pR1oNpG5X+6PX
         0qs+CA8PWZYhjLmg91g1lBwQlvB6iQC6Yk778mbZBikfTFs4VNZck4+Oaf6xU8TBt5Cv
         tbYmBGUKwunQviKfT1FkHig3OnAL96oCfOGeP2ndQ2pS7vu6JyOi2Ei30mHDxFu1+4ix
         /UNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787830684; x=1788435484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tafzctTQEvoGgo7QvUnxycO7XFdE9SlO42qbjkPBxKI=;
        b=Aaxkxlk2/niReGc9vl3duJ/Hj0qheqOfxtfvhztJRx++s6aytU4NPiRSxBMrvttm0y
         luMmbiEn3LKmHnyTQVs06/JnFrqapNi/iM9FNw8zwcqdv5QL9afLG1bWp9ufqkSe47op
         ZFsqInkWwbWwF6gq+BosfAA7UWzj468BZCYDmhLLwuQeqElpGrnK/795IzE0feiceBaH
         h1e6QG9oejFkobxaYx6LxoCPI9LX5F/PLEmQHeAa9aZbDobN1Q6F7f4ECl+W0WNF4cq5
         Bkkfm2pf1duIgZEhSLnikOAeGPD723DQ8GIOdcHa5HoB7tY+0cZsYXmWrfNtlFK0xC/9
         f7Rw==
X-Forwarded-Encrypted: i=1; AHgh+RpZZXx4dk0W9MI3lienDb0WnuAoBTmMNa+B+HsNA/WHCitD6Dc09EzSFTCQEi2/6b9j8MDh8cRWnxCii9F5@vger.kernel.org
X-Gm-Message-State: AFuF++kTUD25tHbdyQEiVVy3o0KVsufnC5u/fSaf/yqiP2hPLcqJj+g6
	oQIDtL2IH9F8Isy+a/U7+CV0gJxTpzZgu/l10pxwhghdafO+vwMPJs2zeqRBZZjguWQaTuHh9LM
	+65+xP+q5icfNvkteCgjXh9iY7gFUp34hZXD1or5s7cAmf3a/LQES3A2WJWqMcDfvCQhi
X-Gm-Gg: AR+sD10gfqrqVjL11Oj8MVDpRatuzT4lO/bmkCcXiQ/EL1/M1bYa/jLxseu9HLS3skG
	U2HUekDpz4kbz5/rzuI5W8mZzpMjqmECzkB1ec8D5tUiDKQ1mb/LLKbE0tWG2Lg1Gr29zDZquUd
	Wwn06SvxPHZ/0stBXyZQ2AOpSF1JwO/80LyC6hD54Ddle6p0q4vba+Zx8TKsIiA0G2iKzjvMEpV
	ni/wweSqVswhemtsrMtd5zwM2x2MVBTi9v4l9dV4jCbh/73H30vXuXgQVQ6MPTGEZ0NeoCURo/b
	ERgsrPnklmuycMRpA8Ha+dNl5Zs+cWEEUw0JZRodpeiV7eXS11PXbQoocrc2IkWjM+QWI7x5VW6
	KlkO9Qqcu0B1gjQ==
X-Received: by 2002:a05:622a:8e0a:b0:52f:a0b3:bcb2 with SMTP id d75a77b69052e-52fa0b42525mr67264851cf.35.1787830683546;
        Thu, 27 Aug 2026 04:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:8e0a:b0:52f:a0b3:bcb2 with SMTP id d75a77b69052e-52fa0b42525mr67264261cf.35.1787830683020;
        Thu, 27 Aug 2026 04:38:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279ecaesm8781491f8f.6.2026.08.27.04.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:38:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 14:38:00 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Roman Linev <admin@mswin.me>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm6125: add TSENS and thermal zones
Message-ID: <e2dnaccszjptb3c77yqjzvvabn7bdfkf7uxnlaf5c5b3e64ze3@k7fn7kzjmjzx>
References: <20260821030325.1823829-1-admin@mswin.me>
 <20260821030325.1823829-3-admin@mswin.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821030325.1823829-3-admin@mswin.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX0GwOWFmJ1BWM
 OHLEGtwk3mpeI0S3u/R9I7fkgSEce1w39XBfVV+gSdefARU7dF7MCsZfpHK9vKma+7oX4Ap90J5
 hZ49zQKpYqANEgMhjMXZtmLhZfQGx6o=
X-Proofpoint-GUID: Bko9AtKkoRlP7NPyoJnbkVgtp4DZz70_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA5NiBTYWx0ZWRfX0NRrNFt4L01s
 cMExFQaPqsfR9tUA0fXyfh4k+phWNXbSOl07Rh8DlPwbZxfroRXeUDYperN7O++41xPgu16ItJx
 5B7KQHipOaZfomerNvLbMt9y5u0sC/2OnSP/98cZkD2+sOiwDa63A+6VUqP96udprkp4EZUSa/q
 J7nQ41N4oySbOcJTkVbBkW4ryD8OUW9Bt+166m73WlMbB/tSuoLrkfFvdu5k1Zkr0Qt1lUbhCoq
 JDi407EB4tTRhgugpsvBftBJ0+PcikDIIQi8FkEpg/u/lG8TSrSa7+eETLQdN7fsx68acO/t3FD
 Qy+DEImK5eLyCJWb4ze2CFvmttuYXDLWkRrxiy/v5zParSVFcfp5FLBwL1h8tY6iNOL++2NgJ/y
 0p9BYh1McZIkg78g1O0Mhoy5TBKfB9UxJB0IZAxc48RLpbeNazEdfF2DyyThTIFuWCzqQ5LTApO
 0B3dBklGg3BxHnjx0BA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a90219c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BzUWo6mpdBTMTY7ZmLEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: Bko9AtKkoRlP7NPyoJnbkVgtp4DZz70_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270096

On 26-08-21 06:03:25, Roman Linev wrote:
> SM6125 has a TSENS v2 controller with 16 sensors, at 0x04411000 (TM) and
> 0x04410000 (SROT), with SPI 275 as "uplow" and SPI 190 as "critical".
> The register and interrupt layout is identical to SM6115's, and being v2
> the block self-calibrates, so it needs no qfprom nvmem cells and no new
> driver code: it binds through the existing qcom,tsens-v2 fallback.
> 
> Add the controller and thermal zones for the 15 sensors that are used.
> The sensor-to-zone mapping comes from the downstream device tree for
> Xiaomi Mi A3 (laurel_sprout), cross-checked against mainline sm6115.dtsi,
> which agrees on sensors 2, 3, 4, 13, 14 and 15. Sensor 5 is not
> referenced downstream and is left out.
> 
> No cooling devices are wired up: SM6125 has no GPU node upstream yet, so
> there is nothing to reference. The zones report temperature and carry
> passive and critical trips; cooling maps can be added alongside the
> consumers when those land.
> 
> Tested on Xiaomi Mi A3 (sm6125): tsens0 binds at 4411000.thermal-sensor
> with no dmesg output, the thermal zone count goes from 5 to 20, and the
> 15 new die zones read 37.7-39.6 degrees Celsius at idle. Under a 660 s
> glmark2-es2-drm soak the hottest zone reached 52.2 degrees Celsius, well
> below its 85 degrees Celsius passive trip.
> 
> Both SM6125 boards still build with no new dtc warnings.
> 
> Signed-off-by: Roman Linev <admin@mswin.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
