Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222473;
	b=Ee4CcNnIpqZl2/93mcmRNkYXifEbhP/dzvdBULAfq1+5pkz8D0tz3wOCT5MIkpxcm0+v
	 nqd9QlXQ5LIafEST04jousOKYxUHpUnELztYLTiTjwa5vlzq/oOAOA88/OIgOiN7d2dZo
	 LYASIZb4OonWAVNdrtd2OfKo6IjzpInHbbqwn9aUTY+mu8PqZ0tXkD60kbNIL/b1qqynA
	 QAZswVDOCzSWRgsvjSWisBfVhFtIPe1rUxYezo/9l1YAyJCoNmjpAVP1GbjwJ1WDKpMkQ
	 o7+POB4gyNgZX7Engr9uJfkbwzyN0BnTyKYAQSuJm9EaVwPUzvZliPPoIWgmNtxPHsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
	b=ce4LDtgrbEpR5enI+lIofZDKQYTZXWVqlmVEvRGYtoxdXyEkGzRSBXlJ6cyLN/1yoEc8
	 hGpsLDEI5Ybjjh9fIpEDWysaqHuK78FwH16unx29TLAoVClVVHyfMDl+rdbQWA/Q9vgiS
	 k0/1ttcJPtuviWvMuliV0vuyONNKULiyK/2oexR1QFcTUAWl8CAL2H5egQl7or7v/D9hd
	 zLDEz26BlVk1IMY45SX7GQ+yWIC6+V3xb31QJ7JZcfnebViNQ3N2cgHgMCyJ/p0MlmcWu
	 qb/REfqsnpwTxEoAbQQe3LfPSijVPITFXXvzUaBeeF3MrmMAqoFErmEs5EuOsBIGdPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7659606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 11:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7659606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=imtvoHwe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDBoLGJb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9B3NgK3936939
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 11:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w1TZas2nUn4Iyhi9A5CEWWZl
	SF+cg7JudGhxYTHfccQ=; b=imtvoHwe1TePJNqu7ofU5s7Z+PeuiQMjH7T+T6Eg
	7KuU4BNkH+mMEByIzdcoBf+b07G7+oodUIg8HscksUnb88yKzQ5KSvd5UPp0PEhI
	X5+Z2DrTnF+gy6xx/STu/TTTiUYbNNtV2pcxfuxObjRqpdbVZXgkHZgMTRbYk1PE
	JD337eqeHe5vl2u5ULAo5bpP0zGtvDZanQf5BFrRRypA/k3xaU/vBwqXLzV1je4w
	cpGfF2ujU2opvksfN8+bP+6RAsTHO5HdDQ7ri8XQXCrekzGWRyN3WHkFWBrlx7z8
	ZayvXzg89jFRfBrzafleEQcpSnq3MZ2Ohvm/0sf7BlnfDQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydg0vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 11:07:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so508073241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794222471; x=1794827271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=EDBoLGJbXKlwqaS8YkqHtf8UCv0iuglQip6x3YrR7AvwU8STF+IaysKCH1ULJGvA/O
         0/pTPE4VQ0hx4xl57SawpeeurSttsw3Eao72r5quJnVLAFc8l2Zap8VYY8LQl/F9FEM1
         u86D8qPJcWb1S2XY09r+NquH65wAaF9Z/psJ2MMs9qZadm6BatGkKKhc+pYBb9EWdyF3
         Rhk3r5MrH8NQzhhIGVA2vbnWvsLI/SNySc1JzFEjFFragvtWrvr5Nk/SW0IOO/8RGPJm
         WPfw8OwD2S0FX71FphluFcK6eObm0iOLjmxfShu6DZc+6qVQsyDA3rTIy/oTv+7UzATW
         IAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222471; x=1794827271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1TZas2nUn4Iyhi9A5CEWWZlSF+cg7JudGhxYTHfccQ=;
        b=lnJ/33OU9kZsJURV9X4cNduXLedIwwAN+MD/qFkOld1PEmDUl3ipyJ+Jb1P76R0Kk7
         sYInGB2lSijPINIvDIpO513OEtrxAxZecoWCozh+FejOgORhOU8A1Ywnud1xTN86Aj7f
         Cg34+MiScDBcxn88n4pRQdnSESODIb/w9w5tFJYUuvK3HToXxkLg9c9h2Ag04CYWc+DX
         3Kc9+xNHeRvFE0BCVFbnB3HEZIuRBA1wPR7b6YNinI8QGB7GZp+ysBks7P2QYnFyXtxP
         sDP1QV7JPqbm8Ex5P1/Rlkh648DaEEfAPYhUwbzO50LcOdLO6MtvT7HrQwtCXp2hQ3Ym
         E2Ww==
X-Forwarded-Encrypted: i=1; AL+hErEpNB7Hf2k9n5Tv/zVrLALzrcfH0WU2SLlHCF++gcpL+q5xD7axqGGfNy35rFKaIU3phH2QXFglQ/8uIRA+@vger.kernel.org
X-Gm-Message-State: APuU4Z/wkWGVcPw6lFC8FjdQKZ/+hPdW9+8huud1V7CI56dK3+j3rWvt
	VeWJhUkXtCayhsv3fyiYna48/g3S+DTW4qh4Ew+brFguMvvaAYWXiH7siiqvf1wvkxs5PnQPhh4
	FqVbDopiUgxZkDVZkPYAmtKL6WgxOMFxxhLKAE0IIkbi1P804rPTJ9WJVavMDRLjNv53Y
X-Gm-Gg: AYBFou21OfRVdvhR3IgUDPbiFR8D+uNitQL61O89wRy4uytzG6zy6yQnV+LK1QpqAo/
	kMypu5aCp7CoHykK5eK6fJz/YveWQPZen9GJEY6Vf3SrKXBF2htNHTUiaqlcFoEcalPkJMnubv+
	fz6N4dWny5kGUJ1yIeg7bZTawFCvg7Yj0XPCKa1z1RxSfgD7t6uIjeA0r+/QSXk4x+4OAWGJbmJ
	ufjkVXCs6MDlqCQqk0TbCKWE6Hc3IlOVOxv4a4U3WaTTJZNL8jvJ9A49l67dlMe84RLfq2/RU3z
	0eZUSGrKXLm3XnNs77dFH4wJrAyxQWeGtvS10NRxLu/U983GLEoC0ZHDQ3Flfp/h9/8MsPmCGX2
	I3ljaJ3irrC7u63ceadVE3kr3FYxFb4At8MIdWh3K3IXEBlshXMh9q/spGZmamU4=
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076595137.2.1794222470977;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
X-Received: by 2002:a05:6102:6044:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d2dabedb56mr1076584137.2.1794222470405;
        Mon, 09 Nov 2026 03:07:50 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-496150c6e90sm7740628f8f.2.2026.11.09.03.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:07:48 -0800 (PST)
Date: Mon, 9 Nov 2026 13:07:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
Message-ID: <adkqpnhp3gcxjdot4yratxmnvi3mmkyovbusff5ypl46cqlw42@cd6on7mzjmwk>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
 <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dae5091-6d51-4bf9-9a94-bb2d98e2ad28@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MyBTYWx0ZWRfX86xGIvJYWL00
 7iNbRpluMe/of+Xy4XJrhHPcV4Bx8o3j0CG0U6GyMr1JRsdECapuNsSE9Ek7xWJQW9Llde16MGy
 LXyy+UMVgjHn/0FPTh+LJEiVWXAviS4=
X-Proofpoint-GUID: Gvo7Y9scmJxDc4pbLXhgLLuzBdsHvABV
X-Proofpoint-ORIG-GUID: Gvo7Y9scmJxDc4pbLXhgLLuzBdsHvABV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MyBTYWx0ZWRfX0n+tFDYKt6JW
 M87u3ozAEs9LyQUpn2hwu+wiRw7QnKaoo1ia2CZEIKIXPy8GadHZKf8JSt/uGtsj2KsfuB1rEd2
 gPaI4LgoGjsuaDt4kyaSHt40DfNjJHltBMg6jGNlcQ9ylt7biBoESwYKtwSDunTOe+SU3ea3XPC
 XQUgmHVdPZARoqUjEnwO5SrqdItCl7t0KNq/gqK25krxGzNS9hAMW2TiMxYRkKsFdcXliJ6J1F7
 aiDmazF13NAve0fbLVEkskEwC2fAaS5pbhwFlHGO/OwVxzJ7lySV4OlMDZCyAnJi/qiyx7ISQKC
 npcWQ+c3v59qKWPKllbE9cP4GkrLxxPVdXme7mRG7VOCWplucP3mgYikZCrAyWYGGjnmCHEJ+0y
 KllHkv8PTLRBI7l3kfyAmWxm7Iq/eg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1a987 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FPO0yo-LnFrNtlzATzEA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611090043

On 26-11-09 11:19:46, Konrad Dybcio wrote:
> On 11/6/26 11:01 PM, Abel Vesa wrote:
> > The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> > i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> > Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> > GPIO 66, as on the Gen 6, but the firmware describes it as edge
> > triggered, active low. Using a level trigger makes the handler fire
> > continuously while the EC holds the line low, with no event pending.
> > 
> > This provides the EC hotkeys, LEDs and keyboard backlight.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> >  &lpass_vamacro {
> >  	pinctrl-0 = <&dmic01_default>;
> >  	pinctrl-names = "default";
> > @@ -987,6 +1005,12 @@ &tlmm {
> >  			       <44 4>,  /* TPM */
> >  			       <139 1>; /* TZ trigger */
> >  
> > +	ec_int_n_default: ec-int-n-state {
> > +		pins = "gpio66";
> > +		function = "gpio";
> > +		bias-disable;
> > +	};
> 
> nit: please keep these sorted by pin #

Yep, will fix in v2.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
