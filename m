Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089711;
	b=Ppedw7GxUz99gO8zjN+apn0sKFJA6cKO1Eve4eAsAxEHgh/Dss/GHFOggK1i47V5FOxm
	 BwKqIWnf1tie5oCxZQ3KDzKC3UHzxOfScPXpypXoiTBM6wKefm8vQiHLjNsPbv9t+DzHu
	 esjYyMBhjzSEjKKTMf2ghQlVliB6aJw3Pen4pwThPr/VeVuSEgDJ/92OR8lOeoMr/CHxk
	 3bbocxFIszwAmc5j4FiP9UAl1zJts/+Zhr3ZjqQmxDO9CuJD+8it6XxBx783I8OJmfBTn
	 LqHBR/OBWN2cO6/bMsyLx+f2viKaUDkZOPcc0T/AHBqgWuh8AkAe+yFbYPJ4uuJzRBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
	b=ZPwYWeAuOn3VORMsJGZP8/UUvOWY//AgWr2Mv4erOryRbhBGZXIeOTI0FJjV8fs8Ae+h
	 OP3bRMtpdhTQ+YcPZqTZqt2sGVR34HSg3Ww+u0cWf0FmsJG9Bk9XmcrBidwarGto/UmjD
	 8OxaTQS9gmolDEmCiQLxqnp8XOXfED+oqqLzq9omJyupm3x8s5ObgUahi9sQIxjnjSCHF
	 g/QGjzTdfgPFFFRiCzmLNifIVD4s8xheOw3R2VA/X+p6/SxqegPXGpwHYPnqRwD3z7vEO
	 4a3mwBlod7V+/gGoa5TmZy9NcrolpFRtW0VgoVYTLSCeEKl1bZniLC5b9qHF8FH/1pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlbFyay7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOKkjIOE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325E606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B325E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GlbFyay7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cOKkjIOE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z3DL1297049
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=; b=GlbFyay7dsKQ9ONj
	Lj/uYjVSZ75LQTwtVnw+tCNv/wTfopqDcEJ0yjqd4xxymac5LTN/wtZ9c37sqrdz
	m+RqgmI5dkYJAg8JyyJx3Nt45q5KKCWIpZSC4T6co91RCnRsnojpe7MXpAwqtfL5
	w4bgb4COYr3OeDyJ7lDoeXtlslqt8s+Z6H9iq1dlbTNW6pyg0xeQRWLBvXnHfHTn
	6DQf8YRnKb+TuuRFKS5UQI9q/oKzOjrlNj3cjyBbFIjCo6VgVOeP1ufuUT5diUem
	rClYF2XWK0ldpygT74Q/Ta2X9WMC53IPT7ngtN3b4Ky+jq3R6YODlrHxnjetmOgG
	A+BPlA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xuvx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-193b5eb133eso5215495c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089709; x=1793694509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
        b=cOKkjIOECaLzaqzzbCElC/reN3ZRiJ2LMz8/Q9jrv992ZG17jhW5epqYdN5g/kOEjN
         7yMBimWU6rN2+rtY+871NjsWTSI3SrV9OVsJmPiXXltW5E0uEQvhHeEu1rkS6xnx4z/C
         J+auHE9W5dfgFsnaLbjbz3g4wTeuUrip4d83/XXyW2nGWuDPIMHhqc9UrY2jwEQI8dAT
         6oJbw/VW127ZN7HrCwrlyk6YGN5NWCFq/PYeiyqMFgD3dWEyVPlQYma1ZwrwNhro9YCl
         oNulmnttgMAw1QWi9Lhcbgc9jNrgHtlwovAdYG4MgNYdlhEyRD41TF7e8EqoiyuOZ4/g
         Rkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089709; x=1793694509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lO09KkTAsM7ProbM/oc2Ec9Kk1EVdkd8GU8zKqLcjw=;
        b=Yg8Ljt8d9OY3oknG9xKSRTTP8DsnKRvh6ghnm343mxcder3tSLVV70w6aDlVxpyPU/
         Dukh7rVxpMGaD8fNKTqQOM8Pyvq3Wa2uwIsPk5dcg5a42O69J98c70KY0xTok34TnXFK
         8x+89FsZ0lE7j/TaFDYuV6WrsioFDPlWS3MCYMRnB6nOpgXZTvUXxW7eF6S7aCfavaeZ
         1WR8V97qrMkzLf71cm/giWno4/ZKk7UAbB+UDDS13KEkYn5B/y7ytvitgjOiWauCtjum
         lAKWZLhc4OyWs4FiwsJStuvMbLVv1PLfMk0FXq8EocE8QbmtllqN4XMu4KDCKjA+Q8lN
         qGpA==
X-Forwarded-Encrypted: i=1; AKwUvBxT21E4DJl+O0ffYyk0LZp2SteKt0uy2KetN7ZLpwIG+0Hu6mmFfN88/Ea410IrpQSEkeA3nUqtu7dYvS8W@vger.kernel.org
X-Gm-Message-State: AFq9FYKgIl7GjKLlNsHJztJPdLy7FJss0GjPVVwEDN9C7/iddP9lVG8U
	X4knDgVNkuLqkcx3yAUgPHGdXmq2AYcFwQIv9mrL4bOofbj2mez1zsX0vjbQVfN+/xgoZVk9KsD
	ZhxNs1oiByrtn669kcIdYfRq0rPnDZTAHYtK0KemelKxSC68Q4hMFaxf7Jthl2sbk4PW4
X-Gm-Gg: AYBFou1SOZSgVbS/dXd5U8mwqntr9Sl5bm7gZRnoRKJdtTGXbmDW2CXl+dQEgX1y1AH
	Ah6HkAwV7R9CX/tjApwljtTAktSTdeRRcY0+5MTslQkb6LgKd9aADXUV476bNDQJ3xNrnNoqTSH
	KVGV4IIKm12X3hEgGG5v64Fd4MlnpwdororKV/QylEeIOaAWIUgwM/6VFyhgiyLp5c+pRPuuIQS
	yYW59Jz+fDZ+2RD8yEwsuI485NkuPJJIgrqjKoHn4TVdWHVUSWjKZe4A/Sxx/1ZcuBXGYlkbZk3
	l8cHjl+vw3B5SzXOilf58KbeL0pMete0vfUv2SOgIxr4F5XkyHf4lajdjysWajhr862VzwER8un
	YynmXijVXVRzYAujwBBOyIXPVI5K7fJfRv/sq
X-Received: by 2002:a05:7022:e10:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-199377d8c81mr19690498c88.43.1793089708928;
        Tue, 27 Oct 2026 01:28:28 -0700 (PDT)
X-Received: by 2002:a05:7022:e10:b0:14b:cf58:ce15 with SMTP id a92af1059eb24-199377d8c81mr19690386c88.43.1793089708019;
        Tue, 27 Oct 2026 01:28:28 -0700 (PDT)
Received: from [10.217.241.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm65866768c88.17.2026.10.27.01.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:28:27 -0700 (PDT)
Message-ID: <d08f576f-7255-402b-8eaf-41e0d3acc207@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:58:21 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
 <3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izujusebhw@fkrtjiqsnvnt>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <3btrmmavq65lp7rwmdx76qjvaseaoa55xdibdli2izujusebhw@fkrtjiqsnvnt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mZgoyPAqhTZ-bhs_dloiXo8d0R2B-_8r
X-Proofpoint-GUID: mZgoyPAqhTZ-bhs_dloiXo8d0R2B-_8r
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae060ad cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jkk_kXO6dKdktKeh6coA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXzxJm/yxWJQgo
 X6su8i1lP5JlgcvvNIFz/lOkkbgmcxsVeVaZdUlFQr7ixMHAGeHtKxf6YNwP264LMPvCKYnX0/5
 l40FC7TfmtJoXtqPy1t9ejt//wLPHOQOM2RTzHjoUTteAIUbQ8EZFUhVsPOSmaw5O7Qb4E5ICOc
 cdAmecRQWxha90uMBOUM/ukWxgMIlYZzTAbeN6w0uTVQ6W4Dq2EFb5tUulKJFWD0WqGKoE557U5
 6qfKGN0RUgpe+OfATmoEA0LsKjJcLyRHfsnEGsW325V7Xwp3i9boFF/H6kxkf9bw980brAxi4NE
 MdlWN9lykiOH41/TIp/PCXIPsN0LGO4TptT3vBLQdXvaxURDcy1i1CBH5NkyvWGvHwI1zEsXjb2
 w9Id7sn69ldj+9fkUY+lbeTEGGQdmbfqrmkv5qXoQhMTORsinQeCZZOuv9bKEa6Zla+70kSiLcL
 UMc4icgH2KgVsIqbBnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX/2q+/sUs66U2
 Y6JgGo0aNbLeLX/oEIxfVdgx56CjnmrTBlJPxi/Q3Wk0wrDe3nZiqZJVW6lp8jDZJFl0Ut76Qde
 Lwo/doQtCZXqPVM4E8lVLSsOaDPpSKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270033



On 10/19/2026 5:35 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 19, 2026 at 03:57:34PM +0530, Gopikishan Thawre wrote:
>> Add the device tree for the LeMans Draco EVK platform which combines
>> the LeMans Draco EVK SoM and Draco carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
>> - I2C GPIO expanders (TCA6416/PCA9534) on i2c2 and i2c18
>> - EEPROM with MAC address nvmem layout on i2c18
>> - Native DisplayPort output (DP0-DP3)
>> - Dual Ethernet (ethernet0/ethernet1) with HSGMII PHY over SerDes
>> - ST33HTPM TPM over SPI16
>> - AMC6821 fan controller on i2c4
>>
>> Co-developed-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
>> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Co-developed-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
>> Signed-off-by: Ajinkya Inchure <ainchure@qti.qualcomm.com>
>> Co-developed-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
>> Signed-off-by: Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
>> Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   5 +
>>   arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 543 ++++++++++++++++++++++++++
>>   2 files changed, 548 insertions(+)
>>
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	expander0: gpio@20 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x20>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander1: gpio@21 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x21>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander2: gpio@22 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x22>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander3: gpio@23 {
>> +		compatible = "ti,tca6416";
>> +		reg = <0x23>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	expander4: gpio@38 {
>> +		compatible = "nxp,pca9534";
>> +		reg = <0x38>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +};
>> +
>> +&tlmm {
> 
> Please make sure to sort your DT file. You have 'tlmm' node between
> 'i2c2' and 'i2c18'.
> 
>> +
>> +	dp2_hot_plug_det: dp2-hot-plug-det-state {
>> +		pins = "gpio104";
>> +		function = "edp2_hot";
>> +		bias-disable;
>> +	};
>> +
>> +	dp3_hot_plug_det: dp3-hot-plug-det-state {
>> +		pins = "gpio103";
>> +		function = "edp3_hot";
>> +		bias-disable;
>> +	};
>> +
>> +	ethernet0_default: ethernet0-default-state {
>> +		ethernet0_mdc: ethernet0-mdc-pins {
>> +			pins = "gpio8";
>> +			function = "emac0_mdc";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		ethernet0_mdio: ethernet0-mdio-pins {
>> +			pins = "gpio9";
>> +			function = "emac0_mdio";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	ethernet1_default: ethernet1-default-state {
>> +		ethernet1_mdc: ethernet1-mdc-pins {
>> +			pins = "gpio20";
>> +			function = "emac1_mdc";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		ethernet1_mdio: ethernet1-mdio-pins {
>> +			pins = "gpio21";
>> +			function = "emac1_mdio";
>> +			drive-strength = <16>;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +};
>> +
>> +&i2c18 {
>> +	status = "okay";
>> +
>> +	expander5: gpio@3c {
>> +		compatible = "nxp,pca9534";
>> +		reg = <0x3c>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +	};
>> +
>> +	eeprom@50 {
>> +		compatible = "giantec,gt24c256c", "atmel,24c256";
>> +		reg = <0x50>;
>> +		pagesize = <64>;
>> +
>> +		nvmem-layout {
>> +			compatible = "fixed-layout";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			mac_addr0: mac-addr@0 {
>> +				reg = <0x0 0x6>;
>> +			};
>> +
>> +			mac_addr1: mac-addr@6 {
>> +				reg = <0x6 0x6>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c4 {
> 
> More of the nodes in the wrong order. Please go through the whole file.

Thanks for the review. The entire DT file will be sorted alphabetically
in v2.

Best regards,
Gopikishan

> 
>> +	status = "okay";
>> +
>> +	fan_controller: fan@1a {
>> +		compatible = "ti,amc6821";
>> +		reg = <0x1a>;
>> +		#pwm-cells = <2>;
>> +
>> +		fan {
>> +			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
>> +		};
>> +	};
>> +};
>> +
> 

