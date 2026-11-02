Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623832;
	b=Xjfm+AZ8C3FPmp/UTMcMYwBjCOSUXRmjSu7SUEl6HbxQFcCjJDNpTsyUHdWEfSTrLYmk
	 HAmoHraxdOlpPrri5SEDnLgONBKw54QNnhGCWJVHTOrD+8a9V9CMKqxkAfAwsF3hx5STr
	 Uwy2I+nYE7VUetrjtYlG/2ESjJvihS0zS4tEJ15o9juiZkwDnI8KLzdUEQHKcXlWvb7px
	 4H2OC35iUuUd6se0T8EhYOk8EbworeIGWNVYWz7mLt/jaMD8Av4i0Amb4BhP1ikukvX0U
	 JAvN2SH64Oqzbjxp1fmf488qPxXLGc8gB0bjluLwtU1W/Rp8vQgfH69zF6e/k4j2Hjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=BXUfgRghjPNNe0DHCjAC5l6KYOMwmhVeWj5oRXdrpAkEi/lvJRO2EDYkF1ICe5MqGEmu
	 FoVztafoQYZfflQmXMc6geRMA4R3b2ZUPwPEZX4GQzx8B5Dj4dTA33tDW3QDi/WA9bKGb
	 7qWUKG9Ivm8I1TA+bRHfWLIuHedjNWfFwPyGCC7cCaY+HTVYe9cbKJxGlFnCFfA4fSiEB
	 08NMMfc0L838I+1a0+SMFYhkvyaQ0XCVPUOMaJ7xKA/aN/W2BMpfHS//JAMoVdcC2zPDO
	 tRexWw48GmpmXAskXERUuzkNmh2HnMN/S8I+gfHSvfgLqEYquiqRrH3hhOFTPgB2hHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DA60A261C
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23DA60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOSv3086531
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=aSyVet6Wknl1vVSH
	iQ9qWtebjFENHAeMBcSInxE15ffKi8WdamFBvH3XX1OpWp1TeD47ix6vxCfwnp0u
	sQR14us0veByjSJi18rqfxlDv3ctJn/gg2hK5XsWHChxlx5yrydPbAIeTVbvKmxV
	vK4vjhJGCGX1jK08yEGHbPkQ5YkStboR0xLvjzZuDALfAJqgUKebpe05HvpjrnHn
	D0lV9XKtb/IhxIQhK2l38wHA3DzQYV/pPxDNKIx+ChgsRISh1+KtqJ2oZ/1xCz7u
	u34/YTZg6u/omYVqg7bDBgj1UnZ4Uzn7BvYv1U5EZyRamX79PdoTefzctS8ezatg
	ARPRBg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61uvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:50:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0418036bso432461137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623829; x=1794228629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=VPIpzAPxWnHEYDhPoacfaJkUqd1ImMRRXfEprxkym1MUO2Us4oOlechBEdW3M0xZK4
         hZKOoryPvl6xlfATyubXF8nSCzrabEuSuN0h+/pcd5gTWz7Zyd9eP5IyPjVFcVJkbhys
         DzJX8rZDvsn4sudDv3kBCPV4cxWpp0dMxbAyyTYUnJu0plCnBajZmFabM8Bo73ym56PD
         6Jw3vNeZlu2LEgTgoby6HdlOFP9d9caXKWUEgM08LIQ1dh7O3S3seRVJtdqq3I0kXCGH
         NXd/2B2j1PrpWu3wkCp07aeOcKI3y2eVA4TMWRANWthWBTxxRYweiLzV2QiqxW9T5vTb
         8I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623829; x=1794228629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=0Mw6+sXm9AzgES+bCIMWfIKFM+AYTsEkF63ar+8mT91BvM73lNLtMo62RR3k+c9lp5
         koTDMxWCgrwuOn5ZlwhHV7sWus7sZOp06xf34ZXjRwIrrPiLcnLeHHcrpcDtETKwOXqA
         /Vjy4dYlTIkp1FEyfA96ISwmcims1W8PaV7rZTr9xWNAIqqXId8TfzYCtdZaXVXteMOb
         vQrEdtvBQxo2tgnebr5FAMiHeR4vApNS5KwJ/ZTuYgeWxsBKxA1ckRHQLIG8zXHQ7zDj
         NQbZh0OP0MT4CgAjZS9cptDzlc1unKujU9vkGTlVaIXXVD/AFn55REr+p+khGorZEL26
         E1wg==
X-Gm-Message-State: APuU4Z/ap47i1QvOtX+uq1AKzbPysw8ukJa3FBGjtQ5ax1tnWlf8KmY6
	dz9ZByIdQceaE9ebZco3JfUM9bWQv3D/JG8l7d4PPgAKFkxE04SwQLbG3dG3X8HODntDNkQla7n
	TKtzFmAGv9RAGK+yz6614MX3/4eG1EEEdHXFzLnLlg+W2SUOwRyPvJOjbuoveS+HrDvag/YB5tM
	ic
X-Gm-Gg: AYBFou1s4eZdqBV0K8k7eyTz6BUbs4Nzf56BO9VEq5keuxpC2CbjSh2vLkDX/I2dcDg
	1W9+RnVwrFjkGlm56KL8K24QWsmdH+Udbmzp5nSoQpcy/T2ATuMptULoj9DOLcJXTJdgGn780QY
	x2fbTTQX2Uq+GmhSRwA63f2XCP9/eQlRupwNIejZ+2SftYhklMoiAtNzlaqoCK9J2X3lNn8UapB
	R8rZd3jEa7op68duB9PtV/shKSxI+5/o+EQxvJ9yo7E85Gdp5AL1Ul+uxnNpitriw0yiIJ4/Iqq
	GcI+TCGNobPJz4aUTclnca/TTU/jLhxMzf4D1xmVfDBSg8d6CGxWLkiKYtd/wOM2mMUFEcwqJUS
	IMEvIt+3sdnLNAexUImilTA/AP8DLpkyTFWs9pyGG6XWaw91TpcUaC6MjpreimmOeKyRR86xvxZ
	WxNg==
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266941137.32.1793623828862;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266927137.32.1793623828345;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:19 +0100
Subject: [PATCH v9 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-1-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQYP5BQLh2cvFSimCvqQmseme4CAWihk33m
 uO2LKVbeGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 wzcID/95nJ8RjZY4PzUH2GKTv868dSvroebqFK3p7lP22SfEiXB1sqnnWrSCySvMXrrKimOlUIF
 piI9LNVrX1ZADPKSSn+MXByfOU7apU+Fx3DNrIkzhfxdbbqgca+bchuOn4XvQivDW16lKOLwGXr
 bTQmV3ENumiD6870UxTvbajqF67oWYk5xA06IWL7YpiUct9coJtl/jEiFAnf31N/jHB3JzIDhFw
 0sXR73SJ2eAqHE32V9bmbK0EgNBuUG3qU0A0pcCnkp97w9tGt2uyRb4BZVTUAxu2/v3DFdtwuGt
 63eRy4yDOFCRs/uQgGFsiFMSa9s7SwkK8NsIdoUAYamoWF1gDsIqD60fJht6FDDgzXMf+vUmTej
 qjlOBviUu0I4Wo/v7kNlcBxBVFIJB708ZOpE3kt2LkusC6mm4bDvMuzMNUDyEZ6q8NAGP9zYzj4
 +q8bm+k4a8IerZCk6TkmCdtP+V8emF05R7eNNcbISVSD23RpZoZUd8bkIn+C3kcYiBY7GJOhcFL
 wvbp5mhniCupdys6lQfPvkCYPrfv8ezaQgb7fPK7tmnYu4qWvBtccEdQzRMQLx5b1pR7pOC2rYn
 QUO/CI0uuIeGzxFhHk5PscrELQsuvmeMc6MU1xNCC3m1aDkiCrqceHXJGUfZLjAfWJ56nuVSBnb
 Q/xQTv9O1tcBcKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mn9EW-uFLE2jwn8_KokhCCLwQGXYipSV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX7NxnVp2G4Bbt
 G4EQ8D55co2smhfbGjk1OYsV+LVI//Aqgb24rIygL2HTeppEmhj0D2Mele3ayRcLgYgqVxW6mjo
 zqD/GbViwzsKz9RneP9SFDgRXgb6gSE=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae88715 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXznipGK4Ix/yi
 clltLEZO6937/w+olhmrxTl0z4QQgSbF/VFttSsa0B5JRxhTSN6JdmdCf/c1K2vYrZieIIZgWnD
 0ygA/CBF+bdLzXkpyRaApXFJfvdVWQicyHQrCYFnj1qDrRKMczG/uKIYjNx3JBDEi7RWdqb7VMn
 +b4lgBlWIpaKUXxr34u0nyKHjMGNkFswfjs4+y5qd2gTajz5fxCGQ80U90iZ+qaMal8PdO9VwX0
 aVTYw7uPSaHPtuvuCgrgkWGQKqOwd+9VrK1TYBXjdOwfSBEhtuA1ryCd2O49wAVszSvq8Vnbgqq
 RUwkbsVDYbxHISd4PJIGlelycwXxX8Ku/FvvwHC22b+EeFIXgckb6MR89NqjdX8GVXgBgkGWat2
 jd/neXBtKFrVtM+qkBsyOcJOufcz1chWPbOQmPDps8z85R+rDyyNNlbu54eC+f3icla/bpAcm1z
 erpTQjT70GjLKY8DfLQ==
X-Proofpoint-GUID: mn9EW-uFLE2jwn8_KokhCCLwQGXYipSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

