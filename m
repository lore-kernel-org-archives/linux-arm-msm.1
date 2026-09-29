Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF57528430
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687963; cv=none; b=ufTkVtGtNFKAfdheU5LkV05KPZOaykbZ4kZTEsXecZQGLNOabVN1mfQ/hzcYhLe9WBoNy2MOvTYS0yxrO2BFJ9bj1F9jVcirdiK9IhLV5oJJS6mIKsVTEcDP9U35tdfl38c7tbN2BFKGG5WgQNPLswP+Qb3zsu95adZvWCRKpyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687963; c=relaxed/simple;
	bh=32Y3KM5bCP1SDuaXQ/j9zM68Tajy2ksHRzCJwpZJBxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUGI7Duqz/HZ7YNg+PKQbmSoDqiVxLb0tNiALT5+ABfnmUdJVtYNm30SP0l8z9stI1wRtSbY9zkcsw0y8UwnaE8te+wgH8/Hd7mSyBUPxGQ37AOrjM95vy0BC2T8BjtBNYcUMBsLY7kc1wviud40w8t09fHZ978BpfgbCD3l4LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpPaViXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjOfv7Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpPaViXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjOfv7Lv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqeoE613340
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2T5RkWVrZxsjtjTmZsWjGyBA
	n0522HCwfBHwVcNib0U=; b=OpPaViXGEgW04crH61xZymXkMSy7UodlkTejfqOm
	D2DzzS236z4RZxyjZFD1yY97g6+NJG1C8spSIZ0HJY7sV2ocFiV93DZ00h2LtiYy
	LdPkTiHRtxfOw+Hd7IoGzaubLuysCacMnVVfNYXLwdC3qzMYWHLkEEehl4dtlX7A
	8XbDLbeNunYLH4zqIhVr1xcS8FELJIlsGw/I0O1uJCh56w1690DTUou3yzi8RW5a
	NJXKdRqUhQoVOLkTvthQ39Kxmq02GxLoJej4c5Y25XnMojQ2qnY0WvpabbtUVVaf
	ZPxGWmRFiVqor8BwMAPrx24ah1KCu+/xZM4rR6k21CjLeA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2my2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:19:21 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7b86e46a9e4so286214137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687957; x=1791292757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=BjOfv7LvLzD9OeaI+VQ1PnYt/kOUrUNWOhMOQIIDem1JpYZSegta3GUssQXEhHtdnT
         ilOAHgYRVrZGSSwDgFUC93xciFs5akgBhQOEmBpR9E+apOZsADUvFglr6HeYwbDvWcaM
         ngUWZtHOak3GZPYEhGEGEcbi1RfajfqnJYZDcvnRnzBxCuHAWbsHdolTzEAVsb3583L6
         DRR9rGiDCKkOcuvJMZHtxoZxYXeZJjo9MjcuMBe1j8zbs6CUqGHFIP3LrKKaVtEbvbYr
         ZOhZk96UE6uwC/eevV3MHNfWcpm/AyT/o8u/L6N5N/LJjhzJzSwuD6BN4Mi3omZAFAzk
         70gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687957; x=1791292757;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T5RkWVrZxsjtjTmZsWjGyBAn0522HCwfBHwVcNib0U=;
        b=gVga9dztPnrOaolv5kPkfFY2p4GDWr2pIDBIsNRya9u4oja2Hvrybxo7LDYUS5T+EZ
         yxNcoZnCWoT6LOaYk8Mk8KekCU1iR7tzxKuH3POhJ8w8k24Q1UqM32eg6g1MoAy4nVa5
         WVxsNbpo80BIOPZg5zrxSw1uZ50+5XV6RXia+HROAus2mHxLkdWyfoY2fQtdngRqhKMy
         mxmOW5doTkIT4HprO7oxBs9fbsxF85ejMIL8malggwpOCuVAasoMEkguOKLkLmDZtcBf
         jMus0uJjqOjb26GBQgLxQcnlcsKPlotSlbQfb0AzbI/boi1Bu0ovDy3HHST6qyx+5hpE
         chdw==
X-Forwarded-Encrypted: i=1; AKwUvBxlAM0RC3+K2qf2dDiyaO1yJctcneRHBGg7niPjjQMtwimlNXozRVALxjeig1H3OTrwcy3B6ytbQJPWuoMs@vger.kernel.org
X-Gm-Message-State: AFq9FYISI+tduaQOIKZcsfRdudXot5zvAEi88eBO2G8ATZMwG+q1hrbo
	utylpw/+yT2N7ZLytTL4/nbgnaq0Fx7fSfaLRz5WJS1DwhaFxJw5f3NVVcnTb07e47hoEHLYwql
	H4tNB+b60yAlETIPRkac/J5cMJoFvgestnE/4ORj38v3z6osD5ImI5TaDbKPLIfoaP9hV
X-Gm-Gg: AYBFou2XTefQZLXKdUN/nIXaUwcXFkJxp3VsMqpjA3vVCq/3Bk+JV3Dq/v0UTY7JqS6
	sSssUe5bCLz7SNh+27bQUNfxGsh3dwnkkQkG28niV8H64qMK2WdOHnCG4fL2V6H/lA8TehGmTyU
	4tplH0U44arcvCcT/d8Tpg9JoO60f+1g2fiWl5yE8VWi5OIdpcDI0NdvKIXsA3EqYv8BJzJwc++
	DzvNqmq6UA5tUh288KZRtAxJscRJ28KT2Hvl0OwkckOMbuN1+4Z+fg4qQJP92ZCGpcL7XAtrxyI
	7dypDK4uoVwKJaGnmTycONTJOScZDO1RbS86wGKxnMrqSE1Py4VXyyJyIeRHM13WcTNaOHZy9IX
	RupHCqWPDW0CmvZU=
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999240137.34.1790687956489;
        Tue, 29 Sep 2026 06:19:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5714:b0:7b2:9b08:7e24 with SMTP id ada2fe7eead31-7b29b088957mr2999222137.34.1790687955697;
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d00570sm3501885e9.3.2026.09.29.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:19:15 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:19:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
Message-ID: <3ic47ak3t6zeac77r7tq2oeovmy26mh6kieyssinv7nm2dmzzj@33zfyfxga56g>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-8-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX1nxtK9fK2w0Q
 T1PRjQAsx23TF5kCjOnjSDlF+p4FJ2pHsEpxLx2fj3JsPHNvQJnsEgfauLgR8aKc4JZVr/dOh91
 usFuOagUm2htY+zugf6CTiNLKM5JLD4=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbbad9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX8w+w2IqrUMcR
 rmJVo/KQJ5KA2LfLEfpkIrSfrw3upsjk28rxF9yuB0tB9CNzfzNN0/zflF5XEJD2H2ZICsSZ4RI
 atbXzI+ixGOxQHEOkF5MqhF+b11QWD8446jvgmnO0iYv5RPo4zaBVVuKOBGEE5Q/V93UK+N2Hox
 VBkjHjqtp/sakOxnFyvPfnOGkiMYsEHzSAp5monkkKQR55sUAYFyx/autTzByyWbcrtwfCPakgH
 ox4FJPO6TyPNDgQZk6/tfV+PeRCAcviNhal1eR2ivb0k+n+BEhOcPP2ll5dNDhvTbPyOPhDCKPk
 ZHnMUP9WRsej1T5/KL+OYzvLtZc4mzTxc8g9qw6EgiLPZ/mzBcZb3eKk9r91BDxy/da4NV4sNMh
 n0BQDDiV66u83BSklP5oxT7OJ+5n2ei+nI8epDLVlsPHlijtVJ76h8LIEmjvvFpA37oSI36vjyR
 bn2LpGXwxVgwA6G2Gdw==
X-Proofpoint-GUID: 3mlbalmvFtNA-05E3Ex24Ug_o0_MoGxX
X-Proofpoint-ORIG-GUID: 3mlbalmvFtNA-05E3Ex24Ug_o0_MoGxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:40, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
