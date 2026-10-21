Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578776;
	b=zMMAvfuYEZLm0oeW1lLHXDMYH5GfMoRnZHCRrcxhRafdLOIU0vKoJ/I8K0At68URxSas
	 namHuRbo25qZcEFsk3HKrH/kQL44teLndzAPkbdzv9UNNySJPzR+z2naD295sZH3cTBCk
	 El/fAP+JD7HzrP+5pUAqrT0w7Jywd60aeaHTD1BCFe4Gszqz4EHM13ghaxIdKbf93nXlv
	 hbGk9Yvyz+cDVwy4OhATIM6ITFpycP3cF2TOc5MRazIiYPcbgiLxKrjYHWq7ldqYRvy3R
	 IygdeC3Syg7SoO61sjxTl7hXh6jA3V8y+hJ395BMfqYsyZuhR8FUbhXov92LiZnZYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
	b=FSSrOpgWCK1TWQfZywc6/paQZ+q6N3YFS5u9+tATsINrZ8a31BxKdgdi4mieXLf874LJ
	 IT2RiXA8nrDUwEFxCCoWTfmJDYxJK61kvdGDW4U2/RNc/aPu4YTEQ0rzNeuxOtZs9hSnu
	 aU/hmvaeV02cWmHkfHHVahGKu+24Xph1f57h7gJUC6ravaRshaU0LzGJXGJvLHf9Bvxg+
	 ycg3du0HXf29JzUFZT28R1849wePl/FdF/c5Qdc1dr+qJdvqfCtLPGQJsJ0RxIo4yBWHP
	 DTX+db2Da9Q42ee7NcY4RrZVB1D/G1SMuF+L5Dxxwhmcgz26sIy+9IB+yqtxPAe+uiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CcYiz/xE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3F606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+Do3Tvz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CcYiz/xE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5f8v1356961
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=; b=J+Do3TvzRelo31wG
	CSr1OmhSqWh/F+mnq2lljzRjUJBo+QLUwOcYHmOKO1+d8QewmJIkURQt6WcQZNO8
	pSOPqI6aZx1XLJZNQ8mmNTIQgfyf61vLsIjRtpL6WklgQQ49P2Scy56Elvldss8T
	DbAUeWWsNxKQ5JVS4gfHBxffUZrHah9cgq8uDafvCIQYQ4ZEAyxnpAIU9d4Fsao7
	yKIeqEoPHSGSVi1A8JlhNdM/4kFXoVZQy0BIY//Bg9/huurKwx6CqUEXqNmBo862
	Lz8RFPvi1YiDoD46lykzngEClSoojubMSEx4wyVVUY9egnYVW1vJ2PXcgKWYyU5+
	Tq0bnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4uf63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:32:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so16571385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578769; x=1793183569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=CcYiz/xE4UWL6WMi6+A3sb0rwRrZqNsqMRNqKPDPW5tY0MK0X0f6N33XqIcHts1KPz
         mqWLCyJ9Wlva4Z3pN0kc1yxiIJTJPGr33ZYfiCCyQtowBZeaihFjyKUcLmmd7tL1vwgF
         OisKcE4lMAWHC6kR6MBM5hzAybn7fLTncRHbO1gRKrmxhTKQWYcmMFFKbqfIFAfh4ZPi
         H8FgLJjY52bY4GdrecPJZGqcWlLGDGJPJO9OD4it7xHCg+QNYnVub/xNw784hR42TW09
         M2dKFEMo8yJ7v394JbkdrRH4aAx6LTiQOoyZPE/0vf/1S9pAp/v1nLXwD3xRYrdzD/2x
         ntog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578769; x=1793183569;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bN1/D5gJcuLuG/BXpkvhkO5R37Gw7h7tdNN2YmaIlgA=;
        b=kNtWLZ4OaCj5bP7hT5tUC9GGvMoEcXouNlc197QghPsu2YC9cmsxe5Ef+Ac4gkzhb1
         vuzyZpsNJK7A1ccECRRStDSF8TdrSXM4lfEs467XUkgLueFHDF1E49LvRfQq2+8/IDiz
         c8jf8UzpYoZGaxVoWtTGVYXXDx8A812BK9fsG7lfYTcdGLU9dBIrIjKX9gqBjZXONKMT
         1qnSlLiE7YYu5C4bbll4dyJ4lJBDT4NPAQ+zIwpdWbO5txmrTAe4JtzrTX/g/f1NN+tu
         klPmi7wtR93ZKIC73+TtkYbkF4OxeL0PbQTDq6d8yt/mqO4YxAoKc1pkjgfb55O8o3+9
         siIA==
X-Forwarded-Encrypted: i=1; AKwUvBw/T+jpdt3Vn8s3R2p0blMZ/SHblGbOitghUs98hQMlXWdxWelulhGUHIxzRTTREm+UJITcvBSMy4dAAfU2@vger.kernel.org
X-Gm-Message-State: AFq9FYLggZKkCI08Xwx9XuYLIWX2z8xjr2wiv1eFKDhxZ8rSHbMSgg26
	+KFxLWbAw9+VGLOCMOvHqpxnTsqptZTSYVbHf3xVwymGn4qogBnsLskoAdt8GZ74uOtcrgQok28
	jITtdjMheBk1ZOfcnGgpzYxf/gVHLOQR/OkPBeWppDMjTs1uVZSiDdmJcB3jBHy6RX4nk
X-Gm-Gg: AYBFou0QrhrSmSStvpGVIXc2TFuyn3nkKoW1rbYYmG9kGXBwRMCpfQXh8SEwir0nmT5
	mQ0PcWY6R7tBz4nlR9oagiX+dA004fufewAxUkDZLzAUnxpLeR7z3fAzzmqg7mlHaS9ZEd1Y5QQ
	/TI4wbC9BscrJHKx27JlVEn5WKOKSK0i/OGbpJv7nC8DHPiAJlPZZLe4CnbBaUwm1mZ1kFvXfjy
	Ns22F3CZ2coaQ0tKnmOgHtOyKjXJqkSxq9YRo/Fn7IYZscAsVwTs/39JdblJt5KS3yn5grCGX+A
	gVLRTwbZkBBi+SIPCi/e0bULEVW4Q4tsa9TmGVCGUoXpbd+RJFS6a5ptREvC656B2osnO8X/ADv
	9C3duA8UnGevCLWClFb118Q==
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410246085a.4.1792578768907;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f57f5510emr410242285a.4.1792578768327;
        Wed, 21 Oct 2026 03:32:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4031306f7sm671030a12.25.2026.10.21.03.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:32:47 -0700 (PDT)
Message-ID: <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:32:45 +0200
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
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZO3s0njL3vfFuwYXDitmg2lBx-FVF4bG
X-Proofpoint-GUID: ZO3s0njL3vfFuwYXDitmg2lBx-FVF4bG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX56AgIBFCJ4t3
 gZciehHLdBqiW5rqonGxeTHlrCdl7hUdOzyy39+oNVLupm42nrFQPM5xD0Obo+35cu7xetwooM3
 RTz+Bpy3s7ikEDneNy/6b8psndJCQiA=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad894d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=ApGinhq3U5Fw_ERVFb8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX67TBWN7Eb9Uk
 6R8URudF6SQ4Q4FlwfIwFdM/rRQIX5m/IVBuThMCxoL+4b9i7w/cHRnwNAEgADnI6HTKr7oYIj6
 3trHYwz4qIlbS4DylFdtPikrjbBp2NguL2JVA6CKgGTOlTuMAxskqDMUZydk+hSaTqQsgxgikC+
 a2SzSgnCNQ63u2Y2cwidObVI9QF1+B0tbwQJ0mo2U+tTvqfFcZ7nHXsIGjgD0l/juQZWt4qQMw2
 e/FoA2KLiZIperuupkQ9Iue39pcKQ1dSD3Zvlbz2H7sdblm+DXrIeZq0XZFAovArm794UK7GinT
 5q9gMtsyU48UUlxHSNf/Vet2KsXI/WpwzZwRpnSobz9I2NzXQPxzJgtP4tkzNSAaOhLbdPMornJ
 L88QD+r2N+TVWdacTWVyxPLXxuJI68kCnoaJh7DNTVeioXH7m4penTTtD5Y17NdW3YLbXhGhEms
 TTq468MjNCLkB1Coy8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 10/16/26 5:53 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the Warsaw board identity, reference clocks, PM8550/PMK8550
> devices, key wiring and inherited debug UART route. Describe the board
> from the SoC and PMIC includes instead of inheriting all MTP devices.

[...]

> +	model = "Xiaomi Warsaw";

Google suggests that's "REDMI K90 Ultra", we usually put marketing
names in the model field

[...]

> +&qupv3_1 {
> +	status = "okay";
> +};
> +
> +&uart7 {
> +	status = "okay";
> +};

This node (and apps_rsc below) is out of alphabetical sorting order,
please touch that up:

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

> +
> +&tlmm {
> +	/* GPIOs reserved by the Warsaw firmware. */
> +	gpio-reserved-ranges = <36 4>, <48 4>, <74 1>;

Do we know what they correspond do? It's commongly NFC eSE, FP
scanner etc. If you do, please add a comment like the one in
glymur-crd.dtsi

[...]

> +&spmi_bus {
> +	#address-cells = <2>;
> +	#size-cells = <0>;
> +
> +	pmic@7 {

#include "pmih0108-kaanapali.dtsi" instead

[...]

> +&usb {
> +	phys = <&usb_hsphy>;
> +	phy-names = "usb2-phy";
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";

No SuperSpeed / DP altmode on this one?

Konrad
