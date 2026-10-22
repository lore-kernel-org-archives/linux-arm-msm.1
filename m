Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656375;
	b=mstUNQHj1YuQOacQ7eRxjUPQE/k3AZvrFz4ZhPXn0RXI7LDvkfJmtj52Tx6D0aLCh2JE
	 T7wwMs5Fj3qyQStTKYyoqwqxWtbwBwDqc1wN7P/p7EgBqm8Sgm3HR917wtaGrQPF34tbr
	 RkMsdtlDFa8+qW9eGhZsfLNmmHjKFVK7VjYgJJ15X5FcjqPFFXe89mFHsDIspIKJglEQh
	 ludURtuMATNjF+1U3Uj4voWow1+Mq/MKYvvsF9vsq6fYu59M1u+eW+Ei6xlg7g9nKFN71
	 R1qHPRRe3ZIbnZG7Oh5F2K3NKBRYyyn/KQqMHfUMADMF3b/EbqxxQn3p1L/qS3maA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
	b=qqdpqSTn1OqmkzXu0SB8uymteLgcdn7Jm1KwOrzVPHQCS/bJx/gC5etlPiAmFviqBH5h
	 mKE8lYKkENYenNBYOgKQNAxh2448PGJIbrn1FoxNHWUvxBYstD/pSd5jwzn/tDvSQi7rd
	 9jBm1FfaFzkeUFCWW0QMmaaDrgu0BFvinryO0hYfV2tlueKmprNx2JZ2fTtPcmRhPzOjV
	 aS11vBtQ+0HTOX4NwruOKKt4sYiDR3Nz6Lp0M3nZ8MpLWvWhvI11oS2Sz/PfgUiZYquW3
	 RZNTOaRSsVDORaUVesCnMQSGMkdhk4dQ26kTOhmNv0K0AVYQCz/nUwSLpmP/u1pVndg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Jyv/BejD";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537AB606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 537AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLUPZfA8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jyv/BejD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M709la4136782
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=; b=WLUPZfA8tRU+Ta4N
	Kjoa0tMB6NuojI2IfQxeCs2fnrqRH0GFmVxi44ALBlByDbHjIU8RRjVq7MQNUxMc
	3YNsIo/Uyza/fELUlZ0THDwT3146BSatc+pT7ivTuJLFwzH02PQ/s2uLGo3JOo10
	4kuR+LmjAIrF1MS3YGE92Ogygw+NAyVntECCqnJ1sY8cZWMCR2XEn66V54x/epGq
	AG9y/0ncZ+W/a12mEq5R1P8nWPEKyLjI56KMUVrxcG9YH8xKpC7Y2GjMXXMdWB5c
	GbHecWt5Nju/8DgADrWHeAFZm4bN8imXOJko8KXyA1MMSWaaKaisbPiWMvxFpvhk
	FuG/TQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9c4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5362ce9df1eso2427011cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656374; x=1793261174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=Jyv/BejDRmW0+2vjM7Ry+OLdCM+J59lXuUn+vkcBOKzlPseOIZ1IMi+3D1j/GJ/FGd
         E4c2A3z52gn1/i7xBxsnL8eK5NSQI46RoixJDemLDF3jC73+KKIDorlA5aE2wzqbtTXV
         4qU/1zMhKd8bmBWnc0aMiHY5S+QdCro/5yjqb8RhHqovhjdMQcc2Zl9pilMllwxPw0BQ
         ve9yEkVp6Wy411ZFiAq6VrfL7SKWuSeop2Hu8/MGVtc3Q4rs2DCAsJouzHYo2d9t8BLc
         DEh7qougSsumaFTKWPD16s0T18v35HdZRjpe+pfQkV1QVqth+usZtDDMERgmwasCf+3Y
         w68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656374; x=1793261174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5J6DhuH9IdSf6ZO4Ortn3BYsgngNujA77v38ksPuUu0=;
        b=VoGUm5z2mNyA+ujc20TiZrMceECAJPz3S9d4Dz5FUYLnlcKJL/+p6dw7U4wM9gcOZ8
         wMfHg18uq5FYHlnYho6ThbeqgkTEiShwZzJFVgzkXwJj2u9AknXPbso/MBwt67iLStPA
         akjmTaGEE02oJbJDyzhsHIxd604MZw9MpoWIdXfx1UeJqCCb6s1zxwu5uZW9/Z/ywyO3
         P0gYZtoyfgSXUE+JqxnsKeSDHbkYo+bcFT0JkiIXIXKCjg7eYrs8zMmFN0VzjKFuPVdi
         JX+HcWTGiJZ8Rc3UcQHpjTub5XclMnsn2tXM6xy7WGhGfPFQZufY6nyjqJy5KuVYrfuk
         al6g==
X-Gm-Message-State: AFq9FYKrubUlBGApPavSlOPRNlwWgLUnGfTtb3FRInKPGfnsljpI5sVu
	+SYgNpgehNUuk0/HmgnQqWR11x9fRGbXcsfYCuYiTiuQ63vNFSUWMQjd1r8fSkOMwm8U9RylBUH
	ztsysgvpN/6tYhzx8D8R1uz8GzuO+q+mboEpVMHjA2xnyXUZUx6oa6n9DwrviNRxQ+so+
X-Gm-Gg: AYBFou1D6H0CITqfGlPecAZSkqCWtFRzj6tAa+F21P6mgtUcafaGvwm0cS6UkexWBgt
	0mVfmVws3Qqs2EEjisH3gE2o8PothnpzGI/wxIzyTuER8/001ySdsPQVOb/ESy8yvq7zVQeIiRm
	8a9TgNjBzv33hWju2r+YgfguvgZFADAQAJIUvNCfY0juU8TSrNrB9OIr+rTrWMJP/PnNO6bbTea
	knpkJTHTgY3vYDVeCjct24JGlWFSSMbyE/yAt7X47gLXOw7FLH06cYQooynsfe4ONOe2PlxuJ9k
	81WsCFsr6WNEIuVUlYxVMDd4NJa8P1/Z2x8WdKx6e2FixCmZYcv7YXZTCrqITRqU1AvH62kyLGz
	HefSCVkGBWlLdWi6RKEE3Ng==
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85543001cf.3.1792656373381;
        Thu, 22 Oct 2026 01:06:13 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:536:662:3776 with SMTP id d75a77b69052e-5369b857ce9mr85542531cf.3.1792656372807;
        Thu, 22 Oct 2026 01:06:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59a14csm78770466b.49.2026.10.22.01.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:11 -0700 (PDT)
Message-ID: <af0cf1d5-3b0e-4534-8a85-e373834e2f0d@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:09 +0200
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
Subject: Re: [PATCH 2/6] arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-2-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX36s1ZtBNVgrF
 p/ShqAc+qi40e8wSnujXVTnBbiVkmfcJlwbRgC3QALVJgKzp2olNyo15S5oEigg6EBUF/HlW+pj
 Ns/2iDXR0qJseakh9UOsDt5ZKqp3WEY=
X-Proofpoint-ORIG-GUID: 1Bb-a_g_ideFp0AIb_v8wi2fLDfW3EYZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX4mnQ5Jyt7/VR
 NTFEjP0oVWwR+RiPlQ0XBKnubTcn0uzzzldFUppKebtCCSpbgrAE0tMZyuExh9245o4RDR+W/Ce
 XPI7UcYaRehxqJSM5255k+f0tn2YpAk3N9TZ1JsqyXIdvwL20eAlgI5gt6ehZuSWlT61YY/nnR9
 UqAkBUZwjDcpa0KmoIPaRHHQW0Hne6I+nc1GzwqV67TjWtm1VkPnzyxYusvu+cqXWG6nlTvKEpP
 mved69s+S0+1FO2pe32GNUUJfDrMfoxKlux4vKLx0ZM/PBfUWmpvBrHlGfo+AeVVHU/vHVlV9L2
 ISBhZeX1l9AOsDIJ4X/XQC+0RBcYhfW6W1+CUmzZFtN1xK+pw+PZsXLjWAWXaGmXKxGgkN9+5Sf
 YZ75U3x/OGb2t9QPcXbSOfIWVlxwkOejuI5KMzfCYgwBPNpmJiSy8xrUCkYbwNmIRMARRwTjxgy
 wiZ40lvWdTbiDeTvYyA==
X-Proofpoint-GUID: 1Bb-a_g_ideFp0AIb_v8wi2fLDfW3EYZ
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9c3f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay for Talos Lyra EVK, to enable DLC0697 panel when
> DLC daughter card connected to DSI0_B2B on carrier card.

[...]

> +&{/} {
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
> +		default-on;

This is a little strange, doesn't it come on as the panel unblanks?

Otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
