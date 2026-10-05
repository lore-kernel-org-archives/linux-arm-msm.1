Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA10537106E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182918; cv=none; b=p+6N9TtClGdO5/1w7AmnB3rxMsYTHKNclzju3M9Pog7cUusJ7Ea2tAf+YVUQG3UNO0na9uOQ48/0j//OMplg2lprHkDf9gQm01JZOrF3B9TtCO4yOf6G16ha2JmxolVSNKudVJg2ML8c2e8PnMsEJZJHL9GRO4QYAMQmHZmoN2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182918; c=relaxed/simple;
	bh=4/8ehls3yBatXQfQCImN2YqHIsFtxUEWPcEffpe2/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Um14cUz4qrDCMRwpE9H70D/wvpCmTKGiQVSPK+Ww5dXzKRM1FL/X3pAtc2kbuhyizx2F9vIcrxphmSy8rcAcwImEn81BtxiH9i9gPXDtSVcrRIu4l1Xc2Bp3cRaSfSE692OYEsvGU8fDiSPGPhHtNG8K2epu3VuMsfGYb+XhZlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZuuAhvQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FEmfOI2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZuuAhvQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FEmfOI2b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510JkN1465131
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bNEvzPR/McwJcZtZylhbx7Iq
	i8eYESxtxZuv6CuoKqU=; b=ZuuAhvQai7HGVzwl7n/rYyZjg/azhcB1w7ZPJr1Z
	sI+mrpRSfjRxlfC9bU2UzM+2p3xtjFSpJCKf9yTTdg5AGPMes+1kFUp2DndYu+AO
	OE4JYVD7Y8RQW9G1GwXqV6cJ04Kp0hLJOsSWWqTDXJ2OguVs82BQlNKak+ghU6ID
	GDyzqWENx2Ln5zMzRfvvh13Vwowo55HdmULbCQow7k3HCfGWDbNBEsXiC6s11lu2
	jc12ssoH/ZoqfeS0s/ZXy01b5yKNfcQ9nHiy8DsUPTst3NcHPE5UJlhd/77x92nP
	vnkY7h6oh+4qpz/I9HNYIf65m+oQJyjjwWlU6QCGJwMoqw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssmr46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:48:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso1167168241.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182914; x=1791787714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNEvzPR/McwJcZtZylhbx7Iqi8eYESxtxZuv6CuoKqU=;
        b=FEmfOI2bWrVDCi750gZwSNWNanHgc5GVzhm8W5k8stXOZuUI4QmPBt+MnlEDeztkrY
         BcZj1fuS/6Qfe/uOTydjl+BQbpB90P3RLGY8PpVdU04JAOB1qJ4woim2oDOfY9Sj5j5J
         4XNNgsk/UfTNmD18wF7VWBaQJtGZzoxA7yrorQsbA95vXBxbSw0B+IH3Y0Epyo2FDxnr
         IvtI9QpjHTfPpHuunP5LE/Qsei0QYZvPrfJw1DwtXF1109sl7wC0Wea6K+VP5EUozTVG
         0qqfpH9hjI1HM3LA5AM8rBemYfSBNR32UMWPEXKdlhZMTZpaZzODJGxqlaOBcq6s1GaP
         J/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182914; x=1791787714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNEvzPR/McwJcZtZylhbx7Iqi8eYESxtxZuv6CuoKqU=;
        b=vscSIXZomzh+GlnjsDLZ1EjuqBO6VtF2dHdyUFraPxNujnl2Dir8kB9uda60riS+/X
         5EDIhVNQ3mIE+f+pOHWVCZOWYbFPOdjzgY5mfsADV0+xgd3I1NqakIuB03Z8zu/atSGu
         SYpw0lLwOB2GD4rw7ERyCTyLfKHEOcAtgb/Qtp35eaxtBil6iGvgr3z3yjMy3jplxxru
         XAK270AdZiiCUq8qdpBV80e00DYIwg8Ma1ZG+9hjUy4HFeWemXiAXHS5z8ssBu6kwf3/
         2Vk3tVJ30h9q+J+wNEIrQTyL9x40tHIFi3uUIMF6+nvGoMutXzqnFJV2V60YeBjUwNFu
         Yb/w==
X-Forwarded-Encrypted: i=1; AKwUvByUM+9Sv/cMEnlP7fFNo0HUygHdSPK8wMWnpnC2YH5LcOoCL2NoWUK8a0nB0Ihh0EpN7/ExFMs9XydwlaH5@vger.kernel.org
X-Gm-Message-State: AFq9FYLebxopAxoVE+m4ZmXxcez8/dnZGdHe54PCG2JsdWoZK640qbKt
	tB5Fb68VGSWmACrfG9Q2LnxxiuN2523B082PJf0+iegte9FM57zN4Fj9AmkOd9kOKj7mVfSzg4p
	DTROj4DqjXpdcUWCOM+HwwmaR8pCSUAjJREw4sp0SD9RqsyfUDTCKlk5O1dZI8P+gyBcK
X-Gm-Gg: AYBFou1brqDVj1KJ5YZsrrzziScWmTALJyQ9uU1akBikRVIRZml7Ot1/1VIZIJkL6jS
	Aq9gELrvCB4o/zC73OHnUOpI7n1BFjKNKIfTvAdSZA2kBndwJqama9Vfar/1VFfIQx3sYIFiQ8b
	sk2pAkUh4CCXoGaaMcFHdgaIp/8x8/HvVtUoTrGH2sIIN932bEJ/otp3kKgrTSpY5gyxCAGIaDf
	82cL8epi323ZYNS1Ws9Zxcalz6gWFEjLP2xRu5Bop/W6I3bqs81SiC0G14ueowZTV77AHrUNi5y
	Ve1kqMKUviFN6KnEX78A2dIzHl78HyCDUQPETs8bPwDBVdPCSCbLU0hrKypsiI+of45Xk4lyI46
	alYQcHfpwUxwd7oICNJtGCn2Wvv3pySTlHsQ7XcepB61gD7vJRi+bS492pTFKS3snhGt2auqVYS
	RIDaldsONAxZ8b
X-Received: by 2002:a05:6102:5813:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7c3c0b9a66emr906711137.24.1791182914133;
        Sun, 04 Oct 2026 23:48:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7c3c0b9a66emr906702137.24.1791182913641;
        Sun, 04 Oct 2026 23:48:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303450sm38747251fa.18.2026.10.04.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:48:32 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:48:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Adriel Santos <adriel@adriel.eu>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on
 gpio12
Message-ID: <b2lo7f4sbda3pou2ha5l5sqxybr5g3hag6qrcr6cab3dc2poil@wzxjjzjxdslv>
References: <20261002160958.908424-1-adriel@adriel.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX7iCMOPqx/YnE
 QgHFu3iz8btHvcSmgniockLjVSAEYaAEqbYTSPyQ968melkDacHKMnz//saC+jvckNrDUz0q6xS
 OKOR9nViUaO1ol23jThD5fiTrztriyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX7iUIkIPqYCii
 2+Px9pUWp8C9EHsx0vlqZUWL7Mhxc5Rt96TJVlt0mZiALcDAKXKzYL9CFCvAIkhoD/zeyIabm/V
 ze0P1gtjF8lmVIyPc8tZPlMX0nOeain5bTluZZ0aibdEc6/XAzgE4AFGhfqGjRYFpwfkqbIfkML
 3/rYqckw30tYtH/tcgZ++Et1K8JqX+CNB8tfOVe5Qc8TekFl/BKeRyrpYA9ciPejZ9XWpVST5/8
 jlos4J+5Kgveeqt2LXpuguQtPco4fh+wgKEThIuI+EmiLl44Dj2WnS5ah2+4gFyn0BRCxjlpIY1
 UqAGxFC99XXVkNDikjZVJZDcdnug3jXG0vZOwVyGvw/GyJZNybQrr68iRHSQaE8n9JtRcJgUx29
 szeuQyiVTiDY3zeUCxy0E+8I2dKQCMdPr1HO7CzbW5zcHBifQrgrOcO/i7JX1oQGzsOp/0IJ/Wq
 8j1iPmK5USWcLYM0KJA==
X-Proofpoint-GUID: 0dnNgrbNDQ8goka0RiIIXgRPf-7_6ZCV
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac34843 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=HzX3oSUVnuQZ4ElMAVwA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: 0dnNgrbNDQ8goka0RiIIXgRPf-7_6ZCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

On Fri, Oct 02, 2026 at 01:09:58PM -0300, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.
> 
> The vendor kernel shipped on that router (Linux 4.4, stock firmware
> 2.0.28) has pwm2 in this slot. Its pingroup table, as read from the
> firmware image, lists these functions for gpio12:
> 
>   gpio, blsp0_spi, blsp0_i2c, blsp1_uart0, _, pwm2, qdss_tracedata_a,
>   _, _, _
> 
> and has pwm3 at function 4 of gpio13, matching commit c6c159fcdb4e
> ("pinctrl: qcom: ipq5018: add missing pwm3 function on gpio13").
> 
> Measured on the board: with gpio12 set to each of the 16 function
> values in turn, and PWM2 held at 0% and then at 100% duty, the pad
> level read back from GPIO_IN follows PWM2 only at function 5. There it
> does not follow PWM channels 0, 1 or 3, and the LED switches with PWM2.
> Functions 4 and 7, which the table leaves empty, do not carry PWM2.
> 
> Put pwm2 in function 5 of gpio12 and list gpio12 in pwm2_groups. Drop
> gpio12 from gcc_plltest_groups: none of its functions is gcc_plltest
> any more, and selecting it would trigger the WARN_ON() in
> msm_pinmux_set_mux().
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
