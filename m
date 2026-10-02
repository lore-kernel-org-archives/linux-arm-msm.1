Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758D248CD43
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946213; cv=none; b=EOowMo9ELDR5bDJcth7AFxFbzCWEeoeeMNritDCaT+4/GBLolMou+67CFYbwiS3piLDWouyjQD0ANHiLkJUhIhJzPR65UjwrcDwh5WqtRmZz/ynr9md62/izQTE/9OKfsivTpRfmveONJpH63F8cwkrHNFIsUMrvyJM/qgJ1dNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946213; c=relaxed/simple;
	bh=mfA0CnRmAV4YQ2CmY8kjWDR7BmLBBgtPkPhCwBQXJUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XRzZQiiu7mRSQjieEpERACOom1iQ0lw3IXIK51D4p4Pht/T/AHEXnuCKyauNsai28aeG8PxbfQ+8EGC8PpdeiSD0E/zw3rBOx0vPhcDfVUYP7ziijEwDhuMbijyykN7LnscHsztTxJuPdhCgwcMWVfmTOAXjFSj3QqdkS5xa8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UJU3ovl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fV9fpAzJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UJU3ovl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fV9fpAzJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nWiO960563
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 13:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=; b=UJU3ovl3vT9hvtWV
	iXZ+RTCeLQfHczV6rDEjCw48qgjoh/nay3XGg9vZ8w+a/bB7KdcN9tCKdE/ioimG
	5YkDyItSG3vY+3PG/ZjtmVgn2o7rnhlivtgZaBY0UGV5Xk1SKcVIH7OzRZ3tQXx5
	aPxj/8SmVEgv5VDv3N5bAgTjgSLJcKNqY+prSSiv3pcx3UizPBSkEculk878c0dH
	HlHcUkNWOitd/dmsj4Qi0DTJ3wFMbsoO9oQTtWonWwdEt1ClQuoLc+hNoQDZJJYU
	POGxCmpE23FzkuQvppzDmzI46KNfTEx7BjsX9IOONx0fdN186nxp/5j28cFKLjDU
	bTf2Qg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcmh1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 13:03:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so3286451eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790946207; x=1791551007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=;
        b=fV9fpAzJMU6VRzOfB6s/CnEuUHeaRGznsM0solnFsZHfdsiHE4LO9+vfV6dmyxdH3v
         WpTu7pMcRzwbD2ql1VUZVLAYV0EsqEgAEFiwQKLbeAOOlnHThTkyFCznakkg07+MO377
         WoAW1ilPrHnFCRo3ADNSHSOm5LFjpkfsoggmPZ8cYRgSj+Bv1jFZ04hzv4lWbW6Vrx6n
         qScJ9+AKZEw0rq8yD+OXer8fesMnAMjQDMs7m3sIaO6E5gXbCqMLTrITTmkZOqlJWp19
         xYSpBPBsZi7sv/5UWrXMjq+A9uq6CisXe9/lblDmqxJIv3jlTMm5vPlb3//p+UXA0HPo
         c9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946207; x=1791551007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3uT7R5I6zQZ/I/4CcpOlVfI0xqA8Gs5rj/a79yNNKY=;
        b=1KYdUknS0KBbGJrvJgAxMlGcJdSgCT1+a8FuOc3El1gUN6g2lL2Vx/+MYzgW7Uievt
         HIGOrp8qUjfO0+UQmBlmKHtqpn1f9OOCBUU6jEH7xOB1IvuKEsfE9ao6DeN4LMB5q3ny
         9Me7XBjmd0Yuxwl3lUL0GiPGd7ecTs3dbh3j1ICXjn/q1TE1IK4RFP4HuJpI0GskLB+I
         +1ybFZaYr8p6WzLTTYiKeV+1VLkC7QZ8vB3t9ec1RgxkYVfyJP9G0K/Rz+Z+0QM5RN3o
         IcwpBuy7jxgRxiouZNShgMK0PSY9X3tuwiVFnbTiIrIaTVmrdKuDOOtNnkDf7pEiTTfm
         IGHA==
X-Forwarded-Encrypted: i=1; AKwUvBySwNyOYjiv2Ghx9tW4+lCIJmuYeoIMHocThd+2JYDki/UkCbPRAnnojWtEi1r41+GvnNqNq/7p/EGs/e3v@vger.kernel.org
X-Gm-Message-State: AFq9FYKjtoGgYc6J69ZcmhzUOcix57B3SaqkJZDMMzerJaNHPCgoNTjd
	ThLHQgH69Y+oLyRANiMNWrVGFEao+YW6rRu9xDlOgHOMf1KdOXtdqNg+zaV7AGLfm9J+57iFKFp
	bK0zWMLkPgftFjzHkM9qSI3nEt+tnGmH7T+wCfkRexCZusqHo7/qJHTD4w1xW+6twAPBf
X-Gm-Gg: AYBFou1vLtXTEfLlqQO1GnUEsHSvp5wXSIQDXIFsDqq30Gatjubt+IwVB8Lmmk/Oz2b
	ImLHWs1rGhs9pbwZxkFAZulF7aVU4+qzMbPlWosKYI8va0m4tQrCj9Pcx5t9ESMF646Q/XXxMOD
	vpI5TjdMCC2TGvtIbcsEQFGzGGtTBUh/rycLjr4FS9xJsLBS0mbRY5smBeA5O9F8j7EpwG9lL5e
	ps8VbjOuBo5QJxnEsTIGVNMHgWR2X6tnSozk27Evhfd00xeocHWHL5mCmA4cGmFoG0RKJWdNIb8
	B9+95KUfDIKhG19xaqLj+8xoKGI6cTx/YB9EPXVlWldyP9mvmbfiMucBLofB9H7UQgvivrR5a1F
	3nr9OzvpLE87IqvOx+LDKxq5Echues4r2nO7RDbAPzB+qtciWpHRUgO9eYSSYdYNQZW5rZ70RVO
	M/ucTHMGmSOV7Hxl9kKk5uFmu1l3/9GgWB0Q==
X-Received: by 2002:a05:693c:65c6:b0:341:bd7e:da35 with SMTP id 5a478bee46e88-34f1508f93amr2400223eec.11.1790946206625;
        Fri, 02 Oct 2026 06:03:26 -0700 (PDT)
X-Received: by 2002:a05:693c:65c6:b0:341:bd7e:da35 with SMTP id 5a478bee46e88-34f1508f93amr2400188eec.11.1790946206032;
        Fri, 02 Oct 2026 06:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3510752b575sm4217543eec.6.2026.10.02.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 02 Oct 2026 18:33:05 +0530
Subject: [PATCH v2 4/5] arm64: dts: qcom: ipq9574: add support to get
 watchdog bootstatus from IMEM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-imem_restart_reason-v2-4-61703c6362e3@oss.qualcomm.com>
References: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
In-Reply-To: <20261002-imem_restart_reason-v2-0-61703c6362e3@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: KvRG0__zlOxr7FV3aewnko44G9jE9raj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfX7QQH2Vm3jqwf
 rbFv8tgNYTvdPm9Mp82O1sRiGR+3ZY6CduUeAoVZIaTCyrGuTvQrWEvI8pFEESIAM/vY5G62+t7
 Pk8hwnPpYLOG9eF4A5FRgQ5/tVbubWs=
X-Proofpoint-GUID: KvRG0__zlOxr7FV3aewnko44G9jE9raj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA1MSBTYWx0ZWRfXxTU5FwSNg3iH
 xpkOgxbID4PtaH3rmSFgWcr6sGNNEmUmTdSuOx7Hs09hFNl9OE6sR3v6Eb/j27LuXS+FwPYCf4t
 1SMG9Hedzlq0q+dlmFLhCp6VqrZPGXWPi160zxHK+mduImKSHE9St6HAFPhVfaaB2gyFFpyvEr6
 Z7EFakIGHYQfJsxjtYT6uVT480Z2NP3Pasob2kKu+8JncIyu8kX1ip/HR+Iqpck6pf/QT8VtQC9
 Cp+C834tCOALm0V5Gd3BETwpUuzjtwVKze3GiZVFzbC2/m1PK5oO8i1pKBM9/R7osxorCg5gjOq
 SzZzi23nKRCVQp/ceUKxKHiG/FxKdtxfjfqr00qIpeATHWndkHzwIXkZXrYQL5aoNARLu8vRmgT
 b4d3MJzFrKhfeaYIs+cdN15uQfHfNg1/1IjNQeDNB3t4ZjdV+6iYT0eRfdbLPI/ucBg3pSc5rks
 yB4hATEPUmZ7i+Yy+bg==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abfab9f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=WbeaI0-OC7IQdSlKmUMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020051

Add the "sram" property to the watchdog device node to enable
retrieval of the system restart reason from IMEM, populated by XBL.
Parse this information in the watchdog driver and update the bootstatus
sysFS if the restart was triggered by a watchdog timeout.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index f7cc6f274ca9..e1908f01851d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -760,8 +760,16 @@ usb_0_qmpphy: phy@7d000 {
 		sram@8600000 {
 			compatible = "qcom,ipq9574-imem", "mmio-sram";
 			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
 
 			no-memory-wc;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			restart_reason: restartreason-sram@7a4 {
+				reg = <0x7a4 0x4>;
+			};
 		};
 
 		usb3: usb@8af8800 {
@@ -854,6 +862,7 @@ watchdog: watchdog@b017000 {
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&sleep_clk>;
 			timeout-sec = <30>;
+			sram = <&restart_reason>;
 		};
 
 		apcs_glb: mailbox@b111000 {

-- 
2.34.1

