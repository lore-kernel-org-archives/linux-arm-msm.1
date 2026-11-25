Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595162;
	b=ZzNUw7I6TTNfUPFuN4Hcpcp0FDtzN2yS/Zv2U2QYTybVRc46p0f6lvRustfAquTptO5M
	 KyoV0QK02kS6Nn7c+8U+jpB4onrof5IF3aj2mm2ZCLJCk27O64hwj++Q/EzC/cLwNCpvV
	 BD3oEbc1yBv0fKVxm5xcTpxVH5zdGsNbuA4iBPgIkmO7NAM/LrlP78CatwUErNJ1UCGop
	 SC+kSsa+juHQ8hDfr7FyMIiozp0/5kxfHqVor/Cmuv5hu0NGs43+U1CMvxm4PmaS1Cf3d
	 3MdaZq0FScjAYFKsVkTH5gVf6ZbBIDsaWDTQRLTyOVm419iXJqkwRsI1he6PI2PA+eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwcFMLr5QW655ZvTsLTR/1uQu64nkcHyAgjyM237G2U=;
	b=ZqaznfjE3SNwtZVD+gxl1f6q/jphsbcW0vq3ww0IpxHrnifNsMpVe7G1x1dA/VjdgzTw
	 0EeROlbUdP3A1nmFTjB8yj+XPt/k27t179+YUVaTAmXbJYT2h68G2ggr+dCgCve9s7or9
	 HwonRmXJt8vKt8vEBfMuR98Jkgs3PpogEleiiesWzNdelmjFks94V5v96BxZ+kTR729yk
	 tM3/a17DfiXfuYWvaeSiF5OIuKMqcffjYQN+TxgzvB+X/Ur+v+pPOE77VAMsJ5rPULyN8
	 BAJboz3ZG/oOwctkh9ukr7c3r5KW31SaJLM8lcr/wGVunVGtymN0kZ6mQriQ93LWzhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SahxhR5s;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="h/CoT9AM";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFED606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SahxhR5s;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h/CoT9AM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ZCG300019
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rwcFMLr5QW655ZvTsLTR/1uQ
	u64nkcHyAgjyM237G2U=; b=SahxhR5sWhJ1LronK3v8daIqArtbv4nSZA+Oifgf
	P0riDj44hPy/MWtNzSjHWgHR9BD68IUQclw6TNOFZh4kjIYnayEaLGrDkqW7uOnL
	ApA5o0233nHPveek+CfmzmpOgRWj5N17ceJsnZyIrOPr7Wqn4ePe8GXtxDlAhH1q
	9nz6mXAXw6N2h1McLikSCJOa5I/S1vi7WMDvSWIASzT89f2rPZhm/+Hi7E0hTqo+
	VFaXVKoq7XEw9rfFrHy1RRwNPW/zhQjPXLLkZ/eTVdw1Qt4EtzYhbXdz8Q/xpCTF
	+DWXpXVHYeDUil5Iet7nntRuLN867J3EVZ6OVYsKc87gEA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rskfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:26:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso9371513eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595161; x=1796199961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rwcFMLr5QW655ZvTsLTR/1uQu64nkcHyAgjyM237G2U=;
        b=h/CoT9AM2boudlv9zzE2Ou5csCq+6ShNxCIW+U/81H5gVDyjWOqFSOTdnbSRH45GHD
         IrCsrKzOznbfq7Utfgfe5HDMnoWwhadVwkT1qKwbH2LM0axY5ScPaQZicKvx99wuXc5z
         92NvZX+LlFi2yLFBVvDznMCw/oW3tuwBTCyYHsd6GbSYYcyoTQUJxGNRW83E8q99oitC
         a9doU5QVxFadlyKl7gX1AuAP0xLRmEgKj6ZLk6KInYasfq2z9VpbyLsZqWvz1DthQaAz
         F+hssa7mu4doToZQ38YRqTMId/oQkObMp1Ga7yBh2zl+RrnnqBJIpcxOCeWSahIi5vwj
         pn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595161; x=1796199961;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rwcFMLr5QW655ZvTsLTR/1uQu64nkcHyAgjyM237G2U=;
        b=Jl1AA9/Z+ZSbVByjIrtGt8O+AIbEnP7VREUoj2sIROupaYkPH9hjqRyJ1nXLeogs6M
         ssFCkrd4Etp7GxnpvnxXWmAuf9IYxovRCn8Pv31+pSutqxLiyvfIHEzkaTG2Sfc7LpMt
         ftARxAVyNcccGx88J9HCSeKsFYRbM0/oGK2GYgqOkrRvKqeGVhY7+QVUXjvN/0B5qevk
         /Zh9N4DuMIbM686EFqpk/FgoBsLUzAxdrc9NFeNjf2XyhKjcQSEXUYOGYor9Maii4G+p
         kkOwO7OItBoyJiPbYIX6vSve84dqRqo2UQLVXe7DA4ozlvMHNtJ5kDkLW1n2nlOIchbh
         VQpg==
X-Forwarded-Encrypted: i=1; AL+hErEHYqsrvFT5Jlt6dGHl3hJeS+pBsPu9Qo/3Y1lSjO4rcLDhfj3IX/ZenzFN1XDti2wu2crN6TEJI7d2eqA0@vger.kernel.org
X-Gm-Message-State: APuU4Z+kINOzvhEfgF3H+2WY/6cI47I1nGflbr3hjJmejTGWmHKdC6Hv
	Jp2CdyIPxvqIsR04EFBEqXU22U2auu4jE0ciW/ZB5KgVqpyjC5Xr/C/fstbUu34lTjp9cZeBF0X
	ZglzeER1rwd8AOBDsQZ5e3yHfrhVsPNKDgjwVXlQxNAcuciwc3n657rpIuSaT64KCC8P4
X-Gm-Gg: AZFdTZeUJXLZOuFQPi70OClri8PdwzwYWkOG70MARDthkwzXUaGJzSokGCunuf2xvLv
	PltxNnq5zciYwaBtYdKUwN0Yo/ypQDrZgNMpbK93oXGdhk383795R7pUA8JyDoLNHZkFuqcYLEG
	c7sOzRpyvV9ioudd4i6d6Rc5SmqjfAp9dXJ9X9sfvyMIJnn/SPbnsvEIj3092pKfArpiGgt0Dof
	Z3ehhlKun/wC8wnV4SRZnem6lA7dEGDgTzpwzRQBj2Y42hVuIZOt/ESVLde7n+RbSZTCJjnPNJ0
	NYXanae7lg4uKNPhGzFbXakD6iQq+Xd1AUIIcSuUevo8vxrXAMgaCeFN6u/jXxXDT0K97WlqIzE
	Msa4MX+uImRNL7WT7ct4GDcwDjiUduLo+uLTRox8p45v/i41VFdJyRdIEqkMuZ6pU/1SapPFknB
	s=
X-Received: by 2002:a05:7300:f68e:b0:36d:4560:dd38 with SMTP id 5a478bee46e88-38571807cecmr16427798eec.37.1795595160512;
        Wed, 25 Nov 2026 00:26:00 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:36d:4560:dd38 with SMTP id 5a478bee46e88-38571807cecmr16427778eec.37.1795595159963;
        Wed, 25 Nov 2026 00:25:59 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm91363975eec.3.2026.11.25.00.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:25:59 -0800 (PST)
Date: Wed, 25 Nov 2026 13:55:53 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
Message-ID: <awabke3c2iQdR9lp@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
 <179552715903.40664.16651410338735245830.robh@kernel.org>
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
In-Reply-To: <179552715903.40664.16651410338735245830.robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX9IdPHaZqV3jd
 fbVtNfawWZfZ2fLPUDyyBGH6LgLBqj6k7QcXhwSEDxbtNC7zpuCng1yYuPNUM8RsXjUrev4yQgl
 WXT7doM+zf4RPS5NG5lAY8m9F7UYcCUZlV5NR2U3sCPa4KEQlljVBCsH5oedXCyfPmeR6Qpa8G6
 4zssk3pKhMGSFCOf3nx3TQqBmXZCT9TJgcLRJhoh1TRL99FE3qO/o9dLoC7zf3kOJzzgHV7UfOu
 9jxlhQzLYa1wAdcPvu2ZCbNMeq+IDp0VHxiMMGFhGLC0VYs88FpHdJMzFuA4wifMNWOxAI7q9Hq
 8BfknLImFj87rUzgTG5epfx6ORBBqGJ0jga2K9R59ZQ9KjfB24RCvK5bzXPHigYebkugIuzbrLN
 I5tzpYKdiTdWvu8TkPpJderhTAONmv+Etv5j0lSrwK44uorGHAOZFLJGBF6dLysKh1Bwr/7mc10
 3I4p0a7wdpATSdWz6qw==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069b99 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WLdAmb08tD0yJPlYAzsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: A5QpYDmR46ltR8hwDvCCWplnG2OpLLrK
X-Proofpoint-ORIG-GUID: A5QpYDmR46ltR8hwDvCCWplnG2OpLLrK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX+OQEprR5KcsG
 Xct12X+7x6p+z86TAaLn/CV4hjm3eXybXDn/H51grL4eQOXgxbCOkWERX8OjNbbDVPNFvIkFNX+
 2iIz/k2ar6Stt7XLOgimdpscXfRbkA4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

On Tue, Nov 24, 2026 at 07:35:18AM -0600, Rob Herring (Arm) wrote:
> 
> On Tue, 24 Nov 2026 14:45:44 +0530, Raj Aryan wrote:
> > Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
> > battery charger found on the PM4125 PMIC.
> > 
> > SMBLite is a reduced-feature charger IP sharing a common SPMI
> > interface with the SMB2 family (PMI8998, PM660) but using separate
> > SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.
> > 
> > The binding covers:
> > 
> >   - compatible string: qcom,pm4125-charger
> >   - reg property for the CHGR peripheral base address
> >   - Four interrupts: usb-plugin, bat-ov, wdog-bark and
> >     usbin-icl-change
> >   - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
> >     and usbin_i (USB input current via ADC5_USB_IN_I)
> >   - Optional JEITA soft and hard threshold configuration as raw
> >     16-bit ADC comparator values written to BATIF ADC comparator
> >     registers
> >   - Optional monitored-battery phandle for battery parameters such
> >     as float voltage and charge termination current
> > 
> > Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> > Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > ---
> >  .../bindings/power/supply/qcom,pm4125-charger.yaml | 109 +++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dts:29.13-28: Warning (reg_format): /example-0/charger@1000:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/supply/qcom,pm4125-charger.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>

ACK. In V2 I will correct this according to your suggestions.

Thanks & Regards
Raj Aryan
