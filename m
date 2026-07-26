Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E3372049
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785098202; cv=none; b=YjEdoFiJdI47lYWyLV/O/E+4nnnAU8eItlOkgVmA1G+8ht9Hskpc3tuyBy5KUBNDLyj55LHGtcWkb3Ip1ijSyEWZQ+PnGUpPJx39LuH7yOGxAaTnMmhe+O+zu54Ahr9PYzJElP+rbSQaZB+KoVppO8qD6dQn83eF3gB/6rzAyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785098202; c=relaxed/simple;
	bh=y7kjeseCo3jLvRjITiUtdMe7C+PcUuDHkjGiN0ErxF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAff3iqGPKJnLmay/KRE9nBSrhdybypCST9oUvHkY6ZTvt3mQA1WDeLbzurOT4/2WebxDD4Veb2soJhXTXUF0LOGrDQYeZGal4asEHLv75E0gJbXcTBiByUd7hdpFeAtLXFTnkYaxzCfl5g6d3kpvZGbgc+iHsh/FHPh6qj51uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyHhn1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sqe5eNeS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyHhn1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sqe5eNeS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QJwHeF1766934
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dYqZc1K9+IkncN1pcxi2sBhw
	OHcVvXQdWRRUI8PWtzQ=; b=QyHhn1pDVumlhl3jbDzaK9pepn+PQ1ZJK0msTPq7
	jhogMnLLNiwiUHMmJdK225j1bjfH/5CgUXO+5w2a/Bd1FOCpd3+2gOyOLsJzlZfa
	EJvH7J6WCPzRHMBK66VBENbE97iZ2pzRxl8ScRTw+yUTp6TXiMk5w8NVQsMKMiLT
	P9/0ZJou9h50DrrQcB+f+5IkieHairxmd5bgZOwmU1/Guvd6QqYD4cvH+oHi0PCH
	xeAVjXMDCz9a8yC1drplSYklrGw1tcYw2bKIQixoWlI3TVtyY10xFtkYh6yu4FVW
	PakUJneNmMsfEPqzyaTtnQPktv82HrnlVHS0OztP4frJLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573uu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 20:36:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso26133381cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785098199; x=1785702999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=Sqe5eNeS7//3Ya71yXBqJIVj/3B+01YpwKe/Iu32ib4f7khqmSykSrsIMShm/fSW7Y
         kya80v4smdRt5JQxCQvgJgVz/7Tad0ngTrt0/nvJtAYkDQbzQNiptXjqyfl5wnMf9RXM
         r0k7+ByKn61JAwF3LcpB4rtJKWRHsp7QFDJ199A9nh8iz3j63lVFWWlkHN1yUM0hvzko
         CgxgNKbKE61QjCoedWH1+QEyNCOKsxxMawamjhsb6a2L/NdSwI+jhTZg1W070YN8IaTR
         P45hmRQShVwJ9O4GyJ5nuFvXsHBHDnKVKZF5mtvIWsx1XjJ6UnS/bnKa5z47021Msb5D
         mf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098199; x=1785702999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYqZc1K9+IkncN1pcxi2sBhwOHcVvXQdWRRUI8PWtzQ=;
        b=csVc+YnjOLj5bmPBYmJzwcehlm0wK9u4ktiVepQshEJzBMh0sCwu6dHBII1X1TXNst
         W8brmpro2en9ak3dGFRaYcGUeVCNhcvbnU/7qii8/uH97MRnuVnLR6iCve8ZUb40l9iQ
         r3lUgAFs4C3+qeNvOimaWAgHH0rNqZ0D3LsB992HAuIgEXH434XXnwOqdgAo4z1jKFGX
         XCIpLUBDe78I38W0koxCEEy93EthRtUyCrvIb859lcsxsGuQpzg46inw5wMt3zo/k1hj
         oLsv5x8nfnREa1LHqXxsZabruIlWhy8lzO/sEr0o0R3HPBlosjIYANXg4eUhE0fi/o6G
         T27Q==
X-Forwarded-Encrypted: i=1; AHgh+RpWCkM8HG3gDinF8aQup6iaIiP3u1DpDnu3mr/FVYxVoH8HyBYfMhoV0keUCzVmLClcyRKGAUrskwJHoeBM@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLOZHhSgaW0WR07yAiQYOsDzU8xB8K1Vka1n0Ly7ttpCRmEgq
	dByeWwlV4pFjDoYlKvkpDJt6PBZxgihedtdWCwYaAhTdeK6/ZTbVLtb6ho+OX7kfFwd/s5qiIjy
	tCVg/3NwC9ck1PXZdkBA4JlOToNw32CiEGZepLEKo4rfCss4+06GNmnwYrcrve94shEXR
X-Gm-Gg: AR+sD10gbxFxF/mpxDWW58TtIirPKUX+0V2AkWTfARgGY3FTghAxb1DPrE06YX+TKbs
	I3mNzD/BstrDThMuAO7cYPib3PfHA63FdUM2984ojcTScpiE6Qh8EMZqd+K+mfrAdWdy+M2M486
	WCo/6TlnBs69WhpdBHPO1kVZmH6ahK1fI46Xpv+gImdBvqhRW8DOmLWAZx7MRXu9rWGGOvjwIkT
	rJIqaWWPHze8j1/Jw9LcagWAy8KUtAMFI159C2Qq0nUa6KWQHto7jrp+StON+lSKcjjyaKCrbGc
	zqlh8HN+fMYTUZ5yfoxPkyVMVy+2fJ9/m/1tlcmu+FE/7mz4P8SukGqtNUzRhvfOgkrdWuv1zOe
	5+s+/OkRxggl+1R9UDwzoKPZoVtWVu2pZwYvu9TRXdIGBui+O65brUrZ4F062Bi5rKIRPxz1VtU
	h3/fZ/gCeRfbIYhA==
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796171cf.61.1785098199137;
        Sun, 26 Jul 2026 13:36:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8d:b0:521:987f:bf34 with SMTP id d75a77b69052e-529a8715146mr65796051cf.61.1785098198753;
        Sun, 26 Jul 2026 13:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1ee2afsm1064790e87.64.2026.07.26.13.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:36:36 -0700 (PDT)
Date: Sun, 26 Jul 2026 23:36:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
Message-ID: <izw3biesoubceggbg2jg5tvptzqvqcrwmixqyqi32ftznns3p5@74nso23e3bui>
References: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
 <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-eusb2-int-handling-v5-v5-1-f32ea6c1a318@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX3FOy3tqDRi2y
 HnyITsyfUY9hnV01w0e8n0p2+Az0NLHx85mWmtd+mgFCJ4klnt5w5qFUOcHkKNpu38mEImq1m8K
 ol17sOlsSArfLhaoOU5NgsIg3QHxlyw=
X-Proofpoint-GUID: mM7HSSaczpimg2xXq_1PzxTwDP7f7mb3
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a666fd7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=5r94vnxKtQZQamoODnYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mM7HSSaczpimg2xXq_1PzxTwDP7f7mb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwOSBTYWx0ZWRfX5OzSidlfL/Xn
 4kd3BH6GnF5JdX4NPIEd3WfO0MrKrR9l74P3ySDkfvVXIKWy5oSKis5HcBNUIELTudyBu+1/Uk7
 kLZbfUksL283DmWNskK/wsgvYaYBPgWt4B9zAgRo2t9SN0nh829lTCjl0XPlyS6mmdrr3N3Z0oF
 CaY8qb7jz74sQvHqpmkLM+pABE8L/iJmulF4BoDoFvPUIUCz6Jx1FJkfKWlDYa3ku2ov93X5a1J
 MmSgQkGvICNreo58FhwYFUqK0M9TEyF5YxX3++Kx4shZPEpDHnIQhA7s/hUBaBH3g+1En7M14Gv
 QJ5ndxW1musNLWaCn7CD1dXsltNalm+oX7xZBvV53HW761TI5NAth/xv4U/+7Wj76RhY+Qqx1+C
 qew20WsUAYkCt+YZ+qB3cyHkDwJF8hfo8zatFjwXrQvickIKTxyY4d90OsuZHJkTT76e44q86vS
 7XokEj+Pr55cu1kPPgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_06,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260209

On Thu, Jul 23, 2026 at 04:09:04PM +0530, Krishna Kurapati wrote:
> Add definition for EUSB2 phy type.

Why?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
