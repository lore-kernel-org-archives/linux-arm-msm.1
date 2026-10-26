Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032422;
	b=byFYce0gRP5s4F43moqJCggWnNRJilk10c4u47gXWkRbjPfp7eMTsdAJmG7PZ84MAWsi
	 lXb0NVaPz9IBv+FCeF2Bq5Jm5DpzszSN+UXrdnPNc6uUxStFl6n2HvNHMWPt6f+Dnh68y
	 IYVE1srmQxUjXyqoY6iMTz4EXeAiCALkYe2XP+1mdeQjZezR3GrhUI0+WcvQClRomQtGP
	 a1wMqp/ckqW4ic18FdFHYSonuM69nN0fI0fAuXRCihYlp6gjmZA+0URbtFJGB2/0XQP5H
	 jQIx7L2flrK7pczXJ/Ztk5yxD/wYfeibyzsRiKunUD9V1SnBpqrRZ9JgrdXSEHmNYWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
	b=mAKMjAT0LTfHs+JxCKhhyMnGkMwHwOWp/2dN8Td2ysbIaXnA4ofPi49D0SECOp0QOTNY
	 3gvP4P+WCnke6yOi9Pl8Y+suK00oevwlQGcQwUB+Ngcu85KHfjCHOlRNVAnwCf4mVeDLA
	 35YRYNT9qRHPcKgQ5rYlVePnuI7h/kG6z7sM0ouRWYrVovLWV6jzU6AwD9gdTb7Ml/nDm
	 Ca8Vku2X7v4w4TR9R24wAYxOHaOHYDzAA8O2BGmoWgOPqbczf3z/3yONOXIvLKeXLjn09
	 +5fWkJYPBxS7kYxslG8l8G3PkmaMpnP7GHOiOvtQ3ywT20CTdstiyt7QskZlrg6EtDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB58606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB58606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fwCZMlVJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dQnzDEFv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvdHx3618600
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fQGdln8uuwOHJNK5c2o0V+8
	2oadJJd56FQOhqoEA48=; b=fwCZMlVJrnzG8kbFf7KqHYafY0dAThM4IbWaFOBy
	QT3KsXlQuzRCEyQ/BP4gVJDJ4nk0L12B4ZfSaxJc9OIyfY5Vp4NrnzaA4FVfQ28v
	oWHEo5s3n7CQx9cLAq/W7oa1ZRygQwA1BRA1xNw7oOvW/dBVldrhTUzMIe0sLA4r
	yJsGXU/+WWM4Zgf4/AW8NVOUWz00bFWn57d8lA0rXGqBl6KUeEZ11CBqMWrXjswP
	M2gLip2s8RgnqzpgtOqbdQdoeglxgbNz0CL+L3vgUhMIo21tyO3i7w6g6EiIvq+p
	X6cgeXs/IvrE8D0TvIOT3JcxnUFxp0Kb5kZvXuaApycd9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xrvhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:33:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso11360485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032420; x=1793637220; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=dQnzDEFvpC53zCvxW6VsoFGqcKg028XbXBqFCVsawPd1x6315G7Uy2J2ZssBOvlmfv
         +oxSAXmA6WE9XnBjXSf7DfMCz80KheRDaufSqgMqwZ+LWOlQh0CyZeTgCWnEOUXrd0ew
         +m/hp+HhRKY4mysaWLP3c687OZCOCik9VkuBaNt7IkW3abkPcfyu4ZluZghVSux192S5
         op+p9MUT4P0GoPRoN2xn/Ed12ajdRcR/8voRdNbnkTRYwhAePaf7tv26W/f+bIE5fe+V
         TsDeZiyexe3IeeXQLrlYk+lHKNU5vHITTSt04fCnEKokveVyIEQD3maVRbJExoQHbHvC
         mnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032420; x=1793637220;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fQGdln8uuwOHJNK5c2o0V+82oadJJd56FQOhqoEA48=;
        b=IvUnp/XpT6Fxj1CmksoVyB0emzA/DCDY1SqQcfB1rC2lWRMkPqpzuvoEA4QrAriW1v
         mlLsyL4qQVW6qFtwSFzMq9xGduQcQcIpszTZE1hDLVLAUX58t9VwLMYiYlMl5hvnNGrn
         929rVQw6Jge5UYZcdnhngFCEgz87scpfO6191wbHGR1Pn+vuwU5iviUdMEm5c06Wqd1T
         Wotz/mokRxiv0ZG4XJzwaOzjGL72L3cnnRiMQ/u5BCdOMinDy8ywnZ6Dh5M/rgPWsCqf
         dhx4SvNlWhwsSC+tAbA38NW42XUFn0yGHYV9MjOZuF/t6UyYgRC1LJdTbfVeWmVZZo58
         JM7A==
X-Forwarded-Encrypted: i=1; AKwUvBx0QvTsGyV8KgvDmqDic+cT9MhDEYTWG1uHz44JUbm5lxvCaEuSdGZew3MRYidx9boKkHTl42NukAwhplC7@vger.kernel.org
X-Gm-Message-State: AFq9FYKeBG7w0JOd/W8Uwvo3tMk1zLBWm89l3lFYm0lluhFzkzlUMJ9L
	YlAbFwl2czazaHs8Zg1TYQESLcEvKBjvaTi0Aaty8TQU/Z3YYthMNyTasFAR2IJ7AWgE8oKeDZq
	rjU9lG3q4xWp/e8Ry1J6094i/K7PJiblL8K5oFzVcAllwIG6T0mCuvgOvvgxRskt42J/G
X-Gm-Gg: AYBFou2BMBxfs1ITuaij9qMVf0LfEG+bXK67REOTqcUyvkj46mhy4mmuGK94yhMTic3
	6jSiwiEQLvkPrU3DrdRZqhrNvJ0RMU2Jriab/snCw9KpiUj5SmasBkurYbMkjZFifQ3ohljICJu
	OReWlaLtIH38ZI+hi3Kp+zhRVSBOsdBBS5t2A4DJWrpSc2qVa1QYwcF8+DFQHCtUMS3upnk00AQ
	7cKnBW/iOKpT+9CBXIizUVKBD8dCwiERB4ix465djCh6/R+mLddHDKuzUseM1+xsLdiGiMynbaE
	c/1N8jUfhzwPHybJCgr56VdaC6/ZWLcSGojeCQzrxaegRSo0pcg5gT2S+BDcpF51Li5KXraLjj8
	tazYgFeoox1DY4uif
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31282585a.26.1793032420033;
        Mon, 26 Oct 2026 09:33:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:891b:90f1 with SMTP id af79cd13be357-943f4ba8037mr31278185a.26.1793032419429;
        Mon, 26 Oct 2026 09:33:39 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm16862342f8f.6.2026.10.26.09.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:33:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 18:33:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Tyler Baker <tyler.baker@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: reserve firmware carve-outs
Message-ID: <cx7qdacerxz2zi23ti522dtjssowumkbvtn7jmb7m4lhxfc4sd@p4yzdvzqrp4y>
References: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
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
In-Reply-To: <20261024-monaco-fw-carveouts-v1-1-1cd68aedf46d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7dJV1SDgcBoBXsBTbvGj1c4nopyrfXaS
X-Proofpoint-GUID: 7dJV1SDgcBoBXsBTbvGj1c4nopyrfXaS
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf80e5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2hiNXssHTY28xlfzKCsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX9TavrKAharcZ
 bnulZo6AuS9hQt6Dkj0I+o0jt39J3vnRboy1cFvvrEB4hNMngsTDkx4Cgc4pUtGr44hMiJs1QLr
 a2us5LMujC//qTFHTMxt1vZoanrcMZOkbI+QFw40+DH1um0E+mMxwwwL6F+fgoAB1DlqlHv5gf1
 fX+f35Qyo8DIOZbTeUog/bSpVKVzF8uGH6m/tKNE6V+1b/bI5hFdtNsM5ghTxPS2FMiAoSrv/VW
 msKIkJN7RoP0fHBRosBF2/TcZH9LW3/vYKP0nWFWxpNXC4vCYM8crVMN2Ur/e82bB3nZ+xtqhmD
 EL6e6CxMf5B+uaUXcfwnGfd0FTN5lU0xZV7TGnvqMa4ygTmVMkrzi06oXRUW3JDpgkus8D+DLCo
 njTwRToesJuoUTWwTqbjinYBDp5n/QDIOCawQUQnw878NWonz5lthFcNt/+XpwGguloWKsrvn+L
 P5xzWgjC3/ZQqI4uRAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfXyoQ1PpFB08Pt
 TIbs36v0azrJbuoQBnHMfTV+MS+s/lDNsIjKMPfgTEqULzwbLBxYPSOorltBKHc76hehcDMS8Cd
 N9LQ6EmdMMafss5Y+QJp3nCnRF+HkRc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260065

On 26-10-24 21:09:44, Tyler Baker wrote:
> monaco.dtsi does not reserve the DDR carve-outs used by firmware at
> runtime.
> 
> The downstream UEFI hides these from the OS. U-Boot as the EFI firmware
> [0] builds its memory map from the SMEM DDR banks, which do not list
> them, so it hands them to Linux as RAM, and the first write to one of
> those pages takes an SError.
> 
> Reserve them as no-map, at the base and size the QCS8300 boot binaries
> use, as lemans.dtsi does.
> 
> Link: https://lore.kernel.org/r/20260928-monaco-ventuno-q-v2-0-0e046c8242be@oss.qualcomm.com [0]
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> ---
> Tested on the Arduino VENTUNO Q with U-Boot as the EFI firmware and
> with the downstream UEFI, which already withholds these regions.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
