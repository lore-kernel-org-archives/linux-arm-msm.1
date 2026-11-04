Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788697;
	b=mTzM+bSLYp0vtodvz53qn36tRepTRDkT3kKzsVDmACZmSnHC+12bb+YwasCJv9xg5psv
	 AuwhXLyXTf0K+/US5UIG9t9UQBaWK3cK7ROtMCkmnjnKczrLt79l2tyWdjObc3ZcScNLx
	 ssZiJNL7LqWeTFb5FN/EUSX8+1fV1PxjUdf8JFD0HSCCDukNleEtgnAzM2aenAzsaROoL
	 UE9X8crtmP7SetPo5Cbi2AsxVpEAZzkR9ODmP94sybjzGwwjyWZBv+Jr4kMELtKSgeZ7m
	 7eRG9XjHDax/0Tf6iqEFV6EK4utlNOePrWwtowe6wg+ceMwMMqXBJuSpmA1TGh+nz0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=Cj2itK+GJihcLEFalVnFLE+LSbdXNibi4UEMx9DJietPb8wgDqMYIkfYvUZ5a3Cnfm1L
	 2pxY2Cqgw39eFEXO/fVI0bjy0nov29PJd6TyxdEqtIIBeH1GpFU/y/FX93Hs5KzADRrbl
	 z/DyKj9DHQAsxrDMLwHJowoo6bO/El2CSsbmy3khdw9E3Ys3Mr0V7bnh6/21Fv/j+TdU4
	 w4ph3ZVdvjr0H/yM4jyeXHDDO8w9ESxvsN3bleGqyNyq1Fmug7qe3xQQd9Ot2i4TnEau8
	 FE7pgwxElKnTwqPZ6SuES6WMAKIL5Y+yUZLPn7bM/LXk56d2x1JiooBKjdHEDPEFeSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fCpgCmzX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D5E606D80B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 10:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D5E606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KIAKT3p0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fCpgCmzX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KNfQ2290379
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 10:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=KIAKT3p0JgbizLPl
	KeNnVMorCDKUb27upVBlhan5k+GCzI7KK9OJDpOx79wqWbu3SNAfq4/lKJGqXBn2
	oPYqnPgbD0Ody4D/V3Arytd0ho6+3hX9tC0DMad0d+YL7poek3GwE74+7aZFklYg
	gFqsxBmh0OzV7Ow4zaO5mrrdB88jhjNpyc03BhSkNiqvM2wCPN6+z5GisjZ0ahEN
	jszIcpaorErxrx4dQ03moZBjcEMyaDMHoay56T4ELr6Qtlfc2Qw24dnIbIWkGKN2
	wXZbo96G7hOV6LcBKkm00+MZrqzFKrSZWLC0GOIRT/4Gi2pDnOKg8TQjP5orjhP+
	w0l/xQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvaxh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 10:38:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806756ea40so510618241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788695; x=1794393495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=fCpgCmzXVohKWONXWjlSvUAKFlvu76MbAHo2hcALTBOd8M2cjghn9xYZcbN5c12wEl
         /ty2mZMgdScvQkZBYJW6z7EFlgCGpLaErJ/9BPUMhQ0VmkrXhawlnrwdPIg1o3PVv1Pb
         eS3salKphrLcARJkQKPJY1RO4QtfKIyW3iILXulS1zNwn7gsADmbVIpbQ5Lbx4X6peBo
         OoM1VaLFloyE+0rstYVUQVbfG7IjWwsbEBGTgzilLUzj39ei0DseQPV9PQrkR9kT8LOe
         Ih4n6NzFih5Bnb+dBao9Mw1EcaTJoAktoQbXkm0YFXK9AbAsKX5fkJBMairWKRVfU9PG
         XJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788695; x=1794393495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=tI7hFgM5pmVR8u6vGXcCnJSIEA6+5eBbN+8OOsOt0vCGwxarJvwgfHQU7iEjQ6UJeg
         bEdJUQlCDPoua69OyvUTSp/oyHC5NNTsBQJlrIXEl5ctToiB8Q/pMo38ngG2pExk4OyO
         j1+bug2C26gTRtnJsAiKj5rVUfkz1I679XN1q+ELmr/upat4ElX4gTh50AQHlvEANcG8
         apKFTjytlqzL9b7fJKcX3WHtNxoGhobtuaArtTN3nHLfSH0XW1cXXchjfsXwQ8WyC1PB
         NL7wBzZMpG6/Xu6eNb4mvmE0dcVK6NTizvo5INGmoppS/8PAKfd/Qk6mesp2rExW77JF
         VYGQ==
X-Gm-Message-State: APuU4Z8Y9q3d4nRigR390IBxZoavcPybJ4s9x4jn5XxKL8tqqBmAwpY7
	nWikcclXIuvM5K1z0OG2wD6dnip7Zui4IkHErBORihi5ZUh6xzGVCZRn06astO6toh1WKblndZN
	pAiGnmIWMMKBKM5U3zjyRpyNJWRDlqFO635gmO/0/bhHxx+lmwRB0Rxwu6e0bpUPKaomp
X-Gm-Gg: AYBFou3PhaVpY6dmPuunM+xGyugomC0shniEsQlcRiNth+Nt+bwJhD4TfU/Q+6RBrw5
	k23yrLbGn+Bz669939cOOoka+tIbT7uYCL6nNQvOZt0ndNo1vl2saMpI6rOWr8PQlArQwXuHw3x
	+/lbAB8RKPvw+IxaqJqDLEvzhMNJLaIdL0FzxM7ZKgTHJyV1efx9wHWP1i2Tb2qnjovmkHZ/du7
	Ggdd3X7XIG67rTdbwd4CQ0twlso1p2oGQffsw7C4Nt8uA12Z0vX5+WQW8yx/Q4OzmjvFySKd99b
	oqJeVHHBpPikKH2bAfr5vOrlaeeKEbfyTWkhNoDdtn0LQVEJoY5m5cpioqmdZ1MIZjVOryYD8iV
	4+SYVjoUZCtWLr/qgIb+RveSJZsDPLmMI8XHNivq+lGSFJ7uvEUyQQW1orNK8wxTZgcxjNADeBi
	+mMA==
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323444137.20.1793788694617;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
X-Received: by 2002:a05:6102:c01:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d072c596c4mr6323434137.20.1793788694170;
        Wed, 04 Nov 2026 02:38:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:08 +0100
Subject: [PATCH v11 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-1-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSdij8MwidL5YjreXSe2x/t7F1YjSi2702i
 2Ue5AlVbBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w6iLD/0Qnc30/hEW+C4AMO6KkDdtwTYy0Mnu84FJRZ8lkcG9jxso1Yb6sNokAKXPdivTOY1b5qA
 SzZx3ok6/Tv8EAxffEZd6Ot0Th+AeCje75lIwa5Qg6StH4uDRgbFC8B/S8XBQ/xq2vpQYELyj7x
 n3TnzU/WpveS3QZH37BMrqrFNuavU5j34sET+Zv+05wASgblseGSRIi7rfMZ/I8ItOa011S5AnE
 531NHfZSOL3oGllUyZI6tTXx6qjs4roprq9ckruGj+Xi35svZrlAAjE42Q6phXZULr+GdOSfnvF
 05h84/npTVb+c/4G98oXBea4ZjCguQMW7I2aTXYya8VH+Mww4YSpYxui1KV+u3q6zKO0wF5CG+2
 xSfEWyNsz8voTm3bufSa9n8zhCP0579p1NYs3lTXob48esDH1Zf6gL0HsbM6/7KJ3g1w6CYu/jM
 kB4djqL26gTe8UHZuNR39P1LWc1waenLDd96wnRSks10RM2FrVOkahCi2qEHCrHHdH4hkSy+RSN
 iNkOLElB+ZhZtSJDDuo6+kAKkrSvQcZJXl525wWnqUFE8uqxwzDI6+dR0gyuaOKiC9EhrLjZ52l
 egrBu54qeXkd/buod/hGnmpPGk52Vmze+0sNiCRs3WI+aVVhQj4Favtuz77QzpD6T4Gl2d9Gj3v
 WvB6/EVGL0kppzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb0b17 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: gwdothLobtSFPGcEFMnSlkNteu4m657s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX+mS/Pi2OfEY3
 6Yn0ZhyQwMuIqoezLckvJKntJSzyjl4x6I1tU0iQIQ/Lb1I+kVt/Frfm+p/0h4FEQoHIN9bZRV5
 TDETjc1XUSk1UUiRLq6vhto6Ok8eC2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX94BHizg+yFyl
 bZIEJuFnf8ul/cDBTytBXbrvbzjw0olxPAfvwNqjNaH9oANG6xNxkeHXR0DUcXDQE7rd33wC508
 tnN0+wa0mprlJfl2oCONU7LR2qOhlR+ijtlwCcuZIEFwGFOf6JlkyxlcgehcsO3KwL6GNzegyKF
 SBC2aFdROE5OM43z/N0CmA6dYSfhCUdSaHecI0rcG6uZR5eFBwTF+4Evs+l8YcDrp2J8VnNI0tA
 kuUZiRKDDM4yDmslUO6NuJqyVb9cGLFQ8QwM5iaFKHawHVuzPrGS9UINhicUfWjEeibh7Mh5lFp
 n43VQAwdLYsqD0PnjjGhPyfyc53jp2se6l8KlaJp8ZWVgEWgEWjOQ9cNaNVpGBxU9rwQDRTxlyc
 EVn3FPJhSEbhNM8xW/9qwC1nBkjTJoXUEPUV9PJBPtWJoHXqnSyfeLy/I5LffFa3wqtSgounpyT
 zPM1Yrh922fKWeLAGxw==
X-Proofpoint-GUID: gwdothLobtSFPGcEFMnSlkNteu4m657s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

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

