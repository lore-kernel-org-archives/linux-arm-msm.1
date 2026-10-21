Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592657;
	b=j6TSb7/FLp7Q2wIB9aS/1HfM/q4aOuRWXdeY8hCTDXn9bEOq9AV3NHtYZ5Ldk5TyaHte
	 c3RLMk25vJM7OauJWlAM0W1N7WKT/7FAoYOwKDtNFZnrEUOCpWgHZf+LoGrp6fP2b7cui
	 pecpC+8kK5/jYGEZ5n7aUC5hmSZAFjThJB/2/QKWonkVvktdXAJWxePgr7Fv30OkgJcmI
	 RVpV51mCv2Vg81n56E/5EUhn4frDlv0OUIZ8bbmo7M+ujfYxo6Nd35ACoj4DswLXhCsDz
	 gALTnhbJdYpY17vdhMRBOsUrtu5fcIQv8zb4SL8j2A5beL7sA6muWN++lSAiDuzmwFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=ga0WSe2QoPJ2pB982whfFyR6I485KPr5YcS3BJ+al2GxDbxJWTqKZyas13BXirZDA7c/
	 cx5DpVKkzXbhjYDqzLxD3xRc3UtPwEQovNLkSW/eFujfqU5kEw6biBuPGIZai+2mI5QOb
	 z6IiRqOjOnXRMV0xIs/2zGlmy0G5+YHmRmBOdqwGsLYUiicdLU3O2C/v+xTpGfIo9/uLM
	 NBjP0TumTViKm4sBN1TobOKzrYwza2Ls5MdI4v4SSFu30DTMp2iWS5t/lC+O8ucgXJ6+t
	 BlJNBjxSzW7hWJkf53rD6qaLgRkTZR4hKtXEqeEkA0X+EfhBrEo0bhE/GbKeuB2mqFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KV9IkI6a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJg1RWkt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F6F60A2602
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F6F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KV9IkI6a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJg1RWkt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFZRB3994126
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=KV9IkI6aZGbWwOcF
	p2Dfo6ODV0xohNyFrAaisrUphelpn/odxb76U1BU6WY1KUi8JQrVgnf2PWINsotC
	V4jn7D57H1bJkz+Fh82WB5ZWzjMNNDDeaRWzLgcsDbry/39yCmJjVJzssKdVNjxL
	Yw1cjQMviC1lve5/s1wUz0z1R8Y4GkSDLWPDWso8M2RzPdF2qZxr8Q7pKeZQmOeP
	rZZzZ2qf6Fgq3s3nbH0f9yBDCKi4WaQZNo3pzabLKy5O3cj0cvjuOdjebUORiSBI
	0R73CqFZy6UfFUv8nMSU9zBvG6gQYzqysGNYynY10H3JubszleL/IVrCfOdp4kOt
	HKKs9Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:24:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso189898137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592655; x=1793197455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=AJg1RWkteH82Aay65Nys6pUDjEXT+8rscchdyNg3sR/a9qrIgB6MOhLJGeA39eQQwS
         kSvt5DLduMXAIQrA6MvT8tJCdnNNwlU/EHJGMgu6P31jyJ3qhpIPWVkf8b9oHRhbyUF1
         coFpzfkXOBD90n1SbhHglNsyPUh9bKh5aSUa508pA4IlOjjYztoxp7Z6tuaWQQP6kxqG
         n5ntcNrofAepvHoW6mssXzqj6+g9QUVfowcDBslVa7UuZeXuHfYs3tCFtIkaWTy8rL6s
         lbKODFoAh+8n6SzWIutAQJImuqr7sQIc6Q332UjQZchzwIr5oV7+uQ5FVkr1ooKEiFVn
         N9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592655; x=1793197455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=Y9ymqdj++imgj5kpV1bTImgHvVru7833evwafSNbcPnOtgAnAwkZlU7FuqZaSf7sGy
         q5mvb6leCyrgzifW18+F8f7u664GJJSQV5Ygo7jW6XcuzS6/Tu4URO3g5qZkfp+VF27S
         /w2F+0jJNuHU9pDpFY2phx3xGXmWqkzUr0fyp5C3vdbLP7ZroLwtFmv0fpDqr9BS89if
         X7k8A1Bwk85acO0utmI1FJeN5NO2uKiqouce3ybJI3W6isd+94I4nGL27fHeYoTVZpFP
         IEHeA4wjGR6yzdbp1IIUXeNpYI5sAnI1jzOj7LXmKFaRU5oNxATl/Njlpl86ZvQqCvJH
         WBKw==
X-Gm-Message-State: AFq9FYKxjvoEnzSJlq2rViVg8ZPjgDy5Zf7lpupgIfc7T8R4GROWhyi6
	aCl1oeKZc/7lg/btXIstlWhjG3S8kNbyTb4CGM08g5K1UrMONQSGNbR2Bz5VvbBRdnbZs80qPev
	eIJUvOVyVJthVYkUs4T8q1heFIa2z7Lv4Hzdpa+PzpFu/wtnLwssy67sPijl18+q9P2JW
X-Gm-Gg: AYBFou1Me7YccVAhTdSghlOGKzQzZM0aepzrw3xLWqekDRFo1/98cyAYRzyXh+A9UT/
	4XwrbX+9/4keISFXQ5jE5+V6ZzAekSxc65TfUmc4PKkDiYvtoefUI+OCtElX0R61mZiRCI9pPvV
	ZCLduhq+ogfmlF8zd4QooelaMlw9Wnzp+yE+H1LWjcRu8atxEhouFq9Mb99eYMae3bACdIXHJXF
	y1plCv3IR+bZGC3oVswKS4bIipGUKJBga6karOrbaz5G/YSKWOI0dOQHOYm4jrCQiqMVLbSjt+x
	3E5dVOMP+7WPuRmbJInqwTzRZi5hRomD9qFm8AiIGZ+JnwmoJoNAfpx1BpcC6SOpijpE2J1mr8C
	COlQdQKwa07tpKSmLx9YO7jPhPIhJ
X-Received: by 2002:a67:e105:0:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7cc9f01138cmr353464137.1.1792592654703;
        Wed, 21 Oct 2026 07:24:14 -0700 (PDT)
X-Received: by 2002:a67:e105:0:b0:7cc:9f01:1378 with SMTP id ada2fe7eead31-7cc9f01138cmr353451137.1.1792592654080;
        Wed, 21 Oct 2026 07:24:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:24:01 +0200
Subject: [PATCH v6 3/5] gpio: shared: unwind partial failures in
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-3-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsGlu81L5Y1DM/aprxNqDhwnqEGyxmnPX6ty
 0rTU3eK2QSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w1uoD/9PNlt/C97cUGxf3g+4k2zPmBqF/MvPhB5PPvI8HVJDMzT8U0mzy/1XCfjfUCOGnbKGi6s
 v75al8f6LB9ad7rmQ22QpJUUsul4R4X+IIK8MI/7RpPo6UOFM+ldw8xeoIo5W+GBYrLyKKSZqXD
 npZj11XjrQ9e89892RMn2gW/e60nxOLCAOw9L+Hhhy+S0BakqQNy0g7USKvYiDjX/FyhSTpl68p
 4aUF7JdtzgqpxL8yz88jgHwscigkna/RrsD213AxjDaIctXhcqo5ha7hrR1Yu/PkpoEKZkdZP3B
 DVy9UMtmEpFG18XEAJpjzNCTEP4mrfMt+LBShJZMljE2kZQZAQ6IqxhvNHkn0Q46W2UE1LCnajv
 fmcmbh6ef7JAZ2/IMB1ngfoasQA+YRAcBolHwnTaZuh4uNWSfkenw4gYg7QWUdpBPMbjlK6aOjo
 S6XXtL9i0sfyZPxfDjkDenlmBoszh0NtMjdg9Kq9B2bSQ9XKGDVkjadBOnfo7LIASkkyisBR6Xg
 lSow+jz3FRw1TzHZZdhHoJO+BGoKwGjBZ5al8szRJGhjphWnObwLYWcy5C3oWgKKKsqUYZ4OGzh
 o7xJ0FD30LJWi+GmGpoOWfENy6HhfNB1LE73GW5ne4PczXvjUP+2ze5z0mzyFyJlEe8kSQXiTYE
 lDk7aYo5eEnXedQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+lOc5szw+ja+
 NJ0ZNY3tE4crAkxzLZfUU0XVc7a7dv4sg6HkMqfUPb39jATj/ViwX5tCWs5SskjpysUcf3jDU/R
 o/6T3P4QFwszNjamifxSIz62OghCGdQ=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8cb0f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: emYk0b273rMGPJhLRvcQAsNK1aImFizf
X-Proofpoint-ORIG-GUID: emYk0b273rMGPJhLRvcQAsNK1aImFizf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX+2vcrU52FLux
 QaENlQ8a4VqvFrGiTH79vMq5Nbt2fw9scd0QB7y1u/INdvUAjzPwJ/CMtSQVMq/Q5qqZFKr9gC3
 WI+gz2RHZ/efC7PqsKl8HR2Yxg/8PAYAeNYr+Akp/+JUH35E+NvchnpTy+6YoQ+7VoOTNO/YKrs
 eAqu6qRhfSd1bTHYhTRu9svyB4QY9XXJABwomECRfLckhOqHf+YhrO8PX2Ki0gvgXP+RTrMDyXI
 PSddtdKs2TK/o3pgKekeBRvg8IIH586wEaUM3mDn53bKAyYM1B5zlDToy2EuAplpDlk+mAw5gJ/
 Qi+pBug9h4+Rah5umlK7Dt9TmYwaEdHC1qIPVJHUnFghZCN6QXl88kYc+ETcn7APkhXOx7nT0NC
 qh/BGQbgEkZCTUfa88qKrMG10E4FNlVoBxM3m14361mkG/WmLUCbwR+Q9hCKPTvbKEisrAPAalI
 jlDzCSEvFNNuj1ASLVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

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
 drivers/gpio/gpiolib-shared.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 47b434db72f1ebd35ec36ebdb35f30809f4522f2..043d5daba7a73062151a089b3ee8ccdac726f221 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 ref->con_id ?: "(none)");
 
 		ret = gpio_shared_make_adev(gdev, entry, ref);
-		if (ret) {
-			gpiod_free_commit(desc);
-			return ret;
-		}
+		if (ret)
+			goto err_out;
 	}
 
 	return 0;
+
+err_out:
+	gpiod_free_commit(desc);
+	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+		gpio_shared_remove_adev(&ref->adev);
+
+	return ret;
+}
+
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -624,18 +636,23 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
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
 		if (ret)
-			return ret;
+			goto err_unwind;
 	}
 
 	return 0;
+
+err_unwind:
+	list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+		if (gpio_shared_entry_needs_setup(gdev, entry))
+			gpio_shared_teardown_entry(gdev, entry);
+	}
+
+	return ret;
 }
 
 void gpio_device_teardown_shared(struct gpio_device *gdev)

-- 
2.47.3

