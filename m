Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665814;
	b=1r47+CrXJYf+8srvpcJwv4Dl2uwTtjbtk4TlUipHopPUY727jkr7iQ34afl0TfZvCU41
	 /kZsCNu4AgRc/IteAELUch1lRYqTdX23u+EjIu1/7xKZ8AmUu52y855icoCGTWtEoSE1q
	 9f/mcHFFiW/4RkN0rBmdrIjZ+HziYyr2+3buP9uZ8fe0vBSKYthQ+JguJrvQcZtYBOPFE
	 AS/4o7Kv395fP1PSISSYUX0Iv2nLipFik5dDsm0DkzZvZtk1H+6ApyxUbSwVI66IcuFGG
	 0fp5yo8hil2x5lahticSO1NvkmHTHxqLlvB1stTQpy4ZeIPsYwQbcPXLV+GX61M4S6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
	b=HzQGCwR+bYdoirtLRjz+C5SslEiEX1qHcO4XztGVM+eYJRZaTYMCokSza8p2x8WUFc/Q
	 bJCHr6KYvcXVUrx++HEb9dMzIE0LILFEs1xDLaaKGrGAKl87OJhU6UhSNOeeFYC8XdTvu
	 /HLY4WcHkvpAFINK1D8uAZvx57MjfUO7MfENPYgnOR+0pHuw5Bpt0u8LSTxuhbChGN89G
	 63z8W8I35baqk9Js2CJl4TuoHdt5NcdTNxU6eRQYjxk5PEHtNehe3y3lpVNrRDz23rMEc
	 glTX17oZAEg5wp4TRpN+ccDe/c2Ly+f+QYAY0dWCvGO3oCMwTR2GKQCl5tUm85+HW3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T+fQu8Sh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RiLUo4zP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D2606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB7D2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T+fQu8Sh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RiLUo4zP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Mkj2398914
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ov8/SovJGBx
	Yq4ezwQthf2+dF/XG7/tdwQVejwizs6g=; b=T+fQu8ShwHVqoR+D3z8X0345Xv+
	XtlYNMbOPHN5cZmSKSWPwTEDIb+il7x8/uCLzNJA8vI6/hK1/LlbwOFSAfbAWws1
	4QznWixoglmFrIktOwNXUteYKSoMnO0KoadMI00y6vW/ISEfFpVyez5UwqcvqZUA
	37/NtlaDO5amUN40mw8I/4o8xR5yHvI2JYLIaroNCvD8fqfoRno+5EasYcHsr5iX
	fI09mdIvC9dJ1+GX/Eb9Bw9aYMAfP/wNoVtyvhcm7gsl2hbtN2/rayjYn9qlKp1U
	nqsVC7opNIDpSUkvdw7k4tvKBK+qbosHbCb6KxefUGo9G2ppMLiqvd+482A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt5j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 10:43:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9d52f684fso16543305ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665812; x=1793270612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
        b=RiLUo4zP4pCqR2o0Be8wER+aftTvRuaqeYxDcQ56r/UOlGeyHRbzuTYtMuz70362mJ
         Zyq50pgh735WojgkrbTQqeHPe0+K4n2GsZFnxDMbP43MPO4IWPDuwPG65BvNAUKYf8Yc
         bqwNJEnvS9LcHP9VPjm21d6p6bq+6IJaC2Wr+1DnOyvUPMoF9tfFZe2vhBgUXzyRAIXu
         QdrXf2fg6v/NbsK8Wr+LTiiwSJSzDdpOB7ic4PlJtTiaLVGgMVn19IyZxKOmbqdvm83U
         +8urv7VMEVCcJ6eCU3diXefQAyyhgHMW6cE7lGWC/ogc7T4jO+UnjSbL8SNwSTSdj3c0
         NV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665812; x=1793270612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ov8/SovJGBxYq4ezwQthf2+dF/XG7/tdwQVejwizs6g=;
        b=AYNdt71gLDdgg9OmroW6RUUFAR6sMcOSX5jq8dBdkKIEAJo3eOvY0BxdfGfcL2dSop
         +2dtGv5elTO6l4W/mgp/7OTJCNQzxr9ScSroEXj9kImEvVkLmZ9KrxiD/fFcG+rXsbJD
         qTA5PMRRXrPgXBopPG6rcEbepMZflHtjgrJx3znnLc46K2eg44euZUrRYKOkpPf+Mh8K
         3LrMXRb1nSAwGcn6h9P/XGpW3wUhopn3ZPI0iz2Cv8pKntdg3jUXoEz6Io76ILIh6G3S
         PR2SkkhjwGVhbwDopz0one1twaHOcvFhiDdiCfArDlqIrjwAXeJKFIwH8YsqWuyhSBGO
         2x/g==
X-Forwarded-Encrypted: i=1; AKwUvBwRyac19+tsuBH6BVrf4ZoEt2GaQF2eCIxDnCDkHrLrX2DwkQrp6gKRYV9vG0rn48xT6Q3RxG4ej2hZsOzR@vger.kernel.org
X-Gm-Message-State: AFq9FYK88mFPkOzQvNDcnhafZFqN1U4KECx6SlJujZ1BtMh2nPqL2WJw
	fXvyGQY/oLa2ysju2x8ScDL4UJOINZd8Zv6+qpuQVDSIz6HfXo/v3sSPWJ2XztEBWgJ3HyzpDai
	H8zuW5n/KOJKkCKSB14khfQEfqiyd3IluVc0dGKht5zjeOgQ1JOvw96mN170kX3w9jWwzu4kGLd
	ov
X-Gm-Gg: AYBFou21/MGq9hJGbApXEPxoQd9c5mVoXkz6gTKaGVVlxnS9wiujbXGkIhNxM263JdJ
	UGyan+N7aOixCJ6hW229iYsnL5gQGqpdpFjZi3OXoRU9VusMmgMpfkZbuqLqyG+NOMp5tnfHuyV
	9TS2hNDXkvD4sn2uTbZs6ZXIEM0D1iFx3oiXelnURWrFd7aYOMLbkpHeuReiXiWH3MhGHQ+vYlo
	WLIheEALYBSZNpsTFpU+KImWkV8KbaB+MAMcLyyr65PpkrcHjC4iWB2qP25o1Jy1J9RiBFt/m94
	TVhLpslu/vY0KideXqn6DZ+b7PGNdECXCYbGMMWePQ4BEdJCV+VXdgJiX2mkvmSRDL3i3oZrR4H
	XqmxFP/xMaysbF3malTTlvgvw1td4
X-Received: by 2002:a17:902:d4c5:b0:2e8:31ef:d24 with SMTP id d9443c01a7336-2ea43e0abe1mr36051495ad.38.1792665811705;
        Thu, 22 Oct 2026 03:43:31 -0700 (PDT)
X-Received: by 2002:a17:902:d4c5:b0:2e8:31ef:d24 with SMTP id d9443c01a7336-2ea43e0abe1mr36051325ad.38.1792665811201;
        Thu, 22 Oct 2026 03:43:31 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm22327565ad.39.2026.10.22.03.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:43:30 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume callbacks
Date: Thu, 22 Oct 2026 16:13:20 +0530
Message-Id: <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: HGko1_14gEF59RH-gDOnYrwmI1repGHm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX9IfgrFOVazji
 ezgwMWbuBI7g1x5b2isHQ8e4CkEQslM0YZOixpxThxwU8gYFQo3K1O1P+1lpGI1qDTVWK3br5Q5
 QzFken4fEsaLLUAH1XxBTaTxwgMnK9Y=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9e8d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=mvgpHXA9jrGi6IPTKH8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: HGko1_14gEF59RH-gDOnYrwmI1repGHm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX9zeZlvzqm+/f
 9WUvNL8sNaY1lHEx2nIKbm2tf+VQRSwZ4iWRuewtBmwl3d0K4RJ9DERmbk9MljwpIA0q9BSiu1b
 ndf73rvot+ViPzv60AwrDKG7R6QcYxuY1XhrBX4rXWSLeA06CxHkla0Osr/cGKcU4LjUO71QM8d
 ur32H4QYK5xLnanrkU0i+l+7jVHgDSn9JCEyWBVX7/ePNidc3axY9rfG4IPaVuzlK3m2OV9pKzL
 jgt7gWJmwqzi1zrF1j3Wgj97BVmhe91xuoZimSCKgalTFdaSF2LqMrutq9wRUf3Zk97OyR18gQ7
 DzzJAuSFymhwHtTkls4N/VnqNFEM/rLDwBGj0LRjnxw22mp82hfM462OZVAnwgsvdBJoQouwTiR
 hie/w1h5CRjaCYICNJNsJk/Cg7eFrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220042

Currently when we perform system suspend, the phy clocks aren't
turned off leading to power leakage. Prevent this by adding PM
suspend/resume callbacks for the qmp-combo-phy which toggles
clocks on/off correspondingly.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index c39ced168d03..f624195c9b84 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4463,9 +4463,26 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused qmp_combo_pm_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_combo_runtime_suspend(dev);
+}
+
+static int __maybe_unused qmp_combo_pm_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return qmp_combo_runtime_resume(dev);
+}
+
 static const struct dev_pm_ops qmp_combo_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
 			   qmp_combo_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(qmp_combo_pm_suspend, qmp_combo_pm_resume)
 };
 
 static int qmp_combo_reset_init(struct qmp_combo *qmp)
-- 
2.34.1

