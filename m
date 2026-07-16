Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CEA41C302
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211919; cv=none; b=Pv3u161UkR1cbThuMnkukr8yVq82OZOD31r863+mpt9C5TSMOBiFDoQXvwn6kOTxkpxdWncKMqcU33Z995jRWShCs3OxVCiZdp+VO3CUKxxb76826HQrBKhpVY4RAFx8g44lrkWFZ7Yl38qKx8nvwwt1kH4U1paag0u898biC7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211919; c=relaxed/simple;
	bh=RazDyYcRTpYvB6tN8BOMuESdMJqcv9UjMOcxxnLk9OQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EuHrqMUbDTzHLlOMZwrvp+hJa9ZVTUidL9fXTfEDDHuq8Bep/TLoK56OR0xRHCUPcn7VXtABB4j+vUvGDAxLmL42J2YtdrRnlO1ayGqmTJBUrAYycvFaZWbxU44zw2OFOV7wwiQcEGLf4Qw9EyN0j5ISVVfIUztUnd4WfKNM0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S99uWYLq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beaqNebk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S99uWYLq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beaqNebk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJjk32569334
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xDTRrQhVy2n
	0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=; b=S99uWYLqgFtAwtqz7tpv4yB4L6A
	/3bbgrFtbrpi7Gejek/oeILZiEkZFfi577cC7Qm3m46NiWxXudcwUf1boK+pm9mV
	Y4iSFUsSX6dfdAKv8A4f3l1ND5kOU4GT+OcnhqVWuUItf1Vpi63uH7MW2xL1laL1
	tVcwT6gKEQyq6ShWMDjN01lL2W+O1cQs/r3Ugn94uwXEowyXfCply65Bpz242vsE
	mIuboupZES7mFjiwW3YFM0DBBbNDVuBh+Jp0Wf7zEHxyWV+Qw1pLGf7+H+HtvaJn
	X5Q5vzUAn648tSIQzf8A0ynKw+o++4FXGMciyAAK9VhJO3WfnTz+Q2vs4kw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064vu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:25:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1852a86fso75970911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784211916; x=1784816716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xDTRrQhVy2n0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=;
        b=beaqNebkYaXTQArz9inFv7E4LJMIXgre/9EptGeANKxZX3xP6gREv0akHXLTVO6u4e
         hVREmbAnB0PyKsG5Q2oxYRLLWO0T0jiQqZZSLzc4XBn7dzjfCZ8TC5IAttQ84gSMzgPq
         +Xx2YDV8oeevu6UAg8/7tfg5gzZNzn+b5ikmEH6GRqz6uu3SfrA1210dktFinBq7hlTF
         ZNJiabPJ0yKstlUXPqzShzAJHXGS1Ub5vlsedJgnr524nCPd1qt1Fr9PquY3eEeE2HI5
         TpeZfvh1n07oi0b1zZzP7LqiOw0a24woj9Hp4eSjcIOOe8u6I9k9jxUxxcMbMEyFp1sx
         tOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211916; x=1784816716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDTRrQhVy2n0dS+vLF9igjtRuFmthcZmv4jK76MGlF0=;
        b=crQtCpfVkOVzSwaQzVhj32+IYY+0rViGsXbr7gWHPIu6PNMsj0IKAqYg4k9PnL88AU
         vmLxP3gEVq7WBe1DOumCLCQnrCumlLkwZs5M7uIZF6nLMZDnwOthPZFce79rh2Dvg7zn
         UVtifQ0wOxfYVXEjdcALat8tyIJXji0JIpTSPxEM8LxsJjgM8d+kovh32BKAP0mwk/nT
         mj9KBG2vNXU74JKN3QvUTbyb7nWfPsgfgg8wGQeVlLeYMo1/iL88HnBydMUgLx6qv4bk
         m0WzT1wYOS1UZY8vBxrKM1UJ+Be5xhy7DQzcxjDQS3bTD0tCxjyZF1mN8jo+hB1NKcOv
         PzQg==
X-Gm-Message-State: AOJu0YwelEBSENVPLSIy4/oP41mqivh9NWlj72052+STi/Kep+q87qhx
	Ym5+HgXdRCcT2FpHiB5LmX2qqqiLgSzpgWY5oGdoCofA715sMJiypZnccRgLflRi7Gsy8QnxFt0
	tI1Ctf3siuWMakk8C0XuBBjb5P2MArSK9hjTcM1fNmdfcPkBD61Btc5sGvOGDhieN4oFn
X-Gm-Gg: AfdE7clTeeeYSlzQ5fP6eg3y3z3wrCjH6g/saVtCgTe9usZ42s5+UVcAKzuXeOdf439
	ZDNVw3DVtf8YnkoegKk6JCfasnym0RZHefWCgASK410pw2e0HPwZ6+yBR4COJFeAiq+9XHq4mw0
	phwzjbXGsYbLimF+Ij92u/EokLDzTpGEdVt7RDY+Tfyk00NqQKX+z/xso3Sx434n9NkVlaXlKv3
	P45VxHGoe1R48O/7HF7ftAjXBBIE8s5jCGexH550NTXLm/1vy6YZSWxa+vcMw+9LeFHZKYQX8vT
	1kCcDb5nNyeSBrTz72faA7FCEcWWnniOY9dupNTJAkZtBhgI4l2S5kk3y5pAZSAHfWuUSolmyxp
	QcCdyjfqQD65JLozALc3LwwithrOJ4LV3fdc=
X-Received: by 2002:a05:622a:2c6:b0:517:8a18:7624 with SMTP id d75a77b69052e-51e423527e5mr114668091cf.3.1784211916357;
        Thu, 16 Jul 2026 07:25:16 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:517:8a18:7624 with SMTP id d75a77b69052e-51e423527e5mr114667341cf.3.1784211915519;
        Thu, 16 Jul 2026 07:25:15 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb0343sm62091975e9.10.2026.07.16.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:25:14 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V4 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
Date: Thu, 16 Jul 2026 19:54:43 +0530
Message-Id: <20260716142445.2767955-2-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
References: <20260716142445.2767955-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX81x3darbJrsZ
 0BP/O6RAYynkrG0IcTj0yeqgAR1v8Jterhx5NNz2WOTmOxokCkFzIM6NNuVixgjKIP+UIkWObZF
 e8ov23TdKuNZaZM+xXGtW+LjRkHNwDU=
X-Proofpoint-GUID: hyNinss4OEqIsX7vEbHKQCHW-X9Wm46Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX5WCrSDcHiZwe
 VVcl2ZyPZpxwCU3ZrHave6h0qr87aO3nuwbkdGJHl/tr0wlqjEI6WNh+ILWe+BI+0+o0f3Ewwzu
 D8Q/g3CCS/ksTEG2rFLbdsAveF7l4lBYeaIKbuG6DFhygool+DzweLgcXDe5eJWhL77NrvJIckU
 eEBgzG3K6zmo0Dyr4jBAqqO/i/gZ+dSrjtR2rWeQuzG2QjjfSwm4x7nwSFIl5WlayKt2aCpnQLL
 wusI+/9RTocFCh4OHGFnmDxufpLPiKAuEj03hUFSs2lpv+VOsLYCwGVqnZasQFRAV8F0tJRNZaN
 MH8ztONGb4dMtXKrxaNYStC17Dzhbne1BD7dxxlGIA03G3iA/5PT8r87rL3b3NLK8xlWLhgaz+2
 4tGi8BQEDz6R92mYgqpE1UIPFifOsrJt5BRJ407dHbycWeeRNHAjLYNu0fwcMz2WT6rw0fLDCn9
 0Uzp/0+Aopm8HHmgM7g==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58e9cd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aGigY-oVRoDAAVteN7sA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: hyNinss4OEqIsX7vEbHKQCHW-X9Wm46Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
and conflicts with SD card operation.

Remove 'supports-cqe' from the SoC device tree to ensure compatibility
with SD cards. Simultaneously, add the property explicitly to the
qcs8300-ride and monaco-monza-som board device tree, as this board uses
the controller in eMMC mode.

This ensures the SoC definition remains generic while enabling features
correctly at the board level.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/monaco.dtsi           | 1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..6b146fdd6ebc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -275,6 +275,7 @@ &sdhc_1 {
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 
+	supports-cqe;
 	no-sd;
 	no-sdio;
 	non-removable;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..ca3a1e845a76 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -4841,7 +4841,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,dll-config = <0x000f64ee>;
 			qcom,ddr-config = <0x80040868>;
 			bus-width = <8>;
-			supports-cqe;
 			dma-coherent;
 
 			mmc-ddr-1_8v;
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..3090eba0317a 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -719,6 +719,7 @@ &sdhc_1 {
 	vmmc-supply = <&vreg_l8a>;
 	vqmmc-supply = <&vreg_s4a>;
 
+	supports-cqe;
 	non-removable;
 	no-sd;
 	no-sdio;
-- 
2.34.1

