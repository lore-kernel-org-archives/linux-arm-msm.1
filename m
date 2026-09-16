Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87E3D891F
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549254; cv=none; b=rLJlJdYq2XPirEMP7waiBGPoPYn9XY8YT62OJCuO5htRk2CkSJNVdvnQtZdCyHh/9yrGpQd97aT45+IoT/C97akBByEZ/HmPhEJdCNysTWJfd8x8inqkUTVAmYrbsVmZbhM62+t7NbM9dMVXRiUU+/kfEO4OMmOGW9QYU/FKDWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549254; c=relaxed/simple;
	bh=qAinQBcS6NBAQ1Hv5hrmTKEuW3KpxxYsPgPOIKnm7tQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qj8+/q4/SG0UsiHu1WwTUWcEbCSULT+KBbsGQyh7f+WFvgZ72OFet6J+hOrfz1NHXWICkJ75gkuH+OKSTOzbI/qTURLgf5/rmu/j/RsOnhI7CdWaBGEB4rrEsu2SvIHVgUQQ0F0Tr45X3TxFuwproSmYhn7xogALYivcA1nKqQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iQ8x2u+a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhbHx+yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQ8x2u+a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhbHx+yz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68i8u2428911
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=; b=iQ8x2u+az3cDfEtv
	/HOIuKZVlwWFVRhnnmwyWZFKdlKJC0QcATyLln/38+iUAfbiEdPHne+LjLYPDi3R
	5kC1SFAvDic9LvVxs8LH9bIgRvFcHzdx6H8kyVDkghGbBHvAcTm1Cvg5LN9TEKIu
	uSJZBsJSnj42cM+n6Z+9Qr64vTi10BbWm1eKxtj10R5jUL4Tlq7ZDqCuEXsIOthj
	o1ig2cEDNd863fZsmWtoNxoGazrISVzLllgNxMQ0X60qBcK1Gl6uILFf594PwhRk
	axlzvl1y4FkKPwAt6Z7Yg5hNea0RTfHoI/u9FrZ+3nxdWAf6qi3nyQu/9UVgex5V
	zrQ3Vg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfhy0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:00:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-870ec29b035so1048745b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549237; x=1790154037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=EhbHx+yzUWqvSDpNBYZgLO9Beg/oQZt6Ye+maK77QdtOL4yHezuwAgzFo8+Y5ScAqn
         sVpzG9B5wn4FGF7vsfIo4itSUfqSooUsEkMjOGeJFpOf0LSO8gf3nl57qZyyozyTlrjd
         KCIUWCkX7N3Yqnho79fCqv5/bo2dE1ezzD4kR8YyWVguB3b1nLZd/tppv3SYWQgX6sLk
         q+UqzzhGKRB11Lu/XFKdiA0jI87NebgERe09sRaG68cGLwiIpNwunFZ8aylpzxqA4eu7
         cxdls1ngeNR2Eg7S8Lqz7tNW3WlubFIZpa0/xi3lwKaLalvOFmliNMVWiVS1jkRsTaTR
         UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549237; x=1790154037;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKPxqCC//VLDTZK4vYMRYmGXxh7RB8wKzEYO7LbabDY=;
        b=FC64v4dfu25sHNYQSLd5cZGKc4IsIJXO+tewLhpkeoqxkbY+DxFlcAieQ5ieIyvBIJ
         zrhGAtopr9dAOWVltx0BWWs2JfqwcIvuEXvuKZAWWaGKwntFwzNMG1ae1o6lCCAdzRk5
         1qpvmmasBPvhln2FLU5tl12piS0FAtHwxgrJ+ekpRCMQvKxOqEYrY1xzRolQHomYocGX
         IhJXCmu7m1XKA+Oxh3ncOpQtcAlWQGkbsI6/5i5l51OxO/OJlUNNMY+hDz2/y54ZsNOE
         OU+oCkHEZw9FKz+t3ONn2AsBlR30OdCtCuvngsBIOislhJazdJLMTVm1Cz7QAmSIW5Fd
         rmdA==
X-Forwarded-Encrypted: i=1; AKwUvBwetLdsMkJSI/NINKLwVHNH+2+5XomC++x75tS8xZmdjLhL3KHGEqW6hkZyhaB9G47gWaZThY5QaLaxazY4@vger.kernel.org
X-Gm-Message-State: AFuF++lrARR5vZYCavho5UaFlHRrqM/lDj7s/h98W1mDeAXbz8bTrBjC
	51U1PcGcfia5FNgOR5LiEUW6FLF/TOAuffofn14cHvOhdO6EPFTHCYJRTnc/dcq7Kv9h56bTlrX
	RkuCVYTcL75v1+sQ7YvvwRPMXlf79HNGY8mRqT1Ijn+8ZpkjGwBVy1fdd00Dcrq1RSu0L
X-Gm-Gg: AYBFou3/KEB0gie/2EB9VIy7qLpGDvrUZ9od0iGHlnHIf+6WLXo+sXomhNPsr0Z0Sj7
	oeytqSYWUkqqKprqm4FpqQ+vTAGqiS3H6lBEclUY1Fz3fkNrnef8mkYMcltylfLJoU/3nkCQGf5
	rJ0H0TTwk/JG8I+JZshYIEsC5a+2ucixOmy91E5Lvo4T+ezCzTfe5YMH+hlpUwtPC3XcmFyfQUN
	UD8w56kbX4DFy2zcAA5iQV8sSA65uxlGZ9Qv63WvXiAyzfwDyM0NrtcrPxouyR3bmHPIxn/eC+4
	gVdUjhVX0Lh5dXTpvBnhbI+7kN9BPQMww8URoL00pT/3ZEWZ7cYL9T6klUZBafJWv8t2IYfgdh/
	bhWa9HeBkS0sNmZmc3uN6oQ8jh2tRVjxC67+r6m7iNq+E3VErz54/FNDn6JxYuSJ+oUtE3Z1vsk
	UJ8uFLFaget1M4Ti+jdg==
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3530984b3a.15.1789549236402;
        Wed, 16 Sep 2026 02:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1bcc:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-87238e87fffmr3530914b3a.15.1789549235970;
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e4369sm903692b3a.58.2026.09.16.02.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:00:35 -0700 (PDT)
Message-ID: <2ab936e7-6c73-4d55-9b92-e01baa80a82c@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:30:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa5ab5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=V4wNLzlG9kf4F8Mex7kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX/vf5R+jpNZbI
 eizQhhfUu+J6CdWTH3z4phXkyaOxJyDC7Taio1O2+CpihfVYA7O1nPZoVIoUUPun/QQ2uFk1p54
 Bf34YKbkONnEz7pG0QtAR8bGLDPZHvc4rgLseSOuXGH4X4pdOdZASIdpgwCi3mZlMd8nnoaJ77K
 tPPcoShTd8zcRbmIBr3QQhtPXqj0AqCExgpi6Okdm8fBqW8EHEm6orpdFn+QOe1B54PPJ/M9vBK
 UcSm+231HtNZT2lr6dxTVEROGGqOfHUgIEaiZWlL/JYTOQfg4usWU43XQ3KBwC5492TGUAuVbjZ
 wbWFVGhzI7oVRmnSRWsSEyu2Ne9VRvu1cBnkhh7vcfD07UGrCMF+8AP30OTtMoscC6epjGVXtLn
 XmKDmcy7B/sG7+aJ43xnFcXuP0zKRyYXQUJTa3su2uA9z0oK5vg5S9BEw19EPZJhjvtaBv6s+ml
 eI7wz3Chdmx/HUECZXQ==
X-Proofpoint-GUID: 2wxEfNuaNg4ypEPyIyO_foiBIS5lobva
X-Proofpoint-ORIG-GUID: 2wxEfNuaNg4ypEPyIyO_foiBIS5lobva
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfXxVrY+droC0tz
 YPndS+QatH1WpfO4tFc5xGzb9jjM5Q6nhTbC9v6MOaKxYI6ufpIiJKTfpHRPaNsGD8G6RLpt3wI
 vm4RVB48LHm6ON59BYUrfOfzEgGurlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160116

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

[...]

