Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452B4A99C7
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364465; cv=none; b=Ma9yYqQhPC43eb6oR16XbJDldXcfmItNpXrR9W5EUhmudJZWPd6pEtTMyrr0c6QKqY/Z/0F4MzidTqQx2yp2snlxuz5xRwGxvv0wOumKka+z1riLu1dTiES1Qjs9fCKGfYW3OIDS3lQo2BRmcuiL9kkWYSXBFdy/j/h7A4M+2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364465; c=relaxed/simple;
	bh=gv3z1luQPW0kWiSW4nafQVoOxWYn1gnj91LV2B913+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fH3IhV6mWG0CTd6dOMPhH3HD+9MetaltTiPO+px4+gyZefezuHBH4Q1ZYut/7asId+eNHYjRDm73PPfjHI2eHHePfPpXtAm2xeDI60EVFb6SOIl3QB/XoDZH2PDSUVP1iyDZwMuInqa+CAKx9xjsPkKIxOf3oAUfdlII9Y+WFiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nr0H++Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abhStBPc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nr0H++Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abhStBPc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZ4B51284893
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=; b=nr0H++Ouy2NZn77V
	/8tmkA1HnODsnEfvM1kUtbd9ZP5yqsTh5yWvMpO6wkRYFAqtIldx7h1NMHtdyxgm
	4n4eeAJPRVgn+Edzb6no+b/S7vcTs4RKPTlllW3SbyjzmOVmr1wYUpGvnJA3W351
	YD80O3Vieqs+7qHZbtCr/ErPsUsFHVET4QILnK2t+3cuRylyoYNWSS8gYJXCSOuV
	K4NuxVKMD2RMsQyfYCACMaIAbRCy0/Hldfbt4G+3Y+xJB+qGDanykMFz9p3k7mWv
	WFitHdK1tcAkBvsYDapNQYlTymc6dYLPCpjz1nMmJtDSljd21SUiuYRAjJnGrHT0
	4X59JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb00ng2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:54:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93102454272so28542885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788364462; x=1788969262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=abhStBPczIaqBwb40LCY0F6vOvQfglO8zh+rtDIZ/ZOpE1fT+/xnfGwwv3btWfMi2s
         Stt/Xj8brVgS6EuL+ByW21Qjn4BM5f66e/LHXaomB9nf8Y0HYxTVlaHpvZ34xJP9sYlm
         tx7t6WASnvf58e0LXMm2g2+eUFnujAti1rPT85hZWTkAsK6G9aMu30e9uelv9rRx2HPR
         BuELyu5VQyyrKflsCIjxHDL2coDFGjDKmKYHmJW+swDC1GCmzfC6m7n9et6g3aeXaZ2v
         cfRnuUBfxoOhBKDlA51NCI4fQggFboWvpsQliilU3U1lTkL0mu6PdmEc/JiA/S1o4NxL
         8F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788364462; x=1788969262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qDbkdyPhtoLKFyUKgvhaPrzl5RB8r9i8ln3i0U+YBVY=;
        b=BGf0R3HdSgBsXxiyDO+EO5pBJI07Gee+YtnTVkY5bmtf1VPfKVG6tmWuZ9EZETkpGi
         12yzJu08JfUj8HNXgG4zPiatrlHw5BfThT+MputdB+AucisVmsr1UacUJY4w7brLCMkY
         UQcLo20wnU6pD69QMznXz4BlYcxuN3LF5jnoZEd3OABrBBdPaGS9mnBRQL09Aiw/sTuT
         AagQpktFTPwR8H5SSLklq4VjY+9/v0Uhlo3A6ZykSPdNMR9wuCdX0m4mj5exCLpDE8NX
         Tri6f2MjyMD3SS1SCR+LjmuDKHRK7O8fb5tVIqhEosOPu7WY32+Zt1bTiSxFfeIwfX/u
         hvqg==
X-Gm-Message-State: AFuF++lQJsJwE/jH9JUnwH1xpYyqtUdguhVD0DXWtROBP5PkdGaYA+HF
	oijYEDpAMgjgTsaRplRSpaReeGzAdoy6DHzkgjdAucmzwO4NE1eQCL2tzBpYO8VaTXZPsibEnLS
	14MGzTrq14kWMpIXCENwWenie31dANiqhR6NtpYYwAay97mRBW0cC6blNjGp1lSMjgiKA
X-Gm-Gg: AR+sD10ppFM6gl4wnoHqdq1ATupcDaMSeEtUQqio4cTmIvpfjwMaFgD7Tfjgx+A1F0g
	TlVkIUwYaZGcjg8MeHtsbTtiKEHCPW5ioo+r9gZ422tWmK9VrRoi8OtdcegB7hA3GYQgbwu7aQ9
	XdIEd0Ol/49Yy/wFkmKZCVxgVOI7RtC749atoRyvXULgvbmeXMAZkzlpyDkXPqkuXdbHU+0WZfV
	lsJ4hZeqdDOpFZDYq6Q0Oe8Miu6dPEEMbmDqym5g5d5zlMXU6wNpnZoePJR+Gf2eNNojoBKGX0K
	xgTZMMkYItEaMOhetQrs0/LAzjnnrjsk6GhMvsFcnqiwCevcHtQl6PD04+ppNO73Y3GFES1BFTX
	fzn77uNb5FxefTrvfp47bbQ==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400621285a.3.1788364461483;
        Wed, 02 Sep 2026 08:54:21 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr400614985a.3.1788364460903;
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f95f557sm1378949a12.31.2026.09.02.08.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:54:20 -0700 (PDT)
Message-ID: <0ba34862-0268-428b-850a-a43f795c3065@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:54:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/16] arm64: dts: qcom: x1p42100-microsoft-sp12in:
 Mark the EC reset gpio as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-16-f4ab7e4bb75d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D415CM2WzltVE4417HBjoZ4OKvYNoXA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfXxodYk79F3vf8
 eI9JknaCpXkicUc98QZWGWZnePaIIU7I27dzWR6nYlD+vYmqXIZllnTxlJ/UTRK96A+wEucNGv4
 cMOO9j5o5/DoMbH9teUiFeh5sQqKjV3/mVu8ytQew+6OB1RrGJuevuoo8eM5RVYGXUZEJVx0XQY
 qiDN4PDQth6ODPtqmdAHG4NVT+5a19e3RXPaMgdXRsoWU27y+lnFmG+4ab54EbSgvqWGemyqs/E
 nTXSaUe4U7iCCT/jSXKSSXXsr3ldl4ly+wpWK7W90L10dz9kMGCJqSGefXteqHGBRR3Kk/l4l0p
 PUZyG/ddW+suAmtZeYpX2fvpO/EILKf+8HEIERoQ6D4VUMm2CbYxlwVjj77NHgv5Ik5Gqov2Vbe
 W0Hs8Y2lURHkq9Ih97zPhOsfcgy0hMaB5R3iuugUNohDRv3KA3otuCE5EO9kS15ez8LRGUOvwi3
 KObYKndaQT6w5+VAN0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0MCBTYWx0ZWRfX4BXVf+R/34LA
 q6yAOTLTxjyaKSd/D+Jk5dXAUs1QSTEL6Wx0M6XztSZA5McS5bE/RWbWDMZfSTSUSgvj99W/j2X
 ApFg+x/XDKUAxP9XK9BbKmauoUM4lCM=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a9846ae cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Wad5cFZijfJPr_ZhbakA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: D415CM2WzltVE4417HBjoZ4OKvYNoXA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020140

On 9/1/26 10:07 AM, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> 
> On some devices, toggling the embedded controller reset line makes the
> device not power up at all, unless the battery is unplugged.
> 
> So reserve it in order to prevent Linux from requesting or
> reconfiguring it.
> 
> Fixes: 447f8053b184 ("arm64: dts: qcom: purwa: Add Microsoft Surface Pro 12in")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> index 0314b2246cdb..7f7245773e6d 100644
> --- a/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> +++ b/arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> @@ -970,7 +970,8 @@ right_spkr: speaker@0,1 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <34 2>, /* Unused */
> -			       <44 4>; /* SPI (TPM) */
> +			       <44 4>, /* SPI (TPM) */
> +			       <65 1>; /* EC reset */

Same comment as the other Surface

Konrad
