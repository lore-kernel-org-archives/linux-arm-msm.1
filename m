Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793030124;
	b=cPW/y1k3hr0Qd4M76hIdClQQ+ZlMZP1MAdUoYAWhTNn3RrRKVldOi7RzzH7BTjOZrnkz
	 CoLr11Ff+6Bjtz+VPX6DDsDmtz/Y3VKYh5T7qkliPzhr97brnldpsxTiWpP7+oc6clA7r
	 6NKS9fpFetI/GN7p0q+BYBngqjHUSYlVisXRcQGsbIaVlmlhwLZP3zdkDUB1mTbltkoOZ
	 Op3BDQbNVZ28VE/VpRp/n7C1pu0zvad0ZaQpm+D89xctc4EZyRAVIMK2mJQbWvzViW38a
	 8t496c9qtZ4NLbqz7+v/9v+ELXomq2cIV0I5Vlhd90wV9hGfftZgatOJydQFfbR5mjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
	b=o/2bcLGzOHYWTwpKux0GX7VSKLvET+vJGhj9o6EIwFhlsUcYU5AhECVfeCJpZASuM2uW
	 WxCGIH/h196wyrkjEMdQ9erDf9R3kf+Z9+V/04gxDlLSnyXbxNkzTxhAwVRafPLcIDM4B
	 OubQkfoMCGvvNHkHzl5mrC7REOweCEIPRqTadSZzNx3ewUrE2DKHvFCtutOFh9mRfqwY3
	 31EnA5s7GMo2Qbk8fZpACGaV6a+3BL/rz9bkWl38qjhsZyyRCeoh7FIZg1E94YnbfQy6D
	 kEbDzog5nNCEZvmO6E6lqpahCMCi10yapumNkYyBk5ApJAm/Fz7fG/qm+sjvOlNrv1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fPJ9y/io";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D695C606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D695C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lWPPxewv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPJ9y/io
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvvs72707724
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=; b=lWPPxewvOGSt1NOm
	Ok7CRiQeGvMVBomvdj+svWxYv2ppApqDxoT3WBi0xpMQ8Tf9gHOYDDFRQCBYwpop
	aniQ5KnIaoDG79D2iWs9RMqQLqJfe3qzAsMVrFVnCaJMvBFX/Yp5dk3OrOcHv2Gg
	ZKPNVFfbG88l+3GxzEHzS7NgAPAm595Mp8PKIuy/nyfeJrv5XEZ8wh/rTlfTqd9H
	MmwhS2A5KiwrpbPxM6tyokNsNNsgovb3tiZSODe/nTocJKYLlHn95xNgMoT5T4Jb
	Lr6LSxF50LhrLtMpk9inZSkQSTAwaoxuDj6uQJ8QQgLyQHfvcMQ1M/QDTlRSzNSq
	YK0q9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u61jcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:55:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f322ef7d3so704526885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030121; cv=none;
        d=google.com; s=arc-20260327;
        b=ZCg3dJagF4czIb4/mt9QTh4tfMTthKVhnh062d6l2MmhaVxvgC+FAGuNuFyWlFRHco
         ebG6DV1QIZvrC1eMgOiqSIHSBwSQPk4b5kXlIZv81C/v/NWrz7I/2URFNnGwyAcNHeH1
         0W3fD7aNMdcrOYLrwzY5x+sbPy5lx/P4082TSSXfc9ys7f0zpEifcXJMQ1onznjJ8gHY
         A3h7s4bgDkga218yKgTv+qXLlkgT/qfFiEf2w7BCDzXCwnvOx2cEbet1PPHYkohE4X+F
         ltrq+9XHKYClqRiioSrbUBMshauqpj/aSMLGnkdo5KKSv0sXXYZRNZoWU3YDnE64P8NS
         38LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        fh=vN7gXmhZG3b2BIQXo6L7OvKf1Mydu+gTgdk7xsCXm/Q=;
        b=Qi12V0zcah/FQtSV88Q2SloYtki50n+2+oEApmu5Iw2xlRld30wkrqrOwov1D+V4Rf
         wdNdpG/lqYowGJ/uSoCzKTkNw14ndvdyq94pkTACANZMI22FPdmvmYVpbY9+scZ35uDT
         WlDLLWcCi0EFIZLKahKz1qVcVOEsNuYcGuFbxfbP4If4w2/ikbgXnbmD9TaH2Ze7h9X1
         IikyANoMDifDaraodGmkBIfVRh5N/+rBr1jnZ86uCwbQR7jxgqh8lpCz3GPEn5Q+7mCR
         KoJMIan1hUWEe3GHut/p+mtkWh4iL1cH9NKeqUmjTd/9najGEEpl9XR3JjqkXiG8GQA4
         uomg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793030121; x=1793634921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=fPJ9y/iojzimRkzobifb4PXrCoO5h53pEhte+j6mhhhIgkqMWtrROWa6+O8bsIaVzv
         w9wnhGyibi7u1EWPBr/2O+0msgKQiwyDfS0hNTWi6SCBE+Tm44HX1xhCZtN+c60bfosm
         iCS/f7JokW7lkb8h9hbJCYt4/lb9rCF5WfDXYMUOczmz4ZQBHJYVMWeXcmopourC82WN
         CVcAg16wFN+kb5YhFb3y7SJNvNyecbL+KU6i+n4cEv4mn37P+E+AahQwPBe81iVQpRPO
         dI8sVtwqXzU9kjfN68t2LSISGSBfipAo9yubUTLy/ITFKu2+tDEZcrIxXLJpYKonvVod
         p9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030121; x=1793634921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08tb8cGUQgTzlrNjhvrJlu5bOc9BnVgBL+7qiR0zeco=;
        b=uxmzdkZMQLjS3S1J4uIEt5/6mAyC/brsf9KPk3BWKohdM+7d7ZlNwUHI06qP/XtGXs
         QPU88ITYgsj5gA61tAdFcqBl92DP56CRX8eC2qjSSbY3TPrmH3TSx614eI8UEmERrjuj
         MgN+W2Y19hGeOGBfugk2RLm5SHbi69XFY1ym8S+V1HQQRhPaSxA4SxbZ/J3aUPqO/S/H
         Q8aQvYa1TMIuu7dOe6gLTi55SFZSTwuYLR13aUWccsbctDw/iG4z95KS11njkxBgTGA2
         B01pzNsZArJqHazad/IQ6xWW2WpJ8lnMXe2jWt7gtBHgRSTwGDnG3xWuZ0SMmckk3lA7
         ZI4A==
X-Forwarded-Encrypted: i=1; AKwUvByFam6GHOq1puysc7ZEgh0iXoY5C14SuFGUKQdumVE0lwlNcjnMWGB34dRilfWeD/j5HfBUoknbhQwrWfrH@vger.kernel.org
X-Gm-Message-State: AFq9FYI7379ZX+Qckz8ZODoGk/87TqT6cF2/5xSuWzAhtlDhLC52WQ0Q
	MlYNbQOiUljFB6zLLpqPKt78HfX7ZqfkzXbt48rGJ5RjZtY0zMw3YRv/3eLv9Iih963eOBARDui
	ULLyUujFY3BOzL8EP1jMiM++ntAVJNA+epYQ1e/ngNjURf7qUbVio2wpmwvq9j51/e9rRW85vjv
	LGEpFcrWlwq6mKzfLXco3ND2O/0vjnPZ5ylwJwI6csrpg=
X-Gm-Gg: AYBFou0Le38+3gdbVlX0DwkCwKNMaHUv1EmLdy5Tmc5Jj14Svk+5Ah2RXaA5N8AyOtE
	Hqw3hInnLe7/q4ooOquboPAkecHtt0T2xllrp1NGw0ktT/TJNX0bDd6IZYgS+zPINDni8eMXLtl
	M+rNCtyFvXi9qgWoIGzvjjozamcmhnDFbZPr7jjDPTYmcyehaVEguKmW1tQ11mZ/PaT2lFJ6KT/
	GjIsp1UT4W9QUOJyuayYQtZ6tzzlBXkcu7xkZCEmNRvXJX5nmBTz4Xgny5G9pyHr60GHkFUWd88
	Km0vweOZmvm0M0sTOTGTroBWSJME
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id af79cd13be357-940ef980186mr1055271585a.51.1793030121336;
        Mon, 26 Oct 2026 08:55:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3704:b0:93f:3193:ac02 with SMTP id
 af79cd13be357-940ef980186mr1055263785a.51.1793030120640; Mon, 26 Oct 2026
 08:55:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-12-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:55:09 +0100
X-Gm-Features: AclHuK8WDpOBSzsVbZEzkBObqQEK9KTIZDHcYBzFPmgp6ilQX4B5wQt7XAh5H-Q
Message-ID: <CAFEp6-22zEVoTQ8ewQN4CGW9GARZB84Mp_-SO7KrteYERSew2w@mail.gmail.com>
Subject: Re: [PATCH v22 12/14] arm64: dts: qcom: kaanapali: Add CCI controller nodes
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _TOiWIAL7l_NLVMGcoovjafHcj2S_CjE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfX7vsTjGJGgdSY
 ojR+KEuntF2+zMEwvStforBa8gu8T1Gl+FX5iF0p4AR9rct4tdGftCwsYn9GSAsH4PeaK5yhJzu
 lPet1PW90wt9GskAA6ljM1fBLFqRvqUNj76S69D7Wq+oQtu3gpF6yJNzyCZ/7bfiiOy4JqmmrRY
 C73p/DaiV4DyZv9dAB4fgMZ4dSl3pY/sz9NzZyA1BBOWfEONtEBf/ZrmMclwE5ltGayKh0c+AX5
 x6qAhn+Bh3UdC4ELA/mDFaWRT9Zf9s73LHo0nRyRVvXTCLKd1uhIDa8BZIxYelMc5zKGK2Z/5pm
 aAOakCqQlOamEM0MmtfYV2ACyiP351xbKa3TBd/jv1b7zzewJrhdlPVsunzeYlfzt+HKAkzd5e/
 BTSoSCEGogDGVSWGVoKmd/0/+WdLrsIYiyM/V6HKpGgjGY6XtEXjsvRg0xBSP2qmxc4OGYdlx78
 TKU98tgHjnCM2Vi8Fag==
X-Proofpoint-ORIG-GUID: _TOiWIAL7l_NLVMGcoovjafHcj2S_CjE
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf77ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tIaaiuYHFHHTaTkjKuwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MyBTYWx0ZWRfX3EkgTfEyxYaP
 6smGNMpNdUrfLkHJGEG3YEzxV8n8oqHLy2z67l8SVmHNJT6TxiZ+zCVy9EfzaO88Pzr2Tln+jMB
 Ixg7F7gCk/FHPAUKjZqGOmHykBFQtuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260063

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add the three Camera Control Interface (CCI) controllers present on the
> Kaanapali SoC. Each controller provides two I2C hosts used for camera
> sensor control, so define the controller nodes and their pinctrl states.
>
> The first bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio109
> cci_i2c_scl0 =3D gpio110
>
> cci_i2c_sda1 =3D gpio111
> cci_i2c_scl1 =3D gpio112
>
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda3 =3D gpio113
> cci_i2c_scl3 =3D gpio114
>
> cci_i2c_sda4 =3D gpio107
> cci_i2c_scl4 =3D gpio160
>
> The third bus has two CCI bus master pinouts:
> cci_i2c_sda5 =3D gpio108
> cci_i2c_scl5 =3D gpio149
>
> cci_i2c_sda6 =3D gpio115
> cci_i2c_scl6 =3D gpio116
>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 303 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index 11df1c7c6e31..86dc1400a25e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3746,6 +3746,117 @@ camss_csiphy5_in_port: port@5 {
>                         };
>                 };
>
> +               cci0: cci@941b000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941b000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_0_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci0_i2c0_default &cci0_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci0_i2c0_sleep &cci0_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci0_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci0_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci1: cci@941c000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941c000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_1_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci1_i2c0_default &cci1_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci1_i2c0_sleep &cci1_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci1_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci1_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
> +               cci2: cci@941d000 {
> +                       compatible =3D "qcom,kaanapali-cci", "qcom,msm899=
6-cci";
> +                       reg =3D <0x0 0x0941d000 0x0 0x1000>;
> +
> +                       interrupts =3D <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       clocks =3D <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CCI_2_CLK>;
> +                       clock-names =3D "ahb",
> +                                     "cci";
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +                       pinctrl-0 =3D <&cci2_i2c0_default &cci2_i2c1_defa=
ult>;
> +                       pinctrl-1 =3D <&cci2_i2c0_sleep &cci2_i2c1_sleep>=
;
> +                       pinctrl-names =3D "default", "sleep";
> +
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +
> +                       status =3D "disabled";
> +
> +                       cci2_i2c0: i2c-bus@0 {
> +                               reg =3D <0>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +
> +                       cci2_i2c1: i2c-bus@1 {
> +                               reg =3D <1>;
> +                               clock-frequency =3D <1000000>;
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +                       };
> +               };
> +
>                 csiphy0: phy@9523000 {
>                         compatible =3D "qcom,kaanapali-csi2-phy";
>                         reg =3D <0x0 0x09523000 0x0 0x2000>;
> @@ -4534,6 +4645,198 @@ tlmm: pinctrl@f100000 {
>                         #interrupt-cells =3D <2>;
>                         wakeup-parent =3D <&pdc>;
>
> +                       cci0_i2c0_default: cci0-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c0_sleep: cci0-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio110";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio109";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };

Why do we have a sleep state if it's identical to the default/active state?
Do you want gpio with pull instead?


> +                       };
> +
> +                       cci0_i2c1_default: cci0-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci0_i2c1_sleep: cci0-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio112";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio111";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_default: cci1-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c0_sleep: cci1-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio114";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio113";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_default: cci1-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci1_i2c1_sleep: cci1-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio160";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio107";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_default: cci2-i2c0-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c0_sleep: cci2-i2c0-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio149";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio108";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_default: cci2-i2c1-default-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
> +                       cci2_i2c1_sleep: cci2-i2c1-sleep-state {
> +                               scl-pins {
> +                                       pins =3D "gpio116";
> +                                       function =3D "cci_i2c_scl";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +
> +                               sda-pins {
> +                                       pins =3D "gpio115";
> +                                       function =3D "cci_i2c_sda";
> +                                       drive-strength =3D <2>;
> +                                       bias-disable;
> +                               };
> +                       };
> +
>                         hub_i2c0_data_clk: hub-i2c0-data-clk-state {
>                                 /* SDA, SCL */
>                                 pins =3D "gpio66", "gpio67";
>
> --
> 2.34.1
>
