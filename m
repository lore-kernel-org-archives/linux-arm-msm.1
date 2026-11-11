Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406776;
	b=YAx1jGXaZ84+8rlG4tgDpJ2WSlYBq4DSehnUGA9yzs/nvoIzWkejp3Yu9oCNFVP1W1Gt
	 vblOcEt5wtEbZONX6Umj5kfbSbj1HeRC1jxP5h9vdRQBj26RRgO2KYAEa2b7jGfzhgr7r
	 +3iH3mPTIdA3Hnj4w+869DzIEvUsLBOn9pTIO3u8kqkAINum/VTdvbuWIeVm/h7jkH0hY
	 rPc3DAMp5/UT6vSF7GTCDm74w+XHKBgtlYgP3OWEPWt3z0IcuaGV0mMcj1CdzAcHQtxx3
	 KD0xuSMdPElkHCOUVgWqEGvFykmS3ZXlm78vjVrDGKS4StYxJS4Pbh5EtBES6rzZyFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nOnU/JaZv3F/cfJFlj7avMW/ikyx59lmzo0NaR/gsxc=;
	b=qq0avgkvSm4B038Ot16BlM9uvJVBMoKUpTJr4mlfkwz/FSq/JYNJwp3g2+iWSg1aC8WJ
	 u/dbi2iWj4BfccTMsfotektKu6GAEqh53gO3VntHwE/bfWNiAzdXsvm9MSt3N2YAx3ytU
	 /ykRAO4Tb9XPI8aaFyi8+YWkpJr1/ZBnd8lXEvIZCMfZPhJ2N5Aa99CECP4qX7e2eXaDQ
	 u0Ova+gckVr5cpwqrz1+TA2tutEqfp/m3ATCO1YF5Q7Mn3ieYD0+Gc+RChDjhTWoB4RTl
	 TBA82omsniHZ/NIjwpXgwEOskbwKmNQxeWy3G6qC152cl6HDPUYMh/MKuANYDwh5opA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EmeCcw/a";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFMRxIr3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BA606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 990BA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EmeCcw/a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VFMRxIr3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHeaw2501563
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nOnU/JaZv3F/cfJFlj7avMW/
	ikyx59lmzo0NaR/gsxc=; b=EmeCcw/aaC0JQj/Icd+SAeBRg/zEfP/P7Ps90xtJ
	zSD3/3FxQDZFeg52g1NGdcKLl1co7yaApS9/kmRLE8yAQeRR7SqhjV0NB/lfsdov
	O6Y5xYHUrs2QVPJOgb8eLFDApyWw+lEhFuQDd/XCPheUhnQ09AUENHDy5m5x4GFv
	4W4HFQaTzn6OIegmyLp6DW7efubUMl+6duA9r2QzhR0b+NaRLtgTwnRlzYzSvvbO
	BHIcxekW0iFOxVlI8Qok/8mD3hTqqqS+DfCw6yN4Qi+ObznJV493DnPamp8mX8RY
	/+uRB5kmUulFUwNJ7Nq55DdQNltxhcchduwjpuT6GG0/+w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm9h7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:19:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c6c1e082bso52444926d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794406774; x=1795011574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOnU/JaZv3F/cfJFlj7avMW/ikyx59lmzo0NaR/gsxc=;
        b=VFMRxIr3V1IJhtkABjJp2YmsMMCIlDJT8V4r5ZRI+TxQ9mSj8Z4W7MBjUU6VrvCfP0
         1ceQ3/eLVzKj/0lYpIzPZ5q+zFMsRKiZWz4BxM5miWgYySSTFlHHz2GGWxaWBMDebHt4
         3OKqdvHeQ2ebCEfYCflYMMiHxkHlp4Ajs9rpjuB3nF9O0nNEnq6Jr+SQWupqIuflarcs
         Q+GaQnL+o/KTQZ98K988d1SOtXYB1RHLQSyqbWHT3BhAp7WUxFpqIhA1vA1t5PUsB96L
         WafMegrA3w+Mg8C4IOyAUUDRe51P0iPhhuJcj67C/ItNDPNOGA5eLYTNmh040iM8Dlab
         jozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406774; x=1795011574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOnU/JaZv3F/cfJFlj7avMW/ikyx59lmzo0NaR/gsxc=;
        b=mqZCrexxb2crC4c5I1n74nvlXMi+HQNRw5Ux1B3/RkIjRDMeCGIQkQ52Fm9Y94lWun
         0Tr0hGDa7E4Q8GScBeWKdDZ1OAayqjVJzaqUMy4FV8gR5GC8EgqyyBYickQAceLm8Hs9
         X3O4nVeFt0Y44XvdXpJ7TTgnT0VCfSgLmaKjZv7704ggR5S2yHatHtG2PRbKimqqTrNx
         Fzr1J6814abIwP/SXwhToHk+SiUpMDmMgoWs/jQQQslleC/MYbbh20JN+PxerCPKElnv
         f8+USVvmAjUNvOAQ1STDjySr78IZ6FMZSTmq/Ja1iO42rxs6kiQ8Sz9Z+9G9Waf8xP8Y
         fmdw==
X-Gm-Message-State: APuU4Z/Ggtt446KeexNq6N/AI3UyOYPod5p1UmxNMNKDpa/5Y73mZsvX
	SQ2b+DHRmLgmfgT99hMXHIyemgPNANIpqXaAnTYRXz8Vjxb9WFgvjnUzZckjN1wv3KSYSBdJw1v
	ilK3/b98G4LoxFasdMfRYAl+v/3ymcgqmWX1dy4v5YnfhUhwl18gVyg1mFamGIByUGzTv
X-Gm-Gg: AYBFou0eT73mRhQY/Dube7P+YGkSEhUN0NoSFlL7MHalkehEWaU7j+cN4SBrXUduty8
	kaAUTmRuWQNBjKMlEu/GzAT7RNzkSTAPCd+SghKTGVaXJBJGybusNb1i+7Ujo4h2UITfFWdPpjK
	cerv7f106D/T7VO5kbsokILGtoRu/soXiHUGf/Ptmh3sFg7sd0dmDK4wJW0HCn1MPjFkSivXc59
	iYwqDybvIOta7HzNmPFIcTZedsI8tegVlSdiHb36OrN3pSK0ZLyZ6BulG+zE6OnoRVlVDXl6jxN
	hBSrKTRG+r1VjHIHjYyA/9nyY+vqU1txZeV8JUT/JymkVuiSGaJ4E4y0WbRhtGT+i0eZty41Jnt
	9O6qGBJrVlQeWOfAWXiVm3c6xpd+S3MBxvlX1EWKgxqlstQlvaUzVqoTwznSGjU8SvM0fpb9uRv
	kRde5nFGhv3Z3492OaWWUziyNw5fG1S1ljTleUawaFELgVxQCRusREXFDWVTnClA==
X-Received: by 2002:a05:620a:2905:b0:944:2057:a091 with SMTP id af79cd13be357-947ae8caf6bmr430182085a.40.1794406773817;
        Wed, 11 Nov 2026 06:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:2905:b0:944:2057:a091 with SMTP id af79cd13be357-947ae8caf6bmr430177385a.40.1794406773303;
        Wed, 11 Nov 2026 06:19:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb1476sm955304e87.60.2026.11.11.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:19:32 -0800 (PST)
Date: Wed, 11 Nov 2026 16:19:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] drm/msm/mdss: reset all block resets described in
 DT
Message-ID: <awb7bslhrhemsgvu7ubaejvurk6fecotgvqlwtvsoe2benqdgq@tvh2sfjbuzyu>
References: <20261102055026.438521-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261102055026.438521-3-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261102055026.438521-3-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-GUID: JoxCZXkpxaj0nilS55MGNn9QS1_Su6ce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX/Z36CuNSlX/i
 fq321WRvsyvQQQ4M++LPoFuq4Db+fK9eseE9/nNbddjTt86p88NaFCoRuATtx4v/9gL9LfF3TVe
 nDgFrIy9at4ASW9RiA2prV9DedakYmCkXAg0xU6wmNEiRWPbdxdrC823O+mjuWK0C+R6U8o9WHy
 p6w5RpPZzRleEZb8who2awcivQxHtRu6Rxmm+5n6Nin5qaXf/iPK/L3QLtxrX/2msO7MIADqmy0
 Syjcd9yGQZmMwcoMha2U/MUYZbeNha0b+gvpfEJiLFBD2xPd3AuBmMXtoWfQs04HvFqjr6gkSpA
 xkeaHlSon3N4c4E4v69bBlYPdHNlUeUCaC7Q3iNiPgZPqxi9bjx87tQ9IWgukkPRMffJi3YhVfo
 jkBpWFp5553ufGeOl56CknO9PP4zEBUor9JeXe6ltDng7vWXdHtRfAkHFY44U7CM8xU4mbljgg4
 G3pl1CWU4Cxr+YwOLCg==
X-Proofpoint-ORIG-GUID: JoxCZXkpxaj0nilS55MGNn9QS1_Su6ce
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af47976 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pMXFKWXFfIpy_3urjHkA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX3B6Y9gS086K0
 /EBl9vlBICOjnXvPvDmFDIq29/S/0F9GLQBze0jLYJXiIuKKuwB4Tzu4uVatUpDYJ3/s7YzrWJJ
 j526t8p6v0vaPUoQD5VdavndSu5Q1sk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Mon, Nov 02, 2026 at 01:50:25PM +0800, Qianhui Xu wrote:
> msm_mdss_reset() acquires only the first reset listed in the MDSS
> device node.  Platforms can describe more than one MDSS block reset: the
> SM8750 display clock controller also provides a reset for the MDSS core
> INT2 interrupt controller, which is left out of reset when the

Is it an interrupt controller?

> bootloader hands over with the display block still running.

What is the side effect of it? How was it tested?

> 
> Switch to the reset control array API so that every reset listed in the
> device node is asserted and released as one group.  Devices without a
> reset in DT are unaffected, and for devices describing a single reset
> the assert/deassert sequence is unchanged.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
