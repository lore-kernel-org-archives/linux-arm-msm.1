Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366962FD681
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198265; cv=none; b=VPyvoY1vKbOTr+yNPWaD9VS7vdO9nocbUEApIz1FRffE/y/QYSAedcgbI91YOoGPWZd8GlAsSAnyx2ZPqsXc6FeNn01A6IOp4vqXOh1R8QHtLg2hZhO53Yr5AkNPI2eryPyMvEbHDiXVKdgVP6K+8Vx9pimSEAApl8GjWg0n9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198265; c=relaxed/simple;
	bh=THZ6Dm90Uo5++KFw2Oyy1EP/2IUaW1myPl82jpCEWKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE4wnQh2WZMPtTWd+N5I/oo30Bgf0brHdbih37L1rRl4QlEI408xmbrD5g5o9Y5DI+xZQjDNPY9hubvcATJuV3QgJSJxi48YiuTFyudygiMA9l4sPky+En4Bmp+4CacJ+3EqA81dV6sOoll7qscmN4T0AlmBnBHr+NtGRNuT29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ds1VxlCW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N1MJCY1y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ds1VxlCW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N1MJCY1y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9rZ3F2216512
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lk6h7nzCt6VjsgsfBseF8awD
	CLuqhyostmxHjxtpO/8=; b=Ds1VxlCWnV1p72FNQO5Okm5GxczgITU5w7eRiOwh
	zL6/1HoGDSPHMk11olZFZG0HIyP5UlySaCnFBhv/X/m71f6q5dDzMZaWD64uDir1
	gYRMluOeCxF6ULpMxJZli0A0DFOR+JqDPM393xsKarvcCN7aZOUE9nkMaOcvVcP8
	OlaskskdFnHg0nDzZxH9xpTML9iQh0MVIf0IYAfw5y3iVd/5abtTyKqGe/C1Ql/U
	hkUa27SOYYFM2EKVuisuLK9+CJH69NKEHQU5F3PWq9wUHfpZaL0b2KYmaJvF7fI4
	b0QdiXDUZl1h/80YP3ifFV4rBzGGfMqYxzNUnnz7Yz6HmQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rx1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:37:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8894570b58so2462368a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784198263; x=1784803063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lk6h7nzCt6VjsgsfBseF8awDCLuqhyostmxHjxtpO/8=;
        b=N1MJCY1yTVBNsDzJeq46jp3ASG6B1yQizm0olVb0PsKG3Wqa0XQRAvXkVv4poIXMmZ
         SL84XjPxDeEiSM63byp+CWA2l407OLHcUncNPlKNK8hJJ8okVV498exXyHLdbvLo+rrG
         nKgiRWXtOcpsPNcmhDZMzbuR121HTr7SG/zqHRramLlDGSPopwtZC90xFJc+SYCVdybz
         ViMHZnigN/hSTOuULcSIvHFw4TmfV6xv5Tz282LESP1yNfXNepvc3qa7/nQ1us6WFfn4
         NoUFZ0oBTjl43haX0/9RNqJC3oPo9Vc0NcIjw9/TumVvYaLTZa3+aLeULNPhfUEy91/U
         slOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198263; x=1784803063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lk6h7nzCt6VjsgsfBseF8awDCLuqhyostmxHjxtpO/8=;
        b=loLbApHs0PzTnF3JSsD1EfvKAmsG3hp3cDtr1ijr62DTwT9VuZ1hVNGezC1Ybo9dlU
         bQi2syc6TPswPAo6F9CAURKSt5NA+XLLMrTHmbCFLlWhB7kCBD5Pd8rAewHZGHEifCE9
         3eZBJEUgt8a+Bax93nUCF+SqX2CaEgM46DGCKXU2NJT1EOGoYiEFodav7ouoR0qyBs9j
         DPP6RM7IZFMbsWCQIn6NRsaXF8plwZYHsDb+r/zw2m/nGS7KZj4Ba0h/3SH6r9yoe/b/
         7Hl9ixzauZkuaKcAkOqnSV4ulZ/Rk2oKzBUKM9J76wEMge5JPyuMr3ggX9LRmgaDngyk
         wPoA==
X-Forwarded-Encrypted: i=1; AHgh+RpzRxFm49/lAb+o/kZWe5X/CpLecwWhyOOFCaRrGEyKIxZcUm157s35oD93eSiAarVv72hE1aJxblOQAydq@vger.kernel.org
X-Gm-Message-State: AOJu0YyYEUAMc6jfrbgQlk4PkbQQ37VBrCaDlKQRzfveqrporCGuRH+F
	61f9Jet107JAxEVogmj/WNqq21jwg7Ef/4uEem4rjQKvIoA/ZWGZRKsNnoJfY+nCPVU8fpmDMcE
	bxp6nhObtamteti9od96DlKxchB2hM6X8ic7a3skz4PYOKqwMPeFtYp/fIYMOyZEWQYP+
X-Gm-Gg: AfdE7ckR74+bRBBT0y6EwuZbLTNh7eLTFHZ0jUvIHT/XEAiaiVCU7ap9n2bLCalcaPx
	i07hzIgtpu55GGi7kQKBIoYetKeHJVufBGJult86fN5NMKJMbLlV1QWjSi1U33ONFE5375mStxq
	JRR2U8xqG/zlOzpIH9XLszp6KOoQHCccKZCJFb6x33G4uCoOuQxozydp7nLWGWiYn3hz67WcHrC
	ZAbh1LZTQ9oueYIp4jB5BjqAygpL6RWCaUYC+Rk28EBD/Ylhw+1NuEV34i5RE4ClfuEPk8RRK+D
	KiOW4RYHeN/tlWhij1ecslHZpAPK5iMKyGvAfPvWFMk+AeJLGAdkyQbFm4rhIucZwf4cvru2znj
	Wk68RTRLq39qtjAxyH+FPbxF5bEin/H2wiljgPnt2QRYnxwHLVw==
X-Received: by 2002:a05:6a21:4c13:b0:3c3:928a:b0c1 with SMTP id adf61e73a8af0-3c3928ab1d2mr1591972637.74.1784198262868;
        Thu, 16 Jul 2026 03:37:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c13:b0:3c3:928a:b0c1 with SMTP id adf61e73a8af0-3c3928ab1d2mr1591945637.74.1784198262413;
        Thu, 16 Jul 2026 03:37:42 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cdc4accf4sm1387292c88.10.2026.07.16.03.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:37:42 -0700 (PDT)
Date: Thu, 16 Jul 2026 03:37:40 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Message-ID: <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
References: <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
 <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwOCBTYWx0ZWRfX4muqTNf8Wzx4
 G+NC8TBKYcn3JfTtp23R2kDvJ+mJljm2nbbM/TC3kEwPiqv9xXGTFPnsEHkLb0XD8fghv0erC1L
 JB/n15J2HXUIeRBF3Ph8POZDwKXzfvk=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a58b477 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pkNXjn1FWkeuvB4ljW0A:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwOCBTYWx0ZWRfXxYnrg7x1L1WJ
 Ag05qk8P/CMYAFiPQ/9dLCo5Sc/5RZ3brG8CJjFml0SDoF0gNvcBzaH9MBuAD7j9SJZa++4RmMM
 yHhOHUzTWHCgTD5CaBw67u12glPBtPZlEEJ+oZRJPceFtRN/NXRIixRtDHjQrGA+MsxMZivyrWJ
 NzaE4Ora6EISaJAeVrjTEbOaiNWMi+QCaUWxdGyxn/YdjI2zz1jsdA9cg3qXXaUX2MgwZ77nB0o
 S23eH5O2aG7qbXAp3U3DQjcCBW71KPK6RPM0T+yYJsnF79yQvWra1t50G3b92QCGXK+EtJWeA2r
 5fMDSKg9VN7rs2KDDyuTuhsHIuCQFC0cRNW2V2UQ/CC5+Zx897zI0CeOGAjdQeHHqj/+SJoEvr7
 Vobj35Fqn+7x7qGpo/FEZmmEBGAItURdoIujreCSx9kFx8F1ZxKrJimjS9m14Wg7xbVZzCk2GkF
 nFFkICy8XdLnMK4d4ow==
X-Proofpoint-ORIG-GUID: VdqpSWl8qzr1ZPlmCNc0vMKjB-wAwTKd
X-Proofpoint-GUID: VdqpSWl8qzr1ZPlmCNc0vMKjB-wAwTKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160108

On 26-07-16 09:42:35, Krishna Kurapati wrote:
> 
> 
> > 
> > At minimum, dwc3 needs to be reviewed and updated for dwc->hsphy_mode
> > check when configuring GUSB2PHYCFG. Regardless, phy type should not be a
> > usbphy_modes enum as I noted above.
> > 
> We can just add the enum for eusb2 in of.c as pointed by Peter in [1], read
> that in dwc3-qcom.c and use it during suspend resume for interrupt handling
> and to modify the DWC3_GUSB2PHYCFG_EUSB2OPMODE bit once we are modifying it
> in core.
> 

I have seen fewer platforms use "phy_type" at dts for arm64, dwc3
core uses it only for special cases and the code was added for
ten years ago. For the default situation, we may not need to
change DWC3_GUSB2PHYCFG_EUSB2OPMODE value for UTMI+, Thinh, is it
correct?

-- 

Thanks,
Peter Chen
