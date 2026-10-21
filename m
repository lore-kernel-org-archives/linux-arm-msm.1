Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577925;
	b=Fo3NDpO/IBiIrQau8u0wIp3VKuQjVWZiJswIkU39lJyR/DDgncTg1CTigOHKemrOAuEG
	 d47BmtOImWNWhlf+/Qp95hnmrfHOdVH2T1h33ZJX2FWWb0aSPqxpZiclTDPG33vE/JY5c
	 KMJIIF52rN8FWWS+NwqT1m5HdDvXv9crrpxa7oLs6WQRg0Arud+oCtL21ySyIfF6ip0Si
	 BS6iFQCsDyehaAmXs31z1arKW8SvLpaHBMpL96QD8Rcgtg2Do7fjPU1blStbZ62cB6gji
	 PrseYPPSGvcA3dyP7qlnyq+Yg6a0U7RikvmW84IkSQke4JwW1Heg6pe1BO+CKHV4Vmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
	b=ZyJ2qdQ9H0ee86PBCKcrVio2jwacIldDzEgPapjyMcZsvXbT7QDWM8l75sa+O4Y3MFbD
	 6G1rcMWEtr8jCque1j3/N2o4qpHyJpL7TWqpyn+YaWQ14Ahusk/lMR4VuFonrGeENWnVU
	 Tup0ipw8AR96/w5/3MXUm8Nb62bvg7fW2FrgPGfnJWBBUOT68I1fmNIvdzlxRXKr5KlO5
	 63m+EV82m3cPj+108JCaqpTQKXYfF3az/kvta/Z8NSn9NMRq5nhMsvdWdP3FH4sUmIeL0
	 9IuRqRyz1lDW5Omg1+tG+G057D7oN14LuML4e4k4nef1fA5qGnvoqcdQe4XStbKNd+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kaY/uWAZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4E4606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E4E4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaY/uWAZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6Rg7282256
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=; b=kaY/uWAZc5nGf1ak
	LBzW+e/hUZ09NDFcAvRHt/pNDv6/gpc3SxqwxfzINmDV66rvCQcA3ZtboWumjaf+
	frnLlxOqg1v3dma3fJSYZq+pBNpJiY1Iohw+V08qnTohcW6BkMEPYnGJYVo9xEV5
	SgCW8sF4cUOSq4xb1JF3Bb0P8DyGUpgkQY8tyQHfeiBTKO3eew9NmAlj4A2s33bI
	jRZHq6egkjZi5QXRyZY4+hIEtXf2A7/lQGDdUQJQyC+X8CNo6MOPTfPjD4Nng6Q/
	p+gBze9DVgCox3Q8mTG851LiVOxeYWJr/g+bAewn3c6y/z/9ydIyU2v7dzZRz3ol
	5vxiFw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2he3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:18:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b89618384so1631966d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577923; x=1793182723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=cAVWarRENzPZPMbusMX5PbqL+Wn/W4z3gTWXF9ZCSlEl13t6rCQET+59jli2IRlH3s
         pxHbi8fkz60/k57mAp6UFlSZqpjKsX5B2jmZC2aHSdRKnfMn1+1qI1v+jUN7Mf4Y8erS
         nqQgD8DNSaX+7cmNuUiwsV3DU0nqXIPcubbDURdbpKdkpk6Fdx7xQevKdO+UbJp608yp
         t3JTuo4b7dyPidJs9Tu/ZA6Ob7kCxStyy0Osb/7pmnnwIuLVbfVQ4DMID7FTP/jXNRm6
         MNjrrF77yLgMInwBfOXHelNexrAA0VtEz9XUckq49MmXXuW1EmXFnM9KsdUW1/Sxx0s0
         efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577923; x=1793182723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=IL/xn6ADMV8s3zMOa4RWhmVDOmck39AMPENDScISKSh7w/dVnUAaaJX+NIHkETW3j3
         ii2zIvoF2vSUl5DP4nvDmFL/dahjbJ6vfspdsy8ByiJc3TfxMg5rHeXrz/QMCSQbEsti
         DtrwA4MgaKB+tWFkOl23NsbFbRVNTaE0e7iDnFgebDkuj+6kor01apUL1LWkZkap9djN
         OauH/oXz0cHSZgC13L1afvdWOOy5Q6toIiJ7TPWpvR0M8OshIz3JNxfzB6FqiSfD7KnC
         v95lfJt88fRqJz8Af/S8pBDFmeH4AE/0AwLBqxrRKw5POm9mPkqxbGdYQV2q2xuu61Th
         qiBg==
X-Gm-Message-State: AFq9FYI8JrBNd0Nwq1gCLmjunSksZ0DyiMNH4nDRe/SvTeJoTklf7Jd5
	zQQjL7AIdpa+J5LcOupHRQOQzloQU2v+m1w+CSNt9RukP8Z3iOvHMYow3R5XpeOzR3eO3AmlN1M
	CG66qMe1gyeURK09C4ZR/sbpl5f3mfCmRuSWAdO9Fu0zy1AZ+X70cDv8bUFI1ahCsvMvP
X-Gm-Gg: AYBFou0YjTaCuPaOz26JGYM5PLRK/HpxqyTdgd2f6g+PPo0i/TRMGoFW2Mp1/qAE8LX
	TymltvKrfYZCSqX/cK3UB3QTKAAtkjW4Pa70ErXMSu5SEMeIdQpENW2DNcE8zKRz4OALFtM5PP4
	rf4a3wZA3R1hOxydj7D5fki8QCuSW/4uIIksjj2ElIPGgPMxngE/fgK1vJhW+QhLQ3vhnEHvXcH
	EKftybvzuHOj5qNMDpeeiYlXu+hNwZU3BboGGqE9MfeQcRB1W+bnpIyGPno982O5LPpe7T1qkhW
	l8mBw8D5LiP8mCcZT8VwvVrKXd+xGK0jTFzmKXyc1nvQ1DDNLTMojDky79S6Hgw/AsDVQqz+cwS
	GSvodUFIP2HDAezjdKq6H4w==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370749285a.5.1792577923272;
        Wed, 21 Oct 2026 03:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370746485a.5.1792577922870;
        Wed, 21 Oct 2026 03:18:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790063e6sm61396766b.73.2026.10.21.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:18:41 -0700 (PDT)
Message-ID: <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:18:39 +0200
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad89184 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=cdovKDQ3hRzJwYAqeg8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: TB9Vntn9OJ_2if428BeoQbdaiNlm2D59
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXxVyzAJgmCfu2
 KyqPz63q9rOvneKbDEQ4eBCmHKaXZyveESze/2KyEMv/l6jSnA134l7l/MTy88Niw8IP6bPIgZ7
 drDbgWCy3b6DvzvpPm6eIZWFfCrD7Nm64zKlK25/LVe803XLSKGcAcGHZYJLD7T+rPwyGznkqXp
 2aUQ8wTpBKTwiFoRJJehWKlJyWFTLUVVJ+m0U6Rs5047RlYbp0HDgLsdFr6I1/3oOgBfY/lmDXA
 CV+Lup4mON+YNk6YtrpqZSvjEPIFltNqWxmb/uepDqxAgYmmBilDObfQhY2mMP4+a/0LHWcqA+s
 YNme3SnEH1YxMailCWnBxlzZuYfMYBOnHYqkHvtGMqxA/HVHvuCJP7oyl6teRROTP+TT19svMhI
 I+7PjxqhPwZ/T12OMKj9DA7hldEElHlAl7Gt81DQAMQKw29sxEQOBEpPNGOLIgt/XUu/Wi4VmJQ
 uIgEj40kZt72bjgynoQ==
X-Proofpoint-GUID: TB9Vntn9OJ_2if428BeoQbdaiNlm2D59
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX7nop8J63fl76
 e8WXBJIYhQSsreD8pdX22UTEMrBkBsmIMd0Oge/UbDj2TTo4IWO7Tg4vScrS12TB9SSTdaun6Eo
 PDa/JcMbTxQQ20Nv9C3OToK929QKtMA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 7/27/26 9:07 AM, Yuanjie Yang wrote:
> Add the initial device tree for the HAMOA-IOT-COME platform based on
> the Qualcomm X1E80100 SoC.
> 
> The platform consists of a system-on-module (SoM) mounted on a carrier
> board. The SoM integrates the core system functionality through a SiP
> containing the X1E80100 SoC and its supporting components.
> 
> Hierarchy:
> 
>     Carrier Board
>         -> SoM
>             -> SiP
>                 -> SoC
> 
> The COME SiP hardware is effectively the same as the SoM used on the

"is effectively" or "is"?

[...]

> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};

Does UFS come stuffed on all such SoMs?

> +
> +&usb_1_ss0 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_ss1 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss2 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};

And this sounds like a limitation of the carrier board more than
anything else

Konrad
