Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011715;
	b=QpkaL1KwMqJhbhU1OnRJtgqKnC9CyY6vmQ8h8OvB/qTOl1iBAZLANphi4apXO0cOIz6q
	 a+67nIWbFi4+WJrk7ekQmfkq0hxcboM6craTWT+Dr/5FZY7D9UMj3iN4/QPl//5zQ9k3H
	 AsqV16cPu9TvcwoF5QXfLtxyfOc6JB08Vn+eM4x1b7vdHV2aj9jJYNPlDLmfhwGVvk71q
	 g/xobV06BUXTVQahTxpzcIJlAGmVubgmLKzduYI6F7vh3C+/GiwKp/89s1iXjIc/eG1Oe
	 PczCwmHYc1R4hDbDsGR5LAD2eRAnULtNxfhHQo5ZSazWdm+/aDFgHz1VpvyX5zNCopw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
	b=C1qOiqezf4l2+WQF7tLfQcT9n9+KpzVdWUjPRHBmN/TIurLNtfUjd4SRuM/x0NvhyL6I
	 rh5SXQYZRP55YpKuRECYp2OADmTc+5U55mQtP+6j7bwT+dTw1E3TsQ4PzmVrokXZsjZ3r
	 +Tw1GvG4+/fhdEITV0O0YnGEanM3kvVsMe2QLYU87XyikAuagT7Fmv7ZPgWNuA16jCNbp
	 nmpzEZz1q5UZsUJhi5Oqlx+A3RGGYk4Bi+ZW5W8PtOdmAlMcZ/EDBTsp+oocfJYk1Slzt
	 oPgnMS9jFNhfke65k0wMlWQz3LrBGuEyjVIePA6IQZXTEKGmAsw/Se8wOC3PnowWfAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LF9j/kf5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753D606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9753D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LF9j/kf5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIE4brg3648049
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zZ/Y0r4m5ztNks5tc+5NW1NN
	N+6fPRTydaZYwjmldGs=; b=VXhHnvW4FFlVnYMeJ/gacpmEdE90BYG4RSMdFQax
	lrZn2pNZ4x9J06W0Pj0QByJR90EPlRwWA86Sso3K6o61yIDsU5u05DCJiluzNYfA
	WwZAAnBlXR9x8i12uBHYBN3I1T+YmByo4vZ/0b5G6dvEwzBOCJweQg+ZZg7I1UsP
	t9LuRuZVBw8rf2ziZrZ0a0x94AOF1CM1a5aFu+WFymXyc8vgCue1NR0s3SNTANFi
	Eupqd9nDNs40Q/7P9e8n3XF5mODvlIIYiDnjGwJu6tJwdxR5qVdyaWH2tgEj27K8
	xL8gXcLlh3j0lsfGJrJfZgsxEQhBcO9wVV58KnjIcC1WYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcr2bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960131befso180646185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011713; x=1795616513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=LF9j/kf57c7CGLz1D7iHZABvVC757jAB/yNDQDwmrwXZppSZ8xLq/iVtYthGO7Olh3
         drvQtVAGyBgYQys3xcklB8QUpuLeA7N46X0JFVvr8ge9Apg6maJYLbJpUzW8S0r6OsDv
         kPz75ZNw3+rRGxCxYnJEgWCrsa2HjTaGHj7dQPq3hHBJ75H15pK4Hg4ALWYjANBydtQT
         w2LrJDnNZeJtdIeo18Ap53RQDMJtbdKmPv+oqYaqyJlaJZZpagBn0D7uxaUPGLQBFjgZ
         xuy1UBpKBdi3kUW/lysRjwzKBtRGNvnGYeCNNJO1R9nB4relsM/Rx0c5RXlKWaIxz3Qm
         zAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011713; x=1795616513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=oPo4aegRKe0MXAvpbsKuMpyeV+6lsP0B9n+BrcfHjy2uvsKyOGrmFvFH8rTLkFx8cp
         erNBF5Sorlh0xtnfIZO4F7QczAeQS8I/pSyiiLKREFkOQ6b/pk3AwIDE0/cUjlmuT/lP
         FuersY/SGst+prnyaE4R7WB5sQIn1tkAlhHDwe6cDib0aKbGaA3KgauBPBgyFZWteR69
         XMCgBmVinDkY6JZO1Ew6PwrQVNzCm9OZk4pm8QjiIvek2n16H5GYesBr0b7CLFXDWhjD
         RIIgsNOUq3Gy9cys02v0pdcZRhEu6fyejWgEd9yQf66sER5qKRHzQD4ps+3rCZv5u8kG
         d39g==
X-Forwarded-Encrypted: i=1; AL+hErEPkJN3w7vst1UFngQSCkVrbZuMOMNY3GwQdydsxn/60qgylFzQYqzMO1xbBfPczKUnalUOFVjmP8n3ELPc@vger.kernel.org
X-Gm-Message-State: APuU4Z9+1fi34sCbhXJ0QlZz+xvt3NRgCl7fMoCFIe9Ui9Q5NGWre3LF
	y7tgnUgmV9bCcnlIXyKf/sEIUgJzDwlCgIvjWjW+VYd//pLvQGms7lpAbRS6FbGMhYVD/WxGqTT
	30BPG3sfTX7uG1fXvGN/0pO0OO4GMB13i0yhsscRCzt2wqK6D7gPW4xLt+Fyve+FYndZki1L78g
	pu
X-Gm-Gg: AYBFou2l1phXnxv3mQnm+QVOSr1d/PlEnwpzCtLdlXkhzbmWnsYSmSbBxWFV9DMwxzV
	i3colNABTppaWo+P1UoWUM42Rxg1Gx1LlJdTlzWuByvbEY1YUh3/gqcgQuB9rixIIEJaaxkGLYp
	T52m/Wn/inAKUbSg5VFcIwNUr9kXgt9C4VL6Thhj7gNnw/ZEEY8ugsOr6MVtsnecKcVw0fUty0I
	fioYcbtEW9sY8MKP8lVMLS2xa8w0948+vgzGdQ2Ew080SJIv86MBU1NVMIQO0kmlSghcb/agtnv
	f8LjqE1udxHV8okZqZt3sMggKlVK3UDS7HpTwZR/0Qeq1Qk8hNpl0qfMnBA8xShCb2zLeiXUmzo
	ePj9D4tmb1Xuhw0eTJVfeXqqHOrDhxccWA5HqwhBO2lR91PNvFLfB/8zg5uBxMxb4i4gvdUUXyk
	XGS52dK5AM1VQYg2LyXXe4KL2/gD9e0bIGW/3M62c0dUb+pIjd8GR8k2NwWKaahQ==
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464565185a.78.1795011712704;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464559585a.78.1795011712057;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa2d9640sm559377e87.8.2026.11.18.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 16:21:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port
 placeholders for USB Type-C muxing
Message-ID: <6w2xvhuuki2ww3xbzgzwxqfawgntrxgz5cjzlvkm6va4zb33mh@hkzdnkwbtrf2>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
 <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
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
In-Reply-To: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: ruECQ3Supzxs2rDtA-YmaAG_b8MUBtzL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfXx6sKb0hOnQ3y
 GzAZh/qUsMZajcvn6aQ9eoQ7VB4VeyqeJXzCHR6zSG28AIgHV9GfmfSuePCsddMvNvaniB9jlzh
 LupAbKPkNqOZLl2oX3Dw+0+mzArI8Pk=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdb481 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jdQJDUkAZxjaZL5bHooA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ruECQ3Supzxs2rDtA-YmaAG_b8MUBtzL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX10tijl0HKylw
 ZQiHPSC/MumZT6JDyTzVpwKVXDOTW9UDImLykCZTwX+C9/cJcNK5oV1E3f8sE3kMzBcr/+fNzut
 ZxTZJqVXT8Bh81DDnYSHcNzhB9+zi0TFi4aZbVris7JZm0ZatuHx4f9xmm2Ff1sO0d+AjX8da7Z
 OG6RekrQQKMgjzUOy14mnx3XQ7AlvkiNXNhqCDWQoi3kCkIiZtABM4rD0RiAv+V6WKZ0C1DVUbm
 d+7ie/QPBdmCs6prmm77QHqf4gSiYTcX3Mi0TOzNYdanBGK090AF5KW+lwKjDcLoulNS4MbB1ja
 eyeVsEhjuUnbv3/GIPRvcoExJKYFurCQCfXlG5iff+ESbHJIf52MN7tNfh6D55xvMg2xMoFtQzz
 Mk56UCClaN2GGi4EIVfvoNI4n+1Bzxud9qICWy19eqUzDldUO90+BXYEPeNXA/fbP+ucpe8sJ5x
 +MO0NuBKkouF9vh/1sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180057

On Mon, Nov 16, 2026 at 05:36:22PM +0530, Akash Kumar wrote:
> From: Akash Kumar <akakum@qti.qualcomm.com>
> 
> Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
> and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
> the PHY. These placeholders let board files wire up a USB-C PD
> controller's HS/SS endpoints directly via
> &label { remote-endpoint = <...>; }; instead of redeclaring the
> port/ports structure on the shared nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 1d74e459f892..04636fd88807 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
>  
>  			#phy-cells = <0>;
>  
> +			orientation-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_qmpphy_out: endpoint {
> +					};
> +				};
> +			};
>  		};
>  
>  		usb_qmpphy_2: phy@88e8000 {
> @@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_dwc3_hs: endpoint {
> +					};

Missing SS port.

> +				};
> +			};
>  		};
>  
>  		usb_2: usb@a800000 {
> @@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			port {
> +				usb_2_dwc3_hs: endpoint {
> +				};
> +			};
>  		};
>  
>  		tsens0: thermal-sensor@c263000 {
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
