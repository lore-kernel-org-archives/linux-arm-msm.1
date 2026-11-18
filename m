Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987923;
	b=TIL19kX2Cf4FBVal0rxY1Q5vOc5ql+wQinEwjmqgORXFgyo1/x99scGTwpG0WRTZHQpo
	 o4X6t8BWPRMG4P/Q6v/adpdtqv3BWPLr0hyWABfkc0xDnU6n8GWDGmsEKi31XiF5EWNdZ
	 UAHOZyq4F0KS76SzQwfrZaRCOVXhi6rs5HUqQ/rjgND/13V/CTSBB8pflokh2vTWeR5zP
	 VEmQX1FACd063b2O21BiVG9JHYfunYEehILVNDI/qeDhylLNtVTl3DaTc1jmI6zYfKPZx
	 Y4XXcZ8Oi3Gj4L7b1wj6LZ34o43SO3msPaFvaL37QLJlYWJNOd6UuIXR1omZEAj6Cfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
	b=byLfqZGD9Q9N0xlqhZrfb9ZWSkA492hJgWvSU2kTyDd1DYGR3jHMs1fDBdotOoovMP9X
	 RvmQ5glFsBOTOzBuN0fHDBwBT2UZ4q76TX9bkwsQWv/QahrSgpMHxmznudUJiyiPUBTs6
	 7OutdBPulHSLxWLnqLFXjQtMt4h61r1PgU1rHqvBr0D52oUWbnF/uVyCzjZoKQ1g6CzQp
	 k0ozLIdMLYAv0xVC2kCjwVqdbbFkGaNt1p0OWsIGJW3hTRXYPeoLF6nW/Bf0GxrP5RBvB
	 wxj7edA59fLV/Uanjya75b6Xp9hovLbuaFqmMp9/yeg3pI3djiFpDwrHsgbXjrOB1Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A6606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0A6606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+fy6kSl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xz7fDdmC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V5D82453873
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=; b=n+fy6kSlAp+Qpq6q
	hl5bpyy6cMt6ViMoQJUsMHvRXU4/qfxwimtvBG6qIQXVKx4cQaLwZh7WJ30jzp9Q
	OoAFyEGIeIKB+WpybCAx7ydQtKAIt9iT2ZXJSaBcaGebZe9mtCwSeTaWGzWfqwSH
	AGnd+CEWiy0dgNiWcyL4r+FNKkGs2VQJ7O/A9RZ77L5Sd/MVEKviY8HEoUm1gX+M
	CR93ijddScY30tWT6PsHtB/3s9ehdgHyVYrR41onVmpDsqDYMzGaIHpgZNQwZJJ6
	S8pU5bzLEZAusELHxVSKN2E4r6kKvkEKeyKFteL72anrW5+a6xcR00Tg1DvVCuzV
	ZegaxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99ugp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2005ce21so128670185a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987921; x=1795592721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=Xz7fDdmCFtMBKePfbig53C7bnJbiX24Uzjw/CL+hpPXHYn68UkuGlUFSux+kAT/rKN
         uS8vUBsuPPIg0+bgroZJT5ZVIldSER4KU6Z+5LxdsOfkAjUuO022oGA1KC+w7i3e28Es
         SnNTwDvxPNugfB+MgzyNivlRC83C7Low2Fgr5WGV3NUy8nUmhXs2aq1VXwhT8iQMpNcU
         /ORXfmUXn+7WYG63Cv8lCJApXG6ZKZDn27R2iucSW5wTuWiGOR0xCDO34KUYCsFoiofh
         dVRk1RjRJYQGerxK/TVv3GbRMpnaer4c24RSv96mSS519L54YQd7GlJawV4g8pYK4FG/
         LQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987921; x=1795592721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3+vDVO7nczkZMtqsoDVAO3WySFeNCsHYRKhCVZ0MLo=;
        b=vFYw2q+oPBHTwCqgZF6qxqeWkCCfHR8m5Xh28glFrm4/bwa/BsXhuCs2ZjJu3JaHhg
         3dDqX/8y+EOcW9xSvIcN0INtSvyIDnALUgYL1mEKwoIJJfyL0J3dV5BSLgIUv/ct6vQ9
         s9PAZJXyRDOxWdrhqVenrB3gKwyAgHRBaFT2lCBpz5hdDD8YEsm0uKJUvUn0VZhvd2vD
         T0stY5UhvID2qDR/TKlWzBzEDKl5DC4/KXsTBiInEa/d9h7xEXytSSmQmMzLJyoVsfmp
         rlHnG64b8ioPLqFD71afoi76A+gBy3+WWz/o32jOomwQA0fSNXTcCSllGnv3a1wTRGjd
         v6xg==
X-Gm-Message-State: APuU4Z8fXzamG97W4Yj8b73E8DOppvcOTP5Cjko88qis6eoUHhZYHfWw
	g7Xbf4zBhIHhkf0lzsb1sKeQkbFUofSfx2gCoNFVdaIaSe11RrOGqygFw9eptm3sbqSCUrluRYv
	os44x+1uONrQRaL7A45a6NgO0rR4Fe9/IUxfhRpmiN9XRUUogYJOca2EM1TQuvkaf1wMT
X-Gm-Gg: AYBFou21SDxtt0Z3KLvdj95wZab4dvuHq+3JMc7ui2ooeAJnToLdIMh7jfsExQCsvl2
	CURRS/rj0ZM/krMWVdz+wJczS5GgzCA/h6mEbIF/7TnwUl/Crzr8WDWAcYjaAp9vyOQ4Tf4IN2r
	FC7WUTZLRxAQXC88BRmyZUemnZ9r4dpxxuOHiFgTfxfht5HfcBDlKLY/g86kLfYKveAbagRPrVl
	lI5jYoQeEtR255XYn0sAyDxSQtJGVvxiTJIF8FZlWlE2/czScgmVJC9hoR8BBIxw5CGi1I6u+Zo
	t9TPnqHHSdqxsq2Ratsb4Pnw2rTKCltepDPVx1o4O+xeA+DD5yMOOpjCDzymh2nLoxY+EJmtOBC
	rXUpkA+gykhAt1TitEKbuEYKe9myKSTpWzvBMObm/9qKjFYhtHO1OOTtMWHEPE3N7s4N2v53TMC
	efoXfmwRHNatyXjkFSB8nH9QjxXOH4HXF0oPhDwF5y
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375420185a.48.1794987920736;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
X-Received: by 2002:a05:620a:4556:b0:944:192:85f1 with SMTP id af79cd13be357-949995c61e0mr375417385a.48.1794987920242;
        Tue, 17 Nov 2026 23:45:20 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:19 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:05 +0800
Subject: [PATCH 1/4] clk: qcom: camcc-sm8750: Declare icc path dependency
 for TITAN_TOP_GDSC
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
Message-Id: <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1293;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=79IVsXZe4aT/7ptWNdZZNaBzR5Xk7vaBEe1jnE3m98M=;
 b=Z5efrj+oMIDOmtqyXtESvKHicOBB40oIrri7Qja/vMJb8yu2klcQ2oTmlLcnutvKXS7fjGc9c
 Y3dRuCZ7itcAMWRSDdKW1ZPtQ/iu3/w/1mBNcTzkiSvQbPHi1Idu9zE
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX5vYHbP3GSwQj
 yCGFr4qv9IMtL1qNypgCsoDsOetwKTSBG058Uj3y5E4RxX2tnbCQwZwNfP9UnPac0tb7zzIA2wr
 cVwgwsD811aowmhCrMljkON18ProR48=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd5791 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX+4LRJI7lxhhI
 hmxxz5a4UrJdlsgxq8tqfmQeJLFxBY9g542qKBTQfPvBC/G+Y9MgzoQqsqX7aD3QxzwyUjujX/g
 v2ma0vsdP0yeIiRc4r9up/6999w5g/teaQzrcwyQeE8bosT3vVaTAQqqvEYOz95D97/+Bs92wut
 cvNDkp9OUe4aJtPZKhsuwP9NH0DLF7TajFZb2zA6x4MbLdMrTrflRYXPMDd1CUHTs1lIML0emNO
 3tO6pIdhdpP3qF+L+kwwWgBKjMgJR1MaqlUyIqialzJAQVse20v5hEykdel/JOnnsO4W90rgONf
 0ESqSPg/kb94lH3Aiqt5Ie386CU8A5SWoCNFl9jz4pvtd0dYAClq+K8z3rZ6PZVh2IneAZacpuG
 wWxzhSrf3nFyXQoH+9HeT1cTaofpfMCONZBOojnd7jDfTRRry974ptUY/hUf73J3gT6sNSOMXXW
 Zbv5AAf3HmzGc9JtbrA==
X-Proofpoint-ORIG-GUID: ckt2nOKubqs_y63CnKhlE5gK6XAIR_H_
X-Proofpoint-GUID: ckt2nOKubqs_y63CnKhlE5gK6XAIR_H_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8750.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index 4dac298f06b188e78a61121bc9452f7246e59c56..96a2a50a02bbfcc3730bf6737df7bf09d7c09fec 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -25,6 +25,10 @@ enum {
 	DT_SLEEP_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -2432,6 +2436,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

