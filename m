Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201097;
	b=lMND7r3EeWYHgozpOJK+fSjvrPOvdFvyhb7G45JZWkbreLmn8pWj4PpKIv30msykQa2d
	 yhzNd+AMCkayHdABPCECwMn0DUg0LyzuyifIi4uFJcgOwVcYxmuTyMi4kC0jbgoSJCa5A
	 XHxutChnV8rIemKljJRBiZJj0NGfbaBe7hx204WXMAM5THziZvO8ZEdRt1Fi800U891nQ
	 EORjZt/HxDP+xIEuOpc9i+EQvlEJvwh97+pQydfVumhm7khp3gFp81lphPiaNB+mU4ZaG
	 LE6h7Sbx9kM/yIkXk9yHbdyak3qC6zAKhiS+JZARsPngTk3WZT0SOynsrQ4p9eSldpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201097;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
	b=W3IuLoH7fbSRKvXh0GpjKlVuwQkCqAX2YR4eCbBOfg80FTANrZB8F6zxJKrPX1PzwG8Q
	 fqI3ktRkIBpLYr/hSNVPJH/8ryYZUpbiRXRpftOWv8sVN/rnhSxsuOki8QFtpKvxXLrYh
	 wnwI6J2zpEMeEJEYD0vQj62Wt/fBW1IrDpzps2TP/5Tw8e00AOM3VHRidmV5G8oIDBrYh
	 eOixJFq+X2X9BKeO4aZNyqDvCs362hCKO3NwfhKqRpRdwzVptzLXDlER8OokGH9cr+9RI
	 E4h0YK6noTcjWR9ULMO6vNiMgQXcQIJ6HcFUK9Old8hojIG8RYyrsQS/5kpVXXVj2FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7D606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE7D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RACwGrfB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SxMtTmSO
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB6Jp2070796
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QLQUXqUYirntPTS+AVIsP28Q
	uGK/Ns+GbMRyoGZXnHY=; b=RACwGrfBZ/gA2Kqv3l52ojRFGLZ2TwI7tyazYofl
	h0AEGY/8tMLQWFfCsQdx7LUG2NtcoabfuznOh2PV9jTzT316ZweXD20Nv0eR2iRB
	fpAQqrlExWEZomtKYKdwhwQ0x8klqpJMRBC01d6mGTjh/1YJl9fwU/2oaDXXqrfS
	7Uwk2KIq13BOcgr/gepJfJOKdJUyQ5toLtFe4DcT16z5FuTFkvMp74OqcLEI3hY2
	hHOGMDyC/Q+JFX1AoGuuAYWRr6tph1T/5CkUvbmt5Ks3HX4X1TQBshve12JuasDK
	f9uTE1YXv7lXiKzdm2Dw+2T3zI5VYSpafFpGzJmeJSdSDg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jw0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:24:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso331631e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201096; x=1793805896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=SxMtTmSOs0xXzmv80/HN9uC0699yWPeex+Y5WeqIdc5iarDoOqHNedW+76e8/n2mcX
         4Bi7Job1xB0O2eMuwbL4RjU1LusJT8/NWEjAMN2TLTOw7G9FktKFwaWngqyN2d/Kctop
         QJHPValRdWuoCE3Uc/pCDDxjf3+UvzvVkKYJrCkqLBR5zWmjYN6GZqEHO5GkckzXWxvG
         L8syDiuMCptBzHsrQpET116pck1kc7drcLC4nQe1XAioqnbTt8Ise29F4miLr8tfHZWz
         rkMowPBhEmlJxsz7ag8HT1fNCM12/eeWWnsqKWgSX6AqSIMvKpybAha0MUaIL6LCmSqd
         Pyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201096; x=1793805896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLQUXqUYirntPTS+AVIsP28QuGK/Ns+GbMRyoGZXnHY=;
        b=QGL09yFVdD3yuclRKbJR8UG61UF2vlRzHL2ZO/TBUm/G+ouLiizV29T/QbZLdO7hfI
         zyz4BrYLhSeaqcgWSwIm8aWy/mh+Dm2FoolQWCFSfu0udXsdRm3AOpkSD9ZRXFxbHTDZ
         HDMWUk0SXeTg5kRQWA/AhOMtNVF3/EZL99r7OziQUCV1UR3sqBozZU9//Pr8plgZ91nF
         BVAMJjsHMdjE7oARXnwTQypgkxQ2FLqSTDbIPZzZV3AduPHOPJg42g/QD05X5WHVj+8M
         f/aH+UhLh9audsjOG/m35I+kiPYota07Ch86GpgCTeKDCXlgvObODOBtfiIxOPbI/jor
         NVIg==
X-Forwarded-Encrypted: i=1; AKwUvByyl2klWMFJ21R/ANkz1JU1g0MJaQ+O7ifihIQ2bblxODiwheU5L0yyeUNMpRV5vdjIL4E+ILBD4V8Mgl87@vger.kernel.org
X-Gm-Message-State: AFq9FYIqLJCqMDLlQjRhfhWLh9vKgeHK3kPiBAn0OsiMGaGLmSroS+lx
	pbylW/RdalYOp1ySjQAqpe7MYqQvcbPHMuFEr16VYZwLo3xgIkd3pA88maHJuNmKizCzjqHt34S
	xGP30xmJT40RafDT7zOLbRL+ot8Cb7p69IUCy2iEP1q38pWdp6sT2hsoQ+e3B1gfsQHpO
X-Gm-Gg: AYBFou1udNh6Lo3FsrEtFvIEEKtGSfEbG9yl1U6FRaaul1CHnbNNfkm91BS7NnBw3yN
	E0FdDKDv8ICXktxgjP5QzVdGg46SekB1ijfl4xRsPaTwYdcrneyxu4RIfcAPRqbeiH0j84U57n6
	EyhdlP2kW9ZLqwut7RK35CwcYL4uMWZ6MVJJ/K0RXeXaZpIm7MXyGX3wdiqKwO05wDcWSmFaOXh
	RQwDOhXQiJXMRf59cQZvlWz1sLEmqgnM2z0OBRm3tAZX/vAp+oXgZp73PFnXr0lypybyu4YbRuC
	TsIvT4fDPIdeXHzdj0vbQdSkvKOYoXV8n7KZm9M6m+lWfUafiMF5h9W3h4GSeIVunuqmLo/wc0t
	FkCcV8DQ0XivBfO3Qg7fGtp0JYvnTLTf8lP3vtY/ncGfZwiJ73a36so/Os1V53jqEOQ==
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308302e0c.3.1793201095579;
        Wed, 28 Oct 2026 08:24:55 -0700 (PDT)
X-Received: by 2002:a05:6122:4d09:b0:5ea:e324:7c19 with SMTP id 71dfb90a1353d-5ec4caaa352mr1308242e0c.3.1793201094884;
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm28208441f8f.14.2026.10.28.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:24:54 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:24:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe
 PHY on Glymur and Mahua boards
Message-ID: <keiqrug6itasipmizdqrpjtwhe6qibgtallk75kyorvpxsbjr6@uhpyachmpc6h>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
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
In-Reply-To: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX64UH4pwRgxp1
 HqRUKLfFZRAOpbSKBjJMDlNivyU8x85Cbj6M5OTuq4jafXhF6V3uDRudx2NrxOfICkz0vMCntLS
 9eGNyTk99nFWPEYZzEGR8WselmHoUSo=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae213c8 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=n262S7Ma3DPWuRD1FHQA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: yl1NmnXzRKMNlpqy9euF_0Dt1bktsiex
X-Proofpoint-ORIG-GUID: yl1NmnXzRKMNlpqy9euF_0Dt1bktsiex
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX8/zLt1v8l8K6
 VDFIPi+2dcsPCr9Ut+52kuCPOhrCLxBM8tIpPmsETy7wD72DoWn6Sftxmi7EuFJ5lwEULCdIx69
 Zx13gPscE0Toky+8Ls/+bNWs+3aaI68hCVIo15b8BnEnv4EgpUtEoPqMOZp2ouAwZbg21ANsxA9
 DdDZSXtIimlLmdCddOop5ggtnPc8Y2MzvTwUJN2kx5gtQJwyg76fSqcucEmp2xXQ2c8oKhevPMO
 9dZMqpVGIOYErMthORBFPZ8STBApooGjsNi8RiF+uWu30zVZuZZq0fzkNU8BdtrwLo41ekITU8w
 dPp9KqNxNDpNqXqQboLdx1unESdurrhZC99RAvtmmU/rmu0P2yg2hyoxvCXqwI6LCXr9j3XlFKt
 ebusPC6HESe7/0G5mZrcM8dez3MH8340OgPqrRBMPfeN4eEIpbPmvO9r4Ey82ccNo1Ye28vnX4/
 2tH3MjDEHZ0TjBGUO/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-13 03:16:47, Qiang Yu wrote:
> The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
> REFGEN, which in turn is powered by two LDOs.
> 
> Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
> vdda-refgen1p2 supplies for each PCIe PHY node.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
