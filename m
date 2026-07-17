Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFA31AAA3
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784259748; cv=none; b=md6OUitlpRAkTr3HD1iMHwT1a/XcAVmxP/XH5cZQF62wbZ1kfGOYoB1l5uAUiBXF1zyH4E5IULE7EnnIjy7F4/+q5XeckKrM23DCkrQ+0YswbUnv0DHshTa9hFy8PkCgvVWn4bQfhXSSer6fjqkXY8o7d2fuhwaz+ufTIAEW+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784259748; c=relaxed/simple;
	bh=PZLunVrkyHtC9wfdf+kbcQ5bdeFIPeDTlnp6w7k2OYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tidUUFohfYGIC8hUrIkygoCeJ6FtdO9TuasfbtcgQ3f+J+jnFGXZaU6b+F22A1S97zRyzSVTASTvV9h7l8fLni/bZosHKUGl46NPbqVxSMWEUYsWVYVWGPBcbLQMZ+OPBEQZCvWILvPq8tcav7YuC+b/INJ+xJDttPWVHii67XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdJmPiFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZ3PJlxN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdJmPiFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZ3PJlxN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33dXP580716
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l5saWHr3dnLJEHPhwGPzYl0K
	X1zNELXP1BiUWCkz+mA=; b=bdJmPiFLP6nRbBRlNw19xZ463qICNAeLUdMVQitv
	j86NJrmzrC89aWZXPVwFKkd6fvSSBE5OEbbFA3dDN3oU74Q4/Bb72Al/XP+axYYA
	uSz8y7LO6disXMPVxTouGQnsWacHrLS3XrLGXVYROkT/vpnalhN36KAI2SM2quwk
	y+e5YuHpkXJH0XPUFalLjOPzFmJwIFc/Eq7SHal9VLGdCe+364DBp67bfAf0vs8d
	e/w7fUYEVDoEHDffFN9cpyUGlvfpMgODPa5QRgDXqe2mBCgVXhw9P3PYdPUp06dq
	tRA5/cHQ55v5hDjA6p2UILUi5Tv5EI/9kC4Re1Rec67p8A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqug69s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:42:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so9727994a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784259746; x=1784864546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5saWHr3dnLJEHPhwGPzYl0KX1zNELXP1BiUWCkz+mA=;
        b=kZ3PJlxN1micX76bAvnaIOyf/69GCmwpcTqXeMjN4Ua6/GnB8T3w10OzD+6fQFxLoc
         5M3iB8GT7MUCMK/EEpmXzIACY0UElKr2GdDXf4GUzOKGWlnft5IFSHSCjmIzBgXHrE2j
         uvbbt/Ci7MYJrDx2UTYGF0vLixmc0F+nhbqfdS5v+Cs1QbRoYJig8cOdB4cNrdBG4mq8
         2fgxzNKHXtlbR0bq+FaaUgZdgN+sSeSfasTpFDN+8fkP/UJPSdiy7p3ABEdQjeIbDsxY
         Kw8tnz++GQ5Inm3kCZEuD0/SEiGlgrrBT0I/xjNV7AL6ifmvykGemgIN3TUN6PG/eMIa
         6lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784259746; x=1784864546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5saWHr3dnLJEHPhwGPzYl0KX1zNELXP1BiUWCkz+mA=;
        b=ioZAa9DN6/kcDYzHZW1FBZNncSwINu/0iwnvdiYj4iQCQRToX70itE4RswwxHuAQh5
         CpMu3spkwoVPTGgb5n2i+KboRqJi+xcKtkfDrNBjL1O9aZkwgwvu4Nk11KY1HeOMjg+4
         QS9RlKpaWJVib8WBIlJjR95K0Z3pvqqdoXioiegAD7M5FAldQmAl+sWxXDEwxyYOS3cA
         RlLjZmzotcWK3afcRW2RmJsl0xKxaaUdn5zJVc5xe33QM96Q+7XPifCE0MOSjR+KbHvC
         38WXxo4AfWHSP6FQxNBqqG33HpJJZu+jb7lVq/nGD/Op8MYAnZPYCXZdAAYxLGzcBcs8
         E2yw==
X-Forwarded-Encrypted: i=1; AHgh+RpaxO+RwsKiUic12IwoDKFCHi3C2HnjkXMbSVVAY2sOK44wWHzFQGpzGIvY2yOfDUNiuQlCO1ASur+H8+c3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8tIkz4XwmvjRzNESDsXVtUAcnqCNbBatrdNa6PIBbGAvdWaZ1
	6urzfQmRTtdMQctmDP5mfhYXES+6TtfzxPxxXrY/ct1rprJU5Pmm3Pjaik69hxRBbi5U5K2fzfa
	Ewvc3eJKDPw+ErMUfRzDQvOYoVJAMN+ccLZc7ZShq+C7uFmbzhKnI8AymbO+1GcktWzbp
X-Gm-Gg: AfdE7ckCdl41XXSl+InXI89bFjhVq00YVi8Y6UnapxFSYxq4Um+W05gsMo0vjCEJ6GA
	gKIjoTtUQHqJ68V6+cyGCjjo2aqIE5HNCJ4BKXrVH0Pz/FGefWZj3YnqKlVbT3g8WkqiAxTJw9R
	ruMw9fLwUtaWPvH78oVcCT4qcEHr89dD+g45KE+fkm7rDQXhE/BDW646I/BFYBGlbgt1LzrOfxf
	hHhR8v23MJKhul5X16UrAX2zErkD+OYbUTo8wY+ZtUXsgva47MZlzhPpBJnowl6313s5g3wwjUr
	sQ4zlWK5Ahorcw15U7J4kdMD0O1c60wJ4RgXbWpgrAES1O/PPRnn6qyeaQoqpWnVpIxJcoMK3q4
	/AEpD/9GJxBul2TbUye6N0j4noUUfC0ko8A1ZoSYx955jdNspHw==
X-Received: by 2002:a17:90b:528d:b0:384:d509:7274 with SMTP id 98e67ed59e1d1-38e4b448dffmr769085a91.15.1784259745801;
        Thu, 16 Jul 2026 20:42:25 -0700 (PDT)
X-Received: by 2002:a17:90b:528d:b0:384:d509:7274 with SMTP id 98e67ed59e1d1-38e4b448dffmr769059a91.15.1784259745345;
        Thu, 16 Jul 2026 20:42:25 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm1702185eec.24.2026.07.16.20.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:42:24 -0700 (PDT)
Date: Thu, 16 Jul 2026 20:42:22 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
References: <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
 <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
 <almJeSq1zfcC1mjj@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <almJeSq1zfcC1mjj@vbox>
X-Proofpoint-GUID: eQNIg9J_H8wp7xju3RRz6xV0uWSlQ9-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX8W9owIfMXIHv
 Ec7V7K0qDmYvoOF4MFxkzmMbjuJjw5QzwfFFCNdNP6i93xTffo3+/xzXigw31QYGeVTlmIgIXcQ
 sARVNrs1O9XteNH3ENNTkXA82kMZyE75oikum6TlnOhues56gIResx5RJlOtZ/2k3mzTOiWgi1c
 EWuIPfveVVaDmX38VFcCPRH+sRc4ew2SSIGqNAxT0WhkseswZ6WwQE/2qNIhHxvvEQMLyBpxCQs
 lA+bOQh3WORZ6yGcgSFTkfrphh4WuThZqm4p3bRYMp3jh0RaEswD6a1sIw2BG+a6WbK0oUoDk38
 e50QO7MBWWGExiWHbykO3CkFjphv70ElRXluZHI5bWGz5y4pEoY2pSu7ppf/O6r/8+MB17TIqFE
 cZ+7RgpCBxZcnG2vRO47IlfTnjdEcVVSzXM9rSLJt42qvik51Ar20K/IDOw3TLFT8GHoVPJqcMO
 eKvKhO7c9DAaaopniAQ==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59a4a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=zDMlSImzIToMmpLGiZwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: eQNIg9J_H8wp7xju3RRz6xV0uWSlQ9-x
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMSBTYWx0ZWRfX9nRrso6D5KYj
 A8y4p7QzIavz4IE3vadPAe7qFb2dr7hHfhcM9uKKV+jVTmphWLHmaAp9jGWexWTk63FA50boEqw
 7wPdBUC7NqK6fZDOToP970Dyclt/3XQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170031

On 26-07-17 01:56:59, Thinh Nguyen wrote:
> On Thu, Jul 16, 2026, Peter Chen wrote:
> > On 26-07-17 00:06:37, Thinh Nguyen wrote:
> > > > 
> > > > I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
> > > > core uses it only for special cases and the code was added for
> > > > ten years ago. For the default situation, we may not need to
> > > > change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
> > > > correct?
> > > > 
> > > 
> > > The GUSB2PHYCFG.eUSB2OPMODE is only relevant for host mode and mainly
> > > for electrical compliance. Usually by default, the CoreConsultant
> > > setting should have this set correctly. So not explicitly setting it
> > > should be functionally fine (IIRC).
> > > 
> > > That said, this is separate from the GUSB2PHYCFG.PHYIF, which the core
> > > uses dwc->hsphy_mode to indicate whether the UTMI interface is 8-bit or
> > > 16-bit.
> > > 
> > 
> > Why only rockchip uses this "phy_type" property, why other SoC vendors
> > no this requirement for UTMI width setting? 
> > 
> 
> Not just rockchip, some tegra and hikey also use it. Some old qcom dts
> files also have it for ulpi.

Tegra and old qcom platforms use chipidea, hikey uses dwc3.

> 
> It is typically set when the coreConsultant default differs from what
> the platform needs, so the driver can override it with the correct
> setting.
> 
> My point is that changing "phy_type" definition is more involved than it
> looks. I'm open to alternatives.
> 

I know your concern that in case the eUSB2 PHY SoC wants to change UTMI
width, it can't do that. Are there controller register know it connects
eUSB2 PHY?

For the place to put "eusb2" for phy type, I still think enum
usb_phy_interface at: include/linux/usb/phy.h is the most suitable
place, would you have any alternatives?

Another solution is using generic PHY API phy_get_mode, set fixed "eusb2"
mode at eUSB2 PHY driver, but it depends on PHY driver doesn't have
different settings for device and host mode.

Other solution is compare the generic PHY compatible string at dwc3 qcom
glue layer, it depends on eUSB2 PHY compatible string always contains
"eusb2-phy"

I prefer the solution that extend enum usb_phy_interface for eUSB2 PHY,
it uses existed kernel structure and device tree binding.

-- 

Thanks,
Peter Chen
