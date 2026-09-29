Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167C524AE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688045; cv=none; b=NxraNe98LYPFOHlMtemIx0iXMy0OvB8lqfHdnTsyPTJNcRBlo6RuumCvOJoa6KF4k1f+NSWZ5FNlmaPHD5Vq342Rxsd8h2NGk4q+lJH7v1cnuDptdmN5VsWBnDjqv4gYfxYtfQpMisAiI4clba0hQrL8JLca4DZyR6xXPJNE0vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688045; c=relaxed/simple;
	bh=O0ihVgcmW96N31WjaekfKFoFrDNfaoWUpnrojK/kPIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTraayoq/w2Q1RkWbNx06CfTgaZdPv4W2eST68Yf7vq8FHFV2vfaSm3lMIobgmej6O0v+C1IZLpWR6zZZhx9zZCvHCGhggxZqecfC308YEmb2pnnlnXn11soDXiq1+qrYn7KhW2A3xCkPFT3tUrWJ/xRr3sV6OrtPxZa+2KTc7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+Uuq0gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExIiVKHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+Uuq0gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExIiVKHj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfXB3936799
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2SaWLLt3k31dyNE7WFRzNl2
	f9XMQ7VloVYpaAtanfM=; b=V+Uuq0ghWlHXxC/cS6ZROX+vjP3BZfTZKEB0TEvj
	GcTNivb2V6exptb2l+M2RvdmxVPQjM4G+8QePtIZlZS34qs+k1zsEwFg2655uP2G
	xJA64+hFb9I4NN35uFhmb4y1KNhllDHTfdaoOQNl1MXLutbltgUoiNk38CIWnoPg
	+wvv6irWZrF5FleeP3Ao0ZVVNlF3KE5TsPFK5SjH1VBsV+hQSnrsi6O3vlBq9LaU
	mLIOE0kN9jMgyrfcHv9haPdsUQQke1m/eeVl0cm/ZG+T49bKC0H9X30oHZwctmNR
	BUG+ys8of2MACreFfhvVRivrrvd+qMV7nY2FjzVtgCSGlA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gny3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:20:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b2d35b3550so3323557137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688042; x=1791292842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=ExIiVKHjCszga+qt1vSukR3CXZcAwJbS81GxhUD0S4aAuuDqzMos/h5OkitjhYvs2p
         USel3uw4diFBqD7aMu17nFAQzkRKFRepSjANVJzH8VU25E4J7UBALXTBxCX1pDWJfnSk
         ia8ha5JhoY+lTIbXxG3eem9YZ+8oNKJzIPahEm2wH/JnP6uaF43Bm//kcGthfIvcK7EZ
         1NJfVWzhqgL6zo+L4mpvUZhxHjRq6BLx4/esJjFbzrraLbdImVbyJUqTFgkMykvCudTp
         YUa+SSChCPxUJtk9p4+ndlt2WwQcPDLp29Or+jqapwtBQfVMJpVY2NiK/z8jOYV7c7hv
         jhFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688042; x=1791292842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2SaWLLt3k31dyNE7WFRzNl2f9XMQ7VloVYpaAtanfM=;
        b=mWj41V8KDOrovZ/V3EtJIoceKFGdV9053r4d2ctbrzrYTFdVGUtHe57AzId6XmfvBy
         qC3yqrMKC3JRf45HTCe0Vyf7BmfM2OL6l7LFRmfRyN0AxPdfz9zFa30j8+APjm7WCnLd
         bTmvFKDwG0YSnqETHOoQG7liHHjIFuICZWWCTupSKQKc00zsu7FhiUr8qye6SC2KppBe
         tzbjry4Fx3aARtpUfdKGYKibzUe2zDrqhIaMxgANmEF/auPgkMvZ4AxbllAzMzPeeZ0q
         b31M0R6/66DJ7bYAY31PM6mJ6TwE2p+nhYBeU/XEyixzqCaHPKmoXkOYsLPf0xuTupCz
         4ZcA==
X-Forwarded-Encrypted: i=1; AKwUvBwiFhR8tA22U6bfUsOuczHKgBczRXy3Fyf+5OE+HPuALeoarVDLjYvw34BfnKYRmI+fjv5Z/CjDIzCteWg9@vger.kernel.org
X-Gm-Message-State: AFq9FYLasN2AlfrpL2exEP+9pv99z4D8+Xuw3Fh3H5az3PfsqvRf8+7o
	+Mum1jJdCU2I5PkLBxU76vX28QzMcz+cyVywXYSZCUmes3eWzAIBUrSNgG2Jo2X7vVfedoOidVt
	PTSaJ2E//7YgnSiJa4iMJzR2kHkwpPtcLn0Unv0aH4Czotm3Tk4ugOkt/uIEcYgDeCpqj
X-Gm-Gg: AYBFou3iKrUAHot6VBP1Up/JDKcCVm3IOreOwyeWKc/H3UHo8oIVpC5JWtM3e44HkJa
	haxWuLorigyrQqWyyjn9BdkZuNfjX0LzwMFdaJUa/btas+JFiXc8OH+PkEvZVZ5NY/JnOgBs5ga
	5U8+4s5T3XvA5nRSUDDbJfYm4+MQ96mMry+rVKRqbc+1LyQK1Ul/q7f1C55syhm1kizUiAhEI61
	e1kgXaQQqu24aSQlh1FB12tgdHpHtzY3RS2+zWc6VJPpnl0RqMXYpDRQV6Wwd13uME3GHVxP7uq
	LX5LIGr+jtFYv9YGyW70EHH/35ZO8xwN7wmhI7UybLHdx/QYlore/FsDlM5heGEr786OxelLd8P
	AXrlWpm2dd2c6lKY=
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061161137.32.1790688042243;
        Tue, 29 Sep 2026 06:20:42 -0700 (PDT)
X-Received: by 2002:a05:6102:570d:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7af1f0f34admr6061142137.32.1790688041617;
        Tue, 29 Sep 2026 06:20:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm85417285e9.13.2026.09.29.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:20:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:20:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor
 node
Message-ID: <bjtvryroi4ckhhlhllaarccyf34uxllmfqwt4jzchtrhwqnuub@7vuypzfxbf76>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-9-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX5ABicdlu1UUv
 UESGOEjMQyvKsJl+PTmnOdtFp1h1DMJPPsTj1iLUfZ7OqDwBGpIr2RSSBYdgHbS977NY/jLZNFN
 pnTmWnA6jTd75KIBVrtnukuM0z/Fktg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX5ZgoEcOwv2dD
 p/Gd3jn7+m9u7082V9PlCLO8DP/uuPvOy0rsE9mirU3eUxUYftX590Z9k0lFNhxtLzz84x8dVym
 lBHjb0Iz9AW5UoV9ScdgWNNlAKS08kunSh3YUwCLtpZGp4Kwy9LsFyWporvGwuF0AdhOd1AnM5T
 bBdrEpsxbDVrDh2nD9zqwJOaNII8T0FlNCoJR0Ds2Y9rXwKoaFq38nKkq/dA+S2nItfDnWMVwaW
 dnZFBT43nrHmMRKX3KEzr4u9wfKf4R/JellZ2sK3zhM13VNTrPI050Yxr+41e72gMSZJYZP3ARN
 15xLizmHSeFWD0Av/ol9RrlmECiqf9x43iJGNzFFy5o1XxUAk2UxTJN2UB5+QnqNt4pGiorVATv
 YZj9fBCvsD5SheS9fUURwBhtPnDrY4Xf9pAajaBY4tmVZ3+reXQK9MYVnLNusJuk0EOJ4gfafoJ
 FtfGpS9fg6q7zptfPag==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbbb2b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zUvQE7La0P2yE5F2ZKYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 7__nzWr7tN3Fed2OqmRYQ7dcv5AE_SpC
X-Proofpoint-GUID: 7__nzWr7tN3Fed2OqmRYQ7dcv5AE_SpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290053

On 26-09-29 18:39:41, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
