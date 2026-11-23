Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442177;
	b=H1X7pRkqUnTmDGlGJh7dWhujhbowqh2JRc3qmINXnv+boBjCdIYi0UgJewSynOursBOC
	 SS7QMpxEAJEGpfjA03k/mgmZNZInYhD5UBUucow+7U/rGoaivs+JA+PR7GZ3FkeRCfmhB
	 8kyqLDA+6KEIVFjzaWUQoEe9AVC/L/3pWFwMaOCs348tKrCH3bvdip48CL7Jo6GaHVML+
	 MmToYAvSt+cd4HuxABM/FVZCrG5ehkR+C1HIR50kjBnUHrgYCIxHCDWySqrqxjVtwjmto
	 Xjd8BOz6D3+4zPeSO4+GwhOup+2obfCDknwpISWaPAq2oRihxvXMRc+CdP8ULqeEmKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
	b=KUlTtj6wIkaPXmAY7Xpm2UlJhgnw6pFPsBEep3mGaRi+KH0olhsc4cn3whuPvnhMGn0D
	 iIwmGtw/iqu6ZteSP7RzwT7mza09w/StiTmaR3KpBh7xtobM6XHOOtjY7CmdDWAnrk48D
	 jKOiLO+DzsKDXqwjMlc9p51kv0vdtVY4wKrznOZWS7Aqrtx/ty0q65PuBVmJabiueRwkl
	 7N3Nye0f4D17UHgvprsMMFT/+hdVBuX29Hk5nNsOxmERGDUZFmt3kNWqGdszWbj+oVmIK
	 PAUZUudAAfgltPb9GYNREdOygX9dvOErgJoDsUdl4zbHMoajngoCFnYNbJDsVCllKiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQwhuwMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOlVOy8+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEBC606A6AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEBC606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQwhuwMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iOlVOy8+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL0td3072380
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=; b=cQwhuwMKG4HuwC/w
	C5jRFE9QyYl59JDVP3l79g5VRJB+LHFLySF4CDEcrB04fxFXRZLVYm2k5Dh71dX7
	mYgiFyAB1p9E+GHRoXXYyrGajeGvn3I1dFkHc+ow9riNQVBFP9YX9TPjgtQw2htb
	81Y8/LgBgmU+2Wq2Y+hFewPITf/wWAbGpsB9lmclX9iUQfSNC7K7Y8BAWYcHAxlK
	AAzKKu8RUMJf1RTMdvl5L26874RmOCqQaa6G/61JxXkOLUyvGZihI7uJ+X24O2cX
	Vw5C42XQJsiU7oLlL5OK2/PNpWsht7IHuOvKqV8Fw+35yD8EmhH4mwspAnAAeW68
	fuWleg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7s9rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so533602485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442174; x=1796046974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
        b=iOlVOy8+2jJ4QyZnpcc+BtQXgi8jEnmqKrEXMW6iTfqUntot4pwLR9uXv9pMa93drA
         EaQ3xFgiuVJS9/69C9F8ekgCfwbD1Rit2HfywZlgOT9IcMvZ6+6YsBcFGMLFI3VGSOxD
         us9RD5K1W1YYOwWdqqbebsUxlD5lqS7bF1cD7nhtIksg+HXNsmvukQPz5Vy19wQ7gHbs
         uZaVRT4Jiqsxk0jP6ayuYXhiBryCk1PwskMIz7UX4xuDwPP0IXbw3e4clQ3zcHwbIa1r
         MLYeO8h6FmFEAhRqdR/FeS/mDIwI9l9BsvqI2fJlkqzgm2or4cxEY9l8cNN0RVyZxqku
         7trQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442174; x=1796046974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5HVoyvcOYYPn841BrG9bcSw+LozVDgWcsxFSE0WYck=;
        b=wArLpqb+JPKZCztPS+lSWDR/g9SO1P6+uQR8mIx3T20v2GNs518E5+aPwREXhSavGF
         KQzvelQYaA8QuEmXzmZ3BabbWZQbm431k3VPCszAxqUHALVXdpwdKo/DVB+PpDkWnqAW
         QQAX3kNOOdrcUEQA/VT7zdqHzCOYfVd5ogBMAQWXJ6xig02sEXprBQoksUnhjIxa3jAg
         JDX6lLbK5e3/Zpz7X8nawFbkkLbTTtElsysyxTPmJgWXMRXOPsMte7dVWvpDnbkBTx7h
         8DvYYpQIBX0QVRN1BFiAKeknReIBmJFpbWZOuIwlZYA3InoQLrSNaWizLQ+FeqY4fMzP
         i1DA==
X-Forwarded-Encrypted: i=1; AL+hErEkgSEyQjoRZYOV9hyWetbWXvgSr0ctdqCPv+LPAu7nuVF8VOlXIJlUlXiYn6Ltt60+UuxLmimSiJ4kw4u/@vger.kernel.org
X-Gm-Message-State: APuU4Z+halH5y2d8fPLs24FTHlMojJPKnALqi5x7GEK/3RawgOj757ht
	TKy3zjyomkC+bKZRqH27++jHePYePpLYX14gKf5oCwbDSMZICYgy7h9vUbbTYxwNJWPHWAJkOLt
	WFMf2YOGnhDDFJuEOAH1mNkEwulQRZMJbljWyLsGwYrIP+gYyaIKCVyQ36IlN8W/ntF5u
X-Gm-Gg: AZFdTZe9Zytfi6FekG82aIewz6SO3TIfAVz9kQL7CwKE3VKU6ZdR/bLbJMZCdq4NQBN
	Ly00kbQg7Vbd1H+zI0ccYaUJ2X1zxCnobC/yUlc09CJQwhNJCXLwlZVQ1ScSz9EcIdiJcTZXePV
	UnjcZ5DTx8fTMAZLxn52ltSvSLWuHzvMTeiJQPkSGx1WLL+NZf4Xl1MvW1K8GfhadpYtM1N/5yo
	qQfcqwEDOwE9iRymiM5QOfdMhWeBaYVyTOihu+I5KRLPBJbW2s82DU4Hun/ctydaIPufZqy7RSZ
	aYbOHwaPVIQ4Zox1odEUPM1/QekKcHBi0gX95jLJXF4uheGrTobr36x2dE3o6zpy1DEqb2IciyE
	BCtW7u52vBp05Xi5/y2wipjuOCp1OI7NYkrLhLADPrOVE2+SxGwM9iMdcVAE8yclsePs0P3yGCG
	d/xyS9isXzDjffSk2vz/MoKiLOoB9vGrUpKa1I7t5pKSKQMgQ6jjdhByexaCOtNMVZyeReBcHyt
	UOtLbL5QrR26OyCXj0zV9x7QmIO
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1786391785a.23.1795442174360;
        Mon, 23 Nov 2026 05:56:14 -0800 (PST)
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr1786386585a.23.1795442173721;
        Mon, 23 Nov 2026 05:56:13 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:13 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:08 +0100
Subject: [PATCH v9 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
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
Message-Id: <20261123-monza-wireless-v9-1-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Jesse Casco <jesse.casco@gmail.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0445ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=oxJxktCAzv21rYXR6MwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX7FdPTNMzOFAE
 Zv41cd0+OUOAz6uOAKe/p3X7hfJn7xkLTYDK7LO3RHvvU89XVgzNoXzVZX5fXZk93Z8mVVlqQIa
 uCDYUkvJNIQh+9S0NRrr2cO/0tedEsoCYAy4s3FHc6mz+5sXsV9hZPAiN3X48+ngtZNVqaHRaoZ
 UaJqkC6RFlaFut7Fet2ISMJiEN84E/1YkkI1+lKwnB2eu1t7Hsii8GYKXqkJ0dJ8Dn4Z3oGYwQd
 zccxSAsfQwl6/1VE8SXAVZy17PkVdf5PT23tqS5ePUkMiVA2BAgT95rnbza91NLFbl9L3dtPfAO
 9Vg5TErELcFoNPbGZqmuskZ5t7nFcT8LtqDIFV+gUY2SYWJAbQeDMI+bJpOmdtB+ajmEl61iPUN
 HZGLeggteRARx+1mjCmz6w/3HWZ4UD8GHTLKm8riZ7L0chM9BIR6jVpEcSZwpVJawHi/Us8cEcw
 XM7YLcygE3hCe9pMJdg==
X-Proofpoint-GUID: gtf55mbDydWF6iGOauCZCcxACq_E0Jxx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX2ESa10eCFuw8
 3LWtQAhj4whd5ASz7vhG8QRXHxwKZUGr/eBOb4VR9WB0xVzLz4Wgy06ijyrCEbmn3QUEpQmUx4w
 AybGafiHpKbb7MdMy9/6jvSzZZq5/G4=
X-Proofpoint-ORIG-GUID: gtf55mbDydWF6iGOauCZCcxACq_E0Jxx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230055

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

The descriptor is looked up on the serdev controller, since that is
the node holding the OF graph link to the connector, but it must be
released when the Bluetooth serdev device goes away rather than when
the UART controller does. Acquire it with pwrseq_get() and hand the
release to a devres action bound to the serdev consumer instead of
using devm_pwrseq_get() on the controller.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Tested-by: Jesse Casco <jesse.casco@gmail.com> # ASUS Zenbook A16 (UX3607OA)
---
 drivers/bluetooth/hci_qca.c | 49 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index d693e28427251e9357019c192c030b837ebb2bb9..c4e42c9542adaddee17e256eb017902ef565025f 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2430,6 +2431,46 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+/*
+ * A BT device attached through an M.2 Key E connector is described by an OF
+ * graph link from the serdev controller to the connector node. Resolve the
+ * remote endpoint instead of merely testing for the presence of a local
+ * 'port', as some device trees carry an unconnected port anchor which must
+ * not be mistaken for an M.2 connector.
+ */
+static bool qca_serdev_is_m2(struct serdev_device *serdev)
+{
+	struct device_node *connector __free(device_node) =
+		of_graph_get_remote_node(dev_of_node(&serdev->ctrl->dev), 0, 0);
+
+	return !!connector;
+}
+
+static void qca_serdev_put_pwrseq(void *data)
+{
+	pwrseq_put(data);
+}
+
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct pwrseq_desc *pwrseq;
+
+	/* The pwrseq is looked up on the serdev controller (which holds the
+	 * OF graph to the M.2 connector), but its lifetime must follow this
+	 * serdev consumer device, not the controller. So acquire it with the
+	 * non-devres pwrseq_get() and release it via a devres action bound to
+	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
+	 */
+	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(pwrseq))
+		return PTR_ERR(pwrseq);
+
+	qcadev->bt_power->pwrseq = pwrseq;
+
+	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2491,6 +2532,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		if (qca_serdev_is_m2(serdev)) {
+			err = qca_serdev_get_m2_pwrseq(qcadev);
+			if (err)
+				return err;
+
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

