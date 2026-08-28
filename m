Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F24463B8C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927549; cv=none; b=k4/YUcw8EBXWMdFOo5uuqgc4WB6Cefq1dETIyCv2rds7flQcKn2+te94Cl8Ig+snkia+1iukBvh6kDk0VgGOVh16diW9jG4IM6z630rel/9ufEAxZZrD/fIXni1FDrnFr43GVdwW1BsZRgCXni2ubkmRo0Ob6GEkrDVROgj763s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927549; c=relaxed/simple;
	bh=zsmXCPRsDe+vrSMpkrR/SKA6swtHN9aDV14WU1G3cCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oOE+q0Nc162W6e967Vit7JB84A43CKnSZYiOYYeMbU74OowooDMuV7iO7WijJChY+w+7H1M30cuNP8OLommmCd5kMNqoSJMErW1Uju3MPfAwiOqJeOpvFs4Fq5PXd/cufziqEeGjxENbrfA5b8uDJN5DxBBUY99RHjJ0AYHljQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HArCm5zq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXdlXsdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HArCm5zq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXdlXsdl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDketg3205293
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HXukI0MtwTD3BvyKqizU81
	C8XBF62MTXfa2zVlFQEVM=; b=HArCm5zqtVwN5UjxpqvHpaE+8OqhWIvHnQnHrE
	xqD5EXjgH+sZZGRINB8vn/F9dz5eUpCo2OULHCovKjfnye/chbVbW++mGM4C+O10
	vdK7Pk56NTymbIkC8sjkcfBgudxQYnV4ejBdAvvzyuXXECbkyyJJReNQ7kkeNJfN
	lkApZWSzeRDKHEry1qcYai75YclSABqow6ePgG8t2Kl8YvnnIEtV6joZbjyl3Tvt
	OHlj9o2hJNbrBSrZptA3K96r8SwrdYGvI6mMLoSgYu6aVNs6iwzTQTtzbwH8rYYu
	S7wqp6jnjZoU3xtY2sP9l4ZMpxBd3/kQZEWO3DgmCyjEmjXw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb7eh144x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:32:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73883529f72so841138137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787927545; x=1788532345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HXukI0MtwTD3BvyKqizU81C8XBF62MTXfa2zVlFQEVM=;
        b=cXdlXsdlCKsDW9e8mu6HvDaiv1Dwvmk3uNlOrV19TSLXqTL8sL4A45T/9yrBF4JRD1
         q5zGtJvsumL6BOkw12P53mUbPgQz/xx2pKN6eGkmQ/+zcgebN8VxB/Kgjj6ESd1XocKD
         ZSYeatbd99wtxz9j/yMVRtRhLeBg75R8IC/3LlMoViOnNmrA6yTab/TNHCruVZK0ZGcU
         yAwNAwqoiRcLGLH7w3uxfSTDiRU46v6oAfTBVsJFaO/7U3lyLHiVZjqK9KACe8cS+NNn
         32oj7alKlCCJg4bYQi+TXLWlAOCwndRqT0IbWvwE7ybSzfS+bOGoLHF4JfrgTd7gqknm
         gxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927545; x=1788532345;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HXukI0MtwTD3BvyKqizU81C8XBF62MTXfa2zVlFQEVM=;
        b=n486nLU09XKpfI4Dr7foWEkSaOdABi4q6SaCloQ/Bvr+i4ivxqnFohrPmzspe8fPFG
         J1/wpZImkJNwScq2PLPrZSp+OOM/fThjyNRFFoAx13fAY06O42NYf5dEe+bWSOpT9/V2
         rpcj0523BwLkvBPGvyM1RByETpvUJ7HZt44CqaF0miWFlpg2u0kLacjzx6W2duF2EzuW
         mPvfOz6SS4Ztn46O+a17x9J8ra99xZImOFNhov46zax93z36BiA0gMvXLyBA2dbqIAIm
         N2FGPGTKTY+vrVaweY5N9JIV0uqOgIdpL/5IQUR2AK1PPERq61WJ42alhxQU2VebuqS8
         +kzQ==
X-Gm-Message-State: AFuF++lnuYq0TWh7SGXL//0G8nYSBQqUE4e7Dx8OqtbMqdaI0lCX8fjC
	GqCQ7eDjEC91vrkhWJ4CBTdKTuJHcJIKvX23Nu2v3a85QuSMyI2JwTsRF6r5M3cHpfh34PeM5xu
	ZOLM6qctzfbCXqbfAp3kEiDk3cYuKHnr5BIkDtZxqn+FfnKadnnrCPdapXKG8Q0aIyvBubbTnJT
	JO
X-Gm-Gg: AR+sD11tXSDQvn6y2/dIo1NY6gMfIJFmgC1iqRhEA+kElxjOfGrrDxJK1mGk1SHlPN/
	3YhKb3cjOXauyw8xdUQWPNC/cHFEZXQ2ebcM41V3GUnzAEWnJZkB+Lvp8REKx0HU3xzxbGaYvqA
	LxAQ7lLJavMCSW4b+RaC83+Sh6IEaRWgCB5Y9Zzj277pqYm9AwG9z9Ztd+mUPz/j3hD2P1WcH3L
	0GpIYunflM1QO6u6fBbgPuyxgBqs9LLM8jImrjav7oUSvuNH3i9ybyQU3r7xPtGt25OE0dD28dE
	5rIM76T4+b/czW7PnpSEdNAVz2h1YkFdsLpsjGKq1+O3QoxTeFfxinXU0Us7O1JO6vKQq+IeQPc
	o8YuEXA==
X-Received: by 2002:a05:6102:5109:b0:778:636c:71cb with SMTP id ada2fe7eead31-7859872c8cemr2486238137.10.1787927544819;
        Fri, 28 Aug 2026 07:32:24 -0700 (PDT)
X-Received: by 2002:a05:6102:5109:b0:778:636c:71cb with SMTP id ada2fe7eead31-7859872c8cemr2486187137.10.1787927544118;
        Fri, 28 Aug 2026 07:32:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4e2c1af7sm137344075e9.15.2026.08.28.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:32:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 17:32:17 +0300
Subject: [PATCH] serial: qcom-geni: Fix unbalanced runtime PM resume for
 no_console_suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-v1-1-af3e5aef17a6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPCbkWoC/yWNQQrCMBQFr1L+2g9pKiF6FXGRps/6pUlrYkQov
 bupLgeGmZUykiDTuVkp4S1Z5lihPTTk7y6OYBkqk1baKKst776b+OnnwCOi8E0+XGLvJhc9Bk5
 L4IRcAti2R5hOddr0J6rBJaHKv9nl+udc+gf8az/Qtn0Bbm92eY4AAAA=
X-Change-ID: 20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-814e630326b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zsmXCPRsDe+vrSMpkrR/SKA6swtHN9aDV14WU1G3cCc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkZv1296DBkswXagCOkTK18MdrFasYbvtQ3MVC
 emVBCDQ9DmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGb9QAKCRAbX0TJAJUV
 VmfVD/9ApGTtQ7ROWFhmetAvxXA45LyZq2CHEdbWlDN2sO1IZecNWNF4JqogY3VK/3rCWnQ+Y+F
 9eX+M8UqD3UtHumE/McNEcLl+OQiO+1k2/8NfOqExFLqo0UAbKrtS9p1unnDmiXU9JDzADJSX2j
 kesbI1jtrCZTSR7GVMKv/SP8GY+gC8+Hcs/BHZG6mbWcjCkFDbanxpd+Wiyn8pc6TUCbGm6yQKz
 4JBAQNxWwEu1LkAQD9Hoz11QDqrn87ZgTV0Oyjwk3j4ryjSu9jNtoFo5I2exksVTJ+zL8mj6vg7
 6t+arXl6Lxt8TCjmHL+WFEnEEqa1SAhDn6eWCli3qcFaMNWhaSNpJZw5FR+IJbvGTUDx5jSILH7
 wLHOGSQs2a5lnMZAKvtu969/13GBSXSw1+oshAXjx0oq6hzGMCdgpALGsY7uy4wGboaU4CO3sB7
 vZYqIv4ey5RTEEhfq6fHTKBqxfEyXIm58FIV/Bpx7V0QZV8o3iDiutUaFfCTiZHApkJ8YlRE6J6
 0N4Qti4p15NjU3x9rd6CDrtsbdU6EYYd0TEi5XtSpTMh8qEXYMZvG9BpAK21rM4JVMcCcsxFEH6
 maIVSim6k/rvXL6cwJX0/fr/aBHc6xIrB2dG9pmGTXOzewo89cBJNmlesSM36f8Ma0Z3++YnhxT
 5NVKdvBWPuHRCrw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: hRuS7AGMjsx44c74EyQ67dQ8sKYsH3dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNiBTYWx0ZWRfXw/uZrnfjhxOh
 cJnXSh7qB3rM0lGLtMj+AOgob4p/YEDCqRN4VoE65PflVgkzXPlYqm6lXWsb5SjY05Q+7x8C1JK
 58Q5ngabv1FrShUhsPF4ZfMov1BBVUKV/zddxO8J59Lia7Y1N4GlY2N9ZV53OxGfmJWIyZ6YXgO
 dvW1swdvJO0e7aKNv+SdjMgvo3ahBai99kMhu7vn3zcpCfJhIzJnMLDXywK5iKUBzh/K41TKFUL
 mny4kBNOiGBrZg46094cRIJ6Xpc7SUXU/CPwuS3Io1/Ev0QeVqYfwBA3gfrIuUYN2RoUGQG15Rw
 aWiLKpeCNNYqh5S1YTYrPmbpmJ9+JrQKfzXGgKNEMK7+0a01GbPw9g36ZfFN7OXdNSl7JNDvlyl
 T4YDXEEhTA+QvZhwwthAqxDKoePp8fxsxDoTIAQNSeIaGWYFjTWubbHbPNF8V8K/ZsJw+TyJFqk
 dJkv/X0V6sxDZwjkfiw==
X-Proofpoint-ORIG-GUID: hRuS7AGMjsx44c74EyQ67dQ8sKYsH3dO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNiBTYWx0ZWRfX6dAyTGqSwcwD
 86KWqu2f77+VvcJeh4FqpFHM93m2dBhwkSbQSYMxgueKWqwHHTzz2ETso94pqJ5RotHSmQteo98
 nhz5nfobXjopZUDfx/U8cLmyjwjrJsw=
X-Authority-Analysis: v=2.4 cv=RoP16imK c=1 sm=1 tr=0 ts=6a919bf9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-2yc3nOPJIj7eM9l8gEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280126

When no_console_suspend is set for the serial console, the system
suspend callback skips pm_runtime_force_suspend() to keep the console
active. The resume callback still unconditionally calls
pm_runtime_force_resume(), which triggers an "Unbalanced
pm_runtime_enable!" warning.

Only force resume when the suspend callback force suspended the device.

Fixes: d0cd9c8d0fd5 ("serial: qcom-geni: add force suspend/resume to system sleep callbacks")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3633723acef8..a180a00c9e23 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -2099,9 +2099,11 @@ static int qcom_geni_serial_resume(struct device *dev)
 	struct uart_port *uport = &port->uport;
 	struct qcom_geni_private_data *private_data = uport->private_data;
 
-	ret = pm_runtime_force_resume(dev);
-	if (ret)
-		return ret;
+	if (console_suspend_enabled || !uart_console(uport)) {
+		ret = pm_runtime_force_resume(dev);
+		if (ret)
+			return ret;
+	}
 
 	ret = uart_resume_port(private_data->drv, uport);
 	if (uart_console(uport)) {

---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260828-serial-qcom-geni-fix-unbalanced-rpm-resume-814e630326b9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

