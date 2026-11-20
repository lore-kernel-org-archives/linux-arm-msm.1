Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170431;
	b=mHcjy0G7gCfsCQbfGgLNsThRJgUQjAXO78f63q+wRGm6mI7hhvyLwinGBRDuKwznexXd
	 vbgP2lahkH8bz1aUsc8TGwHfbcqeeHibhxdWYFBkOwug8HKbwzSfq9ih1iz+UzAMz6IOg
	 MONireacFaBOvFNZ7mqNR6ka4iKjZ5Qj1CzNAJjzQ57YkbJ5P/u2LfwpFwxS/QH3GS3lq
	 sGW2GzncN/KziItOTT6hyy+glyAnlur1N3O5e875OxIs5nhRkaGli6EW4OkC26b6StsYu
	 DqmyIAD6RCx9wYbihAq9Cbz+YSYY9hy+PwpwvW6ywhOcT5fPPdAW7yhqZ2TAHV+xGbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
	b=g0RJ15+IdmK9WCTDUqTekQz1gzmpJwoJlTx6nZDf4cbossV/LTc4HWJ3x3JaPyiXXmIZ
	 BQn0NinNAvlkmhQ7WGEj/1DdEICRoo97IKwwh3hyBCVmM9XaF7aKHb/eN63ML2qMjFMp/
	 Tj1sFivLVBOlIfypZFiifxw+fJf05nqBVdgd1YuHcrT9pMozvK8yNo/S4ihGGrIPe8Dyp
	 YsmCBSs+4PtLcwKDRF0q5Vn+QMO3TWCw0/S4SujxaFpudD24+leqQThNDEFcW5ocKiX3p
	 gQY9Mp+fcq/FHn/vTPRk6XO8jRNWe5hofpSE8Dlh+X0sj0c21y9S+yVJ5aldRTzLwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UCMsjjL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67D606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A67D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCMsjjL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7epLa144410
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TDi4z+Ry6J5IfKVSHZnQfjVS
	JF3Eiv71kFCtVQwFZH8=; b=UCMsjjL/gYj1YrSdI3mPgoWUFkroEwEenVvkoLXV
	PD94DQq8IzopQvJZfDxnY0WgkkSJ802KdnU64vveupJkHK94Vza9+P9sJlnMq0zJ
	udeo4Qy322jsgEcxOr9jUP9zBHUU3vN2NN79Cx6C9KJkLFTAGoQtyeLNM4nRaM1+
	azSHW6pr5RYxLmsWaQZ4wEAtjXWxFV8i52y0KhGij+4bI3OE8bGyv7xQ+eyMNtK2
	8gVIKnh4y8um/clEGne0POIVBK47mW2eRvG1ER2xjjbE/X2eRNrZBCmM0iTd0AAY
	XGXjSNTZeLfL2VeXgd6+f8pVHNnk8E5nRDeOgF4L/l2l2A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh9dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso912235eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170430; x=1795775230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=b4NsjePqA8nFOVCsLyIf6NVtNyyBD1S9Iduf/zsHvj9VpxcK/yxRxeSbtrbF5tn6qu
         qXtQjt/e/DeeblQ2efRNwg0QY1+W6Aoel0N2eYiS21LB7Fk2hvnLc6apzp/kjsfJMUgb
         2hD2oaG987Y6kd/tHGpW02AT/zHGXUWzvrJJZesczBeJRvwGstmDpxpj3IKh4NPLyWSK
         dMVoJzbc5sDyLCu3BJVCU6tvnNuaTiAxOB0d3W+3oOzdPuPV0Z6rzeAvh+TckElfBcce
         JY1MKaIUrPnHCALqbX5bUzaf4dehpK4yAC0Jmapvz7Ts14IlCSSAaC1a/QG12b93sZkB
         xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170430; x=1795775230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=cYDK/bWk9l9iEmeMgK3zyOaIE5PFvN92iMz+J3FKlPCL+164mBG3YOhc2LYgW+qvXL
         9Bhhsk3+Yv921VXcWtC25RxGjbLi7QFhSQK4xchHvpAOCvYkGaWg+XaSPMT+pAIyaGbx
         j1HQ8FnhOHTVf/Ynkh2zIRinmPC5aPGntG2uX52KV6EmyfsEf1UYDh6KVuYhRIO6yqUi
         7CJ1BSIhxT2Es16M5aaGcXAg6GzEOqhV/xocvS3Ull1rZsRk9ItLko88oyu4eC9UcFkG
         FTrfqcZHYhcZC+amKOX+Q6OmEnPMc/cXpIM2gDY98SituwsULJYDf6W3xUJv2IyGAR2w
         GSMw==
X-Forwarded-Encrypted: i=1; AL+hErFf2wpi1pzYsJD11MsiQTBGshJqRczq7V9GOy4D6Or+y5ahLY1gP52ov2CCsNY90zHysq25ZFyxEST5q3hJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/HeaLMBtXfCFifedCbUVBWRIBvFYte3Iwb/jZtZGo7mb6XDCaa
	EgucwIRrPWFw8op69B6Q4hXk/DjXcNbc5ZEuFxn/kTkhqeNJjtzrWnBiHLRxhV8IxrdZurhgGxA
	5G8krmGXzonmkC49FI7EDasDkJMWEcpGSAV8InuDdfUxRSJ/NavRu7sibKhdn8sjBsWnV
X-Gm-Gg: AZFdTZc1tuClpbA3PneYFqC2jCIV4X6MLgCaSK5pZ3CtvOuUJkcy7JBUw9gqClXE7EY
	LdDfJy13L1QjsqMJD76tZnTfrHg+BUXQ9M2e3Wb3plh9QqsiVeFYLdr3+82jZoKxt1aX3iRVOUM
	x5eE0v9MZwG6Xr3rpQKV1pnpCGFDWCNrQRv/RtAlVBHDuJW8qRLENzXwmz8GRFlXeW9G+r2MZgR
	o1/mybTXIK2mGBqAN3Rvkjcd1Lfxj3v8SWizqDeA+fuCf6G1eCVQ+cmAFo6e2Mf+dJSgu1D3EfJ
	4tCLYMuuL082TE3YJsI07IzcI+FZ0kgQ4gD9woCVAaPnMQWOxrEQVZFg6V265ePYkqlWOmMuCoZ
	0aA1eqysfuh8fE033lxgKM1vZPqHmcDq5s8KdYLhDI2xGOokvPLct8DhyU2L9evZc0g4rkAjXlR
	E3
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543230eec.4.1795170429481;
        Fri, 20 Nov 2026 02:27:09 -0800 (PST)
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543199eec.4.1795170428857;
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm6982026eec.6.2026.11.20.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Date: Fri, 20 Nov 2026 15:56:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261120102659.gaylk2rqi63vmq66@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
 <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
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
In-Reply-To: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXysD/Fkcvmo52
 Qd8WTiplaVKBooWImqKcG52AXhabD0Jq5hJCMOvNpfD3m8vuQdJgckKcnTzebVi7gR0zftgmKIf
 vecBLSDTg3SrYMOQVzfIjZqNjNLrY1ah6LeS/wqJImvi402iym8XcLR+WlpbHRVAUbOdUMY5x0L
 0LPNyDCq6nGSeoMy8r4BoY3Ph9DPR+vDHgsDOgjttbVaKR7/D8QAF2n5hLAQc6UhOUSQ8JwVYuf
 rroOHEU2szL8T2ETBZoSwgxBqZL+bFhfOewzs6RzyqyNdaR2y3mqNhq88lC241b1ns8wLUCOHDr
 I3ZmALIut8he0I05zOZ/MiSJrDUTjcTqeTXUBl3ReGSqIc6ya779jXrgZC0xgunYn51jFVp0UpY
 rfGXYv1Mc7TULXbg7A33Gl6UZASSy5ThdhGBbQATP/u9hCkf+nFwCh6v6Sy3ZoInIDOoC3AkzAU
 DjdTkESk7lycEVuQ58w==
X-Proofpoint-GUID: Mx9n6hJHq0ylXOdSX23VGluLesohJBto
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b00207e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=a3soqENLMLS3xwJGqFMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Mx9n6hJHq0ylXOdSX23VGluLesohJBto
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX5ek7qxH8J0vt
 zVTuO2Nq6Aloy8DJlYFvjquYmlhsrnO6c4j1yghS7i8VnFl7Dkbt0Kgq9Tpm8nVdGkW/kRUbzBf
 hOvSsGbnBOcEo2z0Pzi3IzePvE0+d9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On Fri, Nov 20, 2026 at 03:06:50PM +0530, Vishnu Santhosh wrote:
> 
> On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> > On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> > > On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > > > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > > > The RPM message RAM is shared with other subsystems, and parts of it
> > > > > are not accessible to the APSS. It is expected to be mapped as Device
> > > > > memory.
> > > > > 
> > > > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > > > speculative reads into the protected parts and results in XPU
> > > > > violations.
> > > > > 
> > > > > Add no-memory-wc so the region is mapped as Device memory.
> > > > > 
> > > > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > > Why only for Shikra ?
> > > This XPU violation was seen only on Shikra, and only with Linux
> > > running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> > > EL1 under Gunyah. So, I kept the change to Shikra.
> > Thats not explained in this commit, why this issue not seen under
> > Gunyah ?
> 
> Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
> memory at stage-2. The stricter stage-2 type applies, so the
> write-combined mapping from the SRAM driver has no effect.
> 
> With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
> write-combined mapping takes effect and speculative reads reach the
> protected regions.
> 
> The region is expected to be mapped non-write-combined regardless of
> the exception level, so I kept the commit message to that. I can add
> the EL2 detail in v2 if you prefer.


Thank you! Please add this in the commit text. Also, I think this is
applicable to all such Qcom SoCs.

> 
> Vishnu
> 
> > 
> > 

-- 
-Mukesh Ojha
