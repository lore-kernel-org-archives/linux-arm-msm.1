Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC9432BD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784559221; cv=none; b=F7XJclwWRczsMSTMFjvDS15IywxBVpmcyzQwPK2k6mYThq9Xfik9xGrezSODRuEWAjmva8h1i2VwQD60/NB1LScDzMeRSvJ05wWXnUybAARCA2xG51En0oM3GRvF44EL20tqIJj5ANMtccrehSS1GYCJ8eGw1CedvxFX0lTytSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784559221; c=relaxed/simple;
	bh=nUtpxxuiRb+RaL50EhMrsJJovCVCQ1vnB/0Y5yFR1yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uOU2jrB2TsvRbRRHpJFP6LouPXi9kDrpWRfCALK0wX030gkNBpt8puC9zZ5jKuHLqVYLD63YDyOry35mFZZOZkDVmP7A4j4TL7pPAJ/gfGo40fCbZuNXzOwmy3QzcTeO5m0r5h6LcC0yWvW0sfRQpr+gGN2TQjm25vfZ2Lcyy7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSZCvTPv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALOgQmWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSZCvTPv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALOgQmWz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqivc3856083
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jdHltSsSc1HthVrTabB7Rd4UqHGUwTwsmtUtkd1pIoo=; b=HSZCvTPvExHmjjhK
	O1b4JPRoPIOquA/j4h+RbIRO5GY2/C4JIQ4fp448fuQJsbSy61wmx46+R/+vCzDJ
	pOQNi/+TgPIBPSsuU/7X4Pq7SqBH2G01ci/+tIMnyqv8yo3ZdqJzHbht0OjuY4FZ
	jr+30eO5/PAp/dja+Zc0xdQxBUf+cfTGLW8+KUrtmPkKj0N/untBxPK+Jpy19cFZ
	0jEOJF+bIECaTJUF1OvVeCbkWG/VOs2B0e8yueduWkrZp8j/dT1LM5+DUDbOFuM1
	xIksRhkKaMreo+33IUXyT0XGUCiVofYm5pnHCyoGraN2pGU8IwmzZSOYeKft0r5P
	ijU/7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg1v7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:53:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so130915361cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784559218; x=1785164018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdHltSsSc1HthVrTabB7Rd4UqHGUwTwsmtUtkd1pIoo=;
        b=ALOgQmWz6Xu2JZmdDRhjBGixUKEa15vYFd3Pw62guglErE87iQ3Yo4tpYnTKs0CoXt
         vkhPDbfV18mnAG+MnaeMbkz+ZBXJljEF79zB1WqGDuSSHLQP4lzHMoPw1i1V00WRW5yS
         oC5zzgoBRisAW6f6kpejREkWy2LLN5KfjcHCqyTuK4OtA86HHY3JIgYOni96SsYpNduS
         PBiBccirPv8fSEK/9xUxX9BUlQgve0Vyoj5o6hQm6f/jhNCxISj03RjCg1G+9KJyB4cs
         IR8lqlGsu9snew1DMOvh4O9cHVP/iftQ19Wl0bOEeTyIX6RQ4Erq10e5XQ4NuQSJ+HyQ
         sjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784559218; x=1785164018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdHltSsSc1HthVrTabB7Rd4UqHGUwTwsmtUtkd1pIoo=;
        b=pQkbfUM7SHlglcA5q8VfFgsR2b6tuhwMk33w3Tsv+38uGU/np2NX+SBtZFy0d42fHo
         34xAunGL+z6NdiizBsio2fA6k00Bx6kBC8rQsZd3W0SftzIdksCXt2N7+TanSJ0rimaE
         DsPEkr2ioIPKIn0fi226/VJpcOgwm/L7uTSXUb0Ub2TN4yFFyvJ8CjO+uO6HPyqrs2lR
         0FtWhQMSwo1PVzWHfbe+SNWCw6Hc1LbpkuGpxc3dNfdogHEUvv6gRWSqpjKgCTRZ717p
         Q8oYyBvKQY3hDGUde0F8Aa0kYSFacPZ7uslHwW+2WUOV2wiudtlsdyN1ro3tQCE6/k6I
         0JUQ==
X-Gm-Message-State: AOJu0YxmCU9JZOcysW4RaRoIk4kqyMbX2YyAUlzByXRGHtRHUC7kTcR7
	kYCwWXxvLS2AYlUkmVg+YaXzSdFCkv2HHqT0EYcNzoyTgsKLwATjVVZ39Y6+JaEfWYdusl3Tn8t
	ZUa71SDQI5fzzA9AcZklsS+nqHrK8syPg+jyZml+x+ALYK3/rVCwzK0mD6N1mB/In+Pxb1TpX9H
	NkmjI=
X-Gm-Gg: AfdE7clNxXl8Z8K7g9CXyFkeU4H7eTzD00CD0K8aHcewmV+s93WBVtOcWuntRjAtx/T
	9Xwo1FPHk19Jh8reKiBRq4KBx7GXrnzKqsr6ad5xWgFTjhKcEun/H410lq4d1/zQWcVtRhCh3PG
	nKhyNg8CesuC1Wt6cm8GhvQYqFoKZlhbdUnFKJoXq4/izT4suW64pEHgIy9q6GQ3tZcYQYl4Tzv
	DK5q8QnQBSR+qU58ZzYyWWIhzhMPI816FSkhojHxRM49fn9EKZymSV/5OYWIkxvNTVtFWzBI7ra
	3ta2dLGCayJvxewDycJy0PoFIn/DWHrrt3R6T91eftINSBmnaFdWISNFEgXm4MCrbIVf5VOYuTG
	t94xnVFOMBI+OwmXKTZoY9vrOadOJt7jr1cTJzDe83o1sp8XtAoyB+d7v9XObz0DrnffnLM8mbq
	2n5ykVjwjAQnx3F1ObV30tRVMFALLGq3iBrJA2kP5zo5xQGcxfMAY=
X-Received: by 2002:ac8:5809:0:b0:51c:709:b81c with SMTP id d75a77b69052e-5213b1494c9mr137954301cf.32.1784559217831;
        Mon, 20 Jul 2026 07:53:37 -0700 (PDT)
X-Received: by 2002:ac8:5809:0:b0:51c:709:b81c with SMTP id d75a77b69052e-5213b1494c9mr137954111cf.32.1784559217346;
        Mon, 20 Jul 2026 07:53:37 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4800215a12.30.2026.07.20.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:53:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:53:31 +0200
Subject: [PATCH v4 2/4] phy: qcom: qmp-usbc: Prevent unnecessary PM runtime
 suspend at boot
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-qcom-usb-phy-fix-null-v4-2-4d2a0f06d53a@oss.qualcomm.com>
References: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
In-Reply-To: <20260720-qcom-usb-phy-fix-null-v4-0-4d2a0f06d53a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfXwPeNii+8CblR
 t3gWfDgnXC1Sr5rbjTYgORLo0pN5/Sp/KAvR5bggUhcTkdb00DpSy3z0Yt+zxbyzKNUPiNIEDK6
 KxvMa8VwvdbtwtQjl/h3qJFMRpLA4a8=
X-Proofpoint-GUID: kv5-AzTy19aF3la9YYHZ5PkixX5RPTbA
X-Proofpoint-ORIG-GUID: kv5-AzTy19aF3la9YYHZ5PkixX5RPTbA
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5e3672 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PcYcMbZi39MCwOMHHM8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2NSBTYWx0ZWRfX71cSBRAU1qym
 gxcKVbfEq3EEgsbW70YQF99wPgKXHPSK38Gqgg55TcOveYeoOlty3Ts1GoOVpUdBTJGKaiEK+Sr
 kMVzDktwZ0iuSsiEY4QR8wgwgUjAH6NyVoLk4Ts54prOsrtg+/6P3et7Llq4VQKiUlHwbmKliO6
 QQ0xQ3dP35f8k/dIx3tfUtQ5Tn/9xocU1ukxDok+B04833u8BtPqYAY9FISQx2Ro1XrIJMx1GC9
 q0GcYk81tBA1y/nUILZ5R/Lofowh29oEuiRY1NjYtsHukGFUAewb+BoCgefXJcMOFwzH8KqtHsq
 ol8kymUE0fxOXISfhTGzNq4C84VGIGv1aQRYvHMR5F+2wAVibHQA1GNUM3gtTz4qplI3VuL63yv
 rQK+RiII5UUlGUYmGNgwc3T9yK2z7ySEJ+2LFjZuIeCJmh8mx+wPAnOQSot/NJSeRm1tq7dhKTa
 N6W9+2qWzm6/USAWWmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200165

Runtime PM has to be enabled before creating the PHYs, since phy_create()
only enables runtime PM on the PHY devices if it is already enabled on
this parent device. This opens a small window where the device can be
runtime suspended after pm_runtime_enable() and before the later
pm_runtime_forbid(), causing an unnecessary suspend/resume cycle while
the PHYs are not yet registered.

Take a runtime PM usage reference with pm_runtime_get_noresume() before
enabling runtime PM and release it once the PHYs have been created to
prevent the device from being runtime suspended during that window.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c198832ae06dfcd04fd34395e271d..4317224070fd8dec98090e9200ac7d0e97265979 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1959,10 +1959,16 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/*
+	 * Enable runtime PM before creating the PHYs, phy_create() only enables
+	 * it on the PHY devices if already enabled on the parent. Hold a usage
+	 * reference so callbacks cannot run until the PHY is ready.
+	 */
+	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 	/*
 	 * Prevent runtime pm from being ON by default. Users can enable
 	 * it using power/control in sysfs.
@@ -1971,13 +1977,13 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
-		goto err_node_put;
+		goto err_pm_put;
 
 	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+		goto err_pm_put;
 	}
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
@@ -1987,17 +1993,21 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (IS_ERR(qmp->dp_phy)) {
 			ret = PTR_ERR(qmp->dp_phy);
 			dev_err(dev, "failed to create PHY: %d\n", ret);
-			goto err_node_put;
+			goto err_pm_put;
 		}
 		phy_set_drvdata(qmp->dp_phy, qmp);
 	}
 
+	pm_runtime_put(dev);
+
 	of_node_put(np);
 
 	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 
+err_pm_put:
+	pm_runtime_put_noidle(dev);
 err_node_put:
 	of_node_put(np);
 	return ret;

-- 
2.34.1

