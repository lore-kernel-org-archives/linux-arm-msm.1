Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CC35AC14
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727933; cv=none; b=f66piISP51uhPusRaLQb2rdCvjwnDHxP9BZWBRnfOGknJzQ7B2101VO4E+8IHSqxmOzTDzFFeq058b58+esibXZLOKtQ/QrsEc3OpTr9iILUHOFGXXKQh+vOBU4rJQ9VHuMQpe+gutYtt5ldizVVWoZ3Br65O4xQ1JkqwqrrST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727933; c=relaxed/simple;
	bh=zZDqgw4VzJAzmG7YtMnZTQarZCvmksmgM7S409DtG6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oz9YiiZEf/FFsAU1SDr0U9c8TVmsIY0bMtSdJapPe5eIjZStVV8NtAzu5xgDBTaO1G8LIBxwv7qLQJP6Zz45/8s9oFN0QHTPlTiw5Y5llx2yCW9+LgiW04Zia3ReO7MUYJz4lDRqgxDyZQ3HwyPYjCjx+vSw8Z6KUd4hQkmoasg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/4ecvij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZSoST0Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/4ecvij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZSoST0Z"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWk5I1033913
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iMnf9ZiLsaVZv778rMtqnmi/YEJiiDpTZUI+w1LHek=; b=N/4ecvij8MH+edJl
	FMogbeBC483ekT8tWXH6SxdPlMXDNzJ01r6QktTQBf8uOdCWyAQrhHlhXU8NASML
	viMSUzfB7VTMMbkXS6ZVtGOqr45I2KOhxVR6eQZZHs6SCbPA7J3iHjWGRFG/kfXj
	MqJn7I4IOtAfMGgBxlukvZtBdJqjbGiUGR/ANH3+I1HoIIHcXJaCptzrj5DXyGVw
	2324Pc1t0VdfJP+jvJbvx69xn5ssaS2OE12E7fm+v9ZpmDpsmjUzQ7qwYwN4UsZh
	0l6fk2zN9vKbc7/DLlRYApH33Dh1rbgT/QlRAM1a8KEmaCKva/WFqoSQgLAH/fFF
	xZE5sA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdj3t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:45:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c075c1e25so178234181cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727929; x=1785332729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6iMnf9ZiLsaVZv778rMtqnmi/YEJiiDpTZUI+w1LHek=;
        b=TZSoST0ZuBKFAC2kQ9ukBhyfK+5WVKwy1gufWpSX5gUrSXk+fLjx5ex0y2aM0kS/1T
         hcXADPgGFZc7/n4L5qvMHnqwgjfARzD7QrI81W2tENBQfrFKS2DIyHQ1q5sati+F0hUX
         UHrnBlK3vCOCZNpE4SIZf4Rd5oIDQdkxrZvpP9bq1Q6bSpOGcIWvtdm0/DizAlQFL7zP
         eqSk8YjC7kJ7C/cZMdxzeKzV3MjfwmC2eQYWkdnXC8J8NzEdyD4EXV3yG/ljqbSsoEbr
         JNDTOyfJBJWkpxtuB0aiv7ogm9tIRANVgG1Q7e20yWCVVgMy6I6Hfwg9sEK0khsSh0Qf
         onZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727929; x=1785332729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iMnf9ZiLsaVZv778rMtqnmi/YEJiiDpTZUI+w1LHek=;
        b=rbRRjaxCKuu0OqDWBk1CSYSqsjlXVfQXznUetU7/eyTgKTufdKu2v2VqH4izWCAXP3
         67PjBvvm2O8VsYRQncyr0noQ2b9FRXT4UIIYRPNDTZ3oN6MIOAHN0hdkgjHhLrrpv8B/
         3lpj3dufxyIUvhsxGoQPow8mW5R1vzNux/BBt8+Jv0qP7DEooZuHd5Z1QbNSyfgGCzjD
         iCE2bC5xKjg5RbZRy7Ah7snLsiv5IRVhidmGcpvk+v2/ypgfbw6DqIboZgsBn/2pkIi2
         k3vh+7WKvBSyZa0FnWDk77B6UNjzDj4yS1DOGQ7C3UdgUksEJiRge4aVLUOpRDpyKdcZ
         nypg==
X-Gm-Message-State: AOJu0YzvYZ0nz3Kh6dPq+RiDTJfjvGA1AzOk2lUkeEB8LKiuu0N1wH2V
	9JFbmtTIQ6lSuSQigctmSlk7NrBcWtydpl35RUa4vg7JV7l35meveTZW4ziYpKD/8EBwDOc28Cu
	yoPDYPKBhZNjkJIwSkooIO2ZiFXcvWhPxy805kgFnUE8dguJuHDK5oUTQqogz9rvvoRpn
X-Gm-Gg: AR+sD13UDZOsROTKLC4FD2gEGjaLQc11Bju0o3z9DZzY31r66GYuiuz8LbQ/mP3g0V9
	koCiGlQN8r31fi/9iJqfcyMuWku2RpGRs0k/4XPrvQhaPpDamx38g3Fn/DSc0dA6W4MAUhnh1wW
	xkjxVXd9MyVkFuex1f0izutEMTEN1XoQW94zN6ODxz4e7Z6tzOVJwH7jPmAI/fuU0kXiArpEckV
	k6NRWSlNhqMEg/0jfsDHl/Q8YDEmtOmJOzyOC+FuTspUqXMDxKbhdMMOEEe+5mxpsSyXQP0ECVs
	KzvN42VPi+pGMAX7UzYUgRPiUs1tV95QEFh5Hrp/CG5xErNvL/kAn9xB/mMtRpg6ZG7syy3sziU
	JrhU4uWImxdxAlSYDkrBG0dtc2fVSUYamvHXaQBNwN+oUPVFjpvd94E77lbWqapUs+nWn1O79eW
	nDVL1Y6nDQUBJrwBxUARhpjPqH234BIbZAGIpjaWBxgKVMzd/Evg==
X-Received: by 2002:a05:622a:1dc3:b0:528:15e:d1d1 with SMTP id d75a77b69052e-528015edfdfmr24753271cf.16.1784727929363;
        Wed, 22 Jul 2026 06:45:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1dc3:b0:528:15e:d1d1 with SMTP id d75a77b69052e-528015edfdfmr24752971cf.16.1784727928886;
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm111874366b.23.2026.07.22.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:45:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 15:45:19 +0200
Subject: [PATCH v6 6/7] phy: qcom: qmp-usb: Fix possible NULL-deref on
 early runtime suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-qcom-usb-phy-fix-null-v6-6-534f7e61b9a6@oss.qualcomm.com>
References: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
In-Reply-To: <20260722-qcom-usb-phy-fix-null-v6-0-534f7e61b9a6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXywL2pWg+nzBh
 xn94xYOtsDTxjw3CIJKznqneXMTn2CbPtsEfNG0tNfQeQAE4x+Pg5MIJkI8am7PwyIYE065TOcs
 rHv24TcgRrzfbmctyn0STboF/riqpI4R+kbOSzS5u2oyg9DouaXS/3jofHNXZQK3M/HIT4q+k3i
 Bz+7v2W68kuSWHmaEeUSBUe4gk32xbR9nXkNkoNmPWGk/MIfrP/2GB82Tk8GV752142Db5G4Qpl
 W5rK1Eq5Y/8t4LsVt9x2ekBHizU7BpCtPQzp6nT9kEk5gE9qUGnO/InWuTcVlPCDBpTyiQj30IW
 BGLQhMZJVHUAYCkEG/hIwCMYz39RPXf3QAZ40WWICFuwpZ+AgbsCDmw7w7BmKMm5y3lYtgysHZT
 uL/z9dfUeOz6Vqj0r3RQY2zq8VNWvdQOiSP3Rv2EcskxtOadxs6Cez0LyXvBxBUxzHKKwGE1Lzn
 gKqs3TxjRAy/Y2yv+kg==
X-Proofpoint-GUID: 141oHb9XgJilscrCznl9rzBcbryyhUlS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzNCBTYWx0ZWRfXyEjB/bw6zRx3
 FUPOJXs/0djvd53qeksVXfned8hEvinqAPuRzDhY1DqIfGfq6SXtsd6bB+YYV/B2Ivn983TbT2N
 U+qN5Fu3wt68CVR620aIQroBpoYK0ug=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60c97a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QCvEx_dtP_Vb2dzgXhUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 141oHb9XgJilscrCznl9rzBcbryyhUlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220134

There is a small window where the runtime suspend callback may run
after pm_runtime_enable() and before pm_runtime_forbid(). In this
case, a crash occurs because runtime suspend/resume dereferences
qmp->phy pointer, which is not yet initialized:
        `if (!qmp->phy->init_count) {`

This can also happen if user re-enables runtime-pm via the sysfs
attribute before qmp phy is initialized.

Similarly to other qcom phy drivers, introduce a qmp->phy_initialized
variable that can be used to avoid relying on the possibly uninitialized
phy pointer.

Fixes: e464a3180a43 ("phy: qcom-qmp-usb: split off the legacy USB+dp_com support")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index c5507168e1354bdec8381ca5ca1ba2bfd9dbc87b..bb905c437a01e3b898b7259abe3e49df4756fc5b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -1434,6 +1434,8 @@ struct qmp_usb {
 
 	enum phy_mode mode;
 
+	bool phy_initialized;
+
 	struct phy *phy;
 
 	struct clk_fixed_rate pipe_clk_fixed;
@@ -2009,6 +2011,7 @@ static int qmp_usb_power_off(struct phy *phy)
 
 static int qmp_usb_enable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	ret = qmp_usb_init(phy);
@@ -2018,14 +2021,19 @@ static int qmp_usb_enable(struct phy *phy)
 	ret = qmp_usb_power_on(phy);
 	if (ret)
 		qmp_usb_exit(phy);
+	else
+		qmp->phy_initialized = true;
 
 	return ret;
 }
 
 static int qmp_usb_disable(struct phy *phy)
 {
+	struct qmp_usb *qmp = phy_get_drvdata(phy);
 	int ret;
 
+	qmp->phy_initialized = false;
+
 	ret = qmp_usb_power_off(phy);
 	if (ret)
 		return ret;
@@ -2101,7 +2109,7 @@ static int __maybe_unused qmp_usb_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -2121,7 +2129,7 @@ static int __maybe_unused qmp_usb_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->phy_initialized) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1

