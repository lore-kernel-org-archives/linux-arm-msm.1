Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A8838AC99
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517118; cv=none; b=A5TgRd/AKhUIhfM6U//E0yL3XxlZPPC5jK/rll1KOeu0RzDRpjQVfZ7pZRjs/fNTHpWtIfh1uE62Q3pcc08LK/YlE7XieFVwoyRj0a6xn+4Zp53PbxSRTSdzrRYkDe49cg+nOWsTvTALllMgANBBPMMrsbgVBxbsXpwIEnj+WpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517118; c=relaxed/simple;
	bh=BKGrJ0lpECW7XMs/V8cAhsctLUZ/BYdBT7mkPsbnUo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwwmfXsr3rwTGo0ztH/DgUHDMeVfPlMzjv99GX72eqdvLml4GTL1OTNSpSA70ceXXVsD+JGpjhVTsStFceLcHXPl7nYrwdx01VV5ffqckOsQiFCrIsBZDU7dFWqDIhkG/T4d69KqsaG/ZDHcYUjMKhEV6WczklMdcrQb41xZWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1W58UPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OtMVL4jq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1W58UPq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtMVL4jq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtPwh914744
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nO/NhAOiC1NLRm5RoYi8ZCyJ
	QoGzUGlnK3uijdWv0C8=; b=d1W58UPqJDsmyKJTzPAUWTVU4cG8UKWE+eV09/bC
	hHSZREHR2SiUbEqDxH+ktD3v81qMI8dpfsRk/apPGhdN/IbT+t/7vDERNzPQ8soH
	+qnNbiHv42lVVW4P2cJopHALLRoCU2t7gLXE1w669/kFGgZuJojwX38londJO98y
	VLbGQ0cg4xUFyHuiAr5KEVKL2NYYcRbRTR/w/dzxl2SYxaDESnkQKOzSlngYNOBl
	VccRqKE+ZNe4m4UvMOfpFNOULHZQWqpWdMytWxGaKDPfisCc83AsiHPoxZ2DhzO3
	G0HhUwF34aiYz+QgdgTR9zqQUZHV9VQ86HZG5Ni4wbKNIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2af43ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:11:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso10793792a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 20:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784517114; x=1785121914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nO/NhAOiC1NLRm5RoYi8ZCyJQoGzUGlnK3uijdWv0C8=;
        b=OtMVL4jqFjMrvifGLbhgi9O9ZA20srB+AtWnqYpJoDBdyjbjkFNVg1zfgAyN6/KrZ7
         Kg2Pq36vt89vxoDVvxue+AD5uZtRaQGn+oD+wq4SQnhWd4uPs642+FugEcGRCwq57bMw
         /0cUHYrZIPM7OdPBZA9bI6Dq1p3FJTQII1vJVvlVSuuB/1et5BuGwY+wAuWLANrQabcO
         /c8Z2vJZuPEejWpClucgKUejS8KvzSCr3mswhcnCrdSh4dmybmWcLs0UZHI94iPgLqzN
         ohRUzAqQZxvwabeXAsjgDAH0G0D9A+xjVnACREHw24qInBNbP3CMBg5WH3nQs4RNU/C5
         I3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517114; x=1785121914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nO/NhAOiC1NLRm5RoYi8ZCyJQoGzUGlnK3uijdWv0C8=;
        b=cq5xKI5k/5CByzdjorVlwm1C5RQcWiTutQ3rbaakuzUbkg81ATK/nLaS0HxR5b4A2h
         VxroPmWIYUEcyvcAyXbAOCUpC5MUl3g8qlBj/cmsoB85N8sZNEWfMQvhBxmQxlmHhyWQ
         kLhqgU+ZcdYjsurFRHqzGhOliVR4tsO1hIz9n1sb0lwxIcM1r5wfUcITxYBTiDnA1KBS
         6vlYaBVHLlMoXNVFsn/GJE/U0MzNQSrcEiwETr1AnYnzjZsEdmhjy+tHdZD3ZaZrHhHz
         WQiHPngVMvi919QKO4r2Q8hS3Ja38XpoSfLS8vVEeg1+jzlgrY9FaM0vKKv0mqsJ/Yar
         N7Ow==
X-Forwarded-Encrypted: i=1; AHgh+RpK6uGizBl9vlmnUP83Y5nlKCyUsdfY3YOPAURt+0orlFa8SOGj74Evh51OcKE7AbUXbnYp9ajjAKlu/fEx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4MqsisepD8bqkOMZxCqyxcYbuUscaUL31yuX3iICfHCHPdU0B
	1Tgwe0OHe41sQd7+K4XlF/YFS5OLnaxCI4Yw+W1TpDCe5bsMAQQQKsFP6zUWimSoXxzDvFZ3gtY
	vRdB+ppE0FZXgCSu54SNK1y/AUOGHGbAtS1gWfm9ckTSKgCpgsjWGXmiSYseYkw5mVwoZ7s2T+A
	Qa
X-Gm-Gg: AfdE7ck/+tTau1uJeV/bsPKabDUJRcuYOU/23UYL2PAYsReUah3tJ76B356X7tZgTj/
	2f+0MUQGVy7eP9UDD/LfGw6jDoAcMLwCM62qqVZumRkKp3IkrVuDVpBb7uv3CtegZm8TJmBuQfh
	LurYU18vuzynoxR9nkEed8ChfUmRA2gZXbHkt4yNdduaEc03M6aQndznkmKZSkf759D7cEfk6Gj
	/F5Lc1TVAPeK91qG+YbqRVS2OnvDqfUcmGuywqJEvzQA2vr0tYcT0V0ytFsk/DXsjrbG4Qvd96H
	hpmdWopsI3XdDZr8KUg62pG4Ht2YHy9D0nXZT3DHce9ORYgubD4KZ+COu6KDg9qCLjGKJAi1LDa
	HTI8bpTLBTAAGIpKVZcY7IGNrj6lq04IbsIcdtrgmaj8=
X-Received: by 2002:a05:6a21:3984:b0:3c0:9c1a:8939 with SMTP id adf61e73a8af0-3c3ada34209mr13687214637.65.1784517113579;
        Sun, 19 Jul 2026 20:11:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:3984:b0:3c0:9c1a:8939 with SMTP id adf61e73a8af0-3c3ada34209mr13687186637.65.1784517113014;
        Sun, 19 Jul 2026 20:11:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbab9sm34241828eec.15.2026.07.19.20.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:11:52 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:11:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Add device tree for Nord GearVM
 variant
Message-ID: <al2R810xFsIyng1Q@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-3-shengchao.guo@oss.qualcomm.com>
 <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916e2f7d-6f9e-44db-aec8-95532d265dbf@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX7V/5NDL25SCf
 2ciV1cSwyTVtE9qRnA8WU1JGk411CZPaKapbcidtohmO0J9mF/YSk8jPu8xjJ+iCCKOgx/gBWnF
 Urc5uujkBWQa8fJoZsX3dndTQaeQHKk=
X-Proofpoint-GUID: ACorUJB2-Dq6VImQAQvoEP51xTsfF234
X-Proofpoint-ORIG-GUID: ACorUJB2-Dq6VImQAQvoEP51xTsfF234
X-Authority-Analysis: v=2.4 cv=a+sAM0SF c=1 sm=1 tr=0 ts=6a5d91fa cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eRJEpp2EuYoRR3eGW0sA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfXzBU4evdolcMo
 uvHeWkuk1gLLSNTruUp2x4zi4XsCgkbpyUvvi9qVI7hXDCc7BjifkOOCMSrZSmf7GfTHeVonAO2
 aQclTkeAm5ONreit2R37DnZPY1zuTkvpkivTN+bnu92wSJ+4nft7Qi1XkM1rkyX5f+mAoD8Agli
 BVoVY3waMvJR07pJJxKH3H+iWaz2HtWnmZ9aErEguWAggSAwPAQcq8G/Y7uwr4RB8HWysU9W9M3
 68nB3l/GwZVpajQiGmUCdClMGOTb+nQDyG4Toqx2QpBGpvxER8FKbXtJ8Y54C+0MIuAFIVoNrfN
 AOyL+Ddkky0dscgyPU6R23afNrXT4ludWv1MR65JZ+5lFyOKkt2EVqmOR6I59cCYkkW6MVqtGb0
 yxmK7wVhcauQk2jvmWxFF69D2Kifl80uLcoZqnTCdgIo3VIsvhTeUfHrBdjmYLF+h82I5D62AOO
 KbWjaPmvX5Le4PQZgAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200033

On Thu, Jul 16, 2026 at 07:01:00PM +0200, Konrad Dybcio wrote:
> On 7/16/26 4:25 PM, Shawn Guo wrote:
> > From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > 
> > Add SoC-level device tree include for Nord GearVM variant, where a VM
> > controls platform resources (clocks, regulators, powerdomains, etc.)
> > as SCMI server. It currently covers:
> > 
> >  - 64 SCMI shared memory regions reserved at 0xd7600000-0xd763f000
> >    for SMC-based firmware communication channels
> >  - Three QUPV3 GENI SE QUP blocks (qupv3_0/1/2) with I2C/SPI/UART
> >    controllers using SCMI power and performance domains via scmi11
> >  - UFS host controller with SCMI power domain via scmi3
> > 
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/nord-gearvm.dtsi | 2911 +++++++++++++++++++++
> >  1 file changed, 2911 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > new file mode 100644
> > index 000000000000..8db93c361c2d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/nord-gearvm.dtsi
> > @@ -0,0 +1,2911 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "nord.dtsi"
> > +
> > +&firmware {
> > +	scmi0: scmi-0 {
> > +		compatible = "qcom,scmi-smc";
> > +		arm,smc-id = <0xc6008012>;
> > +		shmem = <&shmem0>;
> > +		/* We expect the bootloader to update the IRQ number */
> 
> /* I expect this not to be pasted over each of the 64 instances */

Ok, I will keep it for scmi-0 only.

Shawn
