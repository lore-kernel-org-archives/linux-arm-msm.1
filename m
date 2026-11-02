Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634623;
	b=b/CLU4WjLzQ6HRsWKwrX2/MLzayzElRCoa2TA9Qb7yyMzEFnvOF3C5NmGEqG8uEYuV8F
	 jG5gW1bLrxiuC3iQ/kL4BE9lmSWKt+MpVCN/YSK7Kx5QPxnkn54xtndlu10/p7T7HABD1
	 SR7UakB3Lgb1SMAZt4gOHzy8b4iFwRs1OKhN8xn0vml8OMr6b1RW8QrRTIAy+R1Nlv0uS
	 IVDGu1+ttbhRg/1qas4yd+hynm1F6eKIL6PcDl4QEQemElvrLI5iMKSt0wVqjOpcLIIrn
	 0wWOmNvsflkJLdIjOzaQbruYU9F/6JXR2thA/CxPwAPSGzRsBterAWs6p+AibKLLHZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
	b=HpNvf6P6J4mowX85lf4Ly4T3zxAuUQUMUFSbiZ+c8Dk+rZ6/fKbfIWIsUKT40CgEHsJ/
	 eBbtoTzFOVBQvGpXW/df+SMz0mdyhpYjxrg7Z6uOakYWMRLCXpx0cHSMI96F4MZrZRhcr
	 wTjwLILjxiQHs3LbVqvyHxB4Y8XTkcWezUbyKvclVMGkQuWhKGeQxNIA5+zF2whVm/O/R
	 w5jElxpZ/JLq7OEwudSf0PXmt05Wxlea3PQQD8+Kb2jP5KFc/dOjKHWNeS6040Vd4jHtn
	 UaS1psunV8TK9X7zk8ZVlRYo0Bb0OVEt56+8IQUGn23nEB8kiuvim0CADSHLkTyKWvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D0D606E015
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D0D606E015
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PwmcO+Nu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RoUPBwno
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpAem4033872
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=; b=PwmcO+Nux2qBYjbp
	hj8NlyxjExt0jFuE55TaYYFpmctUOQ3Gz8Elzy3EPNk0+375HLoNDPE4P6jr/FpR
	bVI1Mf+pZQtOFZCJc4y/elaaelHmxNabH0qH9xUOjbtn4vqMPjPo4KzmKoL3jWmS
	FQlkJ4CdlOOQFee1l+OQXXQjvYqD4MoXEeC+Ub5VYJv62oDR2ao3pHG1ySvEsrod
	r2tkeWhKoz+68+2aax5sjk3Q5WOgv40mOkpD7KOieA9cKab30uyNV7mgYkGRHXSR
	+wqhihBqiq5nR/lprfMO0qkDzaOPBBLj+Yl/znn0cnmif54WozgHJ1s6nq3lpuSw
	j9qojQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9xs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:50:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso600751585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634621; x=1794239421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=RoUPBwnoEkIwU+hVxw/bSvuADsgUOShgaXgFsCGyM7kpCb22VNRsjmzrDFsJ6cyu1B
         bbCqjVPdZGadLo3V28QxRSkKplpJIG4gbjW/tNiK95SM7m+33FddtPGR9Ma4ekIg6RXf
         IhwBms4W5V5c2PfRvtxwkme/5OiU3OWbXQR8PVEaJrjQo2kPM4NtGWh7weCIkNRe3ekK
         5d9bA7Ocnp9Gxy/OFYwsmhx4GOGNmtOZP1NV2TiDqxpPwJRU8BdV8ClXBln5TNFIYlk6
         9rZ3kqOKwaYISBfRu1Q6/M7ADu12epVhjkkkSrrZAEIOlUZeInDQ7RS1uONdWBVpL/q3
         cA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634621; x=1794239421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41SuLFdM+OYIUOpS+13yG0AFxIaS8p+xKPVbpw71ahM=;
        b=UpdG8Ry+cZZA69xyzrGjmjQF3RL/V5RPtwaXaA8/hXO/YeU0ugiiIJn8dc8HWPmy39
         f7C0Zb0xU0Rgre1RozPFTmZT5JIbSxlFMUAgsyvdfkPgIes4KQY45amMiipUUHPyIZK6
         KCRF4/CZOJjVRsJqEjRDQsyKfuqjOA6L63WzGS1wOKirOU9MWNx8oVaH0ULa/+4fB9ES
         pt6G+qY4n1QiJHDj9LtyIqFmDlV7psz8nrXjvlZr3s5J5zfF9pkH8D2idKHJnYwOrsxL
         IoBFxuUyXnZjRGw+wNPR76+PWZpnPkG2x4j2mJte+Top6vajkhz2yo+F8HKL8PmXYvAG
         NulQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGunjRtZvIpIOhfrnuPVgPd8qWyywzUs0C085ISoNTwiyGLPwD43YZri5NkzMn+vMIn25CCnanO0GV2g0V@vger.kernel.org
X-Gm-Message-State: AFq9FYJfKTe7FMXj+elgROvFuJiSRVubFf0iyp5ev9+hg4iRE/ck2O/N
	Mmzs7xHxP83yVD75Bog3k9e4gqLmnt7YoNuZ78Wa0kTJlMAgjP+6c8e7XzSYpYTjJTsZFMqUQDi
	wTBemO2tu0/uGUmYPHRNG58catPWAYpTEpANU4MR6bZeb0DxF0SPQeCvt89nJrttByiHM
X-Gm-Gg: AYBFou2xjZ0GLj6BAp/wc6qADj1KGmK2/PT5Fe9fe96S4ntc0u9zB1UsUTEnPKGNkf6
	RGws4j1ZECDJoAme3TcZ6SDrLZ1YCzawNpbj4xmQad/GiVm/wbEzU5VjAtbpSEdRPSlvp971WlH
	gPr6C3TtC73keLTkI1a85Gdl/H0UseY+9bdbZ6skEbTn8VoX6Mh/Li9jbwU5pZYgewDUXRjXHNw
	URD/o8NsbKDGG/ze2SEeLnB2Yktal6CxfFLs1NiwpuCcVpgaq+AtVV0PpGRS3dgjqbrglkhvUZh
	kmqSwxcAHczsF/t8mQ4h6+F3zDPI6dFa67P+A1yH5c/gV5maZ+JexHvXQWQaM2rfz6YBPKPtLdh
	fpy4KPCCrdOIiEtvTj+CBreXSfq+WvIBrYWBxX3gd11vvotoz30mIfeXmYYqHSBhlYTz+QEb05Q
	Z/FamfBoF4ZVQjAlgh9jl/Pt4+NoSWQ3L3nGBuT0xh6Z5slYe5bjewk3PL/SLC
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723020085a.17.1793634620917;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
X-Received: by 2002:a05:620a:371e:b0:943:ff70:dbeb with SMTP id af79cd13be357-94421618787mr1723013985a.17.1793634620321;
        Mon, 02 Nov 2026 07:50:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0740475sm1825160e87.62.2026.11.02.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:50:19 -0800 (PST)
Date: Mon, 2 Nov 2026 17:50:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lukas =?utf-8?Q?M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Message-ID: <ppc7kbhduxhams2pg5eh47gy3pozcpxz2ewunrzehemh4ajqmo@ey4ek2i4jrub>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8b13e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XXbD3vZemTXwHt2epcUA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX3qk4YznCQYDZ
 3a4JYnrLNMUWXaqCoR7R/DXBvVkk7jPbZoVdyB+TmdkIiYYPwJbHl+VUDhpMKe1hXvyN7JJJfeV
 C3H1RnFRkZ/gyY8ikJGevcpIRr3WA7/urg5SPSjD+j/EgqU9E7NLGgoPTeehER9aKwS1viBUUk+
 u8URhbZNffhIf8XQvZu2iCHEuTLanB1Iywvd9GxhFsxlEI2GFiy2g3pBmIH+VYdwvY5fTVI5s3w
 akIZQbO+iD0ezmHZZVrXYWCaBWGCfCKt9LA1tXf1TuOph0TERXFxhL03frMMSnMfkOJhBeJkXw5
 3tyKCad8myETeV+m7dIKXlR9VYVhZAlzi/+6r06kBDzHf1BayXgAA3II5Vuhe4KMXSwpgUTO7KI
 H41v4DKM5jVSdS+JrqGQU6qMEJMT5Q4J+5IxS8RdFgvRmSbhjI1Lu9RCse/lbbPfxnI0zN4GbCx
 W1+f+DzSrrexOZa6elg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX/g2xaaaTqcxu
 c4vmYn8MsXXqm5b2ZZ6tvaBXN6D1HKIamnfSfpUU0StwwokkJGtI6b3HHlo4UXF7IPzv69vMYZq
 XeM+JOWhj0T3pY93W2JUSIyhZLj69GU=
X-Proofpoint-ORIG-GUID: N3vePLxOak-xeeIw04fMdXlz2rgxfmfE
X-Proofpoint-GUID: N3vePLxOak-xeeIw04fMdXlz2rgxfmfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

On Mon, Nov 02, 2026 at 03:28:12PM +0100, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> Tested on a ThinkPad T14s Gen 7 (LCD): the GPU and GMU bind, the
> gen80100 SQE/AQE/GMU firmware loads (GMU firmware v5.2.38), and Mesa
> 26.3.0-rc2 reports "Adreno (TM) X2-85" for both OpenGL 4.6 (freedreno)
> and Vulkan (turnip).
> 
> Assisted-by: LLM
> Signed-off-by: Lukas Märdian <lukas.maerdian@oss.qualcomm.com>
> ---
> This depends on the Mahua GPU support series, specifically
> "drm/msm/a8xx: Add Mahua GPU support" and "arm64: dts: qcom: mahua:
> Support GPU and GMU", which are not merged yet:
> https://lore.kernel.org/all/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/


With the dependency landing first:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
