Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507250;
	b=MMsffY3yniKxcdHcPooID+X78g9+H2syIVKvbxiTTFOslzIR3pw8uCgrkr35fZznCIPx
	 8j9yAr4QFdy323Dm5A2ZsccNsDK+/iG9cm1bv2e7DmF4Ml5UC5tupULBz4nEau1+G5GV8
	 y/jI+w/UuowUnavcW/Y6wdu/zvKXfSPeZcKcJtsWc6iyo6blYmVVzRhzKWE2hIYtUNMhK
	 q83c67WfXAMjsyaiVdW9jcJIYqvKfqp8qrW+1VO63t9+wNT5XtvU8FBqSnrCCWl9TsD+Y
	 gw+XhzS5mx+lgdJiVh1ln4f4w1klbfm64BJplXw4+Hnf8GprlLhgak5axCC9RSbx8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xk65ykRcNkfmB2miDZ4hlop/BJQ7fyy9s/xh6mOzPcE=;
	b=Ps04BBuB6yV9+EeNJaF2QMN088peeyilInV70ZrZ1gHQJx//yTHwnGPUAXPu0XwUMNVl
	 1D8zf/NXDDFW4M5DsPQ2uVzG61mxL1cfSAuHHydQRWjO47Q7qF1l6rLcWxB9arQMP3nI7
	 /PQwnt9QsdTL/ygNg4qG71Aiej6LU6O8HEwW10P/OSE2/uvHEX5YqNbOCuHOC4oXKXFe/
	 S8+Z8zGrqMOE45yvukXxm0UtrbehZ6+jPrztYb2eMraFGfVkvfrZMW+iQ9PWF4mImpVN0
	 yZ+9PM6ZdE7vdk/HfnWsS5fhCb9R1zzP7Bbc39vnoRSSfxM5UokmJo9PWY2EVAxTA7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHSYT5xs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NC96AtXF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B84606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B84606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHSYT5xs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NC96AtXF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5m47M2848365
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xk65ykRcNkfmB2miDZ4hlo
	p/BJQ7fyy9s/xh6mOzPcE=; b=eHSYT5xsoI0ufPL3DMV9mwsQ4epnELh1ghJqtG
	NZqGjsUKR6hZwIIiVNJghjIucPl04inv/qahoJrmX7K8kUCSWlS/LTxtjM+oc25n
	NbwxZxTWhccX9NCpRTO0zrFlUmH4w5jeZlXSCXqF89g4q//QIh237Mh9huuyeoCP
	V7yKFGk7njyfBUTAVUQO5ekjVR4lHU3slQv8dTG1IXhlSKJ9f9RMecmQFoSArVjY
	KPqFqSf7xZ4V6pS+Jvwsw+nzzPlDjgELX0HH2JXHwGD4lxz+/nCfMxrKveAxOTf7
	PRxAbkkAzrCSDJcJs5k0HX9SusDU+OezU1x+u8f3h6HZ2EfQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8f2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:00:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f08491d837so13829805ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795507248; x=1796112048; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xk65ykRcNkfmB2miDZ4hlop/BJQ7fyy9s/xh6mOzPcE=;
        b=NC96AtXF48JpkmhnZR8Z7lEdIwuWvMafoDGncAA9FaRF/QCMdK/vXrXxV/5njfjsWn
         7jd6rH6DOwU3y4LPLjEb9qfKb4SAyB37PL6WGcFDLlFLt47ogC3ok4NjMIDrJ9D3pP9P
         ocEsfy4QmLsWx1GymJ5A8002lguBTKv/pD2IIoNtksEeKd+MX5DwzODWnlJ8TtUbahxQ
         AphMaK8S+aBh6Y7A01n+HrkXmQSTueSq/ZTtnCkNWyEy4QoP+DJxva5Rxx/Swb51b8hm
         SmWvZDTnvFUPnleizdi6S/jIgmkhOgNAl6hOXzEe3I1AUFH3WtHpWFsm6m0IqdoEmIx9
         SO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507248; x=1796112048;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xk65ykRcNkfmB2miDZ4hlop/BJQ7fyy9s/xh6mOzPcE=;
        b=z+LNKCSg+yJEPWInB875f3ycOXzOgUTyghIwRIT/4sy6NOCafuqG1aMdP1Pv9uCKQb
         7JYxiYzuuSsdCt7ULzvso5Y5Zxgw/62EF06D2Wobjg6d7Ow5TIyPyoZqnMqKaTnc1utd
         WJjZbvQp0omF8OlpvHpAMrCr4kw5Sm1gqI2h6TFfqF7rEb7o606+MkHupfWZPopC7KEw
         PyY5QI4I7e5h6OnjsIMpEiMOBWkurXFtguAWyWsJx2UYiUMMl8p22wNSoj+apQW7yp4p
         0JlECe8t5JZj0mb4sHVhWv39f81WsiMchHI9mIer6zjzpdcoBAl2BoAM6eaxznxMf1ep
         2jpg==
X-Forwarded-Encrypted: i=1; AL+hErGLChMNB0HuelPNwK72T5R23rwghwqvNMt2SNSH3Vt8dcjOnmSkBAcFKtWJExR/rmtnjClL0S7Gfrvhh43X@vger.kernel.org
X-Gm-Message-State: APuU4Z9wOFJ5Gvf9HU+HOYJO3NK5ue74nHNTT8TaqjPVd955tRTRHy5i
	Ss9VWHyeX/JvvJoyHusoRIPlEFFS7VZCBJOwKgO8gPqAOJNkdC3fCSKzSTZ/RQVcMUuZf34ZmLW
	RUxUvOwIq7s0ENVYcGLeQAj2FpS1zHb75ZWVi5xd50TwZOlL0MijRICSUhKoQEvR+4hel
X-Gm-Gg: AZFdTZeolNH4spO7PFsyweBLWOArSDBrjDYp7RVu9HllyfzZBz96Gu3Gy8v+205GN0p
	QP8etrK3XaN1votcxRa4lrwvmXUmcoGKbEKAPkcXnPX30ygPANUbfMYdBwv6FTomwZh2kXRSq87
	XD5vJynbWdkx+fm05vvWgk5T8/4Yn6wPams+CzO8yJAGQ71XokAUDngvp92974H3A1vDv0qJaMA
	DkB81WKM57IOiElYoURoD57bXrF5Vej5TllxFaMZsgr2jvCqzMb2hyx3ZN9qASS7QWVIujOwTXO
	mMb+JZv65pSn4bcnT4hauHDfgsnxFPNOUsjgvRKFwiUKLh0nuevYzJHJo8b5ivmc6bDRdLrhk73
	rCaG82bMPD4rqZ9ae5I8/lE8fuNDH6/UMZ7mEs0EDCuhAso6wijZmE8Nwq+14Yk/Mx3eL3diwfI
	D/dWoolUxXIpcSq+ust0qlQbt0RK6zd/6Fr4XDUBhebOUYq54H
X-Received: by 2002:a17:90b:288e:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b41c9cf219mr11444769a91.26.1795507248127;
        Tue, 24 Nov 2026 00:00:48 -0800 (PST)
X-Received: by 2002:a17:90b:288e:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3b41c9cf219mr11444729a91.26.1795507247541;
        Tue, 24 Nov 2026 00:00:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm22621605a91.1.2026.11.24.00.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:00:47 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 16:00:40 +0800
Subject: [PATCH] media: iris: fix deadlock in iris_pm_suspend() with
 threaded IRQ handler
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
Message-Id: <20261124-disable_irq_fix-v1-1-d27f44f7eacf@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACdEBWsC/yWMWwqDMBAAryL73UDeVq9SRPLYtAtVa2JLQbx7Q
 /2cgZkdCmbCAn2zQ8YPFVrmCuLSQHi4+Y6MYmWQXFohpGaRivNPHCmvY6Ivc1xLFyRPLkSo1St
 j1f/jbTg54/qu4+2U4F1BFpZpoq1vlOgEt8rqLvrUBh65b+0VRVLWGNTBpGAxegPDcfwA4nTt9
 K0AAAA=
X-Change-ID: 20261124-disable_irq_fix-a042ac20facd
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795507243; l=3831;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=RdIDSS0YAAwoPS+0Bfg2V7Xz0q62EGYt+OLZau2scTQ=;
 b=ZR5qXB65LMBhIY1k/ZGP0uN+Gz6M2HVYL/b5NNt2Wq1/nj4e1jotWQ6YPOIr+q7IZzVfcdSJ2
 2QBxtCDFknvC8uikf4v+YmPnH5xr7yubrBYPYGqlc5D5GvZrakgiy7n
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b054431 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EmWklCXODhzPg6VfJcIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfXyiPbv/PFJBXc
 3/H5M76DEs5/jqVdp54Rb1dnTHQ6VwSklj0g8v65ghpbZ7rC4hrgDCSwoO7DcyoGE+f5vG1yVVz
 2+Po+vvZ0qexfIJcJDzrlIflPy+7d3E=
X-Proofpoint-GUID: fG1_iHMfsvaiZNPD8mmD4lNLPlmLTbTk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMSBTYWx0ZWRfXwfxWuzEUf8M+
 fJXic6D9CJ7/GhHBRnCS7i0OxT3NgpjNCWOCDLAG6KFxZxAktz31ct/vXP6C2xBxM8rTMQgZNfa
 KEh/gczgYccVeXoxI5Hv8aI1qK+6g8cVd7nQOC2Dp84f/3r+WLi5IctkzWzYGv0F5qlNJxo1fU0
 pfUJT8M/XU/UcGS9tf+xUp+qWtZMx0/P1DHlhEaMSCYL56GNenY/iQO4rLSCg67AomZMCyPPh3i
 r/fCoxGs7fPHh/sqaBzl/hiwEX1Y3qH6VMZrnin58ISZmtqFg6B4D7gWKrb4SjxOYgz5qmoU8ha
 hz7Js4382cQTd/Acv7vsbPW0P40CpPxTebnk0kaayLNluga/4JDCgc6pJqTNAbsSa4FnOerd2D2
 +YtKnn/17qCIOlagjtrX6pTx5Nv+xy4D/fNyTS2IDpkyfs6I/WHLklE9XvodLnXuBj9f66LRa37
 qutDDtMbzaApDmijtvw==
X-Proofpoint-ORIG-GUID: fG1_iHMfsvaiZNPD8mmD4lNLPlmLTbTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240031

Commit b9c2215bdedc ("media: qcom: iris: use disable_irq() during
power-off") replaced disable_irq_nosync() with disable_irq() in
iris_vpu_power_off() to ensure the threaded IRQ handler completes
before the VPU is powered down.

However, this introduced a deadlock. iris_pm_suspend() holds core->lock
across the entire suspend sequence, and iris_hfi_isr_handler() must
acquire the same lock before it can complete. Since disable_irq() blocks
until the threaded handler finishes, the two contexts wait on each other
indefinitely:

  kworker (pm_runtime_work)         iris_hfi_isr_handler (kthread)
  -------------------------         ------------------------------
  mutex_lock(&core->lock)
    iris_hfi_pm_suspend()
      iris_vpu_power_off()
        disable_irq()                 mutex_lock(&core->lock)
          __synchronize_irq()         [blocked: core->lock held
            schedule()                 by kworker]
            [blocked: waiting
              for handler to finish]

This manifests as a hung task with kworker stuck in D state:

  INFO: task kworker/u33:8:178 blocked for more than 122 seconds.
  Call trace:
    __synchronize_irq+0xb8/0xf8
    disable_irq+0x60/0x88
    iris_vpu_power_off+0x6c/0xb0 [qcom_iris]
    iris_hfi_pm_suspend+0x44/0xa0 [qcom_iris]
    iris_pm_suspend+0x6c/0xa0 [qcom_iris]
    pm_generic_runtime_suspend+0x38/0x80
    rpm_suspend+0xec/0x6b8
    pm_runtime_work+0x118/0x128

Fix this by reverting iris_vpu_power_off() to disable_irq_nosync(),
which prevents new IRQ deliveries without blocking, and adding
synchronize_irq() in iris_pm_suspend() after core->lock is released.
At that point, any in-flight threaded handler can acquire the lock,
complete its work, and return, so synchronize_irq() is guaranteed to
make forward progress.

Fixes: b9c2215bdedc ("media: qcom: iris: use disable_irq() during power-off")
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c      | 10 ++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c46190a4fb3a0055ba012b16011235..5580094d427429d610d7d0aeb85582676312707a 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -388,6 +388,16 @@ static int __maybe_unused iris_pm_suspend(struct device *dev)
 exit:
 	mutex_unlock(&core->lock);
 
+	/*
+	 * iris_vpu_power_off() uses disable_irq_nosync() to avoid a deadlock
+	 * where disable_irq() would wait for the threaded IRQ handler to finish,
+	 * while the threaded handler is itself blocked waiting for core->lock.
+	 * Synchronize here, after releasing the lock, to ensure any in-flight
+	 * threaded IRQ handler has completed before returning from suspend.
+	 */
+	if (!ret)
+		synchronize_irq(core->irq);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349fe7359d9616e12c83eef44ff8d55e..1e183fc4e58ceeca4e9b3cd103344f45a3d841c8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261124-disable_irq_fix-a042ac20facd

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

