Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187317;
	b=DJ/GOtihhN0GgiaBvstIxSLSXnzROXbtEKiLCiizfa0+wAQCpY0M0X4l/rHn7uy8IWQH
	 aWB8d61pHfBxNzu3/oPKkxKQw3D4viXOVzp2HJjbydXwzB51KG3H5u6vMO0E3JR6pdYGv
	 gAqjmlZl/kv64ljfM+4eJmPke5k7MjMoXJ7klyldGTjuOUH7Gby//zglmVyhQfO5fAmhX
	 2Md+zu3bOI6SYTxEWH6zkHDt3UCO8/anKLyqdzrYpV0p3oYqroskdk6kt0LYetdSu/Y+/
	 p/ePWW1sYhmgbCmS0NEmV1S+ImMy1tRU4pCPks470YaB7zDzqhvRzkeMwW6GNeT7JFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
	b=znQ+NXda7RPsk0PqbkFFHAeScf6EY81VX9Ih5hsZi2ZdANdQEmmaqMs2yIsuTjdE4uLf
	 9Giy8YWs4V3Rngr1+CQsXvCu2QXivnqIC0k3rMtTG2pQUlRxJ/dTq0JAllN+JapQjGRmn
	 9nz7XH0+kpqZljQYzHBg8oubTouKTc4Gdo92U3KNZZNR1eBj/RGQfb/my182/s68bq6HT
	 PJvbzds3SMoG0GFWa+9B/qZ31Qq+U/OS9oyYpDRCSkbUmsoLLYzkMt7xrhq/zQUhEx8Jq
	 BT4x1zc2CBd8oRW1oojPRY9roCEKQlJUdLD8ji/mjA7Auz6IWEmpORLS5Cggu2WH+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3kXTBoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gimQWx/M";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BD0606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BD0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3kXTBoL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gimQWx/M
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfMh82663254
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kGQgdRbWpBx9us3aHKx11X
	YO1RqzvbRxqXhh+tVZZ3c=; b=U3kXTBoLfHWIsP6rd6BHttPt7nh2Xe/8I0u9T1
	NzOuMrHJ3kCclamj9XXy+EwHw48oRB6kGfQFl7Jw4Kh6DDC8cpcD0yI0w8WNMnYW
	kAQgUL+O3OEuD8W4SoSaTRfH4n40EXXzAXDnvzlammyglCwy5gDWpn3FJl/11Hwh
	15jWkAkWqi1QVjOGoeMjcqWnepRhTjixAP80PiCX3+8nQMt+gjMDSb2GFbWQ/y6n
	gnAtzsgaVHv3bMcfdF5ey4jGZBktfBoL6Vc2Tpkuz6T8SiJyrb/aFzcwYaeTrcB2
	XDgCebefX6BTYJt+7MeNxymLbPrmw9XHyvX0qthjVslwPeKw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yjg92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:08:35 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3ad0823c3so15653927b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795187314; x=1795792114; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
        b=gimQWx/MMaDpvyxXvvlpa4g9+2rajD0IoD59ihPxdPHz+EtTmZynKpuhjGVHnOJ7aS
         CzNsDUnyTVbIdBOasN71yxCvU4Fa5e7nBXts/4iiX78DhMW5fowsTab/vmGoUmLqC7li
         Rw5mwr2/Rdnq83WBmvwG21XHdIIEKOMiA9t+1KNqwb0Wqx31c5l0t4rrh+TQHI4rTQZY
         h8bE3j8LDI9YKsKXsofvRC/VQjpmv+eGR35DqEQLj6rAfLcxpWfZKjdzZmrOciHioSUS
         0Tqbf9/lk2MLoaw1nCjGqXDdJU4oHZLfk2S9jF+FL3DTwTqd2XYghGaaxm5FwbMjzzZP
         6pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187314; x=1795792114;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
        b=PCDkAfW/JJQyJpBr/7DMGEktPng1SZXumPSTwP92aaJSBc06W6pu9aabLGkNsY13xi
         FRe6WoqIf52rLwzbaKxXPifijfTCh8qEloiPxbYheAqO3TaDLpelbie1XKieCcJXqw0S
         aZS+2zq21MUL7l3+I7f1DkLnh4hNaeXDGndQrzqZu77IaYnzmljbnYhvRzGmOEkQ5FWa
         /t2p8MknKhwNIRB1ZjqD84blFkU0fS7G/Hqma1tFvtAukoDsitKGyx6sBCeGdzOnjOMV
         oFlSNEi462rlt0YIOdsFf/iru7+T1voJIXv0pAE2dKxn9V9Q4E4Y9w9xRrw3v/juA/YP
         Shpg==
X-Forwarded-Encrypted: i=1; AL+hErGbzjUs6e+LaVry6pC+aLGT4PtK727x+ofnFi33XHOtSPIRFtPoFpZt1+BOK5AV8/JHUVMHX12MZWX5uSuD@vger.kernel.org
X-Gm-Message-State: APuU4Z/sWeiFN2uLPD9PleVP9X9CChesIEBZJtnJCor9BfrzKlTDukct
	/vaed1xqdyXVTVI9/koHEIOM5ue1PKKIwC+08qX2EEcWW4NzFI0k4a4PYD8dpErW4vG5JR4BOrY
	8XHBcyn5NwY/EcEiJ9+p+dYv66LKr7TBWcX/ZA/Mv2cmCSVjr1EfAmN5W2Isd+F2r86p4
X-Gm-Gg: AZFdTZdLXjWFrGYLtSugM2EqCOOg2fuy0v32Jak7FfEpugQE7tWuAk/GEuDbzSw/i99
	6yxgKRlCKQj/lbI4YLWjpnWkfOHDvWLMdx27Er/FovpnmqVz8Q7DYiPs/o205ZYD/PmLMAUTCax
	NnAElxQsPLE3SOKmSBdcm6Pui5uONX4G1+/jYEr4ZgMa4OPep9j7lTuXClM2xYB+Sow6r3Qslvh
	01E4osB61h9MNcqm1hIvqdArVIt2t0QTn+C1m796xVVTM6kmJMmYkZKBi9GeRwHaWaDmMlpeqZv
	T05p4OOSFs2yGTvq23I7zXiE+/eFBvwUTspQutMOLp6TICbH7Qd0pgAkAh+oCEb0I9D8ryU0NXR
	HuNiV9zt1e4XmhCyObSEnC2pQw60gCc4VAArGcnBdY25tMjDso+bdSA/SHQ==
X-Received: by 2002:a05:690c:6b81:b0:8b4:c71b:e4e5 with SMTP id 00721157ae682-8b52047231bmr17494877b3.25.1795187314277;
        Fri, 20 Nov 2026 07:08:34 -0800 (PST)
X-Received: by 2002:a05:690c:6b81:b0:8b4:c71b:e4e5 with SMTP id 00721157ae682-8b52047231bmr17494737b3.25.1795187313647;
        Fri, 20 Nov 2026 07:08:33 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm5905971f8f.32.2026.11.20.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:08:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 17:08:30 +0200
Subject: [PATCH] soc: qcom: rpmh-rsc: Write the sleep and wake sets again
 after hibernation
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
Message-Id: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG1iAGsC/yXNwQrCMAyA4VcZORtYK6viq4iHLYs2wtqZVBHG3
 n2dHv/L9y9grMIGl2YB5Y+Y5FTDHRqg2KcHo4y1wbc+OOdbtEz4ojyhzlNENUJlK1kZowysqS9
 VQO6OwZ9PI3eBoFqz8l2+v8/19m97D0+msuOwrhu/DYdliQAAAA==
X-Change-ID: 20261120-soc-qcom-rpmh-rsc-restore-hibernation-e536287de56c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+is71aRCqJ9UjXAHZyXlWJyQXKsk4j80c5NYO/6FxT8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrAGJvj43d9otqGZDe57IkVQbKRCe8B5HTri02E
 +8ZsF6hu/yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawBibwAKCRAbX0TJAJUV
 Vv0FD/4sosFz0qESwGl6Bwj1dWOq4Ljsb5d5ICBjSHrvcC71WFS+/WWl7uZipSdl9DvaUPKp2/n
 m0Srfx9VmPMug/lRd5UBWd49ey/UwdPkXNkqswPljowut6RhMwKPrTZwTyRf4RXEsjrQDhi5kwh
 NgiTTkuaca1Opg8munp5ggaH+mCTUA+gfM5v5OJL3xkqDwTu5xwCkrxDnURUu+nNG9h8WHacqE5
 9IfhdCJaSBy4WfU6NNVbcDKYfUKApezC2DiroVwDmQhuWKjk5SpOeqkDURMBsnOONnDMrZ+D/+0
 RneFlERAUWuubJLc+mRxFxuxoBfoxIsikaCws6MMOnxus+Uv7mBVD0W+L5xJwnJc0uNjbhsVcvu
 QZwEN+ByW1Hcim8E7fP9vtu8qNYHJL+E+mYOizQOrUgpzS+cSVI9OPmKQgNZ01g1qJ/fP0xRG4Q
 1mUpNnucdUPsgy4Bje3I0X9zKixNLFdIyDDrHBZ7qBhxshMopj9GapsCaaXP4L1sEnkMxmuBWRs
 uZ0WvfEO7K1jPYkVpkkOJONqgWiJppqs582FA9WbsGTWal4vv2c0uWFAQAq5lSTqT6GxdwgSuS3
 okz+ZuR06408RZEobpUxadGMvxtKunUPhwfiUNrinAhz0zQkPGsCobOlaQtC4lDtLu7ukmR8eia
 7L00Jo4xg5dkmNQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b006273 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T-_UO9njPLxEiKD2BxsA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MCBTYWx0ZWRfX0gvF1Ke27V1Z
 VOSA0QQhl+jpmXxY3iuFUfRCxsswlpaVh3a75saOG2B/x9ED+VkUBRN/nWDRHXU63O49okbPC7y
 AFgzCKoen4WMWSUNK506kfBK9tkgJQhAMKZOgF8qrgQN6sbS18A2x1777yxYEPRZLDOccqeTTnY
 lDWiNkOZR7q29eUTM4N08BvAwVhCWDbiBV9E7UfpBf2Q4+uDi6tWhGUX/ySTaU7h737ZP6/CMrK
 lv53ub3LgP+db6631cC8wA7vG843ZGzuHr1myphK4YhGmu57R+0hDS1MzVViR+juowMYQl53OvU
 e/melpdHrqgyamEnZ80slTTbcD40p4jlmyoOOI55RJmjnKmsai3zJaNBmCY6rLadfqczDCoxPce
 mWa5HSAv6aPhAxFwkIO5baRWl3Ad+9iXwhsfGV0HgaaYnwAXSAqhr+6sGdmon+jezLGAO842+Ha
 phMgaE1FJ+j5NKUcocQ==
X-Proofpoint-GUID: QIRSCzpPkRTIuheAFOSi3VBA7vap0Jim
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MCBTYWx0ZWRfX4NwOOmv8uKMc
 SzbN0j8eYwNsd/zJYhMKokg49TbST7dI9PvsEet8H1zA0bPHoNbjKJJVSpNfVfprwAjqUEtlX/j
 NT/Gk85KzrckHHhIfAcnz4xToC7svkQ=
X-Proofpoint-ORIG-GUID: QIRSCzpPkRTIuheAFOSi3VBA7vap0Jim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200060

The sleep and wake TCSes are written by rpmh_flush() right before the
last CPU of the RSC power domain goes down, but only when the cached
votes changed since the last flush. A hibernation image is restored by
another kernel, which used the TCSes for its own votes. The cache of the
restored kernel still says the TCSes hold its votes, so it never writes
them again and every power collapse after the restore applies the sleep
and wake votes of the kernel that loaded the image, until one of the
cached votes happens to change.

Mark the cache dirty when restoring from hibernation, so that the next
power collapse writes the sleep and wake sets of the restored kernel.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 02b74c510c3f..3f89857d9d22 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1169,12 +1169,35 @@ static const struct of_device_id rpmh_drv_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rpmh_drv_match);
 
+/*
+ * A hibernation image is restored by another kernel, which filled the sleep
+ * and wake TCSes with its own votes. Our cache still says they hold ours, so
+ * rpmh_flush() would never write them again and the next power collapse would
+ * use what the other kernel left behind. Write them again before that.
+ */
+static int rpmh_rsc_restore_early(struct device *dev)
+{
+	struct rsc_drv *drv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&drv->client.cache_lock, flags);
+	drv->client.dirty = true;
+	spin_unlock_irqrestore(&drv->client.cache_lock, flags);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rpmh_rsc_pm_ops = {
+	.restore_early = pm_sleep_ptr(rpmh_rsc_restore_early),
+};
+
 static struct platform_driver rpmh_driver = {
 	.probe = rpmh_rsc_probe,
 	.driver = {
 		  .name = "rpmh",
 		  .of_match_table = rpmh_drv_match,
 		  .suppress_bind_attrs = true,
+		  .pm = pm_sleep_ptr(&rpmh_rsc_pm_ops),
 	},
 };
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-soc-qcom-rpmh-rsc-restore-hibernation-e536287de56c

Best regards,
--  

Abel

