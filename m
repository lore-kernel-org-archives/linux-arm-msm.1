Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834846;
	b=kXaGnJLVFh1dkRzFGUCOtyUspmn8RIBPOMwan0m4wkyx13eA0SqLQfzTI2O4wFVxOK0p
	 1OtbwQ4yeqliEGpBn5YmuYgg+j1tDN0upi0X7ClXcKpOAJcVlqkbC01c5ZXwvriLMdSl7
	 CHQdFxZXYebABfGfR1kigkeb3Em72OoUGFv9yWH4EY8Rh6nJ/3BxS/eFgHGBxto3Ds5OK
	 GNCxESxT66xM33ibsYKQWNhNkB6zuTam6KCy2PG7mrIevkqEen61T50//zmZPcp/PP5Cu
	 UEb/X7nK9AXRGkBSuAmVTmS/tSUyu4svx/hNfIjw7mjE9k9GHLvj03fhF0gtxfwPCpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
	b=GshAwk0qtRyCnrdaEeeIal2eoRPHG2bI7oH7Ii3Ov+TrDzy/ffQdenIo6Ye0iTt+p3S8
	 g6FvF4pKi7NfCTbWg+NZ5KQLWIzCIlGbM1iWgJrp5fWlRcS7HcUPPoLq6OCWIRdy6zp61
	 r84nEa9r6F9G8YRw0+KP0RdvCGHmyk199Y6G10oAxbxH0C9f/Hd7OEW+3ShjE7gt02oG1
	 7ORfco2vJwIaLjnVY9ykEsUkwJ4Kk2CYGRODCYkoHSCCQo9CclSp/Khaamd4eMBMTRwpd
	 /wbDBZey+TC62LRu/hBEzLTfBTsMKrsASEhZy8jr2ZJpiaZWXpX02v2pue4eZyU0Qqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3Z6gIhi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986460A260D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0986460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UbJGQHch;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3Z6gIhi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oNxt819848
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pd4mEHoCoIS
	2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=; b=UbJGQHch/Jkcy4/t23CmRiCK2Ac
	SSpuxv9XNcoBWBo7US9DhAM1m8RIGyb+a7zYKoZ52Z1VGEgm9MKMmEr3OlGkQ6fg
	Rvy0SnSDdMbj4KRbt8ao2jCy/PhGVEAHCD3t4Po+oOoU0eH7pX3GAXx7L17uxGSX
	fNhIVBc76cfuSYw4OINvIyxiKI9RifKLzM2h2GMrOqh2g3jv2NjRmNInhLVPEDxM
	ZlWns0GrxwuWnVjzyhKQlwdk0ennMJJOmhOvpZlTQVX4J17My+eB7stITF/WHfjt
	ioPUT/abCck/Ak4WQTkhVkW5vNQCF1c1dAIiipRihxdK5e7vSEgZZhf9p+w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0ggrjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so202107585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834844; x=1793439644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=T3Z6gIhikalRKvDpEg0mKZEonTRfPsXKJaT8McKP/bZZRFXjJK/DDbkhYBI0OMyM+V
         IXLvAU6RTkfGM5Gx6xu2N4Vb6L1M3xu9m0wT9I3QTq675CM0l2sEBF5pYtHBl6+NM4uD
         MhC5gQiwIkKrBJxdjGCKQ3URkZhQj1uySx9NeokrHiEjZVRPkwl/eYaZ6eAkGg6OAySv
         STpCC+iHaqbK+BldOopGl3t3u4HUMkcD6oQQXJvFgXuAHkdX4/JcSa7ho6/gjItx64t9
         d+06qBORRiohGVT1Zqs6ogLLUzDSkn7br4Pw2Rrv5O5cFHENQr+ro8gpUHg9tXRkWDbs
         Oddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834844; x=1793439644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pd4mEHoCoIS2QzTItq0USzQlU7bNEJz2BTg/cTGqv+I=;
        b=HVLIPhb9QrZZWadhBE6JPyBwRJYXj+6sGisbDX/UAGd4akFbRV7VQ+VbDBtjnTixMC
         F7drh7i/zdNZFaZCUrTLJyEgqZO1dmchVpsOcRHxsI7ZUyjySUerKGtndqXCCjeG9eNy
         4p/Lawj6ClPqkxdqmId6PnvQfpt5090ZvDPT1teJVu0GtXHudRhL4XFbPR48XalpPpkP
         8EDhevRgW6ltcDBPGDGQCwj9zcNBVwa2oHwdnN2lY0PFR5p0WBHkBUA6SXTvg9K2RtDw
         8t0/WqEeX+IL+fKPJ3zsr47ky7wrUQvjm9RavyyScmWgVY+H/iBDVNCzP3FJD/1o39tK
         kGkg==
X-Forwarded-Encrypted: i=1; AKwUvBxVEqHvpJRfwy60db2x8G86UBExctMmuTmRHsWYZLSA9y4HqVhbPPwvKU4vpgR8cOo+CwXTTuLxO0U75PLF@vger.kernel.org
X-Gm-Message-State: AFq9FYJzdbDi1Xt9du51DWKnGvc5baD8qyixED1r3lk5IoJIn5HBJoyb
	f9M1twHFLMGWsJjgwj8i4e8/QZ3DZYHnxHO1r90IexwoEhMPVMwl3aYivKOMLWr9KUqeshwgpw+
	pedq+1K/tH8i8/UvsP8QW7e+RV+gyFRcCrBSggh5+kHBq3yaWSIJdKNuwnfRHNtQNckc5
X-Gm-Gg: AYBFou3Im9MapJwnURCFj2SalhtbDYXjV0y6ePx2bITekv7Cc1AXZfGpH7AyIeC7owE
	7cxvV4kKx4XvPow3IA0LFZU8oQvuL+bIBOmZErScX4nf8OtznY509p1mHxXCyInIuFaeDGbKNo7
	UqhuSj4ogAVVqahSBg4LyJKwUNZdMUp7ztwpsIrPZrIxs9AUidY4wHbmzoNjFVOiv7sv/H/cUyt
	PHAxzhwu1rGVPH77oescuPcACu+5q2MD4xxDV17H33ZYCHa+nxGTFXpSQp4ik6TnlG0tkxjH+aH
	138p28+ntn4Qenfk5WMEVnCjVCFsjDR9q6Q+RlTh1V3sdirQTrWeB0UwzAHABsgqTmaHvGCcySR
	AoKF6K8eNuRGhxoztuNg8bZnU
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190203485a.65.1792834844208;
        Sat, 24 Oct 2026 02:40:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93b:d7a1:ba16 with SMTP id af79cd13be357-940ef9457c0mr190201385a.65.1792834843748;
        Sat, 24 Oct 2026 02:40:43 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:42 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Sat, 24 Oct 2026 12:40:26 +0300
Message-Id: <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rJLtRNdWmq5WowdpagUrQ0OyhRsaSihu
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adc7d1c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=XspRBnjjJwGwxb89TBgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: rJLtRNdWmq5WowdpagUrQ0OyhRsaSihu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfXwN6qY0h3voRR
 tI6DV5XhjXWYOW3hqO8zN5ZWn8LcgbNF8BVmKCrBBVXLQpwH+Ce3K+1L0BOk7V96vfXzTlIxx8c
 ttgxOVkC6Bwhm2PrscV/jeXkT34WEYOi2hvqke46m8Ep4crRHvef/FPRH+jOr+aJHs+ThiwmFVa
 xRpuIik15q9/+UqkQnAD3oNRrOrS3gAeSiFOjWEYNOkOTTTmYAfC7DmMifUmTs72OYyrTnjsRVn
 SizqB/QiMQAeJOIg6lHxkyMYgyT63zYMRDeDcZ8ZNUGfxCKs4JUCH+nAaGlgnRJ/6jY4YHQAX/I
 EKJ6uUlPIhXwZRUjev91H+Fyv102BNwB6Xrto6nE7oNh3d3ldRPo+goTAntkArHOVBRmroqUVfw
 0+knSrdSSmiz9ugbdS8Y/qNBvItSPkqsnQMQWt6R4+RdpYIUyfpUIK8pqhImtXveWWJuMQ/8P1p
 GIfdN4AyGmaf/pZNJmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX5jWg6em1AvYw
 JwNgDUkEWqd4lCXFeRFK1Dn2V60ONpilzVZmEvmn+MhnOUyxjz1BaRYOIl6DxsGn+9p5EcFQoFk
 6Gp0IE54XNjDVyEioYQmM/HRRbGhwGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The SM8250 VFE AREG clock lists four rates, 100, 200, 300 and 400 MHz,
in both the VFE and the CSID resources. The VFE only enables it, as
vfe_match_clock_names() does not match the AREG clock name, so its rate
is set by the CSID, which always selects the lowest one.

Match the VFE AREG clock in vfe_match_clock_names(), so that the VFE
selects its rate from the pixel rate of its lines like for its other
clocks, and drop its levels from the CSID resources. The AREG clocks of
VFE0 and VFE1 share the fast AHB source, which then runs at the highest
rate requested by the two VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 +++
 drivers/media/platform/qcom/camss/camss.c     | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 614497235eb4..948f0e12d542 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -907,12 +907,15 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 {
 	char vfe_name[7]; /* vfeXXX\0 */
 	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+	char vfe_areg_name[12]; /* vfeXXX_areg\0 */
 
 	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
 	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+	snprintf(vfe_areg_name, sizeof(vfe_areg_name), "vfe%d_areg", vfe->id);
 
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, vfe_areg_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
 		!strcmp(clock->name, "camnoc_axi") ||
 		!strcmp(clock->name, "camnoc_rt_axi"));
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 68b43a720869..100612d97fa7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2053,7 +2053,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
@@ -2070,7 +2070,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
 				{ 0 },
-				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
-- 
2.34.1

