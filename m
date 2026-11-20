Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169570;
	b=1IHeQzMD6bd7w7RKDhCVH8RXd2ljpxCDf5VSNO+zvZhx1dQhryRR3dZTspUosolPbYdR
	 jNhhPidzUoVb8lmVfIY+i6lCkdPWMud0b0+w3xCymC2ZKweRN3Q+aUKcFws+DiKVgNruP
	 +FE9+fPZ2IvYEurFj9tKKuUYxcr6GJ8zGGoikYDxVf0hjVXN7G1UxFKG4mxHOavppfb0X
	 JAUjpAtBVl7ROvYIbNSe9Yr2KpLzO/2my29L9l/7E3oFYlJf0O3fDJyaUnTXJ/IgZan79
	 3yJMmk63dbKPDfKPaYAjzsMRMnUn6EqMS5t9AFN3kQIYftdHeXb1edQgxB2oeU0g8rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
	b=slIhU0vyJZkmg8F3Is+n+KHdrVOTXDOuD7H6BpQUNQN9OGek4oOywYa41XKa7RokgcFv
	 HLMGX0qCr+d0/Nwwmg27Y3exUtf18OxxD/Nck4qIHK6oejOw/hG7pGJasElDZwRFT5m2E
	 Qm/jixPh44s4WiegP+VNzjtPapgbmZIb/QhmwzK4YkghKHt9AX6i/aXY1d4E6YdgepbOe
	 eMTVD2kryfsYC2EyLEZ/VO39IFwc1zDZg2pDwDFv6RKx8Bj0CSQJzctixVP/9r0O8sbME
	 RAZmdK26FMoSCE12P11GXGoNePYx2Sy9ALT5x+A1qpFPr+dmTQcy7ctrS5pqU3a/SlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413E606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B413E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eq1H144444
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BYSlGEtU75YElxD5lJINvAQF
	MqsMXtuHFnBFwhEDs8U=; b=OuzWMIjaj2D4CNLoBSuJtqqSam1WrBXTZkGhhaqd
	j8bdTYi3KvcZP9jenjLlPtdVrWuM7MsE6Rc/We6Q4kAbUfEcIF/fmMdTEy5b/L1x
	iodrUkmSUCxsNf5RJBw8YQ9MXCQOJFJA9IUSMJ7dMk3foO4Ows8JSLcq0bRFkSmG
	j6e/MUHhYiGqPoYVYzIfHZaE+VodUJz75OY/eVakvEBUWBh67ZuDX7kRdm5PhxF5
	8JiHgRjxrCrBrWNmPLhlBs2p13Nl8OwFgAMSGY2L8wfFOx9K/VjBHal+PAAphZD3
	iWRe1gbS2rcC5MHV6Z+IPa3Kn6NHihnqGHFqQitOpMlhDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh7ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so133537985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169568; x=1795774368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=d99DNyi9Or35O3bPY1BXPVgy/15/SwziMuu3cJIFzkrlShwlxk2M8Eq5WLNz/zkm/I
         Lc8vB3OA1eC4upVrXOLkl/rdbGWW/CzpirDtXgaB2Hrt9v3CrcFPbqdCXNejjl6ng7Z5
         Bc4bpPVR9nVs6HWOCjopP7Gu5oQGuIeHpKPRmAOUAoMQWAr44AWUGlzEUCkiU4ZHl2kn
         Bv45CI0dJV1IEs3kglFGseqo6WX5oZYju3YZOqCSwFBSmFxM0SJuf6/uKfzzFkQRbYb+
         6EMHxHYHMBCeTcZNZRM4aoP6ynGF32xgUUsGACv02dtqZ4OpYZMqXggYOCXwV5SOCvmi
         46dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169568; x=1795774368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=KBXlWk2F7MOWxkoPc4GO5HO041dXjc3/5fqjhyGEx1SB6ty61QbNd6PSJTpxKCwOa9
         3ufmJ25DsOpibjjIBIOQJlF8trvD6Xjf2bWuMX7EJDsUY2029mtK1jcHaN903FLwsrzd
         HL9N+XpivwcFnBJeaI4Uzzt5HIjxcTyu6E7gjptBX8OOOxIq/UsZ9fwqR4TAJ5mYDfL4
         Row+SnWeeC0YzGaHmweJqXaD7Q0an4i2y1qKhSgFRNytaGJ6fikjRSaaly7kDRQNSNqv
         dddOVF/nqSIr+KegjYBgRIqs61sYbTJN24p+Qe8dknN727j2z4pLdLmPwSQxAt30PjW4
         DvsA==
X-Forwarded-Encrypted: i=1; AL+hErFhrdTPysasdMJJ7aJ8Kw1xZhFelNT78CkcRO9ceED4SBglz54ZjC/UmwsWzI4fQGy/5gQAEWTx1iAEuwUc@vger.kernel.org
X-Gm-Message-State: APuU4Z8+5Amo/uV3OCujPaOWxIKykm7VnjtyOg034ghvd1xMu9BUvkvu
	YK4DpuMn09uxqzS0uVNRM55HY3JA3WSuMzYPN3E+V5e/gpjdfxkyGKSvZymkjyOJx91FHNKqkXG
	cPvY1TF5JFmVL1gZtXlKI3An7uJmlVa8AGEOlOjIDHv7xmlut4K7oLNIPCXIaibaWZ8+2
X-Gm-Gg: AYBFou3Jc7hP5ZC3qyp7OnCH4WVG2dohJi4x0+TnoR9dM75/1wmtlEuAXAye8n+m79v
	dFbYx7XFcek1Z2cXOA85ngc8yPx0WL5NA/daML7A25ggSAFBRAGh4Dvm1RzobnKCdkXUS0cQ7Mp
	JO4PVyPDg3wuossQ8Inn0H0PupARcOLBHv6dQWCYAfvrETjb9GSqZgGPh8yR6JjguzDHWCnNGho
	f6DvcMSe8+RDl75SBI9cRnqsY8t1Bq1y65vZX1XfKjEk5b8vw1jz6QucKlExhojBsDmgEcXS+XF
	oKKSsRN/cnjWdpXeSBuAEHh+8vbE95xZiejB5iZOxiXRDUdi32funIrkfssUSEJU+fu7fxlU62A
	ySnCOqRsKfBJMKx6J9E+HD8bZYhq9dkEbrn51P0gPA2tdo1ktrpycUDigaV8hsnHr
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464638785a.3.1795169567669;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464635785a.3.1795169567099;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm104468205e9.11.2026.11.20.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:12:46 -0800 (PST)
Date: Fri, 20 Nov 2026 12:12:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Global clock
 controller on Halliday
Message-ID: <llizdibjhqld7dbkdwt3vz2oyeiqsqb4rduunjlnthmhy3r3c3@vct73wnh6kpb>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX3QjqElZkd+ew
 afWXh1xwis72g2O3Z7gYZT+rk6tC236d0sekwkpTh4apYxY6alFV4rMzFi5P7pBAFv13ALNb2Ks
 FTgw8+s1pMxm8YkeTRyfQrPhmNHbtTtjHQJoUBxhCYi5buzIiLrgKEuyhpYt8pY4reQRKqcnpxh
 Uuv8fMAEuNq131l7Y5u1jdjnHSHb3mX5MljF4qgb+Mfr8RSLS4Q4rYNYU0aYOT/86Eylmw2e4td
 Qj4GNatvBVCAqAklfaRDNxFQlD8h+HxIWNA4/qk/iPECjenYc8B/FuxSUl5EFM28CkgTRlnWE4C
 Nf3PEWaiZ7M9Aoxuwis/VicwOYXKxdh3dN0QIhd7segw8Hwvlb96oH2i3dPEH2zZTSuwp4Hj9c9
 FqNU6x3LP1O3NtHvYRK0Pq6vkzKH0vJ2SH/JzHfP4rt0UV8Z18+/dgk2t2j0XANYJ7ZB0o5mgA8
 4SJwOAP07EdoP9bVFtQ==
X-Proofpoint-GUID: PMsHeN1bL7qIhC2G_A-kC05aFAngQaY6
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b001d21 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QvFfK8P1GQIJS_-KitYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: PMsHeN1bL7qIhC2G_A-kC05aFAngQaY6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX43VgjS/kK8t5
 UBoCZjE2+PlOiLWDv4FsCAFvf+vtblGFkWlamo4TSV8BRgVxcvOO9n3aFaP0f8tyF98MSMpKYuD
 3cd4z/tifeVxiCg9Rxks+iSJyw15hUs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-16 21:24:23, Stanislav Aleksandrov wrote:
> Add the driver for the Global Clock Controller on the Qualcomm Halliday
> SoC. The clock tables are based on Qualcomm's downstream gcc-anorak
> driver, without its hardware-control and HLOS vote clocks.
> 
> The eight clkref_en clocks are clk_ref clocks that vote for the QREF
> supplies.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
