Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935343;
	b=nAHrd6aTgkfuRuKCc9Vces5h8Th+fnXuOA3rZadZXLa3JyR+erpOKWRSdUpzoq1Hn+mE
	 LF2a+cs+J5VAO6e1V8NkSCmFxj4mOcMTs2358uKhBNkUoAZ4V2y2K87LEzNzn/457weQ2
	 2VSYuPIQm33YqRZX0IJe2hp1a6v+hPCg0NB1To+woJzjW/39iJugF8lCm/xbmHL3UL4E/
	 rS+tUy+/8vDkPAQnPLU9K3acGgsCgLNNqP4IulJXPBQmqITWTf5lpmbr7FY7ec1B1Eqcu
	 RWluQMLCEN58pfZc/AQrxRdAfxKIeSnsf+SLJZkbjdXRMUGsTlGEND8Xc5SJxlgUYMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
	b=NDUjOIUHnW1kHGXQAoxI+S5FSIvlGAZwOiQYHu7gXd47XhI0l6iWAnQvgrWkDPxx45lQ
	 q2XRULqV8higFWLKvdw89ezihkJVO3ECckfoaacD1Zb9TOEYFpyhzcOCp/NNHdn29DYWn
	 bfYn0q8j+QHaIhxpOSQ1yKkwP6Nywk8CsNjAK9CNukRNFvaGLRE/BSu9E8/9dlXf2g5SQ
	 aEkW0OgbK6EUjjmXSzr0euEDZ1hRLw3lGbCkhiIoAv/UH7ydw1KfEbAG8wo5lDZmEvN7Y
	 /GZsqke1HeYKPXBOFOncWGHQRIBPP/c8GD1jehLtgL8/l17JS+pVEP/DAM6zegx0HyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E48C606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E48C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvQrKbg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R34SvqJk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGK3PB617760
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnW
	PeKrgISM=; b=VvQrKbg6YAJNRoLqeywxzQApdWHhLYpK3IWofb6bDkLhFku8iEu
	7HSUQfW300l2xR0gzH357+e3ETlEj2OSzPdHLe35Hl1avAOnZVzpkMkaDchT80Rw
	NPtNoTGx8ceJG4gYBOmMlYZtiv5u/JKm+U9CK7PTsjp0skTxX2ZamzzErb5f8BTE
	xE6aCZIVdWl8yIEHbIpls5Lby7eKAHt4WXvkpyez46VMeBo/5fPI8+xK269BBj12
	r6/xa6jizijESq05TOQXM8bZbyNZsqBHDdldP/VFkm+E0Jzo68tYbWx3wEZNh3tZ
	QZvKhS6VmXb1T3WUuAbJNqYVnSeU93VsbWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbu88ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:09:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso138643eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794935342; x=1795540142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=R34SvqJkgmldOrBZLin3eH9Rx1JAtQAtPmQrFsy91mZAvGNyqWMUFectI5DAF3Vg6b
         z+q++xN9pHSatGU4g4XWzYQFIqMu8aQ1h0gItBXFhk1LkHhEqbtxN9b+e4yOHp99AKsc
         GglvDe6Cxk5M9xpcvFIH+Tbo5t1RY1RaxoJEP2HEZh5XvuulMEcgj+98G4i40PLD1+Pa
         Nh56qYG+SQYlPonimAlNqrQljjoZB7ECUR0sI+eqdi6bqyEr8dThwL8L4WE3Ea/+Pa8l
         vs/CfwGt1yxFGZOvbIxNnwjbSmecjh4BLnugVgp5eVvG1p/3ZXXfVhxFf7ThVgwrCf5X
         iXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935342; x=1795540142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAfyAkYxyYktUSO+F60vOX+g5stCoRKsvnWPeKrgISM=;
        b=r3tNP6qp3G8+HDRt3KRs+LQi6U0Py28tyyxikhCoyiSSj9g7SuWi1i6iecxiG4mqPD
         o5RCrnjjuJ02RzeSkxF+Lgy0blD566SqujHXRRBttzKM9CC0QOpCYkXMPjeskXCKIn95
         kkqu3B3sE+AKRlLhwwjFSFb0WdQCo/acxTN7aAYI2APOkV3hoTFtRZG3YZ6+RMp7uNzX
         4pRMHx3ii/qKh630cUrbPv9Il9FKlrQY807lMy1z9H0gsjNvIQ+h/Hzp2bSeFs90lOQs
         rkrhlyF9Tv2/AEjavcP/7q9Gt1XQxiodeNTODwuv1nOW1NiflZamm+0SMxS1pPIcCFD6
         b5qw==
X-Forwarded-Encrypted: i=1; AL+hErFqR3CuQ0ihpjWdtcotof/JhFtfZnVlsJlkosNeIJZfA5+M6YFd34LaSQ+J1ZhAXyNuKtwXp7riPSQSKOW1@vger.kernel.org
X-Gm-Message-State: APuU4Z+MczEjOcXp7roeaq2PjTiga5p8RjLH4FbPWp0pgIB3pDtmxman
	EOzpg8ZK97KWMF1wsYwiS8/la7gD1V5Tij6IeXo0kgRevfj9lAYpOfSPXMeBTcPaUAwEWu2reoM
	3nMRbnFGY/cq5cgHtAwo4rkqn3pw4Sw7zSnpPmJzQOrWXd8/ffsikGJvBMWtIHI6EJKDM
X-Gm-Gg: AZFdTZfGJwk4UkVQrnXHNKLJQFO+wafUlK/pSDQYnrfdS+Og+20R+8mBwyZ71vDT1YW
	HwNzj5QvFNuo4ZSFnfK1GVgNs312W3RyEZ7hNcStjr0CxzvwBvBBieuHG9tOHMt9uoJy2IKce7q
	ZNo3ZwxUQhFDN7A0/75js4sdUhfVlRtMOcMgjkDFTeum1Xmoug16iwL1ydrP/JHVs7S1OrIKrRr
	SA40XdWmGpOXoCf/v1kPaexZp/v5K1QJwZo6P/Kx7Fx0nCrBPIp/DsIFJvFNMoZorVQVvgfUmBy
	IZo7NqzY/Fbhstixwji7YcmoVmQJIM1tIhFpTfUG3FJIInFmOg6fQSLEaJrbx5jgsXStvSKZX0E
	kdgV+gUW49JSVyFrKCQ5YzYeDJa2h0s69iPQv2G86Qt5DVOHM2pYeQGp+vlpZIzbScN0MxyEmwV
	XZ
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70419eec.21.1794935341347;
        Tue, 17 Nov 2026 09:09:01 -0800 (PST)
X-Received: by 2002:a05:7300:d210:b0:382:6868:b1aa with SMTP id 5a478bee46e88-3828101e947mr70377eec.21.1794935340795;
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm8859876eec.17.2026.11.17.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:09:00 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-shikra: Use retention for USB power domains
Date: Tue, 17 Nov 2026 22:38:30 +0530
Message-ID: <20261117170854.3257471-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfX0Crxy1/+EJ/F
 Je0SvP+UsYu/XcrM7CG/FWwl++M2fReYDqXpva+x/gKb0KqoerBrMfnKXG2XGWTnTDTpO7P4ThQ
 YGi3b8au5Ws0mXKyrfIYj993vHPjR8kSk6FPVbuRBgEXkr+5mCi4Of6wXKW3EbfLd4LubLr3f8h
 0V+YKt1KL4qYFu6z6Hg9NVftq1Isd//o760EfFJuNPQaFqH2c969KlDPR60rmaaQsf9qv03fJvJ
 oAEkPWVrtsgdqmLqJqrETMZgnnQ5m4MCTVyjvWi72iKQvjY7lOcwf5c2dFwm7nlHwlaLSPZM/bJ
 IjL9IbdkF+oK6Do42JS8DRXdaBy9cxqNINS26iZODN4AqUoE+DZIPFWwSDQHo+Ju0Zs6DSNtYM/
 djCDVjz6/lxD8hWsG+gezmc/352PnxGlTowz0pU9OBYV2QQX7UGQldoBgj1342LlDEVz70SAEpN
 Yh1ouKNs/Ce7311dqYQ==
X-Proofpoint-GUID: PB-GPzK4u2_ctGHK9QOT5MSheeWoCriH
X-Authority-Analysis: v=2.4 cv=FeOiV5+6 c=1 sm=1 tr=0 ts=6afc8a2e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=iCUNF_J1gHVpXzmuRuMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: PB-GPzK4u2_ctGHK9QOT5MSheeWoCriH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2OCBTYWx0ZWRfXzx2bXuy140YV
 iXWvtWeTe6IJyQykl9cKLYzuahL7zXB5f8q2mo85OM1j/BuWiUdwQRRKM1LSkO8mtiLcc4PWCEP
 MY5793rEQuGATTa5K8Jc3wqvX8Kq2z0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170068

The USB subsystem does not expect to lose its state on suspend:

  xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset

To maintain state during suspend, the relevant GDSCs need to stay in
retention mode, like they do on other similar SoCs. Change the mode to
PWRSTS_RET_ON to fix.

Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29..4f860985a8fa 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -4049,7 +4049,7 @@ static struct gdsc gcc_usb20_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -4061,7 +4061,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
-- 
2.43.0

