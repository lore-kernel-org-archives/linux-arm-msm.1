Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796285;
	b=x1SVBambLYswz6kyBMfR8NhmVEdvLQGpsyRO6p5mpNlJxZMjSWS9xu48ZjZkytTZ85do
	 L5sV3E3G3JvAOHit3WL6H6kZ1il52P0I3xNldJjV0qp9+ZofI+v72FaZWlVlsPNDQNBEv
	 zH3MusjTiOwsGOeYSvZcI4Ih4ITyzvXM7jQErj5MeS//WajBiUoEOlrBlH8OmPkted8kF
	 clzMglm9g96u82Qm/wu+H/T5wRvsmNnKNGeHhyc1Fby8VBk5Px0qmHxZJ2aTp0WZ2CM0S
	 lnbeqdzTkUbE240We2cTBApuc7QMKhWLp3OmVLL1cxhpUkFX9zwNWeo6FDThhNQfocg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
	b=MvYoavg4lfjCMB0YThz6MA6TBrZQ1Hh+OFQDXPf+21N62wZQN8hPK8MR5XwWFC2d5gWW
	 TO8edVVjEwPS2FhUCyg41bXPqPxFY9KCsKVJ10rLEWgL1DDz8CDF+MxVDg71CSQ5D9cJs
	 SoG5ANCN3YIBe7eFdnHd/80IK5V36FI6Uqo2KQHZRZL99f8nmsZrT/U9tuWF4NaoviVTy
	 UGIQEkaLPZj/BJhx8TZNJDJB7rZ9SWzHJIHL7BrvO3av6BammaPwYTNwwTWJUQwIF439S
	 MzBvqQI502cEljZDVtYlr9e9pWnJ2TSogFlTkMiVjF6cHYnYYiRjPxx4F/PQhChQ9Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3jEJ6Mm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96297606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 12:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96297606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VrzyRa5y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P3jEJ6Mm
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaOWN2310758
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lpw21cJiJ9wruQZ4XIkQa5Wx
	AYUj9rrJY9kVvdlbygk=; b=VrzyRa5yJxKjF5oCblD4/urpQd+MDemmYa1H0ioS
	bMMwosTxK4S14FNlA5omekOFPhDLypULjSJg4XTej+4KbSGwYudvfFkLypNQYL9A
	Ag77eCy9U2haTWbsANJlDXeSf52C47b3AQZXb8i/8BfXvC/cCiuLcbK9ztiVXO5l
	6mUKXPpumdZOsQ4aoLtfMLVgzD4MtP3ScIcBORJyzx4JnJPWICgAplP+EdHV1o//
	zm7wVYhoChgnhF/er4ogwF28SYaG3YKXkqeeVzDbca+RwBSTtin1QphAnokxP4vP
	yb8sDkP4C5vmGYiLSE7hz7/8pzzSXnIYu7DIEHHdfbs5mw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8muvtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 12:44:43 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so1256785c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 04:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793796283; x=1794401083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=P3jEJ6Mm2Aj1qblkW6SRo99WWJ08t5bvYFkf4PQVyMJ9r/unv7ob1r707Bd/3QWY/j
         l5mDwsHnmZlo059VgVflpjCOKEJQeWmXA709XIajJ1WgwXtXF2NgUzP5FgUHc6SEKzk8
         vlY1/Jv3eYjtPMneWWUkTx8FRvsJV22CESdPrvUi3TCv3Zi8rPshUjUOe7+Ex+7QDZEa
         yIBK1YtjEBKVg+TG0LEOZE1swJY/2CliELXXnKe9n1Qp5eU6pFp56aMNop6hucP5v0K5
         KubXBeZGRX+aiLMPV9729KTrJrl+wLKz4i6ggHsqjCy65CJ8uiArmPxoUPm+5o3gW6Kq
         e/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796283; x=1794401083;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lpw21cJiJ9wruQZ4XIkQa5WxAYUj9rrJY9kVvdlbygk=;
        b=hYwyKddGGe/vpNpEe7FhzbK94+/V8tAQo5SQTLq4qMsbgpJ45m/BXWq+J5APxpA4yv
         LK8WqVGEoEiOD1U/KC35hSwvH9xtrgTcg9T8EprVLvXowG/7BIfYIPvewEsI7ThgSs1U
         Me8T1iz2NQ+g/Qa90BRsXg13yz7UYJLnm8CH/tYM3qhu0w3tlUeTFlrRINoRpp18bBQs
         bGKt76Y+0SDFRG9nRy75X7OY/uur8YMhqKMCNvPywOFdGWFavutZx9aM0XoIKKSdzL2X
         8L3yQRXlUPlzkePVbsXTV/+rES7e/5YZJtW9gHzQGq9p1cI1l/XZVK3DOadX/AnDYeco
         r8hA==
X-Forwarded-Encrypted: i=1; AKwUvBx361W5lwarBsLHuGxlWdtgdxYsRvhRC3RsFg6RHPGncEkI96Idan3T57AGWDSktsdK8R25WOIgqptmfZiB@vger.kernel.org
X-Gm-Message-State: APuU4Z8s165Fw05sRdxA7SNhN6YDfL90QTOG9XLqoqzf1N02QYc3xHn3
	KS8fVVkCFrEemR3V2QOBy31CocA1YCIOqG6T4vOrgd+eLAj+Hvw2bk3Bk0reqROqNyxU+CkfPva
	FoNqhoLNcb2f+S9KC1Lv73eyXBOEbqSi58a7NTsnnGmor1kSkxI1eEbyPp2Vi9yr2y9vA
X-Gm-Gg: AYBFou2bs16gukuJ+Wq79QGhiEPLZ4AnPILjzcOdG0O9N6KL3ZoAoCGeSzxtU6xtQSF
	No6I91U5w1E7dL+86Rb3T0iah/LdozNP8u9RUxcx3uor0Ddeq6bEZS6VYXR7tmAYyeeIVpAKsRp
	9Tfo1nuFvfRudiXOqkE5vy0Xxp+3AQp7XUooM7lRSyg7WkDL13RQ8rUdZk0EI9D5X6wtM659FgV
	yfl3Z8534nz+zUgzVJPkpFiz1j9/oZiCeUYCqjO895QM7VfSBbjwrlUci2uQYgc3zhpagVRKBPb
	2TybfeZzA6ZEtZg9n15mX2BXwxMlszIpVZ4oeylxDzGmO+srz2LC3rQQYxPMONFK/l8qPgqslKT
	ikC44nMaaCZOMkP8Jgo9aQ/FtF0LoRVazKdAjJXZf1uVq9VEYCMW0VJrOM2HpLVGOOqWqz0lJv6
	Dble3GrAmSoocK9w==
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221957c88.29.1793796282396;
        Wed, 04 Nov 2026 04:44:42 -0800 (PST)
X-Received: by 2002:a05:7022:b044:10b0:179:a1d0:be39 with SMTP id a92af1059eb24-1ac5e320c51mr27221898c88.29.1793796281578;
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8110251c88.13.2026.11.04.04.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:44:41 -0800 (PST)
Date: Wed, 4 Nov 2026 20:44:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: lemans-sa8255p: add ethernet
 nodes
Message-ID: <ausos--t6wJVzI9g@QCOM-aGQu4IUr3Y>
References: <20261103-sa8255p-emac-dts-v2-0-05f9355df966@oss.qualcomm.com>
 <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
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
In-Reply-To: <20261103-sa8255p-emac-dts-v2-2-05f9355df966@oss.qualcomm.com>
X-Proofpoint-GUID: MxjhvWLJgTSL3n7XbnY9ViM3lWAdo0e1
X-Proofpoint-ORIG-GUID: MxjhvWLJgTSL3n7XbnY9ViM3lWAdo0e1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfXwC5gjSu2J5ni
 lAi4fzYu3RIYcwy+oj0uMDWMEktm2z/K4i8H8pU2usOTuKWz/QpJ1HTnwBMI1rykfXJcO/0dWdo
 enClmWRR2gIbCE+iEdI6TllPAxLbqki1+r2dNR6HYkTnS653l7s/75jzmbJjd2AjIhoOT1uXtq6
 QMvKQ6G5g5hJL0wN0tmhAzMjJge4WIVGOuJLDBh7cPNC1VKBOmI41xAIuNCIIbv/bCH/q3phPAW
 aTSCfxr7nTLq+hHZN14EOhhXPemvx3I9J84MhCOFRJSIuPByTdueqM8n7RCV57jCfy+ipIwm+T3
 QKpkNTt5U1BWS1Q6yCu617gEnBRH8jE4v/o5HtYH3XyCcJZMO2MH5xgdaHZZ2uFoZ8/AKIg6g27
 0Ff7ka55cFI96IQuauUX1m5nXTQKCkY6R1MvFmh5FISMz9nagJqBjW+4065UxDFwH5SBJLD1R4G
 cW/DPVMuEDtBUoBSByQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1MCBTYWx0ZWRfX4xy3UCJigODg
 ryvg9zohA371jVbotkVNKmhqSBoNZL6MzvNLf2DH341++uJPd68oi4S8xSEqT+91H/DzlYKVVds
 oVJZFo2SJbJMOIWARyc58aqX8aGQ4M4=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb28bb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=apQYb0sKy1KnhfKHRK8A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040050

On Tue, Nov 03, 2026 at 11:42:00AM +0100, Bartosz Golaszewski wrote:
> Add the ethernet nodes along with their serdes PHY nodes for the gearvm
> variant of the lemans ride board. Enable scmi7 and scmi8 to serve the
> EMACs.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi      |  30 ++++
>  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts | 207 +++++++++++++++++++++++
>  2 files changed, 237 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> index 91c97a55f2787406b104650956b9a511a6a34c23..96a54f32f0eeb16dbce9802e74eec82622ecd35f 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -58,6 +58,18 @@ &cpufreq_hw {
>  	clock-names = "xo", "alternate";
>  };
>  
> +&ethernet0 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes0>;
> +	phy-names = "serdes";
> +};
> +
> +&ethernet1 {
> +	compatible = "qcom,sa8255p-ethqos";
> +	phys = <&serdes1>;
> +	phy-names = "serdes";
> +};
> +
>  &firmware {
>  	scmi0: scmi-0 {
>  		compatible = "qcom,scmi-smc";
> @@ -3218,6 +3230,24 @@ &uart21 {
>  			     "perf";
>  };
>  
> +&soc {
> +	serdes0: phy@8901000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08901000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi7_dvfs 0>;
> +		status = "disabled";
> +	};

We have the serdes node for Embedded variant as well.

        serdes0: phy@8901000 {
                compatible = "qcom,sa8775p-dwmac-sgmii-phy";
                reg = <0x0 0x08901000 0x0 0xe10>;
                clocks = <&gcc GCC_SGMI_CLKREF_EN>;
                clock-names = "sgmi_ref";
                #phy-cells = <0>;
                status = "disabled";
        };

Per Nord discussion with Konrad [1], I plan to move serdes nodes back to
common DTSI and let variant DTSI to supplement or overwrite properties
as needed. Does that make sense?

Shawn

[1] https://lore.kernel.org/all/ausjj6ScavYiYKWo@QCOM-aGQu4IUr3Y/

> +
> +	serdes1: phy@8902000 {
> +		compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> +		reg = <0x0 0x08902000 0x0 0xe10>;
> +		#phy-cells = <0>;
> +		power-domains = <&scmi8_dvfs 0>;
> +		status = "disabled";
> +	};
> +};
> +
>  &ufs_mem_hc {
>  	compatible = "qcom,sa8255p-ufshc";
>  	power-domains = <&scmi3_pd 0>;
> diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> index 6f19064997a4b50525fdf630307b843604368645..2b3c9e90802bf89b91354039f0e6a24941fc95d5 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
> @@ -14,6 +14,8 @@ / {
>  	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
>  
>  	aliases {
> +		ethernet0 = &ethernet0;
> +		ethernet1 = &ethernet1;
>  		serial0 = &uart10;
>  		serial1 = &uart4;
>  	};
> @@ -101,6 +103,179 @@ trip1 {
>  	};
>  };
>  
> +&ethernet0 {
> +	phy-handle = <&sgmii_phy0>;
> +	phy-mode = "2500base-x";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi7_pd 0>, <&scmi7_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sgmii_phy0: phy@8 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x8>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi7_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +
> +		sgmii_phy1: phy@0 {
> +			compatible = "ethernet-phy-id31c3.1c33";
> +			reg = <0x0>;
> +			device_type = "ethernet-phy";
> +			resets = <&scmi8_rst 0>;
> +			reset-names = "phy";
> +			reset-assert-us = <11000>;
> +			reset-deassert-us = <70000>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +	phy-handle = <&sgmii_phy1>;
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup1>;
> +	snps,mtl-tx-config = <&mtl_tx_setup1>;
> +	snps,ps-speed = <2500>;
> +
> +	power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>;
> +	power-domain-names = "core", "mdio";
> +
> +	status = "okay";
> +
> +	mtl_rx_setup1: rx-queues-config {
> +		snps,rx-queues-to-use = <4>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x0>;
> +			snps,route-up;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,map-to-dma-channel = <0x1>;
> +			snps,route-ptp;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x2>;
> +			snps,route-avcp;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,map-to-dma-channel = <0x3>;
> +			snps,priority = <0xc>;
> +		};
> +	};
> +
> +	mtl_tx_setup1: tx-queues-config {
> +		snps,tx-queues-to-use = <4>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +		};
> +
> +		queue2 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +
> +		queue3 {
> +			snps,avb-algorithm;
> +			snps,send_slope = <0x1000>;
> +			snps,idle_slope = <0x1000>;
> +			snps,high_credit = <0x3e800>;
> +			snps,low_credit = <0xffc18000>;
> +		};
> +	};
> +};
> +
>  &gpll0_board_clk {
>  	clock-frequency = <300000000>;
>  };
> @@ -145,6 +320,14 @@ &scmi6 {
>  	status = "okay";
>  };
>  
> +&scmi7 {
> +	status = "okay";
> +};
> +
> +&scmi8 {
> +	status = "okay";
> +};
> +
>  &scmi11 {
>  	status = "okay";
>  };
> @@ -162,6 +345,22 @@ &sleep_clk {
>  };
>  
>  &tlmm {
> +	ethernet0_default: ethernet0-default-state {
> +		ethernet0_mdc: ethernet0-mdc-pins {
> +			pins = "gpio8";
> +			function = "emac0_mdc";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +
> +		ethernet0_mdio: ethernet0-mdio-pins {
> +			pins = "gpio9";
> +			function = "emac0_mdio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
>  		pins = "gpio1";
>  		function = "pcie0_clkreq";
> @@ -205,6 +404,14 @@ pcie1_ep_wake_default: pcie1-ep-wake-default-state {
>  	};
>  };
>  
> +&serdes0 {
> +	status = "okay";
> +};
> +
> +&serdes1 {
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
> -- 
> 2.47.3
> 
