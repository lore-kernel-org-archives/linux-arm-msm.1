Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170133;
	b=NtjJXcaNsxRf1hv24K8ZLhuoGn0ahd2jutGlQ8GVcMOU5eDWN6+EJWYC6jn2OqSuDSEo
	 kkPtHyCpxynOGa7Bkr/XEJ+SD+z8CoZPojynNlUA169woJCiaC6rz0EfYbelEqo6pNCVL
	 YvlA+bLRHch73iOTssrh42h6IV9SBsYbbp6QNJegQ3/+CGYdY1+ldz8Qut6YJReGJZ/7Z
	 cD1hRNt4yNoKCw9olAcxIpxD8zwPNvV5ZRZ/Skk+EfX7kD8cAwzk9M+Fc83gDPkILJ8yS
	 05cQxraydsOAF1JxdFltp8lmY0mrn+9o4KTlZtwx6StAS3iZdcuw7sDc+T/mFtmLTxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
	b=DPKn+LbXB+Z/YoD11GRRstQcn01dTwW4UsdrhLtHnhFhSlRmWh8BeJ5kRMLM67RIsAAR
	 FTkoCx9ZKSM4zD2JJjJZDJxvySvYIlaNAjOZCt3ejCWOF5kCX9AFh2t5/0R98u7nZi6TC
	 OXjZwx/hPjjW7TdFN2MaH4P0ZRbzLLe4fYs56lsvcFiUUFXJqhVvTDzny7Q8kZbh5uILI
	 tTOrd1ABcw/arqAjVAIIqLT8Rt77DtGO3CJ3UgZ16X8rXIS5uYyY9gDxGau/HloRyZbp+
	 yQMmEVUaqAcPZuMFnMeLTBoe4f3rMEVE8mniMmKb2Q03kxdPyoALlQmDC15r/enOckA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9B60A2608
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE9B60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YEJ2Qkek;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eWOo9ers
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fE7c758062
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1MGMcXxwJZ7aC9YYQ26OH+G
	9qkkBjw1QsP0VNbDjno=; b=YEJ2QkekzsvzilqybtrIOF17/qu5tiMJz5gYXq2i
	HFShxDd8O8TMOBOkrs7njtl6bDfpWdwuKea9Q24JMTx9P8lJdjWKehmYDU+PNtik
	ztS4KTSOzgkKO5nylH2EMOUPcfTU8fyWF67Bk2oHWAss21DgNZ/1kF4AC7AwIUmD
	05HxTLs/r4sTBFOOgNwI8Nj8TDohDLI/1aA3EoAfdvWx0ODmOeLTH7m31aSEuRBf
	ihQal+uRFTomuyo+Tas9ZZ8zKZFG86yL3lk5tjOoglZkI8UFmG0BiTrIWRRX/4cg
	mqTjVlIDiyWg4hjDu/Vw4MluqBu3qEvAufJyjIZHNmDz1Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5u7u4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:22:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d7544d113so16454491cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170131; x=1795774931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=eWOo9ers7osRg2E87cOLSOUzN9Mr7Qy4uMu5swGFJzBnqLl4QHUR2FGhMYNEDfRnAS
         VCCvW2Lhb7VD+bo9VxG84uoGq0Dp3SCQ1zI6dfxLshkb+n726dnJM4DqjkRv2hoDeO3A
         rozocKOY1Lwn16dyFg5l3obFE83VeTD1gN7+9Qq0ydqbeorBPO8BtT7xcwqPxcPbBGdI
         bOfEk8DspeUd9fyQB7UyHM2gAZjdHCNZtAp8ln83ustNec6D+h+EPly3c3BaCKEXeLM1
         3PmRPpAVxsDmQx2vQjIgXGBdH3ZE2THQD4ZUyVHKTJZ6gRCUchj9OIpBscglP12kZD5+
         KoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170131; x=1795774931;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1MGMcXxwJZ7aC9YYQ26OH+G9qkkBjw1QsP0VNbDjno=;
        b=xcDM3nERgJgSfjID9D3AJAtGvWjfg8gatt7tECO9hdsfHyHAGJUvVaW2xfj1xy2ZhS
         cs86ba+Wfj9Hxm+Fx5u1CoQaY8hrM1+yhJZVoG89kPnyahxmpsaAt3TnW5to32EPs4PF
         ZflCRBNZpp18neEtZp9e/IXPWy9gDSjijlOMzF8kcgq8EoO16IgvwSTZcGjQkAMyJh35
         acVBcgqKsUK5yqZ+X97NpPkIFccIqo1cEWvzrsbJjMqFmJ1RoVVOsOgiUnvDr1mAD4gw
         D2ynctFEGKpMEg2z+b5FbGIamoFyY1aVTSJZhWvn033cL4bt5/Z5z7IrqpVtHiwbdV0M
         5D8g==
X-Forwarded-Encrypted: i=1; AL+hErHNS/hiqRu+2fWvMDdACW5lhlKA3N3jmX7tDU4TkVMOFVILxDRNgCXZMel74yGcIXiyOkQaqGSgtIB6YTgR@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cfp763LQEoZr7yGhaa3O2eRaeTXKbrSzamzEtOsSl/3ZENbAt
	kfYsZNMilOjviLC9rXEbsVb7fV+NyK0eqaFegl59hukxeQRYoQ5yT1FJh/GMW4FQJlAmjWi91DC
	ZZafbUlHLCt2WlxV5KK6OIxr6xosQCsYIPrUtdosME6AMzdF44l3J4Far1YhOYiYrZlxP
X-Gm-Gg: AZFdTZeBiBZgDWXYSDW6TfC0KlpgG3LoJUMRof33CrTiK7SPO9Lf2sP2pzvf5PHMGhW
	XK7EOYuFA0lFVl0DMeUJAtUEX6gEHeA7JQ0P/cGyp3Q+hrEeSACNna+9JQtAoeR2ILV5S1rgbY5
	rjss4a6N7UF4ZyQzV5fnaMb0w6Lxk54Sud8HR/CarNuKQu/1RilQjAJGI9F9Uw7tDiGaYDLg1k/
	qtobiVrqW1SczSGgpK5fW2CVZcfjZjzxPWfUxky6Y5DY/vu/K7bOUZBoXVlZSWCeReu9xHbf5nd
	keuf28jL2UBR0iKcPJPmkLxu9v+qmTVuctRs21Db27R/4Z/2pNYQZ2Fj6BWelrfasYeRsK6SnNq
	u/PaDzjNdL+rjakiB32hNxVD5GV2c+twpxSqUwS9pWt2zrQOEKY6cDRypJf5YG5oI
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563481cf.23.1795170130516;
        Fri, 20 Nov 2026 02:22:10 -0800 (PST)
X-Received: by 2002:ac8:5ac8:0:b0:532:c057:9564 with SMTP id d75a77b69052e-55d76a2782emr47563001cf.23.1795170129811;
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm3906179f8f.46.2026.11.20.02.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:22:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:22:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq5210: Fix xo_board parent
 clock
Message-ID: <gejgvl5guwsdfexjqnq7aafesxjn5tjo5xc6ireh6xxi3mkt4y@si3fqc4hj4cd>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
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
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-1-1eaf92698379@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX1vIbiQLH4W2x
 RBnxrMcFSo3Bn7nKu80IWTIwAlbNRKQP1A+gKX+A2WCTbR9iccPLhKDzEDEhUgRhQyIcMK6615l
 +QvhZOKW/xMcbYIx3KivKDEvnlncFCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX4NgAy3Lpw4hK
 wYBQ9BQDJbMiel4lpIhkts0AlTf/UkaPmHnnDTyuUFGMfFvtHwgFTcN21THp9AQO52GPyqNzZH4
 HukctabVNNaiZS0WY8m1WrQ7uwL9vdTTXweWr5JSKx8D58HIRfSAiE5aFfEQbkdCCsC0fXuRGXl
 MBHAJNNygdkRi5s6tczEKtOYKnp+BcmDChp6UVQt7aVlhsI6iheP3mftj2lJLC6/a2S7C5OaKSk
 NW0+tyEZ2dQjUI9+s88GnlvjAdE/8ou9XouXBsuTJfc++v5WuOg9wwFxlkWrpKE1NV/cuumpn1H
 ELyrDG4CuKGAe0YfzVJRs0bMb10ipMWLQBQ6fMNaDV9UFldpV47DDBrANX6i+s4FR7rP/UcBoCc
 Zcj+iR8g2mcshiUDKEH5j7nD6iK43CJ7rBs4MWDpbR8UmVN0c7POlr18XTLTybv+3ruXivdZrW/
 GGHU9iDYL/h7RtsCvfA==
X-Proofpoint-GUID: yDZXI-8Xr4udQgRAUkBDa8VuTvwjmpzU
X-Proofpoint-ORIG-GUID: yDZXI-8Xr4udQgRAUkBDa8VuTvwjmpzU
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b001f53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=M5Hs6WqG2zr0kzIIc3sA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:48, Luo Jie wrote:
> xo_board is fixed to 24 MHz, which is routed from the 48 MHz WiFi output
> clock (also the reference clock of CMN PLL, ref_48mhz_clk) divided by 2.
> However, xo_board is parented to xo_clk directly, bypassing ref_48mhz_clk.
> 
> Parent xo_board to ref_48mhz_clk to match the hardware clock routing,
> There is no rate change, where xo_clk is 48 MHz and ref_48mhz_clk is 1:1.
> 
> Fixes: 1d6abd242b45 ("arm64: dts: qcom: ipq5210: Update xo_board to use fixed factor clock")
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
