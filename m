Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07CF443AB7
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932841; cv=none; b=suLM0cbh0rd2lS9RUlgN/zSJ5iI7ieC4R4Z2/CwTcfWFGaZ8WPAU5laN5V88MgvTzbxnr5j1Aq8EFP5dT6ZgwTgo9WvIYvHTEC+PWDBRMfgbZxTHfoijyl3ZH7lvfyGqrEt3TcLYb3xECH4RC8x/CK2OA/jIIxwhbcM3K3L6md8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932841; c=relaxed/simple;
	bh=+HiGs7ic+G67g+jK6ihA8DwHby0KUl5GrLnvv3fDxps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSork3pqz0XcU3bXAQMK4mQKlWpCZxsZIE2iGIDSmb3eZaCUusWq5pRiK5hWkUBWTtSZ8G7N/m0o20jr5gFZ9dAMliDgIneAZ/FvebyOztM0Bga9sS12xaRbyrwH2PEGNP/owBOfaeZB82jJLWENcjJ/Lpv802MzN9ZgPS+rpaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsrDEX8t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkHk/HYX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsrDEX8t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkHk/HYX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jBwl233789
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 09:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BEvD6iYviTx0ERjEtbXW1xNy
	bpDy8Ge//Ongv2RbrMI=; b=RsrDEX8tfSN1k4qR7Mkz/rYSek0nBT/75bonCZIp
	1QTD81buRrzX19IPc1/lX1lQwgla0bPdUhKe1DkPMkYO3xkQ5Js4Ode8N05rH5c8
	GklCBEhQyYD6CjzHxSLoGTIgqMt6Ep8fEjcymTNjtoJFweDAAiLiYXlU4xEl3402
	HmvmO5YiIuGjRZXAeHnsyj2F1S/eL0hwBxopyPAjjKr+hUXwVZ3OVUFA7c8mI4T+
	FMvJAWrorIZaNwd5zvLRFs/nbO51zSQoBlXqYT5G5+baLqYf5q5m/iPUpDoPLNAc
	9Cl96xd3JwGAdlhhh04WiDGBFOUF8TxWMHmX6TlP1Fem2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9abe88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:20:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so274142785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932839; x=1791537639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=KkHk/HYXgc6/N+B+dAb7RhFvVn0Ux02I3rAJ60byTGCfQUPxE7pSYVRE709m55WVPv
         5fAjy6eUcbwv5yMo1MixCGJbnWi1Q8qC1PE+84+g5mwYUIA6qVby93N14iJ6IgLGHNmp
         gq29m1nb0ruK4K9HdTfv2zHaG0DH5/Rqr33Q7jepuRgY6avlqBeZKwaQ7OjxfkKq2g06
         q2qLYzW4BXO4WNJ9cdktdUdge5d01F7qXY6XjawO8tvZWihluych8bdbI1YGtglXVVc+
         5Atzimv9OYVWCGN3SxpUjej8gAz6yvEOjK1rZk3mRdmVHtjaLzfjpbyD80OhU6VSwxo3
         LgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932839; x=1791537639;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEvD6iYviTx0ERjEtbXW1xNybpDy8Ge//Ongv2RbrMI=;
        b=pdQediNakvAgqc6wJH/1uiniO7CvBDT7LodXX2PpI5pth/t7hpkS6taey8vP74P0uA
         WfOEp9jSuCicIPnPcH3eEwMP2fQIuNYXNq9IbDr1o3FYdQs5KeF/XAnNO6/Vyk1pGHBc
         L41t+D+v2TO5712WEAnw9KOn0wt8ONEU/XNgsGvHCTy9qJjpGZ2n713H6UmqggXDfCg+
         TF71xuxqOV+K/fyqclqeufh0nKNBDLIX3Yri46m31cMMj8mW7w0P6KOv4IJvSvM0eucK
         WP2tOXMrgaZEOwv1PhjUqu1jEYBTJIi9qCnMqXUO8YvZ9n8+xBd5ilwNKIMdpvZfGhda
         ceeQ==
X-Forwarded-Encrypted: i=1; AKwUvByabknniTop3g4+NcFvgXj7NZcjNszqiVnXbaI8dla6WLUMuUebFnbelag1y+JGoyCC2vB5h+jMRSJY+12M@vger.kernel.org
X-Gm-Message-State: AFuF++mD3KsZl8eYtTbYHQQVj9hBi6FfQ/PYs7PMvX7PMi7vDleyZaPP
	JAMvH27TMZzEhdY/q8q41qUn+Qzo8KdHDWtp+BC6WIb2Zx1WNoiAJQxWyu4TwDzQqcSmQaHg/PG
	fg95iVrDFqOWP//U3GxOIgl5lBJG6dSdnHtD6EsysS2kPcAOrbuU8ZuT3KLREQJWRFqCE
X-Gm-Gg: AYBFou0tqYZawfzEiFDS3ukMw2BllPKSeWnOGq51iRqPVL2D/nMjHPif1eGEsXPAGV0
	rIuuObFo+pQhsOvqGLgskpX20ax1Xn+j0YAcI9Wfq10AvIKjy/R0rlWN1VKUhocKnMMLooI1un9
	37ylQbN2limGH8PMvB5Dq234lstLAUSRlcgw9qceIdkgXv9DdFZFArVW+8Scap03cO8KpO+U+tN
	zssmM/eyLyHCtliCgRIv7/RYap/Eef3lvsjBJmeREHA10CwWBcAZTBhkOQPUzEm0zOB1n0DXeJO
	51Ve9mnXsWPTNrS2lRyImpUuK5HDXS5rMgEInNELPcmMKto1d4/MxibqQ4coo0EpUr9E/c4nBis
	j8POC3m5nkarxBqs=
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029733285a.15.1790932838919;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4406:b0:939:c7dc:8712 with SMTP id af79cd13be357-93cb5a5c9d6mr1029729585a.15.1790932838313;
        Fri, 02 Oct 2026 02:20:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a030326132sm48429645e9.0.2026.10.02.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:20:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:20:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8750: Add watchdog node
Message-ID: <sad5fandsyilvnj5b5huytervp3jfuf57ctfsm5qroxnrvvn6o@d4z3vv6kcwkn>
References: <20260930-sm8750-watchdog-v2-0-b16fcda275d2@oss.qualcomm.com>
 <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-sm8750-watchdog-v2-2-b16fcda275d2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfX3iZ1p81YQM9Q
 Iz3l22selouzJUQyx6JzSiuCDb0BefoekeJkzWhtE3c3cT1gMeHnnIZ8HBQPa+BUVoc8NQZBIPs
 qQdPNNEc5GtucjZ4QdkQXbDPyL50WpY=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abf7767 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=x2DRelJqk6z56t6zBn4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0ABhOS_kMmpM98smARNNvhmInXpgLfW4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNyBTYWx0ZWRfXwFlS+7N3j6sL
 TwO4xvb6Rvs83ZkaO9bDF6wHckF8hSEig29LLPywEa3xJRM/SXSElBSH/HZ2sZlE+TZ3iqNwbVa
 7cMdh4znuUN5PLW7VpEt02xMb9H2AQzp5hwNoapB8Fe8jw0oJJ+zX2oFNMTs7tvDPFeZBZ4LTnw
 c3kx6nzHwxBuXikAdQhMlmggMVDpROXTqAD4UoIt6ze5wvKpklNxaM5MlfvsU6g1FIyon4mu+d6
 viFVTUpYJyc2dM+IvwHcb5Ez8YmmZlmo+OMGa9CRzbRv+daq0E8FmgtBK8CUeWf2AEYdeREpyKa
 bI3kyzg5e3pupvcalwZF8+viF/HEpfMzcOQH+64fDLpfgX4vZVw5nFNazXcklGI6YYX3R5qlPEK
 AQKTVSv3xn9c0sljwebLeRgjZ+Ou6sGf4NC4ICQniDEd2NGc4j5RFfK0GPdqEWrELdZJl6UmJ3q
 Zs6vP6fj5ui1syFcKbA==
X-Proofpoint-GUID: 0ABhOS_kMmpM98smARNNvhmInXpgLfW4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020037

On 26-09-30 18:32:06, Komal Bajaj wrote:
> Add a node for the watchdog on the SM8750 SoC.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
