Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461410;
	b=0Kn3SZOp3JihFszAalSIWn0HKc81J7+fcIk/8PS9AStTBGmaYi6j5UfNA1xQdQf9/1pQ
	 2PTSkI+YUhgbLeLGEkmqPVgY79+meytg5Z7DwOe6nIcLna7P3bRBsqaKbcbIEIQ6TJH2j
	 aRBPAHRHCFiHH7svKjRarpnvAZ1//wuQOOz/RiRwWaThCP1fxVzlKxmuqf0fsi+g9rsOs
	 dY4NqMeyAuKR+amJxI/G/HwypkgvgPurueMAKj45GBh4FYd2VFcdbJ6wIMHilUwfEWayF
	 w4wguPbG/IaOzyKWLg3nWAk1zb46lN/WzLfjQj6ks/dNLTHVUzslTvhHYELQVPk3jvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
	b=BMMfBHJA7N1MmEVY88pGz1aTDDwM5lZQVt9XUIo9JXkz11CeSdT34IjPU2YT0wxC7A7w
	 U+UEdJSsBeXn5+z162E15fAWcwyFHZMf2s/TWKgmoWLgvmnqfXldpztaBQPvU/WguDxFg
	 mvtVF0vuO8Fr7egBhWeH7rpwIG8rE6C3H6FUlEVijuq+OLaj1r3So444Jq7vBwq3uI3g2
	 e8KVccH28QpcoWLCHW/RAJkMPVmr1K76JrBJ7E4vKVQhk7OcTuqQczc/KXmxOaQodYJrY
	 dNQM230oW3QTuw+gd3i5DjCHz5Fkwm73WuE+HPHhhP37pB6LhUl2otXMPIjGAi5Y8iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD2606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5DD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l2DACRBO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2GXq6sk
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH26l3475189
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iTD3QrTZlVtkdPEUbDHvJVFh
	rOqBKwh9s3utgL/EWHU=; b=l2DACRBOH2VnI6FVCXclKpIqWlXSmnHu7cRyqYWY
	ro7RZaAkSfErzWgp7dNYovNDQgNTrFTsAsvpcBXjq/V5ltRB91TDnVWjL5NQcexi
	Xz49ZoYFkQ3v0ml7zaDzOLI2rpWL9vj5OlDCJeXkEVObWyCqmNqVT+uFRnmm+qTR
	r2wheBuqK0YGs4cJRFeEmfZkDpBoBUaZ7OmgSCPh/OgMKinMsPFXOH/102Z2Wg5w
	9Z10UuBn8Ii+lGyR9ZjKtumBgBYygwfhDp22kt+awZKC8iOVbbeihkKJAtnYU4cg
	wSdSc2xGmpvMJJH96vTBXnwtQvsKvr/hPSh+6+4x1lEhaQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tqju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:16:48 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b30ffeb2f5so51124087b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461408; x=1796066208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=F2GXq6skIZACS/YNLBT1jjTq9FI9u/Th65Spg7NHmpuznzM1VJ5hFfRB/vNBOaNRcS
         MU8wzKV+YRZQ9O1pf6/57SGyK3VylTnTBVsZDBV8ggrsgpq1BrTxdNPV7al1OytrtMM6
         e6effqIXWwksWDbe+yjdwJdcbWyUuuHUG3sCixV11AizrBzxyitb4D4QMHfc/Jbq2GkE
         mbb0ntGLaCIounbp8Y85whQLt8ENiczB6ocjrLvrBYc7nXJyM6O304JtiOW5RLlFIc7q
         f/hf/ZN/wEnA5gE4US6LgyIcZg3DcJLRs9Zmko8ta5IfRL70CNQI5wFLe6qmbntFdcRB
         RVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461408; x=1796066208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTD3QrTZlVtkdPEUbDHvJVFhrOqBKwh9s3utgL/EWHU=;
        b=qek78SHoJ2TUkzEeH5zqlmQmf57Plgiq0gcx3dX3xcoQUXOsbFMqB6JKwa941Vky26
         WDXCXX5NfEuUdTRV4tmAIL7gjYOAz1s+N95MJYaE1tf5+TRLJnkMtaVakOxmJ3OM+UI7
         XeM0q2/sMWwhr/YeNSM37mhlqTzR97fWPcdp0R894wZp/Sad46gQkhHIN1U5goP6Gvhq
         h85HZvIdsJeg/uA3gJrdxQisiYTyW4bCRIiEwDklZzNJRLyjfQgV9C/n7vLopuJr5pcq
         LqkjFj2+AdmTWeB1mVHmEJrMD7zCQAJYB20cdvqVLAABRfiEJ4/pfqUksgOcVsySI04z
         d/dQ==
X-Forwarded-Encrypted: i=1; AL+hErHaDHfoNtW+H1NMOqNu3TZW+NdIDPy6NWUx271/lvXTNdrsw7Ki5tAggolM+ob/RU1qMoElbg4KZhgI5wPD@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xfn4RkITemLkQOezU47gDscdZc8hgotKY2gXneURPB79w5I5G
	GLUptXWDgBhA2PWPj15URmv3c4cInXdBPIPUVyYHmKs5rTnqLI1g391iZvRObamstWiIgFueEhN
	kXg+bdebtbjgJBZbsLDwp0Z8/XoHRnNqOKH/tICD4/CAJm9rfsOxO8NG5uoxcajCOFPhg
X-Gm-Gg: AZFdTZeGBndP4sac1cz642CyjHk4e/sAFUWWXHbb+5n5DieCRS4gUVfGMNAwMt06Nat
	ZtnlbovAeBQJuD7TqLKxnTb5wYy2KtwZSugWEgnyxZIO9e4syAOd8faHtMYtancARcGLNRD73aq
	Qe8+0pFSVelgmT62PhbtJuuRFq8XYWWs1hrCjo8OL+P0hFczsxe/wOOMOZNZiR+oyHNd8cnbyDZ
	Pmouqrwd5zkAgGyK/xcw0he6/TqhEauNaZ8xLwDdqlw+AxOX9Wc1BVn+MFO7LdVMXjkltIpWqMy
	iW3zJty5AslE3q3OPIHS1odGrX9ttImIGfxWGbbXPr3Os6nUfnFaW54aHewBnjU3rxIG9f+P4TF
	W2CvDU4vw4JptqVBzcztv/NpJmR/HeowfaDiwkwOxKrndH6HcvcnP1SD+r3wHh0Ox
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662577b3.14.1795461407743;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
X-Received: by 2002:a05:690c:e1c8:10b0:8b5:2fa8:a678 with SMTP id 00721157ae682-8b52fa8a72amr25662367b3.14.1795461407044;
        Mon, 23 Nov 2026 11:16:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm23434678f8f.10.2026.11.23.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:16:46 -0800 (PST)
Date: Mon, 23 Nov 2026 21:16:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] clk: qcom: gcc-glymur: Convert USB4 clocks to use
 phymux ops
Message-ID: <6hypfzcubivolbtygk7a6pma226yzdqwurxairyeomnpexlo2i@rnlvijyghav6>
References: <20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com>
 <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
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
In-Reply-To: <20261123-topic-usb4_clks-v1-4-531ab5635c03@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b049120 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_3OWXpHg_koiZCJ6kicA:9 a=CjuIK1q_8ugA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX/IczGN8wes5E
 bJurajRHC2kGBeWO9nJjLdQdrx4ZkQi1GF9UDIpUVXXCdRekjE0P0hRNZyzty3HMh4dgoctZCdI
 KG632VIXmSX5YPqb5+SzspbGUGyPY8VB/ZQ0Cr/GaM4BYpKkhJBwTVCZ+7GexNqUqpMpFegsbTn
 tu7yLUIVEBJO1DjwhOCWVk2DBSUPf8slmGnBgX7dNYGbWnqkENIYuEfzqC7v0WyZ9J6oc/PAIUU
 df7A7kL9PDHI5JLON0R8pHBzJ/jT7D/rqGP1iquwCHhziAjbwDGWHkvQtAHapJMKZAKAWmOeb2G
 Z36obCFBjMhVZCtQU3QOw2agGf2zNZuqvsxL3w640Sia3ulQGr2oSPZd1fa/JBE4zj5l58yckV/
 BYE3WG/G55ux4Qg0Eqh0E0C+HtirYntQdwV+PuaD0iDlo0me5e/vNCEmO5rXX7V7KdNTxbKvaYE
 rknay2FbB8Ych0L6PrQ==
X-Proofpoint-GUID: zWOEQARrs-ViTKEWGI-0xfuR71EOF0OC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+BmPpru54zOJ
 gekWTMPLefn6wRNgyfJ2u0cuae285cS9w9hAJoPRIOpxJx9myrVkQvyN0ALjUS/ZCHUeKrxdhhx
 d1pKjbS2QvIQ3b41yfq8q1612PMBlik=
X-Proofpoint-ORIG-GUID: zWOEQARrs-ViTKEWGI-0xfuR71EOF0OC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 19:34:34, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Almost all of the USB4 clocks fall into the "phymux" category, with a
> glitch-free mux switching between an XO source and the "fast clock"
> derived from one of the connected PHY's outputs. That allows for
> running the downstream devices (at reduced capacity) even without the
> PHY being oneline.
> 
> Convert such USB4 clocks over.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
