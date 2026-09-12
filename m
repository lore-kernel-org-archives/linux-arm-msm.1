Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BBF32B108
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226723; cv=none; b=ORS21WWOIeQeoWTGvfQGastqqg3/eW7FuomlDDr8qSxhzMojO/LCdCL+db3tzebr1/XQscXWArKHnIvvoFmFCa+Aae/rAjPnLMm7FLBaRk2uA3koSIfjdvvEtbehu+tpyb+TTkIkUAVZdmJxF3ZS2t0gGfcWyWBWzsErW77MFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226723; c=relaxed/simple;
	bh=4eBxf+Fj6KnsrotgVdRczT9ssOraNNtjnrJCSA/YZhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhAPv0bNHQIKs6pk7YcSBBELT1QwiUJDQH8YaM5xpYqAP4J+7/nmpMevrBx1/BESaV/JRDbB8EsGKgEFnmo9YrgR5PKJjwwhUOw/aroMNQnaA6dgXd9LCzL9NJTxBa7i/APcMSZh82w9wAyuEPcZAX9/vKpGo903NCxpKYm+DAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/zkERln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOuYFyEV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/zkERln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOuYFyEV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEeCB9199586
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JkBknVDne8chqJALpu4JqR6J
	qVDi0RNKgdcUBmrEbsk=; b=b/zkERlnK1V/oyswBfo7UYW6xqbhpy+Koj6yomt4
	tSJ0OEuhfR8Z1jnI2/MoYbtQqJ6PcM3BEXL8NobyceqSn4uzD6K7yhnUZu+tRgdf
	yfQu27V6x02r9RHvg8vpYj900nrdW0Xwe9zEkl54CvimnETTSt6jY0kX8fyZtKcn
	Ah5y4MldPCiePveItAkqNTjHiC+afWeAIn/WsZER7BqvJHdXfnhN999ikXCe8P/O
	JTIxeQhW7RV6CfF7SNv/on5M+QNpg78MVXP28vTMyBxl867wUGA5/fS2tnFjTpNN
	hVZ2EXDAAGd9pw6VI+gsM2MwvWzuCbEzipknWOS3VW8wcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ch89p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:25:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso78157785a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226721; x=1789831521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=NOuYFyEVNzVS08trRZDCDM20EZoFfwC03gmT1OdJrOVpK19gEIubZ0sDrD7z/+zcz+
         BHzLGiGaeVyGFO84l1mOZKUfRxgyXq8bDOxWNzQ7GWh8wLcGMWHYZY9UENhFJNdj1aV4
         rVPRnT6fRF4fJQExlyZB4oJAZ5hzTew75POkQBEXyYG1kjjai7XkxLYQxu1bRKHa5MzX
         rLafLWeISxkybbAurLnhrlj61LnJsydTZhAcS3E8L872E39Tn5ii9TzkN73+XUXtz8Go
         yuF5OnzEp79DH6FWaRufhPleg5uBaRWZ4ZtwYWV7rKqJxqoEXbtUhHlx7rYgAYkD62h8
         SNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226721; x=1789831521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JkBknVDne8chqJALpu4JqR6JqVDi0RNKgdcUBmrEbsk=;
        b=CotCPW7V1Pv4PDX6uK2KGutsbHfEIOFnpUxhy0cE4WO3iGunZlvUr2JTQEcJ9yadfl
         KPidn83l2y9T5l/S6vJnwBiQAtg5/9ieiiIcDK+lxboL3y/vbXS6QzJSQNT1zuQv7TzX
         Dd30+ljbmy4Q84U/zLuimS7xJI2Tnqdg1uxpufxGupkt3RZdex6GCitotl6LAmQpsYHb
         uG4Ae6jLJZOIkO4epWHjVzdH4HTbc/VUpw4JP7TwNU6MAeY1Pp90Jr3ldqgE1R4F+NbZ
         QPXF4EPRZDfnUsTD6Da93MuLgTxZyiw8Iiec6DEyEM2Bl2ofhK+yI/aE8BAncNqn3aIv
         5oJA==
X-Forwarded-Encrypted: i=1; AKwUvBzSRnsOHomO5aX8asKmuwnxnJlLRRPYSOtlHKaOosYBZ7CmkYji1wjcuP9433gM/ctl6MMgNmpvdkydBPG3@vger.kernel.org
X-Gm-Message-State: AFuF++mSeA9fiP33XrwLFM0Uxeyy/fuv6jofPnPLcjnHZgN4YgD2HmY5
	FxMR75Mfp+Koe5O8SrVQP+hvb6f72Uo1hk0Y4azJBWXOp/JQmqUpZqgkuICs7GiJIHSnltO/WtO
	iXyV0R/OnZ3X1PoNKben3avtB7Xsm0u1xUsM+Na6XQ97DxO3DO+rWkHx5gCbACF6lqqEM
X-Gm-Gg: AYBFou0TXkdvKBIira3KXEcUtB8P7I/ukh5699E2gvdYfcAYFzmwyJbiu+TK+ntkuYC
	UrOrc29Ufwffr60G7VzXfjFAkgaerscVqRUqgJHzIwCkekUblmzfQrJct2KodsNZakaz7fbPIU0
	Um8Oj9DpQ/FsnJJ/GmpTlLHeXAJy8ThQJ/57xnceOURiUaNZ5MpxB6AXc0nfyxndR8gQVHyDzdQ
	B/xMHhlM8NKCJYeHSE2ve88c/8sfYtKgsNaDGIbrZdUeh7aBIuLWWgoYTqod2k9PODv24oST3pe
	2zZL01SEO2PX2kX8kopA0AMQhhh7rh+P2gdJbzr3BUeTbHEmIIM+gGVXAedQK5zgntK2l7ouoIX
	CGm6xsIm71v5jtE0=
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732161385a.24.1789226720613;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
X-Received: by 2002:a05:620a:198f:b0:939:72cb:bae1 with SMTP id af79cd13be357-939d7f878d7mr1732155785a.24.1789226720030;
        Sat, 12 Sep 2026 08:25:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm108257005e9.1.2026.09.12.08.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:25:18 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:25:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
Message-ID: <yvhvfmdzjipxi6eyybrwwdfle2jkyffahenvdp7s2ieuvgjmp2@bte2vyprwnsf>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfXw8KmAePPiU8P
 N1tOR9DkTec+aCSicsvWg5hFMwN+aRF8KgIklJwVLx1zRZuC0KyApt7kTshWZVVVEJQVJ6yjY7d
 v2+ZXjMDCR7Nf0NJwa8ZTMZoywb4wpTQ1TR91YiZdMKSRl2nONgw4AcQ5Qh8oOeQVsTSd/bBLOU
 aBblp+UWfna0IKFfyJ2In+tBCykmgqqcD5+zKLiPr01kjSatxECCe71szygz9rzVyLg0k5x7CSd
 CG9exGqDLGl3ejnZCciSwgd//7zFjk0333uTxYpYiTF/0AhSMcvGDiYlRwxTIWcaw6MVuEHM62s
 VDuMd4L7gTqUrxzqtFryeUI78a63NiQQcM96rMy11eas1nPlOBNsvrTv5PH3mQpxN6p2nEUa/5r
 4tAS/+jEtZLbI5VxGhmxlbPudxiTVDLL7qVWeRJ4OMGBNiGJJvFmWWm8JI50hwWwkm4Fc/P9sgI
 6q+8+BmLpgIBDhPo93w==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa56ee1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rlnnUfXKZFOWfltiA5oA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX3KXO/5YWx2su
 wUp/o3puZjrqUK9/NhJRVhMSr06gycHHjssmF9grlAXYNRqoUCEPd5qNxYiKJNJnjIh3fcQCJse
 QWgxK6UzX5zYWQd0Uu4iyvY1/hT43qU=
X-Proofpoint-GUID: q0eo9Fi3r5Gv2_AzZ4lXXO0F9_lSYQtC
X-Proofpoint-ORIG-GUID: q0eo9Fi3r5Gv2_AzZ4lXXO0F9_lSYQtC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120223

On 26-09-11 22:20:40, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.
> 
> Add the onsemi FUSB15201 dual port Type-C controller at 0x50, with
> its interrupt and pinctrl state on pmau0102_i gpio8. Both controller
> ports are wired on this board, so describe two usb-c-connector
> children and cross-link their HS and SS endpoints to the dwc3 HS
> endpoint and the QMP combo PHY SS output of USB_0 and USB_1. Both
> controllers therefore run in OTG mode with usb-role-switch.
> 
> USB_2 has no Type-C connector, so it is configured as a fixed host
> port. Its VBUS is supplied by a fixed regulator gated by
> pmau0102_h gpio3, kept always-on since nothing switches it at
> runtime.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
