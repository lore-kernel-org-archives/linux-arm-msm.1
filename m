Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0C433E348
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307031; cv=none; b=o5FSQwbDwTabuRP7nFejlnttZhxUGL1LYUVuhafyXP5d2XCmc7byQebKvFif1oJxDWtJSyuNdfFkP8Z1en7IEuVNC7gSaCDrdLjMkxVWXfmcAjrkKoYz00zjU3TXO+UldtaI2e2ywf2bKo3RtVtfUgMvODwE9QOXukw71sFgZ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307031; c=relaxed/simple;
	bh=o99jVqFC7wHEBkyBczshlTFgv2NKqku95qjRxUSMFRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r88ZOo4JCBfQmHnvTgngQwPBLGLNXYdJUSTKwwUs0uMbmubgnRODaNO1zszfNXzOqxOaYhHUJqFNSZpwaROo1p7jEi3KLM+1dKCv0JRFlH312aHAg1fsQzLjbllti+6Yp848//gSTteCq0AKbxDOzERzk4jCIscfrlgX4NWujgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIhDHfER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxCTgMZF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIhDHfER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxCTgMZF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HGoBZH2177701
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=; b=cIhDHfERbEOt/8x8
	4l/xF+/nQXw2DHQY4lbUGOhlByvzaL0arXOzWSuM3T5ID89XPaFV0e62Hj8S+x3T
	1WxZVjq7Rnvj5VVCfyS3jvxoA3YN3x/gwthi1seepqdsmlukkqIpSksSMQJmCi6m
	oGLWmTDrQuc18q960HyhjHSpu15jdYyd6rW5QkqDdfEnaVeqSx+d3ekpXLje6QYS
	B7cpvQjzMOH+uibOXJ8yZEw2P/1L6G0wpx814wFLXB/bi8JNV81T/DLzikKttoap
	wq7VsskAZXxiesdFIrhfBcMJwP/EBgKIlWN8Pzd1OPqD62lULaBs/zhAu4mfSRdQ
	ZW6Rjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8mss5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 16:50:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so18632831cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784307028; x=1784911828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=;
        b=bxCTgMZFbml7hvUX8o/ge8bEz1ScGdtgVW1QmTzvPHmLA8aH02HnhdIxQxLr5j/dzH
         i8aJ+PAKgnM20rSgsvNcEbp/EEDvN1tLRdYjFLW0u8EeRmExX/F3R4dr9aT99dRxRNbL
         AtPhum5GuNWVOMJ763if9Gr2CTala1pZIT+ORntPLPx8IjLILVJBaTNtc5h/Yex0xzWB
         9sJvYAgPUI4hh7rkNuwpmBmJPKJZJxlmaGBPlyVYCEKzK/RZCzsZMEwG6QuhSw5KR0l0
         ZRi/59yZ3ESCalG0O5c5e9YXPQrkwXjwmgpQT2renII/FZ5UO4I8UXW8MovBjTZH/4xr
         GY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784307028; x=1784911828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fk9Wr8mMEviSNk4R/L0xQW2zH3u8LyETjvs5hgvYRQ=;
        b=RktfqY7zXSuMsALqjbCK8i5prP06TsT/Wfte1IlEvNCKdDDZDOG0t0pPQeET741QKp
         lAJPzlhmqvd2okqr/+qF3TjF7WVLHe4G4Et8zJqultxiWvJ9g20lh16wd9Zl6AGP2vaq
         2lQtctA0PZUnsdTpUyrr6ly0TWFl/cgeddWqlvmcov9x65JFD8hGA9967lo4cH46jeaB
         Q90W4OZq+2/vgqDwsCED+Hv0dAQulPzq73g8twUqSZiFoR0eOstmaulBjZloV4I7S0Fc
         hpTSnlaHn48fWOmNBOSwBSc19roO1txwCox+H7etQ8AwVplJJuZMijeQvDT7hmKZss+T
         sIBw==
X-Gm-Message-State: AOJu0YzI05dJhuay6pnBLkiT+tuiN5tJ1S9SNm6C2IP+byZdn0EXD+k+
	xihK/bsM60eS8K+jjkloFJUZcNxALvQUEwO15GsHqy1kEZ+InBL95DOfdRpu27v1B3d/HO9cAhq
	RgcIxSif+DttT+9SepKiRmfh2J0pzQZx2fI69QImRfVh53lXb+I5QRg3TAA6KLJKSBNOa
X-Gm-Gg: AfdE7cn/7XMjfCV29zXPNtKlPi1UZoJS6RSgVWUx2WbatWrKQyqP5RUrebWAAAzU7Wy
	jdmIYYrw7PNK5EbmO3LFetuNi331v5Gud0QsZiOusNrzDLyykxEyA9MgXvIoryMF/u1g8TsMOpB
	iclU9d0bxfziBLp4ZOmkmFUcRrF53o7BYD/ZE9aZIt2gd1sTt1zzj2P6HbGMYW8cRsYO5uQH6CH
	112NDylciVabD53TSqii2+f01ocdgu0XpFY5ZDiYhxhyH1S+Nk+B5oCKbBxfuV6cDAF2bF82EOP
	ZHjicJEhoPLy5IhLpyvqDtxFNB5zUT9O+61HqEvnS7pGHaSNUSiltcia8+DeOsN6j30dYh4rt7g
	yKIeZnQr8cIkFYOMBP3qeJ5eq
X-Received: by 2002:a05:622a:2596:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52138dcb2f6mr25143301cf.0.1784307028327;
        Fri, 17 Jul 2026 09:50:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2596:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52138dcb2f6mr25143101cf.0.1784307027875;
        Fri, 17 Jul 2026 09:50:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fefcf2bsm999595a12.9.2026.07.17.09.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 09:50:26 -0700 (PDT)
Message-ID: <5f20426c-d34e-4d68-ad80-d01e2fc4e33d@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 18:50:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared
 Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: feWaSgP4wnHVuIoAJnoU620QFZIh3_un
X-Proofpoint-ORIG-GUID: feWaSgP4wnHVuIoAJnoU620QFZIh3_un
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfXwi1XpVxdIZ0L
 7l8Ac/11S5LGbkZ43d7F+vg9zPELoTNM1POFARZybIeeShz5+df+++UKz+qBKKJF0qcPWP6soHk
 DPjBMHcLnFuQPoG81tlvlxboJO7f81s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE3MSBTYWx0ZWRfX85cbIYr78YUv
 YT8VK0SFAiS7sxPg2dtMTVRBflng4z4NudiQoJXEacl1sCGZYjt/opdpFu5MQozHBwj4YiXrpgQ
 KwVinrkGYL3AP2rocgSdTq1COGsDpZDJ51+KsXxbDiaPvku7cfyaSkHeaPosJhr34iQznNQuNd8
 KxI2GHZf+pgP2in6N0mHpiSvI7laf3jbPiK7DJ44Enz0uyzhAE7WiujbW23kHPPWDx4oykMXFp/
 wQEQHEeZ9bDRewa9ZYr16rawQlH8DOl7i96S/nM2nQSQdBttJEuz4S/w0jUM72sp857GhNaTDKx
 JgkYQUnQSLdwF/sR4ExdcytOTi1xkatGYThWjI4riXKv8VriNCezAiT6RRsgb70BK8m3A1Jpg3l
 UnRU9PdDLosioHur++5LoeVUCWpYBDN/7L2uJqk/KwYbbkWYTFrmnyH0hyn9p1AlQlC84Gqa224
 /Eu8wc51q7NwbZLMFhA==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a5d55 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fY-M0D_3ktg6uw_8VIMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170171

On 7/17/26 11:58 AM, Qiang Yu wrote:
> Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
> that can be bifurcated into two independent x4 links, rather than each
> controller owning its own dedicated PHY.
> 
> Add a pcie3_phy node describing the shared PHY block, add the missing
> PCIe3a controller node, and point both PCIe3a's and PCIe3b's port phys
> at &pcie3_phy (index 0 and 1 respectively) so each controller picks up
> its half of the bifurcated PHY. Update the GCC pipe clock parent array
> to reference the new PHY's clock outputs instead of the placeholders.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi |   8 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 336 ++++++++++++++++++++++++++++++-

These changes really shouldn't be in the same commit

>  2 files changed, 342 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index c12808abbfe1..e8e81bf9a6a1 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -750,6 +750,14 @@ &pcie3b {
>  	pinctrl-names = "default";
>  };
>  
> +&pcie3_phy {
> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
> +
> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
> +};

This node is disabled

Konrad
