Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D17040BCCE
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570938; cv=none; b=LE5BwHENjSUP1y+DJbIQs0UrHTU+b082NgxQKN9iLEr9PEHw3zs1/HWM28v9R8nHJDsmItHuPD1nZJ/Ag8c4U5M0/Do4QIyBPWIGbzEze9wuOEfGnwDF728tRFWeaoXtCdC+9Yob09NeWC+M3J+Q6NbDLemUAeQhZOWsj/DHy3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570938; c=relaxed/simple;
	bh=IfIz+h7lQZygsMdbtFUdSpKAhh+9x4RQKe/zH5OKDOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASzbo03UBXiqLyNt/L2hA4dO8qtrfBBhooatA8m2f/PtdkPZyi2rs+GU6M5P/RQwzIeGHHuSRDabkXcNYyIIib200XuTIN/pG6SJVp/RSx+P3jFg2bM+pF6Ar+aP+3co7CcrS083JWoJYPuhEICPT2tLHQH00T/ZXUww6Dw1+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCW5fEbG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvzaUMlg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCW5fEbG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvzaUMlg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYwH2372307
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHNvx8/yUX7DH2/W13exwyYo7xL3jhjIg5S8O7VsuNE=; b=OCW5fEbGmsu+L/sP
	MLAkFdgWm4+qipjmp28jZfMrN6N3FmHAU4cgdL2mIm9875YIRkRcmwDgdp7xrCg8
	COAntFPPV93h2hoqw9x2U2aXwCa8sarkw2HShjtVcFJ/GMaEmbwRL9Ew2ny/yct3
	pFsKwfmYmRnRQ6jt4rAZgRvivCLeGj9pe+B0lR3AOLoPZPImE1rUtUvG0AIIVzqk
	HX7HNmWMB0wujF0qXPxc0922ayPgutW1p2K10nRX/12+id622KQzbq5/9TiyPDr1
	0rSQA5wwrtU70CzWhTPIYd0kOvvuy31lPEwPCJv2MBI1gb7R+xuNGDJ1aYGMIOfj
	ZQtR4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdshbm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:28:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4126047a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787570935; x=1788175735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHNvx8/yUX7DH2/W13exwyYo7xL3jhjIg5S8O7VsuNE=;
        b=KvzaUMlghDpM/QNtsax1nSnMX3zfC69UyiB7vGAadMcu8VunSzFDN8BB8DZo5RMCZI
         463WJ6NDV1Rhh6f5tKRcUE3O++aAVWGYrTEyRYhItUhol8KcU2dNnOvw5oj3p2fxy7ty
         BKsOh2o2r5eRaz3uOYZyO+/COmKMPbc6elsgNEhjQVRR+27enjgUXVlQD9fndLKARaD3
         BTcdgX0Z/M6lVh4ypuPnkpfNMxoUUFJ1EGm2tXRoGTOe315gGx5rIfMW8jYbf3u8lkTc
         prFP/JlS1RY2HKAHu7GpAxc8T8BSHnA12wLF81v7RaMx5yWguvZtIXIPVWFcIKkrKZ7W
         ld9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787570935; x=1788175735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHNvx8/yUX7DH2/W13exwyYo7xL3jhjIg5S8O7VsuNE=;
        b=SavKXfZUC2Wk/A2qiN0ODwj+FQQeGb2+picqSAw7T+AhnwujPjBiBUY7ugwv7+Z3oy
         7xiiPHfk0iAykqzLFcbGYaGjpao+5FeaPx1ol9BilQIiuJLiJclSpH3SoiwrKd0mEFTF
         4GI3qOPmxQIvyRdO/92Qc3ZWbLOgZYlrlSWZSY0FlBY4wmkp14httX8E0K3l826LqzOd
         SjqpMVFyUBqYV0Bt45idwMGk+lKn1ZyvMP1Y3xmw2xP+w1zzWCZX896JC9WTi969ODxV
         +M1XrEwgmpxXt3Pky1782DEJqKSg+cbw66Nl7ldz6kIHRxb81DRVXg7n0/lDoDXjZcqm
         eWCw==
X-Gm-Message-State: AFuF++mJBemxFCPB0MrdQkiHxEhFCKmlvtCf7Xpwje5Hb6zZjc3q9gub
	VKj5xtKeqNVaC4IYkC7tpLJfzeEiLs0Skgv/SC1xnfNLWl16SBs4lk45rfIVXENp7ZI4XznZ6DC
	18gtzvdXPDhIWF7R5pi8a9+DzBT9HDJI07Vv41j9t0nuvDbks9zp2wMqBK14DhYReVfd5
X-Gm-Gg: AR+sD119I+BA1ZPosJ/Sxo99whKFCH3a/uw8DvDSVDlzqIJB/MVSFvd/5rVB7k7z6/S
	KiqYVJF6Acje/r67u+mCBLMXSaL7V5N+Gc/a8Cid0mnNpB5/FTEpExOnNx9jJzQ//HFzuw0ZEP9
	FmA4qHOC7W32Si73hrT73YukDsEo7Kqp3MRgwI9iLim+lGAGwACvU3knX/zO7Sy/OUnRBnYCLlj
	lOwGhmhCIgHo8Dq/qStGNuf9Vaq375DrFZOmOYOi8IZI/Hx2ch2i9LLl9SLWx388rJ4n4+B19Oz
	vAzYtCd9jsTHdFenOM8Rlm6kyZ4P15+MGJUjNAnIrGRWi3egsj1jrPhMVlv6Ev2jk8X1ErQuSF0
	mSRHEpJ8MYfN7QmYf
X-Received: by 2002:a17:90b:3883:b0:380:540:d499 with SMTP id 98e67ed59e1d1-395def03e79mr30789691a91.6.1787570935018;
        Mon, 24 Aug 2026 04:28:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3883:b0:380:540:d499 with SMTP id 98e67ed59e1d1-395def03e79mr30789587a91.6.1787570934583;
        Mon, 24 Aug 2026 04:28:54 -0700 (PDT)
Received: from [10.213.109.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af750esm9825643a91.11.2026.08.24.04.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:28:54 -0700 (PDT)
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:58:07 +0530
Subject: [PATCH 4/4] drm/msm/dp: continue link training downgrade when
 cable is still plugged
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-dp-typec-reconnect-fixes-v1-4-2825e5bf8a96@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787570901; l=2888;
 i=saurabh.anand@oss.qualcomm.com; s=20260824; h=from:subject:message-id;
 bh=IfIz+h7lQZygsMdbtFUdSpKAhh+9x4RQKe/zH5OKDOc=;
 b=70s+9NlE/x16oDLy3h3yl/e0qgXl8cliK6Ap3cvHqBav7G3wt3ikUBcZo/oLqVYiI0KPj32BW
 gb5Bfb6yrglCOkGTi5sK9oNebP+RwX+OI0MuE9RzHEYSyImEo1FBfaW
X-Developer-Key: i=saurabh.anand@oss.qualcomm.com; a=ed25519;
 pk=AzGwbGUPO11yi5XTeGyJKOJWLfzXp5Dru4z+PCg/uXs=
X-Proofpoint-GUID: ZTFMyYiEh0xJLcM58hCkU3Hn7E2IgsiJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX73t6YapRNNCl
 eJcY5kGb5j2HAk8J/fKkYoOZ+1L4EImojHzYgcHWsY7bMEq60SZ3h0IDTWhQIs4H7AkQWDbGYfh
 xa6vab4ojvlFcUuOWdeGc25z7XdRi/eGCM9WR+ZE12bVsgLtW2ajpVseyt/wZ/LfVmZpV2gXhu+
 kV/rutquhOPRgR0iQSMHqS2UvDkSDeGfLYKg4h8tuvnmLYrBza1cuwJPKU2UDYVjf6mkooEkj7/
 SVC1kRW5Ht0YkHJU9eUoE2dSccjmeb+8IotVodxfwSlyS65vD5IaYQUOzMgkwt0Xl9yCFnQu4jT
 JkbgaAyTSrf/w6bePqyj/sW6Zj7K/kYwGMiJKEfAqBeEKAgYX9pOCAcOTHzNtSiVv5B2DDCELLK
 0T3PrGpcGBOjMMqiYPooHXzJwsmQhK9Bv/YkendnjCtIrqbrF3LJxjLv2/RM1DQYeawytmtlSvF
 QsaOQr/hwHo1mOnKxsw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c2af7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mNJOpbDVpywo_FzgO_AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ZTFMyYiEh0xJLcM58hCkU3Hn7E2IgsiJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NiBTYWx0ZWRfX6rVVJFpssoLz
 o4/qrnTnWzfnAcl9jDS7OShwR0ej5/CRTSqwPv3tEuSeyB6nU+hnYqll9PNXfFZ4e1jBJ5W5Gg9
 h8HpSDdMFYSBdGhKMtQgH7XyodP9c6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240096

During a Type-C reconnect the AUX channel may report link-disconnected
transiently while the physical cable is still present. The link training
retry loop in msm_dp_ctrl_on_link() was aborting immediately on any
msm_dp_aux_is_link_connected() failure, preventing the rate/lane downgrade
path from running.

When the display is known to be plugged (msm_dp_ctrl->plugged), an AUX
link-disconnected status is likely a transient glitch rather than a true
unplug. Allow the downgrade loop to continue in that case by requiring both
conditions before breaking out of the retry loop: AUX reports disconnected
and the display is not plugged.

The plugged state is snapshotted from dp_display into msm_dp_ctrl just
before msm_dp_ctrl_on_link() is called, so the retry loop has an accurate
view of cable presence at the time link training started.

Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h    | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 59070f399e2d..e8fd8f4c75fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2379,7 +2379,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			break;
 		} else if (training_step == DP_TRAINING_1) {
 			/* link train_1 failed */
-			if (!msm_dp_aux_is_link_connected(ctrl->aux))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)
 				break;
 
 			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
@@ -2404,7 +2404,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			}
 		} else if (training_step == DP_TRAINING_2) {
 			/* link train_2 failed */
-			if (!msm_dp_aux_is_link_connected(ctrl->aux))
+			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)
 				break;
 
 			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 5902cf7e746a..95533b0b6297 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -12,6 +12,7 @@
 
 struct msm_dp_ctrl {
 	bool wide_bus_en;
+	bool plugged;
 };
 
 struct phy;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1f60c78a463d..93a37a44273f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -644,6 +644,7 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
 	if (!msm_dp_display->power_on) {
 		msm_dp_display_host_phy_init(dp);
 		force_link_train = true;
+		dp->ctrl->plugged = dp->plugged;
 	}
 
 	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);

-- 
2.34.1

