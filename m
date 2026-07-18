Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243383845CF
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379418; cv=none; b=j81mp1gvrzl3hZcbskghAk9s6k/32Mx/g2ifAiZnEwVielXabvzOThAA3iCJn95gx1BZT+8qVOnG0Y9uD2VrT24ya03A2XrI07GoCE0YvpBcgTVDaCTR5EnNu7ywqyu6KlFsEyC+17+89GYMtfd7JkG5He7Q5yny3BWs14ogVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379418; c=relaxed/simple;
	bh=dGEfhAK4uupgOhUwPKBGXOcYT4gsGsCJr8Sy8qP8Tq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YjxmwTx1JgHQxZzZk/PsR2z//01OCkBAky516KMg8A152yZgFzk6IoDve+K6sPN2NKfRCyEY66kd48wTetR5mz4cGa9HjiXX+pRmhq7+AaiWyMJSB+G1xAUZTX64qw4Y06S/5LpppA2fviLqE0M8YLsApUw2DfPdey4XGRa+lf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liYCtQzi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/MP68Xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liYCtQzi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/MP68Xi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAJakk421458
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=; b=liYCtQzi9X4oMiJN
	OYMXBtSZJBs7I0iIukH1G7PtEzvA3iQYt4L/HLm3xHums3jeQ54xjzDhKs6P0PvB
	IQ+FOg/F1+Z19pV9jBGJNUjtVi5hDa1DSdZRilZgcjCFdfHamCC5YDvVi4MK78X3
	77Jxr76CENUhSiWztDwNubMd0OFHgLWBzVpXI3Qq7vjJkbKwD77B8qJYYJC+vRpF
	UsmBAtvGVSdNcOIDzUHmaJblBrBoHV6YquxhWA8fuLnCBlt6Xwed2lZ2FUmX5A04
	drnRDoHGi5wazSPQb3deyazLBJ00yyDeTr1Kc0Ry11XfX40Oh2jLub9RAaswczs1
	oVryOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc0s0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso41407145ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379415; x=1784984215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=;
        b=O/MP68XicPUrJa5BNeG62xJde/HCh8eQjjK652wyycti2VlhKAc5SH3HJ/IEv6pB6r
         MCyXVk32qz/GFZRMRsFhlMQA838EePYm+8EK63pMsC3QtC73otkTislZxeNO1fLMWJuy
         wLLGq900ycdgF/gC9FMLW5YrvdQwwKUH+Q6f1TZD04YmQO0ad7rbPHx7+i3zCkaLOsMj
         aZFFqZCZjioKyAC22OgQXND72t57MaxULTunk6/GwnuyL2InC/GQ9Pa9aUnmVK28jmfu
         DsWUyvarwmMvo7vvvYIuA+VzO4VuWwWgLbVV4g4+NWTtDvUtI8dAZWGgwvrpIY+DGFfE
         6Iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379415; x=1784984215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oytBSSj2PCcWVbML0Rvj5z8zTJN6Ww96sRR5XsSIIdc=;
        b=Hb8W4qNpzbwdKsaii7OMMBe18/VvMjCNLeNFPBXN5XW5htbyJK2oEqPqNm56l40UBj
         4XEKjLby1C4jDS5JSRqylE0oDWFy3fYfSEej0dYrMbr+2gtmkb0bEJupBaBg/OGUXB0/
         8yz/4se2gPaZZUE7vXe8zA5mtLlmOB7hD1a+glLg6aX1yPa6ZKRDJ3JxfQ2SiAfj7DNj
         SxC/KPIwQBXLyUTruzBZYNxdVU/HqoCvY4oTUrgwCY8D8eytPyHSXNFNiinYCFddEvQu
         JBpUpQcGZt2bsMNqXyln1z2TSvgoc0Z1uLhDnoRmr1QRg88XYXpKK9leg9zaVL0s2QUK
         OhCA==
X-Forwarded-Encrypted: i=1; AHgh+RrWh1Irqyyxp0zX7oNLBMYGqH9XHiIYpM94Qjn3a+MPjLGNhqO2DtXgyt/XyRnJagPwI4a+F5sCBkONA5GV@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZ56lpU55FDF5/6/LOQeu8cSi5k6MqdKd8gRWHKFvogpFMktB
	bqUmJ1GGdxH6pjTNS42J3crDp79H2AmahI99zCreZVAUVvXC53tML6DDsyiHbTDJB/Qrp03hFGw
	TfYeNzcsK7YqL4p+La+tjxYqsa1ygGrehavFnPq93qmNkMtKk4dGkRIc71g3f8pIqOkUX
X-Gm-Gg: AfdE7clb23STlDdCLw8qaX48ZrvDHPDowjk3qmZ3YmsebpE+oyuPhscENOs3e4Fr7oM
	y6zMUZT4SBPdf7kPzrNDAU13L86rOot/fvSIqKT1cYkgVUQKn8ZPtym4S8KluCEEeeT/o/yL0Ay
	TMQIQ8JSsxTiH6Yitaexo+/NjYI5SM5p9XUU8824QlpQtKXTvS7amN7ZpxZC4cllB/59Wg1LKcE
	WpLazK78tU/0sMDwZOaSg6yRVXdvDfaqWvSB24/TsJBMfS608x6JmouQKOY3oh4XfYQdEd4GIhk
	80U45PhayVJx6H9Wd/jy018MShtZOENKNdcFLvd+gfkYhy1dLMPTj92ra8Qd/N5a6ChgPivZypV
	R/KwjuwhOe7N+IVTgNOZLPT8Cdlwr3t8=
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr119853415ad.15.1784379414935;
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
X-Received: by 2002:a17:903:98d:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cf1f4bafecmr119853145ad.15.1784379414444;
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:54 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:12 +0530
Subject: [PATCH v6 05/16] clk: qcom: qcm2290: Set POLL_CFG_GDSCR flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-5-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXzwnEbXrzGmH0
 l+OQXinJdmiSzTVPORslulomUWGsnGU09iy71aSPOohkjDda75mwF/E9xJseLlWT8oZf59oz6me
 S/qBkzFx94L7Ct7rDyGySrJdm1IHu90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX+pzGrxdAqw7q
 bpskEHt2bgkdkX1SIPYDdA7iZ7sIrQo8lBiEWT+ffjiQW/y9BZXRINEQAksZwuX/HUfeEmAvwkz
 vIrA/tELZ0zbZe8H6T3lB/kymVATcTy8X8ArADtdi9+0RoDZgy8+wTqdNpXMvRFCCkNKGJZuXbE
 ZzRiGokjrxPbEBGDfvikvTKhBo1TXY1R56D3HeNnh+3xLJw+kiMBttqI9SHGxemRPD1aH73oIm7
 hEuA7ii/9EdSTt6Kk7APpdlpVl81xpd8zzrszhiJqw1dpmgZi/qDJjsk9rmnNIzlwbvEzYgC/2c
 dqFkO/qfzkQvDKQn7xlTExIw+O6wHcGXKvtdlHFueLBD3EbMvWn6S+IIXT7tqrQCBoyM8MTnpx8
 h0K8d2rKFP3QgUbtGtw+dkpo4q5N93W8bKlpl12z/gyrmGCxh1AU7QJvpf1q11vOPpsAu3hHNCW
 NuB3eSicaBMlO7hYg3w==
X-Proofpoint-ORIG-GUID: _7BmJSKHV1VruyC43k1Q-NFGwZUCtjmt
X-Proofpoint-GUID: _7BmJSKHV1VruyC43k1Q-NFGwZUCtjmt
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5b7817 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WgD0fBIP9JuU60yQWEYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The Qualcomm QCM2290 SoC GDSCR status bit may not reflect the actual state
of the GDSC, instead the power on/off bits in CFG_GDSCR must be polled to
determine the GDSC state correctly. Set POLL_CFG_GDSCR flag for the QCM2290
MDSS GDSC and GPUCC GX GDSC to ensure the correct GDSC status. This is not
applicable for GPUCC CX GDSC, which relies on gds_hw_ctrl status.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 2350ce7f46d9f6e395c87c7a00669b10e8bce3d3..5f5bc5b1e09e2207466d2972ded91140ce8a6ecf 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -455,7 +455,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 66dea9d2a0e519dfc64d977ef107b5c875da3869..3b130f69bb93898ce49654f2366851a7c1c94524 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1

