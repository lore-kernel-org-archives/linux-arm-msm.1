Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477545;
	b=jhWIsqbjQ6TI3ixy3X1UMG3MeiQh8SAGaOaPGDOVUS4BadeU2LEsPzfITmlrXGUHoIyq
	 9YLfYX4xYvgRhZsrysecjjZEshmLdE1QWMZ3DTmgL1DEqwoP3E8yW434D1IdlWtzqmppI
	 RljtI6SpOldY6SclXYISK3fxMunXNtP86oT5njOtKuxInCw5cLQkLzbYfUCMZeIP+ZU/g
	 5dfzW9JoW6i98c9nwKRs2d8IM9yxLz8KUE67cZXgLRm86S856fuTeIzxYh2JvcKJRqgdZ
	 wnEoGulrYlzVaIWhpwZSPqqROfyeW+Kap2FDQSiPn+HoMl+qd18cHMw27iPk+0xOiKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
	b=at8b7H5xP5wEvwRkWWmqRz6ynxdkThDr4VzS1kgOH/q8QC75wSvOUeAx4mkCUow1o6yR
	 RPQmG4YSqIdbgHC3E2l0XqHEXI6GC/+gkaHQOtfSwPA9Z4GqIY5zJozcHTEt4SIIFMvGL
	 8CoL/zFRtK3qMPnWqIVfHW6qkGqe4SnRgK5Md1mYZ9GcNJwqL4nN98gSdglGl42yrSxO/
	 sXHCakgCYrsaCPFzL48JY7h3IWw3VKP3Qf3WyImi4KQulsrs2dNtD2tNaD5RyvWMQXjLa
	 WulBluIjuRcWzb0JOoUDaXe2QCmxD065Og6t9Yv15NhvpUa4YZ1Xsd2s9oaOwsp+vNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55BE606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9RNkt4092529
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r0hPGyuQen3K9sOCoAqm9qBx
	wEBCNWNkbCx/2fholUI=; b=I95SfLA+ouoj4f4NQTIBZSOkdF+huRxmBi27OgZi
	jeJjoibRCCnU3LqEVGnY4JPLquWWoJ6liFWwOJfFeV/qrKWaiJfpPZuCwRPDx+iQ
	xL2Ly2tkMgdyueBatLgXbslHLNyfpTkBTeRKA/fcE+9Sa+v+V9w6WLdm9AOSOcPN
	2PYT3gMEWTiNQe6Fo3PcV8cCSjd8yPdgemglgJyhCe6/xCseOTsVRxbxanQxQkd0
	vhqrUP0Ij+xC93OMxOrH4aWI5VKQK7ME2SF5ImkHmtRapTmy4gXQffoJFGMDJsri
	zflxaMvqJ+4WLhIdE47C5tonJXWO961wSUB8WNLAB7IGbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j9ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 09:59:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945c60b470dso617804785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 01:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477543; x=1795082343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=WHhdD1dMuk/pmrCBKGBjfJxh7dfqH0jHWDoBCWvd0cNXD74lwY6W8gDSiBVFGwbn+G
         U7+F1k3HN82vx6uqgG2wn9niuR6Q4Wj9Qye1+RujOg9j3x8FQHyl8lSIsRabPATxGYeO
         dXcdtKLc7bCuVeSKb/IKJuDnd2fT6GMY8xWqPjEGSPoUHDSZ4fmlvLvs+qP1aHuQ5HRD
         cKyU01qilJFpIv2CFmkRC4Vq9vjMEl+VLb/X6UeKwZHRuhquCtgBBc/Wf0k8ddCUb3J5
         GVj0zZ4d3CFfLsluG0Z4ccXa5tQw/dgbDuV1B707BBByBTBKdabpF8/NdGFB08kbbCwA
         3hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477543; x=1795082343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=n3FdvQVM1uOXShmaFcV63/894xNzr4hYZc6qBkC+iCGB98twII1FAhQcx1AlvsycZV
         n10AjcRnE1+08wDO8FPw8osaqKR5TS6xAFb+hnkqojGtsNCKiVjZ68E2iOzqDSuxQFGG
         lfiuzbgBcaQwluk57wIfG4WDXDE5NjYawgNKbBDYRPa94LKZxwornpTEyStaytmH+3pC
         wN0h0T/TdAi8axIM8P1qwJhKWve8oAT54ILnE7r1spcx8p3FKlo+WDuSwMLni+EJwMid
         UWxsGmytM/vpvM+zWXujeBJB/KUUuvfTa/Q84DumSe0yQvwUY72WmJ57nQX2ERP1TNBt
         8d9g==
X-Forwarded-Encrypted: i=1; AL+hErFsz/D3r9BM3+UMOQ2Ptgz2fKxJXUxQeZWlwQ7YzG9WkwPDnxi0MMC/A3RLduULSmnF+arsiPMBkrUenZUZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/VUM2blwBsO1/kOVEBkQyAyhUnc4W55wt2NVwYJ/M3GZhysXhX
	bjSMkEzD1UW88Nh4uGO+vwvg2EGdT1KNe5+uhrbU5DvLvrExPlvruCLEZ8js5mIVutSr2LeA3u+
	oFAHb5iNX9IABownMDYwdhO8EAsQuArTj4cO5AQPX8r63n3PcgojFzIbuHlhd2l4znmaGCpdaFn
	0W
X-Gm-Gg: AYBFou3Fa1kvnBUMAbhCDi1pAz+UEGC4OLdG0d73uNqRpcdeYkc7su0I+chIPxlnZWp
	B3mDvlaZ1FW9gojj32WIjifUP+K1t6GngbxQ+q6SZGbRmP/vpovrwp0lcvUbXiaDgS2o/YwG8Za
	HsuS5964wKQkgHUnxARcL4bwrGxhalAt+OECGjwPVsQuAuahd36fPRFWJ1wLiE+JR8CfyYLFyfh
	+v7QQrwkXPhLoupgO+wO27CpjkFlVYfKgYxivgjNAMRgjbjUdrSglr+5vKFcDCBN20grDjay7zp
	NO+nv2qIaZiI7AOZsuNR+0q4aMKa6JprrbF/dEF6xJLuTTlzL4FF46Wsvl+faMOL77fUstB2tAj
	2izB2U11JfbLxgal3Ydef3kxI24k/TMFuqK4pre9EA7VwJ1dlzwKDx+7vGNmYujHV
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912340185a.43.1794477542696;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912337785a.43.1794477542098;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm16883720f8f.41.2026.11.12.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:59:01 -0800 (PST)
Date: Thu, 12 Nov 2026 11:58:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
Message-ID: <u4un5w6cckt5wnc6exjauzulz6x7ujwjihtpo7g3mmalobs5s4@c4rqrnce5agz>
References: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
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
In-Reply-To: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX+UBKHn2n6vDY
 fI/fuWVLbjTiki47/bf1YlaA0vz2TlvzCCiMRMa3xxCFfFKHguJlXVTFp6WpGl2hVk4wXTN2giA
 TZqA7Do5K69D/AX8WHNa6qojB5Gy54A=
X-Proofpoint-GUID: zfeI-V74_voUHql0FrLX4_xHA-pMEvnR
X-Proofpoint-ORIG-GUID: zfeI-V74_voUHql0FrLX4_xHA-pMEvnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX81cocVWRmpot
 6ZKvBDHawTvq0s7+LWmUem08kX4/cSTANaV5Rk1k0a2phJKlQMd4bu2zFUhVPeOgQy5vBlnryme
 Vw+QWS5SqJa5/L/i8Wn/RDd/k2iQ51SGbO6rf1Jcum3pwsVeTgm5NBKL6dt83JpbvdAGJzzJTRF
 6o5Ida5hJRrBGydZAK5ALmqvOEPgXl2QHJIhewoGAr6jQxhlZWhIO2Lm0ZySJBVquCst7nS13dy
 iuJTqSZL0q7I8tDu5jm61HPMNxM/MFTbWR5+/pMRCBjpCBE47MpVr9A0IhCIVRj3FhLXe6Pa7uU
 OR8MRcENCQS1/TJ+5qBoARJV1ujJt3lJEXl3xf9YOj7SU37BUAymbOxqvvH5IIBbKeQFC+JBIzn
 BCphJArHeuESum5Y6F6y8qPX/k5xjNEq41YGyNqmYsM5w36dIoRXZbv7korGPK54UK2eQ3mUbEY
 AIAHaSf3bvtE7LA557A==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af58de7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fvgkK2lf_SR_Mrl50ZIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

On 26-11-12 11:03:43, Balaji Kalkonda wrote:
> The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
> connector and the DP PHY, but eliza-mtp lacks the devicetree node for
> it. Without a physical path for AUX, every DPCD probe times out and
> the display never comes up:
> 
>   msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>   msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
>   [drm:msm_dp_bridge_detect [msm]] failed to read caps
>   [drm:msm_dp_bridge_detect [msm]] aux not connected
> 
> Add the wcd_usbss typec-mux node on i2c3, along with its supply and
> reset line, and wire its SBU endpoint to a new port on the pmic-glink
> connector. This gives the AUX/SBU signals a physical path from the
> USB-C connector through the mux to the DP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index ee05192adcfb..d848ae77ab85 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
>  						remote-endpoint = <&usb_dp_qmpphy_out>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&wcd_usbss_sbu_mux>;
> +					};
> +				};
>  			};
>  		};
>  	};
> @@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l7b>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +		};
> +	};
> +};
> +

Keep alphabetically sorted.

>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm7550-rpmh-regulators";
> 

With above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
