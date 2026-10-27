Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090088;
	b=trHz7WwM2XSdK3/W1r6tdZNefNkb4qoiK9KUmFz+Xt4cMs+Vr2KrhwXTxXcAw5qzHA21
	 aaUjWNkikvL/VTM70cLmyDTCa2QSR6y36Exp8zpL5rcVAGNhmWQOOZJW7CMJ4UfxT3PJi
	 2pIWV7azd1EYYuAOst8gBz5uipJJ+3fGZshBXQkNIAi4n+8oh6aqsItUU2Fd+gE78TBDI
	 zhfZsytVB6E6IUB39G5IhZjeBI+ygJaZWzrGqjRqsGSf9rFVxDpcO9khln2BK4QNt+EuN
	 Pr1AejWvOfMVYdv1JgP0qNyMSTW6qBJ0nN9K/8lTy2/CtWlVBbGZx7mvZX8p9GnqoVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
	b=vO97cr/7l2eST12u9LTs8e8QMr5E9UvD+Y7NhVST13iVMWnvcs3NZmglQe9rY+Mw+X+d
	 pabAoC7kzfC937cJPjfh7YD/y2kLXXdrSSXbF+OBLw5rFkble8EQAGC/EIz9Hiyb0fuc6
	 aAtbNfH8vDVIOqQkAZK8js80fZrYwD3TJl5f9zp7l3ZAjGQPZt6pBFNBomDAEIoWXNqS6
	 07LnFjkumE4DNG8Zw8ZlDNbS6ElxBMkld7nwbNwL6O9dCzoYpROuIjr+O4wxbf+2CNm31
	 CpP4tIw7veto3ha14LeHqndoNx6oO8ba9H3E/eql4r5E+cU+UGNagW7yJk5iCr/KPsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klLHfoKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHVCLHZA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F51606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F51606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klLHfoKF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHVCLHZA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJDH3950135
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=; b=klLHfoKF8BmaNqEz
	yEIeYII2y5MPCQorGsT245BdxARu/K4q28tYUSGO9xW0LFDNe4J3Kt3R2XfySJUw
	MJfAfNmAmDkGyhkGXTA1gdjxudP7ncfdDkrmUvFgJyMbGwozvYHRHtNNgUnANJik
	vL+m4p4RhT3TrPXQrrPuzBo62tZ/EqP2K9sp71ufT/KDreua3wsJqCBfSEyWBDJG
	G0TRzHwROdHc2ptR/MOD/h9RoHvpTyPCqtGHDgjEbCCqgnew0PRh0xcAGe9Aq0f/
	nV1wSm0oJjTPJIjQ611hNf1du+phzSMnaMIZkQE0QoYaEGTT81XdnR+X7BhyOYT2
	hbGTSA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jvbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:34:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso13448941cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090086; x=1793694886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
        b=PHVCLHZAo3WY8VEP4+kU1I/7MHHDj+FYG/5IXiI+SKdNpCFrGtWMDc7XtJHwnDRlaR
         vV/6i6GyX7/4EjlNXvQT7ABaScxmyGCZvY6+V+ImKKrboUZYpWIrno+zVYeBQ56MfTTA
         JpOTXOtsDDl0/2r8ju1cFdCydhmouqz7H9FomMbawu9ABO3CnPCFo4mmnJWHUUurQogi
         VwDP/eYP13RFN5HDftTesXqq83EQQNTeF7LHGVXwLI6RX58PUCt2fsN/2Rm6ybxQDxTi
         RJNjL0SLLi3/2i+2KeON9mxo1QcxeZEBDykt5mEko5UmH6W7vRg6PkG7XfJx2So7O19o
         B8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090086; x=1793694886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMGIbOTwrPmrugxrIdinhSlrkvIB3Wn3F6g0ca9uRX0=;
        b=HkDzTF/x/szmPEwAtV73jBjNtm35t4t9niR8QLHxPyWt9IpyqkG/uToQhcHx8ofZos
         Byf8rDQWjZJABY71YpwWUD/zqP2StvQmEhPrd9QDx4XMnnqZA1WLZTxLdT7o6SoJTnev
         Q6D2ADvtz2KWDRy8LHv8q+BxH0d8jqXRLwRRPxaD3D1cY3lFw88DKmY6syNByEZLPW9j
         WcIGQBbBPTapxx2iK5bAEjAtqTDDplgcHFusSlEcOgR68bq0y8y0dOlJYCoHaMZ+MQ0d
         FaZitD2O7j6ee5jW4reC03nyMU+vBNMBrtUZsJIbuiFXeM9bNQqqwzG1EgFSjcVcTbwi
         7zug==
X-Gm-Message-State: AFq9FYJhiQMeNr8g8EGvsdsXC3UjDr5UlR9QkxpS1Ko8gN+oqbV0Z22t
	SWg0KvP4tldzFVFd/pLMFq48pSuh6zMgPAEaC5UHRHmcKPw60NvxkrDI7qpj0aY+oULs6BSr8Hn
	fkPR1k2rQ01RLRNtKngmBlwEkjkzvEL6knaGRRJ1N51+oL20xXPwcn/NIw3m+7u8LW5/W
X-Gm-Gg: AYBFou024w5PM3cB+1eJyfxa/lpT7rvnHooDclZkLGYlKohmg2jFXpToXwY5pMdo+ni
	IECOBaxKcTx0SR2J0qxq3courYZ6ddK1zlbG5YXFNiN/WXkZhryRwFtTc5Qc9zCrAOyS2EVCPtm
	2b3oPQI88/xomTZ3oq+F7xy8K+rCxRIndpizZcvFSoNfs4l5DYmkTXkGEemvRvmInEzMBLGKhCi
	swZvCGRSqq2erkfJ3iP2uqM9rsqLigJ1i2v2jP/+2DAIque1zcOLqJo4urGD4U/vEwdc/cgoRZM
	kFXvfHOOH+MKIuxLiBxzl82bGA3cnj/SocTamQZ0QmOVpSbBzmEYwIFVu2PunGgoOWmQxGa3an2
	xXLC9qTuu3BuYRKOug2bTaw==
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1398844285a.3.1793090086143;
        Tue, 27 Oct 2026 01:34:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2301:10b0:939:9205:4d78 with SMTP id af79cd13be357-940ef8d1323mr1398841885a.3.1793090085610;
        Tue, 27 Oct 2026 01:34:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79683csm408994066b.69.2026.10.27.01.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:34:44 -0700 (PDT)
Message-ID: <dd999250-9b3d-4176-974d-97f0cf2fc19d@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 09:34:43 +0100
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
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI
 bridge
To: ShiTou Hong <redstone.dcity@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ShiTou Hong <dc_redstone@outlook.com>,
        KancyJoe <kancy2333@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
 <20261027080758.3990418-3-dc_redstone@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027080758.3990418-3-dc_redstone@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX4+yA0JPiRogh
 XyblI8XDYuQEgUjpk+BPgKEw1BZaxAC2ulDMMREGhkt6DfVnujPccHwXCLnq32JmseyZBQnIGrN
 57k1IqW9CG/q6t59r1dsfzRGxga+sX8=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae06227 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=pEmwrvZP9X6ihHc33VMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KBd-QLsPIfRTOO9mlFzQkmBifKUb_0IU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX6H3qTN5pUaFq
 dLjRR+4AvqAxOxWznPMIL1C53xS/B4NwNyI9Ninw+F/X7LpNvj9Tc0fSuFyeip91+hzhclJ3ISQ
 itn5kEZchKT3Uwtxc7f5hNRama4onU4OPEMJRwBoTd/Kd/N4tJodGv14AZ78+iQcLFS6hyCNk99
 8YpkNDBTX3WgJkTgKcAVHnNggkK33r+vNz3u8LbctUNiySAgIeZ8ELEYksLsFRE+k2UdbeJeUKg
 6gYidEVqs7VQQ5IUdvbDXDnabqZ7LK9lSdx6ueoO1me8zwMrSkByU7FKJBU0iDPNxLUDoU4WMkp
 CjMWdiC+uUOz2qXa/fe1cV3bQC7gLasNn8xgzdzpA7+++Mh4FdOfVGIxZXvFwOQcNFnGw8O4RAo
 97FFTiJLP8xyDoDJYjKwXkOUjfami129T3Kgpio3K+KEP3fD8LS89A+Do42dx5/bBvPfCn/AXN0
 2D6S1BUYJjo1PFQ2ppg==
X-Proofpoint-GUID: KBd-QLsPIfRTOO9mlFzQkmBifKUb_0IU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033

On 10/27/26 9:07 AM, ShiTou Hong wrote:
> The sm8250-hdk has a video bridge chip LT9611UXC
> converting MIPI DSI to HDMI, which hasn't been added
> in the dts, so we have no HDMI signal.
> 
> Add the 1V2 supply node for the chip and the HDMI connector node.
> Enable the i2c port of the chip, the display controller and DSI port.
> Add the pinctrl of LT9611UXC's RST and IRQ pins.
> 
> Co-developed-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---

[...]

>  	vreg_s6c_0p88: smpc6-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vreg_s6c_0p88";
> @@ -63,6 +75,17 @@ key-vol-up {
>  			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
>  		};
>  	};
> +
> +	hdmi-connector {

This one is still very out of order

[...]

> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l9a_1p2>;
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&lt9611_a>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l5a_0p88>;
> +};

+ the status properties

[...]

> +
> +	lt9611_pins: lt9611-default-state {
> +		irq-pins {
> +			pins = "gpio1";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio2";
> +			function = "gpio";
> +		};
> +	};

These are best sorted by pin idx
https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Konrad
