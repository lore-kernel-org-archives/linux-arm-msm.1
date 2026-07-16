Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5094E436BD9
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222241; cv=none; b=UVe9dJanUjA9STXUHaWuMzDR1EUvZIwrc940vscWF/EDPGMEnEd4/oHWwad2yInbjPilfGbIGygoTlF/9BmNxKzBmGoWrDkoUPxq2GD/v2Jg/ktc7Lfoqy7p1/npk2+vEWOe+UErAjhlfWLTFSPHp210lkqILXIqPcQ5QwZ1kcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222241; c=relaxed/simple;
	bh=yhjO9foj3wfTz126q4+ORECWPTnHtF0SfAfrvQrOr24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpqBIQxNLlAq1xCLNPRi/mSgYAPE2RDYSR3htZ+/hqvx2jUXe3+gXfkz4t3GTnvgT72qlg09Pkt6J4b/FdHLS64SklQC67DO5nMYtGFnL1eRyoPtUIlCMpnVXwjwYprCYWVIq2sPFl80gQf8MZwCzXV0F/14FK32UB6g6uo1kSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJYngoBn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CI6s7Q3q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJYngoBn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CI6s7Q3q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSixA3387453
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLyka2dGDlxqyY4LBXDQg+Mr3NeguU+JffNAcDddFJ0=; b=dJYngoBnuFcZ5nZW
	RUyQ3eRVKm4KJ43FVH1TQtMskakIkhd/QBMcF3jHQVEuBOh8l7cFzBjxVDePCMFF
	5t9pilhUfyDKDRVRNjdkWLsbGrbr6UFHzVK/Wf4CbOdPrHb8P3Y4YZ/a3mfqmg9o
	Trv2wp2tiR3HHbsBDsUeOaRMvMtESEMsRD+KMqqb2aFaGCUkpJ14COqRaPCLwAad
	HlkMegi6OVzg/ESGWzASpmZ6E2L+NXZzhBA1X32A9MPXZPRn2jXubf0tuIU5FYux
	zxarc9uVM/6/2xem0dQTdzEePYOATgHNC2S3VxSRoMoRMA22omgpPgPab1j+43iw
	HAyWqg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbrp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:17:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so10779971cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784222238; x=1784827038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLyka2dGDlxqyY4LBXDQg+Mr3NeguU+JffNAcDddFJ0=;
        b=CI6s7Q3q4Ch7E6ZC3BofwLLzrsdGf/g4rPnB3rGUay8ptl0M9WJJ3u3Fvm5HeZ+9P9
         zHUvkiNgDF64UY9sut7EwCsciWtuWU2gqHbdQk75t1kqBq0QN6Wr+itwJruAa2dbXkZH
         bj0jcTPkJtyxeGCq529+hCoA+s6BPWv7zd+Dkcs8PmQCYiVf1RDAoZZaT1oJoXamG3zT
         Pk6mstReyntg/rI8JNEKMXoQF81U9F8Hir3/7hmDbRNGUHJRyVRwsXFFzRN7OOHOW8gb
         NuB43bJAIgW5RWM6EpIs4lIWkskElNXz56B7mcPupSEOCSN5fxsIw1cayfQJwvwpVp07
         j2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222238; x=1784827038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLyka2dGDlxqyY4LBXDQg+Mr3NeguU+JffNAcDddFJ0=;
        b=pXVqQcWj7ZCubUVYgJjfNmdyRW7usNaoautTVTYnsO5FDuvfJBTmeQd8MOsnC9EkxK
         QvhhMQPrj2OS4ZZjjlGBkY7ASbRNc64lPZZEes+ZX6JTTdJKHeF9ul0M0+YHSPs3LDXv
         6FTm0xcwfJQsB60NEqdeuK0NCgrbw00pf8k3ebchfXX3Kw3bqL/x6nvO5nazl7RRbAo/
         Y4xA1iDlWIfyGS/w7Ht/vQ7/a5BPRnd2wCqGD/Np5WcE4KvEA/y4OHsBfUefQ0E40xnu
         OoD1fljuIDbnCB0O94noKnZ6soRvjMfdDxPYoEYnViMeIzuuq7IFIBxRSgPn4YcwzZoE
         t5Sg==
X-Forwarded-Encrypted: i=1; AHgh+RpA9HtYuDs/0d0juAE3Rk29bbSEW67gpWj6603iA4Kgm2ckEz64YbH+wmD2dceXJqK+urW4YqWoWZAEHTUn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3JiFjoYmV6mZf/V62CKt4F9aEc/pV5q7vSY+NRfa+m5ITVJU
	Fo0CBNRI2DUd4fkch7M2BL+aMi5mDADgOD12DHGThs7gQqxo+j4Zhda87norGZ8rsgGtIRSD3+e
	ay9a70qjyiMlXWTtvyoZ1dCI0uZw278Mv94VrIBk6HUU5edu0CbDJ05t9K35OcLVAeaCG
X-Gm-Gg: AfdE7clrA6sNUExcRAxDUS5bMbo06ioeMtCp5g6GBLrW27GA1haFzDHRBoCFZkxSWds
	KPj2g5RmFkbk7qsqwF9SdmCRsjlBRQkq1VQRhtSZkcy4eigigIlBg79FWQPWXZOocyZRfw7xM1y
	d78FjnH+H5RvgFUV8ydv3G/5Ea2Gubzl5K1dJtm+h0xNgudrto+oWDJbEpwFEki5JO8SNAfTM1Y
	5Sg+DaIAcfdNSFY9XpLGawIN1IDsvyYv13yRoE4N8lgzWNgpn0MtnDLKd7+cVAxHoZrzJDfxkZB
	21eIYSMMWfuOPTHMpj1Jd5CIcjyFV2Wc45ssm3P0lI6b6ZfZbLCNK8Bjec1kzqyJpS+brABCW5p
	PekvCJB+X679h394WuES/2y8h
X-Received: by 2002:ac8:7f88:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51cbf32f49dmr191490771cf.11.1784222238389;
        Thu, 16 Jul 2026 10:17:18 -0700 (PDT)
X-Received: by 2002:ac8:7f88:0:b0:51a:8c9b:6494 with SMTP id d75a77b69052e-51cbf32f49dmr191490351cf.11.1784222237777;
        Thu, 16 Jul 2026 10:17:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871264c5sm259740166b.2.2026.07.16.10.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:17:16 -0700 (PDT)
Message-ID: <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:17:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-7-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-7-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a59121f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JYDhkS4F_D_NCfCrlLEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 924rx9UKYzcS7cHCdgVxyfhp8BG2Z0ei
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX2dX1AQ/Pbbk2
 /KGbpOaLD4xxt9EG6FXOGyNb8W6qFCDPtyNlvlQxxomh2uMJCG+ApagvjcoH0EqEsPJ/OBvzJYE
 CX3wK7+pW2kvQM0lXmRJgvBc0Mh52gU=
X-Proofpoint-ORIG-GUID: 924rx9UKYzcS7cHCdgVxyfhp8BG2Z0ei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX3t9UTwbRl/WG
 RPrbuRNiVLurwh5jNia+dIf9RkHPC+mV6c2FdLdF/Kbbm/NwGS8c2svHltLpo2XYADMrsbfYapF
 vk4jHa13fAXX3wZsKdYN5FeV2RpslRI43rNsEDy/9+7zzWJebvxDAqGTRLreG5NDbgpj/8RJlfd
 XtCJ0QGs5nibOj2KsIsuRYUqAcjPDgJwtD8tmIsQUpSUZFrdRqsZghylwg1/OiceSWnHqSV6rB+
 aJsvkOtUL8u4t0sP1ecNRTPxYsR+Zc2vOATgZBKIBw+TI0LAnf2te37xIMFfdJjyCCfNbLS81Uw
 snMvAZTeFpE9FWj6mEhi8C+gcDLOxPF9mW/81KKh6YSnR8377lo6e2xRxXzRch2BrRkDNqEWC8i
 UMRM0ECV07cRO/yxu2NovKUzjsxAwW0/QKN6s1PQtW+iQg+B5xDTp7YvfFEL5Smkr1Q2OKx+TY7
 DYLmJUUMAPZFS3t4qPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160176

On 7/16/26 4:26 PM, Shawn Guo wrote:
> Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
> Reference Design) board, which is built on Nord Embedded variant. Enable
> the debug UART, UFS storage, PMICs, I2C and SPI.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */

This comment is very useful

> +	regulators-0 {
> +		compatible = "qcom,pmm8654au-rpmh-regulators";
> +		qcom,pmic-id = "A_E0";
> +
> +		/* LDO Regulators */

This is much less so

[...]

> +		vreg_l7a_1p2: ldo7 {
> +			regulator-name = "vreg_l7a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;

You made a lot of the regulators always-/boot-on - are you sure about
each one of them?

> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;

It's commonplace to restrict regulators to HPM only because not all of
the drivers that should be voting on desired load actually do it. Do
you have any intermittent failures, particularly around PHYs?

[...]


> +&i2c7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";

It's commonplace to add comments like:

/* Type-C controller @ 0x15 */

Otherwise this lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


