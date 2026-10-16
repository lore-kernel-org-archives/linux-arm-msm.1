Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDC35DA6E
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145096; cv=none; b=CXqVHkrpU994JxSn0jNQybBLYi5Dl60sgc3NrPtZrNfPIiUKyPl99nM/pqALGgWvPFrVCFpJJKnRfL871qRkYnBZzunZven/bgY3UKnTHDivy/tPJ6Qwil/XrDY+O59SX/eAT8idmsxBB7ODnPpZLusixhy2ijk90nGhZjBQpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145096; c=relaxed/simple;
	bh=6nMflZvMJMgWGGh3gas6TvYF4zUj/8fC3ydtDn2h0lY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nOba+mPIujyT82AitI5fFNrkRnG1xUhU/ESH+DTSLH+/vE3oAdFdcoD67gNp8e/odtvLyPt/Jx6YGzCfwL59BpxaFeZxHw0k8t5M9L2Du8tSLPJX37L2UnFb15+EpTbaRwyx4zDXNuQNhY9+3Qz/URbmpgeYB659REf/1hOCCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk1zrW6f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJayVWHk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk1zrW6f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJayVWHk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lonk2312839
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=; b=Bk1zrW6fVMQbP9Hu
	+z+7SE7pM5YhieDZ7/xe6aCpAiCt2F+N1iNs0jy6EspynZMRGjr7tmHzZ+JoaRmo
	z+gqkuMjX/SlFguftuhuRYOiS781nXWVB2U+R5wZ69UkzkWEuHO7FY3X1ER6wCKT
	LypqEgEPlV5wi6pWYzluvCCIvOU6NsxlYZE8qNghvqiWyOX5dIofhiIGh9RaWgtf
	15iinKFbh/IGjHBKU5iy+bg8Y0/isrnAohtllIiQriEkWr+tB+GGGqYgskfmXU8A
	pzrc/d9DwZ2uDy93MvjZRiVtPBzT3lyvNd62Hct1juu8vnpJP0Y/sgjdv1C09a4U
	gpuKXg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa36rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:04:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179fb39cb4so15478096d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145091; x=1792749891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=fJayVWHkr2xRlkZrqSm3ft5nL6pfPtj169b3TFLHXzoOP8Gpql/JxoqycDRD0fnwcl
         Bq2+DBptTv4/em916KaG70f1GFw7NDFV3oSSPvPjWs2/6JphFQeGmXzlUJEqsOozc+Os
         /+znLig0qdtfki7HlwTyUMknIWY6MCOM/HF9IPqkKWP+EhHtUSRMVNfhOD+N0yirCpp9
         4j2fcLe9lBlhvj5NUt6+xzY92N8QEKsX3siUT9/R0/+cU3+BEaB68ntO7JJORu5loyLc
         VEKi8tRNsnlHaxngL9HvAYDaW3R+MdaoZRKUudi/H/i3/VGwiEFZCWS6B+8Kew9nlLeF
         Lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145091; x=1792749891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEyGzHWseU0y8G/3h8PBhHtLrahS4TkoKfI5G8pJg7Q=;
        b=fffwhvLLQcMgHbOlyqPShQoWR0EUPkDf7UIJ+Dg+Pl2tkm78GnH8LFV0CR4hyriQN+
         A6NRHjnlKIKH18z/Rg7+/xghmOE7f00IxI1pbKywFyFZBFp4czTr0gFaRMjXjnVNj6Mn
         UhlWEvz9cRhEuqi44tfjufJa0Hmlulfq+HQX0SPskrSUTn3enucjA96JRZhuNkGMwX5/
         378JUxBbj2dX/njVL51peoARn5A0txDX9nJZJTCHWBwQv2bAQxJz2h/EJy3NmxxphN1N
         Rqov4usoHTeVVgN3OKMuHqn0TuZXiL9Wozi1Mx3/wJePHsIEs/bsLMS+HYFx18SiZ/0D
         HT9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx95NjYYRsGX7PF9B+XuA4QmlzQginI5aymEuI+gAsXinDMwCi+j96QGudO0hranPIQfEV3Zd3wdbQ9S/6q@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tlA3GeEpzDX+68ALx4LG4nbqiPBOg+SVquPFViCshCCkUtWb
	NKzgwitpglTk6tj37rXSK95DONEdz/QJ6cLoBVEdmyuC4/6u2Vupha7UX9c7ktvT7pWF3TeHEeX
	KOetqlOl/4qtcee02EI0TTsll2+yCa0ikJ7CS8DROqgYCR4IvLZJIMsCTTOeTpKVPNrcD
X-Gm-Gg: AYBFou1QXlCMDx0U6LYCuxW9ECAqib4s60NP3Z8YjSoLThYSiNVjrR99sfV6zkptxKO
	O5ER9pv6SlHSXlVgZRzB1shlLcVoerAphBAi6O4tZOzb3VdWIVcetrIi2q2SJPmnAAwr0hrnH3K
	qkh+vhX1nojPfXf0Nz7rj6Do27HmzAcQM9Sjd+tFYWbFTWJP50KgJgaqgMIvM+8fwGE3yrmeC1n
	zY2AqbToARXwUxH4/r2ul8iBsm9rt6g83+yZId8OTg+ptVksX0zcnBDoEeXs8tPyrbvoAMTDvhg
	0f6yy8SxyG/5LqCtxAAgUzrUuCFTsrCVKSu9Q1cKyLDIAtFOwsd78xdqYZpopqEG8yVdKA1JkLc
	o3Ci2ywaUv9FIDaGDpF3Kyw==
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254586285a.6.1792145090839;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
X-Received: by 2002:a05:620a:ac16:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f1a1a2a48mr254581485a.6.1792145090280;
        Fri, 16 Oct 2026 03:04:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1334e0sm719078a12.5.2026.10.16.03.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:04:49 -0700 (PDT)
Message-ID: <204766c1-cb83-4636-b779-fa01bbd17764@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio codec
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-10-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-10-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX4wEhkp4qXGjA
 InITubF2wEImEfA1QyaF4BBgzqcyP247bLLEJKz2fo0Szqv6u10yE7zyglHy3m4Y4toUq92hzPZ
 8PS0dJc5n+M5O+UiXU/qlIXV68XtfGg=
X-Proofpoint-ORIG-GUID: k4unzVQbliuaSFt7IBvQ4ggQpUDSqxBq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX5aHIgrh5dOkb
 j9gOp6LwXyGNw4migMyDKCUO/Chv8tmWYusFcAzv3BNDLMlU2wAU8w55Dud8hNfVwZ1moHkSeOz
 90IG18zsL1SvRgVgVCaYhCl2+jtuFxxErbEq8hR5QC4mnvvcTKamkzPBzHNpJP+KBf8+jjw+Lpc
 TdnqhAG1zkKUuZ7R7Ondcy0cLozfqwUHE+3aLCG6jCmWQxnPybc5X4OO1wICeYOwpL4gpUvvKRZ
 SEgpUHJY8Yp+xw4VT9Lmlbc8iwyE5PpdSqm6RtPLoOYqv/lBNcTlDRA+0En6Dw9Rdm1zNG0lpBs
 FmeLKZo1TB+KXvS67fSOqXVNPETjWovnVGQV9ndoIT5Cda53XmP/Wxb0+m3StLY7jHlv/Witvfo
 AYu7/fa++Sz2bEVYJ+baHdqBLIiNOGc2K3D2sYWF5SFPBxaRg9VoHwBAQcA26yfhqzCzi1jJKbr
 qGi5u/1Pdd4YlzOwpyw==
X-Proofpoint-GUID: k4unzVQbliuaSFt7IBvQ4ggQpUDSqxBq
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1f6c3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=J1RzbaDzFta3Bh0DJUsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The PM660L analog audio codec (PMIC revision 4) controls the headphone
> jack, and optionally the earpiece and speaker, at the vendor's decision.
> Add the analog audio codec.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> index 3f8b9eafe164..5b406b83043c 100644
> --- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
> @@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
>  			status = "disabled";
>  		};
>  
> +		pm660l_codec: audio-codec@f000 {
> +			compatible = "qcom,pm660l-wcd-analog-codec",
> +				     "qcom,pm8953-wcd-analog-codec";
> +			reg = <0xf000>;
> +			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
> +				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,

I think all of them should be EDGE_BOTH

[...]

> +			qcom,hphl-jack-type-normally-open;
> +			qcom,gnd-jack-type-normally-open;
> +			qcom,micbias2-ext-cap;

And this is probably board-specific

Konrad
