Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB3E236453
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614900; cv=none; b=CwjhfmshUY8FnIZxAc+a52BTMyik7iX5FY3DSBQbpP6+8AVS0kZmpq2bseMg4AmD2qvnBguSFXcrgDHOJBwPGxyga5HJ+F8XCA3w0V4/vTcRZ3SNHs+E1NntmqW7qbz2BWnXGJheKIFCu09+240dXRHr8ck9hYp+T7z4h31VbTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614900; c=relaxed/simple;
	bh=YdH+rcUUwQG4jTDbECCNSQbx1lQSLf+Jy7CGiJvJn8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N40TRU1kIh57HoyuMgyjOwRxXvfO1aGtMqnsALn+3AQHjULrG18CGKOH8UTRMW7EoI8tzEVcurvJ3kPCCf9QysWwRhy9SJwao1XXbZP76Q/v5uOJUxYyNq8bOrQ2S5CFw5ZXlOOp+NiIBFYnibHjpb1cUXV7bZAdZHCC/YeU70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZgBUrtP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAWCa1Sn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZgBUrtP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAWCa1Sn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMQG322430528
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hocXG8IEOu26x3uoW/8TyWIU
	kuS1tUtxSAPk96bBQFY=; b=JZgBUrtP7mjYA/2c+XdWjFStdwCF3IGdcTGKxh1w
	u7QnHdvUH9+pSM/ZnwOrTtxJFnSPk8eEf/JRSJS/PrQbPLEhkgwt7TJ2lBacKkl1
	uIvfBt/aJHdceqkqZPNdBR2OvtFIuBApHaCMsdA6dfNkFIB9cZyxTcpvI0PL8tea
	s4OI2J82YYimlmiL79aPywhwsRyOVIWWc5uipDUyU+4gRGWU9oBtBjBDr4BDn81o
	OeMcLN2WiSp2GJf3TfhFqU5NruuSb8OmD1pnMKPAfsc8+RhPbhjc5n7bZwIZSb0A
	4LtYTDN7iHYDfWmtdmoOhlGrsqNGi1rQ9DclJqDM5GmhEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqthnumph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 03:14:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso347905a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 20:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614897; x=1790219697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hocXG8IEOu26x3uoW/8TyWIUkuS1tUtxSAPk96bBQFY=;
        b=IAWCa1Sn/wlvZT3fuFndrivmiBBmCyj2kQ/5cuMQA4KU2fvabrNF62wmR6QOMIG8D5
         5KA1BJfrxjwz+c2DfStICHbXg1itqlFwSBd4E+dr7klaJfhYW5yx4/9TirLJ9E3gAbFN
         fIORsj5B96mMPPYNqTo7Q2lMRPVIEBDQ9QMESaQVleWrLx4xjr5x82Ul0Cc6ubRMVHjp
         utr7b8exYLBZDAmz0zC71rTNmkF26FbnuoYLK/wuD0HaLtTSwGs/BbgRZRJ013zPt7+T
         BqdWGyb956D0hI+9AcrDAqGGzAld+Yj9Ts6f3Z8U6FSXoPPx5NkWVebAbxbdf4BL/oEF
         WTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614897; x=1790219697;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hocXG8IEOu26x3uoW/8TyWIUkuS1tUtxSAPk96bBQFY=;
        b=HB7eqe9p/GUz5/woiM1aTpa6xcoSZRtVY1Vun3A9ccFK3Bnh7pxwxIfGk+jKOSvr3p
         kFecIZiVs7+eUyhOPOQQJCze4mAHnTW+jN778aHx9PVDEoflhc3UgzJAwHzDhmzfMHeP
         DtyJajFCi6fXSo2TPp3ikq8CSiBZELNcx0UrfE6YQTRDuhJJpAvl0lBzdt0KPmxNyRzo
         QfVWZKhFNV/JO8NqYIneEc88PhdIPqWaCUXZ9Uw6xWjl/H8000Qx14f/Pz0aywmV2idC
         VJcpo9G7BLN1sVSihHQRJDSdbYLyKT5QLbduOA+TDrf4h9xLRXipCCkPbgI3LNMLUX+N
         s8dA==
X-Forwarded-Encrypted: i=1; AKwUvBy+4F6eEgYJA4ixdS1l5mtAcpAjRYrlxmytTftTka0YVN7l+teNEzzW09RHgQRHO1DxdVlabDbxU09tok0u@vger.kernel.org
X-Gm-Message-State: AFuF++lNOyQG8hEV5X/imFx4T7W9GlBpne1p9/H23xsrvdrM3E5CVIt5
	68ucJ+YSag7kcbw5RSBi30l998aeTXRG4gezW3Ar7ca0ATWspuhNnzhgIh4nlft6UTAr53qL6xX
	AiMFYovD79DdhAz5hVdfvKGnEeSLPPcAc6N2cd7EegmBndHcGOYzDoBcDmcallM1SdqMn
X-Gm-Gg: AYBFou2iQPvuq4pn+c5ciLTt49aiT38NvFfYMvkiWWdK5W9RqL0vlMjFxnG5mxcdMaj
	x8WU8MePqUTz83mwxtDovFq8t7ky8MgYq3AeEiTnZU8vuH/9q/i+a/p1nSXHAKIPoXDYzFHXqzJ
	C/0Dt/KwjtKiFQOF57LmyxAOSesW2IT6ckH7EgLlqm+CzX3Zexv5jDLcDhHCQdL6WHIs+ORcqkH
	19JEza5PFlPstVqlosPwkw8JyRvP2Jx3GGNubhwPQR7+TxJ53SAnaVGWUSWXSi8bczwi2wph6D8
	BBw+d7gNemS8VbH0VV7mzPSlZw4pp+45NC6g6Df1dWw2lHL+4RhuUkI3enV7xmvqPqsVpaHLs7t
	u+KIlmUEdSSKFQkIwBKSMFtTsuvUrLF4zZ+DjfVdLMYE=
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3dd5f5d86a1mr13812177637.17.1789614897218;
        Wed, 16 Sep 2026 20:14:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:3315:b0:3d0:9590:7148 with SMTP id adf61e73a8af0-3dd5f5d86a1mr13812119637.17.1789614896794;
        Wed, 16 Sep 2026 20:14:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cacce6sm9963228c88.1.2026.09.16.20.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 20:14:56 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:14:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: linusw@kernel.org, andersson@kernel.org, brgl@kernel.org,
        pankaj.patil@oss.qualcomm.com, maulik.shah@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: nord: fix GPIO interrupt target width
Message-ID: <aqtbKlBVxoFqohsN@QCOM-aGQu4IUr3Y>
References: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916085720.771498-1-zhangfei.gao@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QwlmUuLWfBPFvinGO6nack-QWvIlcI7_
X-Authority-Analysis: v=2.4 cv=IsKL47/g c=1 sm=1 tr=0 ts=6aab5b31 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=NCczGnymYEpDLu10qSUA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzOSBTYWx0ZWRfXxyfLhSRWNDa/
 i8T+g7l1ovuULPLqUtmYG28qOfPjU630l43l1BdWaIBlZQ5mofSIPfFggi7GxtYDuNn4df1L5TS
 YyiS14kFoJF+A74SwLE/yuMMKzatrR31h1caZ7mO/xsAPr5PAdz9VyQxY+ZPmEgbjK1RhsoFGXc
 UcVWKIR5YAMli04+5ZEYWJDGQqdxfH+AltK8Zk8RwuPEulxYu1p6KjeIY+gztALYaDQb6rPS606
 mXbSKZY2Ytr8aTqHUMi0VFDmVppdOt87zQ42Shdub+zCG7hM1XdKH2YsDFru0cJAq/p7bj71KCT
 rTFIXDsH7GTb16KsI/ro/qoiUH7kSraPNRfte3qvL9u+nZxKhvHqkk2wxFZpAs9gmaX7p1ktBL9
 balJuTNs5xSE6oHp5aqHbX0ViPdw/pdrHqhp67hCQZ1abcEnFR23/z+9n4Dx+mZOaeFAywVBxgk
 jQPT1YIPZ4hKM+4al4A==
X-Proofpoint-GUID: QwlmUuLWfBPFvinGO6nack-QWvIlcI7_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzOSBTYWx0ZWRfX8C4ACR/usCad
 vLHkR0nEoKfl4ObzVg93BZaZcBp7Y3qtM9g4jWM60ozKDimeW7fIjpbcNwpmUeon0ORor61AgOJ
 HO6nEDbOxYzyN2yEZgPGlsPDO8Tl55c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170039

On Wed, Sep 16, 2026 at 04:57:20PM +0800, Zhangfei Gao wrote:
> The TARGET_PROC field in the Nord GPIO_INTR_CFG registers occupies bits
> 11:8. Describe it as four bits wide so the common Qualcomm pinctrl code
> clears the complete field before routing an interrupt to the application
> processor.
> 
> Without intr_target_width, the common code uses its three-bit default
> mask. Since GPIO_INTR_CFG resets with TARGET_PROC set to 0xf (NONE), bit
> 11 remains set when the driver programs HMSS target 3. The resulting
> target is 0xb (HPASS_DSP_1), observed as an interrupt configuration value
> of 0xb1b instead of 0x31b.
> 
> The GPIO interrupt status is consequently latched, but the HMSS TLMM
> summary interrupt at GIC SPI 208 is never asserted. This affects all Nord
> GPIO interrupts using the TLMM summary path, including the Ethernet PHY
> interrupts on GPIO55 and GPIO141.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
