Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882217;
	b=k7pkTXNEhW4oyddQecIeEA//hwuXZQ7oy4V2fUrSwYlYb/JFnejzRNjFfR4oM6tZwoEt
	 9/Nbp+7T4weJdBHSBya04th22800Qc7UVYZk9UnmhQAmLUYrXCckUwJNvKqjEGu4yEkj1
	 pjs2h0SzbdOlZ3yJr9P2VXuY8sh1YfAu0cauFE2WuZBpQ3Sipi7cB/VC6Fh9TV/vrr4pM
	 smoFVJB9XyvrSqV1M+T5fFP5maeqiuro7sBQx2ylrAdFUv7+qj0hMsR60KJn87BWDn5hf
	 TsTf2dwUCsafRALozUdq2fJF5b4iWC5PcxS6ItYcBXjNvp7NVKQ8tn/9wr62yrIadgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dI2nF+ct+jmDTnhLj2KIfV8PxTbv0JvVFm8MGS+j4WQ=;
	b=BMBGAbo6qRgH5nCn3kOGniMWoeF/mWXmINlMbZBXmwHArfPaeuLQJNj+zYVL3czhaSlp
	 GWyMgtaGyD5PfzhCg8qgo4VIYIkwU/VjYPUFk9ypimh1UdxAI+hEWNyCSZ+s7scsSY0hN
	 G+hFXVXwq5x8Fz1LcI+0rZ5+CsTpB+4IdJewY+e/LVOPcmCXimIFmGVRd8v6pUGUnPtW+
	 Q7JShzUuOA+jhQbCLEIc312+Le38nL9PB5rujA6p7qSYSn8uIrJHcNCRqkbwPbOCPCrbV
	 Z/LzIz9j2j6AjavcajuisOj51NHuOFypbU2GGeVyAcCEkVJFihfEzh7MRcluJ8s/2hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JqxKJCaV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3Jdg9Xi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DE606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187DE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JqxKJCaV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3Jdg9Xi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAIoZN784154
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dI2nF+ct+jmDTnhLj2KIfV8PxTbv0JvVFm8MGS+j4WQ=; b=JqxKJCaVl+vIB9re
	ctfNsTZMZmccC77PF9u/guAl/bPDUVI8nm2Jy/mwRuJ++WbKagvgUORfdBSgovdd
	ICQPb3YeT0rQZZ+B+hd6+k53K2KK3K1n+vCtBPiJjgGNTDl6U9jKpGhnspR5ygMN
	CRSRuR2ZsJS/rzJQHs/k2GYMwjBDdz7auWUGbqzkyuJN1dM7U7hiieI8m3ey8OKI
	EKwtvAXhx63ATyekMANmwnQrm9nEdZlRgxdmup4xRLIdoiv54X9R6/tpdTSzaeu7
	52c45a2UtqZmwkjroZVjPNDJ5Vxto7A2dvZ+4zXZtB4IFwNJpIkM+U4A2kaPol6M
	xsFu0g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7q1u1827-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so8711545eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795882215; x=1796487015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dI2nF+ct+jmDTnhLj2KIfV8PxTbv0JvVFm8MGS+j4WQ=;
        b=K3Jdg9Xim5533Qr+Ke8Y9hNNceCmp2WCQ7U3EPUCdH2Jdf+EuOD3b80xx7xOq2blG7
         8LBxJ7UyZVQvzNEb0qeCnMmWh2IVALSlHmb2UlivQUghyjUzixAx1G8YwHFjh9r/Mn+O
         TdRLlD8wOOdtdWV7T7rRZzQSAMTqA0DZ3MRTrsPrFWWR5VdOY16yNADvVwQLLn+gztqu
         +PEiazlamJbUpVX6kgyDUesNirQ2l7dyAc40XSM4RBMfKugo391hy3KDu1kUT/CUasLE
         ynOesE8OtnmwOtXQWXjG7yoOkJfMQx2ThNG1pdJnVKUE1aIX+o7f5FG+Hogs7SYwv5LA
         Incg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882215; x=1796487015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dI2nF+ct+jmDTnhLj2KIfV8PxTbv0JvVFm8MGS+j4WQ=;
        b=Tl52mZqZAZjAJW0Sg3JI1kLCnnwzSdSrIPPDxlDUw4bHPx97v2csM4LVG4yV9fb4ZN
         mRI8EsZWbQP4eCWy4+f6xHgnK6Zn30P08UNi6G1u/mlpkq6rMktBUkRexaQA7beDfUwk
         AEFlFf0cRlBuuyASMwaJXa8eZHiN69pMqASAft9MBle07sK4PmwHotE//Z/5p7ZowWmP
         jDWq3VtxO9CllJzuSFp66ldbmat3LIXhyaV9y4yzs8pAHPysfJSh/O3WTIx2OUt7YKNn
         hl4EN8D51CybaerHxK9o4wH+HMeb/5f3GQwHv7AWmlTPmdbxiFi+Yt62kDqhRLpulYqR
         YAAg==
X-Gm-Message-State: APuU4Z8IpytC5K3vJaPrWpWcv6/ESI2BK7+JISEX7nevKiN3orOczKve
	YjymMrdSOaXsJZxMzAXFuRXP4ZqP3Hr8+axfEelRuSmPEoKC1wA1RKDGyWUrJh85tQ8BeEO4Yta
	FwwWWJtAR/WTuVdNtgYsKCeoQwSTVNpeqvYtaNSo4jO544F9khnIUJIGixVv/cG//peq0
X-Gm-Gg: AZFdTZc2oiRBMdDQXmId6pEWSWA5VQBOpvvqg1Q4O5FLyHmN01rgEYtnoIW0gJAd7b3
	4YxJ9fOxn5sufU3EpH9CIa/XyRpRR6l3h1W6Gg224S/sNFNRPW+nT27aWuJA8j3UYGIM89cF4HX
	hTwZdn1z+4eLnwco05zDp9s1VW0RrzZP/3sq8uQyvzKUlS6nbMRzbKEZYhaULMc+WkNakd/QDRm
	34M0SyrH2Z3TpDbxf+wCtd44hqELNMeOI2xjPQsNq0mbiXtIGe2Mdcz/In2gI5FFCnRmJtR+qMg
	bLfvXeorBeKo0SNZllEYWOSOb/e2VRSgmEZsxiHL831OuvgBT9e55j7EOv3ObEccmo0TAHfkx+Y
	E2gwwVhxBqbUJDB7RVn7vhHie9FI//XVY57m6AmyU3P/B8hh4BCQV9+fMzAMDNemvpQxxGco3pk
	KX0OyChHOVyQ==
X-Received: by 2002:a05:701b:4506:20b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b556906918mr25961676c88.16.1795882214645;
        Sat, 28 Nov 2026 08:10:14 -0800 (PST)
X-Received: by 2002:a05:701b:4506:20b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b556906918mr25961655c88.16.1795882214087;
        Sat, 28 Nov 2026 08:10:14 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm98647481c88.14.2026.11.28.08.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:10:13 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 21:40:03 +0530
Subject: [PATCH 1/2] soc: qcom: aoss: fix cooling device use-after-free on
 teardown
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
Message-Id: <20261128-b4-aoss_cooling_upstream-v1-1-55c1b0578582@oss.qualcomm.com>
References: <20261128-b4-aoss_cooling_upstream-v1-0-55c1b0578582@oss.qualcomm.com>
In-Reply-To: <20261128-b4-aoss_cooling_upstream-v1-0-55c1b0578582@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfX9R7iBzUxB4w6
 UbIjq260cmBabzYS0JMSSOJArPJg5PDCqrDcrvtrr2QOqUFbL3jN3YVw/GiRMoW0Le9m4tW+ync
 WxdZrYnpLqyU+d+R6v+EczDtBi6KG6sPkZU/XJmMry8Dq8zdyxfV1WylcJDa/Ovg29/5IoW75s1
 g8Gr+A6MGy7LYbXayPWIGdHvQCRoKY/GCNmCLqtE1g+erjApKiXeNAlMcOIV6ClI6rjYcqduRbl
 yR6ssfpdtnDMjaw15PrrNI//coizFtwHxqkPWIt7EvEpKNN6Yd+lu8nZu6F2TJ4/rEHdZIgjuwP
 MHJ0qbhf8f7JQgAoiRba1+IjPSMfz0H2I9PMs4jYBwpmeywg6545NvXxjqUZrmCDz0fkpbIdS7p
 gK5n0g7Kc6kBkttDvVSQElGUUf2SKjccFpx47RyAiMKOXCYZ9usYQmxBzAh10EVcIAY3jXgtnAc
 mfW2Fjnh//h2GBV5W9A==
X-Authority-Analysis: v=2.4 cv=Dv3Da2/+ c=1 sm=1 tr=0 ts=6b0afce7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9gPNX4NVn7B1s1C1AQ8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfX+mYcm10PqRB0
 LbLRcsezRX4aw9hXPoJl998WgvxCtpWr2YQDJYFCzhCjEVxgrx4VtotsP8VqK/Atdb1JegrHBm/
 RJH28/5FnJ21guZ3xD9mkGTrABk1NEI=
X-Proofpoint-GUID: XWcspOkHI0dkKeZNhYwH4TcoxsN4EKZJ
X-Proofpoint-ORIG-GUID: XWcspOkHI0dkKeZNhYwH4TcoxsN4EKZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280064

Each cooling device has two owners: devres unregisters it on removal,
and qmp_remove() and the registration error path also unregister it by
hand. The cooling array is freed by hand in the registration error path
and when the device tree has no cooling children, but qmp_remove() still
reads it, and dereferences it when the allocation failed.

Let devres own the cooling devices and their array. Queue
qmp_teardown_channel() as a devres action after qmp_open(), so the
channel is closed and freed after the cooling devices are released, the
same order as before.

With CONFIG_THERMAL_DEBUGFS=y (v6.8 and later), the second unregistration
reads a cooling device that has already been freed. A failed registration
during probe passes the ERR_PTR slot to
thermal_cooling_device_unregister(), which can oops in the same
configuration. If a later cooling device fails to register, the earlier
ones now stay registered until removal, and probe still succeeds.

The driver sets suppress_bind_attrs, so there is no sysfs bind or unbind
file for AOSS itself. With fw_devlink on (the default, not permissive),
the "mboxes" property makes AOSS a device-link consumer of its mailbox
provider, qcom-apcs-ipc. Unbinding that provider through sysfs unbinds
AOSS too, and the removal path runs. Unloading a CONFIG_QCOM_AOSS_QMP=m
module runs it as well.

Fixes: 05589b30b21a ("soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.")
Fixes: a89f355e469d ("soc: qcom: aoss: Fix the out of bound usage of cooling_devs")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_aoss.c | 45 ++++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 2d248c7bee0d..44b0c457e4ac 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -413,29 +413,10 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 		ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
 					     child);
 		if (ret)
-			goto unroll;
+			return ret;
 	}
 
-	if (!count)
-		devm_kfree(qmp->dev, qmp->cooling_devs);
-
 	return 0;
-
-unroll:
-	while (--count >= 0)
-		thermal_cooling_device_unregister
-			(qmp->cooling_devs[count].cdev);
-	devm_kfree(qmp->dev, qmp->cooling_devs);
-
-	return ret;
-}
-
-static void qmp_cooling_devices_remove(struct qmp *qmp)
-{
-	int i;
-
-	for (i = 0; i < QMP_NUM_COOLING_RESOURCES; i++)
-		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
 }
 
 /**
@@ -572,6 +553,14 @@ static void qmp_debugfs_create(struct qmp *qmp)
 	}
 }
 
+static void qmp_teardown_channel(void *data)
+{
+	struct qmp *qmp = data;
+
+	qmp_close(qmp);
+	mbox_free_channel(qmp->mbox_chan);
+}
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct qmp *qmp;
@@ -608,9 +597,17 @@ static int qmp_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_free_mbox;
 
+	/*
+	 * Registered before the cooling devices, so devres closes the channel
+	 * after they are released, and also on any later probe failure.
+	 */
+	ret = devm_add_action_or_reset(&pdev->dev, qmp_teardown_channel, qmp);
+	if (ret)
+		return ret;
+
 	ret = qmp_qdss_clk_add(qmp);
 	if (ret)
-		goto err_close_qmp;
+		return ret;
 
 	ret = qmp_cooling_devices_register(qmp);
 	if (ret)
@@ -622,8 +619,6 @@ static int qmp_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_close_qmp:
-	qmp_close(qmp);
 err_free_mbox:
 	mbox_free_channel(qmp->mbox_chan);
 
@@ -637,10 +632,6 @@ static void qmp_remove(struct platform_device *pdev)
 	debugfs_remove_recursive(qmp->debugfs_root);
 
 	qmp_qdss_clk_remove(qmp);
-	qmp_cooling_devices_remove(qmp);
-
-	qmp_close(qmp);
-	mbox_free_channel(qmp->mbox_chan);
 }
 
 static const struct of_device_id qmp_dt_match[] = {

-- 
2.43.0

