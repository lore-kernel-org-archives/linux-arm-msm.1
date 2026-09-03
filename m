Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1A43E48B
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433635; cv=none; b=U2+hQMjoRfT4LFV9uX21eFTjHPITUMwhltTqO8za9qaFztCsGvH/0nLspTjAFBeeroxtnIr7V6Xh/SP4P0hT7fHhndHklwn2Jp9fuLOSDjmKH7X7V+2nywpt7aBjWnZYJVgMTvViROOelHs2cZDBT33KCAUOkWrLrwdVkPUsMnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433635; c=relaxed/simple;
	bh=NafIAQ81wpuFc5oV6yH6QTWWdlTU+hZVW0S+P7GkiA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPoBEbBGKyZlt6NSMMFB7nwdwagz9QvSQYzZUyfhmj+4RGhOFi91O9zZRgZryrJ5934KMqLY+J9cc1G4NJJhDc+VG94gfABRH2PJRdE0eEKu6lDjUNlYFMPDrr+ooGE8sJFXNvokBPgrnq9qK5oNkJP6JQ5EXq0ZqP00giyFNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EidnkHMA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM54NA5y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EidnkHMA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM54NA5y"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AwTHc749067
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=; b=EidnkHMAPsdB4QP7
	FkR0lQ64bL/aHq3EYituSzKiEPWAmOhFkgiwYR2MY+6IEx8VYQ1UunvOTFH5IfCn
	Oin+LTAQ3rzTUBqbSWIXgyMLDW0x/zCyCNtntkncfPNy1YFpiJmMcQoudkjz1sNk
	eO21JBxbfgsbgXyKnBYdMz8xcn8xPqmvwOQqkR8S7pO9ygyTRCp6udW+Tq8WaJ7D
	vQd+qwW5sIqaOqsq+YoMWhxrhA1I5X1PasntOLh7zCPxz3eS0HRcE8oFRwk7Xz3Y
	uvaVCLmWKgO2ODYHYz7dUGR3To3qcE3W9UsdvyRfuHDfRhhpeP/e/wsf3sY/Y3qx
	rYi48Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4hesf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:07:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-789eb1bdd79so86128137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433631; x=1789038431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=RM54NA5y8PLSsc7i9Hmd5DlxrUBITtpRGSeeKf/6BgZlEs8Sr5jrQomAjI4bBag0I/
         wCWHY9uBQLf66eUqVxwoChPVG/9zk5V2+5VNpTl4vD5LmRa6fqyLA6HNsrl4uT7isU1Q
         4iL25OIaiC/rqkFfyfb1W6mCU0WA/lggpUryLiKlALXlYh1Trtd858QdruV5KipSTTF8
         lgxCL6U4PECt7O7SVijfKK7WiHz7e9ImtDdfSDTCwYcscYJZVvLwKw3dqQPgmSXtfixp
         2TLILnsyVYOlpHg91eLpUFvoHGpwMJyBrZEfnGk9jKAc6OR8nlyW6P/EaVP+qLUXcNOX
         V52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433631; x=1789038431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fIpSBKc7MRCRPHbtt20r1Axt6vCl6+OJnyJy0IXMvxY=;
        b=fbXrEi0Fi+MXcGjKleLoX8ppFRUbcxYmUD1DhGE1uMrQNV6IPl16IGz2LqgiAlyfYC
         M+aIScxFdW6tEYF120lBXmzaE1y3mBEQ8exur9gVSOFpjq0zoutDYjnmwWngwfaFJgqF
         lPrcF895/ModF8bRBapLzj01wRT3eMyVjU9vthyOj7tCRVJHGetGrkKLWvTyZE0yAnzR
         bbqvKwYkBz4rHTCfxPJBthd29lyLN/G8erkzZ0mim+Z2uPJ+2gniZckWdFRzB7cCUORW
         H+Hl09ydreypKNLepACbwME1P9syFGTLsJm0tHmL0sz0CXCh/nQE1ZDspVQI+7ZcuVMI
         zNhA==
X-Gm-Message-State: AFuF++kgc1l4wMzWe6Hwq3FzUeOUQYA04EWfjBjUXNr0nj0HD5IGsGfS
	ztrXL3hB/XUeODxye5x75sptOVDQcLK/+yw+f4h+aNUAvd1ORhpK9j2vYRml7iw0QPIlrEqizin
	OQd1SClTXDVAGhEeW7FOqlMtmLUAee1ROFz+1p6jydLWOlkp8DF9dQhB2CCnRck66guhI
X-Gm-Gg: AYBFou0cWTxXkMf/ToNWJwka37LbnIBacg3IkkhxpwFSOcs0hJb7U2lXiZfKnUVGSFr
	7pPlCty7NEw82uh+Qz0fii+p23D4ehpTbglobBFQXACskWFLnCmoDsJ+6RRjJT/lk5K/RUAPz66
	MgbXbNkYyQJgCjhJ0hTsYMCbbxhwN252ijiLHlP2FvIFTbA1yoMb/cHvW2cLubI6A3wx5yHWPXB
	jYNcoGBrCiCoZl1OxdSvXctdxDc5nE64kKAtaEYZeCquMKP9xEM8vpI6LOSdIMQzuo18jFlx6OX
	WQ/tQGVwB/RX1Hl8Xh/k/Zsx9wd3CurodmaoXFshsj4kuRNafhdEXze6M6bT3nupFienn6zq1fD
	PgSDWBvvcLqIRPQMv+nbEkA==
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639228137.0.1788433630335;
        Thu, 03 Sep 2026 04:07:10 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:789:3f43:6458 with SMTP id ada2fe7eead31-78a1f255064mr1639203137.0.1788433629819;
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm83877466b.25.2026.09.03.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:07:09 -0700 (PDT)
Message-ID: <04faafd4-037d-40d2-a79d-6d128b194692@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:07:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a9954df cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=OHs8NuuX1ptjo3lIKY8A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 3GJ8cCf1HFOHIgy2J65wcsENU1Wd73lR
X-Proofpoint-ORIG-GUID: 3GJ8cCf1HFOHIgy2J65wcsENU1Wd73lR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX7D9UAFucYzUz
 NEwj5XqWYW9eILVZFBAriP1BCixSjMmvCX9sfB7VW7/w2oaWHk1cfuCYyahHU2do79J/6D7rM8w
 gK85f7x69CEhqxaOjkGM7z91k6utXwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX13zv36yafCDI
 e1mNO/tZUbzFzC74gqffcBGJ7AA/h82+SJY33VSzqyUvfetngqVfNm0J/fCoOc/O+Jvwks5VZx2
 NN0j6zrTbMuvi3zrMbKhrYuostO+xah8u779qb0f5C3vmU6A/VOd8PX9Xe24jfGz7jkCPD9ii5y
 WZnN5ErqPQ8B6ROdqTl5AwTo/IvDFzETbcOXXxAL7Kwq6tW10TpMrBR2yBO/jAlVYgR+KZwVcDI
 ukdFOo77n2h3ZDCgcRncu+IrcH8Zj6wus1IojrRHv7ymsWmftIzzbunMouotIYdvcTkxeEcMJM+
 KJC6Jkm+ZOBBNq55FqJY8Dn3dAlad56kRc80N5qMctKObJlc7paR8VvzeZCoAK7MmKTRhwpQdLP
 J5mrUpQzdQYiqcmC68TSNM+ZsqoERhTpySlFaV1+Jx2eONCCdAs7MZuCmw3pBJTwkeIbn+TkLEe
 DjvSmoG+FV68qEE7CEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

GPT found the following:

> +		tlmm: pinctrl@f000000 {
> +			compatible = "qcom,kuno-tlmm";
> +			reg = <0x0f000000 0x400000>;
> +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&tlmm 0 0 110>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;

This needs wakeup-parent = <&pdc>;

Konrad
