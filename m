Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D91641F7C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552575; cv=none; b=GWMlmZmOCtIA8nQ/NYMNaK4HDvNKOjpC5yP+SVEPRLQvjZ8oJYj5OtCDmqrrwfbQWi/ZWHwN00XaADy8RRU/EpXX8T2wNJzI0yzw5khunjQcRUMDwkVB6bFiC7/PBgq50YXrCSMaA48C87lrL+5ecUF3ZiDvuTiuxRAUwH0RYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552575; c=relaxed/simple;
	bh=pdMOhpAd3QfySMj4+ujDj9MH9p+yknuq8LDoUIxcHYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayTdZ+PISgRsGUctTP5qAP0L7JEeA3FwB1n6OFRgdbx/ckYw7gfj0JJZKQS5R8+8B6O8ug2DeEZZn2U5aKzX1laBSoXsUsRrbI923Uz8ikLukz9wwgPq3NEu2Xn+AkRZjkop+cGkSqIM0Zj7XFeXbcXBui0ESmXUn6zijFtzPfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2JlFOGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Doo3TVi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2JlFOGp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Doo3TVi8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvTvr2430393
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CLMqfEhoGvytSHTj4WrRSh8V
	HSOC2iqzFVkwRAui2sI=; b=W2JlFOGp1T20qkdiJF5EceSDoK5EweuOoSqFkTUU
	NigyjENVzqsWkunwefd+tpEnZxGQ2Wj4wnCU50gjTVnMqb2A55X2/TTcFjFHtBqx
	AOoxgOZJEMWe81N/OLwQMIV+ePx0AA7qxNz7vce9vXkOOUzrqyjxRH0YUVgi8599
	nvoiXYJL/G6/WdcKpqMI2m0WNuF+KrxZatyd+Es84YoQnOB3/6gaWrRCViiLO8oe
	2lpq0uhuvKdLB/IHM8iyMIduCIUPuR5EbxNZ7IlL47Tq8s7a/Z+fUfIjmiVO3HKv
	VK+BkCpElLzGojdJ5sksynGv0NY8eV7QlIvOrQpSXgqJcQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyrqf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:02:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so5239708a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552572; x=1785157372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLMqfEhoGvytSHTj4WrRSh8VHSOC2iqzFVkwRAui2sI=;
        b=Doo3TVi8nzxGv9VCQ+gUhcoHFpGlhM0eJmVgOW2yL16RGsI5ot15l31tvwuPtAGHkG
         oCt+gvSgHGsUOzIoA4ykYx9z2QVOhk8yhR85reUYqZHhIb7/Rwzaj+UAx0ZBFcOcIpzJ
         Zcm8ln/uKQjmzJrYnz5IGik++kJMcHvawgGIFc455kHmSiyGpe9F6090yAS6jCCySEGt
         2bfV1FNCPMt06ahnmQMfhZLlzUYE63Np6ObFc58T3ykZicKSdP+jjxatk2rlcEIWlu15
         gjD/Ofr/CQG/opZB1vDNTg+aDRkajre2mprUWlFWbYKGEWSTZH4PCjw+Mp+L6Y1O2km4
         uMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552572; x=1785157372;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLMqfEhoGvytSHTj4WrRSh8VHSOC2iqzFVkwRAui2sI=;
        b=Je9sEy/5yU0bOCTv06dAGXoWRwhS/AFrAk1v0XdmYD1RFzGdjqTW/k6O+V03nvscRE
         7yvOpM1TGzvbDU/VvXdeidcSpgWILo/1di0gOw+yZEtcLFnY6f9t0mSnwe0VMK0NVIyu
         CASPXQmU4zIIAx2aLgmQJHfqwde8nlexEIhxHBeVRhMSMkTqQFXgnRt3NpVb/7Y8mqHa
         rAN7QmNCfNuzKCDEG7sipcNLJUH1qnzv+sir+LPjUSZarxF7Qy/kjltTfYJpUg9j3mLu
         f1nX6hXcTSDX6RiT0y/xu7AI8nCM7vqlnbNslvqsJ3ygEeikvte2OUxsrw+Ab9A9ewlA
         ZYJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjVFbg46c1l225h1cgbYp2sf2nFzVCqPALycDBeciaEtbXdqI/TSkcxXvQeo9UYnT5zIOmKxK+6uERGduQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzE56SOCeg1OlhKhpbKxPRtoG3rQCpCtsKSaDwUNyfL5JXFjs1e
	mZuXllcOYP507a+XmD0qlXdIBW6M4aIY27wvn9PgriNzdMQs7OTc3RyRRB5hEhWidCI6svn9mLW
	a3oYSpN3ti/AK/H5EwYoj5prKQRi98P1bWz9C8FSAc1EpJZkUdWi7CY7rm5oNtq2nZK8SMnQdO7
	pz
X-Gm-Gg: AfdE7cl2eOsNFMJhaMhyXNWOw3j9Y6/n22Sk8Fm06kq+7M/pG2O6B+kyRVQEtk9CblV
	hVvvq+S6ptwptEUoTSeTX4QoC1BaQuF4GQnmsjn4e+RvxWFWA7i5D/5okC36I1025OnrfTd8IzH
	wSDYnmMexVmbyrwcv9amaI6xyLHr+9jaqLo+aCXN4WqgvOLc2Zvc1RtyPJyzc2l/WlDvv5NAWIZ
	EW3NM/1v3KrGWIun6ud7TmnWacp4ao4k965M9SltZ26jAu3niINsNwsyJ03ws7MO4yfV/ip4fz3
	ecqTeKK3s68O4Jqd54I1GGJzrcqTuWV2F+Azau1tsZ/NQVoScsZ/U3X266hps1/rkr7hjnVJs+7
	H5S00NLDiP5ZGuVm439583eqrwULHo1xr0W22S4cCAFI=
X-Received: by 2002:a05:6300:392:b0:3c3:d199:86cb with SMTP id adf61e73a8af0-3c3d1998bf4mr6719091637.31.1784552571736;
        Mon, 20 Jul 2026 06:02:51 -0700 (PDT)
X-Received: by 2002:a05:6300:392:b0:3c3:d199:86cb with SMTP id adf61e73a8af0-3c3d1998bf4mr6719039637.31.1784552571151;
        Mon, 20 Jul 2026 06:02:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm40895117eec.18.2026.07.20.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:02:50 -0700 (PDT)
Date: Mon, 20 Jul 2026 21:02:44 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Message-ID: <al4cdNAV6JdnmucQ@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-7-shengchao.guo@oss.qualcomm.com>
 <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b522c9b4-4944-4fb2-94f9-bd2553690901@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX7XMasGkH34tw
 lPBx1sT3RjzaHhNmm8HNEMuM02EjDAg6VdO1XVgR3Mg1qRK09Olgt3LwTiGdE2sKXmpu7fGdW1i
 IJSQc0GWlKIQtqKWRxQyqMM8K780QTw=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e1c7d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yiVUS2zsHPonJHfjLMYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: SW0ksru6xNkOnWeWnzxyYC_Sik5LxrPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX+kyy8oL0qD7T
 MMnN8x8MwSuboz7fqkO78xVYGe0CyPqjOTQEXQtGHYVWw6Nij3YyVm2NuJZt8bpcVH6Y1kZZ4fo
 SGKZCpiJverePCtXeuCjvtZBYAGDbA0D7+DD4shHlYeXwwh+VY9T7Xbp2V2I+E2l1l5zceUIKLe
 14QcpIqOYF8YwnzNS4d+Fe7RlZY/399s+U5NZHq2aMRjGA9S1AtOsobIXvQXa+RyRzWh6dZKly2
 4bzbMu2QFMLWrL3rU742OFu4FgxCzxc2SioiD0BwBvZLYIyQe9xb7D06iHBH1E6zJd/K9cvLAdE
 HGTVUin5goGJyCRysjC+fxTA46mgDUozOt6SdEhickpcCljYUrs6rHsivFefG/lrXN66KiIDOfQ
 u/7uifRTJI3nggen39b+gF6dGnEyuhTWloJORHK7VwGaaJP1bUpLkwdVctB7sNALDoTfj7OB1Os
 xHKiK42SDctnJs1VZVQ==
X-Proofpoint-GUID: SW0ksru6xNkOnWeWnzxyYC_Sik5LxrPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

On Thu, Jul 16, 2026 at 07:17:14PM +0200, Konrad Dybcio wrote:
> On 7/16/26 4:26 PM, Shawn Guo wrote:
> > Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
> > Reference Design) board, which is built on Nord Embedded variant. Enable
> > the debug UART, UFS storage, PMICs, I2C and SPI.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
> 
> This comment is very useful
> 
> > +	regulators-0 {
> > +		compatible = "qcom,pmm8654au-rpmh-regulators";
> > +		qcom,pmic-id = "A_E0";
> > +
> > +		/* LDO Regulators */
> 
> This is much less so
> 
> [...]

Indeed! Will drop.

> > +		vreg_l7a_1p2: ldo7 {
> > +			regulator-name = "vreg_l7a_1p2";
> > +			regulator-min-microvolt = <1200000>;
> > +			regulator-max-microvolt = <1200000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +			regulator-always-on;
> > +			regulator-boot-on;
> > +			regulator-allow-set-load;
> 
> You made a lot of the regulators always-/boot-on - are you sure about
> each one of them?

As Bartosz replied, we will drop always-on/boot-on from vreg_l3e_1p8 and
vreg_l2i_1p2 regulator.

> > +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> > +						   RPMH_REGULATOR_MODE_HPM>;
> 
> It's commonplace to restrict regulators to HPM only because not all of
> the drivers that should be voting on desired load actually do it. Do
> you have any intermittent failures, particularly around PHYs?

We haven't seen failures like that. But to be on the side side, I would
rather follow your suggest to restrict UFS PHY regulators to be HPM only.

> 
> [...]
> 
> 
> > +&i2c7 {
> > +	clock-frequency = <400000>;
> > +
> > +	status = "okay";
> 
> It's commonplace to add comments like:
> 
> /* Type-C controller @ 0x15 */

We would like to drop untested/unused I2C buses/devices instead.

> 
> Otherwise this lgtm
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you, Konrad!

Shawn
