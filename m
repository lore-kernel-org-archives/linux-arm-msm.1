Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145289;
	b=NlntXvlkvEKB8VBOwl/d7OV34rRC5BUI+FDseH0/2/dt7duE554DC6AhxmIw7wF+yLYo
	 3kyK3Zwm2rP3VzSK7z613GFSjJetkyyznB0bDdf3cm8kQFq0GyQRbiZFNNs7haCJ0+/2V
	 VuDj1BfoBQXfyr+xuB1XlxJNmEqdlL78/M1yEY0PaOl1l2TMOFZWs3sjB2AJk8e1e4wrn
	 foRZrabmR/Fxu8AfBSfDrvYBr91VaIo8QWqgApgqR8DNLQdaXlTDZwZbdwdc9342fdDDH
	 +9TwehsU6I7YBdfUqbn3TE2V+gY+JCwikvRWw1fUJ3YUAvIOqXGj/sTibrLA+rwfnRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
	b=FvNGln7yyKkgLPO8HnvF4WiInh4odoMskX6F7vI98+dUWXA2v2du3kv3+uG5aHXqVtQ8
	 q+Anl9+tGIRILNGIpwWMUB6nJPFGlqyxKEhX/k0KVuuyOVlocTLTo0XInzHx/MIkzFzVC
	 /3Lctj4Nj79x5dmNLtUWLc8Tyl/8FCE6bziXC+w8qdmNnO8puuNTC9vShiv4nHllYHaF3
	 fE+BX/DKvhcJVXIU8XCU4gSmzzvan33nS9zmuksn6pm9hVl416sm4irUmhWctiaOa0SJI
	 jMoL/aWPxRrdE4N6vxakFXgJFGBRqZVho7NQO/POyobXIFHzXk/WMRYs9t1c+ac1U9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jC+nmD4I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E31606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E31606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTgvRwpe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jC+nmD4I
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GJJK2608028
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=; b=cTgvRwpeF3+QIV7d
	Pu5QhM11BUSuihKko6tICmFRo/wZZ2eezWsxzoXxCW/WNwQfrlee+JNhfs5QeH5C
	CpDC/jCzH2kUmggOWzJ0vTC+sruCHog0+7miye77mxJ2oISvwc/ohuApQe7E2Vg3
	/EqPqHkuHRVL/ctluzilUi3rJwIfKOrynxxkVTPxdltXbRUe3DCUezTPKEF9r7ek
	6wUT39I2v86+FB5azyBPGNRXX/IQ8XAbe7PZQWrfgxHP3cGkWvKTBkHbG2MavEZo
	zfJBtzuz5o5CGkZjVPY4K7O30YOgP8+fLLnGTCaQS2K30pziAe+YdbMUiUM7YBWz
	xE520A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j22ugu94m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:28:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so494788a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 19:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145287; x=1795750087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=jC+nmD4IpWwdmLWddxCt9lDmjcg/0x0LYCkS72zUoKGEW47vb27trPFOaU89CneBHk
         SMB3Yt7YZGBRF4zcWJyDyRXyWs7Ck5Jylc4+iLtOw6uTpyk9TloRtAoBa8lsx5IttViM
         /1GnIg0/Pm8pWwKwdVm24PnKke+iAZeyWjUa55qwoBpRa3nlCQs83QqtxsWR/kteupHl
         DE7KWLBZ3M7lF7m+KK7rw/Sr5FHIbDsnXwRAAR2oU3JnYzg7akYFMfNFLjLPSSnIKM/Y
         LsWvNhoEOKgng3u/JkA0RZTg2QFI2zCT+4qommF2YPnrho8kn+A3Rl6/bBtrsLM2guOA
         DZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145287; x=1795750087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34aFfuXVpPcXLci0jSgT8zGdGbVf6e2b53cMgQyCqCQ=;
        b=VoAD4+OYgtmaoiZ9CPwT1rx0v1CN89kyMl+HO2Pw64ugljaBK7g+25hf7lY7oq8ALR
         i/fkZCyE0pKhm6VpU9Ytrqicvkud/301U+K0qi2ZWrnH8FjCNmTpbQSey66F6kpkh8z/
         KcBm/FIaSz4VEnnfxtt+ClYF/uNBq+pvG7TNtb9idKG7pMpSLndl5wfGXpdpnvDVmAgW
         SVGcnwRqaEziIQfU+RT7b54hNlWY3d+n8ABNdF4PMXMVdwLB0VVucY4gj6QU+b99JOcT
         Rtvqbr5DRNO9ptiK2NEDPRSddZuocR+OIhzlFQMleod3By3qcxkHcrMfE2lUMLF11PQe
         BsDQ==
X-Forwarded-Encrypted: i=1; AL+hErFF9My2PQf1T+L1KMHoHhrbsVyGSx5wuA46vpPyI3zjs5qPDKBNiefiyvBXAFR82weLsd9aYOsQjlS48Hyh@vger.kernel.org
X-Gm-Message-State: APuU4Z9XcIiYs8I1Sv3JcpCzDx+zt02Bwna7wz9MLRWII6B4xRDnH+Xw
	uMBlD3lK/xG2etll4wDhFnjSOA1urI1IkB2+RxOTqvfimmNrfLGYo6n3fGf5oxSotGaNe2F/2Y3
	Q+ImlhJYhEDyQqO1KmR13/BxOlBhR5p7zOnnoZJqttS6XomiJERauHv6LWrm5TSnLcygL
X-Gm-Gg: AZFdTZcQAWLe1XZWWEHat5G60OlcPAQN/Ddv+Mo7TmzDsT7eWGpe1/i/smVX/LyaL7Z
	MjC6jJecdrz9WJZeA2v2jUbxV5a4E6X2AFeHD3u2HNxPDTaPuDu4VnZUMq3A66PIYQ9luz+nm/b
	p0p1zcbwLxPW/1urXgcMZdWNL9atvVyttRY/ikFvI6d/EP8ovm0KkEGhn6Z5G4J4W7V25z4k982
	4i/Ckp9sBC16bqxv0Yb1OPuoBDtW/rKwE6hMqHFm+RUeEKnVhBlZaD7UE+z0Lq+Vaymfm4PwAzk
	Kqm2lVMsHIgMuepj489RPG9sR7+K+c0P7VTWfgu+fOlPPPweQl9vdg/LyKk+dlOS7imlqJYyH8r
	kbadp9nc/afS+bDT+g3gHiFTmtjSBVObdGNN0lT+qEhdExvUhEeuTJIQiXLSvBF/7f7TIRHp6Yh
	Ofg6pA8rdpYcuTC49/f0EuWqxSOC69Vs4TBAM=
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309309a91.12.1795145287544;
        Thu, 19 Nov 2026 19:28:07 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:d070:3c46 with SMTP id 98e67ed59e1d1-3b41c98a389mr1309278a91.12.1795145286997;
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:22 +0800
Subject: [PATCH v24 3/8] coresight: tmc: add a function to switch the ETR
 to a free etr_buf
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-3-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145262; l=4632;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/q3hbenfKTr48S8hdFy6BvVzZpTiff3UFj41MW4quZo=;
 b=2snsCrbr5ig562qt2nrm4F1CzkE9z8o+PNcmagxqr39xyOfSXGpqg1f2NCVaTJLHlq/eAWlUL
 tL1paZ1DM7CCpeXMEveFSPZpT8TiCLqVVInmWYXsf/8TP0oZMfTR8LF
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: qdxh7X_gWO10KPAo_jREovhmKFk8nFHX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX48+8SBduP/+i
 vlIJsj0eaX67rlFRCOhNRJoqhEM5BPSV18HrbsiMNZp678KUg4UNx2IOhy9mHjqPPINOQSQmoEt
 eUwO39QwwUsM+oNW9pu241jQp7KUhaU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX8LcGNHl/9WZo
 HPJ8J0cGmPTHS6FGsNj8EY8BsRbAz+ibSX3Hh7ouCi65tEsm+M7FvTl5veYw/2lx6G4GXxsm8vH
 TLr5+5ra3jrpQvq8xqv+AJusAV1rj+ANsU2/9HtgKp3u9C92MJXCdLcZKmolsjPq+Qb5UbigxPr
 RYtLyS3CSI/fv9D329aNifO2JIP1lCDL+awlRgOr1WZfMOM6o6QQC3+meDKnTaKBT/g01l1Dra/
 i6beba0ZZ6ODPOw+SAfCxe17JdRB35Wefob+u05nC3ujQrgvg8n5YCyEl5tCf+0TT3pM2hrGxdV
 s1qI+/A8g0be/yjE9P+HN8ih+bCDCSQRFbHNoJ2D2X3krhvcMwdSqPpCtg9r8qRLK3mPZZwtd1B
 mq73eSAz/5Cy53aw2RBnbbe4fpyT/zxUkGBAUkHGVt3T68d916tjRQy0NcUWUEsQjienhb6kBAW
 SgwN7120KuzMTKHHQ1A==
X-Authority-Analysis: v=2.4 cv=YeEodARf c=1 sm=1 tr=0 ts=6affbe48 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=XrOnqjNa2oMXnLqE:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z-iXM9TJyjA7tvrExkUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: qdxh7X_gWO10KPAo_jREovhmKFk8nFHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013

Add tmc_etr_switch_buf_node() to switch the ETR to a free etr_buf of the
etr_buf_list without disabling the sink. It returns the node of the
switched out etr_buf, so its synced data can be read while the ETR keeps
tracing into the new one.

Stopping the ETR, swapping the etr_buf and restarting the ETR have to be
done in one critical section. Otherwise tmc_disable_etr_sink() can run
in between and leave drvdata->etr_buf out of sync with the hardware.
Provide the sequence as a TMC helper, so callers don't need to know
about the locking of the ETR state.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 65 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 03eead4176d2..ba6a686828d7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1224,6 +1224,71 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 
 }
 
+/**
+ * tmc_etr_switch_buf_node - switch the ETR to a free buffer of the etr_buf_list.
+ * @drvdata:	drvdata of the TMC device.
+ *
+ * Stop the ETR, hand over the current buffer for reading, switch to a free
+ * buffer and restart the ETR. All of this is done with @drvdata->spinlock held,
+ * so it can't race with the sink disable path.
+ *
+ * Return: the node of the switched out buffer, or NULL if the sink isn't in
+ * sysfs mode, there is no free buffer, or the ETR fails to restart. The ETR is
+ * left untouched in the first two cases. If the ETR fails to restart, the
+ * switched out buffer is kept as the current one.
+ */
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *curr_node = NULL, *picked_node = NULL;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		goto out;
+
+	list_for_each_entry(nd, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf)
+			curr_node = nd;
+		else if (!picked_node && nd->free && !nd->reading)
+			picked_node = nd;
+	}
+
+	if (!curr_node || !picked_node) {
+		curr_node = NULL;
+		goto out;
+	}
+
+	__tmc_etr_disable_hw(drvdata);
+
+	/* The switched out buffer is free again once it has been read */
+	curr_node->free = true;
+	curr_node->pos = 0;
+	curr_node->reading = true;
+	picked_node->free = false;
+	drvdata->sysfs_buf = picked_node->sysfs_buf;
+	drvdata->etr_buf = picked_node->sysfs_buf;
+
+	if (__tmc_etr_enable_hw(drvdata)) {
+		dev_err(&drvdata->csdev->dev, "Failed to restart the ETR\n");
+		/*
+		 * The ETR is not programmed with the picked buffer, and it may
+		 * retain the pointers of the switched out one. Keep using the
+		 * switched out buffer, so a later sync matches the hardware.
+		 */
+		picked_node->free = true;
+		curr_node->free = false;
+		curr_node->reading = false;
+		drvdata->sysfs_buf = curr_node->sysfs_buf;
+		drvdata->etr_buf = curr_node->sysfs_buf;
+		curr_node = NULL;
+	}
+out:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+	return curr_node;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_switch_buf_node);
+
 void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 {
 	__tmc_etr_disable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index ff2dbd85415e..917f88ccc00c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -212,12 +212,15 @@ struct tmc_resrv_buf {
  * struct etr_buf_node - node of the etr_buf_list
  * @sysfs_buf:	Allocated sysfs_buf.
  * @free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates the buffer attached to the node is being read by
+ *		the user.
  * @pos:	Offset to the start of the buffer.
  * @link:	list_head of the node.
  */
 struct etr_buf_node {
 	struct etr_buf		*sysfs_buf;
 	bool			free;
+	bool			reading;
 	loff_t			pos;
 	struct list_head	link;
 };
@@ -467,5 +470,6 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 extern const struct attribute_group coresight_etr_group;
 void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
 int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
+struct etr_buf_node *tmc_etr_switch_buf_node(struct tmc_drvdata *drvdata);
 
 #endif

-- 
2.34.1

