Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07B7493652
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992451; cv=none; b=dHP/vZRHLpfFrKZg5v7CPf9je735rvcYPuojbde3CYJ/woRbOlmLm0NQTrLl9F7+V8CWmKqdk1TW8SBOcy/bNiVmJmCRvINqaMKmxbPWiW+X1hf2+MsQG8JxnhlANb8W4j2YJx/sTxPRVhn/jRvggowDsOHD4O+0rcgKeawj+hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992451; c=relaxed/simple;
	bh=aI+TcTaxp3qATHFDOIc+09KqwGvOBm/VOg2yW5Pt6c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rc7nTdPdz1jKRH7g66pkJp9+nY5croULW8xDzOHmAO/haPTHf7q/NZ8LE8RhWQEoQdHvFfv2HKFk8IIgSerLZ0/rnPH9TRDwZl2nUlr7uwvwxOVCOxhR89s6B+v2SCxzoHc0VfU/Qs79iIitvEL7nAm5yxD2xvleTZe4ek3/6vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edHCoD7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVWHtlzi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edHCoD7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVWHtlzi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdvNY3818652
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mrmIbXeN2TBMf2KsRlbZFCo/
	xNhOB/akjMxEecMlLrQ=; b=edHCoD7AmB/TowptwnhrUHlYRxIeu7lrGS/fubpA
	J0PBp4aDsLxuDDvc5lFjzEXjf/kp0brI8AJp38E6uxFiz8w6R5tXNDiUxWy5c4eu
	zurbSHWEzRpwgakncAWIFygU5mlXX4pBKi73/ZS74kcM9HrVA92LhXcJQ0Ztgwik
	uTx0WbLvMiYR+dYvGDcQMPyzCpTv8k/6JeBNf7PUuHMbqQe1CLJzMugnjM+x9sZi
	1PqaF0UIhhClNk0unCSTRa6+yBryPSDi6Ek1IXxNl7BiL9C701wJg1rupyfkzoh7
	/2UnmAE2NiqyeyArt9Uj+zWlKyxFrCXuNGe0tIsfmngWGA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79ahtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:07:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78d25a8ff32so720203137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992447; x=1790597247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=WVWHtlziABnNFi18DkJAP8FuSEQgxmnjKM0JXpU343tZGj3NUJLVQXhQAME9JnalvC
         bClYrlkVF1k5wCRdc/zRT5kXaG8x6oZH7VHyAT9SIFwuaFx57irjbCBNxyA6K8lcSLrK
         Qybqc3/haYbNEQSzcjJd0eUnpdDPhaM8yatlnnPfTw+MCy1HUOLB18YZ6b6Xtj337Mdh
         K11S3usU2SvpTfRsG0G5ZruvxOWuSozlA022y0DURriM0+gZ2GDCN2BpVxrInXBPZ08t
         sCWghZogggUG8ynnuyObzAjyQAJ2cbHmRE8WFCyY+ZL4ANhIfHVseEwOCjk19e/lXtgI
         fJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992447; x=1790597247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrmIbXeN2TBMf2KsRlbZFCo/xNhOB/akjMxEecMlLrQ=;
        b=S45cRBHdIzbWsWHUAzdEkjyjQH1C0eiy1Z+OcsbLTFeY1hruSu+3xXb3xEz3I81n9h
         xOVu/idGrupop1K8qwkkoSY6y3OzhaJ6YYgb4sVf26QpJTk0s2DIo4p96mxM+yvo4D3Z
         UqNxu7bMAm+LUJQn1mNBoDiuCup+tHw5M9Y9votNIUy9T7W+qmOK8D/rSIxYmWLRvtAw
         fjzV1vbKDTAiswfWRzyTMty8roAw/aCh6NYg6lyOPi2Y/BbTKpDy8nKPuGFQtsB6QRTV
         FDeQ2H1+q+jE8ohyIn8lMncH4uZyvHa+9FIjqBjVP2/so9NyrOfjCHZadCXKyXHpU+rE
         +vHA==
X-Forwarded-Encrypted: i=1; AKwUvBxKTy4xJXdcBIPnIVVtXyb0KbW7rv04Q1VFOJX14TuEpttmV4YiPt4VSZMEqAeUYbWiBi/au5K51WhC5UNn@vger.kernel.org
X-Gm-Message-State: AFuF++kmsO0OieHLuDxTHZBRgzosyLrqkclmUsQjknZ73G9RF2YFDsxo
	MK4EUv4xbrbhYiErgH6uSrKQ6iS+r2E3s7T57d7tZErxxmUVlbdvnzU5a21Xgy29XK0+tb62KLa
	ghEtxh0pkGvPPtIyrJ4Ad/OZ1HQnvz8+hS1uUKvX6LAN0JQ08tIPtRw44Fx5UgYxUvft0
X-Gm-Gg: AYBFou02snc8gYP0y56pxQFYG89iUbUa7E1NwD53eDMEBIzRV0Qx25p4xfoXXN9sBMD
	Z26WN6Qoj/TJCfALNe0w12RTIPttrNrT3pFLQOWJIt2J+kH6pZaVLKNNz0A+W6EkTHoJB7QoZ/K
	XvjY2Ji57T1tzwCtxe3dWf64Y+FdSRlbNnehnkdV0dmXoeoemiuzZfct9LcxF0uRAE+zBzkLr94
	UIz4OUaIu6dg7lF0gHG0VLjvuG3Ql0HsdJMAtkvo0qybPkAs/gKpocTKs4yZqbrkq0+EGez5mwF
	RTYnL3y0yTcv+PFgoMeWByq9pag2NeeYCSTtUCZjDZgRvOdWMVvG9LfI1jL0nDu8hoKJye5/lZ1
	if9tIunRJhQNbbg==
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3921066137.27.1789992446833;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0e:b0:7a1:f980:e93f with SMTP id ada2fe7eead31-7a55d796d12mr3920971137.27.1789992446153;
        Mon, 21 Sep 2026 05:07:26 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm233127095e9.3.2026.09.21.05.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:07:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:07:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 11/11] clk: qcom: apss-ipq5424: fix 'ipa' typos
Message-ID: <oez5n4yxcusxjuw5pt7gtqqa2drnvbvzhmpaau2s3rybwxdzr4@7qpaaeevdfzb>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab11e00 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D9-gj5qkw8m8MH5a88kA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfXxQ8i/iPdpf0b
 ajTfJ0rYe5ylFL7H3/tTmX3wvEICz/ejPtkTgwSnco8D8FmoZQ9yW6tVWn+RQ6mMTJJ7Bwp31tK
 KhrKyzamtoX8iZOthctKrJX+1pO2q1o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX16hXXnu0KXEv
 XJ5Y8/aTjgh+JJTSFHWtt4JEcgqZaGsBxiU1I4gqssE1C7k3yX5uSDtsa9NsSgy+g/1WkRB8blD
 CfYycigL4GG3gfjnm4i4Vasll5wE92g6tjqoNBal0NucQD7tEmyhv4+a0RN5wFNxqUFw7Ul487+
 OWAHeCo8o6/AFiTSGAK6IFQtrrlBnkQtX39fckY7NQrJnuc5H5PDBY7KlLRmRnlnnS02IB99PR3
 7Vxp6MqM1KCrszY9JTMZkHq8zaELwX0XmWk/4anB/9baV542fj2SAmaumajvyI5b31WZhZJYQxO
 VqEcbKCZSKALISN+/F4meMQQ/l3B5Stb67JG/iLGBbmLDzZAwLPBFahVpLtQOdveKW56wpx3KDT
 50u0uXE2rYztqQ7t5TfqvPYg0D3WM/xcKtfFpu1nuB0V1Zzsa+CIeuYpYUzNxtZ2CtccFtVvDeA
 JuyLnim7X0j//A1xNLA==
X-Proofpoint-ORIG-GUID: lMYxW318gBlO0-m7A2Kj_nQJTUyZwP3S
X-Proofpoint-GUID: lMYxW318gBlO0-m7A2Kj_nQJTUyZwP3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210175

On 26-09-21 11:49:44, Kathiravan Thirumoorthy wrote:
> Replace incorrect occurrences of "ipa" with "ipq".
> 
> Compile-tested only.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
