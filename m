Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214484;
	b=vhVdnaywr955Fz1TlBc4/p28rzpssbT1Bf9nyzbKfiHQwHx968kza9xL2nNDxL1ksU2D
	 uyJO2TWgkC9iAj7v72k+7Pzh5iJ9A1ftLtY3H8a4oIRWWOqBOg2aTWMtGfl9zecbYBE2v
	 NR0L27LOuEvQfWJMXfcY2/G3021bo2i+5irdyWmeEIg5Q2oGwSxLVlkmnpqFnLL4WmJz4
	 m0shj9+/roAAIiQh/km0sH3dKl0xJYjfKoqe/nL+zeBBV0DsJjKssNJxFn+fokddRr3Oq
	 go/or7Ga0+JAKqod/GJEDB4+yIm1KBesI3DrNNeAL0zzFVI/Q5VgOrkoXIM9ByuKcWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
	b=zHG0YTWLMgdeaAC7CBJpCIaYSkUJS39CvMPt2HVt1FYTL6zD4PKdNBqv5EOUTGYywR3s
	 Ja2fkXJmBHT8erhSC7tYEZVti262s5aoA6R3i+z4CTkZTc88N/53a7xxbbQy1fgqU121F
	 1I3cuH7tI67xQ+ipZV7HDMW/wuZSv9HQPi7IM13NjJ5kVza0P/Y7hHnwZ7kOkvI7WsNv6
	 OPDsmqVZMx4cSlRJbHFOxs4Ozc6gDlmWrpzm/K5vec/S28zTlaIAJJ9xmPV91DRf6DlzR
	 NjcCKa5aZtKNZBHMifQ1K+ZN9Lg2eHNL75J3te+WFfeVL7VbndSieabf6ScV2Ztpjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHFKflua;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF09606D808
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF09606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DdOJy33Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHFKflua
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A97oxv43324849
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQf4RM779oS0Lz1Z3sQeMmPM
	DiOPPiuMG27R11kbwhw=; b=DdOJy33Zj+gGloeoGU0YcrU/rBuBrM8MfaDICyyX
	n2WzCtTAZ42ZIxsnzjTL9PhWCB1PMX5vHqJsEznDaayNSyOUnCL9YjlbB9DvYa7+
	SmId5DTFW9F43yVDih/KUy1TGn1gfva7yl7hZwG+46G1dqKyPJQb/E6bUllMjx5y
	QJpeYTh4xafgu8EEZI9syRbPEB3DpR70tP+h32QV5uTXiY6wicVDiJXXCRKyb6KN
	AJ/Qo6ZwOchptXmAv3MEiyh1YB/KKEx7no9iTetUiO+Bw8fGEUhlDI71D0vQV+TO
	O/RuR4wTDSHabp17rCz+bXLSu0/3vSM9hdeAFRkwBm4p/g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua5886w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:54:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ea864ee9cso19193146d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214483; x=1794819283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=DHFKflua/4A3jm3oNeCZb3tPdsTV8iJgKlA8hr2W9+5lwQ/hDZWni3GkVJm9CXjp0B
         kU+IUXejl0D1+aO0P5FDgIWHv+p8KPD8tRdcRUff6kawJBJClG0V0Utk1ceBiae+h/R/
         DMCPQgaNIEuRifJ8mp5ZVts9iaxL0Iujzhm7FRfKYdN+1HIuGjOa4/y1GX/xz5CNEUdf
         nWHCxk8ahBSi2IqbE2FBrGxiswba+ZJ58LLgVLbucGRGoSeJK1mqruPaeJLU7c+hXhDi
         kPYj7Y3AnnRHrXIzRg5ScNnVAU+b3a4OmYCPBwHxj/r7VYRP0sme0aHO//MjQvXLIY9Q
         nq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214483; x=1794819283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQf4RM779oS0Lz1Z3sQeMmPMDiOPPiuMG27R11kbwhw=;
        b=E4njz2i/otZXbylRzBNOUfHhtad9iWAi0lKVHRP6gkVx/zOVOXd/OuTg/pcJO7iNBa
         wVpJs0F+Fdk2KEPDltGV5Yv6hBBPEDzDO2wHITqN0drpwr977cQWjA6yz3WKOiFVMnq4
         Q/1WqSglxuC3Uc5f0nFnSVd3/qImz5bvlrhc7+FGeJjtCwaiGg2fkuVk2Vaoze+yMrHc
         KT0HSK+L3OoWN1lI7n0nfTqiZF4cwrhcmGcssJethmBj1vOho0vW4DxJsd/Hib3JgGuX
         zPwfQCKT2WbI2kkYy+xwMPKTywX3tnyVVqgUKO85vsBGIICfv81Lmt+0RAwb4gK4q6zM
         boFw==
X-Forwarded-Encrypted: i=1; AL+hErGnjHTBZH9i6+w0kQvWdYnSVtIkJwUu0mBORAbaZG1MEdxMs8pcnM87YAHrrLqQkAL20eZ0w9TJNuykRY07@vger.kernel.org
X-Gm-Message-State: APuU4Z/aftWb8tsXMa22Y5ngt11RTGOtsyvlim90eZx4DLrnSdoB9R+X
	f31x8qh/dojqfEZOd7lI/mA64UO9amuxf+iLvFyf+Ub638p5WvSg0THwNcEEc+nNauycBCmeRf+
	zTxBy6JUrXWyg8kOwcZqjbFRLQumCptncpZYWtaZrcm+BtsH9FW4mIcqucWQrXqm63Xke
X-Gm-Gg: AYBFou0MMuLfilXOl8EbaXl0PQQSAfUNE9H9cJKhH2d021XlWZYQllpKJQMjDYitOUZ
	rUGGFiXh2ybBRJzv5QOvpcPT7RaTEkpFt9pSPxNIsIcLXsxUqeSzKV0sxRjUhQEarHuEeTo5xk6
	QP5GePGlRvZCN31AyWeINKlg4TY0CXMHK9p+cvFEIaeWJ4agE5ViLh2WjIH/52huAV/6PAIJ9r4
	8yoG2R+mfDkjCacAdwNnWJx/dvQ0MGmvaPPjhUt/A68oAbiH5DBTHGM3P8tEsrbtCAWplYF7YFx
	ZvvsoJvNTdqsKMwIoJFBxWeWYhU2JWg+QyyTd2FBPF2K5DIbvJ3+weDXvWeioMKTocfZaH1XwXe
	kputs2GY6g8bc1s6G9sLjNVfvjDCHqrovZL5M8+q0ZMN2GsVl7TOU5FOxSyUpD0Q=
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544579485a.26.1794214482611;
        Mon, 09 Nov 2026 00:54:42 -0800 (PST)
X-Received: by 2002:a05:620a:2a10:b0:93f:707f:28d2 with SMTP id af79cd13be357-947841e916bmr544555285a.26.1794214473764;
        Mon, 09 Nov 2026 00:54:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795038782sm146282185e9.3.2026.11.09.00.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:54:32 -0800 (PST)
Date: Mon, 9 Nov 2026 10:54:31 +0200
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
Subject: Re: [PATCH 2/5] clk: qcom: rpmh: Add support for RPMh clocks on
 Halliday
Message-ID: <x7eciplbxc744uqlbynakcr6ej2a3isj4j7vghgfocvvxldjqq@n3rrc537lgek>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
 <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
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
In-Reply-To: <20261109-halliday-clk-v1-2-20c3ba8be0bd@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX0gFTz8CCZAcf
 MVzs3VQhOIWUJNdEUp4YjPaxgxDIgOrZXRL9BELBZHyOQAyy8cX6Y4Qi+zcG3JJ6+efie5cthaz
 NqcTkysV3TO5gMKSNFIT6F8yDklt+ws8caD0AikKft1qn5BSt+FLjtHGYQRlItnAf8KtrWgEyMA
 ccR8SQHnlilj9eqCDfN/hoOiopfQP6nA1FSpEHQbyOmKDnRIXbuf43hP5+H8tyGyKpi7QePYaoa
 PkZx24L2hjqOPR+J+COBLJEVQPcYulLPJ7uI1OrhpsEZcd4X+itewMuSlNn90AJEyc6GW4A8mHS
 T7wYwi4UnpxEjRcE/2+7mMcSvP7W0b6YjQpjLvAZs5NWUWGMa2TI8/S067GxZ0eeQnVAWRWFN2j
 bXhO9BJ9QdwMC3eamx1ENnFF+lbCh6J/A5Hpl8H7SFKwy3lO6VJyj+HlM1Fj+FnaSSGiQn77F5v
 xzc+soBlJ0hropg/v4A==
X-Proofpoint-ORIG-GUID: -eutSOKCK_E56IpCcUh5pZIVdvKnnEUh
X-Proofpoint-GUID: -eutSOKCK_E56IpCcUh5pZIVdvKnnEUh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX9LFvYNB2o1pD
 1ftjGvJLBbTzKTgCsKxiNln0Q98qcBnmWX7pFiJ6r1rIU8XuqhMGqEjJu7gDGbQeoSkRnnLIYq5
 k8HAE71O/AmqNb8VITBTGQ6nymjCD38=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af18a53 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=bJUmpo4LbrwfO9ae5mQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035

On 26-11-09 00:29:11, Stanislav Aleksandrov wrote:
> Add the RPMh clocks on the Qualcomm Halliday SoC as Qualcomm's
> downstream clk-rpmh driver describes them: XO (divided by 4), RF_CLK1,
> IPA, and the clka7, clka8 and clka9 resources (downstream LN_BB_CLK7-9).
> As on the other SoCs with clkaN resources, clkaN is LN_BB_CLK(N - 5),
> so these are LN_BB_CLK2-4.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
