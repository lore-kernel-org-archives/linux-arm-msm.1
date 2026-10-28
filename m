Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168277;
	b=2iUPprAgI76w4X32vtahSGmIvd4XbssiadH385z91Pxk8/zALAEvv7LeRHWJ0KGmOnzJ
	 fiTvMuje4Ft2wJ9abwZ+gatPpvt7h+TBTZuubJN2zT66zGtuolK0BLwOemp6ghPP5nOKC
	 H4qJQBWHGVhXXzJUEGFBE1V0kkCrrkgzo21NMth1flBcJDE6lnKDJFs80gHqPk/AvptKH
	 +UHX/xbMNYb17QULgta8l7DRY+UTaCCjuxLLhAQqPw1G5f4fXu3pugtfRjp87+l4AzYAG
	 +eiUnnoobuW8YJ+kBPwinNOuuNCOCFetVDgl78TC8LI1FwGiqGfssBlowvPWcVxl+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
	b=V1ty17e2L3EcevTRs4+z4wQ/LcNdEcYN4ySaqOwIXgSzgEwQ2crwo7AXYD5E4dJqaKZr
	 oXZvFa4IQfBHokVuJh9GQZYfWNe9Nh/1/3h64RI0CT+NLgyiC7obG57EKVs2C4VZc1/x8
	 y5zcZtT4lmoNSX8WzkHU3Ed3tvrhwxhyvjamW60UWdFy35SY1n59OXPJw4rzVQzX+R9do
	 VEGL8AIaz0yJG784rTRdRHwH4bYONKnM+GJTktP7yLHLWkoefQDdU2rXsqJvlwIEVv5WG
	 SYyQAns00z1Zh67U0DSq7sM/gM6uP9bA1JVhiYnC6Y9aB+059tkWg2iy28UXd64JKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MH3MOwAh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1A606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XW2U6fPE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MH3MOwAh
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S6A0LX325340
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K5N0tp6NIiHbYJA78yp8UEG2
	k3L5MK6OnFuRMDqwAEI=; b=XW2U6fPE6C4yHQ2co7/P93VyMQJKxwrPo2T4NQ3q
	oTvpJ8ah+XpqWFUebYTjh/EPdByKg7ZP0WGr973GUIT2m8ZdKa//XBm8EUSTid/D
	avgTP1xxBrhGwAnXxyjlnwnPy/L05el8TPmxSsDllxIn0C7Pj7m9KkeXmbpY5On8
	KmXD3pwRJr5LrnxAjD3ERtYU2UD6tm4SsIrLHJn0GtwTLzj2uZL0zug64wC+ZTrX
	8kdRoyH/bs0OYLNtBcanKnRmuboxpVDlntnaaDBps0WeWHdzGRgalsFuLKHs1BR0
	EP/341ip8E90ZJwhBQtnHeqsz0m07uT/hdMSm7BP3d2smA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw80u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:17:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so4981245ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168275; x=1793773075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=MH3MOwAhX46ieleihZkm9tgg28MmNkMMYneeip3z3n8K31UV5YjQRwSh9GfvD+1gY1
         9YWWJvAMaTJVabG5vhgB68SVRocIflC/v976tQTxIRdfs131yv8DSp7DWIa0EKdJdyle
         SK6XNnShI8GIcG+bVO1cCWwr8eoq0F5gKWNsNPAo832qfzDKmg2AAU2bVrEfxwdW6c0R
         Pt0WRUZ2nJVHZ4fRu+G6nMDgAPKHEoMy/Criwyob8zdVfKrPErQSluEkbZONv4+4RIKa
         JKsjOGA6+RnTZGggNd/erifnvYjPbRaPMB1lhVXptWpJd4uHUzEzDB6bvdM2d+hSK40B
         O6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168275; x=1793773075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5N0tp6NIiHbYJA78yp8UEG2k3L5MK6OnFuRMDqwAEI=;
        b=WwT4+WOGw6IDDhMl0AzfyYP+pKBVCcpc4e2sX+h4Z0WNAxRZQgzUnyqoGZarY78Rn2
         +c3aGMTX0Mg6fmqYva9CeZF4JtjOb1hLTwI+cfi4muuwzCsdCEH+nKYudQ57aSZ4Q5cJ
         ZhGDEghcKF6VT2Ph3t8Vvhq5h2vC34FsWEgFvmmu7Yh6Z3OFKkcECVsVMCucvnGolbWE
         upi1FXa86Muwagb9UVr24hsiZFQ8p2Fq2vDtnEsdYgtDX/667jQ7e6WUIkzZFbwmmwhX
         2/wg0maE8/MGgWzv7klkTN+wYRu0cR8RRneq62Q6cunMotBDvtC5FwucSGD3xffVMgDM
         RDRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxwGiC1r/4+7hxIKEmAXfSAgrholSSi+LLVybc67hT8WVnVoH56KYcLZdbNi9srN8Oiw2KUuefjWiE4+wlV@vger.kernel.org
X-Gm-Message-State: AFq9FYKyIoHni5JjKS2C849MsJQY+kSRJZS+mXLLFhU50Keda3fBOs1U
	3bhUymglP3V52tGea4MbVIdwUGtgT2u/pAzoQebHPLV3Op7upq/43bAYv9dmgcGwgAQxUt18dQI
	3XFrpaR04ifhqpMtcpgY4W3pdfsgDVBpbKWBuSAXuMfB9asi0TFHgHpOYgTrheMy5Go7D
X-Gm-Gg: AYBFou2jiinRH/XedEgxxbfoNb/JGMF4BiU+25YFlmOZHBDxMFg5GoqVSy7QAB1V/hg
	SELDYKM4dt7nikjosVWweW5k6TO3fb0vsFsWzcSpCEIASCot5NRygkShfyOWqKO86RBByr2/NbB
	6m6/5z+kuaT8ZgyJ7fU1Txm3Fb3IacBV0z26oW9RTvD2VPYbWyBBKmmcjAUKDOTdbwZNhBlgGXy
	urYx/4rWthv9LARSgF8RlE173fb9gCsSvh7CIfjF0R0gk+UX43PsmttAAuxDHrEpI1uWZ5+7ii4
	2KUvPg6sx9QiS3gUPEot2Y09qnIfvyuogaFTh4RrE6P7PGUqb0/yo43UVOu8sPhnv//Iz0MSLDK
	Df8BUZ5Y+5mzwE1ND0v9W9L8nOD5GS3FVaui9ygVQpNt6oCuaFgFJLpYW4nKQu55BIwuyT7m9Q9
	n2THNC
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979110a91.20.1793168275418;
        Tue, 27 Oct 2026 23:17:55 -0700 (PDT)
X-Received: by 2002:a17:90b:51cf:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3ae57f627aamr979099a91.20.1793168274988;
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a944acasm1441431a91.7.2026.10.27.23.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:17:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:47:47 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
Message-ID: <auGTi2SWAeT8fg/Y@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
 <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
X-Proofpoint-GUID: TO5lWPeN3WHnm0on73QcNpYqECCWRBOy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX2UdyNwkjvYND
 LsGewFTA9G9ty9AHUVTuVHS7TJuJaopSngyRAnKH6fsvIrE11pyF/j2GDeo5sVvJ7CU2KRVH5Vd
 yg5gMkCrB3SQovQ+k/e38yZfMkwtkhU=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae19394 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: TO5lWPeN3WHnm0on73QcNpYqECCWRBOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX528MhrNESKNG
 OS3/u20vK15Vr+xdoG5OBbnT10BBfXmlB8S/AU3QNfRJcGGx3NBu/2kF+6i+i8qQLrNCWNj7VFg
 uNUQk2iUf4a3YCZNQgATVftM/Oo6Da3LpZSukxs+RW9tiKgdCLtPN4a908Hqr70p5AoYs4WbdyO
 k9beibT13INSAfh4Vc7xRFccTI6tRc2Te4NC0lmcxQpzkAr7z/5f7jE0mZPZ0NnbYq2vWxMuRio
 k4o4Z3H1F7CcGW2oVIFXxWD7qVZSBanWK/L4tK5mihrM83BB3ZIx4cYzHPeKoiR5ozumOdH+ezC
 vQoE6ZA1chonfvZsddoEgC2hS3BTSXIIDmgkHlfkq/ZwIBrPS4BmQSiIhcNFu09/UYGzZwOOYeh
 xc4J3Mmfjhjkqvjr0EaY+NaJp1RmFxi/YYnX3pHwMW8AVab20G6mxirKaN5DZFFNa+dc4wrmnVH
 bJu59vEezY1H+eF+90w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:06:09AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > 
> > Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> > DLC daughter card connected to DSI0_B2B on carrier card.
> 
> [...]
> 
> > +&{/} {
> > +	backlight: backlight {
> > +		compatible = "gpio-backlight";
> > +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> > +		default-on;
> 
> This is a little strange, doesn't it come on as the panel unblanks?
>

I verified by removing default-on and it is working. we will handle 
it in next revision
 
> Otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
