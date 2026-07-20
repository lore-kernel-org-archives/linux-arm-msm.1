Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF37449B06
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584738; cv=none; b=f068WZEI+jl/sK2WBJdlrqUvV2pE0N7+94alDt35KPcL4pR89nLCZVlo2Yu+jwvSTYXtiuOE7Frs3vym8TLFw8SGRD6tv2a98nzlJnD+rTyawBqk1UX4uRJrUa2NvX5GbvO9DKARxNmAi58nfJB2OmzECBnoz6ahB6uR4QA93ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584738; c=relaxed/simple;
	bh=nnXMRDXG+C6GKw5pZ/mSE9jdYqsRmUdUtldszivo8YY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdRn2YERLMjuyXvPxGtU1V/HupFIocbkgFIsIrYLZEse/LhVzXlHTrRm2CEjF9GOHxH7JZg9EjMU7z3SCZfN+dqQ18ZF94+3n1O+BgalbvwWAdoYSI2IonW3RT17ZVGqDBR/FmEDA9VE/rQZPGxdRcFfjwX3ZjEOlaVr/Yw30eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOv8NYKa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gzt6UnTk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOv8NYKa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gzt6UnTk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJUGk93639309
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XXSQ55rES2MHDQrNC+JjspNL
	EwkMWvyc7txH2rTHa+0=; b=mOv8NYKamXigJAGFQTRQFCGruV/1BWUqWg1TbvZr
	68o/e7Ab9mD5E5yBF0sVPrFrl6unEiRf71iBUOxgiDfE8UflVp5gZM6zGVU8scYo
	3NOH+H2De7uraCbkGq/ussh6WSr6G9CQdakPgX97rRUEaABsA1DLYR3eylgaX2bj
	eQLBfVNK7O55wWgeXz1HdXgd4COJWqGOcZAMrzRFXQKcPojYjv2Hp2H56a4wvw5F
	/KeszZfRyBDVezS64V/OYbzk7rCj62Rxj5yV9/+6grhBpLtW8YGvp39YsAopsfiy
	1hkuQcanpufOyywf7R17imRh+P3JF6hfSxDLWN49hyL1lA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyu1eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:58:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so137846731cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784584735; x=1785189535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XXSQ55rES2MHDQrNC+JjspNLEwkMWvyc7txH2rTHa+0=;
        b=Gzt6UnTkoaT7Xduy9w51TZ45smyqI7Dm2Xo1U2vWpG8fjGOoPR0RRfgqRC7PiJJeut
         K4NbSjjNVSmt8OBUn6rnm1LMYwHG1+bYbOS6NDPZGGBt/B8m0laDxojA9hbb7PBoTjYJ
         lPE9hH2l6YGnU9nTXRLtADlMSGBxVROcKgrpLQySm/ApeFilG3kjkxFE2pu1PchrUkJD
         IS0jA12dK8rOjEVxvgjsDtjZt0YwwfLeUZ6H6MzxkEiVjCa059P82+5zIu9qK1/6+8VF
         K10Q4PkAzxDmNmF0/nmvdYaTxOCED/8FZRuOsDGq12GstPMiH1gZi9J8iKFFBWhgPSas
         FFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584735; x=1785189535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXSQ55rES2MHDQrNC+JjspNLEwkMWvyc7txH2rTHa+0=;
        b=OG+P7gjN0Y47w4FyjAUEP19cO/8ukHJQL1QKN3Z5S/yR1I3yn8bQmPR4aKvZIt/Mad
         25sAhMC3eGseDwbhoq3fHdMrYlbWYUR/1fJiexeP6+oRmcej5qk/R71i+2DilIBS93y0
         c2M2s9IYaDkJnOrvtx4wkJnmMdEJQfPV8TNEoOppHuUwInV8UDEGbGu6z/JNbi2ie9uW
         W/qD3xEOIlOKecMs+tWayKzsaJ587C8Edz8fix6Dj/vBy6c5GmlRRvquOVs5G7Q4+XiK
         Daren9jPmxPrDRGeSx0m3/hWPAGmGcq2KuDYf0SDtztKHTSSmU8ZLQ90ll55GMBvCzJ5
         eNPg==
X-Forwarded-Encrypted: i=1; AHgh+RqawjpUDA5Y85kzldSFe+Ab9yQmlAhjGBygCedbPEztSiQsdOPK0FP3tObqCzzo6qrftorhGnY2wdSkPXmy@vger.kernel.org
X-Gm-Message-State: AOJu0YypQpzhBfftRkgMeVX363kV+xUOudDgfNJG/T9D8bxx/c0T4OFP
	bAUs7aXiAzRtFl3PjN6EBU5gLcT2XKSjNr7GTwGsVk7mxOuvQxgJ70BMtQHnXZG6aBk2Tt28a9V
	YHscy3NT0p2yNh+b6y/ZhdPBcljVjieh+mPQzCaF4I/WBXZbhaJRbP+qMr2NXkPz0desK
X-Gm-Gg: AfdE7clhqNhyiJVpZvf0O1zSZnPy6cjigJREQ1fflGMr2sA9dMgVGqdAxSNgtw2ECC7
	tkx6I4zEVjVapeutyWl0GH0YachFEFiOz5VB/1HHpRql7qWamv1x8DTAu6EgSGN1MIGzfJeMDfG
	muahhTIidmPZ5sKL3Xz5dxGg8mK3xmlh02OSdIK4qQ0/ekLC8RHF5qmVOa9EgqjnEO+2JINC6ur
	V+5i9M+YQDsiEdeOjO3y9ZSJBxJuevRrh5j6NyLMPa7xOnET3+0ofk54SLyWZkU+knEOH+rciie
	pzQ44dYUgn4kR3MlpNdjLx5UEeXfXcV3Ro7OqbWalxZhxpsq3LQjffvbBW9vsKNPHt1Sf3p5KhV
	R0Ao9CG0xtG8fZwzveZp1+iA4ENhmrlK7HLO4BB9UukWphFnaKXHqvif2tNKOrt8GoiH4hjSPQy
	A5o+rE9psFZzqaSQ==
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr143559671cf.78.1784584734761;
        Mon, 20 Jul 2026 14:58:54 -0700 (PDT)
X-Received: by 2002:ac8:59d2:0:b0:51c:7b12:5ff2 with SMTP id d75a77b69052e-5213d7a6561mr143559311cf.78.1784584733924;
        Mon, 20 Jul 2026 14:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e245e5sm2554800e87.71.2026.07.20.14.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:58:52 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:58:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Message-ID: <ddvifgm7kbklhypg4wr3wne4d7xobdnxgkv53x7kgjg637ntfj@7vpovixvmz32>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX76bsBerg+zay
 dqPWe19tFCx2XTEAOJVHbfINLc2xfzfWguZAueM1cLuNwwqktx3nfQI3IRbXxTKx3cU9rl3lmUl
 mWSDT+j1GfVvIPsNZDcj03rOTKoYgeU=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5e9a1f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4_LmeBUvQ-T7zM7h5YkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 6ezF5FtuSCB0J7MGEsSuBi2kURPhravr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX1orGgBr8Vqn3
 bWiV/EloulGn4A0SuGC8cWqXBYxG68IVBPtJuEIt9C5FSXq8Gw41Sxr1ATzMwi/pwh1wMCevAIF
 oP53DuwtahEEbA9rniZfpJBlyD9n0dKahh0iUioLbKsawqJ1QJspuaZcdUvWtLHvaVLQ5dvCbPR
 GrVA+Gg4u81M8t7fA8Tr/IbpToBbrP+znGlexq8LjZFfbVzjRH9tMyw/noXI8Vxat0lFG7Bahgs
 xhIVHtG8CyRZ7sr8bQadBZhFLzKLgq3rnZKr8M8ozAWiLoKPjgzg0+m2ycSOpdz+lgsPbBWZlcP
 Xyv48cqg+WE/h/DCV0N8TZR9z5HMVnhH+WmPK3LeQtLjyoEdHCBBa4QH5zV3BugEKbAV4gFUAC9
 9bCmoIr9TY1mmqB/zoLh2AALOCnVCT+M/XVcqYmGYtlQkUu/OurC2BHxm6c54maK0L9L95ibkQG
 fvhM7I5qWs56PjFHZ3w==
X-Proofpoint-GUID: 6ezF5FtuSCB0J7MGEsSuBi2kURPhravr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200237

On Sat, Jul 18, 2026 at 05:06:24AM -0700, Gopikrishna Garmidi wrote:
> Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
> efivars.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
