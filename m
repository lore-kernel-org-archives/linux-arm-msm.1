Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D066356766
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785848610; cv=none; b=NGlppRlxuGiq9Iu3mFjZW4u7hp1y8IQ5uSxI5vDLw1P86GslTOLWiykseWtpJ7SLp6NDZsRVTa3N7qE2fC+FP8uMX+76Rk/hQi30vTL8HPLBJZWeYuaMdRX5q5WKLlXULO7GroadJz/MvYiOe6lYy1cvc7yCGYzeLbUU0jRf2VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785848610; c=relaxed/simple;
	bh=1V4OL9uc2YgKaEpq8j3+rq7TPwpT0zJ3+rZXCwWkSks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X05uw850fU1TRzdapPqWq80yVJnYS9QPKm/SPq5Jo1ep8+dncx0IqlpOautlbe2N7hbHkN6M6GO18rECsY+JzOGha72futR94Mb2RdFtSs1SLw2mRXWiLxahMJwsJXC5zix9KG+aiNGOROp9wi/UxH9vlTlH5LQW+zEa9kGJ6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/4DiWRG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTVe7AbG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/4DiWRG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZTVe7AbG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXDxR3572537
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 13:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vvBEYX1Um4GhmzUJ4aK/c3sr
	FYJyqvPvRSQvm19rzaE=; b=T/4DiWRGsSdBmRU3gDnBp6yzVDBI/z+S7FnFBFwJ
	Q3ZFlDyTgOLHgJ7DtxJLPWlXUfaCuLYCw7Ceu06Sq/JuekIFdxXd23AnYXyBOFBh
	ncfrFh2ystMPnLSVa+6Rlg0IETmZtDm+xtfYdNEZcJYaHw+1PVf9TNGeaKj8e/GK
	KRleooS0jcdvNMUNWMxOi/ugk93izYCMu6GUjaVvBeUQ9rgoFw8WzXScLoblCLcp
	BcEdOmZ7qz9IpzldoKM6ab7WrQICupcwl3QNC3j4D6rgtdLW2CXSmmSUzS4bItdb
	/fDkBPh8QLY0p7lGJTMeFfRPD6sT3Hz4jxtUZl0PDv2Nbw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2sykaxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:03:27 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a3d8ac77e5so238927eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785848606; x=1786453406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvBEYX1Um4GhmzUJ4aK/c3srFYJyqvPvRSQvm19rzaE=;
        b=ZTVe7AbGWvdrm061SO9ioaYk3HHq1R4diGgOFGAvlXFUVAu91JB3QMkN6gCduLgSKO
         W2vhqx1Hv/IL17asYLPBWK09XxsH1dV6k/IVH4hsnjudkAizZMwEYgksKaFj502JFgYu
         o5z4vTHnRG/bV2gRPer1US4cjUI5E6maFI4eZjmj7Urwjnv54qIXwyqneP3t2zdZ4jt7
         KTSjqGJfeglj0SOiFYLxRBwnF3B8xnNFoYKcm5uVX8XlAW1I4Du8WhYOcGma5tdXuRyF
         OA31XMR/jdTGrZO9ijSnEdTN9u6gql73WZVPzIz8xkM+czV23TIydiv9aef2KrSqnRm3
         pyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785848606; x=1786453406;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvBEYX1Um4GhmzUJ4aK/c3srFYJyqvPvRSQvm19rzaE=;
        b=KrN67CvsoXzZCr53slNNLeJ7+WUu+16vzuWBtHRkWnMQ5ksSomrz+qLLCx5SK5n3k8
         4EUa3g5X0GRgegbDUFLlcBBmlzIgq7Xvrm4ro+xin4yyXs2wrXL0qZDtBa3+UBW4NWI+
         73+H7NQJrl5AH+MzynCjRuaYRjN0Z7rFJGpP7ce2WUTImaF5cg8JDaVjSrtwGyRGmPQz
         JOmRJ0ZHtSKu4kEErarC4VqptNXWRnyvkAxjsG74h5bWaqz96K2KpUo8QI9lUa3XCFgg
         S14oLUU4vYwks1upx++i8KanpmEXsJMBPnulvJyWF77DcRCvNj90hRaVCE4rTA6Z1k9k
         +pDw==
X-Forwarded-Encrypted: i=1; AHgh+RpB6vZHWJppvf0uXOO5TRUdeC25xuuXB4K/ZcqRn6cNSDwdZPube3Y652Iicm8/RfbPIChfTTzLJ6YXSHIe@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXDEW7FKcE3UoipN2ntARuNVKHeMrhb1sUyrOizV34iuYpgET
	JdKuZKlkTz8Z0jjec2DBOwfoZNl2iXHBKyHQ1BU8hMRIAeEmSSUuZZeORUEky1a93CuPbyE888V
	1124wKCgpStKgmpDeLmzk8Gw13sg8dtx8uFNpr9zGv9ObTUhOgWZFlpoquzhyg4Z/0DMu
X-Gm-Gg: AR+sD13AlRmjYlnwrqfCWNp7Hnbrll9LYWj9EB3N7WNTPCGd/C++b5LTjPV2C+tuoJu
	Z8To+9/PxUWOmy1sEEjeuj8ExDrhIbzw7DhzIbd02Yvrt6XOWjNyL+aAm1XZS8uVBDH/qMiY7FN
	CtT1OjC7n832yI2DkbJI6BC6/LKF0bCAoL41zvlTJfvnWJ91dQFKCb65pRufBDKeSh9cZ6fPPYq
	gZABFrByQcmhhEsorLWtFnZbYt+j79jWYQBQOg2L7r5sfMCO+BJezCOPe5k36VN/aSDr0R2lKpE
	LJkKxum0fcKALTOOSrWiLN1upUe2eaDO6ZKtcP0rCtb9rma0FK8LheygDPIUzN/DQ7/xFbGDdcD
	IgVBMEdNT+r/zXw==
X-Received: by 2002:a05:6820:160f:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6ae82b35c55mr4022196eaf.21.1785848606377;
        Tue, 04 Aug 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:6820:160f:b0:69d:7fdb:3416 with SMTP id 006d021491bc7-6ae82b35c55mr4022137eaf.21.1785848605795;
        Tue, 04 Aug 2026 06:03:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd88c8sm100969035e9.7.2026.08.04.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:03:24 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:03:22 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Correct white-space style
Message-ID: <u7hvmjpptzqk3mzelazrxrm3mhk5lpryuakhrehfixsrvoreuy@kbijxhnp4za6>
References: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801210343.383834-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71e31f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=d1Fdhz7F2SYFlaUOAXsA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfX0oeLMSjKjUR3
 cUD3y509QfnPWyZQRwLVSUkQyRIH1+kQY0IyzvldozIgg454Sua9S5wIlL4xjXPf0ntoPYdrxG1
 RqQioMl8n0koKosaoQFlhNqE/Wrt70o=
X-Proofpoint-ORIG-GUID: O4NJNNpN9mBNDNLdSvWNWrtNuVD5hNCB
X-Proofpoint-GUID: O4NJNNpN9mBNDNLdSvWNWrtNuVD5hNCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNCBTYWx0ZWRfX4YQ7rP5vDZhl
 TzDg1Kw2Hgm3KKnSN8AR0U43ad4JQn3Mh7AMMpWOO+RKnVww2e/qMcOywVWEZ4Rof6zVY2Aty+t
 LAaRVK6PWsKSk63lxw92jlTd6wBim4amkPOEYsK75Uj9zDJIPjp0QvXWNjpQ1q+qKAp1LIuWZdq
 O7x5R09fzUtu8lpsdQ+hGVmAdyk1RbmkfAcJVzDwKdJDUF3tn9g9M67fGGevylQIXc6bvz7kjxt
 EPeS3Tp1oo/obx/wn9XisYwVwaQDW7QWnH28UL7nKLe9l2grpBdm4MgCSlGet3X4gAPHo2ctF94
 /nH0saXGGC2jXn2wZfJpPK7g2IkPpwXRg7UGjTmekeODwnAtqiLGitG78elGs8xDCLRUS3jFJji
 t0XBJ+CJzRaK8IyM4SG5lmChxlR7heBx+Wmjn2N+bK1GDlUN3LQb3+A6YnQraJS5oLu3vNOj0pW
 sFi/Sfnp5VoF7Cjh2yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040104

On 26-08-01 23:03:44, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
