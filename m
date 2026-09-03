Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A442378D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431130; cv=none; b=oEw70PEJUo3fewkkvFUd74wF7nXiWCZjrN/p+cxIZ7W97uSYnkBbwNLTA3MKJDvtIqUgGYmSK/l8SoKSkSMwJQ+u6Ucu7E4LVAsjeqzq+tlV6WwzKLCzfyvOLtR4fj+DK4g3kGYtSBWZmSdK7hlEdyqsKAKKSPZeypHHS3synqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431130; c=relaxed/simple;
	bh=j8cTvjNnfSZmwz0eJZZJYxv6DG8sXpYymw5e7ysyM4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEbEvdA6eLCohqawBtgCWHCjWnWKGEZ+2x5LPKeyXMDMXZDL5K52cnUW2TJ26yIT7PSqs8aXjis7j/Rwz5xmrWSpYTSjYCWzljddEAMtfOhwwF2IcKzfA9VC/TRxlWc0ojFs7rDaO9p2bAKYBoRi4tgVJnaWX/xUck+ah5ekrp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m94rEqGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXz9rqb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m94rEqGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXz9rqb1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHEVP162892
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 10:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fr5ctLjXEDfEj66Ws0nGVXPs
	zhPrUrJDK2Jw66ZrASw=; b=m94rEqGGOwB0RGzLiPKJPGkleFcP8qvazkiyG5m0
	fhXBEBLYRCXdWiK2VCQcRfk3/16X78TkpCX58tRVeGgPzp02cfHx2AYHqUd55vSr
	Sg9wlO2lV7NR7GTM0tO3PfgoeCdKjWi1bk3zXOn8AXDZQxUH8Nl6Q4/gMp6+nM/p
	NgXwuow0NlfS6du0A+qXVff/MfS7fIpeVoDZxVZPiY2j9SmtWfq0Zne6Hk4cm6Z9
	jzkMPek1S+FH+YS9cvjF0uvNgt4GZVwPo7iVsL2DxqyUdh0Rf1XJSSYyrycY5iCq
	IU3VKZgXT40uM6Mj4QX/EztWJekbBl/lnoJ6MM6wZ3hgcw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6tx02jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 10:25:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so416764485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431120; x=1789035920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=PXz9rqb1pOgEUphFGylKjexrD4ewNpFbVwISWiR5UC1hl4jYzH1zAhMeI2t+jhQ6Vy
         ZsD5xPDqde9aWh7LBzgqp+1xq95NYIz8zci3gfel6bjd5GcTgyxI7dsyP7OShJPomSwV
         AgnU8GEZ0oG4+8ROpNTRMPOQFaiex395z8BAOVAktOtXOF9TbTex3gA47Sqsl6bLvn3V
         w6zQyBujwvVwAGeHV2FkALbiFuF8uTzwXtjr5o1gbyrxo5MmJr1KXQ4B4AMAfbwgyTcS
         afehhacgDLfzBBkoZ1OwtEOfGbf8T+0KcAv3gAlNKX9s2S0YmqCprOSpCSU9nVmAieCk
         Ip/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431120; x=1789035920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr5ctLjXEDfEj66Ws0nGVXPszhPrUrJDK2Jw66ZrASw=;
        b=gsj2NB9Jpy/DYvqOjXgwAtyb2090AJVJt5u6OMpbiEAjVeSZOtErP4+gqQer21nd1g
         9B+0nE/xjugyKMHTMrjizdTxGj9RMnVNJBiMKNixrVIFZ0NQDwHE2KAyrqH1ogt9NRWo
         4nNDDPKKZ8YlP5dFEikmueWp8b55HlseOiYErE20q5RdBBZepdxj88G5kDibR1GdvFDi
         98xqA1jwXPlt1thd30Jx50JtrXtS5t1MqNan3JzMoNcK+eND0TRObM+wy7BmxNFkTuxk
         QAA3+niSxUT7xnWPUrFhpmLIF/d6sdl0Ikn5d4cOWIiAZhT+aIL0Do6XgRt4Sl/9gOlk
         NICw==
X-Forwarded-Encrypted: i=1; AKwUvBz+bkODoEBsdN/WIqHQhN/rt+E7fKQWNUOzF6wfdM41XYDFBpJSw/2yaox+zzqpG0qkmmtk9IEvTXFgY8ge@vger.kernel.org
X-Gm-Message-State: AFuF++kOyO8mnWh0Z9FILHp762AzG4aw2tTW1A68mHsKe48EJD6pcyEq
	UOMOSV/uqBUILu0VhFk9ipZRcvBG7WJsMlORZQNJXafZ+Lb/y8kfMfofzf/wErqKlVmj6NkkA3R
	3zjE5UdFYSRJxFUJ2ScbaxizCN6SdSCOgme32LGygfIxKSAwiRMTZIcbxzd7oUQzCb8Vy
X-Gm-Gg: AYBFou3nsAQjk525AOYin9is/0GP6sJ8rKuP8AA40Jh9rynfrEPW1XEUlVNRll3k8eC
	Y5rmAQmrV7aaJleAnrGoFJA50nh/cj3qEsMUvBNTOE8YfgXEDIBUbTfntHJQJDSxpdIq6z3zNzF
	zIpWFD+MaO3m6al0F+qGf8wyseVIJgn+Ppo4eKTMmYKsbyCIfSCnRVgrJM6PJ25UfUuUbXFN305
	Gl33+xEyIeH8FPs2eRCYhHv+c0FwnybsuhuDsBuM+jKwA7ywsUowHlJwQlgOWoqdPEtRj8OZ0Is
	N8FFgec+ho3LUU2O2uR/V19Uytsgg0flgPuwPYSSiiCPzOvsGsa7BeRK5lxhFBN/MGIIoT5ERpZ
	w+/lUaX2GeWvOXA==
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372664085a.32.1788431119606;
        Thu, 03 Sep 2026 03:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:84ca:b0:938:39e7:725 with SMTP id af79cd13be357-93960f52971mr1372657085a.32.1788431118976;
        Thu, 03 Sep 2026 03:25:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cf550sm12963975f8f.37.2026.09.03.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:25:17 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:25:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Message-ID: <z5rdzvlvzwteyh63k4mpkwyryug73vj7trjc5lbzutg3qznrzm@6zbklcre3jup>
References: <20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com>
 <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-phy-v2-3-cc93d2f3b1bf@oss.qualcomm.com>
X-Proofpoint-GUID: Ed2FBr3uTDExVdl3m_6P1ROUTEuBZz8E
X-Authority-Analysis: v=2.4 cv=TqjWQjXh c=1 sm=1 tr=0 ts=6a994b10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=7dPHXdr4Qe62-7ilc7QA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Ed2FBr3uTDExVdl3m_6P1ROUTEuBZz8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX2gXBXzQyiEP+
 g2EGkVpeafMHX/LZyibi/z0VJ+tiag0NDCypf4nX6/MSycCN+hUqzNRMSQWPluxEKxYfgCMcyWh
 tq3Rbep0HSkmOFiMLS0XSzJ3YYOjaghLDA0FH5QLD4VqT0F6zpqpdmFnJUsyICdaP3ps8VTYtwJ
 ZrgPXhlQGFDyU7El45B+rBWLbWK6GjweNB4oUkzSqBfFrOjRjFb9XCYIs6mxVHxObaf71Fdfoyx
 lBK602pZ8bnYeQgnO1GgCjamlIxIDqsjlmL6gp/95zzYYtGqyI2gN1giHtVONYsWzG2ytABnkQ1
 GjxBz5MW9i3voE1yp7u8eruxPb1K240XTgKb55LUhUhelS9nbREqURN2iGSoBVX5SEYOTKolkvr
 Zc14W2+FFzv5yZruIo7+ksrORYMisMKdFwFqomSXsGAE0BLaIuuXo84lbpTz0g5kjuVgkgmXn47
 BJpOrymXed1WCknHx4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX/TJGCUltBNVM
 sQhPzXkr43S599ak9rlsj9NpXkfObCYOAVpTpUgSCWUjrS1SO380iS5mPzV2Ug3+/TIfspSP35i
 Ba78bR8+gpqGOwWxoP80NwkLT4N1lO8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089

On 26-09-01 11:34:21, Varadarajan Narayanan wrote:
> Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
> init tables and compatible data.
> 
> IPQ9650 uses settings that do not match any existing supported SoC, so add
> a dedicated configuration to allow the driver to support it.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
