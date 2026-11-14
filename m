Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618804;
	b=s+wPaxFam3wtcI/erEpDJKStP+rhacOsKjGtuBY+o2I8/OHHUeHLNAz4OHe7lz1xIM2D
	 kC7yRME66bH8ja8ycNsy3XkJswjj++XbAc3PNDNiDX7RZNPqRK+ioSglg+YaVOK8keR4Z
	 jaKpU5iYrdpo8vYT0QF8a+/nt3kSEGDAeh0veNdsu1O1DCadYv5EUkmN5cjD3Kyk7JTdE
	 0EXYW1mefhHwJzvmTJ0WBRGWsBLbfJpTZYtyQpgsQIwVyUdOY5xDhnHCODXY4ZZn+eIQC
	 3FS3lRK2UMIN0srFxsM9Zp9irX1eDkkTdsQB+yyPzr4FoZ8XudSSWyJNJEW0dLpzpRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
	b=t5Fv69TFvjbruB0ShkZlkbwGzULxal8zt3Q2AFyfZO4ed5o9lOuizxsgYWuB7LbUzU+F
	 ikF83bug9bBklm2iDSHS/KmPKc4W4XSfIAxein2g641JU+LtzmVkWhUO46JmjC05rgtME
	 81yyPnYtehKtRBan5eDzF4ya0xRV8/qXT/P3mwXJip6Ixfpl17t8Zf7zp+kZ6YL1k8CZm
	 EB9IcgnaP6Zsn28LhvvX388PXN5NmqzLIqU6aTm+YHcAkibYAv4LuzTxlQ5MaJKbFTnLB
	 iZ16bD+RuccqBBIUvN9xgofmwwWJdontd4tg2sQMgafP+LXPiFiL9q0HcNJfmSMCO2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A7B606A889
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60A7B606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CY7JYz4b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpX2Usp3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbQVg1852757
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=; b=CY7JYz4bBwcC7CKk
	4lP+QE1DtXSgTu/2oE89e6SrIMXJY/UzMyuuD3AT9QM9wnaUWUzmSJr7HbWTFcmZ
	BiTN/BOwSHO4L8RA+SjKZf6TQr0JOGj6hx2cZS+C9aFqnU0dOmcSwFr30Lilkddp
	fUUVatB8q2GswZInZx8dzUL3TqzPiNEUwjM+h0CAG5rwglR0Em5Njlvp4+8mYnD5
	pddU5RsO8aX1z9lnpDhnaCtYxWRGH+kBQgCwAj9RX9Vs2neVxcHZ/hBV9VT9WBfX
	GMaB6cxxd1oaQOZNiaEJHbhvaCCLSHCsc813D50DMfvgolAvGe+UjiYNpCE5+wSr
	Rnowlw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxahj0na9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2338070eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618802; x=1795223602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=TpX2Usp3gNY6oebVbcqEYaohAacT4YtlLHQ/hILiQE9/T/MFcZiQujg4aR/eM1bKOM
         ZMae2tw+YIYYk2e8QAUeO7IJPaNY132guZOzmvMjic/I55FkSxDx1I9c270i/7Qiv4IG
         OttUdeOaEv6qWTronKDHob2hB7Ny09pndGPihKbi9EgCngDfmNpTPjlUYBDMCYsyKYV4
         fpflsC7pUzXeHDdD2mbrOPaC1aUA6mc4vghS52KUIlyrmhXJde1jZBpRBVdUrKuqtsRG
         ZTpCR8siPYR7amlDXQeqHVaZQJNTZgkmBjcaO5HD5MaGNZE3u+p0rA0QqWDLQhst9h1K
         9zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618802; x=1795223602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjC/Uqu8Fpc5YyfEaSNx3RgivzcI3gmA2KSFjoMigrw=;
        b=yeXfRAx6z+Wz0lkdyRZFBlDHM1NeJ4bGMWMoDWvF/bqujSAsQNLlxoxyLiB2PvrWaO
         KDo3DlvbzubFA4c26uqRx/ICFKFKNtiAP6qFLrX6pGWBNzIwxYUlLN4ba7AJi2sqYDF7
         h15/BLcZnt4ofjoRIVG0GzfICLp3wjYc8Ha8w43MlF4lp4mD1ttiVJObEAjvgrd3NrPf
         mHdCr1Qz9vi8/J90PfwSPcPqVjz7afUBWPJUk7ZavcnRBQEbB/gmvqQ1cSuOnKTsmqwg
         cAs3bXnJwvZWMZZYmm0lR64IOYynrizqPh1zVM8TsNar8oo7hourC8rZztR9XFjtYofD
         0WdA==
X-Gm-Message-State: APuU4Z+pr+EEgLM9T0PGc3NK/WxUAuLruJY6YErvqm2kqPkrYGf0oZl+
	UFQGM0aQKfGqKNLoFVbkAz5skLmD8sQOcRSqk5J+6jd0ob5V+siajPQydjZtkdvBTGwOsvg53JY
	vZ3Dxd6un7GiFSy4YoJAhnzH4hHu/jzJyUJJcA6YgZ2ZrZ0mhKZLRdq6oMRDXl/vVhxJj
X-Gm-Gg: AYBFou3DmA52B2M7wNa7Wn6ifDF7cegjuOhMDx24ctdTYV8RnsDcgeaU6cR3nS5ascm
	3LKh82TF16RH3GifBdeeNtohD2M1I7DrTNoQ1kNGbsP6QbxTZV1QjJDvSYWbPYL4bp7rFIcCGU9
	aXuSaNNDI/R6oys7aJp03M5tcQud0k9t8Wf/njhc5hEVXpTTj/0uX+CufbyOVml6nAO3LEn9vOm
	fo2XedY/uw0me8OUY5I/Z0mK2orItwAGGqvSqLDQweWQ5GKc28Lxp4kAJm9Tz9uIHup6dSl30pt
	slqOvk6Mc0N5dxnc3NGxuEpVMnRoxHTkJUAGRjlnZUZuWTCzLozTLS61DEmSK7HYIb4I7J33e14
	o9ZCd0G8m1EERzj5HcOA6xQZbwUYydE736aWe3l0DHcVJgnIOobHVE1VRuzhoxTpJCVks0PWsbJ
	kFg/PIHsAR
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231043c88.6.1794618802259;
        Fri, 13 Nov 2026 17:13:22 -0800 (PST)
X-Received: by 2002:a05:7022:1e0d:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b503068228mr3231019c88.6.1794618801698;
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:03 +0530
Subject: [PATCH v3 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
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
Message-Id: <20261114-monaco_ep-v3-1-7fe227cdfac0@oss.qualcomm.com>
References: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
In-Reply-To: <20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=1515;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=bU8CCkmWS7rC2poZZ53djxBqRGU6cUp1YOnSmcwnl0c=;
 b=zMfsxTErxY8hECwKm/R99bDrh33rFO98c02vXxvjBrvEcS0wCoMcqiVEOgmOdFGkJv9hG3guR
 H5qzlkBd4oCBl573JqURKYdapEMgFG5Y0lETKX9JhU2KrJXGhQz7T19
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX6I38NTutF5z1
 NpQGrcwq5FtwpIhqTRAJ4sAlrtwY5JKzI/Pq+jp0+eiVgQpHT4nGnmVyF41Vch5y2JBUcAuzQk+
 hB5X1J6JmUurv5aUiquEq7hSHK3G2ItZe5KrWNsg2xwbeAof69n1HIXg4Z1reMXHr+gXJQp3Xb2
 BouWMt4ud5qeBud0DSy5pr0Xfx3tuApdURN2rTjgrcgsTmw1VJwxijDDotFiUvlfQsmV9HVTgqx
 NEEfpQ3x8jDKDVxSu+pln+4QNFFoDjaAR7le5LH36sOuVPIkH0h7pKgeHmcCHJyw9NbqwH4O+MG
 KB2bbK9RBVeiNavvV8/FzEDY2X2p3uWKA78e8kd0kvp6tp9h6FColpYfhNILBM5RyGF/4fBiyyo
 LkNULrWU398kb4FY0ljyR+TqR8iAz4uogXgaE9BbDDBkm3jlp/G6ifyTrXT+8I1zjPS6+1DF0Xm
 Aq+NVKaDXPQMuDwYvOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfXwwx3uAuUEAOP
 rXrSutb/olzWWpLXDWeIg76QeHy9Ua+M52DurqFRsk7j1U9zeL0Ug7+0wt0ZHoBlRMhgOLvF3o/
 TjphHWWoXUAT7yxuFI/ObVdlWibXHbI=
X-Proofpoint-ORIG-GUID: 8tw-37NHOATCsUQwfEFToVanUz07cs2y
X-Authority-Analysis: v=2.4 cv=Kv/YSmWN c=1 sm=1 tr=0 ts=6af7b5b3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LyAK_bMyhA_l01y8gmIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 8tw-37NHOATCsUQwfEFToVanUz07cs2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
compatible existed for this PHY. This was a mistake, as it left the PHY
undocumented as QCS8300 hardware and indistinguishable from SA8775P in
the binding.

Correct this by documenting a dedicated
"qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
"qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index c0a3e1f160ad..8d0924fa928d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,maili-qmp-gen4x1-pcie-phy
           - const: qcom,hawi-qmp-gen4x1-pcie-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-qmp-gen4x4-pcie-phy
+          - const: qcom,sa8775p-qmp-gen4x4-pcie-phy
       - enum:
           - qcom,eliza-qmp-gen3x1-pcie-phy
           - qcom,eliza-qmp-gen3x2-pcie-phy

-- 
2.34.1

