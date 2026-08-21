Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8C1F30A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787314593; cv=none; b=DRquIYq8YzVsAtsprUdyTf88jigNQNe+zhiFkc0DJrOoOL7QQvQW0CEAy8VKiZ9lm0pZdn+XWZHJqqlJMNdpcX1s9MhvDmhxMeByQlXnjukxdxHRjCZvopvcB6tI+26nnw5/PQgOI0UsUQRyp7aShmTtRZq5xQ3z3kNFo9wfAho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787314593; c=relaxed/simple;
	bh=es4m+wmD6O0W+VN7wgQ8sffnaTdgYhBLh3UIN2laXIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T117x9qhmP99qx/BFExcovqLPcnF34pkJYMNfRvUGYnOhiS26Z0SD7TIcRog6MeIohgKi5D+vDnZQw91Xrc3SSvGZhVG7UQX1GPIc1YLaZwGak/RSX5KwD8G1GFNa12X7dboJf9r7eZZAG+1nG2NbJfEQEMTdRF4j8yX8zH75kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEY/YKRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/tTn8+B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEY/YKRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/tTn8+B"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LBq3v52654117
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/GOHaKR3RVBKb7RfCMkw1x2U
	2ZbnpAPQz3ErgjJAqYc=; b=pEY/YKRWaYXsc8/X+VYkCLE2o7iblD0/zIvHooZJ
	/HNEwZGAPe0zXvDBZmWlrWjfwcnXRyHDrV0mJNkI6bs7TgzJjbDrOiXzU7VTPdUJ
	VjHjvfRQT0wsTPiZrePTrQvOaYQO4uEawhoMH3iNw3dMfy/fsC7BQiuP1EJqYUmk
	1btyqompS70zkRWORkgHFgKfXqMFs7LTRzISdeAiuWH88eIpWWM7Mf4lxt/f1jyz
	U9bW94BZYA7UIbF0pPNxresqRd+31KeJen7tLjQNMWShcsWP2z+Aw5z6hVO8WUiJ
	d1gR8Odme+TFdeKS05lxRa06elbdxTu1m6+qbpKbXPRQ4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf1eeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 12:16:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so9699331cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787314587; x=1787919387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=H/tTn8+BDj72UkeKv1EZdzGGsAOaYi0A//xHZCn3ZKW1iCSKdYndca0/XwJL7w9eId
         cFwnN+bTRWYDNQRgg6dMgAh9XPrsGu+FwuylsBXO5uAmDX8Gow4xfrv2M4GwPKv8xvij
         gYTTE0ZMI9OL4J2rR7om28VI7DrNeRi0ycKPeCfcrcwvua0kBQzJBlgabDVmmjqUM9Ez
         r8ejO910ooKGplaj4J2/34YyIGM4PuCku9xmBQaS4ub++a7ijONBMJVKRe5ZvaFag9UC
         xzN5c9I5SaKqnPrJ0x5w8mQ0QcDJ/p2cz1eZUTvINl5OsREJk2CnmOUiPeFCSu7ZOe0c
         Eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787314587; x=1787919387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GOHaKR3RVBKb7RfCMkw1x2U2ZbnpAPQz3ErgjJAqYc=;
        b=Rrwedntpx25PgtMMRwJCTPK/yp8TEuI+sjI/z9rPLu0/vjCRaCQXvfKCowbsXrud8i
         FWQp98RooEMS0M5IhbEnA3abgjDGuNoQZ+4kv/eUhDj2naFCCYj3RtaSMZVaw7E20Ak7
         D7w6kt7ZU1NQrVDgcqIaGQMx/StubMNUKx82s1KIOEZQdsBHGNowAlrOpJFP+L4wTf4z
         gIIPxLi3HbfXWtsg89HcsUUDoedxG9gVtcUxYvJNQkEVNecyM2skqP8lue2G/dbxkxDS
         L6owWAiTynXHJINu/5aU10vr903Pa5oJeMwBKtHriXudWr5D8KAtOGIyn0CWfEJsT41h
         EMgA==
X-Forwarded-Encrypted: i=1; AHgh+RrB164gKaEurDNXF9oni0Qj3rV6C5P25seeZiKCkSisTyQAJAPk/uSD8GbvY4gcAoDn89k92D/ptx0adL7O@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+R81xF/DGZ7LOQFRhVuFj/lMCiSDP7aCwTbk3El7ierfiuJN
	mcwCfwTiLVoCo07QPy8tGFSb7cNKh8QP4AC22SBFXxtIVfjmNbJhymkWbk5isOhwsXkqdTfsnbo
	POFJ2l4mTXrAJ4yRHdE+ZvLYRJOuE4++mfSckU8J7oYzWLwWdclK4WaWF+sPnzgezeRGy
X-Gm-Gg: AR+sD1250Y/T/YJRRbk1QpK+XVavcN3NalOa20tKWjjX1zS1iszWPgSwggnLRpVcqv+
	ihBoNLZBjdRy6unPzdYV0tlxX9uMXLfaw6VdW5asE7R+wVra3s9ap/aeMx5CgBvhhMUx9LWs3Jl
	MBHjwWOrsqNKwHxP9M8purBL3gCglY85U4/bKh8aDSQ1Ay0Sa5PSRVE/0x+Jr2XPkfuoRC1MG1e
	NuedbANBRtj8WUFu+nOqAKRZoPUWjhFVUa5FVFtRPCuk9LK3hjFCHKizGVHxO53IztMe10EHYCM
	HnQoQ0EgQECbskQMrQILH8CxJbRave1hXvh9Uke9NZz+h8tTh+Is+WNzbTi97iHzfa8+Mu+M2HD
	CW2O0sjSegAKIOOM=
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53201361cf.34.1787314586769;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d08:b0:51c:92a0:b2ca with SMTP id d75a77b69052e-52df5a5ede3mr53200581cf.34.1787314586141;
        Fri, 21 Aug 2026 05:16:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b094c4sm471695566b.22.2026.08.21.05.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:16:25 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:16:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Job Noorman <job@noorman.info>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 touchscreen
Message-ID: <3p7avlj7fo3f7dcuamznmgzbfxiixnsrvq4qfma4f3p6jitikx@47ho7nom5uf5>
References: <20260821-fp4-hx83112a-v1-0-474941bd8860@fairphone.com>
 <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-fp4-hx83112a-v1-3-474941bd8860@fairphone.com>
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a88419b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=AYr37p2UDEkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfX1jt5tMNE4S3z
 NYsET9A6RWfBJGw/WQ5M4EoS0X2IejiGw67rJ0hptzeF1/D4TrxMDSD7F7R+YgeoNYY1JiVKTmD
 u6a0mWMUYbJ5twcvUq6pxpy7WHocRrrBKkIKMr/Nx1P1GHOPNs4CiON+3sY0JuzY/Knj4rjLaGi
 MtKY2Zd5KLgZ7oaveSTuVA1sHABMyUT97W0oY9fzUaw8lkPzLnQa3V2vP2Y/ucVOBl75U54vQBZ
 cnrNJFbSa2xqINgrd69ppzhK221mimulHmItQVQSkIQP8sUDXWQvmsXW/cjKrzpdavubQuTfqGM
 AadRAR27+qbJN3f+jQ1a00CKG7Q6hmwkqOT37bDqpdoIeTGuPZVx8FDem++iMYEyNRYfSbVLW2+
 Xu+0YzsfXj3K47xdz2Gba+NZgkCoMraJ1wsRRtBGIRGCKjXVaDmcqqMzoO4V/AyynvHVA6ynXak
 wp/uCm0eg9mHGWUSM6A==
X-Proofpoint-ORIG-GUID: em6Kra5K148_LtTWKHlbsy2IFISizBY-
X-Proofpoint-GUID: em6Kra5K148_LtTWKHlbsy2IFISizBY-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5MyBTYWx0ZWRfXyvms8povz/rr
 F2UoA7NbuInuRCjl+5OSVRfhx1KMhUxlDkDTHquNDBPtgQEJb03ABqPOnN5mldCI1G3iXfZ0iTd
 ogD1yXpt/sB7aIPXz0KbCQxFG8+DoHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210093

On 26-08-21 09:12:20, Luca Weiss wrote:
> Add a node and pinctrl for the Himax HX83112A touchscreen found on this
> phone.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
