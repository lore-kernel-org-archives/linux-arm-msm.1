Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623834;
	b=ghEMopARyGoIdVITe47B+WR+3kiI7GP8cN6IgzkQzXwDWv6BabJno4mvDLilPHbfrXKF
	 pd3il1mrO3ee4veoqC4G/yfu14b9r6S9hcXKeTwBl6sDfBT2d/AquVrq9bcyy237Xfk+F
	 RhY/7coJP7y5SFYVTWSxwqp1nrKG98KwdUip7phIYbwGE1Ef/fnDrBAtetwajsjALQIQ8
	 siLXBD+0C1kZr85lQJPea/9lejXiO/o4agg+aV3S+aDrd2Uyd0lQW+pNWE5UbNbd8oPoY
	 ctqjgNNiHWCOKHtZv/I+ry7fLmzvoQMiTYVjddHgClI1dZ210VwdeMxu9QX2J5+dFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
	b=4aD65xtCkzbQBo+qHn9T5xXnmhOndOJzc7v6glccRiUZEAv2hx0nWaXqCaOGFsnqGfQ5
	 OxUjCMoP9eicPmq1bjc9sdT0gtofYZu1CF2U5sqbfTwIoal6/7JdCUrgTShyodIswP/D5
	 yr4e7yR4/Goi1NZx8kzKSedtgzq8cOQh9ibTfBC7VFH8t3zrqcIWnLXjqvByt71ZKrVYZ
	 nvdBWlacK7jc9cHXW9+D07etAQLYKyAIpnbwMNRGO6q4A/e6Y4L6uGPCImGj5UJuF+oTX
	 Wq3qLoVmH3ztXp8r+0NQrcRhSfylD84I49XwmSkJ+xyeLf3U/3NC15/PaGDMHbQwjGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dOxRQ0Vi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVEN2hFQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5633560A2606
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5633560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dOxRQ0Vi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVEN2hFQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ABk83430794
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=; b=dOxRQ0VifOOi1Wag
	7EeAXT6rvM5OfKuCga7vXZrG+9b6Am6zl+BoxVwggaAT5ng8ftPt5EopRtE35DFV
	DspYVnHZy+OBJFmiOtk8WH7ChVhOZkon1q7Bd79f0HqDkMXI1ogEVOxvFHI6DzG/
	CU5Pty32PYwB1NXS4Nt3WNPxZQDRdR74gO9XfRjIwXIDS5OcnDGAK0jmGVRLOG4r
	Hv4FZuee59boe0HbqfneECl5XXQvc6bkwMAtJAhX6RqXHwCcN/DZPQ0+nDHFgSSi
	bPMpSM2KUS55O1JoVcSO5cNZQd+sEGIsTKL4fCaPyrZ0NRghh92XEbJm3pCr3upV
	SSBTUA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesb77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:50:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98e3ad6dbb5so569258241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623832; x=1794228632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=TVEN2hFQ/MFUY93zJDjMNQijMKf3kG8uLY2ofZ4zvD9NprGRHiLGz1x2KEWN3/+k/H
         /5fHZuY2CeQVG7Anyzf93yNvWjxnMnWXuqR7lUk+B4+NyfCKevycugdOjhcAY7dSQhQh
         waGk7WCDvCX9r6EZxpsGRv7onN2ar2Z4ZsRJ0mPOXszDjHXTix38tJ8GN/n3QU+tiplm
         tdhau3goPOka65gX9kS/YDC/4Cw5OvQjj+GAJaaS4edh+eXJi7RyFFVV1DMwZZyYyoib
         9w1FW8uu0KHE5A0pTTd7kYZkr6MyvFwdHy08+mFKccBR3CloUWkdZxqkumkDFs/WQZf4
         MTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623832; x=1794228632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=PKaNo16gApe2sZacx4ZBpLa1ODPlSx9rWpcVdBUdU6brx2EQdkKcMwLM1QOpTzjuwB
         L0vCv7gF+5SrXddsIuT56cMiC8yt5F5xYg3dD2xyshlCcRcn+hY+FOAQsoB9n5hzEGmZ
         nQK3IcTVm1I8rCiGriamsB39dFPpeez+dSDHBHKcLBj3Ya/Sr9YIANS+3Mm5D3PCevqP
         FXsWsQmbh2UTizBvIq7+MvtNGbT6+67KrO4ip0NI2ZGfrFpMMj5SzQ8sgvgdIvfaTKJh
         nwbJUHXU9hbn9uQIZnOnGhH4H8deG71bMNpGRmU4bjxxzUTSh3N/r+TLy/cme4+jxlfp
         Fy/A==
X-Gm-Message-State: APuU4Z8tfOlAsgThV02ZlXJn0KTZXAXlBgCV93hOCAJz0p68SzFDR10f
	3LdNTvrpTDgtDVowG4fIHOiA2ytyo/BB/NCyySdG4MehvxHvApi7U6duqnFhfZQ63/xsPv6GPzI
	nCtCtumdQRKTw/0NmbOhJuvkWiMdLfDWh7ShfjIVV7G1SRJ30RJkMcVtbrCeeGw/7MHfY
X-Gm-Gg: AYBFou34tzVZCS7VrKZEGTxrh2Ziu/ojiyjtEypFS78gFj6EMPaIMhS65oiUv40Y6ck
	xe7mIvq8FaPgSnd+/GZpS4Zer/rbUHT4cPnqiSst/D7WIE0J7BYqsG1L3tlReRCuCWR1bCvZSqb
	G9/nQXVh+CB/xGEDkSTtlFKEKuM4JbSPiFixTgLoSWSMBCW8nWlVKHbCptOHNWkR8vgY4xr7Hff
	zkIclWG5m7mNZivhDDrDmbyFOXK8kPsK/GbKhpJUDq0MBOH/NAUSigOuZAsWSiFphZ7uqns+2W4
	Yz4aVN8jVqZ7NaMC1xfp0KsDPDk2YX1YPPb4BgycHbMVF0RkLXsky3CTDb845Mt3gbkLc2ud+9J
	tp1BxmuK9+ZklEthvJBiYUJtaWeVrQvnMQjWILGKXBT5Wnzo9jYHtTdNDBmUulxS/OhZHPcDW0o
	bmfQ==
X-Received: by 2002:a05:6102:e10:b0:7cc:32ce:4c49 with SMTP id ada2fe7eead31-7d07275e5demr2966918137.27.1793623832350;
        Mon, 02 Nov 2026 04:50:32 -0800 (PST)
X-Received: by 2002:a05:6102:e10:b0:7cc:32ce:4c49 with SMTP id ada2fe7eead31-7d07275e5demr2966909137.27.1793623831845;
        Mon, 02 Nov 2026 04:50:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:21 +0100
Subject: [PATCH v9 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-3-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QekYjtrADoWd66GPIisjizU3FTTnaBTEJebZvmRuj4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcRbkgj5+sEUFU82Fh7Z12mvQB9YzCAJXzUZ
 D7qB8ecMp+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEQAKCRAFnS7L/zaE
 w1VSEACOB2FBLuE+dBJtiy/iR+H9gW7LCvnBNCo6RFL4xvyaeyXPMEeVoMlEExwZHpVhvi3TqI5
 A89R86/RNeDikeoX6UCB0i7aEoNOT667qedgxVQZnqjryheeh11ep70kBwugVTgrW+ATZHPrYTF
 sl4QOzwyKeIDkUcaxq12Nap6EKDNDZA7O6kBWrIWt2KavlOAzK3Q1Ep/0umqPkIVBAgXvKk0SCf
 uCFE5bAc90sOMngfBHPh1YaV+fRTR2YYgAzsHaPNjpFxa6mIQnD6V7HV02RpL7mi8tmazXQduGY
 gG/7Epy4lbmkJYGwWB2uXx0BWt2pDlTc4x0xgc6dsp1d1OFiVKuD2fE+kr/E8yGmqFfdyd8zwTg
 1/yhSUQ4Am5OgvgnQuzjSisHTgwl9LwEHL97pSE0aYDQ7xOnBLgG+P/gfrQ9z6PSuG2niqsxViM
 AT9de6KTmJpOSIG8EpHPgNokIpE1/LuM9VrpBYAugWGG83ovwNibxB+6Yjis4PdzTswZtApRlSP
 LDac2Qt8Yi3FLrBcQKRgdo2TgCwSniX6G6wB3wkFoKl84kZNjcj7wdwJxqEbHf+wS02MwVlC81E
 Pv8DebsR+RMZ2w1039/wjCImGFeSe+q/HfcOWTaQUlHZ/hNX7b9paltWF8YPIcNWRJxIruqYWTH
 EiFFQKy+WI5AVbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae88719 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX2LDbkJwaD1Q6
 X+6nB/MTEgkezGycWtF+/vkzbjiZ22iNYIdE1dgAgV3n/I9wO+NybuXLbIG/J3jTtWGbgBl04J1
 2DB20jj37hsx/jJlYch9rRrcp5ymjGE8uwOGsU2MW56dp6XEk00GWpm9p5Ei80VmR4nJUptKHbc
 eVNGrCxtaH9Srfbau9vVkYuhyRbUxgMZfzxV32Ambbq9bPLwwbRJ6J3M5SfKr9a/EAql4uTYOLk
 HHhR+9AjXtDiFRizxcZrxmsir8lydQ/iB4vnzBFNtN7GMDWDSMKSFmyrIwGrVZG0uccM01TOsUe
 /r6j2neHybMoGRW/Tivmj6iL6kyPiXk5iaqcxnuNZxms5gTGgvDfSq44P6VYtEwwZCt5L+1nb2Y
 yJRUd/BtNgULDTCtNUTVkvpokPQu5ZlaMPoEIEV5Q1RNcortodiB7aCNuRGLJv3aBsNSMLUMn+q
 xIhtWDKsqnePjTFNWuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX9ezsRMcwKolm
 8pw67qFMzf010S2LNJVYGtZlXYBb80cK7/u9h7CPvUaS5BqhM9MWnabSV0ZL5pI8ASvwf/qRHiw
 7lmcjLQCqgc3MBWqlgJFOeO/MVFWVY0=
X-Proofpoint-ORIG-GUID: 6qSyqFdglbRc08Dh6j7-WOTnrSpMh7ya
X-Proofpoint-GUID: 6qSyqFdglbRc08Dh6j7-WOTnrSpMh7ya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d..6b183864933870e54780715c4dd9179faf800d09 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -591,6 +591,9 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 		ret = gpio_shared_make_adev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
+			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+				gpio_shared_remove_adev(&ref->adev);
+
 			return ret;
 		}
 	}
@@ -598,6 +601,13 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 	return 0;
 }
 
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -624,15 +634,18 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
-		if (ret)
+		if (ret) {
+			list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+				if (gpio_shared_entry_needs_setup(gdev, entry))
+					gpio_shared_teardown_entry(gdev, entry);
+			}
+
 			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

