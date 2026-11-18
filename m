Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006227;
	b=QcL6v6gmBIC5p2o9H4wt9jSNFMIXnElHMbWYdjAwyzOcXT8vySD+Mhn5plWn0xtnepRW
	 N93WIM8bSU37oljKpY4/wvotRYvkC30svvwmm3aqRkCZ900eFwD4yxQsDj1Bt2MGPUfiu
	 uaBFOOVbHCd7klb+JItNof09GVLuSwLM1Hn3biS5wpVeCM3YcX4mom5FAfC7tgFTV1IK9
	 zU9AbqUwETbOKiK8sZTjd+cLlCwtzqotkE8f78emUzMDn9cTQ0psmkPOnB/GG8S+HqlVA
	 adP4CaN591NeeZV9Q4FV2qep4b+yTHfKoZoEIQuLEUwcqgqMLlT00r1Bo6hBzQaW0ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uowVlTC/6Qj+VjZuKiyYNrzrQP4OY/b+fyW/mEgJaTs=;
	b=njp0wnQsJeuTEXVaohRK2Z3cTwRASABJ7Q5ZarYE/micCbv8Km/l9eywb3Ov2xYUvt0p
	 kAsN8AzXJEgHKavCqOnx81ZuZULBQRX27FGgHk13IP+OMJIEeqUfThVf0fPlsL3MrMrv/
	 aeOHKDwaJ6J+EroaUDOgq+2nTtqFkbniaQIQTLVoyO94LNKCohP4QBw77tAyBg6eUlaVO
	 N/S5LVXFrRkEF5RywSOrPfaeVRzKvcuQLtqOUiPzi1lsEqTLzHaty4saE63kHSyjZlC3c
	 F9e7Fh8xXY+0EmoJAFoe7xenozrFI36MEutk30jWwfJFbrvFoy7Jdax4BKFL7MgnG8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWny0K4o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i4QQBQGO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D602606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D602606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fWny0K4o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i4QQBQGO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLWrb3420713
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uowVlTC/6Qj+VjZuKiyYNr
	zrQP4OY/b+fyW/mEgJaTs=; b=fWny0K4ohYvsHy4LezFb0aptrYHPp5520FcT8i
	0Udhv/4pBAM6OcK8CmkpZmKvPToF6hCQwGwthKoXjbt8LiEIy29opG1WhvYzyKGu
	Ri/sJY1ZDruwd3CpzA/Ks4P8xbb/IaFU3bhEuQ8MbJ46OJwYwOe4qv975Y4QJ/db
	fUT5fpnguC28gLzles3X6TNi8pL8lTssTTG35J+yCeXv+4xIVe2HPoVLjhpndC6y
	GG5JwRTG0awdQmHSN3POZ8/wyGKVf24ZelMOPvnjAfpBwTLyjy64Q31ET3nbnckk
	6qxVgSzNVK+j/91ENo5xC5ofvaQvX06nSHa/UhGNjYu3aXhg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8u034-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:50:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so806839a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795006225; x=1795611025; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uowVlTC/6Qj+VjZuKiyYNrzrQP4OY/b+fyW/mEgJaTs=;
        b=i4QQBQGOda0XPft7Lx/gTVlQOO6Ev4TSFpaVkaRbSrxZlOeygMHlNBLtirMqhQa/OO
         +CboAGH6ErnnXBj7VkZFrfgPC/cWhtzAvOam/y+4YPY949CCAFbuaHVyXFNDfrlNB413
         hIJNZaaL4/enYaBAFz9V4+uNdRHpXA6oWWte743sIY6Omnv1y0HPL5o2/KqgmdpM/S0I
         Orv2lsYBMKfF5ZF1UJF5PzqeC3BFEBd7dgRPjUvrXdnXf9jfhvnLU4SaIe9Nke+4SEDN
         MnynUBqYH/ek0aJkpAiAUwCIEDCm2iLJ7i6Jrhqca/g39P0f0nXEPdIhdqCV6c+CAXC0
         NTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006225; x=1795611025;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uowVlTC/6Qj+VjZuKiyYNrzrQP4OY/b+fyW/mEgJaTs=;
        b=iWDEWTqrNMFd3azHhshTPFQZ7u2J2fNxi5kIokbq+JYD14SG3JKhGGWkbEz+TQxDSW
         D9ldMUrnqDoo2iQ6l9JCQ/MCXJsQWXlJ0sVlcG5ZFrvaOBOxEBxhmP0qK7QnQLFMMIlF
         r69oxkPXr/vt/a23czKUP6I202jVwhVR5JfdzAZRWZI8NesGvAO4m/2Tjv/PtoaULGTp
         zlOnz9m/VKOlxMNoGFV9bkDco4rOCADgppfjid1/k9n5HnnXjJg/e0y9xETMV2zkw7Wc
         uXu1tOheFBaoKcNluo7xItVka1uF/q/BrVV5ZNu9easZ9h6GqbicUY7ZrYUulo7HSUzu
         F0/A==
X-Gm-Message-State: APuU4Z+a0ZH46Aulmv8+oNkJ1lSqPENOD+ctBijUiTohI+zXIu2Az52I
	Gi3+C0JEvJvkU/43lLLwczAdE+RFvgku7gYwub/rHYlIbd9Ns9h744+SxBRwXrOQxu3A78IqaVK
	l/lDsBTZ3t28BN5cmofCLeEF1bS4TeG581SDu3CEN3dztzt/3DWJEco7WSs6KVfviMthn
X-Gm-Gg: AZFdTZeVehArO+/UjQYwh4mSSDiXnMR/dUeKpQACFWQnLGpEAP7Oua1h42CikcwCO1U
	VIdco10urmTMBb8pt2ziiu4a8yyJpzVjfh+kDpV19LTKtwk2b3BMNvzoRTiYFWtpo3zbZE7RqIk
	TfimOhyPFUT9GD6KAv/aar5csYqpuA2oBrjZPLlEqTov2YeEbT4mMmpjJA+ugBUQfloJ/OAOvHn
	coLXvQLFPNMJjZtkLCLjyxxBEGkmpOoUbnh72QbgQsqmyigm18bdZkzUM8gEzTod56+g7bxmIre
	jwkKC5Ydrcoq7sZYFttwFth1tUPeVmSQCImKTGUyIyIpwhkvaYJ6v1Ns8QKHNk6mdrS/s0RxJ11
	PA8NsUmKAL+vpKKnZsSa70v6IAYP7CCPJR3ZvJLV54megasg9cRrhD6LRrRBhUzureot6UQ/m0e
	c3s5Q=
X-Received: by 2002:a17:90b:254e:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b3d07e37e7mr2317187a91.60.1795006224809;
        Wed, 18 Nov 2026 04:50:24 -0800 (PST)
X-Received: by 2002:a17:90b:254e:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b3d07e37e7mr2317169a91.60.1795006224261;
        Wed, 18 Nov 2026 04:50:24 -0800 (PST)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56e38d2sm1599722a91.3.2026.11.18.04.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:50:23 -0800 (PST)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:19:58 +0530
Subject: [PATCH] soc: qcom: smd-rpm: Avoid out-of-bounds write on empty
 error message
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
Message-Id: <20261118-smd_rpm_oob_fix-v1-1-e233c4262caf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPae/WoC/x2MQQqAIBAAvxJ7TmglRPtKhFRutQc1FCIQ/550n
 IGZApkSU4apK5Do4cwxNMC+g/1aw0mCXWOQg1SIqEX2zqbb2xg3e/ArUI4OjTGKtIJW3Yma/o/
 zUusHQUsp8WEAAAA=
X-Change-ID: 20261118-smd_rpm_oob_fix-124d19996e86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795006221; l=1373;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=HCDF37nliTCLV62+upBObTBFCCJJfK6fv3iG9CtS9TM=;
 b=KioMLcp+RZdNibMZ4kNoPaLJJui2Ccf0AGa4+cxYkqe6L2Bu5acRFnciTNS7n965r4x032ggl
 zyZR1obgMzkCYp+dhHizbKWcSARjWnH5V3HbYIMbZx/A17vpRu5MrFx
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: yHaBIvAyhnTkxTf42usLjEw-hwAPlAIG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MCBTYWx0ZWRfX9JcGqhQydF/2
 I9qNI6KuGLTrFZpGbfIwAZ74V4G1oSX3DwUfgxJTigDta5TH90sZCyZteJPHcmCBWZ55vO4zVzA
 pj5s71mlMGqQN4GeBsAFDksOWDEQMrY=
X-Proofpoint-GUID: yHaBIvAyhnTkxTf42usLjEw-hwAPlAIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MCBTYWx0ZWRfXxQCs6uWIsx8F
 m+LVRAJ6bb2X0WCuWgNitpV2c4IqGVjpy0+w4bIcT2Lr31sYsZxnQ8Nht+biOswCjMImjELzBdR
 0pfJckcShda1tUzz6jd+4hm6Q8/LLrdMhMK+EE98vIyz3KDB9z61xD/2qNBU7UnKe+6jimrUsqq
 1FyVW8HgYDdGqQAP37SNUtCWECbb1njYcziwOM/vGYpUDWrd6TttrQGH3G0K7rkD/Z8rUdoIYgX
 SjMs5j5NiiYi0YbE88UnH7mXcjdqj7hu5VXxEcceE+WXXEKMHRKJCZWS6p30sA5IlsJunPXWMWp
 XFF41bsLXUTXj6/DF2RXO0wHXD6NyNBnXAmjx1oR+Y37JGZT2rK/jn41eLgNS9sF2NSp4SiHxfG
 MQkBg0Wkc8JcVviFskJfmcFDdny3N3MyJWzK/Crj7GKni0WrtqSckmXtctWekQaFK70fgzuaOnE
 G653rVMx/S8Lw2sLq2w==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd9f11 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XUPhsTseKnZrlk_cZTwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180050

For an error response the RPM driver copies the error string from IO
memory into a fixed size stack buffer and NUL terminates it at
msgbuf[len - 1].

The copy length is derived from the message length advertised by the
RPM firmware, so a message that carries no payload leaves len at zero
and the NUL termination writes one byte before the buffer.

Treat such a message as an error without inspecting its payload.

Fixes: 936f14cf4e67 ("soc: qcom: Driver for the Qualcomm RPM over SMD")
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/soc/qcom/smd-rpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 7037d9845d98a2859c9c368e9737e73622b08277..1ab615080ed4b4a00212faaedfc27a8e54bad018 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -174,6 +174,11 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 			break;
 		case RPM_MSG_TYPE_ERR:
 			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
+			if (!len) {
+				status = -EINVAL;
+				break;
+			}
+
 			memcpy_fromio(msgbuf, msg->message, len);
 			msgbuf[len - 1] = 0;
 

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-smd_rpm_oob_fix-124d19996e86

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>

