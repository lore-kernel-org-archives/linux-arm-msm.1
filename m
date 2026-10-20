Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486570;
	b=zoUeHBUPpeFmYrIe6cX/qM3qSNftcV7fqhC8aRDVAWCM+T8azFdkjh9yyyT8qfcb1G19
	 LO3WuIo9DIh2MHeifoPOn+L4B2RSYJrsHGg+43mldckwXCN7vRZuok65zfBGGzCdlBB4E
	 wqHPZyq+Hu5b3XcDF/opqnCj6p5FLYvnsQgPk1HkQC9WEBKFf4Iggk+fszN687MC872d/
	 ttNDPHIlF8e7/ERMbReVapx8T9RA+HCq/XPZNeSmVaaaeM4jPN+8NB1qFy9fX9sda+5nr
	 Uqs5bxDpGBPScX5PoccbrOzkI1F0Airb+LmLxzIRRgnNvr28QiOdAqb8i58x9peY8uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
	b=q4nIIuqyrMKETQQkJ7hG6b8xWKTphq+Lzh2siyWF4jdEy7wHGHesCDeYIftTnjmbWF+p
	 txLMVKRNaZwP0dQK5oGeL75N0Fgz+dWdnhB/PLJ99Hy3yuS/l8TE72Q4Frnhn3Ua+MfL9
	 cQrEAe1Cjn/l10/LFjx+dMzK0Wa5rCE38EYisIxazkdnf4T+5tdqvRXQW/B+C7t8PNcGT
	 4+4Ntmhw/aVb01dfWBEapHS6WfUGeXtPdagun7Mkvchl5NW+/086m8ue9JsyjczQWcrBC
	 Zse6Q+6nY4cRAxE9f88fo7JqnfMmA+Gdk3bTnnpVZTqa9AiplU4WXYeT2IeiLBFe6sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NS1qD1mL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB16606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB16606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Lo5VQHS7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NS1qD1mL
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8VBoP4178291
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=; b=Lo5VQHS70Mh5HY8s
	Y/wjJAyjJOogyBWSRcFAyz6KvtlqhUbvg+LBH9HXG1blFEMCv8OWoOpQwMbBnQLP
	x7BBD4x8SSucQtiQHkTDnmm849QqM2M72XhOiymGaCzOHnQHyztCFNzUjGprdRMi
	lB9TDDI34c+jdpCsV5vvbqDSnSQe6Gf/aLjbibe5Crn77SqqPvn4i3gyw3QJXqP3
	/iTIsbIUeDOjGA9hZgjU7nI0kHHhtvF5bMicu2CzGn9AlZXAUWw+kdA/orai2QZS
	tgvwDZL/yac0PVSJA99MxQkhSaNzC+B3sBV8wjxNRncGKJryOk768qdy9R4Qsn/f
	TxVX2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1qcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:56:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9179ef12a03so14148626d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792486567; x=1793091367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=NS1qD1mLRXkM5awcvZUTvyTo4D88ci2V2ilXTZls2tnlSoQl7OgsiGjrIv7TM0j3Jo
         GsVD4kGcVNnZJ143iNLqcBGEP70XeW/jKlRTvJh3jes2MRyMhnq3Cl7peiUL2kl0JeBm
         MiDmhwyNTlr8EUIsPxGbu3Mr1iqJ/PqHj63g4iukLzcB8/MgnMoZd6mvPgeCkXykXSHl
         knnmyDFjt0ABoBJUk456i3lILbXxiO6TMYWmTM19gUpn1BXMamVDDWZr9sZKkxLiB7o4
         qRZTP/63BV5czUGCFFUhQlCKYC2hWu6W8mJYr+g6R9rMsv+HClAcYQk5XGQxkFLGe/0x
         /Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486567; x=1793091367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BR1IwiAnPDQuLNombG0qRfBEZEt9D0S3/JVBy9369T0=;
        b=jP/bDKZCHr8/Fde0MMOtFY7/Vu1bMEsM8dlzgmeHFleDzEhmv37LzhlSp9ImhH4Bxh
         NVD5pHyYxhlVzwwMa9QgC8aGtfzeOn6PTTLTRNs55i2W6r84X4BQe1I4mjTZ001rUcHO
         umWMx8nkaXzl7hJku4csMAwILuGkys5tbcwWv3VPFbUm/K1uVLsrpzy6am6hputSyW0n
         DaxlnudaiqtlwgLTsuddamEr713lqcBUan0A/lFsEILB2E10KQfTFdnGhH3TTvLwWq9+
         Eg42jKFZDRItz/+xmfyTPPBM9qYv+OhevJ9W/+gxoy7IBR+yL0R1v/XEWqMFAr1nnL1N
         Dd7g==
X-Gm-Message-State: AFq9FYJLX1nF+z1A8aws/pE+ZW3GFvKLl8f6FBLBTeLC7mT6K/SmyjZz
	zjK8kgft36Ya63UL43JzxukWhB6GnHHj0jO1huzS+MilpcSCXMaxIDlWsnTTXSONMdJWWVA0e+O
	KLaEpALpguHI/PTRyBr6auN8vb4qWFIcjFSf3MOKJRHlXfQaJDjsdtUz3iktSl2lM0jcW
X-Gm-Gg: AYBFou2eLxUbEgxuZVwQkClSac+yVF2qeM6mbv1PPSxgwzbCIsqayGzW5fxWj7lCN2H
	MSUwhYhavwlS/AbW15+hBodiY9BsTUQrqW8LF+5qpeGGnhHaa8RjefjfJ9QZD4IS2pEP/eUneOO
	E6UIHp6X0C7HRJsSUEPIpbXTVQLwzAhEs/fEbElDVp1mi1Lxyb/IXSktJ5SDBmflH4L8ZaZiX/f
	rgwcHcfdpP7TFESKnGDrzxivmW6jexnL6IxfqSR1Am6Y5Qo9JbBBNS+WJoWGPX2VjByqo3v7TFY
	6UNsPusooafEkgavHGMKa3zmJDxITA70JpHi4d7+saYyxSh/BuyJMHyGrG/sV+TXTaU+Fom1146
	LZCs3+VoQSA1oTRTBzCKaYQ==
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975801cf.4.1792486567621;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:536:79aa:de1b with SMTP id d75a77b69052e-53679aae196mr67975511cf.4.1792486567117;
        Tue, 20 Oct 2026 01:56:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919bd6besm458394566b.56.2026.10.20.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:56:06 -0700 (PDT)
Message-ID: <58297c07-c94a-4a02-aecb-e0807c432a51@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:56:04 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020-ifc6560-adv-v3-0-5da1a33fdcbd@oss.qualcomm.com>
 <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-ifc6560-adv-v3-1-5da1a33fdcbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _Avb34LQGgtrv4dU7pf_u1LWCvyCd2SL
X-Proofpoint-ORIG-GUID: _Avb34LQGgtrv4dU7pf_u1LWCvyCd2SL
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad72ca8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gQ1mbmYKsGZDk89HBR4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfXyTvBeXHUL9vB
 U6uEigYFv4dHM0b3YdwkId2DYA2BqCLTJx7uDp3oAbEke+yiFXE+ODbkOGa9K0BK/jR91bKBuqy
 HMdUI0LTL6a/Q5Y4LjZEd2pnWeLOGWNdWV9O5hTbafena/c6/InhxQ7YA/arsBWvjJHm+zXVEmU
 vW6OpaRUvr27Uo2W05d+B1zId7/uVNA9wWAHT8CxwdV6aDvkjPb34kslvHhcjSj5qj6Gg1xOtR+
 S4d0J3v87393++CT20erLfuI/CzLiM959l4DA0DuHvx5QvdGWM2PnWjihSafI1dNwbqP/f225E+
 SArqza+S3OrZg+aucBtlniULr/jCvEG+h1InPn8wtFzIQBSHfKn3JWMx5Vl+xCxRrIIoGHo1EF/
 XmqiP7cZO0Tr8LZ/nIQTxbaSuydga5Q3reaK/W0Ufebs4FVktJeebGVRLwvTgKa7PVFYsN2kDQ0
 N5LVmkqbuCChn4Yne1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX/EQkiqhSJvf9
 3EvDNsian+SNAHx0mEnVTSHdLb75Yb3UyaA3IzsInLNtJ/2Ues/aUFJ8l3IfrYrceoiN6ntdvfe
 JLrXLvrqOI896+q0iV/a6lfw99drOD0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200035

On 10/20/26 10:44 AM, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line, HDMI_INT_N, is wired to GPIO11 of the PM660,
> not of the PM660L. PM660L GPIO11 is LPKs_CTRL, an output which the
> bootloader drives high, so gpiochip_lock_as_irq() refuses to turn it
> into an interrupt and requesting the interrupt fails.
> 
> Point the interrupt at the PM660 GPIO.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
