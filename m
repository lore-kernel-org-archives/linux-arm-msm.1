Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297937;
	b=Wut5P9ze2dBLw5jldSMcMWMzTeBC7eYPK+YGi0fXc/7dH/GfpOV14bxrNOvUqsYTngNP
	 ozz+evq4AYtgEXLBomOxoIg1kwwz5XJMRrxB5yJ3Li5cfrtSpdI3SEoZ9qS8RvOCRyruA
	 e5JsUevhET8bcVex7TB0PTP6HbT3nOiz1g4SQOznxC9shG4UPfw4OZUjrvv22F1mq7TCZ
	 PIu2CyFoyA4LQvkM4UGp0+0CGVxDOM7q7ILLXRdmssQXQM/m8+V94nMWEErQl0NGPuRCR
	 JkF2f/X2YuDgBN/9vsG5bVq4NCblu4GKaaGAdN10vv8niPIPc0TSd1ETFv0DAl2dxNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
	b=GTjG9rdgz/HOzCiyLRc+3dkXEzmTshx4Eeb539lZ9beNtSjrfQiQLHsFHA5Rmgj8o3+1
	 727j/WaiOItIECCYjuz6YGRCp2/k6Q/mW40fdoIjqHequ7rU+umRghg9MNw2gZTFbZ73Q
	 Ur/keO+sdpAKd3wyYVKE+zJRkn2qvkwGFPe8A4hHf+pmi0XhdjWh6cameu2zvGPovGJDU
	 ZA+nrJ/fvmtnW/OtA6qFH6emrsRhH3EP0mC9j93hrVGaT1R74Us8x8XI8mEzdBKSuVnv5
	 M2HZXWhvRbI7tGQUh2bptYyCfR4HG6gk4Zp4mkql+v7bbqAGBCnOeE8oFp2eQTk4awQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE30606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE30606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ymm32Jxu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H4pmW70Y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lB0D1681576
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=; b=Ymm32Jxu9xyo0ZWu
	hBgC50+7K78337ntZ39i6h24qPBKxB67EcPcp2JxRBROQgcOJe1D01fyuRembgXJ
	hDO+Q/2Us0e7ZxhYAJXwd99DDfL5OvX152el6QeNtbbaq7o7gDCRw9fv3CZ5nXmD
	HubcxsJ3swsOCExsbfBpwLF8IKFi7Qy5sqGMu5MWy8bo8ZBap9k80i1oMTnqGcjS
	bcbT3LP1aDEpsxuHGeXWMTiBgMw6UBPQUhNc5NbUazzKOQCP3p0aZ63nBFawseqz
	2m6/ngKVhBFBskDI2lefXx1N/OCrQlWkBVFiMbbRfgBGqlTIUb5eBDsby8ftdu+8
	YfBTHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkj6y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 08:05:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso4299711cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 00:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794297935; x=1794902735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=H4pmW70Y1JPi0mJDhJc7PnIf5FbN+gXvBLGrmKVK8HW05RNipIuUFH9ZQMJE3aZNyz
         9ftdGtfFVotkP3MVjWuN4XsAC93wlxRHWmP75GWc95iMuxNw+zQSywOYFrbww9X0xE9x
         Zcn4yo7VPcR/22e9QU0VSX8VZJ5V+TTu7m8tsL8ggvSc73BVz39HB7m7OM2Y+mtfqFiw
         vskpGxh1giEzku6TVUTxh/Jhg82eoBswUcgkvFCpaxqG9gziejF4cmOw2a83ZyP/bcbR
         vOYpemoDQdCqWEmwl5X4VR/vP2Kj1Q5Wo5SPyGdFq72G52V5y7hF3GYhqDo1fWVMrqj9
         5Xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297935; x=1794902735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YT8knACpCd/q0E3zCNIRyPK5Dz7ERCnOxLnj3HrOWmY=;
        b=ahOG/+Ymp4Xn9JpjtFImdjuVGFqN1YNSppXceamlxZBuCXDc1H90G0uS6CLnO/g32a
         gYOMCKtcfYWzB3p3hoaQy/JJZ+ih0rv4vufOcEjg4evJyAY+oBcVTpTxsd0jvT7x4eMP
         93fFePgJ6QFf/aE+0A9eA4pcVf/h1qFXaAwptWrWFzvj7Nb99UqmK1uKpwB4G2a0NPJp
         UYCW0QHDmqycMaatxqcJeNZcTZOMMQdI6GveLPlnwR6FREXGfeDFsvpPJjMKsf9bsBBn
         Xu9A7hkwozep7tnL0zITiPVbKPPAb3L4bI4g1SW6Jx9HluRVYNKjTDX+FFxjQB8g/wPX
         9aGw==
X-Gm-Message-State: APuU4Z92be3hVAAx58vxZAJ/f/Tt2ourgsoBLOSYx+Z6SAVxdSuN+SPT
	J61davVAoFMXwTLvMPtExO8XZZzeXizlnm/oo9tdnmfENwtVvB4KplnB5ZlToi3PBqCxoMrZk2s
	O6u84e8IggIbHtPwk0h1er7jG1mntEg5NdgHiyW98WlV/w8awKSgYLel6SN8bcOaEaNpC
X-Gm-Gg: AYBFou28cYnExF2+8Q3ozfTs7iaMlSlD9qLS9DWNhuhWcj93cj+vGYrSlEkrdxiH7vC
	qu82YtKnAiGYRGRgMp93p0Kn2Z3dOEXSc9Arw5v4Fg3n4TL8czAOg2UH0ZQGB8t2GTWu1nkbrJG
	I7h4oMFHZCeymQeS54IppyA3WFG4vCxDWEci8MrsQa1/TYNP+2Pl7s883CFNLxKzIMtxrhunrT+
	kmm9yHZBpktVkZ10QtMhGFJo6NGybrzzOFjuJmbOtPoW/EH2wlmPXvtVkqwhi+qI+3SHGOKq1vL
	syc4fezLy6px+Nn3KcYLtZtOkJv6ZVN8Nr7DeY8jB9TkKgug8o+f7g0bnEa0prIGslkvz0jhnMt
	Af3USEYDUurpTMgfLAkLL94F0kOol9uXuTuZRaikiMs9WZ09WqHs4O4uoV8MicQB76hKQVSc=
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34573101cf.0.1794297935015;
        Tue, 10 Nov 2026 00:05:35 -0800 (PST)
X-Received: by 2002:a05:622a:8c17:b0:538:40e2:ba55 with SMTP id d75a77b69052e-5552249d901mr34572611cf.0.1794297934423;
        Tue, 10 Nov 2026 00:05:34 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59436esm79121566b.40.2026.11.10.00.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 00:05:33 -0800 (PST)
Message-ID: <68b721d0-4777-431f-bd22-e89c9c21853c@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:05:31 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-crd: Enable DisplayPort
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-mahua-dp-v1-1-c1fdfb8eedb5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SYoupVjhaZLnZPIUj9aEdY1kRQ9qVh24
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfX6rDhuFPya/mO
 HS8MmgTZTfR0pznPo39x7etde+/1pbuQqsi4OHqAIRiOG10sfq9g9Xe2xTVHfDNAc6zazx6JoVn
 CHQTvplmoYeSorEPmm13apotRxxJTUI=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2d04f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ArbKvjEle962CzFOaqYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: SYoupVjhaZLnZPIUj9aEdY1kRQ9qVh24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzMiBTYWx0ZWRfXw+tmU9A1miMA
 q8KCFiiOQel6ILcXMTsvU4MF3KteST5LOdKEfLFTOpoenzyFbQZASpqsDZRSQAfgr67pXlYWtmF
 PfB+ZrjkhKxFrt2CZJXzjCKWoVb8PPrvHSG68MHcqdyaZy0GbDH9yiyBEzhxPm8FSgQgFtMI813
 01iKfl18fy/UEDGDKLPl4jkUxcAyZzEStM/QNhjOrrl8+wjz/7IRCVCHyH4bf4HCj9cnAkGoG0l
 dbQQUT87/v/oGwcPK45uApkClc0jt5pfQOMTQgVRMY7jUUtz3Rb7Blu+p6uitWzsDxgkvAd0UqE
 Q8SsawBzNqBN26I1Qulvc9+EKHMCT6X0VdIUESYn/HvBTFSUwVaNmPPQYbBbFxpkQam3C/VI4kC
 5f+liQidi/F6Pj7apTlcbBMa/togQF9LyIMNQvmy9Y9Iwv0XrR72wXa+QPA05QOrL7AZojMlLtj
 c7aUp5aY36byuO2gHVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100032

On 11/9/26 4:50 PM, Nabige Aala wrote:
> Mahua CRD uses the same DisplayPort configuration as Glymur CRD.
> Enable the two DisplayPort controllers associated with the
> Type-C ports and define the supported link frequencies for
> their outputs.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> This patch enables the DisplayPort support in Mahua CRD.
> 
> Functional operation depends on following PHY PLL series:
> https://lore.kernel.org/all/20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com
> ---

An alternative patch was part of the power grid commonization
series and has now been merged as

fee7cfb39608 ("arm64: dts: qcom: glymur-crd: Move DP0/DP1 to common dtsi")

Konrad
