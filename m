Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934A47D466
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165288; cv=none; b=HACHJOUBIkuXkndkcgDkeJpknRybejqTu/PZnhZIpFo331jS8UrXWY2qxRGkLS1TxpG2nyKWI/Km4wuJOP4E4UnbSfWXysDCTn1FK5FFbeEZB2e5h9SlpNVCaGzVY4QN//2sE049w7DiP4OhRhLYkMPN+GriFhI/47G1ZCNZ9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165288; c=relaxed/simple;
	bh=TVBPHusqWEoACQtsD+GQYAuJBrAiFhUzMO+9HIlBFmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2dS4GUiCDPXksrsBLOcVx8IBQY6axQvWdXP8XXtI4KqKwR7k8H3nORp6kfaatYLSBwPtlHbMHg+IzucB8alMpMU/VzWvm2egmrpqTUBW4OXVcurWICzHfYcs6Xru3WPqjZcVQDibRReG+CVPhk4K7u4XU3HBiPo8/34yYNmBlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQxNHb51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVw0hs1g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQxNHb51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dVw0hs1g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbWwR1831852
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ac58Jf4AuIL7xTX8YhJBJrNt
	Eq92ktj3IzHp7Ff100E=; b=LQxNHb51KzzyrL7Hwrn/kFxOeNAHRyMGTx3ose4S
	vvSP4sScMmWmoH4zPqWFaI/VRPeO7x1+n9f33L/5P8U/GKaB673VFH9hXhznsO33
	ED0/zm2P90pskLe0eFSo5l2RrT666+PjL5sYAbezKjej8Rk3+h2hng4s/cA0JoAH
	yjo00Cf24sYLP6eGm9+vTOQxqErEDtfBH7Sa7U7aLq93iAfZ5jfVyeQVwRR+6F5E
	ZnqrzdQP2kqaoF+ge8LCPvhGnst/bJUviNIcCd3gFaj4ESL/yWaTnBy4280OTDSw
	Vwoui6WsjoRxUzN+1hE0fRp/zp1EGsR7LxNaA0LBZs2drw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3t53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:08:06 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96bf59c31so302645e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165285; x=1790770085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ac58Jf4AuIL7xTX8YhJBJrNtEq92ktj3IzHp7Ff100E=;
        b=dVw0hs1gm3jslVDgzbGSSi3nteFv6vnJ0M0nTfcZJyslrotRq8BMXDD+gDSIHL5NO6
         XnqM+gGqRnx4EakIizoh3EesztQnyaSFLTdV619VdJ2pzbITbSir4H1DT3MPjYXSTJHS
         MaMVRqNlxubeZAAgB1bgcGyAeyXEqncGQ+YDUs4kBGuJUSV8d0HFIvvY5V/GDskeZMMk
         e6X4FXRRVE7T0XM03V/bbowSuoju/Vlk8YDklomjAk9HgmmKZS0wHMV+9mdpmSFmFMyK
         8FkzjogMBOR6C5PS+AjWx9ewHVlGJlWeRdcWiMzDMMWp36S7+LDJZHjIQ7H89csI2dzS
         +Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165285; x=1790770085;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ac58Jf4AuIL7xTX8YhJBJrNtEq92ktj3IzHp7Ff100E=;
        b=dPWjDmDeMlx6Z5dIEmRxtVXbujFo1XTbsjvaBUTZOwEKtYzR+bCqNHSdMV+7OP8Zrt
         6KYD9GjPaatLxukNgqomDOLJlTsIi43Jd7cMf6JpBVRZaYpYWSsZJlA5RD5xJf0wbyp7
         nUPTtUWhHGhUslA0xoqFnBNS4YyWjI4pZ59ylqBuRY8ajisvV+t5Fax4zF5K5SstNdl7
         OxNixPd+Zwf4qMaUTaRmNnZf1zKtqU9MV+mMEtcoZUbDP4BmMXSBaq+B7iKXOrjL8eXL
         GAcvX8USRfezTa2cdnG7q3DXd/J/XtF27rT49irJzIHryrmM3XtcdHOlE+nQFSQ1CwNu
         RCsA==
X-Forwarded-Encrypted: i=1; AKwUvBy/tmO2jWofFX2X/u7XSLNPTP0dH4ggay7oOYrMTIaNbG7aF5zZaazZd/uE+jMuVZyTLjcy6PPlFLx2SL6e@vger.kernel.org
X-Gm-Message-State: AFuF++mk2XkuLUPUxfVh/gqCYoOyS77KKTTfbIaqgsoPfpE9a/TSJ+4H
	UZMhVtdyPzpSpjub6OPB8eh5eoA1ISmLG6qB9ThCjECRjQdfZxAvVQywpDQjj6VGwECXMzT+JJb
	NOOgsiXJ4hj3ezFQfYPXj7CKgUkDZ7cnaJu9h/pa1D0omRK1JpPU9J3jGCqtzX0mK3PJn4JPUse
	71
X-Gm-Gg: AYBFou1rivxOhXVtmb7BDhM2A8fPzW5BigryGAG0bU7/5wDD0iv7pi3yknlRaTrOqAi
	mVvKW91NpMBdwsopyLdtMpg+7pG54YODSavSK++tMtwoALZlkfcKtocqewY7luae5n2cV9tV4Jf
	l5o/r0ANXej42drRfTvXPA4YhLuSuQEFwP/dxWn7svz5jBb3RejQXxojO4VfQ89rRYEyEkGSTEU
	0HmRzfSy293+6Y5JUlONUe0Cvq3z0KskLXVMz33rUpYLN1aXKY+Usz55eekVu9wk1g2kGJ7M+GS
	m+4uLxTzLoo5AfMKpB1kNaTjEECgjldGUwVKKMxd762jOJ2JV+E4FAVOWgrEBqcCaJS/ee5L+km
	eXNYS8LpV5+NPDJW/iSz5wPfxbz+Pf+C9Um3VS4bI0xQiTIFri3f3e/OXBomajKgpFXtVusSoXG
	hzM5HsmpzCPDqh
X-Received: by 2002:a05:6102:b07:b0:7a8:1b8b:6d04 with SMTP id ada2fe7eead31-7ac1acd94a9mr2001376137.2.1790165285039;
        Wed, 23 Sep 2026 05:08:05 -0700 (PDT)
X-Received: by 2002:a05:6102:b07:b0:7a8:1b8b:6d04 with SMTP id ada2fe7eead31-7ac1acd94a9mr2001350137.2.1790165284492;
        Wed, 23 Sep 2026 05:08:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d85787c6sm542035e87.21.2026.09.23.05.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:08:03 -0700 (PDT)
Date: Wed, 23 Sep 2026 15:08:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <e4uqn4dybttmo45gucxdxcgimfskuzlqvtdo7u43ixlyd3yn5v@aifg7nchvc6g>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
 <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
 <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5fEoCrZeC7B6bfFfUSbSNTshN6o50LTl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX1xDXX2o1RYol
 kO3YYud0b4y2n17tnxzvhOdQ5CgPxtSR7L/L+tN9KACgOATTTjb6fPHFTZpqG78ptqOxhoKhOui
 L5RG7WTv6dR+OSuhQFGjjjshR1wolyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXzZMdalFIxgNS
 sNAGpDQEY1YVE45kKqlk1pPuAWJz++YEm/fz6EwDevEk2JET/RTc+KTwWmQAFDX076/lZRSGp8b
 E05rcnGM9oxkyNKXw0woye6TnU8GAAq4BONmWHoS5XhEaPJVrAnXlL/MOVGGs+PFfIha5O0fBxN
 ykmws46TBz7XGsJXZVa7tRPgn88pAsfKywzq1ubpJ0XqyiWPG7mhD8u4cNSB/cyQ3SQJwDf2DuJ
 9/vOrbzOtOYPgY8vq8QDD4ZwknDvy5ygpbk2cO1mk8fHt1SDxr+ru5FmbKfhOWYx69iS1idSJDN
 ck2GLypcUdwkQ+WdI5FqbdRNK3qfgNO1C8o/Dq6CoNmMO5CLAQvnP+GIY0ddPUvOsyJFICsSngY
 G6PmyyyeOchcYIdTJNRLb2P0IXmCAGMNhzHIb5aKAby0thxASF4UxXQw3ivN2c0k8/KQRzcWZpp
 yIP3Fj7Nol1pb0qnY+w==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3c126 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uvE_TNlm4U97XJhv640A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 5fEoCrZeC7B6bfFfUSbSNTshN6o50LTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048

On Wed, Sep 23, 2026 at 04:16:21PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 9/22/2026 9:33 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
> >> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> >>
> >> Enable the Shikra MDSS display subsystem on the Qualcomm
> >> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
> >> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> >> for DSI PHY PLL stability.
> >>
> >> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> >> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
> >>  1 file changed, 118 insertions(+)
> >>
> >> +
> >> +&mdss_dsi0 {
> >> +	vdda-supply = <&pm4125_l5>;
> >> +
> >> +	status = "okay";
> >> +
> >> +	panel@0 {
> >> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> >> +		reg = <0>;
> >> +
> >> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> >> +
> >> +		vddi-supply = <&pm4125_l15>;
> >> +		avdd-supply = <&vreg_disp_p>;
> >> +		avee-supply = <&vreg_disp_n>;
> >> +
> >> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
> > 
> > As far as I remember, your panel_bl_en enables an external regulator.
> > Why is it not described in this way?
> > 
> 
> panel_bl_en is a Qcom's daughter card specific platform signal , it does not feed into the panel.
> 
> It is a board-level GPIO on the CQM EVK daughter card used purely for
> platform power sequencing.
> 
> Adding panel_bl_en as an external regulator would be misleading and incorrect from a hardware perspective,
> as it is not directly going into the panel.

Well... Aren't VREG_WLED and WLED_SIN1 / SIN2 directly going to the
panel?

> 
> for the CQM EVK, the backlight is MIPI DCS driven and panel_bl_en is a
> platform-specific sequencing pin, making pinctrl states the
> appropriate binding here.
> 
> Could you please take a look at earlier discussion we had and let us know your thoughts ?
> 
> https://lore.kernel.org/all/29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com/

Exactly. The diagram there shows that GPIO 91 (panel_bl_en) is an enable
signal for the WLED regulator, whose output is then fed to the panel.

-- 
With best wishes
Dmitry
