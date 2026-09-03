Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA1B46C84F
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 13:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440793; cv=none; b=u2Bfb4quIbDCy7nE3cSPMBIvdvAhdu7K3zDwglqAIT3MPEVa4/S2b0Eyh6HMKvBT5VmN/3RaBW1iYbBQyhUR2XSVXbRPZyEU1zt/V1PRjE/WO10zI6j8WqArZhqtra1rTbHL0mxgJrnj57jj5I+/1g6SmEN7X50JW46a5a3StX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440793; c=relaxed/simple;
	bh=04XyEh+0Ry3MVpSq+udwOknhTIYoiMJgQkAcP5KbKek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAhIobOUxpsIoylcf78A+4PHzZHyEX0fyB9kX5Z5/GSWcuD2rLIcTnQuQ5Mqd8zpWvB5aJgJ+Bn8cUXqeG7Jf5nuy65CgN0hM5yw7xq9STHg0s+wqJ/3W5GQig17SEGqyvEgxGsf/5W6FWaQ9Tn1Kr31hdVrcse8x1ZgW+Wa7Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaWlyzY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faLPkkqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaWlyzY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faLPkkqP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH2cn3720089
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=; b=IaWlyzY12P9l1GMw
	9U2SQhAom53GwB1EUXNjWsXUUlzKvFc1iJ+040NiqQpqJRJqETi365kQ8mnyMrDb
	a1GaOhKVfJwM8L4BvsLPGAitCbS8/h/WdLXRx0fLBFk3ZkfJJ12oDpGf7A02thKQ
	6N3mG3R8oMDXWdBQtFpOXLSaeFcuvey9b6Ycgcgl/fyEuBV78KOq3OIymIbK8/p7
	cac/W8n4wF1OaLatT/PCZ3rFPL/KR164Einbp3N4H/2eVpc6Wazsjul0jMjQKhXa
	iLt67WC0u1ooLFb+cvJG2lU4t6LZ5BEiSpUzIRlNwt1PQ2TnGXRi5XMroUQQhJUU
	+mEh4w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjt7jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 13:06:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53002215979so4290611cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440774; x=1789045574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=faLPkkqP71bAuYGFvHqd0hsxu/fNnGZAiw569ofF7t5QnXEX3GO7rC+YYogF/GF0Lj
         bbr13MJ9Tg4cCJYZEYVsVojQQBJFr2o+To3UnPHrxXJsOP6EZvFwgswzxqwIspmITUjZ
         KsirBm0bH6jiG2ityHgllD1Sej9S4wzNj+DUMHqTjRjnkW1Mck+6uenNydrCGeuCAytT
         30JWORjRZzxjmeE0z/JU4x6+jdyTJ6Qx3AumgehJBafPuPycTN4s4aXpe4vGrSRjmsVX
         FrFI1kBKZ9Q+XH2i3uiOIiaUdDkNVN93GzE660ce/rf9UTRd58OOPtK9m+D2RXxix3Ii
         bLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440774; x=1789045574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=ohFVwy2CSk4MZnl68CIuv8KUpcSJmBR/bjo2F6UFJXYUJRtYfGUznC+hPIzhIE91Hr
         mkg86JnhPkL4Jr5IguGcNMMd9IWMH2wHPUuD4Ae8poXmKTOfipDWyHT8BjoEA9l/s4yL
         8ytoCqsPYsRkY+NvctYNlJM8cv11sgZIkk/+SphmJwVhJlb05yJ+aT0kAymDtRhpl+mZ
         9ZvfFxuZT8u2w9CxF2NF29Yvbq8wZggCtjmo0DZADEExowhAUknASvEOun0G9i2CSMVU
         ALjc4XXgY/DFj+C/Nf2jla+C6DpVPX+bOmS4QBOSoPFH9+5aVvYXNiWuj91zdE1c0fML
         +E8w==
X-Gm-Message-State: AFuF++nxGSKdki7LD5uUIw7goHJOvV+PPRevPN0j78n5YujzErUfzSMS
	krtOa92hHhydDDUUwkgV/geg7dkQctWX+GSrMqgRACiK6+6V+xzbnrXH09DwwNPXgFWop51zhi5
	Ne/pfkypDNn2vTMz9cujOQQ2XgicHM33xaqiMdNNJQB0wxreTmyybJ1H5KbYb9kK+RoaX
X-Gm-Gg: AYBFou1/8O7sf/Ump79/TGM6mBFene6p/Wg4AyXwVmnZA3Q0CphSc5CJohF5L8X0s8D
	kXaZL+Gc7Bh3zN0FOvy4+M1itx4wQKx6hSC7aanwWhW/Bdj0v666Y2zK2D7phy4vMS+xxk9om+T
	A00WmAmdCFAtYfT0PBm9dc4BV1Q0rGCRz5BiLFnKSLRUlSqGgGX0Glr+Mzk8aoeKFyqPvvL5AJp
	+7Ck6G5ND2XAegBVmKfuws4IxvAGvlakffrX+uMfofTEXqwctmLMFlsiotRcoM0zuVSPw2Cxg0Q
	N9lNv0wjgyNB95sIBEXuUKf4UvDguG+vQ7CGdE1maOjXrloGHUaaZ1m6czZao2/Hn7889Pj0OE3
	8jIre2A9Qg/8pk82pZxj0gw==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87718421cf.2.1788440774080;
        Thu, 03 Sep 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87717631cf.2.1788440773501;
        Thu, 03 Sep 2026 06:06:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2309145a12.30.2026.09.03.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:12 -0700 (PDT)
Message-ID: <049af81c-d05d-4ce4-9627-8b2212979f4c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXxvKHmOljXKBZ
 kxw5POgfAJUDRNbw3g8C3tO5XALSGKMTJCdhEquOfDnc6gYZVFIhPgG6B+j5VnyWMWasw9x0DrL
 pjMvpJxK/kvj6B0OuBdvdnsQlEm0tqOYEBqbHyWOaHxzf/X7j4W5Nf/zzMOz2K2pOdtWQiF0lzY
 LXusefjc6RqPU4H4qZLj7ekgEEPBUCEA+D95fpQzF5EZ7TBdYs7ATo8E9C63NClD6dA8JK9TuJb
 OdI+89scJSNcjxUeH7BaNw6BNm8nXc6oebNXrs9nROJ1J/Cesxuh6QJRTj1ghVWxrSbyQXtfUqc
 GvDq+ieI7hutxEB5GNI8hKrM5HvIpktLX+bBK+eMh833yBverdLLXT8952WBhMDYMbKGO3BaYL4
 JR8OdW0Ewtl985Tb44/h0DorPNCf6ASkbYQU6PzWA7HIRHMP5IqDg/zPN3aVj1bfv/r9053X7a0
 4rYYyJkLO79cNPN1X+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX8acumKCaDatj
 3SgoHRdqXj1+27YQB8NVBA9P2yLD9ePvvOh9m+CU/siKf9Y80vk0WqQ5jS29jlahy846X+QYna0
 PRgZ4gZiicBHkNrVkqAO5/wLNO6U32g=
X-Proofpoint-GUID: fz_kXYZCRC5BM_LJGwecfk4ItSei9oZ-
X-Proofpoint-ORIG-GUID: fz_kXYZCRC5BM_LJGwecfk4ItSei9oZ-
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a9970c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cQV133JH40Yl1OylBfoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_s4a.
> 
> The overlay is built as a composite DTB combining the base
> lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

[...]

> +	panel_lvds: panel-lvds {
> +		compatible = "boe,dv215fhm-r01";
> +		power-supply = <&lcd_disp_bias>;
> +
> +		status = "okay";

Nodes are enabled by default unless explicitly disabled

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {

Please keep a \n between the last property and the following subnodes

[...]

> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible = "lontium,lt9211c";
> +		reg = <0x2d>;
> +		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		vccio-supply = <&vreg_s4a>;
> +
> +		status = "okay";

ditto

[...]

> +&mdss0 {
> +	status = "okay";
> +};

The DT which you overlay this atop already enables it

Konrad

> +
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> 
