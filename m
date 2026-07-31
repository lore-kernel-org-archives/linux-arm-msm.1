Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F935B65D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474843; cv=none; b=YqhcyXSPTJLGH/PFt5UE6lIosjawmNzzG5wuF4oRI/ZdmKuPO6DEJkVN5z9F1tzUx8dpxGhvm/g0wGygjFDotYO6Qa0Bq1l47fnVk+Bl660y6yNXvWENx6CQTaLnUrgLg90fnOZph2DCV3KbNb+Zwh8GiqUewNepBp8ihMnmkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474843; c=relaxed/simple;
	bh=mEJl/T+z6tFrYZ3D9hQa0mJ+NIP86nQKZj+r+SNddfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6SkpnUb34q0BUO3g8hs37PH0SDOWGbwI43lUneeHYd8XOxzFyyi5kKaWwGsIaJKsuMOCNhcYrhqNcfBMcTlFgQ+dRqPYevGxhNYcAbIgjYfrBuDWT6FH9oNoTBVDFHm1zqQmEHxFhr71fp7xVE9wu2YjBJSf6f9L47iEipfmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YvBRJyNm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKStRlb1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YvBRJyNm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKStRlb1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4vU6S2995479
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=; b=YvBRJyNmHbe1BuBM
	SmZKM1Rhq/+l7Hmc+c+OWykDbKcem9q1cKtIjaiqh05tXTevWlaKAy3LTg61xx9P
	O7wVM9T25D5P3PRhv6fC9iHCtNzIX1jpmcTl1i10LpPyWbe/8vO0jCSsdJhn1XH4
	guN4ysNOE3D9qHtjTNY8RsLnPpqcgPK35U9/n8KFPtbGMCP/Sc6M25iZCc2uSHMV
	Pfgy4R3VdoeWyoJDCNZVtMo94gmf41STsAQrB2i9cfYkNPE90sptHlSxbE1Ulv/0
	kHURlLjkZCR4+wwKhfP8whNv4atcBGqmnvIBWGlvuitCMj1huZMDKUCaI4frEg0M
	1gp6EA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn2k020n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab041eced3so882314a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474839; x=1786079639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=;
        b=AKStRlb1MLIFdMiCCP0pC55OsxJA0vxtNaByFCx0oXOXC8VN/ETIgKkrJlCRSWyjEs
         dglRrGYftqeT+MD1GH2y83ZIKy9/Oen4WacO/VoSvUxqAo9nbo5tGc94AGRPWzztZ0B3
         fT08/mN/jGY6cvyxs9JM0imPRInM8Fz/kLTtw++5j+9t+eD3eX+mTITw8OgxjcCQ3+eU
         oeXPLb50CWPaISykPreKKlMgQLmFE4/vQHEneb4Xk3opJCM7UFdCjDmT9vnihCFN1HwO
         rJaNpn4gBQA1jIdgskaqSWL8xlATknepXpIgZSFcsuhkNbmu0lfHN37Yiide5iZS+fH3
         yc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474839; x=1786079639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyK0q5er6ozhcg33SbPg20I8Bg5HHjeDXhNPQa7k6ZA=;
        b=UOJbKr9djiBvDQDHZzTTL8PgTFN5Ux/TnEu8NHaE5PiUkK/E+eMu7kereedFyq5Jru
         2YXeSJxrh1SZRNQNrkg3pM/3RR1kzlCmuwMWSthOpL+ordtWgL8b7y+pgUMEwmkT7/Ex
         pDdK0y5H16dZn8NDiyCp6l6oZQVO4UDEX0Djl5Dkitp1xAXTS/bDV7ADDDYhwFN2LDGl
         pbfRB4MTnKGXOiWblTFj9pQ11J/TedoFCXUN0W2B8bnGzCDTljbRzAT50MU+ojw8UrHh
         jJBOJrx9hiSrT4u/5V9ehGYgy8mLIOI/69AglFus46D7bcfbOzs1BmxUBKOlpTT6KCq7
         jchA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7voKhO6Bn2lFB3hMbacKb0rBKFldTjxLTC7bHUXAxfSTCe38Q/euHlgO8HdRibgs/8KTCaop0A9B+ryL7@vger.kernel.org
X-Gm-Message-State: AOJu0YwmNYR8nwRICGb9L5c/shnTmE6i8QvMB/kfAsc1HB5FGKg1fTys
	h1HQVN9n9tBNqMJ2rarGGO88Jt6T4Q2xtdMqeCjs3jo+i7pfWxzRQxdvbh8yJLZT31aWL83EGqY
	EBLCdK33Xl1DUIxfjZG3E26jhY+dpfTNntb251C3Th/G0kbE7yM/07O0sCQo4C1yLep35
X-Gm-Gg: AR+sD13Rj6GeSwPfPDhhUtriWN/9dpjYqgpeKpQhNY589+u0a0YykWF7bWdxtANQfVa
	Xrdo2JCeyG/ZqJMjRNHzE6Yr0NxGxfD58bOj+Akjn/g2/m4uMuLJ8nhTAfncgFk0HQ7vcjfjkQs
	15VTXNOxWixSmM7d7qJV2++jgNhxxXoRiFtgiClAlofGfUwEAHzQ360C5qA+vYEdfk1zvArxWsX
	J0iuuafJZnpIVMZ3yUVkAZncpRroTviqLdjYOqlwFsipuZd9ePfIKbwDuIdj/VYtXqKmTu3NifV
	LYnuJ5rF15uWEHkfqz3MyF/D8uGTFes4d4LqrHdKfYlw6DlIFTDNM75UmMMucFep49IlVsNhMKj
	lGAhumGNLqId1xVvbfwQkSczJreKyhN8E5LkOo3strtXkt70=
X-Received: by 2002:a05:6a21:3395:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c91b0a05a5mr554809637.1.1785474839529;
        Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:3395:b0:3b4:8f18:33a with SMTP id adf61e73a8af0-3c91b0a05a5mr554784637.1.1785474839131;
        Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:55 -0700
Subject: [PATCH v8 6/6] arm64: dts: qcom: mahua-crd: Add PHY supplies for
 pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-6-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=845;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mEJl/T+z6tFrYZ3D9hQa0mJ+NIP86nQKZj+r+SNddfw=;
 b=NVdbGP4jq1dYuL1jb/dKfeCHOIrTW+w5alpErC/xht55pn39M6ZIHMOEzFTD7sADA0k7ULpg6
 im5GPrV+4EdDr7IQ4JD38Sh3FCnLlfQ1N6plJUJcoIh58CcNH2Y2HMP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: nsd710TZlAmHvRl7VxYtGspnwkUE7QJX
X-Proofpoint-ORIG-GUID: nsd710TZlAmHvRl7VxYtGspnwkUE7QJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX0E/2uPOnuSLz
 vbMthyNNBiuK9RYDr7ARwo/R4VTCiaEha3fNN7fCcoOzaLWYCj4qSFQ3Oen69PiI1HEmLecMx2H
 OabCqUWJCHvelq5k36D9mxflzW1wXYc=
X-Authority-Analysis: v=2.4 cv=WZQ8rUhX c=1 sm=1 tr=0 ts=6a6c2f18 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FJ594BFJAeq65zshAlMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfXztcAbBoXqiPr
 akOHVLGWT8n6BXBkEsoeEqEL7qnP/uXzDu9s6NVV0kWJQ/PFax1N3dyIm6EaahiTRBWQSPPaxCo
 ntaLr80lf+8F+6/dLKTb+AD5Cb54wkyNqj9BGAIbV/3LTi4yBhCYI7kosIbBpbwaCrD56n3ZgyX
 mzlzteHKwVgqvX7re3jVWuBYCZiUt5pCkqUDouu6QHEQV50JFNhdsWW3TqSz5pIcoFefXo54tQh
 RWSljraWJSCAxd4xbVn3h2O2dOGC4u52ULutQ8/nno+r8/FGkRwbBrIEAr6TR5PTGn72IzyWb0x
 Cl0WxnySqL6wvMvPJnTwnjw2r3v5XLVmPYvIl7I7FiIOvb9NUkrmBc92b88vg/e9g9bqGp4TbyR
 brnAp7ttDwFuuKDBVY1wkiMWlK7kLQcf02PyZmCpyD07Fzcjr5pxOtksAw/G0B3h9uKaKsa8XxA
 dyxQFUIeLwJ3lFF6p9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310032

Mahua CRD wires the dedicated PCIe3b PHY's regulator supplies through
board-specific PMIC rails. Add the vdda-phy and vdda-pll supplies for
&pcie3b_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua-crd.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index fa5229064b10..17e40f2a6259 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -20,6 +20,11 @@ / {
 	compatible = "qcom,mahua-crd", "qcom,mahua";
 };
 
+&pcie3b_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+};
+
 &tcsr {
 	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
 	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;

-- 
2.34.1

