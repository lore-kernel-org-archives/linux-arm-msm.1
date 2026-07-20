Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737C3939D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517988; cv=none; b=tCZNyfLn5vzXJkMEfKrRqxS65jqL0kwVFeu71IB7OcCwEJlEFacWU53rlar+ynA5oJu/y/iwAJFn7JIFlJ0mgwCGdtQ+mHeet59YNK7KsgLLDJVxA66N3GaUa/t2LmKMrmjppgOJ3VM6OYVQZe8L90dRvZ0akMS/tT2uPWQKTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517988; c=relaxed/simple;
	bh=dZrI9Z0/1kEfbQCw5ka6+oBIOW2p7xcj0a58s2isDOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEHeFE3R8IFKZYIIuJuZDBSw+UCLa6NbkvDrPQswYzL5ANEqX0K/GVmWj97UlxexPKz6YZMctJktW9UHKvzAzf/Z26eZ6Md+WMrtbywLHwmn8J9KmWJiuiW+DZ36vcUZTvHw8VZI7mn9iX6SXPPD1Gv5VL2RPnqVd8AuJTE6mYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkrS8Kve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBy676Ya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkrS8Kve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBy676Ya"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsbcE912361
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J1/0UtaiBX/1DoCXYvIidJBk
	J2ZdMphY/nvZ/j3Jj90=; b=bkrS8KveYwu3eF9uOHyZAnlesyFMH3FEZNTNBMbr
	7Yd6GuZrTNNNvrPj87hNjLPT9rtKSGBQsepZ8d7SeZMxjvtcuPke7u/SUa+KQJDj
	ZLsRA8AvCBt3ysEHdMcDHGwLPsbs7QGyGD0dHuth9KDyfRp0YuJtagF2WXgj7Eu0
	CdNvN4JQLEKMrcx2yXNUM7yPK0v4/5Up1sTXYliOnFcN340dGGpZludzQ/ovbppG
	VuanEobvFhuZq+2c34HFwz9K7XMhmdPi66P2dP4doLquz5VL7QU/FFZPVdNSIu4R
	ZGiEfpaYEDqUaVWRM7GLLRoS3eKq5z9GltOc5hsoCF4HKQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af44qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:26:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so4925875a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784517984; x=1785122784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1/0UtaiBX/1DoCXYvIidJBkJ2ZdMphY/nvZ/j3Jj90=;
        b=WBy676Yav1GPEvy5lU4N5fV3h5STq2Xq7YnAqS2sYyZ7hY9yrPnh8xqRZ6AUKa/Eib
         HmNUmGH6qPD/I8deF7RiwCOQjOx1C4qhnT+PDNqrCQGw86ef+CKQ9T4vv+37OX0jJA7I
         KFYdHqx4O0HCBtPxpluXq33eIFV5lo0IWxs3anKRqi/oV9/XTK3V28VGsXHDXiT00RFK
         uLXVLC5l7prU+/S7b6v87Z2GiNyXqR1RRWPGaFU8cu9UneKNQ+UPLUMvrMKuJdyoAuiY
         GSd5RZs18pMScbX2D+Vt+b4bOETwW4eS8cvCzsLjJUbhCSXqabfaqG50VqUU6/IM1FT+
         JcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517984; x=1785122784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1/0UtaiBX/1DoCXYvIidJBkJ2ZdMphY/nvZ/j3Jj90=;
        b=bXqNIOsF0c8b+4UXHh301XXdV+nr8IlGsS0FyGHA1X2R62Cz+RHI0j3+HY2hLZQZOc
         aSME2PUlNHe/xl8ALPyFahf66S2zztbPHE4l4kVR6ZrKRpmx+ZJyy2rwM54ITbKJwcea
         dzzLLPZOxBQlyBLFhaiU+RETPN5uq/kfyJR01Qkb1K6pujyj97eg7UrFDxGZlV5jKSHE
         Lk/IcGdOegJtU+LB+6SiiXsbyxhylOT29GwNQiXbviqe8GoEU37YZPO1ZzU+lXhKA+NB
         zyFXk8KDEF843voKrZ/47vtWD/QXAg9l390JPQKue8gChEwUOiZyMK4LDaXx3yVcjmdC
         ILgw==
X-Forwarded-Encrypted: i=1; AHgh+RoWykjflrQM5f3XFijTRpL3jNdiwaqkeLOp9FdGhvB4IRuOat5RaTAdxpfh+OeSBJU7jL0Mprqeqp+5OH6w@vger.kernel.org
X-Gm-Message-State: AOJu0YwXU3M9ZZngy0pD4JbOegirBRZXVNSMd/zc0+RG7km+/QgzNdoT
	dXam5hopGK2xi63iG9dyUA/YY8mtgpbtRPTzx0cZQ7AYqGLH9M+qyhZt17FkbmIqnVSH0mk8cm8
	1evKoSEdQz2nI11y+6kklamIJQFcVuRbxRCzfrcyV8r9aqeO/xoycQshrBSSSfhgUBHcT
X-Gm-Gg: AfdE7cmEwZl2YyedgPuMxY2DyWxAPd3FipdRd0lS/arSs1TK4D6N4guNsEgk+VmdOHV
	/ugkkQ/oCC7yW1yZ3le1sY8vPws8QoCYvn5xt7g9xMfxBww8xXvyMsrw5Y3xif5ApH/zUWTgTb2
	CgKRu8QOJvXJtfx6N9Ct7ooY+e9R4GN+hAP0HRVTa/eVspQoDn0FwuYMu04TS8AkVAPvEOevv4q
	Vtqv9kEdI7mSvn5zGt1aIeKn+JvSw52zwux0OitwI0tzd5KxuAV0ZhN23wuP5PZjT8wyaCXiKim
	AhUiO+nrT2tY5/QrIO4wAnnCoa6nU9YU1W2vVBtUPVmCYNecDFGfG08drngN5yKdMcOPqq+t+9b
	3+BLDQ8V7xS/6lt7TxLoW+Soe7c/JECKGABefRIHRGZ4b+wM=
X-Received: by 2002:a05:6300:95:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c3ad7a2edbmr13286560637.17.1784517984263;
        Sun, 19 Jul 2026 20:26:24 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c3ad7a2edbmr13286516637.17.1784517983711;
        Sun, 19 Jul 2026 20:26:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm24577287c88.9.2026.07.19.20.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:26:23 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:26:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Message-ID: <al2VXQo8rxzD3+gp@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-1-4f9e87a61463@oss.qualcomm.com>
 <20260719-sloppy-cornflower-hippo-8212e2@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-sloppy-cornflower-hippo-8212e2@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfXyELLGtqFsGQH
 2V2OaPc/6a5HdKVYp17QRO6L33Uo9GCB63oNEx3djI7WU/9Vi1qAyDHl8I+tagM61oCNDYNEnfm
 VAChwoqkc0JYIEIl4MbBVnyDxk8Rj+M=
X-Proofpoint-GUID: poL17ryIAAa5m2huWFPl20FxZSkaQ7cM
X-Proofpoint-ORIG-GUID: poL17ryIAAa5m2huWFPl20FxZSkaQ7cM
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d9561 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=wwrPcLtxz8NjKbA9DiMA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX+5IhioNzQcXy
 5wjbQSWGfpDe1YzOdxOIkJGPdfCZCd27KPcW2LDh1BRd0blyMQ0CqA2Tyi5p2a0TffLawEOybN2
 xlShgcEzknpwBLsDxviCpURag2+Cp47WfrMSZsJCtd1RdbT0zC21IcZ0EPohX+D6AU0Fb1bxyNz
 dlNVHTHQ6R+jHCgSljaNV9kHGcipTepzFvtGirY84un3jaBByAWfUSYBxUe+xG7PXkrL9KvF9qt
 5zrPb2xMHrXWvuOUEzvousJyfSQh9amPqGGKr9X3AILDT8ieBDqBsyccG7tsCSaPBsrDM2N4/a+
 PTuRigUswvom/VuJ2T84GQX1l7JXxSW0lphIri7+wT1NSFNhQ9eqd/6uxrSGAY9DQdXBI8GtuaT
 sJNDU5UPgSVeailrvxU9Bev8wn2Ylf5Gyyd3qEYNkthQdhFT5M40YrS9jICEl+TonKVJb0H6ceX
 wdGjSpWujJFG1F8os/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200035

On Sun, Jul 19, 2026 at 08:50:00AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 02:58:33AM -0700, Qiang Yu wrote:
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
> > new file mode 100644
> > index 000000000000..73550f77e9b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
> 
> Filename: qcom,glymur-qmp-gen5x8-pcie-phy.yaml
> 
Okay, will rename the file to qcom,glymur-qmp-gen5x8-pcie-phy.yaml.

> > @@ -0,0 +1,176 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-pcie-multiphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
> > +
> > +maintainers:
> > +  - Qiang Yu <qiang.yu@oss.qualcomm.com>
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> > +  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
> > +  at runtime via a TCSR syscon register:
> > +
> > +  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
> > +  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
> > +     PCIe3b)
> > +
> > +  The node always describes both PHY instances ("port a" and "port b"),
> > +  regardless of which link mode is active on the board.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > +
> > +  reg:
> > +    minItems: 2
> 
> Dop

Will drop minItems: 2

> 
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: port_a
> > +      - const: port_b
> > +
> > +  clocks:
> > +    minItems: 10
> 
> Drop
>

Will drop minItems: 10

> > +    maxItems: 10
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aux
> > +      - const: cfg_ahb
> > +      - const: ref
> > +      - const: rchng
> > +      - const: pipe
> > +      - const: phy_b_aux
> > +      - const: cfg_ahb_b
> > +      - const: rchng_b
> > +      - const: pipe_b
> > +      - const: pipediv2_b
> > +
> > +  power-domains:
> > +    minItems: 2
> 
> Drop

Will drop minItems: 2

> 
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: phy_a_gdsc
> 
> port_a

Will rename it to port_a.

> 
> > +      - const: phy_b_gdsc
> 
> port_b

Will rename it to port_b.

> 
> > +
> > +  resets:
> > +    minItems: 4
> 
> Drop

Will drop minItems: 4

> 
> > +    maxItems: 4
> > +
> > +  reset-names:
> > +    items:
> > +      - const: phy_a
> 
> port_a

Will rename it to port_a.

> 
> > +      - const: phy_a_nocsr
> 
> port_a_nocsr
> 
> etc.

Will rename them to port_a_nocsr, port_b and port_b_nocsr.

> 
> > +      - const: phy_b
> > +      - const: phy_b_nocsr
> > +
> > +  vdda-phy-supply: true
> > +
> > +  vdda-pll-supply: true
> > +
> > +  vdda-refgen0p9-supply: true
> > +
> > +  vdda-refgen1p2-supply: true
> > +
> > +  qcom,link-mode:
> > +    description:
> > +      Reference to a register in the TCSR syscon that reports the link
> > +      mode the PCIe PHY is currently configured for, either a single x8
> > +      link or two independent x4 links. The link mode is programmed by
> > +      firmware before Linux boots; this property is only used to read
> > +      the active link mode, specified as a phandle to the syscon and
> > +      the register offset.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle of TCSR syscon
> > +          - description: offset of link mode register
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  clock-output-names:
> > +    items:
> > +      - description: Name of the PHY A pipe clock output.
> > +      - description: Name of the PHY B pipe clock output.
> > +
> > +  "#phy-cells":
> > +    const: 1
> 
> You should explain in description the meaning of cell value. Or provide
> filename of header with constants.
>
Okay, will add a description explaining the cell value in the next
version:

"#phy-cells":
  const: 1
  description:
    The cell is the index of the sub-PHY within the active link
    mode, e.g. on Glymur, 0 for "port a" and 1 for "port b" in
    x4x4 mode, and only index 0 (the single wide PHY) is valid in
    x8 mode.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - power-domain-names
> > +  - resets
> > +  - reset-names
> > +  - vdda-phy-supply
> > +  - vdda-pll-supply
> > +  - vdda-refgen0p9-supply
> > +  - vdda-refgen1p2-supply
> > +  - qcom,link-mode
> > +  - "#clock-cells"
> > +  - clock-output-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> > +    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> > +
> > +    pcie3_phy: phy@f00000 {
> 
> Drop unused label.
>

Will drop the unused "pcie3_phy:" label from the example.

> The old 5x4 glymur compatible could be deprecated as well, but fine for
> me without doing so.
>

The old 5x4 glymur compatible is also required by PCIe5 PHY, so I'll leave
it as-is.

- Qiang Yu
