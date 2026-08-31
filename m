Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495933D1CBE
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179958; cv=none; b=o0BzqkCrYGQ0Yf76rHgZiIFRx7wgWLSoeFIJYC/YxOChq9Mwp/IkJ93FVX44R0F3WCvFkomLJ3PTH5DxxnproLRellajSAh6VRdPur+36DKbjHEttUepQwu3kvIKs6qNGieNUzmxmCDgbBpxkd1kGdO+SlhnM1u1l2Npzfpp7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179958; c=relaxed/simple;
	bh=NwgRQitYxrhnQpUUOtOHrKKNzdWFVkOpzSMFIZlO2u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dLEovO4Cx8c7/9cpgOJh2SedXS2AQmQ/6Iwx+dei4kHfWyLlMO+/fIhqCkWKPMDmNfkf16s/qSgXJRpLoypPD+95bBv+Q/HB+DYogi25TGdhvOrKJFluzSBsJvNF/xOLds972oLgrj8GiDBKTwvQSNGINZ10C58tDtgmXFrl/u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekIld0n2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcPTLVYn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekIld0n2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcPTLVYn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAN6Z3862588
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ou0koCU45pRBYDrdVxG2cm
	+U8B8KWV81gtdE9QdUWmQ=; b=ekIld0n2cxmbfzbVViihp9njhbuwa9zzBnTnIT
	iNU0bFayqlcXe4gO3YbtE360EQs7BuDLhnQVFdMbxHqZ6lFmGXpeS2widNKdvDUO
	NpReO0CBUGzVibf8iZ/kUY6ytC9nZPx4ojxBnbpxjAVC6m3HZnyjsTlnXk5WT9kR
	NE56j5EN6od+f2NLi70JO2pJHc+eIv/3LfWYGIzUhi7zGp4EHsCvbDzw+4RFQTDE
	QU9/qDUtko+fPImGqp8Xy9XTX0OvabkctDmTjv3Dp2uvPZb27el8asjN3XRIQj49
	O+6j5gBDpRH3mwegZIsxstAL4uF8J8GEjYnr64dfka+LZefQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pm9e24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 12:39:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4699959a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 05:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788179955; x=1788784755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ou0koCU45pRBYDrdVxG2cm+U8B8KWV81gtdE9QdUWmQ=;
        b=FcPTLVYn9o4Vno7OBFf3/0mIpNsIeIiCVR2oOwd+XSBc+4p6pzwDE+METE/Npi36oL
         waH1LmNiIABAH1eu8rVnDVRq2Vhv0xCDhIabtvb2zj2hEvyQdfeeT4G28BepFoaJNX1a
         gs94YEAsqJln1gS3tygObu6XDf0p4HbZXV0r7OJOketbjqU0XW9wPOKWEmQfCm/RF5Ol
         Yj5ZcZJhJkM/wgmKYf1ws4vu8I8nYDycLBf6nrYL6mRhayNkonwyAOSZFA9wef7wYn1T
         UX3zJOriyl6+u1Z5ece30rPAmX960FHxPv6B1aATdR8eHv5xu94GhjBDU4AHZ3P42C9W
         LNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179955; x=1788784755;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ou0koCU45pRBYDrdVxG2cm+U8B8KWV81gtdE9QdUWmQ=;
        b=iSxXO20L3E5/XE9lE2zvouEzfUACKLJLashyeO18oSa6yQLMCb7EeAOoOEL4mgtl86
         GrO44MJ/JgBqtJyjTrQsUDSKM1LqWI5uuMtEyrIi1CD6SeSLJozx+wmtEI+SvPwKGV6t
         0sBzMBYtWRqFjNz1BEZI6NDxCj5A1yDt0v6yKUXHvxoI/yBmuDpgoIFG/3mTJ/OJUS0n
         jCxdQGaqWPXoLHfygKXR9k/gDU+WE3iI4ZZCpKhIXDcdlrw9x1sLLHiYaBGMqttRdEcp
         JfGBEBTqQ07iOrWXFpcRJ5XPExDYkerzu7wlGTcB321ZLVn8Nnzax86DYDltvncjx+tN
         Ytgw==
X-Gm-Message-State: AFuF++kJ9FMu7l4Yv9m4MrHARXbNwxyR3Rb+MpaASzcPinHOeyAtjHBq
	MlX8kxyFllOF7ubE3gmYfpEs/mMbRhDY5cQ+Weai0qhzgQxmrOXEnrL/yiBv+ubZ8B3HiE7NA9I
	EnHviQsQYe7MyFZYaUkLKEOEyhCJc8z2GxInSNYQ8q0JPYNAh6caMTdeEVmqXIxWgi0UR
X-Gm-Gg: AYBFou2Xq8o5OYVnertxaHdny67P59MhbZ42De56XhyxWTvXuee2fuKTQBm6WzPeQO7
	spQg7dZz77nkSoD5YPnapLuUxfR3LQskJyRLG4S+pSr+IvqBQZ+71DRVZRtbT66fzr6fyJ+Aa7c
	atiJPCryWWrKaZQPOWTPq+9xCzsDH9KR97g3XEBZdcWKiZd5W5lOGPZ/DRJs9x14G/fKpE4mm/y
	KCDhJLJGkxx/MrSboUm0hOFZpKhbSBbyzBEDBq/t8Zg0zlO/FNrmiIZkFIG00YxRBx13w1Q65Ir
	qftcxnAFfe7GYmhrTWNsYMr6A+n7iq9qEyPekfPnq1UypBJu4F62R9YbHpYGfCiMpiYJkDcfwVk
	Rp/I6A98VXh6DjTf9A0snP35yp8yl3R67IAzr1A==
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr37995252a91.7.1788179954948;
        Mon, 31 Aug 2026 05:39:14 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cd:b0:395:f0e8:9e13 with SMTP id 98e67ed59e1d1-396d0e71ad7mr37995174a91.7.1788179954472;
        Mon, 31 Aug 2026 05:39:14 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm32874488eec.0.2026.08.31.05.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:39:13 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:09:08 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_adsp: Fix double jiffies conversion
 in adsp_start()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-adsp_start_jiffies_fix_upstream-v1-1-9f8cf85ea220@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOt1lWoC/yWNUQrCMBAFr1L220ASayxeRSQk6Ua3YA27qQild
 2/Uz2F481YQZEKBS7cC45uEXnMDc+ggPcJ8R0VjY7DaOj0cjYq9CqMULzVw9RPl3OY+08cvRSp
 jeCp3zidr4uCSRmihwtj87+R6+7MsccJUv2XYth2yZqwIhgAAAA==
X-Change-ID: 20260831-b4-adsp_start_jiffies_fix_upstream-67f521b86c0e
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788179950; l=1791;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=NwgRQitYxrhnQpUUOtOHrKKNzdWFVkOpzSMFIZlO2u4=;
 b=6k6r4w4ZIj95ko+5neTzegLzhV+hhCT7i2XtX57iEpNCwHxRebogqFlHqAvsoxuPJuLz8q0Ts
 J8yzP/LAAgeDyzfL+SeLXOtfgA2zJYf96M6JOFLrRGoZbAeD1lkrvRE
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: GvDdWt73pOdhXRMSdPZUv7aY9Q2rgjy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEwOSBTYWx0ZWRfX8De7S7Rl6tHP
 YSLijkJhPpwXOZOwNZioH9JbvCRkVDlEQYOcba6jXq3kAWYd02Qf6tcl2HGKmGyfhAF0a/TDZga
 PzOrkGqn4QYaneapWWlFLcKYB5xNvoXL0euxcQ/AIoQc4uu1RONe6SXL3v58bAo6eQHTtfwYH4z
 P6NPTC/hASpP8ipJX48rWinmpJN8UtLMCZrdp7av8uIjEk535lpWUNZXdTzON+P/QJd8uNZX78Q
 DTjFoI5/V9xJ8cfQQkpXwAcAIRC4uvp7GZl2maSb/eXtYOM70fxjAqk71T8707dcVgBoKcDJLQp
 mAhJMcSwm9IQj/KntUJZcfcJbkypOACSiwwUSuUK04uAOMUWt29Y3jX1mrLS6F8Jq62R8G8lSh5
 63y6ERfqq6zZsNCdDHwzjtQnkNvj8t9aefvGzvPHgMJE4GrBZ7AF8QRWrqd0OPLpFZhYkEMHJLS
 RD3ZRQ/rEi7SpKVqIyQ==
X-Proofpoint-GUID: GvDdWt73pOdhXRMSdPZUv7aY9Q2rgjy0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEwOSBTYWx0ZWRfX75kOOn1XlO9n
 7Ise80HbDTZ/tZ27swQH9z8tIW3DIpZLo7yP00/zbkEwtsbKy+TKfmP9JYpWo/L72ha9zTsgcl4
 7/HUUYpqEvUCpq5KAkr/Ablts4bJaUw=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a9575f4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wVrMzwl8GnI5IqvAeZQA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310109

adsp_start() computes 5 * HZ, an already-converted jiffies count, and
passes it into msecs_to_jiffies(), which expects milliseconds --
reinterpreting the value and shrinking the intended timeout. Every
other caller (q6v5_start() in qcom_q6v5_mss.c, qcom_pas_start() in
qcom_q6v5_pas.c) passes msecs_to_jiffies(5000) directly, matching
qcom_q6v5_wait_for_start()'s kerneldoc, which documents @timeout as
already being in jiffies.

On CONFIG_HZ=250 this shrinks the intended 5 second timeout to
~1.25 seconds, causing a DSP that legitimately takes 2-3 seconds to
signal ready to be spuriously torn down as a boot failure.

Fix by passing msecs_to_jiffies(5000) directly, matching every other
caller.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 39654206781d..e0acddaac991 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -430,7 +430,7 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_adsp_clks;
 	}
 
-	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5 * HZ));
+	ret = qcom_q6v5_wait_for_start(&adsp->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(adsp->dev, "start timed out\n");
 		goto disable_adsp_clks;

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-b4-adsp_start_jiffies_fix_upstream-67f521b86c0e

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

