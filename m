Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C03426D03
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973094; cv=none; b=aPkY9LmzabQHc5Zpf2oeGvWW1/fz9JuFgo+NZ7fps4Sai5a9ArbMxgjl0ewEXKaFk3r0tjJcfHLGAHX/DBjSgbdlIu/hUkyaaKWihjn5cWN9nrbP/lfyRulTnR/EthaWbXMQiVva1wtyC7232cA9npHfmH8Dp1glQQwJYnKGv24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973094; c=relaxed/simple;
	bh=F1GSXwfyenJO1Pubr31ZUbjndWp9oS4SeHv8I9RZGlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgaiQ5duBfE+JZ7kcvP052UbBhSy3gMtYwnc8YY346Bvk6/tO5eQ6l0VZdnlGw/EjL/m/36N8Vu8JHfdRFHHHD1TrRyCuXv3pc6ADxmCx7xMajiNGaHdOTj2utvfToLfbSfxyibngi1oxwpjJO/IjCtlR7BnmtRIk1RlYMDDj7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iA87aj+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOEPzJnA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iA87aj+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOEPzJnA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6IbI2937185
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=iA87aj+Z9SmKi8be
	luOzuB6NnY9KfUCiUofqNM0EyXl+NG2Tiej+CVCma3IAxAdFwTpVtRxaQJ0c9JF8
	WAQ6SylQLt2BXfX8Z8/avmXtOPgz4WaquOX3tNzvy5yyQ2uj37DsxZip/6TvoiFx
	MgEW7f8sQkPF235TI+A4kG/Fhm5dYEAtfP0ZpP30Y0PKU3OqHOa/u+yK4rnTJOKc
	4tEIMNeykXFVa4tjCGmaT1E/pcbGoMvLsdvFy2OMSeUyFuSq0IJ2aWExG9JiWZsB
	hkXk+l8FOq85mXyGNHAOzsqK/GT0P4sTB+fiAGJ3KoPnyMQN98T6c0UdlSFBw6Px
	dm4TdA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7sce7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:24:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so4187581cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973092; x=1787577892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=TOEPzJnAavvjVaqUALAkqCuG87TaQ0yB9FekfvlX3jcsozXQWeaH1YLfsENRP35D0U
         hN1y0s1FGv6VuKSPh+KnZ5TW2E+8pViTgNfFCz/p1calJFEwDVFzYLeIhr53I5aNHfYy
         C88dlTbD3XR7kvX+h3fP8fNLmtB7uswIvn+/j0/zX2p9nkW2wooM2khd1isRhwozSM6B
         GKoGHxr6HwvsqJAznULFVLkAwppB6wq44JlG7Uf7sbdLFcg1qQBzkumb4GIzkhddES/O
         jp7S3Idw7VzTFyEU20Mef2bPgFm0k++xbYSYlNynkNNcR+APzFlc+weSmJRO/1H1P/LI
         KORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973092; x=1787577892;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=TgC+2nAeQIkHhdBFi56iVdIJvFha3UN/VmXkMI4Ndco7DTA1Xq+rGTiByEve3BdwZm
         2Qx3dtEUcyoJf/iXFX7LBt92PqkAjEClbTQTuRPuqtGq7iZdbqisWQQaT6YQLwhLBWmB
         l5hOKkLsdSBGEqkQNIPS559scMcX763qZqRuSwGVCqWiCsLsJptDrvJLTKNYMm4Z86GO
         1uRw6yDvqcLWRog4CIN7RqTgFHPmvjH4iRSkg3c4aIVek38YfiyP/2aQZVcxggCWVtp/
         cjT8YzYGdXq/otIm1bJIRpSnyLYS6NCXzTwGMwNu88vtrcFxR+gqqoMrpeTlg5+7U1ac
         iO9Q==
X-Gm-Message-State: AOJu0YwIWAIIanjQ+CLXbb0zu36ljS2h4qaZKhOa3o1gmvOjMyPmqWCC
	DtP9JwVv2q/97kLKQ59rPtvdQJW0mnWuUnDkMmBRtrMXuyFapzZpwHWgzIhFTBbxIcoJiZ9akk0
	FY7htFIUJlTJk5QFw0n9Ne8GxPkLhPtMYyOTEGIiGxcJOIcpc89bCqGiHKuqn1lEu+P93
X-Gm-Gg: AR+sD10XSRRVvKW5u3t+XW5zr8d5+noDoCvVCFjjPfzCGKs1U7awcv6Ft6Ln2FsfMcQ
	2GJWu+t/pBVyu9S0VRkGDMmNUf3+BXf3BewN4fH12fX5fyYvIzqXZU7Thfin77+07MnFMcisjXI
	6t+BcyOPyi2okTL4x8NHqikxhOZ1Y57d5SA8FEIzoMjeMV6pjlGk6vtZJZ5kevLnOvVjq8vrIn4
	wS/tWRIUzxoEwxZrCTkyMm9295vMCaNzttm42LxiTCgtbdb6lbiYvAsQsNBJh0rq0LVdun+Nsi1
	/O0lthpWmnYpNxv0Z4hesfimv1PCDdFMX8CjTDGGXqo9VBzSIrBr3mFSqVirx3spkXwuc4Bg25Q
	aDADSKy74cOEicWvI1LD7GoUv
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953471cf.1.1786973090882;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953141cf.1.1786973090323;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66a7sm26799466b.59.2026.08.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:24:49 -0700 (PDT)
Message-ID: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:24:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2u_wyp1MTcZ1Gv44glMOVHPzxA_9MRdT
X-Proofpoint-ORIG-GUID: 2u_wyp1MTcZ1Gv44glMOVHPzxA_9MRdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX77Daf2v7FZMa
 Q3cmm7gLdTuX1bDRLdcIFhuyRxEteXd8Fqd2ZZS/AVq4N20NbQhDGyyReOYJri9SPlEn1HUinNp
 EirLozoIFTh7/J2sufDmLUBAiEwFdQ769U66B5bg16s2/CCQvQAp9CMi90MU6Ef5etTFEmDd5hZ
 rZRuvdC95pLB+X+EtsbRgfDe7EM8G4ZCWEQEU0HqUgmBFeGvk5ksCfr49Jb83fpD3RPhAywevGe
 OtsmJlpMjVNU1wGD3dqVHwQp19vJ+WI0uQLDN8CR51lF9hZK3BYm/6FvNZE4SOqK6tVuzIBwtd6
 TyK4KgHUSwbvMGoHwj3r3uEDsfCzCz8pR8r9we0WzTdA/ujCT5zB5aZw3rlIYJM3VZZv1zNtLGU
 +yEtXNwkdaYVsQwqQNEkhFhxrHoUZLJYFggl7IMYgqWIUpxLkq4HPnEKHGgnrD70TXR1Zthflz5
 dD5x3ttkC6Zi0BIcGzg==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a830ba4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX/FKxmZF2vL9h
 C+7fqpY+qI8/uugXdwm6Hjt5fI5bBWbae79+9n/TXeyH++Mp5comC2J0XHJNpf/AcDxKAC3UBH8
 eZQIr1s31w7tR0aQwJ9SeJFP17GuL5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),

Function3 can't be selected because of repeating names

In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
Perhaps there was a longer name that got truncated?

Konrad
