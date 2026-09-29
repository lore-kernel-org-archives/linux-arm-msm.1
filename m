Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE745D902
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697234; cv=none; b=lYiYiTrrX9whNqE6nHuY1BquYV4NRo/9O3b1qREI6U/tuRIAQ0twoaaQpjfM/WG8uKEUP8cVGs6EBfeeAxlk8XLko0h1qG6SFipm38T3xr1WzS2KJnanZ+llicHeoesFVfZB5Nw0rarF5ZVGSx/U2OdossNlZ9Jjau+h2w2hp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697234; c=relaxed/simple;
	bh=V8T/HZqTx4GvU+WtHH+DR1239sZlCusGtl/R9hs7sYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU8iu40Ws+UNHtaYJBE4jMmGtsHjSlztU+ZBMLlZ9PtJSeFyqHBFlVaiaCg1oqOC4pmGdqK8ncGgG+E/OATsdzYeancopYTmZLu0kyQCst3sloMQ3RhklOdOV4UsY0zwTYlDMxsX/4RaduFw1eEAK/6Hj0zWToEanImq1LtADNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhnOKjgw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=My9fIeqB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhnOKjgw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="My9fIeqB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TE5iiv128756
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HF7WW0frYFZ
	jQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=; b=NhnOKjgwM9iiJrt1XPAD9gT1VoQ
	kdl6da4qmkDk29xup/YCjxrpSSv07tNFgrX9lAdljA6xo1kJf2r3vwbkp8UTDXfl
	5QqikRyeR96raOCcoTyC5JOwjnpwr1YslAxalmUY3L/0ntWGKmKtc2J/IRU3q6lh
	DoErI1TgaNEpAQ6Lkqo2TKJwrqKMxnHYIPbSJtrPNDugwmom5Qb9GwTZsGFISWkp
	4axJmQQ5F0lbFEoESd95LfC9czjKEdCIQL3BXXeUe/3vIAyCjTaWzbb/W+bafzOn
	PLtVKNLE1E1FCUG6DlleJWy9vKl8fEth7+C40iHG+5KfDUc7E74Tqg1wyew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0eswggd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:53:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34316295d86so7434748eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697232; x=1791302032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HF7WW0frYFZjQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=;
        b=My9fIeqBNZ1+L0XzJGyByzw6ijuSKWheXUigAqr1Uc6OKIwKi+TOp8Iaw4v2qBRFlu
         PUuedYUZbsqIA+rnJ/uTS5X/UM78Zs4iH5mqOjTHNrg4qeL4q68M+McYFCeRIZvm5M++
         np14fUQ6AdDejlQxyQNDFn0/xMQnMphanEOSY0fiZkrt36BwldFTutcAUnFVweZim4q7
         5/OjxAR0j+UgIzos3SgXeRl5o0XHJtpPIeQCsJMO4m140BAftwH8lJp1N6K5ZptZBTpl
         CRx7D9eOLEs2czgKYprwiXvRRcKtHAiOwaANgabcgD6NoJ23shzbZGpJ/TONnc6+ejQQ
         RXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697232; x=1791302032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HF7WW0frYFZjQ8r1xBiwm9g6hzgZdnYH69PyCuQ/4Ts=;
        b=aXaSnFcGXZkLFfqq7SZ7fmgBbn6QhlHhfWS0yXIsRF4/ns6FRtDZtEjPQE0Vk2tO7H
         h4HyRgwBHUP8t/RQIZa3sa7fVypytWmaAo2A0BhrGH8XgiKa5y+H0Ni/cRxe6xyZHmK/
         WdrTDA4NW23hPjhP+4Xgg0JPcCtqbjgT84FMioWI07KCh9egIcNi3mOZynYJbm5Vr8T8
         W0WM7F3iSmgcc0+w4fzm1scEobhTl2LnznDI4Pxyd+3JiimgtELzkfezzIMmoswo8yT9
         f/BeeLEdRYlqWlui2la44jKK/MXvqWh3b1PtE7Pjs42a2sqE1groTR/oi3vIkf3KvEtI
         13zw==
X-Forwarded-Encrypted: i=1; AKwUvBxBJvw+MupG6fxymBWxQ5oecxm5oZLcoxQomlA2ALwMNlI19/J3JLkloQe38+pURdXdRmHA58w3wh67AmE7@vger.kernel.org
X-Gm-Message-State: AFuF++mMz773Z4NNKTFzJcT9jQOoNSj+7oT7Dfy3s1/jr2XUohrh+1hC
	So9bG0Ykc03J49LD/bOnAWwdi/ltgs400jN0g4wNvR+Ers2RnUbQ4C+hjdH6m1MBehee4YLrQmf
	FDCCAxLb2a604U0d6uQWLNEn4X4abrdW5Rsqg4FrPq/QLlvwQxc5PD+N9J+21DoXkaFMf
X-Gm-Gg: AYBFou1CT70uHn0iHNJgjEmEszV2+N6sNpgvj9w8bS0Gh3837T0PfhGZrbeJNpYVCd1
	mNeWJeCmQq+u6vTSV2eo4AwsS9S77KiVBhQk1np78USSby/UN8f8DuLpSfpRyDK5qobe1FISu9K
	Ktuez3BMyYO4AP8zUTdwjNAiqBSoXYEnkREfiVOTXmLE71qzWC0oAQV9zIfgY5fh9y1T7Jrm264
	kmKSvDBpmnPMxqkdX5gkTtX055NdcJCuk1HtbrFJOOlZ/qZiaWJVKp/XNkBJP7LCdSADOype76q
	VewITaMTddZ05+PI52ASLikagFyvrGqQzNrfvnd57+FFWq0LR6lyovKke8LtE97DMDcVkUIjreu
	iMK47SlKxmfT88ps0/ukFhqtC7Jn1nJnDgv8c3JkT02Sxlzgo3JMddxPo4bs=
X-Received: by 2002:a05:701b:4284:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-146ce6802c1mr14559362c88.20.1790697232113;
        Tue, 29 Sep 2026 08:53:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4284:20b0:13b:3132:6e99 with SMTP id a92af1059eb24-146ce6802c1mr14559329c88.20.1790697231447;
        Tue, 29 Sep 2026 08:53:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Tue, 29 Sep 2026 23:51:48 +0800
Message-ID: <20260929155152.1898666-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX8Ma9mP8IvJZ9
 dlB+r6vOWS7Vn4F1E8/PgJWCu1SDD3UjzYFN+kPAUMKcYzMM0wZwEQUf0j0zh4OuL6zmxgNaxOa
 uWqdnd0T6f19Gm1KK0EEB3UGWWntjzZ5/bZ9frXvWA/79fQWU/AgIpo4acalOvMFvmfKvjzJoZE
 4aRj+LuriEM7T00ZgGQI821AzaCO3k8sJ3K/pGVu3r2awuIb+KcpkhjGipcr0rSWl5xVmlR2LDm
 t1Kms1pzI/XPxcni044UptIbR9/pmU+UjwQ+eT8lguFs8HihhBrbQpiZprKmT9Y/gaDjgFJ3XxE
 xN9yBFXJ8h5nqDL/sFQQhqhyGQLclVptL2T1W+Y5IozuzaIj7mDUx7EF/aJ06zpQiNv5Y8w8849
 RDk8iJTjssPUsXRFhWxY7EmPisnPncfz/3hOdvJps6nH+NLDaCNLYpfrjWBA9EMjXdYohYViVQE
 LIcgIbBKy8dVywM9NfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX7CxVQytmLw0y
 JSlMmdkQv9ijYvDCf8OWs7CB0ciav7J01mBL58NfsP+AdatnMCBZfjM3haVG3n0UMrruIj2b6M0
 2ONxyt3iEXwKZE8KTLgoPnj4ZLbhlmQ=
X-Authority-Analysis: v=2.4 cv=LaWpeTfi c=1 sm=1 tr=0 ts=6abbdf10 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QMtlPPnfQmPOGJbtzYwA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: wUXSqhJT8AaCjtctqLhDLzHWXzGNIHZH
X-Proofpoint-ORIG-GUID: wUXSqhJT8AaCjtctqLhDLzHWXzGNIHZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..0b0acd33a2e1 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

