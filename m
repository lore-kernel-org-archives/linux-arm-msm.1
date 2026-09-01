Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919743AEB27
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251678; cv=none; b=UsTzpWokbPW+M1mjmiLrpAUTB2ixyiZ9aaklUnzMYNCnhVZ4f4yJ9fJjBxE+efDM12gE2h1LwicR/dcp+ljaW7Ljsmb+1i+iJu2TH0bEeUgG0zrkpjqVeGGdJx7lpExos+a6II66Dxh2XgZbb5KZjBprOdCzpM71IpvzhfZjDbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251678; c=relaxed/simple;
	bh=+2D/ucg0xsdoUCrlgOH62aNlq5NomRTOZrwN7SeHwgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JFbzLooDEqJ5WiIYxglKPqO39/W2j9zR+/VYe8OSxItFTdqf8LmY0k7TXGmZUmFYsUswgMv7g/4yNplOeDjFGMh9e+yJWgVRFnuRICSlsG2zUeqenvQk5xqvnICOShknTEcn9Sv+dRKPkG088fBcj/VafDSXfLKH7jdNAVwDv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E77LP+lI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWYfa0RH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E77LP+lI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWYfa0RH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681796eM1211380
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=; b=E77LP+lIGiO9Nxcv
	jY9dmnpHRg5VHoBBHUjxhZxQikjYXwC/sn/0SzMWYRW+xKtmm/U0r/S3obz6UAkJ
	i6BrzJRWiEDmjSZj7wdZANuwEnSz/ZbF2sHrC15NohXSGumSMxBkf3sow0ZCj/nH
	q1x/4Bkez10x/Cr8HGoNkKT0NNqAWo7AuIhyx3bnRjGddBOrHMj58m/z9pObZakI
	4e9dIN9JE/JR5lfPfSif2tISJuxZoHIj4myu0Ii0VbtkKxKb/5Ubhyh313Agsc3U
	IbjmzFCEpkUXWHxL/iKOJ634WCJ/C7WugpK0LxA0qQC2FIqDmlKmZ4sD5tgQDPgH
	5prxCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8sjbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:34:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so10607831cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788251675; x=1788856475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=DWYfa0RHjccGdOSmmLwmqHt5fEqcnOx4cPR1OF1JHJw367NHjNdMM/EReWXDJVaQZe
         71xOQnNWck3fTF/tbWefZvj0e08jCWh4bJ3+Zw6IAhAl+EVNkkVRqiFk4wLMgih+cMXo
         /aBgUrdLYEDJg7TMPWAmoeKzOtoD/sc5ATrVt/uEBykgQbllEwu/Egn5hU4cZlO9l0L/
         JlUNL+60F52JemQLZbOjQ7M0gC9SsxDm55k7CR9/zhJNGLLKDBasrk7wu5yNYjihYuhU
         R3/pSfXeYpqEODfsOfqSZf6u7cr2ybWqke3rflN1ewvIPQgEHU353IMoK4iu9i+73ejh
         ki6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251675; x=1788856475;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=piLZ6YqbZ3P809eNZq3BiRdhvOYchiSY5uv4zPJ2TV4=;
        b=FW2QQrwonwgYxDcQDcafNwCTr8MDpG+Ms47AQr+1PmUDLTiYzAAAFmRnuz2pCSyFjl
         F58pNa6coE+aiTmlkkJAbhmFlg9wadgkX9SUUqYdJX1xMSYNHU/k7WKMe8+6XYI560b3
         URGrs06RN+BP+stJv/3KNXDWF/rQn40DjoVG/u2GJsRtv/dBXdcuvLbQtOdDozbOHBn/
         EoLxDWAImjtqISjUtV9GjoSZA0t3Eoc+7H5zEuozjor0M6GWlOCiDOkRV+1U9Kv/4xPU
         0aglkypM4u06P8mQ+h3C2IV4chPqXpKzFUBdaJaB3r5goYPX0VjOoHP+RBA2GrXqHLFf
         eGWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6jQbWIq0kkZSY2L/OlOyTrGQ/xqs34+6epNkq4/HjMrEGg2PxEqfNaAPfeHPR/28ZumHFFREoad5S84Ad@vger.kernel.org
X-Gm-Message-State: AFuF++mymEIC7CEI+mJLLkISNARk87lTCnQTsWpWkiQv9SSS5reA3Ymg
	/qWjGOgXfscwuWLrU9ruwK5CeavBcQX0Yh1lbVFc2mXhwiXj67W/cy4RBHJiY975vutoUTJn0a5
	nTLChvNDRSHjdbnlS6MOKftLG9SKNg6athLCX9VxfZkTSH28t0f8fH0EBet43BodLAVjU
X-Gm-Gg: AR+sD10NkxD6cHqQWq47WVgwNlCYeGZRYfdG8jt1q1wy4cug/G70zV9lR9cXPaq9HZb
	0DDV2jh5SpnagO/TSdXNLpDvlcTo+jXVkvzlHhh59mLnyCDcyAc+XPZfrX/owK1/ZhPcT4tLkpC
	83d3lEkgyquhfjJO1EVpBQk9Un4IdTvWCKdcoj0bPqZob4EQ8UjHQ28vQgWPE0thC2DM73VPeCl
	vuNonpIq1+/mtiDZr2YECotj8PhvjxIWw79VCGpjr1iapy+5xj2SG/GtTHFSg0Buk1rgQO8MruU
	Vrd1MmWe9Nf6XKNoxrt66GQec3C1NPIRC3HlzcHEsFOypZ++z13yMyIq4oh4ujf9ZRWNTfsQGm8
	Ry8ZSQqmPVdby1K/Y4jQbdg==
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426951185a.4.1788251674679;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
X-Received: by 2002:a05:620a:f10:b0:939:216c:59dd with SMTP id af79cd13be357-939287b1e3bmr1426949785a.4.1788251674233;
        Tue, 01 Sep 2026 01:34:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b23esm525247466b.2.2026.09.01.01.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:34:33 -0700 (PDT)
Message-ID: <1019ed3d-cc30-40e6-b82a-940144a97e91@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 10:34:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of: property: Create devlink between PCI Host bridge
 and Root Port supplies
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        robh@kernel.org, saravanak@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506075625.8490-1-manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a968e1b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yxBm9irkQl15ksekz78A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX+tzDFXQiZCO8
 i2sL68CZtBagZtLcqjjvmigDvsJfvMY4dCUMNyAUZdn4aH9qqWH7MceczRWpTCT5dsC2Cq1HXiF
 mkN//MDdiO7ELh+NlFGOQG3GIDx+IoeXExi6jcbe/jusJyH0F20Bjevw9qDHsU3oMcnat/gjeZ9
 Y7tkC3USTuNNNYDureYUIMJ/FgjPfvZvFfGTF5EeWla3t7I6h/hbsT+U+927u12l8AAs+uXDYQL
 11c3PqP/HvJivg5soNDJ5HeqhfIMr+XGuwbJuRBDqhcjb5Pi5zuSM6QAn3IMwWyiloEjolRx8rT
 ujH+uSAksrCXCtJmgsb0K3mg+mijxj8NueWRYBJpX3bwSkCxZAGu9b14xYg33Yu8FC8+kUCBQU/
 3FlNmibIKTGkSWX7jpuHGKd4JmQzFXlQjrJW/vkMh7JEii1i5ezKqoeciM2TFj3uExkQhdkjcl5
 tQVrC29nonfEy1VMUsA==
X-Proofpoint-ORIG-GUID: 7ORd58d2CuAuCQWMoIuLGkviA7cwaRKQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3NSBTYWx0ZWRfX039x7Cwy1CY4
 Y+idW4eD+jpo1GNCdoF/KwDU+654k6ih37vqRKq7dLdjiyESAnx+HkehUcB8F0H496la7z75lnw
 +7WbS/DSWbqudAlLBjq83wc6DZIvaCU=
X-Proofpoint-GUID: 7ORd58d2CuAuCQWMoIuLGkviA7cwaRKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010075

On 5/6/26 9:56 AM, Manivannan Sadhasivam wrote:
> Recently, devicetree started to represent the PCI Host bridge supplies like
> PHY in the Root Port nodes as seen in commit 38fcbfbd4207
> ("dt-bindings: PCI: qcom: Move PHY & reset GPIO to Root Port node"). But
> the Host bridge drivers still control the Root Port supplies as a part of
> their controller initialization/deinitialization sequence.
> 
> So the Host bridge drivers end up parsing the Root Port supplies in their
> probe() and control them. A downside to this approach is that the devlink
> dependency between the suppliers and Host bridge is completely broken. Due
> to this, the driver core probes the Host bridge drivers even if the
> supplies are not ready, causing probe deferrals and setup teardowns in
> Host bridge probe().
> 
> These probe deferrals sometime happen over 1000 times (as reported in Qcom
> Glymur platform) leading to a waste of CPU resources and increase in boot
> time. So to fix these unnecessary deferrals, create devlink between the
> Host bridge and Root Port supplies in of_fwnode_add_links(). This will
> allow the driver core to probe the Host bridge drivers only when all Root
> Port supplies are available.
> 
> Reported-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Rob, can you pick this one up?

Konrad
