Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795506;
	b=3P4qTm0BaZG0BLeNRE18e2423gDIdCICBPtBGsICI5Diiw1oqNsE8ptKsAi6ZsNJhtUa
	 pqjdqQKNierW7/10XBfwBU8sAexM0DFrSsoxAyJDzIYh2YFp74/vcIXdHlw8u1fs0y+yQ
	 Jpo7PZsDqbl29IrLQy4jZHpdsvxOeFpA1nMrwkYyGGUt3T74gpRc3sAa6OHxIxLaN0LG6
	 HUUiDuknnlP5b3UzTdgnSepG3FCvQSP20pSXJCTQi5WLt41jXxQICkBJzlBhnAgHT2cTN
	 Zbyu99QIRGda0acCQtLSJ3ZWk1IyujpAKc/G4j2pksIhHrSkhmKAkVM3ewxAHiV0xnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
	b=ILn5HgfNwTKqmOXo94DTTwY7wTr7+azd9q9jvM/b7TWApqo+/ffV+FCk4OkGPlDV9oek
	 JEecvM2DD2Gzfy1Dal6gUjwb99Ec7lBJfSDTA3RI6Xm0d3LZXpDfNqDQhhaOgzYH4k9UT
	 uf/qOhpXSTkwwCLkbukItnKE3ju/QgL4abhpBfisybCNHJpJZTnZKuBb7AB2DuFqonSDK
	 FwHCUYs40TioBjGAC0xAsIaD/K4QQBoc4v8r982DAl5tkwD4BMlJgYEsyfC9JNbLNKdcv
	 8nhUatEuB30KrZlYZ2Jux0w2fkIFS7Ae/m4oywGj20dc1bDXYVvl2JZd+qjj2OrNKfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oh+/gIkJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E637606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E637606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh+/gIkJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZo2l739132
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=; b=dK6LpR7AFtsbeFf+
	pRbP3a65/RSfyMrV7sEWkjXVmlyFSwPYC3KG61yqkxRWGe871n3QNtt4jAOEdm2T
	CXtt+2SIY1vwaaYMbQAPvvjvTr6e9zY/YeHdRCXN27ZcPrpJhMnOf8A44HCejBk8
	3tbtA1fjqf9k87+UK4Q0Ty4EuCpXMXjXBwfsJTXH7ct9UAG/MvSe6k9yQxzXx3IA
	cRfseUmvUX9GDl/YwY18g5vBhg7SfpdEshtczwPJVbeoumu4fV5MBLKrtsXNjzvh
	5AvgtXvGIG1vPv60vCx2+t3LHNbx3mavUBsWXaw5bxprY0iRr1I7cg7PWPvfUBXp
	wZpGxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163h00h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:31:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso971397a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795485; x=1794400285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=Oh+/gIkJYfp5u6JJGxFG9ABoy6UQSK0mjJs7n02E/idXjvy0k0j6TLmA2VUIQf35Lz
         cBmn/1QsiOBqn28Xa9URIcFSXQiGd0UUwQa6DFa67UZDJV/e8pT8I3saGjy22PTzRTJJ
         glnoo3kQdTpjP/uZU93zrR/0jzEubZxvqiKQCLoMxPy9Lww9MYOZWuHmCVoSBhIKjG7h
         gIsbWddSC65Ue2gIM05ZC0y4J5L/fuVUbWE3DjtH1TuLXd//F3oghHDZMYWcUejKLJrm
         K6kc3m6s4Nn7yEN6d3gbuSp2z0ZQhgu606qxqIaujNwrsA5IeUlfsZlSPojCNEG07nkC
         tGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795485; x=1794400285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=Rkiyad6OBAm3AXgPbcryfMps0aPlSEHEPA2F/6alUvHYUnFWcUX5VlZyNnqtZ5IvqZ
         wYNT8ziJs5QqkZKk45gLsq6fT6j7ky/6jYFaUFeSClpiZboBTOBWFwev03uV558Yu/oY
         EfURwn7XpjbU55Sdbs3cABJYUPosCWMCbK+A1Id6iJ76Ye77c1LiIxKpvZpcCZrpVw2O
         AuV/edzKKWFk6f7s+aTlP9bxe11FzNJmAHQjYKYoT8zaEzdlBJg9qI7c6yd9kGGodDWu
         eoGfUlGeTdUcit6h3DkS+uJwOG900qRv+5/R3nZkVMkGr1shdp4hJU8+AkeakeqK5+JZ
         2KtA==
X-Forwarded-Encrypted: i=1; AKwUvBz9iB5kp4SwHargdaxysU3okmDjgDz0KiSOBhCVB9VVHkUX3lynazvgXxP9FGOR2oaMc3ucls8fC38SNSHh@vger.kernel.org
X-Gm-Message-State: APuU4Z9y9/GxPgLHbzi4wDJyEbOqjMdmOCHUbwFEp8CYPkkZ360crCwm
	FwP3VJ5sKwF1ynQMgvkWY/dZQtbrmJBoT8LbqDaDGJZDnITIkX7TYymZqUpMZiFXgtqBKL4U6cs
	lcSyorv0j+Kd4M1mq3xm/UwJQdeaWXWNjXCKc7ZkDUnmmkIvFlzh2CmsaL3KoKmw5ElBGJKupxZ
	uH
X-Gm-Gg: AYBFou2cay6Z+NBn5it6z/OviDIK2H1edRidiJg15hOaQvYIjLFyuYI4ad6d+jqbl8m
	gGyCx4/q2geNJ3bdRKN9oG2RXp6atyPFlaGZlNBtaw65L9KosE4FMTptnMJDfH1s8CPOMnCtiJw
	11MWwOem4FNc10nLxQdHfpfzumKIYdZlxxse53U7IZkwP9nrf8UpPsPugj8osX7jtkd9tzFVii1
	Q9yuIABgwxkeLbhrri7mUKd1rXojCnKbHlAHzgEv+sdHkKvxDFZ3kSSKumRLXQV9uhYO4HiCXA1
	cohAYj46Cvn6QemDEma+zoe9SIqXbP6I6iyp1ZBIWU/1GmImghVFoVBhZZ4d8W9A7jLDZzra2od
	fEVdh3azT5DR4QVOYzBShJSefCDzoY58sNYvWMsNS9Giuuv4HWB8vSnUCRoCqZk2ORGwzTr7ymE
	F53Sif
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667826a91.20.1793795484721;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667780a91.20.1793795484065;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm9423184a91.0.2026.11.04.04.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:31:23 -0800 (PST)
Message-ID: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:01:15 +0530
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
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VrdIbgEvfKFTLMkLZ_HFdSMahaS6iNbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX+NxTy+GXKfUd
 nnUPEGS1fRMBgdkIAygf1vyxkpT7gSE+YkcA6Z2OsCiWRkA4i4+At9o4FFYWiwajY2QsI7cpez+
 fNrw2U3BNf+td6xP+z+OuTo0NgIxszQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX2mN6iMxiox28
 G4j7CDODVuANajeZDpuxCstaY1TdPwT1tR3gPPAme14kh8F6ncDz/bt5BMs9wSnnjp2G9pYoyjO
 dIRzG7wl7tSSmLSwZmUu0kePXTo+8g1TppDYpJco265oxwjt/S7z9vXbcLrYF8L7Erz3A/N6ANj
 lPWEKyOsral7E+TaNoNe8Lgnr0wsJdwSvbeKjWjBQ37mnSiL7yMa2ZtBuWBObPX7tL3W/rvGGVV
 SSPMT7ZevSbaavJ2Z27TfN5b172v80y7QL2Mwd2A4hVHRMwFZ6+zwQcuZ0bIyzM95AGlVPvM8lf
 eqFwFjkxrg3VBFZpdjNrfOsijRf8s+7o4fjKBYCDCnKtYmXcJkrCfW2Eu15wmnuxKGI9ucTVIzz
 gb1hN7KlvXiuD3FAYkyFRm0dK+144vTyBAnu4CAqTSG0a5s6zDkhOJKbodq8II0TRV5OokNKon5
 nf4I1wlJSIYU1gjSW0A==
X-Proofpoint-GUID: VrdIbgEvfKFTLMkLZ_HFdSMahaS6iNbd
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb259d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=rw-enEzn-TZYpfUHzgEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Apologies for the additional email. I missed including the cover letter 
with this series.

Please ignore this series without the cover letter. I have resent the 
complete series with the cover letter included.

Sorry for the inconvenience.

On 11/4/2026 4:46 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm GENI-based I3C controller.
> 
> The controller supports I3C SDR transfers in mixed-bus mode with both I2C
> and I3C target devices present on the same bus. The binding describes the
> I3C controller instance along with its associated In-Band Interrupt (IBI)
> controller used for handling I3C target IBI events.
> 
> Document the required resources, interrupts, clocks, and dependencies
> needed to represent the hardware in device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..bab89aeee23f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) block
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    items:
> +      - description: SE (Serial Engine) register address space
> +      - description: IBI controller (IBI_C) register address space
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  interrupts:
> +    items:
> +      - description: Core Serial Engine (SE) IRQ
> +      - description: IBI controller (IBI_C) manager IRQ
> +      - description: IBI controller (IBI_C) GPII IRQ
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "qup-core", "qup-config", "qup-memory";
> +        pinctrl-0 = <&qup_i3c1_data_clk>;
> +        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
> +        pinctrl-names = "default", "sleep";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...

