Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140043AAF52
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260468; cv=none; b=P+nyOhcNRwkv7ElfX+Qg212XftrWmVy45ejPRfEY2WmaYyxjDW4/YVU0m05mJPwY/LAzTK0uD5GK7aHl7Qt5+71h3shqh0OPKUwaY+mH+rqToc+qPMj2QP42ArsMgzb0nG9EcHuhaX/In6GO4u0F1LvEkggTHV7Tds1NEEa9hx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260468; c=relaxed/simple;
	bh=j7kvLZyfBPOCqjXC+BDepJVgM7m3/VcCTgkhkXmjsMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0rhWNA/rg7adL2nKpzwhnN5OCWOZhOpT6XehaJkU8NG8sizkyF16aa6T8LrIui/DR9i4rOcfd4kjoWTnvhBBq12RMpYZ1oPMKdSq0nTxFjloSqQ2ejR69kAR3UcFw3isTX8TnR/1YUqaMFkwSOz/kvuPZdtviiNGKGbsvUGUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fZ0Z/Ucf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GPABi+Qj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fZ0Z/Ucf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GPABi+Qj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795mjBd1644524
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=; b=fZ0Z/UcfLTkIVHFP
	Z01Vb1RRQggdzXWOz7qeF+0sJdNQjpfKuQOhhOCmhyVk5KsISNgOzgjX/zK02lhD
	/WuSf9SbWULCYNjPyMSOvmoqva8stW82AdzEksgB6fZdtDgYKHrm+5sslcWoba/D
	RLCA1y7EnNTQl/M/j6B3gr1TqdanydlGiKeI8uLU8T5kSRta1/GqtDSQx6HVDkZ5
	z5jW+dIQCpldl5JJ7jpmTOVMCpoM37PynbznB8L3DoCn1MU3r/jC/K/cCqAF039A
	lgLcEUKb8eJ5LdEhoFMR1HZnZTruv0FGPXRQbddi/rs+KDqyhXIVBbR5uPZjLkUc
	DFgNWg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvu8jehf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:27:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso573706a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260465; x=1786865265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=;
        b=GPABi+QjGxPBKvzjSegKv+BfVVFPX18mfR3wgzBWULB4Rw0xmP3LeUvp18QKNBlBrD
         AgCGU8hO4Xq+j7C25Rs50gnC1ycKz5KP7G/uYJR/e9RO/4ntKiXOBK3C0EdfOFRKvbPh
         fSfsgnwY1xlmXR0BPO07/61Pi5Q3S97X73eIn5CaK4wkAH6NxUM1egiaI/cJnPso4bAw
         IlBtKUkaJSWGghlZ/tvpqCYB8NGeoMsnPDx/85dm201uTx90WUPTy7yhMNC+yzxmGu2o
         NhIfjiySWxJmXaJIgZTlFIf3ed7CY14jLsR41pzEFTjInjBEMEqM/HJIK0IppgUZvPq0
         LF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260465; x=1786865265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tPicA3rc3no0t8b09/hiQO/EbRITwV69iZQgGvLo/I=;
        b=g7qrPUHG8J9x+Xxst+IFr+QFluyms6ONu8te6y0nxQjPke+wfJufezCB9LhaSKTHgl
         4rd9lU5KbVMa8CQpG4iVyYsJC4X5ASRxCDIVker5CR48e7lsbU82nO+Pyzlvaa66jRd+
         DdoO4OrQPbu0Q5UEJhU4uLXeWWg9uQPDcpyWu/IpnW1yhd0hpFMFIHjPCLDXh/z8nZ8Q
         jHx9vTrxmPsl1rQxRWykbuQRNR8E5kkTil2jvsIYprMtL9uPDodljjLN8sJVkABCWE5w
         xAZG+ebHuizKkSNqhq9N6pLhbC9CBqStQV2sMJol7XAGF2NvSlWkDomG+vNMkTRLHhzw
         wryQ==
X-Gm-Message-State: AOJu0YyOb6v4Cdjai2tlcFz+I+TaLZrhusRxUxBOg7Ks3mGb+PYSPuBg
	zFpo9wxSqHHeL8yrmzjhdUsRUWbABknDhE7/arxFSvqWKfzgVgetEsMb5C3yU0NHHgWYPyEu6Xo
	hjVhfCu40gHVk4Rk9ydXPAAitPzFe+0l4kuhPjpIG7y1+DzQpqP2sUnzEU5+1s1Za29hq
X-Gm-Gg: AR+sD13Ohu9qZ3mSSTHRvWDnl+E3yY91DyTDHaxctbTKgzHQatAgrr1D6dju2mQYHRY
	2ns1GG2jTLvlg18r3oDm2DeoXOga43Vz28gLYp9cAJUOpvcXzf356+z+OLBTIHi0AFuUIXVZLP2
	56F+JSCb9zwsySns8jzIE/FsjUUngrS0O1lakUN8HCaMQnXUT7blDjhe79lv9TqYYftBUtB77E1
	gqMmqf+D5s/G+POHKNfKcomEJN4bWV7apsf5NFx6hpor+rYoqF1raxVNXs1XttAuMRA1VPs5Nnx
	SQcjRuUsyHkntxHnPmJe7UFWoQSSHcSQCd7u5gwnTjCjnRyXkwX0LgPFLW8AW5DzX0xS8gNcFGR
	H83THoI/nNzqEqc7JFfNr4HNvWlckxFubNtIKHinNlOfdxZIeLEaSSu0QG6HorBrpX4/UE7o3DL
	j5YhpdJs1ZKju32eOPE0N7DOs=
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cbce8d4439mr12430177637.17.1786260464851;
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3cbce8d4439mr12430159637.17.1786260464430;
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:44 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:02 +0530
Subject: [PATCH 03/15] pmdomain: qcom: rpmhpd: Add power domains for Kuno
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-3-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=1687;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=j7kvLZyfBPOCqjXC+BDepJVgM7m3/VcCTgkhkXmjsMI=;
 b=PJ+/gjyRuoFT4vk1O5bPH2iIGC9vGJnxxXXzP3ik5u+BRgjGnzZJn+u58Zt/lAiEF4zMOjNoX
 wmv3Y4l50mDDBzfI2UpIlkwgpgrlB8Ef4csZu+m66sfF0Wik0BmIFau
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: Q37v5YsaRcQ8HimuKyUzbZNN2uSqQsMT
X-Authority-Analysis: v=2.4 cv=M8p97Sws c=1 sm=1 tr=0 ts=6a782bf1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: Q37v5YsaRcQ8HimuKyUzbZNN2uSqQsMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX1LFSm4NNJMEx
 S9Alv1Ey2V92hHCvfVQDgekeHEcQug9PYWlW1usc/mQlz9QRwHsAyOP0xDqvcSOPReNGjG2DNlr
 UKKe6hp1S5cOvCXvFPCsPJNFGh3rgJs8z5LpWABwEfBYF2KgjwuQmFApIC4S1qFfwxRLOy6SM7o
 oWNnwprPlmAZyh6Q6T+7SU0fVd3nJuKh6Qldk3TL8S2d45UI3MS7/9FXbVXJ0VyHDsOnK2wpGwI
 wYhkqL//4XR2yrZOKoH3vwBVO930yXzsUDZACL2K3wK8GSS4eJJolx5l6o5m4FFsnTj4D60J76k
 aetlSvWGMEvTqnK0MFiRq9WwfkrlMzoGN39+/NKc5w27MK57gzEKRrQy+q9IAsZatj04Q+GVyOH
 q2T3w4iQeEXU1XCuP0s8a4zIntpCf8+XQR5uGeSD2Woc2Ya5SfPgycI6d7OOHGRBXl8O+wgLksW
 n1vbo9Rlh3o/fGXDZ7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX1jiXprvbO2RF
 Q7Uz9YnS6qmuIC9O1QMNa+nojBhhP4EXfqdwYTMbhLriJjIQmFUxqC6VoOXZXZfZruE9BqDrp1O
 iK84kRvYZG3RJI/maA+QNa+021mVylU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

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

