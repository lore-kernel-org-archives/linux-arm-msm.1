Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC243DF016
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419836; cv=none; b=uDu/51wPOorqEf5XRoLaBt4cHGhZc2zaFVC1/MtNF0tr4ypw+/WtRwzGfcBaa05UbpVDLXS4nJ+iXz2x57BYBE83lsR9RRsBwVFwFRfwWNT5gVMFtNrcfuYAJLw6qDWQJ5CuwSogpTpVZvd91b4iE5eGn8N0cxMbmPsL84zh73Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419836; c=relaxed/simple;
	bh=4ql2aTLdhYhZ6orCH6CMUqpfN4KwBk6Tludnd5w6p4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZYs8wJndvI62M5ytSl1Xn3TJxRn6fvxJ0GXCP3YbnfvMGo43VvHB/OPQXDCOiigCQR1CVEFWLJNYGKCJ6t+GKyAe/tUdbu+Ntk5NAfvc8JwKDsUiyD2po2/ZlXsQeIRGQmR8mzq1I2WIq58wHFPv+bHfRkqoDL1Z/2NBizZfV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDYQnoVY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAeorjhH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDYQnoVY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAeorjhH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DlAv3182160
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=; b=kDYQnoVYJCYORkLD
	oOr9oWCBUhxhXctLUKSFd4wJcPASPUehnrDi+eoAkArR6lcErMEQO3vOAsvOpoBL
	GeGYB0P9YOc58EHCvfM0En/EfJxd2b59pJ5e83eYUIH3IOhovvUWBF5Lt3wWO70l
	V0OX6ADD46av2Q0AFmPMZSL+IATsyaiYKImemLniSCeCCeabRBhtWDw9jNgIltlR
	cjXWFFJj/F5CsR3dZbZiIOWjxQtXLAJEMbsLdQ5TaeEEMI82dcMJO5J7bARbLmzh
	H1SdZwl6erbiMm/2LI5BsUWLFXVM853drP0XG6jEoM+Z/vM2DqffAq3E5sXuIgMT
	V2eU2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8ywa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 10:23:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ebcbb818bso2077885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419832; x=1784024632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=;
        b=LAeorjhHpcZos78+5tpsanY84YjdsMvlMCuKqPkS5gRgl1oqYAQRCJxSBgqiJr7HNs
         Mn+bn2XQr/0LQKan1zQdFgV6WJKM8/1Fsle2VpBojNPAAy7J59eTPYWNKgUi0SqoFKp+
         psTRjx2ftqxrgF2Qpz7ECHx3sfoEAczMR9yBtnlSwMGF8/bgJ+7SOO/xMzPJ/jf1UVZz
         +4mXFBJ014KjggiXVfpmnTmZLhwDs3Sn+aPuHN8PdsmrfPHS2/vySda0GpiGbEGB5GJz
         oGNs1QtaG0zBxNBgDzZyQiUBVrzOIi/zfp2aK062AtVYL0r0+fB4kF2+E+v3olkYRdlY
         t3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419832; x=1784024632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4dfETx7wy6dus264yK6oxX9SFN/B4VI6pXBXwK5j9A=;
        b=rqVe0QyjiNXusT5cxoj6BG66UeHxtnFuNvjGO0jtke5HPcSsZLzY5h3pg/10OLlnMS
         vAGCWNLjReI+ZyT/0+94Y2VaL/kL/eEdM42jHhG57xk6ZYLrvSpRhoDeAsIxrs4ZSkxd
         D0EAFTwIU4d3KTHS14vDUszcF6EYWHU8AJT7SsFYdlgLzf/hJ5UGPuZwAWJ0wFu9yTHH
         6qrM41gg6g73H8b7RbnEOq1iZBOyncCWqaXN06FlgHe3krNYynIelxTudtiUB17cKVNm
         OmxvM1MXplKU8Lk/+ai9GQaEvFW5VCjCNOB8+8SX1s+bJ2zVsL0mF3khWYdJjx58po5u
         eaRg==
X-Gm-Message-State: AOJu0Yz8Ye2SwQo1YaWyhNXJqDIB4HFKF0zwi7qjE60nzhb6pCeaynMY
	WoWNzxOmPSSv9srkGHnupYe9XD/9x5kV5dyDCb7STbE7eCvqtDATu3+BhVAY0oIDtFosa9hZWv+
	W94nxcKvV+XZcyruGqbhz97Oz2VAgVO5PlimuQyWNjdFEcw3aS2agGtMz2BKCGmFj5WaAfHf2Ov
	/a
X-Gm-Gg: AfdE7cn0Z7Q3oqUd/h/IDLmy3py0FgESwgoo9K4TomJRYigUuWd0c4qw1dcfc9/e+Dw
	5WhpbFS3ifkWlqga8jqhel/URqFnlc2D5vg6lc6/U8jbInsOTRrlZ2jRPkjf5Db5pkzrdFEBENy
	4N6QJjGAsLTmFP4TBT1+hWAOIibT8Fo09mcmm9gdAJu7v7t1YogOrpa2vRYCDjJ2GhEsN8OcY2a
	C8r05XR7jbhX1ePOrI6AjKLfAnOELyJQQRWyebIQuabqRTBhfWVthmt6ZdWSpZxVAh8isMsjFCp
	UXsa4qymxR2SeLKVi+gCdwOFcnSFTTeE48XiY1pxpQN7wnwRxEyvjH3BfHpl9+G1TC+c/96QQly
	05gBYcMnnxktxWz1r6W59iIK8U4M3SQkyMQ0=
X-Received: by 2002:a05:620a:6486:b0:920:798b:e28e with SMTP id af79cd13be357-92ec052b554mr164194085a.3.1783419832461;
        Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6486:b0:920:798b:e28e with SMTP id af79cd13be357-92ec052b554mr164193085a.3.1783419832032;
        Tue, 07 Jul 2026 03:23:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad9be41esm101778966b.39.2026.07.07.03.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:23:51 -0700 (PDT)
Message-ID: <605e256d-711a-4b47-a8ab-002ae8cda1bd@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 12:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-evk: Add support for USB and SD
 card
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630-dts-qcom-eliza-cqs-evk-enable-usb-sdcard-v1-1-146264625095@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vsmCtLv7EEJM7DYC8-uqOgGWBc6Qp61i
X-Proofpoint-ORIG-GUID: vsmCtLv7EEJM7DYC8-uqOgGWBc6Qp61i
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cd3b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3552hqOxyuVABoCTLpMA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX6ecxaOnBVgBL
 wBg9IIau9ZiljVpK4iDRO6A0fUz5hq0bpSWhfyBUsN9Wa3vheqdJq2j7fsae+encNsgpxtNzCMg
 fNLPlWpra4TP2Ud3Eg7efS53psIqlaCTpjiuMWDJJMoYLZ5CtQHVsPILihed8wnrtqn/LPCGedl
 1TQApq5EhV0DoZqKMSEkTBYmTZhc8ul6zWE1hMBy3MdQOfNMZs+6/1ahAuH1w2dbxQppZPdhsys
 7zEN0bPG3iWjzo67OSyxdE7vXBvo8LB7D7Lv+a5o3ptziXdveUldhRbQXCocFDCd7fGQ8VzkkRa
 8HARC3h+WtsKpr7r+hk65OOWn+LJrCrJ/dC5qLOOONNMq7/3cNSypFTjnG8ewuVC4yh88hkH5qm
 6gOZAnNU33UNbYmNrweJragr9RJyWfYBE3dETaUCVTJQRb0an29Cp7F/YpSIZVOrmAqvtwrUGJl
 lP+k1FKi9R3MUeqmMSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEwMCBTYWx0ZWRfX9z0cYOx7X0cl
 pPcaQHziIehXunKsNMemIRVCMgPkDA8Cn8zkdX9CszXd43Oi27lwP2BXS0BR/E57CWXKW4BIkp4
 UPybphOUB4SoU0l3FKvdIFp6J8WP+fQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070100

On 6/30/26 1:04 PM, Abel Vesa wrote:
> Even though the EVK comes with 3 Type-C ports, the Eliza EVK only has
> one USB controller and a single set of PHYs, which are connected to
> the port marked as JUSB.
> 
> Also, the EVK comes with an SD card slot.
> 
> So describe the PMIC GLINK node, the connector graph, the PHYs and repeater
> supplies and enable the USB controller.
> 
> Also enable the second SD host controller, describe the card detect GPIO
> and the board specific supplies.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
