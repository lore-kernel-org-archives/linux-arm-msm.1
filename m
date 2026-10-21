Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592654;
	b=xkecXzRqBhva92O7uZrZo/YrZXMkmQIuhMYk5DEO5F6KSV6snasRsUNdKdXravGzJTOv
	 4Mr04z9FlOYiij/xO8tPxmpyqBlDFfxrZlNxKcn2xn4H5dO41hUg+A0tDUygohtsAxxQ6
	 G/Jf6KIkjWStYwy9Go4+LDlnyZ7mSF06opox2Fu+cH/zZjP/YjLCsFwtT7tGrBlaOvmBm
	 NoIecGchC3qSjGNGlTUFQJ4P++gy/lPN0wlaMFhItm7ng3CTpmAa1DZWllXPOO20IFoZV
	 qwmLNfVON9RBBl+XgQ4d6EAEJF5uOYVy4jVQPxEYnRRuwPdFwWHzyJPUgpyTqQNulVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=4pIO2ULNW8SLr89ZZzXl+4aIbH72mLQR6M1Rqrn5+qUsIxAx2W/4gkfnvWQthrC/anAK
	 TzpAC+AxhuuyACJyTySkSesucXcTJLlGrub1GQ+EIu3zow4yIOqBP4TEfQesGR5mtmCxW
	 AJr8cZSx6YFpIrU6zKkLdkIv6mo9Jg7r+Joomm++LSJsDvT92kQPfmQJwJMLNYyyUHF3a
	 rsGNL6bjPWB/Y+azqwru75VTl1wqR21RxSLQzpxA3wvNc8z8Frah3vnRYsFVguhlFka4q
	 y2lry+qWv44UadjHBReeyTn268yRhzBpCNCTsvR+rm+J5qFQP4CDnLlsbJpnbe00pJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAs1QUKt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EAE606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2EAE606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAs1QUKt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFDj71902859
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=BfZscyGrg7TFIUnD
	e61YRUCkXaG1Eq+H3lByJAk960/DDpm4zo70/S+jxN8BfKh8uu/K/UYvjymVVGa8
	oYNiL3bLtnKb2Ex1qDLGnyUbA6DM56FdjMt2Kw40pI/wKOufWwk4ivfdqKYFxQA4
	w0ilK1mo1p+pGOSXbidI8M+o3+GoW9qbcAIiUe1jAp5F9//bi1A5PU2YAW8JCE0X
	k11Dxl17UXFenFAULPiwGxrKEpv9OKQMybKy2kOxep8lEkOVFfA+wmzDYjaW0/if
	mcXgqDy2avYqIOTw4rFk/2gbWn8u/1EBJs165Vm47uxyfoorjszrxr/4r9og+r9e
	Tklxrw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4vbyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so682726137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592651; x=1793197451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=WAs1QUKthDot+N2mEjCjt3p0X1EjJMKtjjcyWkyp5yNa8yDt5h4YQ6CsuqjIb6Gq/R
         cdriR//lwDwLVDHRvjmEwj1+5DEtWM4ioxi301HuwZVNmd2MEZ6qo3nhT5CGwQsjLyOv
         fb2v8+56O8LIrdZVL9/9hgIQI4jix423OdZ5CWMPPbdnvXgrwPBrXGOLhlfPQFLPZP8F
         lxegQZ+r7as7ImIpOEEcsrevG3l93Wk1IlIo85QauBzc7/3TpKRbfr5Hz13BV62jXg7V
         /lCzHXSFGwFjF9ZRV3s4cOmoMFpCuDXPNyEFbjblMardNzz3XvQdBOGV+rvSO3T66kIU
         XRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592651; x=1793197451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=hiOpuZai2QiDC6gbKpkeLyMa7wM2rqZTJ1H2ZVMnPlhQ63K1m50yv+3qzCgR8NJz7x
         DlSs4UJZNVWSjz++OdUUQVPC2UtMEbWxzweNz8i9Q93UEbhr+l9JiDdCYkz3Sn6+2je4
         LWlaez8hYndQJs5rx5R7HBA1vLuwPBmuAW2N87SdDU0ajqDyHchQ+X9jWWP8EL61+Rls
         rMiuuf9IKIRoapDSfrIr3paeW7TqIYBZ3i3bXfbZNwnimkTM6+ypAxRZtxplSWSLSyE7
         ufCid4Ex0VsIveaKqqUYlEeFghNOjCdhMI1g51U9fpuXX1Kip7cpWVUA/55dpGmR3i/Y
         JnVw==
X-Gm-Message-State: AFq9FYJy/zscnfilr0qDuzXYxfx5ebCY9a9++d4xKYT3TJRepA9Evrwf
	zb6e2noJyRgYuTFbSlGsrwtvgNPKzHzMd82afpYhyeWkKNjAXKusDXrs3oteSgydPgET91OFjmx
	rLTuOzIMAlvxH3nM9ZR5xHuHMTsAnWGM4NGfZ0FcpdKDIvDTaC2gyFzarl8rXbILkhyLm
X-Gm-Gg: AYBFou0ZrIJsFenKDSi8XBbP09RPePM1UFJaEn8upuS4ExT7Qr/iY/jFd9bDIKj5U+k
	3ck5IgfGMW+7tp1+Dht8dTDpyOzs7nYXdjvrLjO4QTZcGUbqctCijqOv+yZoALpkE7zxk813TfG
	yawgUh4EyLqR/JDU1QoDqR31HrlFh5hKPhpLTuxp4873qp1IYgJ8xtrgiWUPiXMn1YAXoNaLhMV
	s4XldFQYF4z8IcGiZidAHN/Sa3QdEmfZmSan2lYuWP6PEOYig9lUaqo8V6iKX7BqjW27jrbd2H4
	gOsXLsrBq4tg7+p6VnRGGVSndq0+Y8LMkLG+wPdB6DfIvVw93pvIIarFAnSDLf5Sh1aKZ8+hHxs
	z/fnu59zMgTDXfrs6fOntS5fDGY+q
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882845137.26.1792592651326;
        Wed, 21 Oct 2026 07:24:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882827137.26.1792592650774;
        Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:23:59 +0200
Subject: [PATCH v6 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-1-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsG5y2UNJTBlBqqyoLJP2yhTFZnAFAZ1/Yj9
 WAWUPBa+VeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w7UdD/952bR21nlyJuf5dQAzdXPZyquoZ2HI9/zFQUmfKVwMNR9QmyxWpqmgfxpoE26sFczcbyR
 HWizCGYjdEnA1V/i2Fvdb8KCZQ/amEvTe4MQD7V5UiscoHIQdHcXD7ZhdhwrEgAkDtidZBX/KaN
 GwO9F4dthL0wpmRKe6+w8sTZYAAR8xAWBzXfH0OA58gHR2eHG0EnaspeAD3SWc6gmEueTvLkO7e
 pXkOVoKxdSRtx4xVpr65iHmyyMLAVAQBBNBrDxj7xyoX6LDFVLRrn18rBaZE09VpexKRG+3gFrS
 FrDv4nu2jHkdGds4hzEYKyZyan+uX12Tj8u08uiFuQKR9EgTxMvb/jfYtdRrA7QjX1USEnet73P
 vgeFX0yXdr/0gt8GlwsILsaaIjkqZq88uM0BJWQkrk2SizXgIdhYS6t2vnsP9dCuCdsvwH4dim5
 TSlO9tFGqOiYqkcxmKctdBv/+f7jPefD3WAIV/OtiiZL4YM8QlF81M+UCnXnPvM6WsCEai1TiHA
 Tiu7kiOngHZULeuyJnOq6rzKY6PopAhR2JLE9C//c//M9IxNWJ3SVzIByKLLFBBPqI0QpLQAKfa
 hF8Tc8fgedn4f5e1tOnw06haoLtR7FUsOCHB55NTx5SCyH9JKgJH98ww6CSgRpbj5LI48344wUV
 j5DuTuH7KEnKbcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YrTaKxgbnGGJ4QDY_K367qEXttUDXpYR
X-Proofpoint-GUID: YrTaKxgbnGGJ4QDY_K367qEXttUDXpYR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/35BIzCDy8Se
 pXxgQ8bB3+jzSkwBW6l3NC3/Q2J1u4Nh2QgKLOb2mi3+zk4BSbGpEPYNPBlQPNLVB2bJ+BhVj3+
 i6N9c4Jb6gNweAFclYNW9pnZP94Vwds=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad8cb0c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXwBpp1hXoIDIC
 IhKYvG0NMwxzgQtJDBARgTjDtPxBr3vFr1YGqBCva3LkFRMj88gqWN94N1NVvMfO7cBrTY260NQ
 SQgkYdUg8D4xmF/tyC/u8NNXMuD0vecE/dbLkwL/2j3DWZhNVE2J9hj9F/5lwDGZxQ8Ughc5K4d
 E2P/EysWfEqMBE4H3OSVoAIACQ2LOJRq+InUamjLAIP5HZ1WTTGRQB0oLKrF9iBQ6llfChuE7g1
 i92dmFTI0sf/+PFc9SHGqyWdf4XLFpn2TX7gBCSuRzbTxY7OQcwBI1jsXQq32Gmc7FGlmfPJg3f
 nAsOHrfVOaU3wbNHMq2XR6sL++t0bYsp6o2UnouYuUeQYKB89U2cWq7eKXVYhdEh8Ex9NncyROG
 +xeoYdmHFuIUr+jb8vUSkbyZNtHrqIWL3dm7H877EnCnG+WQNnhDo+23oH69tSn+R+hvq/i9/2y
 VRZWeOEATkwGRP9IbIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

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

