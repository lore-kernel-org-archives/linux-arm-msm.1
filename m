Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CFE4766BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477307; cv=none; b=rkPtzJlxRg2WI9oEqg0jj7Ej8wmvKphG7+i/nq1JdNYkowXg55CYCs3OOlsfNzrzOhupJqdmrmh2ejHgzkuwpakpGoaj3RFUFLbL3zt0VCEjIrq1Pj4W0AKnyF06PypYnCjtbI5AeAL1M+Lo2wQfJhUkYZ2MdtLAT4i3Zv4Z510=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477307; c=relaxed/simple;
	bh=iPP8GNotfCvFWiXkk1XygMADwrzkYlQMTKBgZTu1uVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLlus11PRE1H6VRqQyqcxV/61jfB1B0svouGou2I11c1LM6bo2rhYa/9xJCQpidP/j39rftdomXlUN4sv6Zx/kQ9oEAheC/tGrMrVi7MBObrxuq0rtjcqNuBXAud1JFdfr2RPixnKoqJTSYriDhZsi9rjZlKjeoOVu1OhGYeUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY4Czr+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwwNlIpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY4Czr+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwwNlIpf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BJGwvA2698352
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 19:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wkK4tJYYSj6QU0e1X/gFABkW
	3/7FsgEMEDSeVBG3MsM=; b=cY4Czr+hi2O0G4SjcueK8hgEE00fh0WBQ0hjYPIX
	/hEfwarLW7svW2T1ywYRqn1kKhGVv+kndZ65lRTqv1KDD130CyxbO5RQhhZadLpY
	ClxQQDODjvQhwlDPK4t4ocD6Ho/89iJUH7DqC9fMJyn4pjbsE3GjWrneFkZ5RuDa
	Ke6x8L9oz1CHTtULi7H6TDp/xKKf2z4un7MTqEksL6QqZvsbvlwSkfY/JWFoshji
	6epBYuL9U+S+FeXk9isO/kAfw6cJaQmBEdlggKPvRCBLO1lGeT+pFbAvr+NMdb5Y
	CpRbpt2DSYah8ADmhsYQFARH4vlchsY61Tb5VdLpj/Rsfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bsub8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 19:41:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so2209296d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786477300; x=1787082100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkK4tJYYSj6QU0e1X/gFABkW3/7FsgEMEDSeVBG3MsM=;
        b=VwwNlIpfAgmDGz+t9Hlnf/pezx51bScc0DMs2Z+IUWGpnZz9SPxjC5E2zrijnPjnuS
         nGYIhOArqfLPAWMCfHE6jdjxGWF9P6wwnKPSAX77yBR98NLkfFi8IRiKJkDrUK/jafbl
         f9LVOSd3b2DoxQN46DUDsF3RhOums3zf1hcT2znpMmse5EgdcfuZSMWdlPazJilz3YC/
         weO7kgGgCOd05a3wjLHDI3GVrXXOXdmHeN+wsfllSGl1g+ojJfTx6Yje/cwmx8j27ENS
         kTy0dUtol39f2NThFPhuFAVP0fwC85BFW+H91sKiE8oAYPDhgqWKpvv9jO5aZR8YEv3z
         r+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477300; x=1787082100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkK4tJYYSj6QU0e1X/gFABkW3/7FsgEMEDSeVBG3MsM=;
        b=Vg6PRrTgOQfZ+PpX9wLC9/AgAbSwhNTOrc9wTEXjlP7TRmG4RtE42rf4sH1wAYL5z3
         RYsFduXFkdmqIPTG0v1EvornJAYB40IcPDZqR4BHl/h69L9PI6mj2c9tSe89DiEhKIGE
         CfAqeQgAx/LITOnit1dIY1Yb6VQPaRGl+KZ+b2CbcB2KtaOuMCzubxFc8yAWgzHdhiEy
         +6HK7Eikbm9OIPtmkS5H+30EM7cYBSxr0aetjus1S/+buehWWYhUT1A5E4t31xDlopLe
         w3pz3Ssh3ZhfwQKrASM5BpEAvhpvabhrkdhRwgzUVsHHrR9Q0D7uZKhOdAa3z8ekcu1W
         U6hQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro71Im1aAgr3g2z8/YFSeMn9KEYj7gulO4TT3/Uzbr8aCnmr8aUTql+fe06apO4Ieq1QlfraYZPN4f/+a2O@vger.kernel.org
X-Gm-Message-State: AOJu0YxA4GJLDVzi6AtQHXDCOd0fP2gepmgoES7KcciC17nLr95VHx/P
	+ZTaZN/HXhnXNbXPuk5GLv5wsp+8jL8bDTYzab6bVcziGiNKTGS7e6GKoAiSgBhZ8qz+1OG+GsG
	ogK4CMFxLKuvyA0ouSWYJHo2q/HBzc3yhXOJMD2O2OPCPtGD7latcZ6bG6TodHpB2xCgW
X-Gm-Gg: AR+sD12L1EYHDbsxXDRUU+pDJ2Lfs1fkEjDOsggsMZ6CTzJ2CFIha5p6udrBhkKiD8p
	P7mcsWuq/+rP03S9hsVRFz0DqCbNGMRID5K3sdW0GaJKeXqbnTZu3GR0zL3zaBKS+laJ7dfe+E+
	N+GikGoMO8NSp0fyjMxsS7nZG7H7saTOa5gK81S7c7jjBfNFAIWuZKzwjQ2xuf21OGHTDliRH7H
	o9A/0ZZn+3T60es+shv8pjsYKIQm4i70hN+rLTt7CDPV0J/YkCJgDfNO/XlNrrRUY2pRx36BM4P
	U+iZnFJnrvsRzxrEGaKxri9c6XGoIG/k6oxZQ6h8WNNisAx5oWMmI0jaYCaxq3+t+3WABnLpb3t
	oEE+yLU5vP7g=
X-Received: by 2002:a05:622a:c9:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d600af02bmr27896211cf.9.1786477299834;
        Tue, 11 Aug 2026 12:41:39 -0700 (PDT)
X-Received: by 2002:a05:622a:c9:b0:51c:20:aea7 with SMTP id d75a77b69052e-52d600af02bmr27895711cf.9.1786477299290;
        Tue, 11 Aug 2026 12:41:39 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5cd2esm727592f8f.26.2026.08.11.12.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:41:37 -0700 (PDT)
Date: Tue, 11 Aug 2026 22:41:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs
 for ADSP
Message-ID: <4czzc3etf4f6sfc57s63qu7w6behkpdbdfrckbpycjulbisibp@ved4wbbsbnh4>
References: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
X-Proofpoint-GUID: 0OuU1rfcjkf-NdXRXIBIc-bfhKDsrTre
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7b7af8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Jh7XC-2lXPCOKyvfmuYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 0OuU1rfcjkf-NdXRXIBIc-bfhKDsrTre
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE2NSBTYWx0ZWRfX76iuf0WdMnt5
 oTkvJsN6slRw0ImCiHd5iUC6ntE5P/f7tKJiHwmUHWyhaQIVsma20igwY5fYiA5b6v6DSsW3QeT
 PqvmiAc8Fz2XslZklFME9P6AMOg2PLDqhIS4d9FLxtBSykuo3ExQi35W6O0up5S7Z5QQmaZ/GYw
 zc9c8bqMp90Eap48q4ji0FqZuhLipe4/r7Lz+cEtMMjOEfAh9tVm0y0dMJqb9+Wp+DXGXw49QU2
 5gT3/Kif6lYZ/ilIiSxjOVyF5B9jE20hMorFIx6pqKyq2qgvo7lxKNm2jLPkl8f0Z1r/Edlhvp6
 9gJkixz/sFYA1UX5mUSXxIMpJK2sO4MkoSju3+csaw6pTToQ7f5yrPawr9Sef1PU5arf+UzjVna
 9Iwege1Dp6j2/CTn/E75It9VjJHfWOLcQsuI8q7EeUAlUsDzIFr5Z1xIgu62EvgemZiiqP38UXJ
 8v6mvoeFiOVDv3HqYBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE2NSBTYWx0ZWRfXxd6SshmReBwa
 FcGhz9IZpthR+/Wchdwx4KHULzeoO7DKQiDa7SdGMQwqYMVqhNtwd8tDtZD/BJLqdULqCjxYPq8
 zgGAT6V28J6AuxVPP1KQSeMU0WXMBB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110165

On 26-08-11 22:14:59, Iranna Mundaganur wrote:
> From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> 
> Add the missing SIDs for the LPASS eNPU masters to the ADSP
> iommus list. These masters are exercised during audio record
> use cases where Environmental Acoustic Intelligence (EAI)
> models run on the eNPUs.
> 
> Currently all transactions from these eNPU masters will result
> in global faults; fix them by adding the additional SIDs.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
> Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
> Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
