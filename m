Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665371;
	b=haPED38m8RcN2VvMdpWRSMBLSkMqk58IopdIe24jZcAKIRqBuuJiWKWSgqAlZVQqzSSH
	 7x/pS7ef24R2n/TyEeCQb6zfyHXu2c11NA/N9F3C15eU29X+Ie+wJhiN9gF069FMnLPEs
	 /ZbJ9ZfPcQnGuZnG7/WtiKofl7WwXA9SfJ8s4v2DluE2xzU6ZoK+YHtire1y8HePhtGVz
	 NCL9iheYM8AWsu1e4AokwNiJakVfA4o8RJL3Qmg76w7OXTP5yH7mIMI5dP1zITzaR8v77
	 hKDmCBHXUMJN0k9aEUVK/izug7x42BG6NjqoFX5KEzW3QK/c9eggIjyj8ztO99y7zHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
	b=CMv4vHMzARRicL5hd4oO99gRR6o7sICpcmc0ljSmFuzm3JUsaZkxqrfIAI4PjaaTZwRx
	 h1qGhPDVGAV7sz0vbzWeLXIkJojqYuaoV0EoHg0bPlZ68Mx/rtmtFNWeUftrUBLcvOhn6
	 9ks96nb+48LWxhpWAnaILwgvs1qRs4nyUMqM2LF4F4gnit3GsLqtzYeaYr81GtbsDksmP
	 sgdsU7NyXUq7rt+KEh3FvijZuTtBNlBWG9FkX+AQQwpS313MFrZTBy5hkrcjz7lsIhwZ2
	 lWAgsvcozmDu/ATo3TuIKKwW092dby5MMGOF3UdUEgyQfXJ9QTvsSPCyBY/nIz/j1yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6m8KfwX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0hXHshN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA9606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EA9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6m8KfwX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F0hXHshN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA00FP346213
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=; b=O6m8KfwX4TBNDVGT
	btK3QlzzuZY7WtgaHax/RcdDSV1MhzX4t0eydcPI4lWT0JfRvUC8QJ+aIWn5ZvHE
	/lK76GnWREeiWcR1z7FfbXMGqWt1D2kVLYP1RosVIXK37/rEdAqpSfuSbXLW65yV
	S6doSrPqkpF7gLrwU9UaHKCVHG3Gl2jEu/b/sWeprSXj3F3D2ITrF03kBLn5h7PH
	XW99uwaYn56uDaWkTvTUgUq9/1jo9Kt5qjwK7oDxQBn2jMd+UUuopo4gDoVHHUhA
	HTSuRjeYIEvJ2Dm63vmBvXh67XikyepMgw1ghqmJjm3ZNAV3h3Mqchnqy8LriRLU
	CkJEnQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93da40m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:36:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b89618384so3556496d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665369; x=1793270169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
        b=F0hXHshNkibmtnvU0xFHt80Fc6BFiXhgNLRfJwtFwPuEmXyrSuAyLD1iHicSbEMPys
         SMqAmemA36VsWC4jTrqp5xYpgG5ZtF0oV4lullKnHO9vvNTy25BACtG4V1nZhFAjNcSK
         FPlHfXnIysoOdQQfrarPXDXwSkj9CQMsGYfH7IiY/4u3vdVnL6/Hq3Bfk4t80Uqmj/eJ
         TxkQNLRXLgB7jPa2T1D5Dgl0oAQT4JZwIoJp32RGWaiRxHun/0c+zOpeNSx2uO+mypgN
         XlM6md8EkFOsPyZ7NiGYFDjUiPi5pIEqIf1MTqzkolbY2aZhtmyEjwDExxsenWazds0x
         pMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665369; x=1793270169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvLV5q8VkGm2l5kC9SNylMb5gfrHW8SKJTDLvC3Q04A=;
        b=p0ONZsfDl2BcCwsFz1fk4Xvr0wid6F5IwGxQtmXMu+B74AOR5xhKwh40M589J0xGv+
         rgrj+2YFaPrpPS7KM42Bj/NjAEIQ3zbFzQJKzlQo9DpqevMq1Sg59ik8jEU4EuHebMl4
         JQuZOltsNj99/SXYVh077yrahjET+8usvIb+ferQjkYxlbJicurn6y5TXH5Qt9Tax2NT
         aDxYVLYF0Ofc/vjs3kY2RkdDxYz0JkNn4q3x9kAZCz+Uokrj428js1gMqZ/gauhI7vMf
         AbbIKOkSFtRhnO/AamGzehjCVaOuoofJPYVVEIWGY4z6DMf7ZFpkYkKN8C15Qk0ZVIJ1
         HvYg==
X-Gm-Message-State: AFq9FYJUrtVhjKsRUGryBfvQ51FeSuMRVellI3rioujicII8e3ARwHJ4
	yIUjoQkE3oAjqFLg1NSEH0WmYIDjKBX5iZ4ZQteRFOuZhauKs2q0J/alic1VDciU0ONXU83YmqZ
	NKEhL8JP1+IiaG/Aw5U8xpy6/CI+Vr5vDzJkKugQmMj+aV8AhuEtnc8lkXRbWG9Y7lM4k
X-Gm-Gg: AYBFou1PQIWaldDlpdFmVj/v+Xf/wMJT8qMEO5MwJLngB9ggTTjlDWsPO8xuBdtHKwi
	pDCsQ9juv+5xcwjqyqwXJTuD7eZfY6V+BwWzzHDTnRptD8CZpRrSh7oV8npdBEYm+74DjYM3oYf
	XNfzgf8O5gYgsCWnNjI6WEm+OlfMMxVUpmY1ndyqRZPp9Clg/VW9HP5uAwsODTjsHvrt28JXJoW
	um2nEhR9ApDo9LWlg+t4GkOtOYexJDVToMdpyb6N4NjQjnd7wwQ/6iOjp/+gc9cxLFviOGB+k+v
	scCWxsdRK0fONCFCuccPhALynoEivyB6G+OVYBE2NgrV7thQn1lNBTda2rHH2ouDWoO+PDIBP0D
	nryWJS7hUjNfqRwXyGorphA==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1027277585a.1.1792665369213;
        Thu, 22 Oct 2026 03:36:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr1027273885a.1.1792665368767;
        Thu, 22 Oct 2026 03:36:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59ac5dsm89387066b.57.2026.10.22.03.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:36:07 -0700 (PDT)
Message-ID: <11c7f9f6-7a9b-4b46-93ba-b74153744a1a@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 12:36:05 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfXw71Yyw2xaN1g
 CxijqlgcrljIQzwTNfaVNv92APx2nFstC++5JVOwrR11XOoGb6W8qujW8b5PQwi3P1Bks8NUwq7
 6hbZqYK7jvEtGWaNsNJfa0NhtwVSlJM=
X-Proofpoint-ORIG-GUID: pHjyCnb8Qv9NDcNodnvQ-rJNukcKHTrB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX4YFhxxsq37Qs
 lGvzZVXedlD0pVou4JmKoUV2eTdTrqhcSU+DGjAyI47r2neut20Srk+kwvLAyVauBPnLJuy2egj
 FFSo0zKOXe+huwNzoRInbXzM33sftO7Ohde3J/8pJEQDuvyTlGV2XzbpDdW9RTJ8/qRt2Fz9qlK
 oe3x8afFxres+dNN1um4iDoQz1+6o6G4JmQ5Go6M3B1tmIpphx32f80qnReO9bGTtubvZe9GMLg
 1Lrr0jPNcMDg3NR/EvquwD7R1h0EUQShoZWELBTMNbsNKHMpvCMwbNWjrABOfKsLKlHsRFazY1k
 cbFe8cm8M4bTJX6L/1JCTnZ6yn8Fr0Dcjtzll5qnuAdrkedLOrqRhtRpdNZX4UA3+JnY0VCOSVo
 Hw7l9F4mz1zqCHi2SwrhIWpGEy6k3GZ1HGPplLbp8hjx70VkU6dtOpoXhxk8al25860dU8c3gxK
 AORGVgYcnIPi9gy5pag==
X-Proofpoint-GUID: pHjyCnb8Qv9NDcNodnvQ-rJNukcKHTrB
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9e71a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ATBR86yDhrRX5TM_Q68A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> QPHY_DP_PHY_VCO_DIV register does not participate in the
> divider of vco_divided_clk, it can be left as it is- No impact
> 
> Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

The way I read the doc, it can be left as-is on Glymur, but
not on Hamoa

Konrad
