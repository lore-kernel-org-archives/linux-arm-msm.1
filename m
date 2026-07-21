Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB4449B02
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615188; cv=none; b=U1U4DQ5k+Ou8YejlYyk83CrrRnUIbE+qbRPM4LBSggpCo406h9JFfvbZNMTKB0G7HtQaqUmaxeSWe44xJ1d/nrDk3sEISsTn5+T5KduPgT1IkGzXst5FuBKrV+xBMZ9UbLlSqG81mtYPlq2PMwwchSuyEoX0DcSIP/mslIlZmKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615188; c=relaxed/simple;
	bh=VqOYnXryX5hse7vNX7beg9gB6ZmLI98ukA7NaZMtYoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cd6olwu/EplQjHlp2in+hqFIK6JjnknFdE1nTe6Wpqa6upCHMOziT3Empzn3TrEN/vO3jJL0bLncWzRYD+0EeavhKmSdsN82iKUjpdGu39sjV/czj4IIV4VMrPFFoJnxsSpnv+QSNxrrZkD6CeP+Uu80sE06xrEhoPrYUBWdGS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDg8fXJ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXXainLk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDg8fXJ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXXainLk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCY7V045832
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X7YOLWh2XFVEuyXGe31/Vt/m
	4Y+5JxiAP6LigbuEd1c=; b=hDg8fXJ70p6bMtZwVbGHEfKWZujp9rRe+yBH1JwH
	P0yLWwPE0komCZNjRXCGLLpeLdt874gpYsx5wdu/l/nOjnSZq9KWSg5hZvFWsqix
	QUiS5PccxCB/Zily/Jj/KHI/Rc5WWRgO9f+3HYBUyShLirSkZxsqbECnpMiwl8Ru
	ss8URcuL0CG3VnKDOvp27n5ru1toWat3X4tpLR90cNiYsds4yzUaVsX2ed9mLdU2
	9IKg2CNbtBe7Wfcu0IxDU4RKehir2Cb6bF+QC/cGQiSFIR8e/BUTZEIYozE4Qbi7
	cGZy3mVwDBMDRsJaES4P6xfVCQ48S8CGvNHX1nhw9HW/Fw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tnxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 06:26:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so16833474a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 23:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615186; x=1785219986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7YOLWh2XFVEuyXGe31/Vt/m4Y+5JxiAP6LigbuEd1c=;
        b=YXXainLkQj35xeCPIsSJ10yWDS12vteeaA1H0roOk1Q8t4HZnf2xe0LPnZJIFGrPeQ
         5Si4jdsuOk+l5s2/8WSUHnGSfPXMYlbkPi5wkFc9rf9MOREvzt+aAEnYGxGOCI3hosiz
         PuiwvZPM/Fcz5lB/12D7eh5Epqtl9C2swB/43p/Syu+FUp3Iyuqze+HOW17iXMrYzpdO
         B8ySQV2wsLPBCyBsvIy4Reb7UfESTV7Cx29O12KGeCCfrLbumo7P83Qw0JQweqzpiXDg
         sx4qqSOWQGburRBuwhotXcm0fI2S/dE7sqXhVEmRLqagEi2x6uqfjatIt4vMZgyh/no8
         DIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615186; x=1785219986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7YOLWh2XFVEuyXGe31/Vt/m4Y+5JxiAP6LigbuEd1c=;
        b=Ho26EDDbyog+FeX4z+/Sff6yz1dvsOGdEp98ARh5RwNtlk1dGmzrOXnjVvgbIklVmY
         OYHjEdVvEht030xtjiySJF+iQAigqtpD5TSKRTSQppWkw3o4RO9gqyfM80DLkTkMtjeq
         zDcp5Lp7Z3QkhyI6DndzSGH6OAK61aQQ4OHcK6pHOKuVUo64SV4mlBIrLVjmlqdZsCaf
         SHV1KllsJCk/LuGUuCevmIrE30PJttTwmAYTiaJCLr4X6l0P46UpUytRXbwltyn/+/xc
         /Ps4l6WENIMEovxnkihS+81LZeP8WpvcIHN3RwiJHDCNLMd1VK6l+mhCH8QyY1OCWeX+
         eNsw==
X-Forwarded-Encrypted: i=1; AHgh+Rqc1APm6F2OYTVE9Xpfx72PIjStMG2bGY4OxiGgwpgj+qbe8V8CFmNlKyOApYxl3wf2KFazmYKym88Q93z+@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDY3dFwtXH6D89p7zrxWggjiP5O6VcfFf4izKCuo8HhajVsmG
	L+chYF0ycxYUTIy4XxpULMmDofPenEkvzSaggRSwLXlMvn00WnQJsi8Bh0Xh3/arlNnSB4A4TSF
	anAkVwnKlVoIFNY2RiE+Bzoo1Juh9GVw2LoXUIGSgKS9UXimb4yjj/XKt27A+y48KmDFo
X-Gm-Gg: AR+sD12cv3oPUgii4m2tm4u0c/bSYMy0aGp4h58hlI1JsJ5AKj2cRFmc/BVj/DUcLpx
	PoSyDEr3QcyJslL61ViIHLah3PbQ3q9G8PZ1A2RqYTgsxIqqK3ANH8I1ljWck96ziLo/D1CUZ7a
	lwPi2bltSNtA3EVxVDUH9YcWprPriA6IXCNnF0HdIQrJc+/x9qqgGN6xjglrHk6cA8V3Jf61NP6
	CCHG3/R5aWSelZ0LOzlWr26gSuFkJKO8aZiUtEkV5V+TXwhSQoKwtbrsp1QbnhxUatqOEE9PH+Y
	5ZEvcNEieuHtNlh+UcQ2uwg7sLCMyCDWVRCI98s0NAmAWNLvLWcO+3rVJPs4vSYGUmIogxZwC15
	3X8GT+c8rhaVRx9X0YM76/ilzyIktSjL4fOBfym10vys=
X-Received: by 2002:a17:90b:2c84:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38e4b422c19mr17561165a91.1.1784615186220;
        Mon, 20 Jul 2026 23:26:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2c84:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-38e4b422c19mr17561132a91.1.1784615185747;
        Mon, 20 Jul 2026 23:26:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e92064f6dsm941493a91.2.2026.07.20.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:26:25 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:26:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/6] arm64: dts: qcom: Add device tree for Nord SoC
 series
Message-ID: <al8RCwHGlk20KhPS@QCOM-aGQu4IUr3Y>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
 <20260721044005.2882803-2-shengchao.guo@oss.qualcomm.com>
 <26bedd34-6a5b-4b3c-b737-4f71b5b80cd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26bedd34-6a5b-4b3c-b737-4f71b5b80cd2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX+5plKRd8NIc1
 5ceB8CThI5UXbkBSK7gVpHRS8HQcoJ2H8k+hY7MliuoWyO9OKJnw5kmRRPqCr+WbOTzVScj0Ksi
 D3kW3Kesw0i/QnLVRkwPwtTtiG0HdC/3N5WCq8WhKjFtH0aXhrARdO3uKH5cYkLmouibb7VIEWE
 9mXFzng0ll2yD2vTz5ab1rGr2ZXg/7fEqkcHLGQE+jExxRFeiW+P/vovfY74NtsP6auNgPTcDEK
 fP9NR+dcDCpSinJQYx5BHojRtfwuvGHYC4t+kH+yHDSQu1yKeJVqLXjvo2UvIBpRGKqCrk/Mi2I
 D04FKrd5fxlbZUg8qv8Y7np55rbT7veEmPNe4SBQqVjshWQeEjyqiJeerPJC8XsM0RTaWbqMqjS
 CITvMF6GZDpj6dE+/xY0mKWgCXFHsep43pCO2J7p7J2ea9ZaSTn+yXsnY4nb0Cr/3swyAdfIdW0
 8CdHvdwwE9GQucVTqmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX5lIWdz66MsS7
 /ltI03HfU9tIcrH0LfLelpJ3QtkChnO58AsTRfJ05/2YuYA39Hnjf+9ST46/azjoFI9t4RWsjbw
 kUmZRxMyYVsxmT78PyMjcJoUiz7MWfk=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f1112 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Img1AEHPfAqj_0BS3eYA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: -A9Q7WuO6kZtsLRMvh6HEdxEyJjZJN7F
X-Proofpoint-ORIG-GUID: -A9Q7WuO6kZtsLRMvh6HEdxEyJjZJN7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210065

On Tue, Jul 21, 2026 at 10:33:24AM +0530, Kuldeep Singh wrote:
> On 21-07-2026 10:10, Shawn Guo wrote:
> > +		crypto: crypto@1dfa000 {
> > +			compatible = "qcom,nord-qce", "qcom,sm8150-qce", "qcom,qce";
> > +			reg = <0x0 0x01dfa000 0x0 0x6000>;
> > +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> > +			dma-names = "rx", "tx";
> > +			iommus = <&apps_smmu_0 0x1689 0>;
> > +
> > +			/* It stops nord-gearvm variant from booting to console */
> What's issue you are observing Shawn?

The kernel simply hangs at late stage of kernel boot.

> Usually we GPCE is enabled default if soc has IP but seems nord is doing
> differently here.

Be noted, the nord-embedded works fine with QCE. It's an issue seen with
nord-gearvm only.

Shawn
