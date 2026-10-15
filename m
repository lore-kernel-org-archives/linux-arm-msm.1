Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF42522693
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070388; cv=none; b=MSNBIW6onGIwmutM4g8YNdmcyXfzGSW3YZ+S+CRo8pnZYp6GYoGf12MhoJd15RkQydQntpnEXeCmLwF3sTG60gA2QSljKG8rxVPKWfijaP2VcuXxvqcrwxqFmEqNysf9dwn2MKVHP1o4/2G0qOqggfR1F5w53JWlplbm8sI6tTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070388; c=relaxed/simple;
	bh=RDe74eVfgS9VFxKC1KN3CSsr84zByOWGT1x9UeN3eqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DktL5SRh0e35FgiXDCMEzmpYLBNyCXErAma5rj5jaiDDK4UjoWHSxu7wrYVfyHnGI172x5PCqWEKkVp2/Z5QMrsVz2Mn/488me+kO/thZdKNSIC+84R3C4Vm3WtJzDlFN2H2UfJglFUnBoXClAzdtxeg9Xkl9qpJjTa8TnJzloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK37WhFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clI2geWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK37WhFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clI2geWA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZ9L2966413
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=; b=YK37WhFYez6KC7fM
	PNCUHu6WheJEzVE5fuCj5PtVPs2q7i4zEgavRZiTEtceDDVtnOwTHWXZToVUOFgm
	HtEk7sMLkSQtBLoPZ8lKfu/a+mDhnR6oHD9gU+WX3rkghQRma+o9rws0l+Qybicl
	VWDDwX0rbckhemfZjEClxPY4ou4YmNLUfBzzdPUjO+grp/0M7mXZ4OnpwnVJ0abD
	kh/j4Ugu5zDLXh4X0J5kzOCiNQ/2nlpL1NEZEnVJLBpAQ/H+MK2m5LHqu/2bC+2h
	dJF1L5lOXL1Gg6hYI8nxiga802mWC65M6GtQYDklPl1nNnkNmIhvIDCPj4cGyChS
	SazUZw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wv7ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:19:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so12473376d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070385; x=1792675185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=;
        b=clI2geWAtPb3yh20T9FIiJdwPTvXXFGGUsMyCjvZSsxJVy1gMUKmvHTvyomRwLjSTp
         7uQ/2AuT17M0nmJAzJJ0WV/409jsdqkKYNBauYbkAwwpuy7PoTi4pI8iE53Cimt3rT6b
         QOvoivbqDHRS+PJSZuSVjni47UMm1UGy1Q9tq+0bQBSxomegEwzgRcWhNqfyG/iEG+p7
         Q1wlKND8mW1LSq7Q1x5SUtRtlwhOMXe4t38QyyK0UPSH7bDVgW57uVns2fLNZxUoxwhd
         vJWbPfbiU784miXu3ZcwHax/NYIqi/WTnYFWh+za5ZHDXHw3L1VW5glnD1JE0g+8jeMQ
         +/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070385; x=1792675185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=;
        b=U7fa5cbqadIwDqR3p/7oRb7XPpC2PiyoSudB+kq091L6+IiPIvps47Gt3IGdOnSii7
         iEegtswApH5lFipA2D7U3YT2q7MZGbvFpjJpLsWPZSXpnkpCHgmZisf1Fb7aiUFTzOMm
         8eobYpwTjTB9/jEVkxjP9OAcUvQDeOX3STJaaxNp93F318Tyogs1y/XOubJW+/OZQ5M6
         RGZEnBCoUVDlUlwtDGzOlKHfAzf/7ki3Eyc3oHobVnwdX/tbCWTituS4UM9pXhCQCine
         foPOolTOSOvFGBeWxJjtgREnGPgJ6fsYChV8ufFWhQU2DRR2sPjeU7j9iIvlNoHEFoFd
         8lbg==
X-Forwarded-Encrypted: i=1; AKwUvBwWIPYKlwGKW9ZlAFIAnrV1nULgIaHZrifMpxkMYMt8txFGEVvNePnkG1y9KBpsukSUryrwWU7tht8iq769@vger.kernel.org
X-Gm-Message-State: AFq9FYJcJf9Y/YzzAwGG5UBDbfm2LAWVByXKx7vyMJIECITSZImCoDJi
	FrzRiiq175bplBSo+o2YcE3PTz6aCqTPpe7GJvUUpamzOy6QDKDLirLVREZaOSCvF46P/YayHL8
	zSTQkLwPmhcVpNvxnMla424vG+oYNBb8nJEhzfTKBY6WgEsGXneLNFwhyYJdABiKRx5jh
X-Gm-Gg: AYBFou0V9CiWKU6SqvqYEjEPa/bx5Twn/xS5sfd1on+NMIFn/7vJ+Zns5sj1Zkpkuzg
	BuEnlg/e4zgTTb1mA4cYXPdjsxIKxUqi1qrWA8bwJcWsHVR3Mmpoh4b02H/jN45H9mj3tbU6LKw
	ouU1G8A0iWxopQaEIeeavOuy7pwqox6AT5rqLDw26gV6rMJSTQEEGx6lhk7nN1MLLqS/jyWkFuc
	g0zB0B4m20RLhflVBnN2O8WD4N3dqmkNb7eQA0xlhEfN3hC6f6/sJRjlqXFJf2+5t5DdGslY5ae
	C1KNfarPUEH+QGoiBl+YMcP8BuWbouH6eNU0F8DXezJnhRaO535IFepqKxlMowYPzHllLD37vBU
	4dG9Exyv4aUSVD3LEOVXVEQ==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr3268314685a.3.1792070385234;
        Thu, 15 Oct 2026 06:19:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr3268309085a.3.1792070384714;
        Thu, 15 Oct 2026 06:19:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab0ee85sm123388266b.80.2026.10.15.06.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:19:43 -0700 (PDT)
Message-ID: <4c83e787-b5e6-4394-88a8-4a2fa4ab8d1a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:19:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C
 support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX/RjIX9BEdnIW
 TKhjmtreaBhxHytMSBiJpEYVQ3RTTw5w647Ds4mRWTazLdua+9saGKv9bJSC9UugMPoBUAvTq5r
 NnSQ5V5xZXRaA1XghF8kcWE3qDcbQMo=
X-Proofpoint-ORIG-GUID: k-McP2L2TbT7mSkc6afaJVYfq_EaDKDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX6qu9LZOS45AR
 yECM4XGFvyq0RoYL779MhWjoS4JjZGfkt1kqMxoHrCK6ulej/Ros5h+N/lTeu24U3fZAR4HVVC7
 tMDg6sLNyxdZW7Ux8S3DFrBFaD94vH8rGv20p536F4phEMF52esaWILbOTCF/uDzitGPt9YKTcY
 5CX/lIJeYN+aa/7tRbJRlo0jVfNib15VBHIVZxq0JLk4lEPTe/Rs2Qe9XF56lx6ZqW/M8a3sLVq
 dJLBMuI9synkTanLfYmNPl96k1t6G09Ec1OZ5vdqP8WSTp4lNFqceB6PFVdqUeADFarDB3UkoRU
 hsFTsczgNGmwWEiWNlBmLdDwRjRFwCNSeINQXaFHX1bi6yQVzNjU843KdnqcGNyA/7Y3IXUWgci
 Rj4TY43Rn4GKbMJ4JpoxAAe13zOnpkikAQr70opZyGsz29Db7SyKjGsHNHEugdwpG+piz1kVP3T
 2nmXA0Hu0aqr+yCSlmw==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0d2f2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ac72dwBaO6wsPz63ng8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: k-McP2L2TbT7mSkc6afaJVYfq_EaDKDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053

On 10/12/26 3:11 PM, Akash Kumar wrote:
> Add support for the Cypress CYPD6129 dual Type-C PD controller on the
> Talos Lyra EVK.
> 
> Enable the controller on I2C5 at address 0x40, configure its GPIO86
> interrupt and wakeup support, and describe both USB Type-C connectors.
> Connect the connectors to USB1 and USB2 through USB role-switch
> remote-endpoint links.
> 
> Configure both USB controllers in OTG mode with usb-role-switch support
> so that the CYPD6129 controller can manage their USB data roles.
> 
> USB1 is routed to the daughter-card board-to-board connector. Add a
> fixed USB1 VBUS regulator controlled by PM8150 GPIO10 to provide and
> control VBUS for the USB port on the daughter card. Configure the
> corresponding PM8150 GPIO pinctrl state and keep the regulator enabled
> for the board configuration.
> 
> Add the TLMM GPIO64 VBUS boost enable as a GPIO hog. This enables the
> 5 V boost converter required to generate the VBUS supply for the USB
> daughter-card connector. The boost converter output is set to 5 V by
> the feedback network consisting of R2403 and R2401:
> 
>     VOUT = 0.6 * (1 + R2403 / R2401)
>          = 0.6 * (1 + 75K / 10K)
>          = 5 V
> 
> The changes also add the I2C5 alias, CYPD6129 pinctrl configuration,
> wakeup-source properties, USB endpoint connections, and the required
> VBUS power-control GPIO descriptions.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 119 +++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
> ---
> base-commit: b7e62b4d28bc0d2f16f03904616da78e4478aa88
> change-id: 20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb5
> base commit link: https://lore.kernel.org/all/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com/
> 
> Link to Driver and DT-Binding change: https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

This depends on both the driver+dt change *and* the missing base
DT, making this effectively unmergeable. Please either send the
changes together or refrain from sending them until that's possible

Konrad
