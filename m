Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625725;
	b=ELehoze1jJ+hq6E+YKDdx1UKjQ1eCNFJuKUPqYe41EanJ8xhIfh3KUjOb1f+eVBZaHv8
	 WtHFjjRgC91IZRIBGqiniiRBDq8eYdOBCHjp5ppMBk6L1PRfrmWx1RQHN0U67CD0t9fqH
	 KQfjefBA8LYByFv5+Fhamzm0gr2wBsILHtyuRvXUH/slyfbymH+e3TFlv6x7pRWNLX+dZ
	 tZveyMspQFN3THcJGfgDavW2eLROwyy2272HAOPYZduaBAGygIxVRUCfzJtzelCou8Eol
	 M6XnKMF+JAPWnqdzUr+uRUTS54Rd+HwefWEh4rY/p0r8adNn9q1ocqzSydTvf7FvQWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625725;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
	b=1Ym5pG7ADuwOOMhTWgxIkdUEzb2M0j+/NZ7bFZu5AjdDvjaDbHgOgdWcOJ2tXik553pr
	 +OzvazoioET50ClSEAfLziJ4kxGPgpNaBUNY+aR5sFPLuciijTbVl5z0tAzEpVWipN5+j
	 H5MXs9mSwEBT6CWoVJ9Y3am6oXHiiUuMuJUDSmekB14pA7RW+RQIgHdXCWmg+j9z8iGHY
	 4WYa4hY2H5IS52t5FJ5QOkXxR5q+Q0lRBQ/3NRGGeEK7Ws0W6q2Tv5ysCt8zcF5t1yUrs
	 PmY7jf8pcRTYiZ7DKPI3mrNC9tEiYWT7jsbQjiB+Q+NzgMbEqUOAzPTN4D/Wau4YHBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B/dC0XIq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B603D606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B603D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B/dC0XIq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f9kD1gQe
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DALax3944303
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=90Ay6la8TU+IvwZUCYiWLuxy
	D2NB080gAWQ5QDfHdus=; b=B/dC0XIqpOw30TIvCbrrFaeOref0hss7IVinJ4ch
	bFvgPMKXhVgCOWOvgGBdA++EJ6oVWV6epByqD3fWp4FqUOresDL3rpcEWJVClUKa
	nzrYlQj2wtix9isgxcty2IAY1/rSLN7y3g1Bs599XpYzdXJ2PUfE9PxYcOWn5BhN
	NWq8SSEtvJby3zpTxkiSfjgYQXvjUKhloOdhpIDZpIcVzYaTxFDUENQ3FvoN3LPG
	z6OliLWDYFkiI+zFTzj0ImgVVc/OVJTiuOg7C+dLoITPmM5kpE1TT3GC770oLGSn
	pYNYwA5VLxqrSHrQS+AWbUoPpVOibvmwql/5bg/VBDZexQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9935-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:22:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so213637185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625723; x=1794230523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=f9kD1gQe95fzg7MGuelyQxBZwYbuMy6lsxRiXlq5YIShefsaGo8/o+QfhZZFO6UJZB
         rBzic0EzUI0Hn1n62zV6p9EzNmnEZJDrB+pLPHF4Fr7egzSOua1bxrEdGEhxUMqHF0ax
         l2SaJunbpajcD0L3rH/SwUdPeMa2btwNai3v+3rVlCtIaty8TE146yarV+pym/394OpY
         K5R4OnznBXYlCxHVnx1wkajYCgkkMb4SFFxcrHXYvFUuTJm9HqlzoNkIFiruTkX2dZR7
         rg3MMdF/uIGXS0HifEcNgI6XmhbjwXGIHDd0KBuPniRcJkGeilnHiYUn+CbFVUeSsi16
         N+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625723; x=1794230523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90Ay6la8TU+IvwZUCYiWLuxyD2NB080gAWQ5QDfHdus=;
        b=Naevbv0ZpCAXGyC36IkN3wE+4EVCAjwqqkd/k8oV0AFC2nJieO0xyyxZcR2R5Qccqt
         bE+7jxuX/XxLCHshrDzyQk+YoH4CjnWxBs927gex0Xyg8kU1Y0v9MXjCeCact4VDZt/l
         kNkpdQRRh2G6f5mWRV0OKB7RICfpE2jgJuePN/tj3U4iPieN0JpFXRrnx4oBtsBk1uns
         redFNf9stbucmSRf5IJq8tSmlH6sBCvSU0DwYr3F1K8FrwRjUOo9LdCGDcf2zr684vZw
         OOI0LYwJDM2/uqAmA1+ab6hDRiuuX1cR96i7bB/j9tyS4cnf+fORjAChzX/8enMZLY6n
         W6Qg==
X-Forwarded-Encrypted: i=1; AKwUvBx13ouSDcYjkLczUtTCEPFLl3XEIuaFF8EOA9GjMQ5eaBK5yVwhkpSk/EjnGGKD1YTlTIV0xAdFiJIeqnkG@vger.kernel.org
X-Gm-Message-State: AFq9FYK7D6dojC2j+KhDE8M2OEbHOicSu28mzMVhG1YIfj+d7UsydgTn
	H9H+zADrRdVmsLD8N3+oYFJWxl6hijH3xSArKX12rcI+8P+wB1zSdndz7WvAM+kPyfZt3n/Zp/w
	jqI1z5aD63yKWuOC90hNxHngFk4hoRSUA5DeK8qII4/fb9vUBDRdV0ma/KXdiCD5RMeC0
X-Gm-Gg: AYBFou1q8T/1aSbB+e87tpl3pe39oKhZwpfYzWbErwejvVnC2IR1tfLb7hw61tpTTNx
	X9pJKp/OELF9pO18niAo8RYekAAdi1I4GmmJS5mxAR+hIIQhSGJtPQTPVL0tbIuyfHVh6i6huk5
	FyHaZe6xdFPd5Itz//eBWA5NUQ7IIT8jeIbpxYsLCgXYixLNVB8FR39Z/Y790N1jQNSidrxGvrL
	3n2m3arsfzWMkny2rxV+dghiFZce5VSpp+pwwXRx4KieLN4EMKaBv9uSuGXI8C/4rWdbH0Y6UNG
	MngzEMFVDqPj6Ku7UcVpErjBNNca4215V63Msw8Dccz7ER1nwgFzK84CwRcC3H4LGmddMaLpi3a
	wQvKVUxiXuQ5M5+cDrxobAmCArPiu0AO0iJB/hIiKVAUaTRdlQx5jP4RIrvGo3Fw=
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603115185a.50.1793625722460;
        Mon, 02 Nov 2026 05:22:02 -0800 (PST)
X-Received: by 2002:a05:620a:25cf:b0:93f:3120:6c7c with SMTP id af79cd13be357-94421799b6bmr1603109185a.50.1793625721709;
        Mon, 02 Nov 2026 05:22:01 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf396dfdbsm273630695e9.1.2026.11.02.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:22:00 -0800 (PST)
Date: Mon, 2 Nov 2026 15:21:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8650: Add CAMSS test pattern
 generators
Message-ID: <kmijrohgr5lbkg665hnini6qhz2a7z4ee4croaxlrut4dtpdj5@xugb3sxfgmri>
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20261031112203.545319-7-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88e7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ABvto48SYsrZWTe_A2YA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX0LdTBlCQm9M3
 BdBmdfJe5KxazfKThpGvsvwTh7xJm66BlD+51aUhtCxUmZdtpLIigIZT8H09hjf1E/IuuK9T01z
 4O97/aVt1wy7e6as8sFQzCtnBTkbcVZ2yeXxzR9k2YW+iPY0DvU+1P05O43VYi0NdlEenvnzULJ
 LD+dercLApsfWsbiewApnLnHggTkilchB6Fh49rZuXfpYBsKGV8INhyYvGGGnhENHtLdqBQgxpf
 pBT2WFH/VB9PCTaYNdoDJ29kDjfgqaQXBvVPGlvJP3jygKGhsCoMzACgw4s/n5/l7EgpzibWVfS
 +qBmNeEo2FC2bdepKpLGC7ySUi2FbcqM16U0WQZBmtEx9nFoT/EqNpGpfC5T0Gd83RYMwGOn4Yd
 JadwfMDpzPAP5dzNC0lgOwf8yv6kf+zFyFeIhOiypqGbAe/nE+Czvrwbp7NqhznLlm1JfCxIPOy
 gKJohBXyRkpqCaNpRuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX7Y4jrRu/Oulk
 lMkum8onM1xkWeUgLtZnm30OgmTPrCumzktY+LtpP8FDTpOmqMkTBhrRvFXCtJTa/6VDOgdHrHR
 j3t7XhLaxGmg6b9ZoWl2myjV/B8MuIY=
X-Proofpoint-ORIG-GUID: SrRrG4fwmDEBJaoG20maVU4pS89D3xUQ
X-Proofpoint-GUID: SrRrG4fwmDEBJaoG20maVU4pS89D3xUQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053

On 26-10-31 13:22:03, Vladimir Zapolskiy wrote:
> Describe register spaces of three test pattern generator (TPG) blocks
> found in Qualcomm SM8650 CAMSS and the non-real time CAMNOC AXI clock,
> which is needed to get TPG output written to VFE.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
