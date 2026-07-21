Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482044AB8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669460; cv=none; b=ECk4LZ3Ix4b5A2lcyNs6GKLTjpmRFjSVt/CWrCMiML6nljESh5TLwxdJ4eL1e2h3xNl94+/CZ57a7d1FYj+e39ztcPWYOzulGingk7JoZfKnuInawYQL/LRastBZkF1x8E83F/t6xXWoSYvYLgKPhBBwQCruEKFQzJ3YvPhY4bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669460; c=relaxed/simple;
	bh=iEfQyzDsdwDMUaShVucVlvmfkTYaRId7jK4LJS5wzNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snZMZVJBf7FKd+ChLB/89OrzYw6/6tfUECfk+qebLG87WL0JC4NzJPh7lJr9O92OFltXusWCktsVKS1E4jLASo3aM01dry9wsi6J1M7ki3OEXz6EPZHKQjfBWLjPPm4GcXhgVmBxyAO5QZHk9In8qnpIjqRtlxZqt9gtSULI9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUrP2wTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2iXIqrI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUrP2wTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2iXIqrI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlMlE2580231
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9PsGSpmXGAAZvBvyRNRBkErt
	fA6hYtUBGdoeWKOFN2c=; b=NUrP2wTVYSeIGwYQacw7gON7c9oFYDOPJ2Gd8xrB
	Ml+PoPrY4roX+w2iJCaMv5z3GO9h7aw9KWph8BgxPUfooO+OJ8sHGvYXI9qW29Xp
	UMFibcdn/NI0PYpryQWLcuM8QlUcpsSsXOkY6eU6auRIONnOJxDtTIQoU3Yc0xvG
	35FvO8rnD9fK3Yz8v5AWc2r0SKBy2jUK6FEBMva1tvXv6d8uQvIeecbouteSR01D
	+Aq98tjO8SxafHd0HpKo4hA2/6h9o79E4h/IZhXjj6cRtAWulD0At9zrGsLzMt6h
	+RR7UR/WvfC9CHM7AGTcX9r8xfySqf1CsJL6RrvBa++9qA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e0xmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:30:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so135439701cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669457; x=1785274257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PsGSpmXGAAZvBvyRNRBkErtfA6hYtUBGdoeWKOFN2c=;
        b=e2iXIqrIwNkzDA1BCA4eZoB3oo5nENfLBwqphS+XrS3YcJij+R/5FRvUK+IcF9HHbj
         MiI42skGyRyTpoPbNIm329AbHTcn7LkdwQaJUZL7IKW3baFV2+YHvM5XAxImWexHi/Sd
         +6pU7Wo9gMWLrvsgACsWuzZJEgz0dMBAiLS1mPfVVWDovozgDjxBbN58SKW0dilhwuxC
         NmAXF7c3nRi1EqjNlly5AEXYdzuNlM6Py9tXVSxDJwvNkiRePjmnFVQ9R3qhvgw6VW4y
         Rw/P12VTdux/ouNJYtHu9OyilVwVr8qCGYVPqXbnedF0RvynujJ/QNaDb+9HI6JU50+I
         DRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669457; x=1785274257;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PsGSpmXGAAZvBvyRNRBkErtfA6hYtUBGdoeWKOFN2c=;
        b=aGC88Q83HTfPRVBgOobCaiWChv38sLu7+FFxCf/jMzHFh/YXZxTGe51bt5qmBNbiVy
         6BvrzTD3zGuL6K6cv/rqyxAC75SEbs/UyMmCVvDt4EQj5Aw7eeQtYEG0bgQBoH4bDeMO
         NMX8I7zerG3i9FfxBEjyfEdUjB1aabveLW5eA/fIe6xTsU5MOH+kF7VfMcHlNHet0to6
         AK9dygH5tkQ5uWNz4OrGp9+TeH8BjGrdi4PQMIZcPryMZkdNstQPGDAb+8bNMm71Lgd+
         L2Ey1m1QJP3XEDEw8h7xPGlD9Qx/Od5ekM4yXgqIqo/WwSxXbFguabv2Y1CXEVdSs9j7
         0+Mg==
X-Forwarded-Encrypted: i=1; AHgh+RonpVUhgLOzNaHLyjxRvARAw3F/8HU2Y2cNfv1ANluiu+Gm5oTR9AXna5gyJqZRFjHCzAzz/kgXCdB0aNK6@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2u6ATjdCU4LT7fQP+UXAxUfy/UDvDf6Wf9gMoHfGziWjBkH1w
	2YPLB7k4SVBiZEJMZGzryBY0LaB7Gx+17g5mByFJsJkPCx84+1bEbkD/S11WG778da/Cv59wmkJ
	mnI2beljifn5sBEn8+6PjG1z0e0tC12/TWOMtFwjId1LIC1cgsauwrfgedmPom/0wSR8RWzj6Lu
	8n
X-Gm-Gg: AfdE7cm3HN/4DqyeEQuWqg4KFXSrTdoEDuEMMyZenKbfPq5EvTj59gxjn049eBfRA9k
	CZOhrunso+6Zgo8lAILRlpQ2+7YU2a3607NucNxpkcyunOmXj6PKtr0OzB1sfAq4Uzt4j/4bJit
	HKlVlHfGjhkn/rYAvABrfAXqrfhLnE0YpAWo+K8csmZPvx8QTSQ7LeiKNEyWbafske+Vs80l16a
	ScVzAn0j1wjI6xP4jbvHANlLtW2U+SA3J03N6kjW947jds5NaTuD2SZQvXAm6VNJduJXXmEV8z7
	XGQK1ZfAkNmqus8k/CDnrRnRCNbQaGa8Zy9xrsIj0uhofBqhwje7xR/Zv5gbkkfnRRzreU2zq38
	ZfOCHytbFVhnPd5kREY7mccJJW3/wgRu3p5WIZ61Ej9P5+fMT4JerK9usOXu9V3Q/lelYGtdgu4
	2i+cSNfBIXYgWGcQ==
X-Received: by 2002:a05:622a:1cc4:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-5213cdcc8dbmr198082381cf.64.1784669457190;
        Tue, 21 Jul 2026 14:30:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51c:9c2:99f4 with SMTP id d75a77b69052e-5213cdcc8dbmr198082021cf.64.1784669456736;
        Tue, 21 Jul 2026 14:30:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4353csm117321e87.57.2026.07.21.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:30:54 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:30:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on the Glymur QCB
Message-ID: <v4oqlsfuke5rlhzkwdlz3vovpudzice44jhyosur4lyz66myn2@ldcw3qz72qlz>
References: <20260717-glymur-qcb-v1-0-aaf1cff84aab@oss.qualcomm.com>
 <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-glymur-qcb-v1-3-aaf1cff84aab@oss.qualcomm.com>
X-Proofpoint-GUID: anmxA1IKRHmijcDMHLF0LbfUMoed6KTu
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a5fe512 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=IXoLagY9VYqCqr7K_xUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: anmxA1IKRHmijcDMHLF0LbfUMoed6KTu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfXz67NB2Dd/98c
 gbe6TBJ30pH7VqALgbixPcOigQQqmNW3N44Snj/tDIT09XtkUDhUH+X0BNpJZWkwP/lyoXWGwOh
 QLv1Dg2Xlcy/GjzrQtZ3nuA5aDhEe2cfh2ZZQHKVbGgi/FE4AEzDV+PyNiC8JKp+XSnpxolAL9o
 Laqh8VPl10Nf4loDu6mIcW/B6iwN0PnRiBS1lDMWWfKWvNYBNzEOkaEVSER2fC7uLtyxw1a6Ool
 qngwZzp8T52Cox3bzLpRFDcNwg2bNcEwiT2KU3/jpLjOag+evIMFs5S+YY1E6mTQTvLfgqRXkyu
 +tF5HxSLfjiO/1g4Io3M1UIqEiH7ViUfdV0YLiArQhysqzAsxQEmv+KzoAlu/l9ntxmti+cfdQL
 quyjur+kpyUzA1UGHw12llIHF1BmeZmgJebB4pRgan0Hc7AAu0cndImKwMBO+hrJs0Bl8TWIany
 NdA7uKA53fjlD+erXMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyMyBTYWx0ZWRfXwIMO7Qf/qIs4
 cfSGiWDUP69FeGHtwADwGWRghifmVv2rpNosRXfthRba0tpeCwMI/ZvPP6DWgyftknBYMCzj0CE
 SJ6xR9XqiCMfXU9IYmtYF55DrTSoyUw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210223

On Fri, Jul 17, 2026 at 04:54:11AM -0700, Gopikrishna Garmidi wrote:
> Add Glymur QCB board to the QSEECOM allowlist for enabling access to
> efivars and uefi bootloader.
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
