Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742071;
	b=Da+fSZQXOY2dc7evwMSC8EdhMUvlAzXzMoQ45GjzLfY37TFi8yf0iJtDDoqo7quR9EQ8
	 +onYDKNnZKWL8tAowZSTEt4M/H9ezHeHvF+iI2P+V+pQjb6XH6wcgJF9W3sHT/1sG8SJn
	 +b60ELiXIscW1BPRN71GyvOlsnI0IJWOYdXusM5+Il4yNPxRXvre/Fdm7jJt13RkT7KRG
	 OL56CiNHTTZZm2J9kbndIAZOdQE2QKbrtKEmnFxL+7i/RbKXUiN0DzUUuVw53Y2YEAt+K
	 39rSXgw2nHZ4yCLNlXzR58NH3qZ5yKsQTXAjYIfIUBRAeYrsECIBLEs5FlS89QdDjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
	b=bUMo2HA/4/RHPnEVSfQDAw6mfWGtihu6hPJkQU5yMacNpzGFv8Icq7YjRCeStdnmsht1
	 EfUgRkHoN5araLaEN9S5gLzeuP2jerVX6w5jtL7yOYgXer99IKX6gxeNl5w2bVb+PY0SU
	 lP96zHR55Qpb+lwe4BFiQyMgQEKtYaCG/JEEl2EJxh9Z6W6DN6XjtAmLGfdyzt050Xt2Q
	 6Lee8CVIKj+yGbltQY8ieDQrl600IWxw/PbuYAmO9zvyvfo3ut9UykO14rV/RhXOdbmHE
	 bLc2u6viq2fjMCD+gdISVZsOG0kJO0ChmGa7dsCuhK9Ul52LgJKaO1TVUlDFQvPpxgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QuEa/dm7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkxBRe8D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0213606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0213606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QuEa/dm7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gkxBRe8D
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKsQ2415299
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 21:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vL
	sl92K79M=; b=QuEa/dm7P5SVoukhhECuZxEztHcz1PtGiUEOvQWJz8s8Z4B3D8i
	TjSdaLDvK1iDJrOM0wdQ4Lcx6JeL/qqYtyDdopwrX1jw5o3gBM8GrjSw48SQ/Qd/
	oaRstve1u3THBK1yfMYK3PwkRyLXzGIful4xI1MF5tfOy1IUCtnalgstYRVewUKA
	B1Ls/7ji7bFM1Pek5i2QixfjGlZpZarA8hLBFqyWWx/M9g9SayTLASRs7tuweym1
	1YoYoW4Yw8ts1faneLP7TdsvMUW2zTX5NoiwEemesekJ4xXDRawGOuRyNuEVFiK9
	mmVCl8sOR7ZuTEhntwn6VJg4MiRY03DVAmA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgp96t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:41:08 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso106115c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742068; x=1794346868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=gkxBRe8DmeqYXqkqc7vm5gZ7r3mcQjlg9L5NQKfJrnodTxGeSPFy2rf09jFSGJnz4l
         vAtBeofCqLqBy9DKKUFDlHcBkld++yAopMBFhIz6gNx8BOjn4D4qWUS4Ht/5fe4NpcvY
         2wXuIgu38PUc0HbVR0yS+EReQ+0hU4Fg7/GMB334H/+FKP8lzOFzLlTb0g4kyHtJ69MP
         o99LJHZ27nMkCOSWD6myvn+2zppbWcVztBg1jzwXlUbhY9vWmOfEuj2mJ4r2sQ8nIPqw
         zP8bJ2R2jiArJj/iv5xxaqL101LeEiu6VDTbADvhQlgkFC4dAO+pu0sL5aSC0UCE65Wy
         cnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742068; x=1794346868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBZe0kZye2FXhpOkWuZpIAh05njeUm5k9vLsl92K79M=;
        b=lZA1UTOzQ0vZK68yQKgxJzqTdReMAjFvZkMzPDpdnwJarEfc1XbVstRk+917OKCa/e
         eEL6KOclYSVYELtFzjyTDXw6J7/9YMQaY3rJh+Ih+K9MydvXYd3gwOlNqVzkSvYBTQTt
         Pvl+Lh3M7rZv3imEhPiWlYOCvLZ6DgI80TB2jAyg18wNNzloj/+VHVlhbzPTno6tMOLG
         3LYu0sJLoL/Cm0RsUu4DgBrV1JTRtZw0fScHLvfvHKiPsTjpMVTltaZYCeuddjdvneKl
         t9SWL27bXQgsUBPxkThe2t9aGg502R3SKviCefv9bgJnofRuq85QYjGNe9dPTqggyP8t
         FNJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4JAkzqqHRHiXHmDkStbnj/HJomylNm1kBeAVLPTm8Ezztp4eCQE3mQ0cG4wZc3Pl1N1yhVmZHg2O6S5Nf@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cru9wbVcw+QLRGU4aatZigwY9Waedv5ij1HiLxywpObKaiyMV
	CyYICEFIxV/xfJF3JtvCOK6uNofktN60YFSEEGVGyZJltKzIf8QnsbHs0hD5sosY5/lvP5btdWO
	mKggH0+SgOglAv0+P6iwDpUVxWyMZi4D0wAqTEASQdU8fsK7bx2fRaeAnc2Uf3Ia8YMub
X-Gm-Gg: AYBFou0Re81DXTPePpgQNB4sXGQny9d1FT5I2A2RmOi3CxjXAdjj7yZ+2mi9gp6H04m
	/fmtL7FKnY4aQvxMC8+neTmdIKnQMvRtdBl5ER38Mwfd6jPMhkeH59EM7qfAhPMcur0Hk0is9Wp
	+LbN7HXIWxKyQ++19eH48lgWzvTpAakPZ01D7hzsavcFMcRFlW5v2GY8tew4H0oWGfpbvyV+QxL
	VDyxjvOmmhsFskCw/oKayuNqbUa2qozNto1Q6QW0zLgkgV9uWc3Mo3BpiEFn6FyQ9xOI9XlaYlU
	hUC8ZFe2rDzgtFfvnSqWd0mgoR/4FsmLqngUR4onW8BjTsSuj3ngLGPjGP5fx+yx+8vWu06pQcX
	rvbWVQdTWBnR8Va2aCBiGr/5kumoq8pL/qwXGocuDt82R7pE+UO82JRkCngbPwsfNgIStl40Kbh
	1PDpS/sAQL051XItNWkDVQgIayQBk=
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830786c88.3.1793742067490;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
X-Received: by 2002:a05:701b:2302:b0:1ae:e7c4:9a15 with SMTP id a92af1059eb24-1aee7c49a44mr14830738c88.3.1793742066789;
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:06 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Tue,  3 Nov 2026 13:41:00 -0800
Message-Id: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX90tQNBKPKNLH
 RMUmIHIQH0z4Osqz+olDzqPaiE8t+TiwMqGH6vaBia4wXlkfMEd6RGDJDE6HKvrAUsgK5Zj+AYT
 2ZNRv1IrWuk3bbdvNO+aQ67JQf3j3Ro6XHX81GQ+kp/zDDrRxG0Eq4r+6SfkGZutol61FKI0ECI
 plJilZ1DZZcTtnMP910CLt/yKMAp+E01+I7VVoG9jpvtjJu2BNk5hCN3rA+MqFQuiiGVIgiV5d0
 XUQKNAJDT9+3ZTs6oalwhF4biZ8N0+w5kBCKfGfP4zLkld217uQAhNqfT1d8gXwRP7bpgDW9xdV
 jBfCwdCXM11RzxIXYGTfhZFC5B3FKNaLQxS7Qb3mA+S56TdEwA9HXwcIHX8kO3ly6kr/JrTkNu6
 LeSGg/nlbm/1Cl2kIUDcfvgK40n4LH788eoV+X70UhYmr7VY0uB489ahyt4aa8k4KL4l+QZaIEE
 QSYVxLVW5acuKzR5H2Q==
X-Proofpoint-GUID: l4grHYqejROCcS9jybFQsNUfsHwH0MyI
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aea54f4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=d2CT3yyNdH9avgRve_MA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX4UE9i1jV6bLT
 jWdRDjiYoP4MucDynjkFfujzAjSbBYuXUDxh/4Wcbz908W1IO3AwRnx+C6D3dssPyu67gyPAAWT
 wKRKnZ7oFuXTRduiVf9xbeZZwKt4EZs=
X-Proofpoint-ORIG-GUID: l4grHYqejROCcS9jybFQsNUfsHwH0MyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 4's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Anusha Arun Nandi (5):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make timer and OPP clock names configurable
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 176 +++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 233 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  76 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 455 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
--
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
2.34.1

