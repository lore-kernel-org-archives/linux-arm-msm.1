Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127539479B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784519455; cv=none; b=JYA6LcZPWZUNz8iV8gEn6+EawrupChSxhXQsyFEtf3+1C3xoBK7ax+LLxk9P1uAhwBxB13HWRhcKMaDRcjkhQUuqgGtQLhS7ukwUNPwDRbARg0iyaTZoD8xmcOTPcx0IOyYfULNOKI0jFu9RRz6KqmksuOa3zT43a0Axu8IXcJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784519455; c=relaxed/simple;
	bh=2Q+og9Tbc0K18QB0ZLGzs5EKuV8uOOtvFWg9AxLudTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9/LVHgnTYqivUtOQVJ4Gdpg61IBM8DFRCwvHmi/+wqveRzkKFeNaI/SDpBuSb47yMhhtlUrtJoEwHnwemwa7zeFT8Y7TVOrhWqPCTSrOvOIWGMzRCGwgnw01TSX+0/F70dD2Pyqf8Aa0iGc0VHHNOVA0xfkgC3C6pQkXM7RRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tk6wqwfA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DVnTbgD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tk6wqwfA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DVnTbgD1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtTxr903096
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=drSBLyaUlss041oIjJxgO6MY
	uszKdPpVF4T5uKusopo=; b=Tk6wqwfATjId61nrg6agbAJ07MCll0RBswh5LSnn
	cpSz4lQilr/xnB87wcRtr36ZZEcriMYLw3RnILsIqEVeyduo7l2aKgYUWrkaZBh3
	mCH71EWJNNtWJIvKn6ln5u6h0s1uHCf11RsXmuTBAWva8wFavWSs/WC7eoJvvIbz
	6XrNY2g6oSaAi5gsdMBCw5gyAyqiJK4Pixe60iJF+8fw245ka0hfk1Jj03X6gyck
	fhddG6zlWX2Gl4Ab2TOuay+KsUn/6dJTjSfnziT0IdEizaz6I0W9tyZMPUTZ0sMb
	i54icfnAWlIF0F8S+iVlPmxLSrez+bTSxFVoLtyBBaspYg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnm7np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:50:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so6859857a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784519452; x=1785124252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drSBLyaUlss041oIjJxgO6MYuszKdPpVF4T5uKusopo=;
        b=DVnTbgD13xBfG+yaewfG/E1FxINXVDbRFZ2ePvWfvM8OrKchjRrifJJZirhtPpLRtX
         EK5AKVniJ3LsN40qLSurwXckfIFdzOwdIYAKFhYYRmVYUi8DMaW0PWG9lD44iPwSPs4U
         4dHPBImLIvf32EHkgHaEieLGMkXQtDmdyFRaquNOFhvDkUT31fEEzcUYP6UNdGVfNRmn
         9U4dp92Oed1Lu/xPZRiIkA02iYL4mvPZa/C9qdpeNtPqLvtPN58vSIL0DuxM4OWGzHIE
         jUiQfEPlcEM8EZ6xrdqXNZjjuz8SxNe5dR1Rdh9cPzDWtkA4a+SG4B6jLNC+qHz0QY7u
         QhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784519452; x=1785124252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drSBLyaUlss041oIjJxgO6MYuszKdPpVF4T5uKusopo=;
        b=Y8zyKOe8bZsnuBKd6d4RfH3OG63O29v9bZLSbJ4OsoldizMQTEsgjzNUw2zcDJoFpH
         iwYw8N2+0hZCorQ7FzR7dch4B1YoqrBeV8jCDwVNKbUhDcYjqfdQLKB6gN5lY2zZosOU
         BaJvqjDsqho7t2Qp88j2MA6StfOQ/i6sUuNnZs+bCcqnfzU91tpjVprOVbytKtYh+ZJ3
         Q0v8C1G7fAuVzPJrgJiHohb38XM5zM30knagw4aCEXTG2cjBk6oNiQ/fRQx8dldzzMfn
         5JADiNxelzGd9fOlKI84lXDDNQ8XXqFp9/cKuF3xoR7nqQuOMu3TwyU2CVoaWwgcbAqz
         Zd4w==
X-Forwarded-Encrypted: i=1; AHgh+RqMJsWFIX8qUGxPTp0AItSvpT3KMSyUDptuG5JfP6wZdsiVdfdbVcZFDB+VyBcu8ntB3iNBG8O/HLBRUFCT@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq7LQrhbwxxR6iBhc969nBqxrmbphEzsDt4p1RZvFPxhC3R6Ts
	ApKNvotnmxeyTijNWbp9whkssvMUwGmGuEEcwXeTfdLL2ykha+CmrZpwrqqb72933eFAwNG45vn
	AOsWqmaDUIG9Wpxm6fLtqGW30ULs3Clq2iDYSKjIw7ABb9jjV7eFxzMwaRPFinlDAr1Qh
X-Gm-Gg: AfdE7cmtX1SUyz4nO+fa+2jCRC0nD6P4rE5A4yAs81m4vfrL9iyrrUD6WyfNs5arZmU
	HzB81e6n1/ntitYXFV1hlZw8o8QvfDfBQbRrsesFwsdEZ+xjdoIEdQfzMP/cNKbaWN9Gvp5TJNc
	rGpoyRuQOeJHM8MHsEK+nNB05mQL2bpyAboc05hofNNQOal70OFeGtvcvp0blfpKNr9yoTXwFo8
	oLcQK4+AgvMDlMzEakwW5D21LlZsf+zT1VivUB4D8qcpGuHMWcMJ4mo6DRgaU6ZTcRfQgEzx8Uz
	ELHApZQMCF+FdH7BRF9NocQRH4CvtjgjY7h+YtwI/W8ysGID1uxiC0mJhUy7XePmM/3PmtFVgr2
	+Wr3ts/RruMjUuGr9VxCikfHZ+sjiDimY9MI+qdbMCzE=
X-Received: by 2002:a05:6a21:7d06:b0:3c0:9c19:65a2 with SMTP id adf61e73a8af0-3c3ada9e2c6mr13283301637.74.1784519452497;
        Sun, 19 Jul 2026 20:50:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3c0:9c19:65a2 with SMTP id adf61e73a8af0-3c3ada9e2c6mr13283271637.74.1784519452039;
        Sun, 19 Jul 2026 20:50:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm30639871eec.28.2026.07.19.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:50:51 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:50:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
Message-ID: <al2bFpZcsiZpt0vH@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716142605.2398433-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfX2zeHqRCyiyS9
 ouQuatnFDQlKY+/H+ooRX3eUG1MCgaPiaCMKX04u/NwOkp/OufVcqSuw2rJBtQm/xixmA9rNXFG
 Wtk9g5eAMgafL6bouz5zSffrx5IkUnMy9eTZWieKNIIgYLiEpF4boENK8z5hOzJxfnSNq/2zNDs
 wcwFG8CZ8V/okm/n/5I26LlIequ3vB9y4Eqz5TAVZRFpX/9GnYEqkGvnr168OKDjKEulQr5EF15
 +af1VzpEA4YFZizkFZpGzhRJf7+uvoE/cwsOFaSiWkHZOJbmaPscHiA5d75+5mbBzekzr/JWVRw
 O5LxfFCh8VEjshtHUYpQ44pTzkly6ghKgFk0s0EN9YxEqEEBLIPHIxrw9oinids8bR6x2LJ7+2v
 Wz0TfkFzPZNQDSrAtlM+wGC6WBV6989G155DaT2U3QlO5aTrLWT2RVCTPFHQKm7Xy8eoGIb/xdL
 BxRUkfZO2c1uuoWM6NA==
X-Proofpoint-ORIG-GUID: rOeOioNbM9OnR3z6wh9tJ4E6NzKnN9CL
X-Proofpoint-GUID: rOeOioNbM9OnR3z6wh9tJ4E6NzKnN9CL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNyBTYWx0ZWRfX/Zgus4W1iLCV
 f2n2zXYsEvjLF3hp3jV01soc5MaN9TEqQ9oheBqLGw4SUiQEU2h+IOglXTaJ51lqOFihNkP7+A5
 vAF2mfJjAPK16liruwtbD7YOmNDcgWI=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5d9b1d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nighCxVWtA0h0ZIh7bYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200037

On Thu, Jul 16, 2026 at 10:25:58PM +0800, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> the operating system. Add a separate dtsi file extending the existing
> top-level nord.dtsi with nodes representing these peripherals as well as
> describing how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1726 +++++++++++++++++++
>  1 file changed, 1726 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 000000000000..1ec32c2f2308
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -0,0 +1,1726 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,nord-gcc.h>
> +#include <dt-bindings/clock/qcom,nord-negcc.h>
> +#include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +#include <dt-bindings/clock/qcom,nord-segcc.h>
> +#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +#include "nord.dtsi"
> +
> +/ {
> +	clk_virt: interconnect-clk-virt {
> +		compatible = "qcom,nord-clk-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +
> +	mc_virt: interconnect-mc-virt {
> +		compatible = "qcom,nord-mc-virt";
> +		#interconnect-cells = <2>;
> +		qcom,bcm-voters = <&apps_bcm_voter>;
> +	};
> +};
> +
> +&crypto {
> +	interconnects = <&aggre1_noc_tile MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
> +			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +	interconnect-names = "memory";
> +
> +	status = "enabled";

Oops! This should be "okay". Will fix.

Shawn

> +};

