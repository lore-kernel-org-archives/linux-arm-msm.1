Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5CC39A4DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393493; cv=none; b=QzOU54klzJB+j64wPuhY5kjRmnmFDD59aeVTFRyEhOi2o9xz/RheHX8caKX556fxrxHnAgLRURQWrQOydSNtiIQ6XNl2t3n+zzVrI9YIPRoNdAO0vYooJx2UHrNPcMC44ju/Ziturn9DJL/1sZGGlyoXwbxxXmtpph4Msa6ygZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393493; c=relaxed/simple;
	bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRxk5xmJb2gXVZyfA8MyXKYsf48QYClDpWquIMGflQBPyaHWMdQSty1AJMIpIEdAzJLIZmVo+anlKo7FVfMW9NtXg6ZluUZpN3AwNUdN4OZj/xqm+y4zZv0ZwekDH+yTkHD6ZfXWYi+jhZHbc4IqylD0P7x3iuQImMgyEMyZ08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRFLK9FZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+/RyJGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRFLK9FZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+/RyJGl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6afaJ270585
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wdXk55i1ztdtGaEhq3W+GOdT
	kKjOpc1gc6SfSK0SaSE=; b=QRFLK9FZyJOYoqzg5Bw2cmrkRr/isrt3q9fTUpJN
	EoE6XcvVrpYrjnE4xh65qMYUUCgmZ8sANEPefgOmvl7DnSVh+OrrW72ITu1sHh+K
	+gvkYRQm9iOgapojTCYiR341Fb0vqeYr8Q6N5lS2r5kixZxJySFw7f5MZm9pYHCE
	Uje1bULEe9XrvfbZf/2wiJ86vICBTve2EP/9ZkBaDJmbJtZNQFF+qUYQzcqs1Oqz
	37JA4mrnoTFmmFxkwLw4gqL11sur2pKEGAAkbWby7eS8Erw+tLVD+eIfL7RS45/p
	imbzHgLk9YlvXfNNoowVV3kNz1SumN21sk8FSi+TAMVPeQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr1c801k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 06:38:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e6d253330so286929a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393489; x=1785998289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
        b=B+/RyJGl9OBS9R4Sbsa8kRwa3BgoQriOWgqO/DxvnR+3YmIKY8kH0/WUC9VLYUYA39
         0qgK6bXwaCUzU8jU/d1UF5y1VJnsLQw4sMrIXlsoXckPzCgbuZm3ATgk0cKDobuF9/4K
         I9Xi0SykGoTUir3jCOxq4Ifpq6lED/XrjglDBgr8EmLyjh9kkidgWaU+puNZPbBHSJI1
         qrT07G5dpaVZf61F+XQ3R9MUNkVEDpoiuLh4qYXSb9snQEZsjNGtLxSL5YdpoLba3A+w
         E57tjata52SjnuM3A2yW6NlYgfPoQP8J//djZ6fAw8nZnzJ45Q2c+htBK+UDhA1f7FwT
         nW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393489; x=1785998289;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdXk55i1ztdtGaEhq3W+GOdTkKjOpc1gc6SfSK0SaSE=;
        b=ZeISiRz2NoMDR9rxQJtMpS/2j0oBGQoUFnpJD2VC+yOPlvmIeMrZnZSLYEeUJBbVRr
         TXax+pVo0D9Q8QGtB2mIA4ioBb6NM6gI+DAUpMeWrVaZ8B3a9vnS1f/LMC2NHNqdBzP6
         sd6jJIXmGLs/kUJSUdasI6CTcNumbKI3sTtsiWeHQEHSAGgb/7VSWLhjFvUd5BGalUFf
         xNdfLS+p/kvlhljrI8Xg5Zn123db3DlvtdjXx3uhX7sIai90pK/MprW1vf27QODbMGpI
         Jm8Dt/M4SiNHA/HpYawAq/FqQBUxLmq0G7njZNNETnwUsbuxH0UCDgsRqLFl7gLGKFFk
         opVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrs6knDPAXl88GxbbY0EZEaDcAGCgDlxTrSYyUXt2qHRxRPGakGNUxzw2NNLLM1X6z8fxN1GDa4dcdtAKM/@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRNNESjgcbe8VI/+zhqi/IR4R4BaFd2CpNn1m4Jwuz20JX5m7
	YZTO4DNzkJzyIxDtRf1UjrqQr5qYsgNB9kBKBM72hAkv5Dz7+OCbQaGZ+gRxBjQ5bJ3MmhVeG8A
	v2lOJZgbWQYxDRbfJZShI6dbqb/jdczxbv58ZJcS+xhnRpbH4xKhHsuxt5ctmt24Gv5CS
X-Gm-Gg: AR+sD12jkB2YlO6T2jKDXAx42gO3B/DWSj+a7rKWIfsM09OrxgzetF0SALmGBZWVk/v
	5q5Xtse8asF8q9vJ0KnO3vkn51N1dLIF6cXnjVe5sfeOAoq1NUF5hnX24mwaCjAlCUddrdIhxWy
	KGT4ZgpkJXAOlWEtlj0vcvid0CYuP8CWs0ysVADvtDUCmQ4OSw2fCzLt1s0zeZo7MrGvR3vF914
	qp/l+FTku09gJW7vg1ji+UG3yrtmDsqpT9RfzEf3PQMgEsPRNE3/2R1L+ljj5CsE0vXeGpT+Fq3
	J11qF9WxMahzSM+jW5XGzS18SmBWWBRrxroGE5KJPbwf+MERRtgmNnH0pu4FM0UAAqrjButAnVA
	x27XX4Azo/qQjd5KRLPCtZRNs0R40xWPXJNG7Zt8raRHoSpBSIEXw9ufATGLarfp4FBuMDuNGEl
	KSIQWNxc10LXdlnAXfvLIA2RaSFIFG6w==
X-Received: by 2002:a17:90a:e708:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38f9d3d488bmr1092704a91.7.1785393489562;
        Wed, 29 Jul 2026 23:38:09 -0700 (PDT)
X-Received: by 2002:a17:90a:e708:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-38f9d3d488bmr1092672a91.7.1785393489061;
        Wed, 29 Jul 2026 23:38:09 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7271f0ddsm16725591c88.11.2026.07.29.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 23:38:08 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:08:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Message-ID: <amrxShOJc+bT9pjE@hu-varada-blr.qualcomm.com>
References: <20260724-08-dts-v4-0-65e61a1061f0@oss.qualcomm.com>
 <20260724-08-dts-v4-2-65e61a1061f0@oss.qualcomm.com>
 <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b14c17-2953-4b74-af15-4677390aec9a@oss.qualcomm.com>
X-Proofpoint-GUID: 7f1YwQBZNIiVdlU6xe2bCjc5T1VyPYp7
X-Proofpoint-ORIG-GUID: 7f1YwQBZNIiVdlU6xe2bCjc5T1VyPYp7
X-Authority-Analysis: v=2.4 cv=EJU2FVZC c=1 sm=1 tr=0 ts=6a6af152 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=TEurOFaeXT4H-FEqwasA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX1NXzPeEFEfRI
 XVL6u2Hof3+KysX1wboPaZd4QkzyhvxAjaa0eaLz/Gw9So1LUof/Rx6fk5XuoEKom/inKOGcwPl
 8AC6FsaHNlEW/rI/5QiMf7lAp+zZawcgNXnFQpTcYuBG04lOsPMalcf3/yzOJl3l3QACHq/qgQk
 U9A/8bKQYky8rmEfPHPZQEGy/YFEJM5f9hqVBI+1osO4jW/jF4UwRCbm+S1PDpnRuuBCSuhr3HG
 F4lMz0GgnB4h3eMdCtw3nSEsqiywLwiKLuBTcbhMbAK1bwLOX+Q6yEzBh8/0jvpA8XpPGyrO2fm
 DJGk6YWV0Ynb0lzH0vspeJs3gFL3+8SOvq1xqbFS4FqmQU0ty0jDLvXr9kUT+osnVKbRtK+fiof
 q/4qRoUaSosGhA0bg692ZDMfyU/xpRWN7gpEJv0i0onyP/ooe8BEpmnHSopUOMcZbV0jUJ6XDGP
 wNG+eV7LVW9P3HjPFqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX+BLxgKJt0Bpy
 l9REhpriyYopFxubr4sU5a+jlJESp/ozAAzNB9hq5Q1iTMd2rRGrzTj34H7VixeJNPFB34LBylJ
 uHnQGmcJQmeo+IFjN9c2rGhv+duQK6I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300045

On Wed, Jul 29, 2026 at 02:10:56PM +0200, Konrad Dybcio wrote:
> On 7/24/26 11:54 AM, Varadarajan Narayanan wrote:
> > RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
> > share the GPIOs. The board has to be reworked to change from EMMC
> > to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
> > and include it in variant specific DTS file.
> >
> > Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
> > and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.
> >
> > Remove ipq5210-rdp504.dtb from Makefile to avoid build break.
>
> You're essentially removing support for the board for this commit
> Instead, this commit could be:
>
> create .dtsi (90% of the current .dts)
> add #include .dtsi to .dts

Initially did that. In this the git rename of .dts to common.dtsi gets
lost. So did it in this round about way. Will do this and post a new
version.

Thanks
Varada

>
> and patch 3 could be:
>
> create another dts
>
> preferably then, all new additions would be done in patch 4 altering
> just the dtsi
>
> Konrad
