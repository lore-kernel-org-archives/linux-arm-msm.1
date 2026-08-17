Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74475436BCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972917; cv=none; b=IQU5/pJ4T2zhMFKJ81u3QtNL+if0re6eSgpq3km6XQtKd2zOOmEgEtSZwEp9N81QJl7wB0jaSP2AByalEEGfN2VJiiuQ1vsMd592Lgxzg5fkjJ8090FYRweuDMLohn9w8NmpEovWn90EDTpBuSka20D1g5ifs5DQMoKP8mqHzdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972917; c=relaxed/simple;
	bh=NDGPWt+D2ZXDyHyMBO6JKFeHYSXg9EA5515WHJ+RyIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIdrsQHaF+gKL8heKxWJbZgyD87YhS+k8zknSsQe3d1qm6beS/C30N80odpFBQkjblNFLa7pNnit1h7pu6UQQ3WxHJ1lkKBM05kILeuzv2hFPCWmAWEH5fTbpI1VzK7Sn04Vej7Z//6UUdOnCvWoo3Dq5xIaTa6Ku4gVZrjFqwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ilduPxHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ0jrZII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ilduPxHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ0jrZII"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5iO61510856
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=; b=ilduPxHA0sBskZxW
	F72jyL5bIcSb5+4/z+0L7B/VrXJicmILlzbC6JdOK0E7qHK5yAPBSau8eYsJA4DI
	rpFbzunOHevAcun0cqaS1ZqfL6yeDkz/MoM/J4feC3TQEBmdA9BxXcCRmcg68JU8
	mpIh5pr5/AnbvwClxq7h+OA76TpRFXe7AesWUliQEIwLb5feV8eIQNNigEVZ8ivZ
	uexvATzARclHEnZPExaRrmhZubBBR34AWW26tG/p8WxEsRN5ai28/1j2nLa8Zy5g
	H+5HC+SmJg2N33E53LcDZB1WoRMFHTxFNtwqjrTgGYf2UbvwQnl7xQaL0i3Ndu5J
	B2YXHA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30h7tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:21:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73a1cf1638fso63211137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972914; x=1787577714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=EJ0jrZIIGohJ+19y5ZCvaCQh4N1xlig/rimrvXM1I6HylAmQ+xNbAfvuzc7SLtnvsP
         oVnageqgtr7D1rbFQsS9HEedlBxTV1GJMgsLlPm5mGFDvIueMUOIakwjE0v8kCBKoYWl
         Bdd2z81Af/u9MiV7animnlqZmF5Dv+/gBLFwtUoiINJNqH1B0ktVI0k6UTu9r2OZMnSK
         4dexwIgV60cE9nQg8Smw2xHduIorXH+1yHGN5F9abhogdYuHqu8BxeLFIsZ2J5bcQBMA
         XybFZX2w1S++rFNxW9AlFrDIRdXbw3MojBhEU4ghGeEGUxkJsSCUTWKEJvRiZ+n5TeRy
         gejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972914; x=1787577714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzIWZwyHiva5dFFB1nsZ7LRuFC2QV7+W8VsetgL6odA=;
        b=QZMdA06w+P4+WtezxAmt52d+906SqgOUbb67bq6OPrwU3FMHTyurwzuaxbQMVt6gJE
         AccQ8ABPhuh523LjDx2KFbZowlZTSSVol1FONZjVyiIGJC4J20GEaDsA79WCbFjGpJ5B
         suPzE1yzATWrn/rEiCAQWdI8Uk9ZypEKlzhd9BEN8qfI1mmr3zZSRricbvFkCgHgj3yq
         nwSRx4eRdxlAXf7YvK85oKUaVRw/oDdj/bNrW9OMShz3pJ0EVVO6jJvVLO/0DH0AZ8RB
         1bx4stOJ9TbFe1JJbwZNJqsr8HtEPv22kBxR/XubV+Ft4nQ0RO4nS3H53kLE+LZUOsBr
         kBGw==
X-Gm-Message-State: AOJu0Yxm0T+bAxE/9QTJAFOFjbhKDii/ygeVpBFQSYSYmytdx43vzIRW
	LDHy9h98I2xzeUVUKU5CMX1Jg+5BP7ubbSuCqmFGG5Pk4m9MkuSDiKOWIYg02LwqjkTeZSMPRxm
	n6LZx1prE6E+PFL7urAqSslhYjJQ1LdGlsPulr0RIQXyluli/MTh3dd4aqGm/WGebt2qw
X-Gm-Gg: AR+sD13rzBEWcVA/VQ4qB5pleeyTkbu52QJDlXSqc+LFc2QUJoom46UZkn29aZPbCMd
	rBNhU+kU+fbCwhfT1gpiJtlYQNpllr1t7SxHmPS5uXArKtT+NpDbCVCcxX6trSR8GehjRvwC8jv
	1/ahIfBs7hFP7hp9UFN2G4Ssn7nDUb8e2a8kzHYX45xa2GrFTtzdHoqb1VBRs/ZHrk2RNRv0def
	8/veDD6p1vheWr3V5jWNyWBDlp5EBIlV8p/1G1Jd3r3HQO8FJai73+gXujpGKUZ4kDT7w+QD25w
	MTGlr0qH5g8DUNJ54SbgCnKsLV+SR14nj2aVQQJ+6/SXBUXG5W8rwRw55WZ41fIiDBPu6GTXgDW
	0TceEjVV1GTxWQsdVySDb1H1o
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610868137.1.1786972913709;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
X-Received: by 2002:a05:6102:946:b0:738:133f:8d60 with SMTP id ada2fe7eead31-76f2a3d9574mr1610848137.1.1786972913305;
        Mon, 17 Aug 2026 06:21:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b99f78sm28129966b.50.2026.08.17.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:21:52 -0700 (PDT)
Message-ID: <97d391b2-4d8e-4141-a139-a41eeed7c6bc@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-7-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfXwLvP8aokX+eR
 aWznctZuCFj8/d1H/UdA/4zsSp/26KFfcOaTCwnpr5lu95T1N1mn8v+8rVSHfh8wH5o8X+jhdvu
 hnQDQHEIYnpJVyvzg+Ym4sFFhQv0DdhRXAA+/Vq7/1Yfjk+aCDeI4B+0KcIqlClPLVuYcGeE3Jy
 71c4JPF9fJGyvWSFoASsZoNJuw7L7ALuCwTBn7p4w20ktdf/9QcUWhiCLbUdf1XLeMyPUTLPdpn
 1xUos6YYemWiagzFK6B5OSG713oIrD3YYvzEvAR4+djhGW/v+Iabgn/o53VxWaKa13PLOtsPBfv
 Q+1g8nXUtt9GhEkex8i0FtG5JMnSDatNlahxgODcEw1T6sbZ7264yNm4UlOCj9LCbE+dqYjJn/u
 sbkoyKIBglPuYNbHisQEHvCSTMnC2MuksQUPJVq54xunwq6eDDm44FeoIVIomkKhwbPnR94h8Gf
 +Cv5liF1K5TipMptTWw==
X-Proofpoint-GUID: FE8rLzPp70uP2GP6fl_dr-o2YVs93WtV
X-Proofpoint-ORIG-GUID: FE8rLzPp70uP2GP6fl_dr-o2YVs93WtV
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a830af2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX/Tyu1qG6T1Ev
 Dx4TGjrDNjeJMWNGs92awq+/2BgwbbPq3HSiayivvs9ZUSr+E7xaRZrYQjJ7e6YvIEDUSBUFK77
 nPy6/MgRJOvjv6ywHTwy82/yaem2fQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
