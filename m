Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793847D952
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269033; cv=none; b=JmmrJsXYi3apuD8zb52+tNUOBfuU/SHl8/jSvNENrHwaLwYB8B6CAcgzyOgbPF5j7IJoU1MVNZ22Khjxi1DROzXSu3EPq6K8Os/k3VOkMuM7KVDMt/e2ZPFete95mbJhXfdmR8ZgIvz0JrvYRWrXnPbLTv3cvrlT/0buttkqeJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269033; c=relaxed/simple;
	bh=sPLjFmC8Z47JUFnL7nOnU3MnvdoOiJICOFcD98EBaOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs24EVpsFjpSOBAnLe8c8jOZHTVnX9BrA5/Ru+ZepSsuBBPitsNCO1MGoerjXV1hsTiazkTZ8Ba18qfHfonb12UOv75WNPXRtMtCJee2jnlprFbiCeRWUC71ZPbs4X5+TVnQQAcD16kw735xTO89kgsDfRQk1l/qvLhXMemxook=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwbujzHo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2LJnQe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwbujzHo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2LJnQe1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCTu1641401
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=; b=pwbujzHo38NpZi+u
	CgVm7RlOuN7Be2fu/SOtvOkNkhJgx4/Z4yRCLHUPMOWvsdzd22dufX7J9oQbXR0Y
	Et09LjfdF3+JO1rBXFwEhV0nn6e7pfvx2gDneCM7T725KwgYRL76OeuoT1fRZhtC
	gq9NrzknbjMGfQoLiPhw7WgkCRaA7Z8DMUs7YokxKEEyPeiC9vP6tTWme8mnt4NK
	YMxMEkedst5OiJvMWHyBjnuNQd/vJ57xMQdzdTilGU/l1Nxlxxu35UmGNQ6i5nX+
	o0bM+TorUwAGnSdjQhDns04jZaK4y7zOEPnihkkZAjvTlguhcVVUFFNT8s7Zb8sW
	moWCDw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tt0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:23:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so121283e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269031; x=1788873831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=W2LJnQe1EAoyzh3gxgSVGw6x0vg+0QGzdohjVDdEJA2TmSF1EdIgIZb3LrkJGmlZDg
         OPHhAo7z1qH3+FIsNIdmxHKMlawyPmxCwHAvGFB5MdIq3NQjjzOFnGpJnmg9mldGwN8y
         0cnLL2a9bCz9qBsV8oIZ9lXiNteaf3uUX3z/y3MGOWFJuToNUxLu7fIbgMVrNoWMGyxR
         9X3SaEYQCxc5DAw3QljLXtii/SDT/Y7ouEPvlpPGtRtEWP4BkZbko5WVIBf6b4khSueH
         51upNDguil/PFC71/7hMHSa1yoidP7YAMH1KemfwQR3GQgV+i847Rf/rF6rEiw21Biqr
         sa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269031; x=1788873831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jthUaD5iRZHV9aBRZjn0IKRLvA9r9dfDxMnS52XP7eE=;
        b=c6vwlyZS3levrFIdwLRTRGKGiDoELVODKD6apGQbKc3r4YGupb6B6jw6oYJLvinQ4c
         yIQ4tJELLYM00k5LQuaQQ4hQijyJ6ohB8EMdio84QI4r3xVRD5u0ZZIOx9rhUCL+s51J
         X1vBGQJnyt6wfFFLx7g2t7I8/ownSSQhFnpfAi3VO4iAP88JxJSLQc5fHzcXx4/tiqSO
         wo6d8l6XOHuBLFpHHE3DJmvc3KyapnYyl94LeYzRsca90Yh77XId1jNNGJqkvjA2A01d
         wkpFIL4ADdt8CLFjUAUgJeRrxMFxxPvQmXn/QfeiAhlHmA97OPbB+4D8OMPUL1D0OknD
         gdVg==
X-Gm-Message-State: AFuF++kdadQEpzJ0pxelgNSTr08uy9B9obbIpK2VP0TaJrl5T1+rHTMQ
	c5KReQwaTGz3kGDPgODmd0vcpqBIGnmRTmY8FT50MBUF4eT8bIQyIedQydRc0Kle1OriHyLgbF/
	WjOvcITfo/wP1WmtOvyM2ORVDmJizKDOTJqL/NePJyN7XM9MbIoLAh9BE4Knyyhoyn1Yk
X-Gm-Gg: AR+sD13359zFihgJG97CC1hWVatSk1bO1pk8xfSoWBepB1p7iIccINjtFPf2p5TrXk3
	K3I4HTgRUfs7PBwgBxDgrjpsZgg689uLkUEVn4j1kWdbv2ZUJFpy1xgZpdJj0HHK/7j0/ReqkaO
	5afCpCe8vFOIk/S7fO8QFZC0FrfxaVcyHuozxWgP2kOSvwimRhF1An64/m+AcJ7QK6LsVeXaHHz
	YdnsBP954gXgBv2YH32llZD5mf+JP1PkoN5vSTmMg45xGnOXNR6+V6VfaSn+t7SG/xK91AD7m49
	hcC5BAD91ECnfJsmezGy4MfyxLgOB/t1cn4StRwj3qi3yWSe49ixTaj4A0733eFqHNhGDK+0ASt
	SK9XHnPpcq1rIatlW+NExzA==
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830668137.1.1788269031139;
        Tue, 01 Sep 2026 06:23:51 -0700 (PDT)
X-Received: by 2002:a05:6102:508c:b0:789:3ef2:1da1 with SMTP id ada2fe7eead31-7893f0161a4mr2830640137.1.1788269030644;
        Tue, 01 Sep 2026 06:23:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce877sm2884326e87.20.2026.09.01.06.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:49 -0700 (PDT)
Message-ID: <28b27377-4fa9-4aa9-9f3b-d7dfecdc21c9@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: ipq5018: Add Super-Speed
 UNIPHY to USB node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-11-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96d1e8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX2okj6o+UYQ9x
 9MCWbBBtmRMPoo+UXqNVcJICsoSHEyWlGMwSeIQoSb4swRVPdf90/8Jxx5IZ5Vf/dqimcf4U8X7
 5083CJLA3k2LQf3TcmMf81uEhmYb+7VvqN68KX1p0UK7NkMkmJyxg9CVtc3vLrrcpiqBoeb1N1x
 Lly6wEKNrjelviXC6BBJgCvteZYvyLQBdF81ZMOmcThvBF+Po576nkrZP2X76mGtk5cYH04wxqZ
 MGgJ26orYxJ2jg5v6cgs7oTBkSM/3N5R32nXWPqKKajKuqjyBedH3ktPSE1hmt3yjT+DtWb7dPS
 PycLRgQVeZVuezzNB6UbuR2bK3i4Y/9Segp1Xwzuvn9r2gEPYRl00uVKZRBcLcz/7TpVwiNQO0+
 kw87Cjbp5LEzSwfY50PGwVbr/cQTVCkN4xB5dnLtEpfTEzTic9z3hjjT4q8lg4UjYHd23p50Zzt
 VrhHBcXm4NLk6ARNygw==
X-Proofpoint-ORIG-GUID: qb8V1zxfzyQkcC9JafuvOpLqk1KkMfir
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX1hpRsKmekttd
 /RrfAZbs+WFH64NGWOggL3xw6bACQXA2jvO7QLAPMb0XHLt6XO063iqw8Lqc9Bb3Dq4+gMd6q4v
 T4xR9ER/4WG4WmIlFyHSPq2hesUIg88=
X-Proofpoint-GUID: qb8V1zxfzyQkcC9JafuvOpLqk1KkMfir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the USB3 UNIPHY to the USB controller node for USB3 support.
> In addition, switch to the pipe clock supplied by the USB3 UNIPHY
> instead of the UTMI clock.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
