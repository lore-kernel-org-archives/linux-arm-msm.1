Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D443DEA4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476588; cv=none; b=iDQqqrnt7UecwjEldIoJXv+Z1zlKccRkNZ54mRDNg4s4kfPRKYVZ8j+1K004aGe9iMv7FdY5mw38k67QlDe2Xn76nnAKmY3KjeMHdLOJq/mKZsO6fnMfDryAXAX6qLC3QV0pqTYtYbsiwJIi5JFKs9qlYFFFAPuazHrszTPCy+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476588; c=relaxed/simple;
	bh=g1AzAZkdPDHguXpNufhDaBNRT4BPES3gacsBP8AdF+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6nJyIKOcyXBU4efjAY/fnAs4P1VE9PDI7lDNiUl74sHurQxzoMA8Brx+pKcw/L0Jmie1sNuZb+rFJ7fwNxQZ/861KgDV5Zh/MnD+8OQFeERjDzG2v9+VV5UU6UOyQ22/2AS9Lm2YXlFNB6OfY1bwg02S4XF9wikBl7TcTqyHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PF0Vhe9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HN5hK6js; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PF0Vhe9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HN5hK6js"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h17W2086632
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ZiviBOWkE44Z/tDslnfzRoB
	pPcgt0qgNQY/77lDuyY=; b=PF0Vhe9B7CcCSegaFI0zub0e6Zim6M8zHBdQ50s7
	+LBWG9FIqN0STxGdr2QyiRfiZvdojh1vYRP8Df1SVpXuIlPGTffvivhuWqaL5w79
	BnatGRwi3hUaIjvm+8ru1hmXiXq253TTeab0P3e0dkuLCdafYPJjjvAQC51SMfIa
	bElGvMJf7Vz12tsh2v4VPUcaTQYJrwo1s8y2GHHFMj1kf+upc0tMryCCMEj1bIx0
	HO6xjOFvRto6b4HClx1icpwOaoegx4VOhgFeemxlFqXyNZyuJqkzy/0fPdMQc6MR
	6zN9hhZ6cUown0ZQu8Yge620j/hLzmc2/GK18bHd3ABsBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9hdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:49:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso669883085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476585; x=1790081385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=HN5hK6jsogrOE0Jvuos04/6/1jpkJ4dHMvGn7x9iBVwNo+y130FTCdHimfhSoD2gU7
         ynXCpMKaeDmvDl4Xa3VfV6YDxZ4FE7ZsYZD1sJjnwHF/dX3eiXqunDUwDhlmYfEKdZ0m
         7Nz17WvjFa0ItSidM+tDhqiyM9SIv4NMx3W9blQ7pcfbdhoqt5UtHHdKMojTjF2Oe3pR
         eM6akQsZRX/i2ay/RCPMKBiRaFS0zVwnXk6Obw1GAh83WiC19JOClC+oulk4d3caA3Yv
         d/Az9sjRl3RKUWkuflbqNAQVW0gLJUnX/jfkFXZwck+qSXJ81NLgNBhV45N3bteKBh23
         INpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476585; x=1790081385;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZiviBOWkE44Z/tDslnfzRoBpPcgt0qgNQY/77lDuyY=;
        b=F5SCqG4nQxRl90sqv6mqGiW3ersHyPekyPVLMyTwT17WeICeCZEVxfWKNXokVICkXa
         ivz98gGA705XPA49fWDYP36VrU9jMX4cwQJ3aWkXKh4zuvvY6thWwhY2u2pTLwa3Dyz6
         ygnOZi5/p2Ogm8yO3Fwa8628TcBLCrYRyVcOLA7xqy6ndPYkoC0ZpSgB9TcApqTzgT7Y
         Yz7YCsqUoHFwn4qTneW5vRB923xiU7QIFbrGlWlQW9sgdjuQbEO22E/qnlg5qOsNbZ3M
         RYilZ0Ig4KpOzFfJKe8i8Bq1QjneozyKY3e4KDnCBzhiMQv6Q+5T+2bFVv05mwjQHHTL
         GinQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPbv42xZs37mFtZoHCD/kdW7GnMcszMVnKD0Rhgyx13qnxFTwBTie4vDJbH2trQJcqzgwnjXZ4bvTrlmIB@vger.kernel.org
X-Gm-Message-State: AFuF++mRnPzGfyU8He6YHf3Nbwkoo9SETGdIawCNRAAux1YixzbROHdc
	JWYHrXZoJIWQX9lXw0mBGAprPI8+2otNEpE0sSSWAHXKuFH/o00GAqLmt0+kPM51bVs++Opxzok
	1oo/gQypuRVsI3gH9vfj6eMDu36c6WrvMBrPrw4n0pgn+oD1VqGcxT9iaWgVIbpo57Opd
X-Gm-Gg: AYBFou1an0Rre2EsJlodQGq09poDDTXQ9Fz8WhrOHTOPLXe5ki7ZjLamDVq+dZpy/sL
	gjFSOHKDQobyrAV0Nfnw9TH2dzmSRsCOCttne7tLntP11leR9GVyDFXRyGpn4jpW6eMeZjiV1sk
	wUYl4QxgpoaloGfRsI33fxL03JTdoTargpwZTU5PvbKU4jMLDVa2SQQECOhyPMX88l1CGaSJUU3
	yam4lZk2vqjIU/w1mPWIG/QPWlxXf/zMzvzD6oj6/1vulTb+TpznYkHvDrN38/EZ30w5pQJDiWG
	bglasUDbNuM/fFlkvEoYS6oRXayeBn55C5JkfV3jQnVQLr1z5L8FbfNsfVibMzP35oUnONvvq7s
	shalpEUeHhxHTVw==
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208754985a.20.1789476585387;
        Tue, 15 Sep 2026 05:49:45 -0700 (PDT)
X-Received: by 2002:a05:620a:890e:b0:939:2c5c:7977 with SMTP id af79cd13be357-93a29855523mr1208747885a.20.1789476584805;
        Tue, 15 Sep 2026 05:49:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487072a93f6sm4893480f8f.15.2026.09.15.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:49:43 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:49:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
Message-ID: <kmfzk4n6xm6bat2clr2ahka557d67vqqgkdvhbcj3lx64bfsyh@isumhqdfhwnj>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX0CDahAMuMs0S
 KpDPKPJ6v5GRV1+4Ctgg+1Vjwi59dg2AZ9lPEbAWqxncxd5hWn+tBWy/ghT4oIny5PapDDbC7Qi
 ZWpazOdm9jIECmXaQF9uSyLYdYu+zk4=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa93eea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: AmhGUUHSXrbN9dmKN_-ldgUxWq0XCM-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX2RRufDScnxQk
 RNvbjzrMafLk3Rm7Vr++hOj8LiQySHBE+2/dMBHkCXsji5K3bsZ5DU/t3swXAkl3a7vRnjRqmWE
 YsXujUCqUrYhly1djgObAA1TVEOBT6/s6j5+KDa8a97vxGBBStqP4vLsTUSKJDUXkxhFaGWvYkv
 8z/7x5yBWxQRIsChXdsDu2nTcyQaW1E5uMxxMfHmXklC1Z237uKxd0CpxZ23gjIT82tcSR4W3Je
 vgXGpwdUsVtH1LNL6Mf5LE2E8PYJwbx3oRU2u629ma83tBy0rLKRkHGCcmb+OUN4g6Hq1b+Q6sg
 /2NP3Bb1ZGHxKD6MEN1voiQ2OIwG9uuHA5VZRvUWxgJKWKvxHos0kdgNpmUAYGFQVABb9gOjRln
 UUDAtd1QPG9Qw1fNQ1np/0nb0iEpvUEYpnSGVN1h84HtODmXyH9TN5sqem+In8bFnZc9ktWFbyW
 4hF4R1wE9IdP4HK/UMg==
X-Proofpoint-GUID: AmhGUUHSXrbN9dmKN_-ldgUxWq0XCM-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150186

On 26-09-15 17:37:31, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
