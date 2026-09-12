Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A0320CD3
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226782; cv=none; b=ODW67rmP/rCsDd9aNA3MOjFQy8WY8cJx/kJ1Dc70BUc1aG3DCm7eSmCEdNVLepdGM62Vhq/V2niB9IJRR/s/IsagXM3YrXqt9bloYmAKnVKHvaXLXfiyUoKnwON0IxMK8E4Cm8gWVnvlUfxmMxasbAdmE0ZoAeOsEvqoxet1NKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226782; c=relaxed/simple;
	bh=MYukbETHNncH3WJQFb+38rqsiVSzKL7Zzr+SVjr1Bm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BITV8R09Rg6hqvMIZkPxBT4Fw1If24qeAVsQhjqXi+JFNneFpFtkd1Gq8VVVi4I5RsU7LSrt1pDIK41OKdy0I9RdCi7pIrXHJUrERZkY1ye7n0QPoEK3EjiA6JrsS1MeujkueYlAdg3iKifT+T2YHWDi4uoPJ9s0mtWZ516S+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/63Zd5p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AeaZuBjR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/63Zd5p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AeaZuBjR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdSCC4128130
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=srHph//xulGp8uORWTGBqDc+
	cQGY5KYFHIWcHFrXloI=; b=d/63Zd5p0JiOy0bbCnTmxzX4OLr8e9C5mYmupl5Q
	Lp/42oR3mlSfC1B+bZOGv448O9vKqqeuHBcwhCz6a6tS3RPcHnswaLw+DpFtgdGS
	o+JG2w46nDAIIn6n6yT9qEf/M0rVDvHrDA8p1RKkTBWmlfjYjMPUVVdKtTYX/8Io
	/NgSk9Hh0X3SYB5/aMh0nEPRaagZ9kPfSFHfAjFt9wgqJgg4ZejJpbRKTTJCPDQU
	uYz/9x6FngtNB2fumFTtSSvBDO5MPeiHOeUNGi4N2QaWMQxD4qHYg7oNo7jCkPOt
	6/KthuLb5098CeDlchBbjOAGkUUulkTxs9gMx8jI6IkQTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c99av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:26:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so344119885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226779; x=1789831579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=srHph//xulGp8uORWTGBqDc+cQGY5KYFHIWcHFrXloI=;
        b=AeaZuBjRDFWNDtMjpokpnWdgEiDZOggTXYccDTLitTeXU6WtMWw9fm1ud/Azb0FPyG
         k+sqSjeRGe3fII6ZfUvn632EBrbzjdEjzzgSa51qASjafgcsLN8Wnd+uPHXXwJp9PmgZ
         OkpFtAIh5HJf8gkc2FLIE0JBiohAyLbFtUnARWBoBIOsCZJI9UjvGIimevc2YzVBQwnq
         atNvvS65VPBbUq/9MeceJ+WOkk88+YVayAh1nybQ2N6kY+h9ccU0gwngQ6d+TaNQ7Zyx
         5ohuN3ZVCU1BYdyFQoJBIk/tyC1YM2yYHBTTcoFhGqCAh/6BS7K6R4DDVUiUCh5HXd2L
         J7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226779; x=1789831579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srHph//xulGp8uORWTGBqDc+cQGY5KYFHIWcHFrXloI=;
        b=O6lxnHyo0JCMyHIkjnh2esP23l/iXVNM9XReobx8wIe/48KRV0NJ7MZYg5nNFQEqfw
         +iC+uq3wXnofyL3goVSx3DzYJLjuPKR/7dkv9LXdn2xopbvenMyePpfLvK7k2vUXBPM+
         E++WAOGonljiI2vvKYrFaBhCtXB6TVrOoN7S8LvsrdR2RML4xRtBRdKj3bvogXzytFYJ
         E6Ghm8SGCWteMguWuA+VO1YPb6ZDTe3loqfAUrPC3y+sYyOr5DHKnYE3EWRIcHzD0OZp
         BSnIWlPP0fA793u76TzGQLov/q+zIHZk5W/7BaU+lA2MpZ2dzqqCBJutoV17KKoWrnqd
         UX9g==
X-Forwarded-Encrypted: i=1; AKwUvBztmUSxONhv84ibe6qUICpQaGdRr1F+87ioVstYkrGBrzhP/db0PJ6kUfWYjiBN0benmGC7h4BYCSY4G0av@vger.kernel.org
X-Gm-Message-State: AFuF++lPu8KBTodsnFl/hgIjw6zJyRrRPrYjfeGGJOqUD70e/4gvkKye
	rIAg68pmVWXsQJeENlolwFv9G+Z9kBT/PXe1EraDut/OHtnW4tBCymoDiL7t26PyPR5xT2hFJgJ
	DZHoYoMD/cqDzEJQh9xVXZKO51slFaDF/R0uxaIR2L1YdK941GduFNBANC3mrd3Ooe6oH
X-Gm-Gg: AYBFou1BUzzheA2VD2eg4LdsZ26z+VqxN9HCm4Q9gDduhsYEGyn3deRut3yejvO8Ivx
	GcoeTU7LKyl2o9bUvyq6JYwZbuRFcyUZjRhIeuvFrIIROmdrUBKqxXzJc5X7qfL29+3HwlAKDMh
	szw0y2Nf1phaPCb0f4t3zAH+qMDrqESmDRhIbcb1lE/liZftwuX55FjlbKqhLgsBz8F/2XyuQIY
	gCkRvb1RquqeODwyE8KJxM9jKPIxrnsLJo4ZvCREFTPvOSBfPLaOLFuZc+WlUbOmcpRI/KGrVi9
	Cg9hkjMAb02XIVYUdG9V28qHszKgClH4uOdfayyBP3/wWPSrJ99QQ1+shvN8tpQjufAaqDFIPlJ
	YPxLOGcdfhw1A418=
X-Received: by 2002:a05:620a:2253:20b0:939:f61c:c335 with SMTP id af79cd13be357-939f61cd191mr714594385a.26.1789226778895;
        Sat, 12 Sep 2026 08:26:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2253:20b0:939:f61c:c335 with SMTP id af79cd13be357-939f61cd191mr714588785a.26.1789226778328;
        Sat, 12 Sep 2026 08:26:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c0cb676sm74699455e9.14.2026.09.12.08.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:26:17 -0700 (PDT)
Date: Sat, 12 Sep 2026 18:26:14 +0300
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
Message-ID: <vsot5fm2leyo774hj3b4mskigktxigklvw54naecg43y5rbuxu@q6wc42a5kb26>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfXysyzjBI5TFLz
 Io17Ts9sHzMoCgYBcxSNEjFGf2kfy67Z8Ms9Z8cmhaGFAER4AooIKjuFe+Mo8fWSyb+YsBIcoNq
 p2scLsFCtIhQuK97jS2U+CfvrIArFsk=
X-Proofpoint-GUID: wUEeDgwDfSNpVRXgRADKvAgvBUbEISOv
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa56f1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iQrKqlqNRm4S_ViRXwQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wUEeDgwDfSNpVRXgRADKvAgvBUbEISOv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMyBTYWx0ZWRfX8ILeKwRVPEsn
 HvfidcUUJxhugVAFrykZ9ZfRtcTqt/55P0FnJ0zo9iCJTMwsYJgJhSoxWSu9OpONLvBPTWNpsNt
 e9G36nakNkd6INOuWP4am7uFVKXAkHxgNakbxTP+qGFZmPgt28RiXXrgOoIxY1AXvVL7xpIl2+s
 MXFx97yMwKUuwW5dFTENjndFo6yPXDipteTi2h2CAhyb77RkpRTOod1d8aULvT+39ZRvOU4pvMc
 1N38Zx82IpV2PXqD0zopAImkGL8PLTFhXg/I4c+7YtOmMrfMAVchEeXdsTp3noKi+I7juQN62Zo
 e3ciWcd9hidiyhUDpa/aiEnNI1trSnIhdKdUtO8qVhkbSz/DxpLKSTC6vQILO+/9CSdG4ZSJrz3
 BztYWNJUCHLu+y3/DcxEQbYkFfMBr184L3lcp57buRry2LxdKu3dl7kZJMWEhYqKkmgDaMfLcrT
 zCpxyKWl6xIfVQuVXOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120223

On 26-09-11 22:20:39, Shawn Guo wrote:
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.
> 
> Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
> pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
> the controller is wired on this board, to USB_0, so a single
> usb-c-connector is described and port B is left out. USB_0 is configured
> for OTG with usb-role-switch and its HS and SS endpoints are linked to
> the dwc3 HS endpoint and the QMP combo PHY SS output.
> 
> USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
> 3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
> peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
> additionally supplied by a fixed 1.2 V rail.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
