Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05CA4457DB
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938310; cv=none; b=fC0jWwESvWqUJuwnWY+Alc1mjANxF19thzWlVH/p0b2tdW0+4cwrHrA778I0gNb+cu5bfwQCSIi0rGurquLUMUS7mowWp2uZvaZDn1HKbuHZnEBxPuQIdwzXqA4zHLKUIsBA5N3rASzMuXrcnTU0j70HKhkyAFKfCFYkkJk/oZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938310; c=relaxed/simple;
	bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cim/tg59vwJny962mz5Ck7TbkJHwCnUiRwxXxR6+JOwPj01xJT22K9sikwYHmyhpwDE/oxuRErIgquEJP/WX3J3IVnhEwYA3QCVGigYtZ/mv9SOzH3hpRedXPBzsc77OgVZsTIPFq0iO5YNL2c1gC6RRqjqbFKurt+w/pDMbueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnpacUt5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bFtXdwDb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnpacUt5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bFtXdwDb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893qvvk163687
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 07:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=; b=KnpacUt5mqKfOJu3
	bP8t13P2i4Xmj6GSMbWq3DSs7N/YCV/eJXJ7qZvEHLyy2BibcePHv+U6Qkql03Mr
	53yRpjX/BnT2M6pMx4NIOywjGkUT62bquRhmDomo7l2kOcF6BQkchJnag88xNk1Y
	T2uLoPzzYVwcSGCOZphxOiZoOSwkSpDe0moWbxXNu8+39zK/L3wHSY52/pQSzbN5
	kcsIhCUGd+RzHZtma+Mkplq3PnRngPbEPzz4m2b7q87qKKLA/ly41OppCUPsL5qY
	VPj/aCMkr0ZKy1UUAtgt2LQFRWtXM0zxegqR3guIM+MjaJ4BGcoR+eDixeqltaVc
	8DtwGQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjyxm0r0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:18:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc132709c76so7587244a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 00:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788938307; x=1789543107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=bFtXdwDbh9BtjWQfpqouEdZkNkOJ2QYEb+VFuI9ClORVTTnk4LjIfBb127my0fiwcW
         N3u/c/DSBvfjZlQKrBBPLaSBSPFnjfAi0C2L9npFNYNDjPywC/Kl/2GfmsCAzCkE9kwn
         SPCaiYgssK9h5sF8Emxee+VwukySW6PsEztI1peCnG4vGlE3d779sB/1voa6G7eBgS1V
         4nknSVC36Qoltb0njQN4QoGzEu1Tsr2GofB5UdtpQbDnJi1BmVmMfttfjJhHa7pADrah
         zZOhOR4L5a6jsKY5iTzqnvXNngxHSwUj27OWe60Jzru6XW/+rfn6QrYm+PP7xdR5lrTP
         a6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938307; x=1789543107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3StvAQJYDI9ePttlpzxZnCtj+uDr6O+fRoh71JuwC8=;
        b=DaHNt6B1xO04EuU5bZpAukKy3mltorxQIK6VVT9g7lO4RotnvvnbCicj1LrswLYCzV
         kuJr5+XTrR1DXEx5QTYhB+fMtF0DtDM84cW1p7zQ2lBXD1hsZNWsSFMAwQGTWH0hlz2Q
         SZGTXDX8uSwE+2A6A5uUszJNZr59H2WKcpiO2oFZSmPUhfrc8tsTA/9lIdg7xgXt20cx
         FeUzin6yoh1wRwGxn6LIQhBhft6Et1NTxcn+jbgUqd9afcKsJH6MewCGHqrj2XRD5+kU
         4bU7seNqjDU/KDCTGoDVFCgwdYwiutECqhtu3L4a6/dQ7SXxOIPD13Y6i9yfAKDN2l0I
         MIvA==
X-Forwarded-Encrypted: i=1; AKwUvBzTCOvHxP77yrFzRWmpFDgvA79msn0ZTYwkTvuc444O+xCigXhomP1RpNeASA4OXPsqaWW+r8Wpw4J5IM3d@vger.kernel.org
X-Gm-Message-State: AFuF++lLmwO8/+/Ex2GLIBwMJE30Fck8hpdlxD+EN5AxQCTG/Qo9+G6R
	qKJrCXXnOvLDKkZ/Jknt9DFXz1rnwAwITRTgYnhh7gcl+dJVolpUfScwDMhS5Yz1aPWAngOPnrE
	t+tv1fClCL5EDzdNLaZ3EvLcigKqdwQ3HS0eKE+jekl3NIBNd514IH2Y3fv/0Yw6ZcQ0S
X-Gm-Gg: AYBFou1Fzlj5EVQxYplKOlPtHGUna+PEP0F+SMW/tnfmpsWUxzCuK1qhGed15PLe1DU
	vu5yAvu2tcKhBAKu1S7m9bGRlsa/JJwVKMhKF9sev8AdoXbvhWeXnIKKKwM1AUU1W97SdDvKBX5
	k8dv1+uRaz2/iwoqh66PHcGI+oN7X1H1rWihoBQJkIkBGfTyeSAuo4yUZaCgInmyZPBY+sWRLMw
	q63Rf7RWipta6VTYYmrTOqBu24BgJzohHgo9Z/LmTw3AQDimbMGNu7YpH3TNjWn8XPH5w+qFCaw
	HvqILKjml7qd52/XCVQSTio1dTYqlEwCqBq96uAlJtH6xCV1pcHKBPzddUc5Gp3KXVQsiG/tnQq
	LNJqOfkchfObkKw0zvGCecOZG72ykaA0psj63uyPkPxDfbgF9vMQuShhjAXDlE3hb
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778764637.8.1788938306541;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a44:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3da39e68250mr52778708637.8.1788938306123;
        Wed, 09 Sep 2026 00:18:26 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm48308536eec.7.2026.09.09.00.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:18:25 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 00:18:18 -0700
Subject: [PATCH v7 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-kalambo-crd-v7-5-f5685804478a@oss.qualcomm.com>
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
In-Reply-To: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788938297; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=P8CuQEhXW1fMhFKa1ABt3ale4EsqUaPUHgiFlWdjSNw=;
 b=CTu1SSploTT+XX55GZxz+qJyblrDe4SzV0qDNtolPeb3zYrAQG6gDezHjnMCEJya9FVDnlBj1
 dQMPH5aXSXcCMppAnvOXSxjQVgocuqwVYSy7FVIxDH3ordFoYBsJhMB
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4MCBTYWx0ZWRfX6NTuLd46Kiuq
 m7b2ICoe+zuRbNoBx6zwMLLcXB+5IH40jq9aaEFS66bM6vJnMLEYIR1lKYUaiRmv4A3GTL1oE+U
 K2G2TVmDtA65yYuI9BEnp/f2FV9Q2Xe/6WTBesTwZho4m/QT4z5gYT56ToSiBYzTTEBbxUI21Fk
 gae129CsYC9/8AuwRa6rdXnScM85GDYSU2Qhlaza6vUwO88AfnozJLVJdV5Jk8amWlULnjKAvkn
 A8sKje97wfxTHicq922c5zgjs+Q8+mJaNUr+GhZwLhPAaLeaZrQ3YHtmYMN0UssZ+58+EPuCo1v
 TT5WzEEugsWJ2cQ/cNhapoUB22/zRTRx6jiMt4slB1jT+k4qivl7HgBSZWt+8erWd8YHICX6fa2
 Up735hm5nQFJH4Wgs8s0v5deHlZY3geu7sDX4SlN3nE/zBZZDDux0Q0LCZZNHkHMh6Fc/P8XHhB
 YQ3G1XhdRrzenQxA1ig==
X-Proofpoint-ORIG-GUID: 5zw3MaRahNJYacmWaAzul0SpJddS05kA
X-Proofpoint-GUID: 5zw3MaRahNJYacmWaAzul0SpJddS05kA
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6aa10843 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4MCBTYWx0ZWRfX/1Gx/CwqCm1M
 cnMFGuLUxDxpKc7Z6+WysH5LeJoQj9fCPaRgHv2EUUDdF3Q+pxodoSSJuhewonyIGg+IyfhZDHO
 9/0vzaxc6CpRcRs69+GWTnT5ZNFshYc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090080

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index e593386920ed..f67ef41dae09 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -121,6 +121,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,hawi", .data = &ubwc_7_0_hbb16 },
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },

-- 
2.34.1

