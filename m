Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C7E4052C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222684; cv=none; b=SsiILhWXjddH0HxrwMhDSNJxT9T/gzg9580O1iwCqSAZtUyK+Xxeu2MB19fCc62mSEcv3Yz+nck19Qu/UjqSJbXVAiqzNXk8fpH+BNk6Ww4Yl616XGjg117jo1AxbFdwIm4HPV7TyWoOsEicOaZDcJZ5+IXM3aKZBu8anrw6kzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222684; c=relaxed/simple;
	bh=uS8R5k5DUGiB4RWFV7NfecEY2W+Azrnzk3zjDdpSSFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS8iHlFHJASZ9vnxNEKo8qJyeUy+NV/rIDi3a9b/d1FKdfw7H7FopPyltu+AgFVwhqmEURfuAwPaWUdcBXSgqMeEemCf6XdbhOATPCem5/z2unj/LU+FlXpJ2wxfmqkpK3dol0pyHz4nx8owK5DRJ4FvWq6wiUuguZTjnGUSy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chpmrH1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMWA6vA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chpmrH1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMWA6vA2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6eX3X2161054
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnVSx7Tmcw12tDoP4W0bdH7G
	FQGNd8NMsnrM84MuWbA=; b=chpmrH1UlJLPi8+zPDzW7svC+/o/M2gvCkEkbIo2
	W+DA8I4kUjkQE7N3etbs1O6e452zJDUzz1f2l5nG1/BmgRH1eFUKZ8LT0bKHvQrB
	mpULbt6own7cUNPEqeB3M/v46knhHCuSX/CWSX/ZTd69q+uQ14QhKYIl3jTN/9Xt
	Qz9osy/BxUXtENBL9WAv2bvkhKrTwHIiIsctWfpEb0Xe2wlpYz13Ysb2GDutrE64
	3LMiE3BCjZfSA63U2xmBMRBCPbeqgyJsF9hAF9eKuZP3ZL4j8caS1lYrrDTTy+Si
	PV0gsUD7aEALS1qc6oUhzViJCft+dUgO1iM4XB2OH1XvbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7rwjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:44:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934979ee9f1so262474785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787222682; x=1787827482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=GMWA6vA2gqgB/dcY20ihgjOhmNxdUke8YsUAMaAryPCTZiGG8+J6NMNgv5MNfWO0C3
         AerefPJajLIgmzRbAMzIF2SHJHPnKfGqn5nJObgo8eb4ZhCl6o0sxaBAutFi/1UQiTZw
         RNpz8suIkl0IIGdQzyDfXuO5TL/BqiMycaypxuqNirARVKbLk83DRamNr/7NDZ+7SyZX
         wv5s+of4f7Lvtj2O974L5EOTq4UswU2hcM3fStdhXsgSY7uDBc0waSrFQ4/XM6ZMAqrg
         edzJ+6o6lBrE2UZJYq6qagpQW4NwIkM31D2gDeAlVcaqfUpOCh2rImPziZECb6drqrJ2
         Vxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787222682; x=1787827482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=kE+jf2GIKKsEWMyzmyLdyozdfzoKzYK//ovhy7DmOEd5GRzqEFzgB4sGutyty73f/3
         PUimvjW32pNdufLvqd7CtJi2OymWADs4yAt/kSq+SEKhM5qgKKKbmPjVo5CQVeGDM/mg
         zQ8TxMlHFUN4RbfcIfL+BO7d+A+GG41XwxuvxuQWVw8p0Nqiw84Tq6HbQ0u4KI9+39Mo
         NMO57fsm/k6mgy588/apCqtgz11/oH+OoA3cBDHNXUX3BDz5dA9xyKjwxbugw5PHkM3/
         hhXOHCVLgAcG+3RueMzYRBWZTdz1/TxO7CZl+CboyoGIB17HN1eRihEbCzQ3GYByw9WA
         stHQ==
X-Gm-Message-State: AOJu0YyE8ejMzaWXfcYX6P74/RB3veJuDiKYmyc9LrmeIQIOGbjSaed+
	cMCoSBcyWzmyqDe7dx+KHBSUMPETlB/X9YUX2Uh6Bw6+bOcmkH8TwXEs2KB9yXt/KXzwChTL69y
	0b84+u6yEN6E5s0Lsuxp0BF9pxVmaovq5aGax+z7LdfGo86UEB6yPLlVW7Yr0vydrAvjz
X-Gm-Gg: AR+sD11Bv9HEMrVEdxDb9hnbYNV7WnXdU2vFA9ucvxc/1intyO9XCiJXFJck7UDVj+B
	hwdWkNPwvgmN87vOLo2PklVuknJIa4gA1qY4GNKVRjceSbpZ8gX8pPi6napIaJ+J3+wajLBRM0M
	5nn3iDWNdn6w4nZQyPb1G5CBwNvwOx7RiQqp0I68nWYFDQgu41W7MARnD+8wjnImvGHQmRdyIGp
	4phOSGMAEFGma0NT0dsdbFpao08q/BnHgEgqBKT3vpuq/akT2E7TC2A2P/VNQjw9f/ZyXEFYlOG
	20XxiZFMeIQ8cKkgrnm55PU7QCjOWJXQxIkorQck+6TUqm90JKkwjLRnsZ2BRNTzVX4xw9s3S3h
	ynAZcG7qQst5G8oM=
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956446885a.34.1787222681640;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956443085a.34.1787222681097;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm12781171f8f.19.2026.08.20.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:44:39 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:44:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/16] clk: qcom: Tie CX power domains to GCCs
Message-ID: <brgyntyrzxkjoptxxanjwhrs5bku63pvp3mubooecurwcpg56u@ctymopqzu5he>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX7rSVJ+1sWEpf
 ljNmBYsFxW2YILZ8dgj+9Q9/BqeoPyO9lYDXDuBGgG05vDSS2NDY52csPLo9LcpD0iP7Xg8mK8u
 9y0RXtz115z93K9OLO7Bm1LqDJqA1yJvVzXN8CtojIVAnPtW2ngxOCAAcoTX0jooMLhp4tkIjNe
 A2RkBn9mcexZrVuFZ7HtBG8WP/7mhhYh1yRrEgHNV9Jg1I+IIa6TLlJ3/UJ2IIkx42fK2OVDDd2
 8ROOXoZIeLLm2IuEZetLhivywArxx36/uhmcE92zLrsehBnFWGPRxVT5/2uDiaRgA9JCBXJ40h2
 m77OBFGMX1c0nze4XZmF6wM6fCbWx2h/Hkl2JEsyCRleVK/vzGE4eRUbbSeC5FK6AQOMoqgQ2Mj
 qFYOBlqY1jOntIWOc+rpa92c/ND/rSBHaOPG+zP0d7RQFswIysyvjf5yyqh7BqoRd5K3vHe8PIm
 wQR0mU3obyxOSBN46fw==
X-Proofpoint-ORIG-GUID: hbik1HeQ2vBhljU6ybSLWJ3ANDyIvhro
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a86da9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=N2DKuxuA7Gt9lniwrZkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfXyYAE90eZKTIu
 myRo33pi2aS6L38uXTd2TCIz64oohF5FZkgoHkGPcazHMYwUkWP/fXjO6/LCb9JuU48JDsJqFIG
 Vc4kWPlliuDaCvqI0mrHYzmXfk2zHe8=
X-Proofpoint-GUID: hbik1HeQ2vBhljU6ybSLWJ3ANDyIvhro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200079

On 26-08-20 13:07:03, Abel Vesa wrote:
> Tie the CX power domain to GCC clock controller for SM8250, SM8350,
> SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.
> 
> Also enable the runtime PM in each of the GCC provider drivers.
> 
> The existing common GCC schema accepts the standard power-domains property,
> so the bindings require no update.

Argh, this is actually incorrect.

Bindings need updating.

Will respin.
