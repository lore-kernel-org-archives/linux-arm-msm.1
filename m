Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167742;
	b=CbNsDMGioADax4s4j4nCVZ4A7wbDmdgdN96FpjGSiVB4FGIJ/kUbkMYhVhcLkk+c793i
	 dfKP2jLxuaOOP2eqoqg6uhMN+zgw/5omc0KJfCgjhdi5N+NbR6FHyDT7apRgumMV1fMga
	 6Qw+0m+mX3euUSy06xTc3czBoebxo8+ybZrSGnpDn0PgfNRSzy4ppgF8tc4uGm//aCxQi
	 8bzNz7K4lNU2O6nanPIX2Kg4KsKkKpfahvWFq9hvRrVsO3tvePVtod7aPGA3eAjeSiuSW
	 /zc0Igjcicdx7TbAWiDniD4IPok0AdxUCkjDXP5F0vo3uIa0WI67V+iV4YvtA5FTurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167742;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
	b=1l9IwZu8csE7ixuQt3V7AdDgfxdDO1oVYaaDcQDtQJcmSiSpGpm7Gz9VrtIZRdm6hwIL
	 0VrGSGUuMY2xITtDHykvJStaDBCQlE+ZC4vV8gA3OgrBLJODBK66nF8vO+rEcgFj6p+vh
	 IpUCCxA7ty5ppm/5STTPu0pXMDQdbHOftYATEREXmyXeYkuBiUPD6AEYnIV6SSkJF3VyC
	 nqNp8nXmrChkeuXwixJzLOQsPfr03sf7mfRQSe/DDTedTtC8vtnHAst/+/b+rETyWGlo3
	 xbfOJ3jCo50vsrVoMkcZDEazqr56ez/O3kFCjCfON8n40vQ/CcJ7pXoGbnMNNpw4FAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DEC606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUGJ588060
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uauo5EdXcDHHpx/dkq/cusNt
	5B6yHqZfuqoNAuipezU=; b=cOuO7GasIJQDmxJW6aX7tgMxZlEkZ1xq2eVbeLBB
	wxfIcm9jEyr2Qwv/wJ5bAxlJjEXvUhAN7x4Ub8wruvzLUq25a9jeDZaKoFadl3ur
	jaa7zXEpnUNFtDOweaskDDqvtMsGsB9AaWq9LHdo0tIjmfE3/s/yv/L1/kXextN7
	G8YUJS6lIRuMmi+LE9+ioRO1Ndo+hI2ewQShh1E7EtgtMk+ChlgHpdhj9P4F8Ku/
	b5+TMt04d9cDmpQ7yYrvb1ex1P0FUVWUIFzUtdy575jHFHScf2lZlIwU+Ja8jFd8
	IVt0JdtQh694kjn6feVAxQd/1lXQIzG7VSe3t75Azujpng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk2qe1scv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea63087d79so5389965ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793167730; x=1793772530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=GMEiLgWUVTzX2VJeEFMlscx4BH0YhGPJspTJvFKgB1tmzxqfdv2C8r1N29KqRzaWQs
         Js5e/+2J2c1BycTcOOr6hYbwgU8lli9129xe3mqRchuEK3l3VSPKuVlfAC2epJ396TIf
         BZTVK2szNZjZxA7Rrd5j4YAeZ2O1VcUpD/8BeCL/wc4vPtmu2ySSccPLXsmAJzkY90oW
         avzuLN89MhsE9qcN3Idq3p4xX9CGDVJboaPrnywXXAPQq5ng+Fawz2C1JwuBwmMuv/px
         VZ4EbvZIC9AJ2uKvBIRS/9Qq355KZ37YncmXVvCybzHhVBiu0b7JKXW7xBgJ0gZD5hxb
         q6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167730; x=1793772530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=Hh54fFwg4ux6hKpZsTXdpd7toyFYBKgpWj60qTOVF6qjwJaIw/kSoWwrWj5krXQXRB
         GeHcV3xCPB/uQmihvCE64rt3UFcgFiNFMe4ujlT+cT2j9/RTrOW/r3UadD/RCVyoRmNt
         Ymi2KGCQq2TbzjSDF5UV5f8dvPRVAwOdaV6L9mbrppQVdQ/2QS78qrfN64lRQsJfvixt
         VxjQkzMjIWlAcF8HVW2+hxKkG4IJAd49kLZtneSx74UplcwS9A+wxyXBHc9HEST3jTi2
         NFYr/8i/LhASypT6NmlNSM5WQUkWL6qN3beu2BH1rd250mUrDXu9CsVZPzvjQi6vruyM
         wF0w==
X-Forwarded-Encrypted: i=1; AKwUvBwAy6tfYwLhDTScypkZ/FDUJkATOUY1THDP3DDN/4aW2K9T0C3GM38u6SykfWFeKf1qTpgNK+qlPvx02ZSS@vger.kernel.org
X-Gm-Message-State: AFq9FYIMJ7x1ezK85CHBx3Xg82Z0j9WO5s1o0SICBEqIgL/Smgs6WOBb
	8Lfx+1boDM0O1IdbPkkTU6y3IAqSKkr2qdWcLu9SkWSAH0Kex0OpfwQg7CBr5ikzDNUYSiUDIIp
	XBoE6c5pHYwPZXWa+Fl5kl0Yw3SgIm8sZzu/YYpT6WrPxZQwfNfibodYTKiOpYYpkymxO
X-Gm-Gg: AYBFou2YZSYBFN27nQEwHONk1OA0nxY3nsU+94p29feicR3LGbjSumgmcgc3fAiadM7
	qPtWc/LznF/ZiKCs9TlmDkLFcJywNxVTnVInHygXkFL5oceap0OgcpA923509X07brXihVGQl97
	pZPo3rkQPnPybJTBbe0WZgvE2Vmq2oJ8Su9CafGTPSOkoa4uVKy7TsVOJqxwf8IGHy5pB/2jI/0
	sLuy/U3m0IT1FV+p3nTKKw8x3V+P2j+KFc4NWdupv3+gBwPuJcGWP9/2c2ChAQjitNCa0BSG+aC
	P7cRXaq8SyVQDXUhJj+Eg9lr1sRQivAvPENdpO1Hnd+E7ygy5vZan4nKO5pWdN8cX2iCrUOIWhL
	wF0xUK8bYz/mMKK4sDjx5qS/WhwIw1L2tzEjshBVHxqz1eXU/aVa/pWzNRiERf4W2ZiyMfTZt41
	9K8fhc
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183185ad.31.1793167730168;
        Tue, 27 Oct 2026 23:08:50 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183035ad.31.1793167729742;
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm17410795ad.30.2026.10.27.23.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:38:41 +0530
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
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
Message-ID: <auGRabyU1mLKsgNG@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
 <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
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
In-Reply-To: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
X-Proofpoint-GUID: 2pcSM3dv3y97bDmd9hXV_-K-zAI6IkPO
X-Authority-Analysis: v=2.4 cv=YuGa1IYX c=1 sm=1 tr=0 ts=6ae19173 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX+T/d1pbQbnjd
 a9rf+rJvGJq5s2Csg3I+otVu7udjVNiwN2/Krh0lknFFU+daWnvsUQZMCagQdLCxoeTaFMRjhwY
 KxIdNYsSwtt0/AQmSDEii9S0QEymYlA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXzXI3YbPMJwut
 7qynxufOTTN7R9UgnvPlP/B/RPIf1fIdW/4XFoJ5bleVuLnydJpGRCqvgRXMjG1Fpf5SCYtt9xV
 bNGwX+mw8aBfkzbLs++INXK8PIoavRkTv/hXP5PqrDOeLqW4ZctJuhibREGzv4y5dNTw0uYq05Y
 5QGCH/ZtRZwbpqppsC7OJ4lCNS438WCQ7y8n9daJvIAOqBdZHUrgLh/RWzs/J3T79qDdvWoQjmZ
 nHivi6cnHzK7cQJRRb9JreR1SKM/BZA/BxqUblzmxyHPhaVoo5DWCLBZvsiMQcf/A9Jsgw0O3Ek
 1rq4WRMvKUwr6HQpuDCgHFmMUEI2bvU/nMbTtJdfTA6yyCKz3hoGzcyzR/iankYCX/VkBhcIbfW
 XkexVJefibL0BWZGyJeAZF1aNri8K05g6RiKLdS5jyj2OOwQoaiSQsOqAK3RelHqc6Tbm5IiljT
 W2aPE41ojxT6YoLGd8w==
X-Proofpoint-ORIG-GUID: 2pcSM3dv3y97bDmd9hXV_-K-zAI6IkPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:04:58AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> > default on the Talos Lyra EVK base board DT, to provide HDMI output
> > on the DSI0_B2B connector on the carrier card.
> 
> [...]
> 
> > +	vreg_disp_3p3: regulator-disp-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_disp_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&lcd_bias_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +};
> 
> Stray \n above

we will handle this
 
> Otherwise looks good
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
