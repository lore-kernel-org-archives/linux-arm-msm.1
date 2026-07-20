Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4416420867
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552795; cv=none; b=fPO8J+imQfHszTD6L7hI8pTeq5cXTK62gFkDq1ZkPlgolguo2D59LtHdi1LPyxeBRchEffH7jpJFlVoasF3z7/rl+0tY5g3owvCec6wOLeqvAK/9CL6vBnlnkYvXx4f6gqICWM+4/c6Abt/u0q9NSJIFubYCWQZOo0YgxKSjfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552795; c=relaxed/simple;
	bh=zmrNpY9Fa8mlxLmLiWa+bP69gc+UK/rSjksdNWb2nO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Luiqc/0me93PUFAj8HVOJW+rwX8sn5a0J6DL8yK9vRMmHyqKdEiTN/14PqYIoKIPDPjwTHTQ2MCrkG9tHiqiSJ/mLb1rjrlsvm5fU8NGcinZZEzMRc1FBBsj7XxWJeWrarJtCjFbxZGFrGDeJ6qGzIgofra5hzYF96jllrZXtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6wdjYFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVncjUdp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6wdjYFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVncjUdp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvkrO1910547
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9Wpb01KOGj78z0Du9MyVdmB2
	W3xVBzOaHfRWYUnJVjY=; b=n6wdjYFiyvoEqOzMI/TiYnNn05bkqS5Y9aIuGFmv
	rmS6Twx5WHo38TNMUXs6rNdWXrLr42APNdT9UkWQG+fuQsrpR2z/v6pN1ySJIUl0
	3K/EQ5Ox/qgbWCd6e9YlSIXtMz7nOoLDiUSCErYPpSTijpZovsEe6XplHF5qNGaL
	k67UIZTe1xnvVe12sU7cRGBmeGhIW6YU3XJYrGgeXvPb+CmXw9DKUTpPOr7WZ3kR
	06q68XFiepNrFsEf8JdtSsvZr6JzcxTDAWz/rKwzkrE5EVjDz0nIULj21oplFkYj
	TiJxKYBQ2Kb3MPM6g37/72Rz7hLpZfFIDRhFyUeRTDMuog==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs510fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:06:21 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9771e16cf0cso277786241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784552781; x=1785157581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Wpb01KOGj78z0Du9MyVdmB2W3xVBzOaHfRWYUnJVjY=;
        b=UVncjUdpTN7UjqE8AnoJUIFB6B/dNvb/gv1E/OFxoClGI654XSbQGIrk+RRziUWmAo
         YqICiRrTRGr6oWMZ4kihP5mRV2Sd5dVnJ6Qvvkdqykyxlo0SnRgonnIfrcnzlRkPLxm0
         iE8Dzx0zuDYJ8s9gB/hpfpE7F7LKlxVbEGiObVdOsHraTHhPIFHT84lw2QPArU16+wmw
         FphgvwDeYNi7xgbWV42sxjooTAhUL9FSmEyNNEDkmY4826wFWxgCL4fiWaDuSE7y72bL
         OxI7cTY+pBUWnB3ER4a+KNF0COwAC7OOmMT7VNPaeYqn6ekEzbH8PM7pKt8N4Ic8cVg7
         LTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552781; x=1785157581;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Wpb01KOGj78z0Du9MyVdmB2W3xVBzOaHfRWYUnJVjY=;
        b=pwnDW/elPRWS3sxWnciQSFZZ8wjT57KJs4tDqlwNNIp6mNCvx+WJajlP6z5bTID+vU
         nqzRqDsrxfuoMcSe0tjEz5U/xtMBBMMd5qXK7dHTF104Of9+qNChIH+f69DDGcpCysHH
         uXuUCMHlBzYn9mw113GB6X7Q8XgKTRq0OUfrd4VTBFa4qSifw4ve2+Qj76+JbG3oTthF
         qm32XwNasdGfxEWFhoTa9P3/NhHrq/9PtftCbtFJJtzANXFqES36bAtxobUHh9ombA39
         iTBcH//I/GIY3Z7/k/WY7XiCY0Je+oPzCZK4mEBVRPURwXy3WRf3LtgdUGw8H1iSNGc8
         TVcg==
X-Forwarded-Encrypted: i=1; AHgh+RqpFnj9UJOv23QjboMYEMkWJJ20FoVS6P9x4CSrrR1sz+wkHxLVJK0xDa2OApJBevxm20XprHa4ZyGmO4th@vger.kernel.org
X-Gm-Message-State: AOJu0YylPImr3iTsqben2uAbwcjIdO47mFnTxUPuezmc/9evxQOfBxzX
	shjtvzFtnwuzacHcuggCV7BTX9eIIS1Vx/A7ihZN6/l2PyU07byH7iKHy+mFxFeVKhn3FCECG43
	ruziBYUFZZ2WCjo9OS1gThwExmHDN4eF5nowOMaaZKhgtOfVRXBIJzDoNbBZptwC/E59s
X-Gm-Gg: AfdE7clpE8xznaqfqTASB4l7LHX9AWkiDR6T+r+LvXjANISU9xFxQdqraigT+FmjrHd
	OIckqlqSrDssTX0Xi5jfYmgHaXihlf88hn42sfl+WcGa7qrBdQ5EXWyrcn8HEF53OzzHlHKMFEM
	qOrGG4qe5yoIrKkfEjibnFDBHhjCNjks7MAOQgvn+VJzHiHYKZdFsOKVWE+Jf8cYHXMNyfgre6a
	5tYPvfqAd6ugjZQyKnr1rKIVvnklw0eUKtEtskmh8EeB3arqxLOkIvcFMA9s85bUYiIukRZV4ny
	us/nEIMUnxMi7U+y7lVI9yGwfBM7syWT1eELxAATZMW2G88axNu/PSsqOOtonSHZil1eIaVXtkW
	FIE46y/gQvrMjtrTHAYyHCXKv+PpaZrolbI0YaIy6dWo3agvcr9pF95VGKYLnowXSy1NczMB8Fh
	uTWh6uVtuBOiRucg==
X-Received: by 2002:a05:6102:f95:b0:631:26f6:701a with SMTP id ada2fe7eead31-7475377fcc6mr3439909137.29.1784552780796;
        Mon, 20 Jul 2026 06:06:20 -0700 (PDT)
X-Received: by 2002:a05:6102:f95:b0:631:26f6:701a with SMTP id ada2fe7eead31-7475377fcc6mr3439869137.29.1784552780253;
        Mon, 20 Jul 2026 06:06:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eba9b25ecsm13615221fa.11.2026.07.20.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:06:17 -0700 (PDT)
Date: Mon, 20 Jul 2026 16:06:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <t5sz65mxp2m25ktyysn5qpueewiyrnguksf6jeu4k6i6o2sbev@khnyjt2ijnog>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <vq5bhzo3ui2zfodk7bcbcsdrewrucric7i6v64gtt2ngmz7t76@5y46ajm2iyuj>
 <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cdeffa46-3f9f-4956-8548-bdd158720307@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX+afKa0yI0cT9
 DbhhQmTNeCcPSDGMyEltoRMteDd9LNIM2Yfw3YCQ0tn0Pvn/dIs9nfCWDnLoGKzHBpnjyUMjRb2
 Ic2j2gyNOeigabj/dVmIDvxssaoPXPU=
X-Proofpoint-GUID: Wq43ANLs980fK9xYQm7RkEX-XHaRQg2u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE0NCBTYWx0ZWRfX3eqHj6RAnnM3
 hvcNoIctN4gwcemWjA2gwmC/dhvN02sW0GAYLxhi658GPKtUzZVnx0o+OxGiFUocrr4aG+oZ3mL
 FzaJKaF0rY3GIUZoGbR6rtKEgdJvpg0+7porsyG3aSyITl9/CpXUgNHXTSSu8N91xj4KSunwBes
 yZqP9rkVxWYIVLIyjjr+538MEytHQmRurDGDVsGpTu8pA5r5lutPoFOtoMh22luf9EhvCo9RsHO
 D6sn2+f1WTZd9qE1bqp6gOWGOPssjNuYzJ66WZCpGKqO999zuQk0xp14zmT9Vgd2NlWiIbU/yvp
 OtRXxADsSLHmyF0f/cN/naleSWr7c9bji1qXL67amgaGJhIyfIvKvun/YrDg5U/SnU9S52QRoAG
 l19ds6LD873ax4DTItE1FDN8yyjTKHtuuNSyTxyqBHvwlXk7bUzzDPjBiEKVaCFh4JrP+0ppNC/
 onDgrw6gPjgVVvMddfA==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e1d4d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6hNVS0SBqI56LPJAG9QA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Wq43ANLs980fK9xYQm7RkEX-XHaRQg2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200144

On Fri, Jul 10, 2026 at 06:36:10PM +0530, Arpit Saini wrote:
> Hi Dmitry,
> 
> On 7/10/2026 6:19 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 11:34:42AM +0530, Nabige Aala wrote:
> > > From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > 
> > > Enable the Qualcomm Shikra MDSS display subsystem on the Shikra CQM EVK
> > > board and add the DLC0697 MIPI DSI display panel node. Pin pm4125_l5
> > > to 1.232V with regulator-allow-set-load for DSI PHY PLL stability.
> > > 
> > > Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> > > Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 126 ++++++++++++++++++++++++++++
> > >   1 file changed, 126 insertions(+)
> > > +
> > > +	panel_bl_en: panel-bl-en-state {
> > > +		pins = "gpio91";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-disable;
> > > +		output-high;
> > > +	};
> > > +
> > > +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> > > +		pins = "gpio91";
> > > +		function = "gpio";
> > > +		drive-strength = <2>;
> > > +		bias-pull-down;
> > > +		output-low;
> > > +	};
> > Is it an actual GPIO going to the panel or is it a regulator on one of
> > the daughter / whatever cards?
> 
> This GPIO is part of the daughter card, it is not going to the panel.

Then it's not related to the panel too.

-- 
With best wishes
Dmitry
