Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391270;
	b=kZsLhe9Bz9Bp7uhvMPGHATZkUfsH0gXfojklWPeNTwmB6ZV15us+YPOhemyvO3t0GH0z
	 +8+x2+DPg4aINx8BXYo2oqhWIilDUCaAEisuGiSvVVWK2emUd63p/2jTOT3gqCszvjlGr
	 i/Liw0XOxNc4Ee27VypMOXeGH/BhZB1nwekNryYGvS940G7ZuLNdQ1pPLmyF1LLYhDHyI
	 LaxsjIxVyuwjXIvBDgFJ9TJKsfHUdXb6g2bYFd2rIJSiXTOiz7btja1xFDXnzy1u4FTZO
	 9IGgeQjzj95AaoPetFlpiQXsx2RU2RIZXzAjbUBhrPu/AmH6Yz2XOmvevCGom+DoR+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
	b=Ek2gSN2Cba/eAhWyhZLdpQ90c+mP74eYSjXtupmPEWOYe2JA3/rwdUQ7GPbRgfpgVZdi
	 3YiiVBFt93Gj7enz0yiW8mdk6cYPgQy6opCgYlJD3f4Mz9b7+Zgkb0QxmF3VwLA0Fyh8P
	 XYMLLXi2x4/8HvqpTiFQ9/w28sWcoeNMZHOaIj6kt6MF9oKsdUojGCFyEZxgMSI51t5+q
	 h+OEfF4fEGx/bhHueZB8LpzYpy54XatggpvIrxhr19lS73VbAymxkTsarzuWnyKgfGFso
	 CTyvPqNHJ9Al+DBwDF9u4wQCF6+nSk4Rj/YTd1NdAs8Nd89JTIcM1rwsfA2HXErag+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gjrDdxjZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0377160A3802
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0377160A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EgdJAR7y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gjrDdxjZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KD251409006
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v6371ZwO/zAJsKINRttU2q
	drq8Z8ZGN1i9eIzeAJUqc=; b=EgdJAR7ymcJOO8bQxiHAAkLF5VE/0Uj+614Co5
	Ksv9ip7RStWBdziGphGa0SHGA/CdbszlhpNyMe8SnHFtNBA/wyQMsGuyMajfmkUL
	QOmje9t0zCebqIMXbT0fTUM2DszOoz9kd5Gw0W5E792O3JY80QOnfoxKQzem198T
	I+BeyxL13lqmyFRWPUjnhPE3Sl81V17QSKDckzbQmX432I0Iewx6i2UkWpE/Tlir
	Sx+SZn42oS1zDf4gbMSS/YlhcKLjkfbWypJ51DCvIgap4gGRn3uPC+xrijU7eros
	rR0W4/PBFFVItC5F80NiEpPlUp1McmUGvs04wuk7jVxSe4eA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhb73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:01:04 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ab90cdf747so3839061fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794391263; x=1794996063; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=gjrDdxjZp44jz40DXU//p38yyLgZVt6bkjdQUJFLVkEkt9gZN7P8zWxlzYllxhvRrC
         eIJncGXEx0el0s4+n4r5/0z6/uqM3+haKQ7Knr9rsyDSaPPoAuyTK4Re2XxkdR29k1C8
         9CsjRHG+Pbio1iKhwGV9G8ojt1AyBfsfyBcJ7UM3YpriSHispMkWcm70tlj3S63Q15lI
         MIe3CnMqJWAAxMfo7BM1Z69xchLreF7rQQgsQSwD+4YDUIXW7gjHJnXEdw8cdK1yjYPG
         VqEKO7iYvkD/CX7tjPFvYQ+lGiQd+g7sB8H9v5eL1W5qOFh0YMpJKwKZJxgcLE4jUmHQ
         w2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391263; x=1794996063;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v6371ZwO/zAJsKINRttU2qdrq8Z8ZGN1i9eIzeAJUqc=;
        b=QSWwbTm02l8mEpTtTnsuEbAyQGhR8/IN6+UAeh3zchTTxIYy3KG+sckDho1k5LZcfk
         bg6uJAvuYwzeRKwwRyno49rOxOYLf4O7WtWrOQxjT8WQDCuNnTxxh/rYKwn2GLB63v/x
         5rWTa/IUjOiRe1k5ojNVXwkcqRcwAH7xhTbtzH2jzHEO0qoqqAbMBtdVcKofat2k8WVJ
         L1PC8n5lXwHnYhuOiHrIRwrm3u/pdVFjgiTl8KvXOt+RRquhRPeKsJsp+EMyalNZxMk7
         dY3oiIkKEmWRBdygrRblUIoLA8BIrlbMbvT0hcboGNVh8X5VzjgLjev3QDZL+DgmTty4
         jJkg==
X-Gm-Message-State: APuU4Z/EPS6aVt3+Updaiybt1MIPu5iKMjvaG3tcPyTzWiI/ZqtWv12L
	kmbUAj/Ti6CZItteD8/+2epCVY/cdg8yaLQnI07Mo5DiDCJD7JJOLXr/VS0yCKlx95eMm8WvFhm
	Uvr+MI0PXCVLI/L0c4fwCHGSTXPsXq18C3fpi4f2m7ncDvj65XEVsmkRa/Y+9rbnIUULI
X-Gm-Gg: AYBFou2LHolFoe/BpNQYbFRxZ4iublR+x7T6anLh9ADXHUlx6i2LHKRgKeowk+XYj3F
	uqrShsufzkcfjz+VzKBs0S1XCOlBdPmFoUfxPeE0IceonDDUEyNp7o6IYzana9X1quLFCg1JcIF
	xluC+if/opiqGLs4EixgyS63zo1UvlhqXw06PIdL4QWKJKHvtZwVqDuX0fcde+99x9Cs9An6k5V
	NPhCsebzUDX1L4YFlpCF+VoEr8UXMNB4Ij2LZl/TzHAQF/fZO6JfAroncJHCN/nT9wp5+fiePxn
	k6LT4TSc+Lj4BDSkPgfnNShcyYnMYTfz9B0jHWPQW3sqLGIpgzLVaRhVjDpvK2QFVhDE1txHiTe
	cHJmQmd3Aq94QGaItQUk45eCZjOMYmp8iKapMWxe8+yDclZvHFnJvBUdv0kShkQSwVaujyI1ut/
	Yi9z2UZQ+f23V6ByX7
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879944b6e.35.1794391258181;
        Wed, 11 Nov 2026 02:00:58 -0800 (PST)
X-Received: by 2002:a05:6808:c126:b0:546:306d:45eb with SMTP id 5614622812f47-5688134bac2mr2879910b6e.35.1794391257731;
        Wed, 11 Nov 2026 02:00:57 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504c276sm4686111b6e.4.2026.11.11.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:00:56 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] clk: qcom: Add NSS clock controller support for
 IPQ5210 SoC
Date: Wed, 11 Nov 2026 02:00:54 -0800
Message-Id: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANY89GoC/22NQQ6CMBBFr0K6tqStrSGuvIchhE6LjFEKHSAaw
 t0tGHduJnnJm/8WRj6iJ3bOFhb9jIShS6AOGYO27m6eo0vMlFAnKYXmA4Rnhf1glBRVRwTAG6+
 tgsJpJwuWHvvoG3zto9fyyzTZu4dxW9qMFmkM8b1XZ7l5v4D5F5glF9zpBqyBo7JGXgJRPkz1I
 7nPPB1Wruv6ASoesijNAAAA
X-Change-ID: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Luo Jie <jie.luo@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391255; l=1980;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ssQwJ0NVkXEo1RNZ7AhR+p1xjTksM72Hbr1MyGjEOHo=;
 b=ELfTtgQHmQKAVD+I8fcjmKdoSmQ63d3HgGAPghBonQAWNbJzX2cwn6xE89AK6bbrIHcF97a/R
 n1K7+DMC6nEAdr74VE+WswAMjq8sxzA0eAfb0UaHCo88wp1qmqZt3ig
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af43ce0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cYQ6PdjOCuHZ1sjPTfwA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: o1iHJ84vP-kD7pBtwMvEoez5umnaJmIz
X-Proofpoint-GUID: o1iHJ84vP-kD7pBtwMvEoez5umnaJmIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX5nPFepgRzDGz
 TmypGjpPwyXfp6JOaZDu5PjgzLYa8kRu5bjxr2THBuQGBzX5Kjnxxd/obaqOYQvfadIHExW0bYj
 yPfEnkZ9/F8l102pIGXBMnjNSdBJ0XXy/MpmtHG2By4YShIkNJ2cJw7tfEVW+YigdixKkwPSoDL
 JB9Lb2rohOSo2iF4wIkF8x3FhA+B7fK5rl8F2xT/NTFSggrUncfpRWQNC8yFYyrKl+A2SoKWvF6
 YC1iEu9uQOF9lAt+Fek4zpswKx5GyvSqhGD8vXth/DJCW1Ps+vL4M7eEvC3AlX/uddBC/jpB/jh
 v6rsY/i7glcoKdSOIupfdZxg8h+oZHCuCMlk/9mQzzqLtQCJrqCnz/wVcyxnZK1gdKOOabDvvQf
 WgY85HeDGzqa9nqaT/OCV2fUmvEFyQ2HeajLWrY6GpCpVSPl28x+ivDvEm69XRP5XZpzmsJ/ed6
 hKgv5/P/YNhtPDLCjZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzOSBTYWx0ZWRfX+tk8P3A59zkA
 kdcbBy2VeHBBmXja0gDBIuQHizrcC2h5SxWqwc8+ztc2iV+jq/03pM/Y7d0q+LfknfP7uUwpqAV
 iGQva47KMomACmeMcBimf8kdlVxNaFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110039

The NSS (Network Subsystem) clock controller on the IPQ5210 SoC provides
clocks and resets to the networking related hardware blocks such as the
Packet Process Engine (PPE), the six ports, XGMAC PTP reference clocks,
PON, EIP crypto engine, and the SoC-integrated EPHY (2.5G Ethernet PHY).
Its parent clocks are sourced from the GCC and CMN PLL blocks.

The NSS NoC clocks are also enabled to use the icc-clk framework, enabling
the creation of interconnect paths for the network subsystem's connections
with these NoCs.

The patch series is organised as follows:

1/3  dt-bindings + clock/reset/interconnect ID headers for IPQ5210 NSSCC
2/3  NSS clock controller driver for IPQ5210
3/3  DTS: add NSS clock controller node in ipq5210.dtsi

Changes in v2:
- Use RUNTIME_PM_OPS() and pm_ptr() for dev_pm_ops.
- Rebase on next-20261110; drop the CMN PLL DTS patches, which are now
  merged.
- Link to v1: https://patch.msgid.link/20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com

---
Luo Jie (3):
      dt-bindings: clock: qcom: Add NSS clock controller for IPQ5210 SoC
      clk: qcom: Add NSS clock controller driver for IPQ5210 SoC
      arm64: dts: qcom: ipq5210: Add NSS clock controller node

 .../bindings/clock/qcom,ipq9574-nsscc.yaml         |   47 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |   40 +
 drivers/clk/qcom/Kconfig                           |   12 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c                   | 2202 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq5210-nsscc.h     |  106 +
 include/dt-bindings/interconnect/qcom,ipq5210.h    |   18 +
 include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |   60 +
 8 files changed, 2483 insertions(+), 3 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261104-qcom_ipq5210_nsscc-fe4b2c8d4d18

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

