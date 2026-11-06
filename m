Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957852;
	b=2V4goL9vM0Vbli/gnca1DDWVTAuVMH+iCeEOryBAmeFlisjX5qJii0WL/38UTtui0sRe
	 mMOFLf3VFTk20c6UKM6/GVj3y9aq590Jqf7rFvslwinmdfjGUDAtzstnAB4cLJbx3JL+D
	 qP/ZSN1j/Hn2e+Vp51pvwA5ifIXD42wKxwZxlSSPbn9RGEypL4AkG+B1MDy0lTz7J/xKL
	 Ljo6piRM8QCnpBpqr19t3hQ/+YGH06uzaXSZGARTbMgipgjOmhb+ZYMCTY9YpBa1q/PIF
	 jeeY27jEUOO9v6qjgZixts/ZfqbUprOWqNUS2Y4HG1J0wclsi+DtzH4lI3j4XGL0Sbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
	b=p2vMONIDfdkrkTpGSiq3M1C6Y8zWEvyOyeeInQmIxdJu5dmOegoTWiZHCbX/BBqtW3zB
	 pSJafAcb5Bl8rXXpxNLRhsvk67H9Vs00xXuxN/C4faV2/njbvTn77ccteWEisYVPIYDXG
	 sFFiIXwWZfOgvz2it/F6LfAAqx+pS3ZRFu7m+QEqZEQ5EMbQNvaS3FYPjX137JTfRcw+0
	 9Ra+0thc+FWsJ7wL/FL3/3/32p6aYt02gqSS8l3bDvwuskRJu5Q3SV6QCHNxwXOULaKlP
	 2e/IeYXn6QnQG9G+4ym9QjJzgJ0me/38j3kYeBj1BGEclznCtdHo2TWhrcffQLkLdiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B2606A336
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A98B2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g7zHu4ds;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3u+PiwU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RFHJ045375
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurE
	LYImyMjc=; b=g7zHu4ds7H3HSU/ADy0o+QM20WAsN2sOChWdy1FcSmYrOpDbZTo
	4TzRMXxw/dCzY1eqIpP81aSGCvcG4hx9xNLkm5YWoQ0qAPlpmg5ZHqLEWeGkC2gB
	biyGY+c2ysIDfVQPBoNWr5QXisR+74MC5N4BoP97F31Gz9i+H4IxvE8WOjIWkY9B
	3iCxXGx9jQjCTt9qPjLkQ6rUrQaYeHrmU/+wLhIPHQMF6mFZ/9e4AkUL1KpQ1MYZ
	tg/S/vVB8JRo3u4vcPhmOkh5m5P9HE7cv0+MQC1BDGYZrKQx/oSahxHU+beW+f4d
	oSAD/82avSSv3i0VRyobW/OsqHbITB/wIRw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t68f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:37:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1826135eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793957849; x=1794562649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=S3u+PiwUSZcNHHw63LW2UckMuz2zFqSAWWQdqOpYPRjVSkJvrRoZQTkBQoaq6aGSXr
         c7RSavgVKEvdAO2U6ZUvLwLFtaJ0/+bhblt9goAE0GlJ6rQz5/Yl05s4me/AdTd0Dcj/
         WaFjvB11eTs5N/5+6fbSDkKFI8TNlOjibsLS0FuVIh4WJfvUK5wKSeSGq2KH5lQacsG2
         F/nZ7/4ThsHCYcduYR+UrjMQHl0Dj0MigfM1RZZ1FpO8IrB3sC2gk1E95WKASWo/GGO2
         dYpTFPaL6l6epmTJbtuX1afG8VyeBimthRaTjXtRhU2XhIsLAbBTt9dAHrVpLH4eMvkJ
         mIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793957849; x=1794562649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBbUQlfTSYAO8YxabN+7DdZdsoly4nqQurELYImyMjc=;
        b=SptxwyHpL9xGg3TrK8g8/ZCkUHPmz3yxtUwDl2xLjUJRDo7nlYSL7Jzlohs95egh3t
         IOdoSY86zGoevBkgFsVaFg/v/pegDfYC679vb4LVOTaUsPqz+IgWRGyOEynCtKcQb8n2
         WPBGP7oOyB/iZ8E6ALkZPvF++FufHav+Oxtwa4hA9jB+ur31M0+Hyb243KRdA0lpV/9i
         3IzjOLtYLsq3SAP8fLJuKx+jtIEL6ikqGkgceTcmyKb37onTWVRRLLe5tP+gGCOJCK3K
         xNEG9I5PqC6NLqvq7pKMisr4m9EwRrH4t5RaCLGGp2CKc8YKVFFYX2sdVCxS+nyM/BGW
         Do/w==
X-Forwarded-Encrypted: i=1; AL+hErFTL5eluSmHY2bd9zv1YBjarocl724lIT6t3g+EDQaFdFUX63ccOzYVMm9c+lqCdrrUssWJQW/az/4OWZ94@vger.kernel.org
X-Gm-Message-State: APuU4Z/QsG3hc6Sfo4CDesMnKW71LeUBK2RX/H8Qu3JOBuABDkCTYWMu
	xTOEriMsxWb9ch12IXDW2Rt2GJ2FcHtuqRm7GqzDBqvdhBvmDK5synop3nAYuKbRsmzcUwQdvPn
	FNlBb3r9TjWbXDD26FVecMQDXX9Dzt5IIOiysYfzD1PDK83bPN+8TphXMkegGpMpKb4uv
X-Gm-Gg: AYBFou1AwChi4B/EsAfW/rh7Ob108H8LTy4rSrDhRw2ADRXOYunnuo86YuKCZm+aavB
	bpNg4d9ZY2pMjk1YUfBo2BFI6AeQIdmN7sDhe464xzMPHsvXTJAn7Hs7i/HOrMH5IP7Vul8C4c7
	LCh5MWq2o71mof+Ah7FQUs9ZRYTiHfvmbfBf+h+mwz4spLJao9sGnZH7hjhuwPGtNbfYdoTcApj
	VGxcbWb0GjkF6otSfRSntZ98PM5hx3764L5A1OMfBnINb0uMQSZ356KKAtfTXMnsSngNu8qL737
	7B9KiZ51uy3orTgkgRQEYgSE4iTt8ISjrbBg3Z/jJiHJ77Gex0JxyrQE3hjRTM1Oy8C7fYSKLPH
	r7iXY/8Lmc3swvD5I8WumUxOIE0dz6mPTHUbXFTVFSv9X0VKQa15INYBBJqJVa+ZxCslg8Fy8c3
	3M0Q==
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691309eec.16.1793957849305;
        Fri, 06 Nov 2026 01:37:29 -0800 (PST)
X-Received: by 2002:a05:7301:4610:b0:36c:a281:1bc with SMTP id 5a478bee46e88-36f75a2b0cemr2691259eec.16.1793957848748;
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm10548494eec.3.2026.11.06.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:37:28 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sa8775p: Use retention for USB power domains
Date: Fri,  6 Nov 2026 15:07:06 +0530
Message-ID: <20261106093722.3261172-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX9oRpHo0TdxUS
 LJEhL9gAegFssgXJI3HoFqFDSt1roGo9GIdB0mYSFd/+qkDP8cZmGAqmI/EWoa8Z/9sMRL+v0c4
 AbOJTEF1g8K2CWjx5cPh282CJqiAvL0=
X-Proofpoint-GUID: TqD1Z2rarfKi08R126jLIsOb8g1gGP9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX8U+9FmNWEUfA
 ch/i19b35q/LaUzZIZV9nuue6hCHr4mKiJqIS+jsxxuj4fzTMojcmf/H0MKpo1dV+ZkHNaGhMz9
 wVFfI3uNMTcHeRjx91hWPZTI+/qieSnk2aSDi6onhnBoLt++16MWlWK5dW0DENm1K1++pa+PV47
 s8XroEyIl7i5k3YayYZXoDtFXwRh6jLYyV/dIb+yHgTuq7xqanpxi4TI1gRm25FdUUV10BmlxgP
 kiUEZWHjo7g44ZI/QSKpDfh9BIxXqIqecHE707KuHXxXWqvB/J215nMnkISBlBdHV5fhXG8y2Yk
 L7shANRpEEgdVl5YE820CJfl+ZX9sHX1yeHPJjo46IHWyZYnBdDpRq+O/zQyj49BVbkjymEnmH+
 5i9qaVNPyqehS5p4h2Y8Yg2K0n7XZn2Ade98/LT9VGQ3k1+AKGHfDHWwBe0vhDJ8zqRGp2zveNW
 KZndcogWBeywrlk+/3w==
X-Proofpoint-ORIG-GUID: TqD1Z2rarfKi08R126jLIsOb8g1gGP9r
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed9fda cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rGLbVbw0NfjaWOq_wPUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 0e02af686614..47acd1b58f13 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4260,7 +4260,7 @@ static struct gdsc usb20_prim_gdsc = {
 	.pd = {
 		.name = "usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4272,7 +4272,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
@@ -4284,7 +4284,7 @@ static struct gdsc usb30_sec_gdsc = {
 	.pd = {
 		.name = "usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
 };
 
-- 
2.43.0

