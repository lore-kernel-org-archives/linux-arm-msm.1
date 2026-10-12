Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51033B4EA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831360; cv=none; b=dkSrI0YAKtYJnR4mRIQCpBz3R3JQOOldaWyc1NEwMIYepO6U4rvNrFX0wBMJqjIeODpKlYzKLHCfNNlEqmrefICVLFgYG7hBrvTnsmLASao3Qql2gj1XSx5j7DNSm55sAzEUIwIYUty82gEgZy6qvU2tL97V/oOXCb6ZvPjj6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831360; c=relaxed/simple;
	bh=y07cShIPKgGWs6pM85QGVJYLi0v8MBHHU856FqW6kg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIFDbCZCr+xDMKDzUJopHdOAZ2+C4SItnIuvwj2MQLhpaDEfeUvp4hjME65pJd39zYB9BKKuQtL2+lyhgtXvUzmaZGUr6183IpGS9Wzf9i1gkYRT7ZNgy3bl8LPg9Ps3UKHHZAIl2HltjDdeT8AkO01moi9XLTMm5KgwW0hSbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V/P+rGGr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N27j9ail; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V/P+rGGr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N27j9ail"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHv4YJ1591702
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hlMVf+S8qp3TSVlEcEBNF4tM
	givasxTNBJ1lNa6J9N4=; b=V/P+rGGrcz6edsfPHVrlm5uAxgCrx6evBPfzsboy
	lEeqN0jPoaQ42sq8eQrN2EFRKZOoXdmK0xzLj7Y89gO0/hjY47bOSNLWivuRzReC
	JjoQDn42knZEgp+FmP1WKp/jAqBAN3Z/ole8KPt3GCFuZAK8NWTASgYO9iZMqAri
	6JfcukdZN04XZ/lNtSSSVpqL6rufm/TlojoD5zLdJOKuis5RDct38Nu97WbxPFrN
	VklUgLwM4TzWoz2exXLrt7I6Rm607Bt6+0UWX4D/sngJBd3QkKfrMhGLwMHV1rUC
	82hrQxgvDVy7oFBHei+SoqCWYKqKfPZhumchsBinDsK+Zw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfctbk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:55:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4449051eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791831357; x=1792436157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlMVf+S8qp3TSVlEcEBNF4tMgivasxTNBJ1lNa6J9N4=;
        b=N27j9ailsgE6QAcJmFYbxWFgIHLi7HW+CUi8YNhk56SnT7LXoLWjMxf7KH7v3Qc9VJ
         jBEg8CJDy0cTtLPjsK9g3qURdMbBbLGtMIzbrqJ/RwLt7pyjNaQssXXl/xOsNswC6rNC
         DdulX8XxU4ugPmBjrN6i961g7yY96aFDwdqPA+NpVFaAwPQltdiHCLrHMz5Gqn1hIB2T
         Z4uzssaR+WTUrurtq3MISg+18VvcmEB55jtK7qV8z4jkZYq7ot8sD/fJlGKB5HCv7/vI
         ilq+kI2tahA3qlbcMalry0A0ZmjNpZ0pWyQGIuLBCtWx5r2/6R2ev0GOrQ82hFwLwbLJ
         cnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831357; x=1792436157;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlMVf+S8qp3TSVlEcEBNF4tMgivasxTNBJ1lNa6J9N4=;
        b=1DBlQ88SWutVWGZQ+h1Mw5snhQGadcBuiTJLy6WJYDn7cLIU74Km0hy+N5wLCs1Fxh
         59YI2OaBSuKTZMY+F189HTYHn4796k3hAROo6pMrZUMwGqBJKrheiS7Ah6IWZFWp/xe2
         43W2OHoltFl8zcb11/+fE8PWGig+FaNv2M470QjqIs5A8lyyF7sFToiKKJHsZn6vk+fn
         a6rohYoNUeUTuonuwwQ2dbGKDzR4MkAdM869f7cPAT3Bvw0TjIPVbF2rlWFDYlqs0v9f
         g+T/TT/fRKkSYVoKNwD6lecYr5WsKEJ1h3LSag8n/yAKyFfDmxsknzu7fCFCC66pOH4A
         kvmw==
X-Forwarded-Encrypted: i=1; AKwUvBxZAqjQgsniSqN3zL8ClxNWK4x01OlBjwIyMA20vK0NE6xTWxcm9shUAoa2UiA93lFMj8KLRribnZWmfa5r@vger.kernel.org
X-Gm-Message-State: AFq9FYI6/+eYIdEqxlY0df+5wISE1c9VMyfb4anXdUoUYtH/BeACt7ym
	9p+qyJJjx/rrEs3nArLJUsmEjHkDtmdLJNmKAACj6gNvZQZIk2CcpFx+ocdrFr7oRa9QE+i65PO
	G22611qjRp9Rt4B1r5Vr8WLYZq52pg+dKyMB0resO+Wirr28pHvifPuLBBvS7fDQ82UZg
X-Gm-Gg: AYBFou004MPCLclcl13TdGMi5kvESkHxvsEgj8WdFChBjhImZVpVpvHZlxW3wn9ugmv
	rn7vRDkA5SAT7MNIh/yRrYtLc64d96q8xq4+/zFsPcppkYqHwf+/OKWBx/uagPcsaqZE6OdHyLu
	okwj7l933OARhOPUiau9yZ2Tl7OfAFO249iIDOebmSMAZruN08yhSWs2VXIwP4WRMTXo73MBSoc
	ul4mC/ZgdstJRsKALZNxAHNr/A27sLidfVxD6O+AXNVtKdcdGgw3wX9vNxKFZkyHJd8ic5RGqFe
	7caDqLsYPrA352vAaMj/Hdgtkft8nzqyYECKVOJZOYzkspj1aB5B6PRqyKhfBPheX+6OUnpmzMT
	e8H5p0Kgb+3mfNal9pd7GIiRz
X-Received: by 2002:a05:7301:541a:b0:351:4564:19d3 with SMTP id 5a478bee46e88-3537e107c45mr17275969eec.27.1791831357136;
        Mon, 12 Oct 2026 11:55:57 -0700 (PDT)
X-Received: by 2002:a05:7301:541a:b0:351:4564:19d3 with SMTP id 5a478bee46e88-3537e107c45mr17275913eec.27.1791831356403;
        Mon, 12 Oct 2026 11:55:56 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm47798864eec.9.2026.10.12.11.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:55:55 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:25:49 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Message-ID: <as0tNQg8AMeEauWT@hu-mdsor-hyd.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
 <3gylobhugzzwngtxwzke2o6almcmjzxrjqefpkmcpjy74baxvh@akzm74tyb2n6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3gylobhugzzwngtxwzke2o6almcmjzxrjqefpkmcpjy74baxvh@akzm74tyb2n6>
X-Proofpoint-GUID: nPxB4AL_uOiM7R-rgaPgsJHTQG_uRU_t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfXwIndZYzMrpp9
 o+kVCP4vQK/lHvuaPRsi3n2fp5sekCeRzC291qalmqdOj9+J+SvUYJB7GsTxesOmk4NtFBhsxNm
 DlFoRAvRGcyYoS/uxGxHpGQgQKecDtg=
X-Proofpoint-ORIG-GUID: nPxB4AL_uOiM7R-rgaPgsJHTQG_uRU_t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX56liogeoWmYO
 wVfgIAT01K+nJdvy6n8ExTRuuXKDxMZLyFZeRpNN3AtZAXQjiHB4KM5QxW04NRwWARJ0g5GVruX
 BblFJclWgcHrEYOKnaAId2F2j8k2TgIw4iqcXFWsG+Ma0pYDgIK2C9H3Xccu0trhQMYq1X2AekH
 OsBzlfLZoVPi4EFGhIN4Q/9QKB9XUbqXKfvtPmftQmODTZoujuPxWySeHT2G6fuWonujtSEXgll
 XRrJLjakSxrFwfdQCv/d8okUGJmbJIa6MjY505AAom1RJ00nlxPuBM4KkFsbxx35J26SJpPuz4F
 MeVJ3giX9zZEw1VppSA2/7ODAOxwNa/FMt2Uo96GWxTn+GynGL5fUmt7ifosZFx8CxZTSZxhjiw
 wqwSJsV14d0/w96+xNKbuk6v38MWRNNyYdV9R2OUiGBYarXwwvsEWOkqDW48KQcH4Rgans/HHVX
 w27BPERjLcMonLZUOiw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd2d3e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PizxIPtMwCBzAtEjQcMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120075

On Wed, Oct 07, 2026 at 04:40:26PM +0300, Dmitry Baryshkov wrote:
> On Wed, Oct 07, 2026 at 06:21:06PM +0530, Mohit Dsor wrote:
> > Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
> > EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.
> > 
> > The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
> > a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
> > rail. Reset is on GPIO76 and interrupt on GPIO85.
> > 
> > The bridge receives DSI output from MDSS and drives an HDMI-A
> > connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.
> > 
> > Regulator and pinctrl labels use generic board-level names
> > (vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
> > from the bridge chip.
> > 
> > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
> >  1 file changed, 109 insertions(+)
> > 
> > +
> > +&i2c4 {
> > +	status = "okay";
> > +
> > +	lt9611uxd: lt9611uxd@41 {
> 
> unused label. rename the node to hdmi-bridge
The label will be required in overlays on top of HDMI so shall we remove it now or add in overlay series ?
> 
> > +		compatible = "lontium,lt9611uxd";
> > +		reg = <0x41>;
> > +		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
> > +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
> > +		vcc-supply = <&vreg_disp_3p3>;
> > +		vdd-supply = <&pm8150_s4>;
> > +
> > +		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
> > +		pinctrl-names = "default";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				lt9611_a: endpoint {
> > +					remote-endpoint = <&mdss_dsi0_out>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				lt9611_out: endpoint {
> > +					remote-endpoint = <&hdmi_con>;
> 
> hdmi_connector_out
Will fix it in next version.
> 
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > @@ -67,6 +160,22 @@ &sdhc_2 {
> >  	status = "okay";
> >  };
> >  
> > +&tlmm {
> > +	bridge_irq_pin: bridge-irq-state {
> > +		pins = "gpio85";
> > +		function = "gpio";
> > +		drive-strength = <2>;
> > +		bias-disable;
> > +	};
> > +
> > +	bridge_rst_pin: bridge-rst-state {
> 
> I think the current recommendation is to sort them by the pin number.
Sure, will sort it accordingly.
> 
> > +		pins = "gpio76";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		bias-disable;
> > +	};
> > +};
> > +
> >  &usb_1_hsphy {
> >  	vdd-supply = <&pm8150_l4>;
> >  	vdda-pll-supply = <&pm8150_l12>;
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
