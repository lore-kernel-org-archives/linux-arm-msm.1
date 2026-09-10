Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C8B3B813F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030400; cv=none; b=QyG2Ntb+DRtGKjqF4YVzcETm1SlgENyYCp67HuylhVwrPEKXlq8fa7BHKvJWl8notBiq4HgGQtpuz2T4kjaxyP6x1iOCqZwIEkpBSlAvdyUXf4W2LequTeMOQw5R9XNv46mItE5M3dieRm/3h6DJGUsgaZMgk9Ko6jwTwlBsNH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030400; c=relaxed/simple;
	bh=iBSctvwP08AQoCAKNFl5edlJZmKJS+C7i+kWmTBeRLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuWmWthHCgv78YlcoReYhDAsJRI1TAMl43C6yzAjpcPPEZyHAQ8pC1Wy8IVXUWawbp6LDlTV7QiMH/nSUdsq+vXYum9aqCCgJacsQUdK4LVA66W6z6E5upXBBkkX0272ZLqjKkqjy4BTe/nQnpHWlFb1qZu6NaXAAWTxZKyIi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIgY5VtV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGh48GvT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIgY5VtV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGh48GvT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pkx8474844
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=; b=AIgY5VtVECSPiSl3
	RV+kf+6fEJxyqnT4Up/aymQTS5L/epgRAvSQCQ62UySSjEFsNyF8Yn7WJO7Cv9Y7
	Kb4Ah1YvGJWV3qRb1jFGmoUPaar3aPU+xoAi3C2VTOJkgR71CnfGiC40P2vd03/l
	skuuKAC2EhOoLQGQ9WE7MpWJR8070Os5eHvR6idPNKiWbqTY1TzxFQswxkJIs2wv
	irPVoXu4AVS5XNOIYHrSqvm9riCXkbEQEfDupkIba+SYvDvWamvaBbA2INWia6rh
	ZL22fC+zFkCuudQ5LUAqXjKLCutTthn0Qtupr3RGVUzRcVUGtNtWfyvoO+kX53ea
	S8GzYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygty8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:53:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc18ced1a5aso11272149a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030392; x=1789635192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=;
        b=UGh48GvTDLdC7GrfwzPia6tvrvEzvXjqMOyblQmEPe6idA/iMwE31z63EU4JRaHa76
         2qZsoLgnBuLX1b4OWNvgZg+cMighauca6PdvXDpjFFdv7hQV4BLBUWNlIJ7OpzuMePZe
         hRLUDPSygmXhiUKZo1OMHFiLpKfsYDmh2zffgm1IITPq9pwnHjye/koc3kYrze+t1t0H
         /yPn+4Od79RxX211OlWBbwXDo1XaXizuXazV1pRwrTr6m0CYNZt3+3foXGaFLpwrMrZj
         S71dbf1s/myAaiGieXb4n2/xMAE5v+ZjM0mYlfNe5rbnG4LbFt0n00RO3Y/WiplurH1k
         7p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030392; x=1789635192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wccmpJpOsyajKFC9/v8Dobta4SN8o+sXF/mYs0ljCWw=;
        b=EGGHO4+N0tKYKSTYsuolTsDAlTNxAeL40OSVrjLEjTv4zSRiexL33gFR8CrqfBOdoF
         WVfGDVrWd4+x212ob5PfZg1B3DAjOAN2VgqfdS5Nch0W2zn9rh87fvVT8zm/QysqoH88
         yIwP0FWB5QQWQUHxln2PdXuIWO8LetRIn1RMjafCJ+SsAxbVOm5GQ9RIDHrw9fW+YKY3
         /TVaL6lQyRYtamoHnTw8AHuyrhdOM3SoU/O/0yUyFeRJT3dHFutvTsAQQFP7fOG04j1w
         Xr9fKLs6DcREJvgCRv5NqDv9d8FVME59K+lRvs/kuTCvDZgxTyTTbrWKDKlfmlRG+tHt
         occA==
X-Gm-Message-State: AFuF++lw9Z/cMNby/No+GlhdjUvTuOpos//DS2oteMnLf1L79h4r/6JT
	QV1/kEaTjIevKkXDHihICxBhaJk1qsDaZscCc1xnfXh5Yp/XoPAlTiG7bOxXeV1hslkaUU4R59/
	JIXnyNvxLQqIWWMvSEfx8TsQmeIj+kCca+17e+VEMRaadUElyMDCcLHfv5xkG+/wPbR6q
X-Gm-Gg: AYBFou1NFgdL0NQ0KmuALJXjrger1Rd0VAz0Kaocr2M5/kEqIVuMb9HPqPmJPjHct+h
	aO+V6iWIunbUKK05Y/EP+kpQ8sPE4H6V/U8xu9+DC2w+pJ4WidZwOoSoTGJuyc8z1JcQRJeLVor
	cCQkLzYrm8taRDVDCF+S4b5F6ldujh7dUz+XozxC1q4d6DIj+70gHMyiLwq1Pg3jTMyColVhQAO
	JtW3Eheh2hKm8TXz2Z1Hvi954rdJLpkukNYYr2boq/xs5HjRIsQ3RrMPn1kNQ5OgarB3ZEcx4s4
	nShtZJJ5CwJyOEaekhM5DBsJ14KCVqHMTjfnCMUlbj789nr+qLQmHlDAhamcTNSn5+ikAwwWKBe
	J8c6fIo+/J8U4rdsNpO04hsLoUXk6
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr60174293a91.15.1789030392325;
        Thu, 10 Sep 2026 01:53:12 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr60174265a91.15.1789030391867;
        Thu, 10 Sep 2026 01:53:11 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1c16sm12398722eec.13.2026.09.10.01.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:53:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:23:01 +0530
Subject: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789030385; l=1627;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=iBSctvwP08AQoCAKNFl5edlJZmKJS+C7i+kWmTBeRLA=;
 b=kv14yc+twZQcTmBPRdP9oFeOLap/Cmga0U4ZLkLP9hQEJeO1vAS26McKgDxfNjmzhgtxGF3Ln
 7kR3VdQxx6TDaIQP3IuH3op4V7hZ6GI/Idp/GwukLN/sdF9n1X8z2Wr
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX2KD56Siyn3JL
 9pTFZOoTtop/X8MXQ8hU1+RX8huvPThg5vdnnOjqbdB47905h7JaRkMe/S45YNr6nyflK5PZlxb
 UVtwMquMrtAj6uUZ9vcz0BXv5bd7qeVZ952X9dkQzHthYyqjdPrca/qX15Ks2ddKZ9twQUhzfWI
 RBz9Hy8d58zOjY5/sigd4uXhxQqnz2Cv/CmUbQk6DfqWpBbe/1bspNnUcAkMBejCKNJWlYb1iTQ
 8QethLt/iprMPSgyKwwoGChb2HIa+YAdw2d0htuB/+J5Yo8DV/pwQ56Fprlv24KsfAobPMUmdxZ
 C4ZG4AA9h/xp02yMumkOk/06wG0GquSr1F3dEziwtjrhTYzbhuUbhwmZ+RqbnNGqozJ18UvsV+0
 SQ7H+Nbl5F6fDHmXPWReCjOMTqa0lUSi2+scQ3HC5nFDmp/N6+uaJfnfTl7HojQORBWIXZl+a/l
 ETridHBo1Pw5fjKmq4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfXzKCccsKCryhR
 PAWzpmTdZnYFlg7FLpCnFlgILypy3I/R+wF5+TBPkjwkwPPkfMgWd/w+bnQGT+xPPg7ccpJ2SLP
 VHzEO43F0tZ1c7St/dr/R8Fk2CWf7Uo=
X-Proofpoint-ORIG-GUID: SKftPUOJvaw48_Fn8x9muKqhODLB24GD
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa26ff9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nkXt-CTaWekHWkLlceYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: SKftPUOJvaw48_Fn8x9muKqhODLB24GD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100099

Newer SoC like hawi with RSC version v4.5 support 4 byte message read
request instead of default 8 byte on older SoCs. The write request
continues to be 8 bytes.

Update the read request message accordingly on RSC v4.5 and higher.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index c4542318eac4..f84a399fa5dc 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -86,6 +86,7 @@ enum {
 #define TCS_AMC_MODE_TRIGGER		BIT(24)
 
 /* TCS CMD register bit mask */
+#define CMD_MSGID_LEN_READ_v4_5		4
 #define CMD_MSGID_LEN			8
 #define CMD_MSGID_RESP_REQ		BIT(8)
 #define CMD_MSGID_WRITE			BIT(16)
@@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
 			       const struct tcs_request *msg)
 {
 	u32 msgid;
-	u32 cmd_msgid = CMD_MSGID_LEN;
+	u32 cmd_msgid = 0;
 	u32 cmd_enable = 0;
 	struct tcs_cmd *cmd;
 	int i, j;
 
 	/* Convert all commands to RR when the request has wait_for_compl set */
 	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
-	if (!msg->is_read)
-		cmd_msgid |= CMD_MSGID_WRITE;
+	if (!msg->is_read) {
+		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
+	} else {
+		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
+			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
+		else
+			cmd_msgid = CMD_MSGID_LEN;
+	}
 
 	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
 		cmd = &msg->cmds[i];

-- 
2.43.0

