Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A914848B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657906; cv=none; b=GnkNgpglkG/5qgtBN09EpUKdZM+H/m/zbSWHnlBT7WjnoJwpMffttgtQRDVDAiJU4PofDJN7yh9Hl20M8+KT4tQ7ZfFd8w9L5bAD+QNtE7I7bz593dLFdQgXunkn8AJLDURBcXIPymNJyl/3+7z7h0xGp2WrvOLb6/w30jKhkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657906; c=relaxed/simple;
	bh=oHhMGJ97KbFYv0KPwuP3HgdQt2KJw4wSr7XuHN0THlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLbTJDRTg1MZGASHBF5cTJI/PAmX5R7V4+91zQiaMxIHIZxOuit+79zoN7T5i7WHUoPOWak9cGQ2j/cL8nyjU6wKZJKMVUAH9OKjRBtXNMh6/h1lUXssWzM2cCaUj3IAlQf5MBvqjQM3lBZrsw1N73X5qaU3ZzWmoKMbq83SyRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7zTwMCv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJivzEmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7zTwMCv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJivzEmR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDipaO1137790
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sB34Y5YewUpC7AQCZUi/yvB6
	QiCcoBSlNdVX+1eleX4=; b=Q7zTwMCvGFtHwpwWJsJJH0ZAYIvh0Vq+53BrYkGO
	ZnBLtV73WffQCUUlkVvpXg/EKubS5LY+GET3+2OYeuXHgyKkLWAOA8ycKuqEstby
	3ngRELnJsZSVlh9MnWsncEKVTVzVtfPvkDn97qhWGkdDsTfwoIoZaw5m8iEx/tXN
	0fDi1RCIT12z/pwW/Z8SbDd1UwgyJRtlC4X45WH5Hm1fmCJlGXzmDfBEhHXSUI3D
	kMTi0Fk4h5XtH5IOt0TWenK3ATDvHndeK0ZkAkrT9//3P5063N4Qdo2yQL8M8vog
	nsnsxjQaXHae6QO8Na9MAWxegukzU5k3v02ytjXy4sDNcw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2t68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:11:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93903622880so192838285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789657894; x=1790262694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=EJivzEmRZKiFyFmuCQFD3lYCzfxliWdFU5Tld305KDQFKu54kmKJ2lBHhP/EJXDGpk
         9cIZ3zxR2WphfDzPmZxMeyKOD0a++tGSDEOvHX5hhmXlRPlS7RW9Doj2MjXpSyqCrVQC
         PyY/dAhWjTCZmGf7ZAKyUMNAAn0Sh2yyxzplXdh19KhxFGDZGq8I5G4AuSKLTn/H1Nfd
         BITGPD02ozggEXzSwNxtkp5YxtsEsI4VclbwphTY7U0FFL46nG9eyV8NH/eI+obPt6ZM
         pEY5+gCHkzMkbg3mHvTcYEC83fonSErOs+xphJMnYNjvmFBYnJiwEoEikXYJWJqrjE5o
         5Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657894; x=1790262694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sB34Y5YewUpC7AQCZUi/yvB6QiCcoBSlNdVX+1eleX4=;
        b=zzUnMbaSjBbrJ+9+D4+wadKIYJA+LADYcIpZ9zLcqZJqSLzRhEtqn3hooKnf7q5X6u
         0arsOTc1AISZkUJ3YhztpXZxb1HJI8OQWo5dl71ScggwyooGHGZ1boAKzUkPH9ImWi/Y
         zilaD1RulIwfHx5QUQQtsDitfzsoywlqmr99Rus6Z5CBrD40wDfrBsxzwUxRPDhgT2vJ
         Hm8uKFS6Jyc0ClAwDGBidSdXZQnG5FHXzsIXvrKk/HCVE8zyWR+YsB3g1lD0c8GZS/JB
         ke4EHusqstL6qPQe8hVIOtA902Fa3XLYHX013MRJZSXETpyZYJznVbTGATurGa2aHYwa
         /Ztg==
X-Forwarded-Encrypted: i=1; AKwUvBzZeZnOEg19TqkOXW02gWaxEXDxJ3ajJz6S3lSvixlrCpe8e76Pu7V0DAM1geKZYRWPnI6g9oekrLx1wAzF@vger.kernel.org
X-Gm-Message-State: AFuF++l7nEBwTmPGvqb/+ptb8fI8XAdb5+XMbNupyMapf3SpDg9uG9TC
	CUzn892upSj8wmoqVH+Jul+Acz6fzakZitA6tiVI7efDWjMjOqC49Mz9tvyOSkT1ZuyGzhMTHZH
	S8JVyPOE8ybZxDzIJUTpfd2FDpxarWoRN1/i3TA1dOvmIf0nEaUamP62BqXdH5AioVFFx
X-Gm-Gg: AYBFou19XSC1xql1WYZqWdBy4tsC7JQR+hA1AGVhuRc/JMgqx1iPOhsURUdlh4SQnd+
	DW0LcTfPcYMeJq/ePoQ0ZfFYZuu5aBawPsqgrcYRhk1mX+JeyGjpqJGpy2p49ob8rAnYNcVpecs
	ZOgLpfPVUwHmZWIglYPQ0do5MtBTwbMkoHHjFxK2dtmNV8tLDAd3f6iFHwVyESZrIREiU66F/Mg
	was3q81kYeFr/tO/zYb+t2Nm2KBRD0FLF0e8ds9kUHjrUeadTu74FVCSXNVuxy1PRByoF5OrFfJ
	MssZhflUy2ZQM/pFYbns8HOJBUeqTmM7pBEvo/zF5MjWboxncHFhRFBU27no7U4o9f69do+yt72
	dZdULHaZkZngGmw==
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583774385a.21.1789657894165;
        Thu, 17 Sep 2026 08:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2687:b0:939:e7d8:9c04 with SMTP id af79cd13be357-93bc62e126fmr583768985a.21.1789657893513;
        Thu, 17 Sep 2026 08:11:33 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm16097557f8f.9.2026.09.17.08.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:11:32 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:11:30 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/15] arm64: dts: qcom: msm8998: Move PCIe phy and
 GPIOs to root port node
Message-ID: <osbej5tk46rjvbppcosn7332tmw2qnzvt35ctcukd7gcg345gs@tcu3zi6t5bo2>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-2-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7q3pvAvdRae9yxfEfZYT2XEEjx0y9qq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfXzD+cbGvi4c3x
 8us1DGiJrT6qVJuIQ/OqW/Pox6ldtHnx93JzthWjMsdzrrqaBvJ+hO7t5x+6zWvwlr3C5SXb0Z/
 uKNSSiU75kQp3ionivMbF0/m0gjVlWDGnm7GYOt0yKQOTU6eZ+ayhL0bjv4jAJDqiA5rmi8d/qT
 oGYunwPAGb4rSvKfEEKESg2YwcBS5P0ye6NoU/G923T24XBotHKXBv8j/dymGr+Of9rOQ5CC2n1
 4tgibaqwgAfLIbJv1U4qSFRhEX1fGLHwia93j4MMTDgZTb5y7dPDI6prJn2L6LXdiK/dhC6PoW7
 3HcCDGAH3Bx2IPzKbAdDR8MkoV+GXxBSWD2NMJhGb+WnlGau6wlgVJBkbJC8Hq/n+RcU6OQ8j/L
 bXBW3qyELGjDOf+6geH/pXV2qVpDRJcXKPIl2XLy17e6HfmumyB7T8Yani2iNXY6eG95nGgvsF3
 b83dRklcUDXQUwlnstQ==
X-Proofpoint-GUID: 7q3pvAvdRae9yxfEfZYT2XEEjx0y9qq5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNCBTYWx0ZWRfXzWztIahpOkBZ
 WCoOX5ImYuecllCzr0UaX8Wt+GkuaVUGsTKo3Rvo9yo+87OJ/0sQaUlIkjUDyATFErr86vYQ4jU
 49Y/rFqCbj2n/pdK1GTgLgMoJb7Lqrs=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac0327 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170214

On 26-09-17 17:55:16, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst GPIO property are per root port
> and belong in the root port node (pcie@0), not in the RC controller
> node. Move phys, phy-names, and perst-gpios from the controller to
> pcie0_port0, adding a label to this node to allow board-level
> overrides, and renaming perst-gpios to reset-gpios to match the
> binding used in the root port context.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
