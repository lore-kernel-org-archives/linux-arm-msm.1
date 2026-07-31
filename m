Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF791E1E16
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785483994; cv=pass; b=CmF7cgv8yilPHm17msiwM3UFD3lkvgzxKdlWx7s8D5ZP7Qa/ikoMHIEom7G2iqn/1J9NBv1EWMtP+lfty+02B7wkvafHp55ukjnZdKMMDEG0c2xaDLCwNkYxxjkgarEl457R6oCm7Hv7EnJJsCEjrdsKkmxl5YhTR5JQKojVJ7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785483994; c=relaxed/simple;
	bh=LxEdnS3KVLoZ0weADLgk43qVwGcqDXQnjG948MTUH9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMQKzMAlH9KNv/GmYJ1CWHJ3Bvsc9alCzEUtT4eV4K2EW990vzNoMGaiuO7zCx6jDOxcDZH25/fsLUibVLl/M0NJfbpAMgEVIjwud11GqlNy34h0nDTE9q/KlygocrxR5S/v9s2WWed30oUpLu+JzdtRWsNzqU2Ni3e9jK6ogiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=POKKeRp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EalK82H5; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="POKKeRp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EalK82H5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7Sa553241086
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=; b=POKKeRp4fd5OS7G0
	Ul17dmZtpYKgCwAvyz2U35dLwOZgqv0WsXwD2OfhDdYqiSIvXtKWQ86XIc7jmk2j
	CG+/Q4C7w+jlc8LbGfpjF7eAk6eQgf+owNo+uWyZPxICh6zH14gVtYhmYtWLlnCu
	iy5K1HSFMKbB1iMD1V4Fy2KvXCpfxcFiiGxU1SM9ll1vl2OcOs8/B2rl+CYXFT0j
	DhGGdt6wyD6NcZcMVh4UDgSi/6066tcRa+f1/B2QF3VBSCKB9I49sngKJBfYzTcE
	M+xcwX2qIbxYPhJERbSfIFoD0ms2dE0IgAc3UIfXNYOPshOU/D5giduxSmF919SC
	Oyf9cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqbfg20v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:46:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92efd2ca21aso137113985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 00:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785483991; cv=none;
        d=google.com; s=arc-20260327;
        b=C1G6slECvJZZMvZFPWYXsDzkt4dme6HziPZmq9XK0uIDyEMckh+xFgCYgn9DhxLK1u
         QvYFHvbmN0vDEjgKo45wO4c0I5X9mw5irI2gwouHB9w/YLzegtjII2qj4uJXv0ugBRLH
         AZ9XehYS1AR6GxKH+J2ZQjFQxmZkuV1J0xIVJ7NFYw4d+pQVyxLDlyBjbEMCZ7aGXRak
         D2bfV0XdxYdYRAtsoQHCcDkkqIrGtSeKVRBn4YLoa48NcZlTJGFp1vUbjOwNGzViw0B/
         JaXd3rlutLF2sQ06LkVGsYomzR6fQooeeA/nPGZWVDXQO7X0OxYpEhLA4Fcb6+z6akmn
         E8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        fh=AyjBZLIK6/Nd5jkjUYi78vbKQv3f8k7u51K8N5SW+zM=;
        b=CpAci2mi4YEbR6tqawjZ0jAyaNi9LVqf5h3uKa/EE3xfXyTxmn/0zJ/ndnneLYGW1n
         QuXMxMP6I4WDsQ9c7RfY2RIDyR9yT90niWDL0bMvwpAhJp68GeLKAXrRjA2Sj28T4s5X
         lSOmThvlaULz15EnF8e3fA26AMJ+4AvM2i5YLkoIjAFygVQV7ZBRkAJ4LOHz5C97e1If
         q8+50LFbeXYCH0l31grxtygbZaqBURgA8woeWqMGvBmjI/wUF2RWeu4DIbASOsdkA/mG
         /MHZ++cQRuUXOy8oWcnWMl8u4MyDAKWrUZsa72Hb5q6QzlmUq4ODMA+f4Hbz+HGaUGsB
         TnUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785483991; x=1786088791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        b=EalK82H5mH6ABbdTqMLkSQ2Lct042V9xo8kR8tX61uA0jsi1uZMiyCgxEqiFLCYZgt
         3iBZTasfanxr6PAzNmr1ZuPvxYFMNvin/yNr8m1SedS0dXjkaTr/Gc5UagSFLhj57x15
         Dm24q6epqx0V9gr1XIrbVhnkF9qmTMLFAHWZrTZ3aKTuTpIuhCCjQ8XbaNjL6/3xYrNC
         Q2hdKbIPGxWUvx4t0uOJUpZrOelpyUMQ1JQeGQWalbpstqGEynYVXP4oQ6oC2ZtNkflg
         2OpuKf/lbRH7uLz5au9y/JvwEET/NgMCKIj1bULhowKzp1RLRymw42WdV70BcoMkzLCh
         6BCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483991; x=1786088791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE0va8civ/9x7HdNLKJyNPgV1iJy+ua68rRyo7eb8zI=;
        b=YyvTnzsG5YU9L6E6R+Fictzr5EbHnwdn4IBQuC2zxG4OStI2nw0aLu6L+aHN0H2iaR
         12FvVEEo0YFULZHpKvZMkOu7AgEnamu9eV6P2YDBPszWY9ivkkAHkUTxoI/GglOI8KMG
         3/+JNK4pDfor9/P+82WQ/hSrDv1vMxafKXo/Ap5NqtMmlMRawRk3TsjR7hynaL6xglqP
         HUR/II7Vs2IDiINSxSLyauR8+o6zTB6n1pXYR08lzS3ml3wz9GVwMa0F+JcTd6hIpVD2
         bGgG6yGzJW8EA4bRo4ojC1ucOLgm8I9ma8BEpenrZI5xazcyoahmUSXFIGM5EtupzgQ7
         iKtg==
X-Forwarded-Encrypted: i=1; AHgh+RoNCRhcm0Sim8ToNAWlIogIxQCVq4iFk+373PJFOVs7sb8C8AjVHKIeHGdphgCcfZ1dcypIlNOr2olUQZBj@vger.kernel.org
X-Gm-Message-State: AOJu0YyL7dwceaztg43DFzFSD4z0LK7s6qhfn7Cu/4m+LpiJ5wN+7DD/
	zIYjlQQkrDevorIvJOyoT5CjKokvkeUgYbftvZHHsszid5An/Rw06kP4QWwDxZgE4b9SYM60A4N
	F/2LMaJe5tiGwJNjUdIwKR9qparjj2GKkXOWL+oGMXzAz0o32fOwKd+r1GYl+7NsokCN/rsxObu
	lj47wWHfaxesE89Xqr9Zi76JJF9+D6DyRmhgDLBBpQRZY=
X-Gm-Gg: AR+sD11EkhBuPthsJVItuCvsrSYjI9SjUWT6B6LlIviYQH/+L5HneE+0vi/oEzTO4Fk
	gDlFGg/uZ6vb14OMPVajrxLAoM4YXCKfdwBvRtnFfSscRyonTY4CpyULDiw6nxFdtXUtTxErYC7
	hUM5D73tjBj7sjfxP6xnbNkBXe/dFmumpiDeNgqSNm81bJ/g7OBhRGkZgpCEgFtDoMjOzEGl8cz
	1L8P6oNyU/EV2oxL61ltnIpSV9c5N+X6xVnCzu7R84gjeuQ9ceR3Ubj99SIjPRPAjaX6qqNTGY=
X-Received: by 2002:a05:620a:6089:b0:91c:d0b6:13f5 with SMTP id af79cd13be357-93499a86db9mr66751185a.19.1785483991121;
        Fri, 31 Jul 2026 00:46:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6089:b0:91c:d0b6:13f5 with SMTP id
 af79cd13be357-93499a86db9mr66749085a.19.1785483990785; Fri, 31 Jul 2026
 00:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:46:19 +0200
X-Gm-Features: AUfX_mwN-1aw4wosaqJmkJ4ElLYM96H89U5sW2rwfXtiTThYO_ygewOGzogj5qw
Message-ID: <CAFEp6-34g7MBY0-HUUZ+hStiASTCJJT-Cj+kSdWwoKuqwu_f6g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to 37.5MHz
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=MIFQXsZl c=1 sm=1 tr=0 ts=6a6c52d8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=3sq7i5FBc_JC6iizDrgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NCBTYWx0ZWRfXyLRbuYkCkcUT
 KqASuyvZiOpSCoC1LJkbI318MCV+FI9O0fdg6Oxz4fNIQHkXiuFpH8NeLWwxNt8firwUKe6t4GK
 t3jnvb26pdZlZxKffergKHzuExXwncv8iHtsqLbtYiUo9XI+k0gWOn9KFDNJnbkEpoIvBLP8pCh
 q/JyfnIwtkZo3CRiTEoDFa+1l4xMGYA3K5A63rGiMLRdJaiQHUAEWwR9BVgRC7DNjuXoewdN+yQ
 9Cf9aPkWlCeGiG/sLt8t9zhgm9VpgSV0v8VUhv9kYduJiiDvX1Uq3eH/J232dh1IRPB/lFMS1J7
 QRI9KUZhT61JwNkMaO72rDpgorcsZb7JBqUyF0LYhe9Jm+9QS3XIUfAnGVPH69CzKKfr3Y9PxmU
 JwwZInSEqdQxHFv22Jh3EN1nhXRFM+fJiaZUDkZ52qVG6mfwZ3xL5z8D+P7S4cu5c4tXqfqjGWh
 D8iL/YNBKIWWnHgxR9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NCBTYWx0ZWRfXzQYGMMZdsbqq
 xWhOMraqv2pI4lVg9qqdhOuRHnDKXW656eIgYLZFGtJ/P7lKElRef4dj/PbCdGcXzXQkeHjWaUu
 32KGbUFjgb687mATOhTFATOQpAfLr6Y=
X-Proofpoint-GUID: Ep2aIFDgqcO2e4nTFP0w30CMTkGEdDCh
X-Proofpoint-ORIG-GUID: Ep2aIFDgqcO2e4nTFP0w30CMTkGEdDCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310054

On Wed, Jul 29, 2026 at 10:13=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Setting CCI supply clock rate to higher value of 37.5MHz allows to
> program the controller to configure its I2C bus speed to Fast-mode plus.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

This works for upstream dts/dtso as the SoC sets a default I2C rate to
1Mhz (fast+) for the CCI bus masters, so the 37.5 rate is the right
rate for it. I'm however unsure we want 1Mhz as default and still
think we should avoid relying on assigned-clock, but until a proper
solution lands, this simple fix/patch is consistent:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index a64922c21267..a14e11d81488 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_0_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
>                         pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_1_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
>                         pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>                         clock-names =3D "camnoc_axi",
>                                       "cpas_ahb",
>                                       "cci";
> +                       assigned-clocks =3D <&camcc CAM_CC_CCI_2_CLK>;
> +                       assigned-clock-rates =3D <37500000>;
>                         pinctrl-0 =3D <&cci2_0_default &cci2_1_default>;
>                         pinctrl-1 =3D <&cci2_0_sleep &cci2_1_sleep>;
>                         pinctrl-names =3D "default", "sleep";
> --
> 2.53.0
>
>
