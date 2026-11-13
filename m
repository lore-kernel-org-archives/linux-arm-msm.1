Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565887;
	b=i0tqSpEy42CHyQrU4TgXr7XaQmfSYZtGPPxkfCv3n5OUaeU8UlZao2QQnCMvY6rnOnso
	 zbalF9UtUUYHq/XPNnolkva6wGlXloMnVKo1hTbxXr17PPIX7velG7aYJRpWziz2XoX9j
	 xXPM4NLdijcrx8Xbhxp+JG3Xr99nLNtKE8qsHvzUR07B9LoJMCqI2SIIp9wCjERCyoKKS
	 zgXU5O0T3EUkVtOdtLZl6ii6v0JQ9cZpFl1o/e4mAGgakGW+MtvQFtoBEB/fCGNq3Kf84
	 7D/eMv3hTQHsR7/yNBEK7utpfWe51+VSvojUinYhXt83I34PdXBBH21eAQdHxjwMz0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
	b=gAK3xkm1zvCEq5ke+DF3nMtmSJRw12pyGqy6RUiRXfNIvtiA9yptViFZ6oX9m5/uFErX
	 6+GkbVtZG3JUkqNi3KS38k+WWAJvTzrXNrlrzjzlviahivmESZUrbhw1WvQpAVmIA70Cu
	 skfkByJLiptmULNv/d4OMs0xELLmG01WL0ju3/A8OpjvO6fn3UdP06u4sqYe4IdOPL5rm
	 xL2hVHxkq+GS/cv7uAjS9l7YFevZtjkdibYRXWWiaRyaHHyGBM9uIEKteDmdHsYQsYkhK
	 wuLjjh9+zq89XjU1+290kZ1jwEep4s5n7NDqlsiaUqjGo99PHYo5+Wl7y5+Z4NTBL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LTE/ZDYW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bli+kDLs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93459606A8A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93459606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LTE/ZDYW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bli+kDLs
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uw7N3619853
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx4E2ww8dsW
	+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=; b=LTE/ZDYW9ed7rGU6xUSntu6hvb9
	tZ+JlLhUYg+yOcumRvBrhLXbamvUcMteM1Ipsr4euRc9qWWW5Iaca0KVxkaULwJv
	T+VneMVeYvjZq3+Yhac8xpp20UhEPHkX/niX7zpI9BJrDwxtlXTyTTY3l/BqDOyF
	g9kWcoczcV6CG44gju1qSH5bmc4rF4KjBAdDRZ6nzRQ3IqhxoZi4dhs7dqZDpuMp
	jd6tYwTv9lNhieBpJBxR+rdD0b1RTMclqYTE5gVD2vVNZYrKAKzmcYhGU9kRtWbE
	e+uES5lvCJxsaNhhi/EV0GYn6AMZ0YMeQBk3+aBnIxQjNMyHM4bhi0cAP+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8xw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ee04c49451so13249825ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565885; x=1795170685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
        b=Bli+kDLsRaclkuznDGGF3/w87xu0HlDyD+nP1TyZ5XDg8ebe2+iLYeS6fMHSMAt9Sz
         SxrM7XrlLG3s6oQGkcxoPAkJ2ktIAs+CqEFYIpgdOBbVPzReWr2jhTg0FmxylBZ9i6Wf
         ffXwdpjSaA7mD3mSJWAf+BEe3T9Kv8eUmBvOTteCkQjOGCmyo8d2ZWUZ87mbSqC8S8T9
         +r6VEKutR3OgDlg36/Gc5ZDDNzEiRo7Srkol3pmPFYZ90BL743f1WBkDeVjLkgYUD5Z6
         MpaUjXRzU8Y7IvEMq10N6aqWL/o3APJHQRL+5+iTUmuGpQ95TK2HYeYrdV6piMCB16cX
         zx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565885; x=1795170685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tx4E2ww8dsW+6LTyMUOjX+lhfVjHpUsJPXL9LPfsiiQ=;
        b=YQhtWjgiKNEe6h+Y8GG5E1VC7Nyf5y/CWKDG+OQ/EpO9F+zYhd7X6WctTvBM55Q2v3
         nkEUPPu7RmjNcTMY33PbKyn14yHBqQpTg21xaBnDHwZBvdTb9P/4uKk04U3PL1CxNSjF
         scGY9ts74FET65Zqp4rgkgOfKFBGA9aAejXqZpETnlH5ghqT2BP5SFu//avHZZwF1pPQ
         wg0kK4puWFkyjWLdRO9IkTo1ipVg2XIr28CqR264LGcT/vIQtRj7SzyZMffONKhdh22A
         UxMkCC0RCfqTlgMYUwYzU8GIaOWn71LFHGAXMmNK5+IUTGukdPa/5h2udfRJ9cOSe3e8
         F6/A==
X-Forwarded-Encrypted: i=1; AL+hErE3/Ulp1jVg5Tw8wCIT7pSW4k4qmhdvFNDrcvSlIZABqCsQjDUUBatSWF08dLWIzY879qA8EjiRIfjHBu8X@vger.kernel.org
X-Gm-Message-State: APuU4Z+iwXWMFmER5/JpDmKFfr7D3hitAuYPm/ojNIAfC1OZc8phMBUg
	SLABfrZ46Kox0tBesgqSo0Rz9irAnpWNvX4HyM1yCBT9OS0ElIqTUcFV90LlNcdmLQswURy+inr
	eft7kdO8m58DSVX0qJWnTf5kJCaFNh8apz25PQtV1leVqepQBnv6h+goIBauZ7+b6B2Xl
X-Gm-Gg: AYBFou2bkpzmBjMUEcg67Er87FWRIAuLEZ146MtD4uWswqIk8vFeb0h6UFPZSUKVADw
	B6AT1xg5HKu+Jakv4jDQnhImTi7n46xte9AgQwcStafA3aonUpLQVQk1KHHoStgqrJWSS6jPqQt
	cGHItfMHsYYOiN8sKRykrgrDGAMvIDA3sm4JmB9a/SdtR6K4Fbhp//CG7YpxlvdxVIMDKxXQPeZ
	bEYiGfhSiMEhp4v0GRbODBzwFrrgETgpqDcswI2YDIjNF8+0DB1DoOGUXitHWp7ErvqThV062K+
	znZMqaYo1at8aASEEFNvKeJI14nLc660ZcQDAuIJej9AtFaBwCpOYiznTCBWYesB017YnOU65N7
	s6fF+0xZzL5UESlUNMBWS9oC4iIcZcZb5/cveTATXbghJSwkHZHyS6abYB+mu6dEgMw22p2RtCZ
	Hw5w==
X-Received: by 2002:a17:903:1c1:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2ee0dcada65mr23699275ad.51.1794565885241;
        Fri, 13 Nov 2026 02:31:25 -0800 (PST)
X-Received: by 2002:a17:903:1c1:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2ee0dcada65mr23699105ad.51.1794565884771;
        Fri, 13 Nov 2026 02:31:24 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:24 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v2 2/2] phy: qcom: qmp-combo: Add PM suspend/resume callbacks
Date: Fri, 13 Nov 2026 16:01:11 +0530
Message-Id: <20261113103111.156476-3-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
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
X-Proofpoint-GUID: LuiNeLU4l-h9awpI-4hXRaE8lUpXhu1T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX5VXao0FB7ccg
 cHXKH5M9wBy0hIHZr0KgApthiCxZ6VIF61GsUYRhzj133R73ipYeUkC58uK4nzt7tZhdZsaAKjs
 szOF6uo7D1JbgKqDWAkCnf7qtJefqX4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX2D5sXsfV43Lk
 ar05fNGEEWz97M21f+3wouKeUOKN9cL4cHBSbkK+oDjW4/K4Fhu16KaQlKRsuUc3zw2xPwZ+HfQ
 08tkzp9eReMGQlPnl/LITJ8dUxGTyInZcynFJnJNpfSSVn8J6NfFqyVUC4f/6JTiDwthalkGLsQ
 svyg+j93xl3Ywo6myUJHbqOXSnxZBOFiLXXv18/o4PEQ1nMLWUFnkL0wbdQYdBpETi9ekun/Gbk
 MfmyN+D7Mr3HDF1hKx7WgXBh8xMswLh1boHz1SBHPXpz8YpOYOD3vnuDFg/ieXtbZVU9y2QAtsd
 zaJcRO41eCSuonuhNq/pPY/jtOexQKqQyclol6CFrxUXtKA4ajmqNKHenyWGYjp7i0GCCwK7cqQ
 HcSPKzysZsUwrdZR9vTT7g35xN7w9D2z/5Q51bvtixgdhCSuPI+x07nBSlozS13sx4cvDGNI2hn
 f51UyRXxWS0YrwtydpQ==
X-Proofpoint-ORIG-GUID: LuiNeLU4l-h9awpI-4hXRaE8lUpXhu1T
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6e6fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OhzqtntE-aYjV8cgDogA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

Currently when we perform system suspend, the phy clocks aren't
turned off leading to power leakage. Prevent this by adding PM
suspend/resume callbacks for the qmp-combo-phy which toggles
clocks on/off correspondingly.

While at it, add mutex guard in runtime_suspend/resume in order
to prevent any race between RT operations and phy_init/exit(),
as it can lead to unclocked register access crash, underflowing
the clock enable counts.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..65d280f45db1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4717,6 +4717,8 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
 
+	guard(mutex)(&qmp->phy_mutex);
+
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -4737,6 +4739,8 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->phy_mode);
 
+	guard(mutex)(&qmp->phy_mutex);
+
 	if (!qmp->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -4761,6 +4765,7 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 static const struct dev_pm_ops qmp_combo_pm_ops = {
 	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
 			   qmp_combo_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static int qmp_combo_reset_init(struct qmp_combo *qmp)
@@ -5749,7 +5754,7 @@ static struct platform_driver qmp_combo_driver = {
 	.probe		= qmp_combo_probe,
 	.driver = {
 		.name	= "qcom-qmp-combo-phy",
-		.pm	= &qmp_combo_pm_ops,
+		.pm	= pm_ptr(&qmp_combo_pm_ops),
 		.of_match_table = qmp_combo_of_match_table,
 	},
 };
-- 
2.34.1

