Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851901;
	b=Pwk961m5vdFplmtvEWWgu/dlnPUDtUVqFwOdrSht4LfwAkcNg6jdihqFQot9czLDvHhc
	 1MwND7JdIxnd9N78d2UFCtkusml4l47rdp4ubQ1GeG8MZtGLR2GlimXYho6Gn3JEZlkRA
	 fZqqDEHFnFPYRIPDP2RYH8qSHQ55ii1zokrhDnBRPzkJ7z/JF3wCsm7+p7TmQmu/E1etk
	 iN2BVVGNzmd7I4e+d8xxr96GdnC2OCM19kxqhoSAzag6QjVF4hiUUys5I2H8mDH1lXpyg
	 zJtUQIcxuuHS6ps7ue6aAgUcrSfHzN9NBhZARJqWUpAk3vrpCmr/o9LTWswL6H2UpoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851901;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
	b=JpWg7+mXvHMEQJQ4KDsV9uzgz3RJv6ksAUP0cEV6Lug2LMmbdGhTBDj0k2ghKIFS8LBv
	 xlFWVt0Wg50uhp6l9bPamZraLqwZC5gBFIImSjqGeJfl+BdeVbM5PsE8N0OmH45K+QSa7
	 rqxWm1Bm4blrJgq4saWT+VBYQE622KC11O3vi0kxfdIg3uDQKn8kONpjS20gX3xtsdvEF
	 KBmlRpdi7qJiyJnRUCqeK/4T+uba4JYpjeZVlqpEaPL0XJ0NXomT1dz27TXVVEQrHXOJF
	 jeAmC5lPs5PuEEy0NiOVLdq5aTQqvVPSzv5RWpu+Bh4+luDh2OGs3eVAr08+zu16Lnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE43606A324
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE43606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS4duZ82501801
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XSCbnCPHMeRDuEhGRMEEnn
	sMEwBvB/NgQ+oiTuIUzfA=; b=eldbdYe87ZT5sW2D9rVnaA/lNs6LYmCYelUOqk
	64KchP0loPaabylQZHnG4zYMduUD/IvKJo11KkerxzGeiOi7dmflBJKfzvvhnzkp
	pGjx+baL3/tAmOpVxD4tcrfO3O9X1AoQQNOe/3g+F6AEoG0C8MVkbD0vZL7EQlGQ
	6HjraZ4UqzX6EqV/SznhIMEqzgY4IpYe/F3MyjyZCCtBdP9bjC7j/ZBP7kcJwNfE
	VRpOUyUQNbs6r8cGnY78x3VJukUlC72wQLIkcn9HQLAjpCxIsbtnRmFJQXfFSoW3
	sIlvVMJzVuzfjXOUo+K/jGIl+RJR+gU5yKgd1go4K2eJrhTw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7r4j8aqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so5912816eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795851900; x=1796456700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=kAaKlk4duvZDiQHfGKRR3xbV7nFWcjd9/UBjnWJnrlbdJh8gmLbiS6iihyH9LA0Y93
         C0Vibrri+rL05Jndb7/m2UCu2Dhl9ZkpTAinCxyP/rFSIauBrsumLS9zwfcWGkmtI0xx
         17T2IXdpS9Xm/nueaWNf/sTrV6hIWnHwECjNp1TU//N7muXTrjVfP3JzETQ3tC2QTtrs
         veP6sKXlEoUUu7XN4HmyQWYe2TYBHRx4EBkuExvePjWBVH/o1yQRUUMjmKKu10FK01yo
         Kqaii/EqoREctOXarmWD9d3QsefDndayyOpw5wBHwwEk1IO8YYtmOZyhmV9zSn7fvPRA
         qA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851900; x=1796456700;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=TPy5YeuZ1/6lgtcPgh8OQ+f1TXPMIWRVlLJIYq5m6jR0o4BUDaqtkXfwwmwQKJMt8q
         oi4TBNAHelZvua6BZ7qN07jt1jz2yY3fq8gqnWXBtC6u18IlgCqs4hYEcaK2qKfqOSDE
         cqSBZ2M1OCdpXlUQoXDhzkTEz8WDGu5UXxXiSxi+MXorBsBY7QVmb4O3BYWq0Aev1N5l
         TGvpBJwlJg2WtwlnYo55tzNUpawgJW4c9w5ralJCs3Y7IYjvPKqNxNHzaH0yZCLXC1Q0
         TArr4qXy+PB92nKrkkhe9qSVsg79VGaKLBIOzaV74sSCtKv1ZSQCstAWLoDMB3/dkgHy
         eAuA==
X-Gm-Message-State: APuU4Z8XawO3yuK7y52igjCJYBKt1wuYhXi8CTLVyZ6Mj0RE8cfVULUM
	mZA00PKWAXyxTQfgkWlXy2IqzLY8ILTyEhDo+l6vtt2uJFfdrW06dX9aIQjcl3BYG9Ok66f7bXr
	VRmr4NS97bQBhbKtd2Va+yTybSgAUKT1YgEpa/Y3U2nIwnq4sMIV1ruiGzu9gSmqUcZUL
X-Gm-Gg: AZFdTZc2xMTMNpPVUgPMkcMzwFeVzF9wiikTtFL2Omm8NI/z5zrKV9ZUn+btWGi4UBM
	IRFYr5fT7EeoEEFhY3nTH2EQlmwf/8NOp7K6lM0KKLBiTYc1ejijKVSmhixb5fBjvHP2u5Oq8B6
	LD1LL6McJV1ZfkJv6nlCKqgVBWBMMY0uzQQjQlr7Co7p9gz+JDY37hwH0lM8JAI03dkNbwdqpUZ
	/Buq3w0Gz8IuKPKFptykYJtu8fa+r85HGaf8G64m+iQO2xzFdOB7Uf97yB6wYMmGx5sl/ssd9ml
	LDgXTtlxJ90CVnliLEl3v7fhogpYL3twqQMuBin2GJ/fkTYE3QTR8OMoLlgINjFqtUGQgXrjmc+
	WnkG5BvXkoHWmgIeq11ejmCdlD+jbLCA0eTiktTw7gaH8qPGXpZVc6XmP0HpuxTn0kuDBusohPV
	apyJc=
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521325eec.31.1795851899567;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521308eec.31.1795851899073;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
Received: from hu-gkanala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm65140367eec.1.2026.11.27.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:44:58 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 13:14:39 +0530
Subject: [PATCH] soundwire: qcom: re-arm the controller interrupt after
 gating the clock
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
Message-Id: <20261128-sdw-qcom-irq-v1-1-d053ac530faa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGaGCmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3eKUct3C5Pxc3cyiQl0jA/PURANT4xQLSwsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAHuTjtnAAAAA=
X-Change-ID: 20261128-sdw-qcom-irq-207ea053d898
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Oleg Keri <okerixx@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: S2wyic2kYLYVXUwAcv_kXkZ8Cj5U_oj0
X-Proofpoint-GUID: S2wyic2kYLYVXUwAcv_kXkZ8Cj5U_oj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX0p7v6LzGgaia
 BZ1O/HLMrjnalEoXY179Mzkmc5L+0hLABOHzl0kv+VW/TAmfRx06t5tNUI+6ynNGpd4kysuHVyR
 1cu1DmrKoM30fQjNvLYfGBstkuevcJKoANxikwO+lyQKMfjzbO/6n5pkK0tdxWOEzlONWt4zirV
 WT4FHO4/e7iVSDb3OxDDLWJD030AZ9E0j8hrZxRolmyQNBG2y4864sQwSSSBW+lBPT/dp2ZCKC4
 2SK8UEDIgk/psc1magysY7WjfyQOZcXyaVs3HQf7SaxqXMQyJs/QTCt93/iNnowdfKEZfTD/obp
 mh32TpoAA9s5AY0GmIG6Eye+hLrYi7VwmX20ZMk71RZgmGnNW5yee/MSBorwjHPWNvaF+lTKOG2
 6ZZ3shj7STA2J6inffYjrmc9hvabraHL/lx/2shJHxQ/p0xy+1lLkT2sRLxQpRHPm99LBuyGwi1
 RHKAles77eMPA82P41w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX+lCiuWrcxK9r
 U6bbHcYps8SpKwIrwCjOlCEbBzZc6JVI6fX0ukQClix3/S1b7sGQ8t0AtbB7Qm83Ch9fCMuOf7E
 rcJMjqmfh4va2EqJrgXDKF1HZH4tY1o=
X-Authority-Analysis: v=2.4 cv=Mdr5KJ/f c=1 sm=1 tr=0 ts=6b0a867c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=QX-rXmrizRA3L83J75wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280030

Commit 6c067677192f ("soundwire: qcom: disable the interrupt before
gating the clock") correctly stopped the interrupt thread from racing
with clk_disable_unprepare() in swrm_runtime_suspend(), but it also
leaves the controller interrupt masked for the whole duration of clock
stop, which breaks peripheral-initiated wake.

The driver is otherwise set up to service peripheral alerts while the
clock is stopped.  swrm_runtime_suspend() masks only MASTER_CLASH_DET
out of ctrl->intr_mask before writing INTERRUPT_CPU_EN, deliberately
leaving SLAVE_PEND_IRQ enabled, and qcom_swrm_irq_handler() brackets
itself with clk_prepare_enable()/clk_disable_unprepare() so that it can
run while the controller is runtime suspended.  From there
sdw_handle_slave_alerts() takes a pm_runtime reference on the
peripheral, which resumes the controller and restarts the bus clock
before any register is read over the bus.

With the interrupt masked at the interrupt controller for the whole
idle window that chain never starts.  On glymur an SDCA jack insert or
removal while the bus is idle is not reported at all: the alert stays
latched in the codec until something else resumes the bus, such as the
start of playback.  Platforms that do not describe a usable wake
interrupt have nothing to fall back on.

disable_irq() is the synchronous variant, so by the time it returns any
in-flight handler has been flushed.  That is all the race needed: once
the clock is gated, re-arming is safe because the handler enables the
clock itself.  Re-arm at the end of swrm_runtime_suspend() and drop the
now unbalanced enable_irq() from swrm_runtime_resume().

Fixes: 6c067677192f ("soundwire: qcom: disable the interrupt before gating the clock")
Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
The commit this fixes is currently only in linux-next and has not
appeared in a release, so there is no stable backport to do.
---
 drivers/soundwire/qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a4cb62897192..05ef7bb2c5f7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1801,7 +1801,6 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	}
 
 	clk_prepare_enable(ctrl->hclk);
-	enable_irq(ctrl->irq);
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
@@ -1893,6 +1892,8 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
 	usleep_range(300, 305);
 
+	enable_irq(ctrl->irq);
+
 	if (ctrl->wake_irq > 0) {
 		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			enable_irq(ctrl->wake_irq);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261128-sdw-qcom-irq-207ea053d898

Best regards,
--  
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

