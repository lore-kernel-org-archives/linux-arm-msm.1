Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46D4A33FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853108; cv=none; b=oP6PN2aLh/jBFXJvHA4j++Ffq7SUQ5sQ5oyM7Rj1tGdBCiiNtRRfVxnHXj9k6R7O5X5zLOQUsMPKftakSLqVuin2j2mutMxARn04mmpDZl/Itkr4zPB6k6xUOAJICsjpRpMiUWA0jtmyLrWdJxGbYCEV/FhvLJ7XrB0D15t83dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853108; c=relaxed/simple;
	bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n60X1C+Y1mlmbBPOpQ3MA374FdNdykif7XO0SzLharAAjHHVf4MO5bmjl4geFe067jZLdr+2sakbGjFqB+Ycz1Pb73Q8H1lxu+XPQKj+d1CxJMKbadn2oPnUp5u+fxwMJYoTk4EszEdyoCjP0i58VBgCPctnALRB5f97dNq9H4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1Z6dd2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6Gdp79q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1Z6dd2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6Gdp79q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdp9614588
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=k1Z6dd2ejZaZb14h
	BBiA2j/2MndoDiNZ3U04U6JUwtiVfZKYNpi3GsBPpNAcKgtFfOJ1M5gEyKHYFWGP
	+dAAXWRbjjpcRAbAWI4+PHVnuevAUUls25FW4l2pSJircAVOx4yUCNXxLkDO/hnB
	gDoBNNv03WhxxeOh9B9SQnAaYBlY2Yku5Lz8nBHHUlzXUdvLPqq+fP796h630+nS
	51n+L6GAXGEMA5qVZr5JxhVgjLHLjvecNKC3q6qOLU35I1WeDc27wOtmG5b9mbyC
	H1LFfhzsQSd5qAgy8FDp0A7rcZALqTIbUzKMDXsWZGmJI3lWjje5Ubj8RNZDbAEw
	vgE5ag==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr6988r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 17:51:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1c2f1acebso243045a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853105; x=1788457905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=Z6Gdp79qI1O1Re0hmUHhindvoVZy4j+Z+KkuudB91p084yxQcs6j+4GT6y7KbLFpsN
         QUN85vaRx+cqLNHER0zlFbk6qAg/iOGz2Uv2VN24ie7LuN1Prfl9tZrkiKVswi0Z/3hL
         qfAdsI3axt9NTS1ndNT4ISIa9W7/EFPVITcm8O+jRysx0XON6nItam6xmXVHu846Zp4Z
         zKo9ONaPFGc0W2cM5pgNeYp82Rf7378HCF1ReP/8LbDW4oQwoJ6ZiL5XE3sUTboa6RvJ
         42Yb2RKfCvMc7VoYMiVQl+i3eqwAsekzn8jtxxMpgaEMBI+XOyYU4z+Z3oFZxiJLiaAn
         lWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853105; x=1788457905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=TmKH0d0jd6i5l0iTdrsAyijF70vOxZ37pTjqfzrbJJRcY3WCdgdyMYUo1bCZJT3fQs
         7zRdStYkLWMfjhLrNALBGalXFrA56F2oBhyqihyKSoa5fWqdMvcB0mG9cSh7o1AlfbKX
         KvTMX/46uiBnkL0+ZRn/2D+siMAp2QyphqAUv49WGB+BwxX37hOqBQC/OH/facW7Phit
         YTCmnBxZffo6H+VGDG3eqojcxycvwaFnZX83oUiZPtwwC9A/gjssjV/EGcbcJj/DSFhN
         2OwC9ldxKDMRZYgP0yNZiegvgH8O0IyFa7fkXwMIJqI0FIUhpZgm8Qc4yw7ITLPJ8pKc
         zIZA==
X-Gm-Message-State: AFuF++l4QxjC1BK4rMrrka0XBJAq5Kw5uPGydQ1/U24JG8j4fmtCFxtz
	rho2iID9sNVvrdkwMW5/BgqQnYEUbhXD/cH195B+SJPRwv17bEK1uA+yH6SUZZO6x836TaKYHzW
	vRKgbs7zddUeBiD2cDSWDX5Hb1u3Xs4cyNI088I4BpX4+EK7pzz7pkAiV06UvNUyWuAkg
X-Gm-Gg: AR+sD13ljk3xpWiqEQNQAFzgPlPx0vBmyELmgMAacXCgsf/8vq6ujhyR9P4MuB7pfNX
	hlc4O5BHrWzictwr2nLuqAVAzsxLXvXQ8TWubWxsqYCWRbK30/Iqc1pER8k25EmakCn1CIqP+rt
	s9qtWyj98ljo3tq48jmv0/NAb38DYTY55ZVDQap0e0y12dNeHSigVArlO6ZdD6JB7ev8eww/iae
	7CFmEtwV942flCwtXcPUA66dBrbKVRsBpMYdTvaSmqiiIBw/OHXSE7YZhbjgtsdSiSFAE1JZ2r8
	wsVXlG9pNKORqUw9Ru7aEyRwEQJKxtJfi6xkTy3I6/ckppybybXG8S/Ds1cylF7nFyODgJu3T1R
	OHos13mAkqYFLilnZDclGTYl+9805mxtoUWaZ5GNturnhKnqBLV55Vr5AVlque33nZkqSF1pq5f
	BzA6HqND/Ae3aI7fA3G3R+JdI=
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12274895ad.6.1787853104489;
        Thu, 27 Aug 2026 10:51:44 -0700 (PDT)
X-Received: by 2002:a17:902:f708:b0:2ca:481:de45 with SMTP id d9443c01a7336-2d74dcb5c40mr12273935ad.6.1787853103968;
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:43 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:06 +0530
Subject: [PATCH v5 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-3-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=i+O8rfJxoGXvxVb8s0xUN5ycmjvQA1VLSZzdlTqgB5ei4txrnc1hXqZx6yMSn+P7/kHrq/WRq
 +uDDOAajqMPCrT4rDfEz7FVT3k6XSqnAkUgQs9SKUE0OU/9v4bhnuj7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+1s5rJlbAbek
 5eL582PgtDyCMDYhJccjUgnqAsyZ1z2EVXrgF9dJ1pTDUY9HEUuxL/rlSA8bzNghYx1dPUamGr0
 zlwoW3+aFMsLXHl87WKB6RXHs/8yQ7jPFZ++N9yI12I7ji35dyPBUTkQryi6f+cY+e7fatZ3WsO
 AhKrKya/zNyyr/0raWvKSVj9SRK+22o4yZ4ZUS84TRL+CAvBuqXqmmUUmCGLmbdqwy2FV27cTnq
 unB+iIghMI3ZV8ltW7SzxBCAWAxgWAaVBBqNwxE3uYzXGp5hFxd0EFjncY4qZY/E3idmcYC1pLi
 P0RqQ1LKgMhV7u0OgViCbeIlavHyPVWxICIDFAx+f6pn53K+eo+VuEHlUXTdb15Qs2fp96KI84t
 HELaL1JMWGuzW1T/ar4Dm+JswkpI0VDGAl4tbwY+6FCMzwuXAwnGP9ZDK6ZG2m/DXAlkGni83Dz
 GvrPqQA5OW7QbFeVgOw==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a907931 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: a8eUiPTl8ImwBxFi73XsSDs4LEnxfUAa
X-Proofpoint-ORIG-GUID: a8eUiPTl8ImwBxFi73XsSDs4LEnxfUAa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX+tu3y0zYn4mi
 GuV9tg75d3ZHGBSfWLtcGT7l+BZ3HQeeLw/Tkd6FNi6itIi2p7+B7WgZYnpCqRQ4wKlXyT21cNo
 cboVOA8fTOUe3jLDzjtAm7l8qeUNjPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0

