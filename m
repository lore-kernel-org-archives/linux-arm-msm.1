Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618822;
	b=QvqoMeLi1t+CuIszRZF7ktdfi6C2CgDb5Wwa6j8mk4DzNU0IVISTsv+ogEJWfGfApq5Z
	 v0aTQRVojty5kLSN68wX7bIn03FZsuHRveCudWufifmkLiCNTeTtLijx9iJpqpJPGJBnP
	 reMG2UeDi8sg7Jg+wKx9Wcp+tnPlWFd2fUZDY9yJ/2vOgeE6pKSXssKAHcf79WFFLD6ub
	 l2c02UYpSV0+XJ3P7YmvUtK1DqLCpd3GaPj+FzdtPVSYji9DIN6w7zH0IdkmjtRovqsjY
	 YN9v2SkUK1RfsdsUCiGLiGjtAlb984X2hnDA8SkD1GQ0e5yLS4H4iG8ETR2jFfy0IYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
	b=yfkyQaZT1FgWzRuWuY1dhyxq9NXNpInjTMucGYf81WtLNt51X5z0cjxg4uMtiQQlokPi
	 QyopKsfXuc6QhKvymY0oerLWIW+nznwF9kcMIXEXO/1j8AH4tyGgIsDIuKCCvf7RjQ4ER
	 7hSPpdY142PZn3gNHwK566EEUPpLDJxdn3zLludhg7oGfJxFNF7lnMA06ii/c62++1C/a
	 0NM/GwY7JbJw0BroRqVjTf/g2dcjLcte8GKSn+p8gWA5ILZxFjbI8CvW4tqWN6L17Yhwi
	 CETEZBGt1IR/3NHVJzO7CJBQSBfEEkoS1yRocyDQOpgbAb3OKu3jFGLrf3ne54HzaeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKbRTLLa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIKW+8vs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5F7606A88C
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F5F7606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKbRTLLa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dIKW+8vs
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADMbjU12847223
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=; b=eKbRTLLaM/E7K72s
	RLRxu6Ew6BnHeVkKVdEae4DcWcxKoXXWqPgEDbg3ep0wV9sztd90HXvZnJ0GxWr6
	pJw1EKUwkowhHbftXlFG2Ln70U7OB5G0bCJinSx9U5stW7Re5nhPVA1CsvCGekgj
	HtULtv8K0+WbCFERa0Rrgdo0TpIsEL8Lr7ujCYvfQtaaXdd8CqBxcyqbTN+rJpZi
	TnOG516xdRz4DBZzbskEAIhMiD0+qSAq+qrBqVWDB74vag3TgoEm3zkrdIOYMH+r
	7GTMNX6vHbfgq4zWi6RMx/XoNqcvR8Gs/VFdJ7ze2ErMFz4fExNiICPHSM67DQvn
	d6xGgw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx1bpaykj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 01:13:39 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so2083620eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794618819; x=1795223619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
        b=dIKW+8vsisI6eXbQaORZYY+50SEcbQHOXuuoeo4LlUlvv9M+x/RZT58ja92Q8EKU41
         6K+kz63iug3vZRULvROVLEUvCW8vftOFOI3IrqqYM9357WqAqEzi20tiuU/oCbAFiRAv
         BlaRGPxdjBzP2egC6XyfrgTR2lNGMf+Drc29n6/KD2igTOV8S7IiQlZ+fWVQks8kV78e
         OdoIZFo+epjYXPjiz6zZLuORPguv8zuhKYW42z2WBVBYjyEh5XXjHIlc89G55glptYuH
         WXTrrb6rJWBa8bdvZPWfORUGdzJNPwDS8M0GhGs+gPQgTyRnpDIF9coCnQZggjjIuqL2
         Dtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794618819; x=1795223619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JuGhy0DKyNxM9PhxugC/t24NVoa+Yyv9Tqc8WSFHR84=;
        b=2T5ej68JG/isqTuOsAQBuvds1dr3qAbUE9tGFHLF3QEb42m+Temoh+aRXKUZiFGKQP
         vV2J4cIGOtKrQXmnXrjNVl8MWTGUbKGiozGiKFRLLf5jsp93pUgUcUHs5O2aGRToJYBH
         qoQKMYm/2GLntG5DLpjednc6pjLW0uVwYrhCOBWf+J1J+8CnFlhpYM/cygiwuKfY2DR/
         p/lakz7ynARG8cAEpmGMea781sxPMzGzELVT7u/cixRtg5vCmOWOxUc3u2t+Ho0edxF/
         LE3KXrJyY4YzrI2y+yREulbqrKVcXtErxSPBHbIbc8vhfebg7OrcUaBiFZpZQMP+E88j
         FpWA==
X-Gm-Message-State: APuU4Z/S4ToOe8GWD4qy73/rTD3DQapr/jrExGdG3BNaxZzJ5KQ96YAg
	uYq807c59msbsKUJz/y0/SvU4UGu7hWJ19G25/tqnPPzoggtBzNMQ+oYbjM+KOZNbS9eMsP9+34
	UpVn7mKzhBEzj2oPb72ryc7C8sWkmLYsj71znEsWbZtJg+GzPG3WH270kNOixGhVURf4V
X-Gm-Gg: AYBFou2nJKmhKpc6eqZMc1WXkwmszGi38lNYrJxWg6n0hL4cVg52VbKOgwHcUbDKNyZ
	Y62XuuahktqAQrAZyi/jTn5ePsJK5wVqrDA8pe7PkHFVMmLxETnDiYdJ+/UywpXO3k67t1QZw7H
	1d9mV7Dm5wU4xBfO0FFOCHVMXG7UAR4eNtRJI3daDPlo03DwePty33wn58m0/bCS+31qp5XqGNd
	rMcRBRbWV5msJJ0mMR2jHSJE/FmP9M1Ibt2pukD+YPVTxxhlbqupVpQ25TTm+w/P2jauBBddn1S
	JUI6+1zPxcV+kHxaET+MNlRBKqVkMfVYLFHTa9NdfIuWXcggktaAocMgwKCJ1K88NycA1/OhQv3
	poB29l+IKFZGMqo5C8DPo1GrRaYxXYF0jFUmi2/ARULOmphHGiKrrUwt9gK3j239/GxjgP6RjSY
	YNFmvXB8Mg
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr3618784eec.24.1794618818895;
        Fri, 13 Nov 2026 17:13:38 -0800 (PST)
X-Received: by 2002:a05:693c:4097:b0:372:7af9:b914 with SMTP id 5a478bee46e88-37967aeb603mr3618764eec.24.1794618818193;
        Fri, 13 Nov 2026 17:13:38 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10952813eec.3.2026.11.13.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:13:37 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 06:43:06 +0530
Subject: [PATCH v3 4/6] PCI: qcom-ep: Set initial interconnect bandwidth
 before enabling clocks
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
Message-Id: <20261114-monaco_ep-v3-4-7fe227cdfac0@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794618790; l=2784;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JLeyQVRs1DLYCFaBm/u2gI+HZ0uJrg1UE3jfNR2noLs=;
 b=fvyspk0gNdaY7uQRp393/Q8fpriJSfofzij+hrmrJ3G/mBkegWv16IKlyLq3OaJRr1OYC4lEB
 VVVo8dduRzQB/08Em+w16e3U3EKALc9ZcitS9Kq/wPOJyXd6wwbEAjQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=W9ytxhWk c=1 sm=1 tr=0 ts=6af7b5c4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 5pjdR0NjMd4RGtQAxhY4WCex_DvCzr_F
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX6SMR/WMMd7+B
 ++UliZdTYbyRVxLtodG4T8a39Lz6VwG/+5Q0m1gupPriPXuq+jnReM76/acEF1K2pV/FAixU0VU
 2ZaFJYHAUtxB2qDCbvKKK2Hms3yiJ3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNCBTYWx0ZWRfX/SNLDaF+1qkA
 x5jcAzXTPLYrh4c58BmFtOxW7zb5K4o8NLvbudB/Rvc4QVB6sf55oYgVlkATAC+GjzMxGAjCAPH
 HHqrlO9g+CfIph4m5LaNnYzhbGSO6WEtOYgAWCA8p6GLRBU/2sy5ZfoGIlSjjG62Xxs6BVLw7ff
 RlBeXAsMUQd1J2MAu0zo+gQ66dC0ufDSXadlLdUvojSdQhEwEaKfJwAPeIwd8tt3tZ6dfr8bVGF
 UgPvhYYWkWFU4ZdjVAR+7eHIeqTaJbqO4qvTlX/MlCJD6/JngzXSGPd9KQRxpUfh845zmbnanw0
 wONT+5qFVd1CAVrjs768JzsSOPQp5/AWh+ecyHw/pCDt8DytW+/31DXaKjg6VOJGyRrFb1rHX8f
 zRfOyISLeCtUALdS3FGvmsJWSeL6HPApk4i3rCoNWUvDUnP7U18nbaXGpSJ9OuyDIqmIpGF8TyY
 UBNPV9Sj5LnoVu7DqQA==
X-Proofpoint-ORIG-GUID: 5pjdR0NjMd4RGtQAxhY4WCex_DvCzr_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140004

Some Qualcomm platforms require the interconnect bandwidth constraints
to be set before enabling the interconnect clocks, otherwise some
clocks get stuck in the off state.

Move the icc_set_bw() call before clk_bulk_prepare_enable() so the
bandwidth vote is in place first.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2d7ddf8d173f..a753d8870d10 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -332,9 +332,23 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	struct dw_pcie *pci = &pcie_ep->pci;
 	int ret;
 
+	/*
+	 * Some Qualcomm platforms require interconnect bandwidth constraints
+	 * to be set before enabling interconnect clocks.
+	 *
+	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
+	 * for the pcie-mem path.
+	 */
+	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
+	if (ret) {
+		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
 	ret = qcom_pcie_ep_core_reset(pcie_ep);
 	if (ret)
@@ -352,28 +366,14 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_phy_exit;
 
-	/*
-	 * Some Qualcomm platforms require interconnect bandwidth constraints
-	 * to be set before enabling interconnect clocks.
-	 *
-	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
-	 * for the pcie-mem path.
-	 */
-	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
-	if (ret) {
-		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
-			ret);
-		goto err_phy_off;
-	}
-
 	return 0;
 
-err_phy_off:
-	phy_power_off(pcie_ep->phy);
 err_phy_exit:
 	phy_exit(pcie_ep->phy);
 err_disable_clk:
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+err_disable_icc:
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 
 	return ret;
 }
@@ -388,10 +388,10 @@ static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
 		return;
 
-	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
 	phy_exit(pcie_ep->phy);
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 }
 
 static int qcom_pcie_perst_deassert(struct dw_pcie *pci)

-- 
2.34.1

