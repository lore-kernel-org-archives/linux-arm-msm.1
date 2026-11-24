Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531782;
	b=jh1bWB0m+l+ASmY+LJMRzPdfDI1F5bYK1xc8fVlP8kU2Rqdoyi8tqbVPYrqESxsnIVHi
	 VbHKhVMNqwTA/oqbxmRscfEyPVH0oj1IcyTE41btgPmXLUA7obSBl57Kvo0Rdha/iFfLY
	 EIG9e+OoAiZ242QOVgFvyYjin9WboidC1JFNyX36TymXuoQYiQJoujo6rAhQAS00Sce5e
	 NVMg1HvtYVLKZE3yao7yZ0Co09+Y2h7thX6NE/9WG9A+gupi1juIOur8a7Ae4llUi00Le
	 X06lHVWH+/lLlk/GtQk+58E2WeO+2EotXuCiZuiFxMvPCrahfMLg7A0YTnM/Mk9mV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531782;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
	b=1/PnlO5UugK00DfQN06ryeN5kCRnrVC0yRebBeBLiZX2gpXewB48U6KMrw2GOFYMIlj7
	 vGc97DzttiOMOq8+m7mQXgIYqbix4NTNDKaEmeLOG2mfCSTXxSNs3e8y/gGbILY6gSq5E
	 9bIY97tZDdjS5wPrsIwa3SBdNjjEsJFJVcsdRbH/xdQ9AZqtbgJNGkTlon7n64zbAQXvw
	 iyaaeYyjAsoocZkeosWd6Xxqo1z5TyppF5EX6GJYka10QCgQKHvwNaWNea1N/OJKoIYFD
	 7sh5NTu4/W1npqk5p6Zh23GrsA+y9CD/u0uGb5YQGMsvWPSDtse1oiAD7HEYDDTpSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YzfK0kjj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/kS+vuc";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F31606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YzfK0kjj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/kS+vuc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOEbnxY604287
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UuQo7p1Zr0i6ZONOjYFEjOCl
	yqfRR18CuY7SWJ4hFjA=; b=YzfK0kjjw45nBaw+BH3FSsur7171YinjshCFprlo
	caymDuG1fgpckz2xmBcNqnMZryzg7dbEp6VHmcUSyO2cKRlm+spl+2mORVpVMwUh
	07Nvw3RbRoqACBe34tDEzwU4Wvwdw4fAkIC8tkLeV4a93rM3H1oeBeuNp6NNX4jl
	2mkUF5B0vq/lS/ROExMyDZMlwPibY38/xdSgwbi1dRsq4Eq9/0PMv44otQsGAHdL
	Wdb+8nUaOrAm4NjaLo84tLnehzxA2tetlukNsXTDOOQsoHEDdB0y5HD9vDd1hAgA
	D7XD63mLEkzHTNIOsVr7GwKuyOzLJagY04rLPWDNJkRJ+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f3p28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 14:49:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so950770985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795531780; x=1796136580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
        b=T/kS+vucs1Gr1Q2pEedp7UtjuAoMEliNco6tA3754G/YbsAOrQOXiwwt2xGnGaAwww
         P9hiqGvtRp2NF+9KLW4ea9aI36ahTJGln5zamWrzxwSqCmsYOPOYURgIXDvOjMsAYhTg
         IOAOd727m/k7vaTbGLGgaMW9yITPx8OETOVEqI6eo7eD0Kf3DgQW2LzcX2J8rKaMZYfK
         yTyxC9C87nRNXAQy5g62DsLbMDX18v/ah1CwOj7DgffU03JqdwZ6ImKZqMKzoSh5wEqy
         OBaAMJXqro9iHQqzQWaDFgJwKS01WWyf2kaDzuxZvkimVJyfrNs/Xl+TkFAs4Bxwe3g0
         abhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531780; x=1796136580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuQo7p1Zr0i6ZONOjYFEjOClyqfRR18CuY7SWJ4hFjA=;
        b=bmnXFaGx4YBwUlVPYVleWEhkwDIW8+bXzzeB72hzS4CAsV/MnOM8rJbxHG0uMaAWzN
         jzdKyGwBg4WIGOABRZQ4In4Utx55rCGdiPeQcnffJ9PVhuK+i3hM/5mp5871b9RToETV
         AxZTovb9FzvCS1DGdJjN4jG20bd64chSjrbCDO1mSJsHcpej8Pmtoz72AtactdTLn7s8
         gJepdRmHvBBXr8yYCtdv+ENDWUm6A+bBBtomDBp288mSrTZMRTjF5Obq0pMNkorg2KwK
         qoK3xI7+vMcqp+gptxnNkgSUb0V7JL4w7X0KtwsimOdhPq2IUXDnu82bLS7feNQmv2xr
         HVOQ==
X-Forwarded-Encrypted: i=1; AL+hErEtS9sN6WHVk+rk+YMgzmEEALM+no+aUN5Wg4g1hTqry271Nvvu5vhWN1fTS8dqsFDFJKqtuCpttxw+IfVE@vger.kernel.org
X-Gm-Message-State: APuU4Z9fFkI6Sd0C5eA0TVHkLhXbguNXN9VeYf5kYIFkcebyjGoOyK2v
	pQNQ68+w1QK7DbnnUhZNVtF0aE4YUYQD5HpRe1qoPYz0uo7INWbAyOKvLKnvZDzCY4bgQ6BE3aM
	GhMBRSV/JawVtO41SB3yJ9opI+Bm8f7fqeMJKEnBUbpxHv+mQJFjqaVVphs9UOy4Yz34e
X-Gm-Gg: AZFdTZdrRKNFHiqg3pNZgPFg2uqUq8v8h/N+Y3j+wvmPckzyKvDsojEDpZMXut5/H0x
	ykiPgjLrhY2PWkjgDe4nThsMeBn09Q9AbGgaqd79Xs1W4twSMI4imo+Ng9BYKBSaKN5U89k0QSV
	2WYzhOXIJZ+0CcvADCBFUu4nBOoMZD4atS8AVFOxOjyvXhNrhjA8RcxfKQBedXSRO9WIziDrQ/s
	B9+zYWJ7dzm3NzMth/QGirsNJslYw6l2w3DpcvdaS9TnpqfpTtqRVyXroeV53QzXVGNbew2b02i
	9lXd8Snblrrl1eRtiHNd++N8uW7Wn/vYE+5BQPoVMke/aqqyW+TmKgso6e83k/lC3ZQ4jJkTMaj
	fYDWJe3biJFhQ30aisnnJhBmeZNQRmApcIXxoBPByDGQPe98UpcDVBpAC0InJ3sr/
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr2556638085a.36.1795531779628;
        Tue, 24 Nov 2026 06:49:39 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr2556629785a.36.1795531778957;
        Tue, 24 Nov 2026 06:49:38 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm371544745e9.9.2026.11.24.06.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:49:38 -0800 (PST)
Date: Tue, 24 Nov 2026 16:49:36 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sc8280xp: Describe USB4 MISC resets
Message-ID: <4vscrlyl7kpw2is7sxakry4ozmfq5axsvodl7iruu2pbajd5rh@5g2iyodzhx6u>
References: <20261124-topic-8280_usb4_clks-v1-0-be083a711eb4@oss.qualcomm.com>
 <20261124-topic-8280_usb4_clks-v1-2-be083a711eb4@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124-topic-8280_usb4_clks-v1-2-be083a711eb4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX/xt2fmWj1E6z
 pl7QVcUOg27AYzxQYTs/I/zMuR5VPKWb/jLJ6jUCiRIEIQ280tW0UU7KVVfgnTgVmuyEnE5t30q
 UqlhbdDqM/0itzIINz4SlwWEgf6cVKA=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05a405 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ry__8pfDzHy8IBw2AekA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LUdTefbHy4kjVp0yizDUO_Jw229-13rn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NyBTYWx0ZWRfX0ac0aCI3B4RU
 E7LTLUFNJtyeSQEmStGbKsbrwA/VAhhzfshUcpGtPVNqfCAriEvK4tjHEFCTFBjZy4yLDyKkSt9
 xC0p/3pG7n1yP0ppTBthMyPqrmM2UAO+buwplz4jTiG1NQ0HbjWyB+fP9w6BYKGY3AF0fKcokm/
 l1SKvH5W01wefqZ5b9tu7DGTAUaVRLdw4ihlQCUdmsmkB+pcG65UHHFuCn/0R1TUEXXK4euYhp9
 74AxMAvKdmOu/IyepVD0jYE8l2T3aFCXHEDQZFmQ/PtVi6qJFeADHKwvjDxVWaFZSD1VrPO+tzp
 atCpP3rX8tSE7R59Pnrk5+dFMkcAz2JyLl3WLqWudPxHTb39jrFFLFHXR/xpvJaFQe45DfX+7GR
 1BJvfWee/JxZAGUM9pdM9CTnI6X2JCOqrxSVTAZqmd7jguHF7+EFFk9iLCQeb2ZxvQLRNoMZfo6
 YFicR4DEmmM70A3B+Wg==
X-Proofpoint-ORIG-GUID: LUdTefbHy4kjVp0yizDUO_Jw229-13rn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240057

On 26-11-24 14:30:17, Konrad Dybcio wrote:
> A number of the USB4-related resets were left undescribed. Plumb them
> in.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
