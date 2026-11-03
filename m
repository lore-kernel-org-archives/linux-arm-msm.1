Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708485;
	b=JscEsPZ/3+XjABOBN+9uuOGEUp2jfRysTOWXq3wjLlpDMMTnq/zB/lBLShrMfWmbq+HH
	 dTVUZbRWDqTlz6fpo9cPRtp80n4B2z2BQ7bomGd62T1ZjsvW/WXUvyUMARSNfNZ5JEXMa
	 9Y5X4xspGM9srSPmp+JP7/ossjOekRpz/yZB66ONpJlEstQAN694US1VlRHavfMnzurvT
	 oeiY00IaW8fWvGq2GUSj3itllXcrqb6ALLksZ03DadnhggbuQuDBdPr3ycGp2VQZCa2dF
	 ORjDYWr15+HdhyRSvzUVPSacpFCoLaZI8RavkZJDWgqH43BPmirv8MA9RXRx3uxGoWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=WcOAmbozbcgIsryQNE8cmcnp/VDfUURt7KPzn3hCfgTgQeQC6AD9DYY3zJqPZprZijln
	 hnWWO4JxYQFVMEND/svVmjRF1EkNIZuv4Jyah6u09h8TVvkL5bG3DdqdAgBcEJQNKWMxa
	 wKAUqInyJ8KMhPOodIqo9zn/X1jhObJwJXnXG371u/qdFyB5hXWKzoPgJmXsMK9Ro7uY5
	 ztvb4eWql6167/8uhpAfK6tLzgX7oOznM37dbzvumzXgqQtRZvUM/BKypdcRG5EOac0Bh
	 JtGGJ+wdmMgg0oUfRTMDdb/A4qljEHRfJmjtsLct2mgRLbz3LClrvoEP8BHseVDZB7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782BB606A337
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 12:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 782BB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAVLJ1594201
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=V6tUbbjPa0AfuqVa
	adIczz3l2IH6zM8HBT0Yzrpxp5KLyf7sZ5pL8Z2/Pk5mInrMYezNfChEaQkdblbW
	CYeym450U/WrPB34oBnANuyvHDFrXB2+X5bYtVQ7GU3lLJawXJZdEsz8zgqV8w99
	9wAZt7yCDzxQW2GtcU5sznawXBgFZVhL7uT6cqEWScQsu18cg32nngvYnWEFWeY9
	jIsCTBH59cUPfcoZ8qj06N6cFA8tw3EKHuTMdBu3k1/Qd/liHj9WpLlmVgIKe7zs
	q9es2NIem1hP89xnXLkbq9AythA7CYbC+wL/rtZZZwSL9xTr5XuqXxDIvlJGAMdO
	JX7Z3g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081unsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:21:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d07a14a71cso3262773137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708483; x=1794313283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=NtqBXbxoZSu8AelhZLuKmJKLzOWvvHojF0f79XTCuED2nNOC5yaVMYzc7xxN3r/WYi
         Ffb9PWgUxAw2stCDnMv9KskMbWzDBmWVb2av9Fqepeh2HCMbWp9OLUn/7kZlUbEkpRO+
         d+c4uaOGoaPn7XU7XUNyLem+Oyyq4CpgTp2YOT0nZKdDFZ6N8qd5rbOBSXxpz5EgV4Z4
         9Zkx6RzzEQk9Zqo6q7PIJoHgJZrJarFMD0ct9x2HBFloGwuMCnOMsN0D89M5PzjZRKAk
         Xl7mkNGJzadjWQ7DyuVCq/yX5YXV2VXxA9OlPkAuSgguRgWtdZME57QWLMCiNbkF2jfd
         OyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708483; x=1794313283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=C/kAqqVFiu1aaT5Z+4XYCFF1Xtep7961oFAm9ZQUxsAvqPNH9LK2GAm5k/5hkFeahR
         YGuThRHWnjRugh7rBIZ9VvYOy6m1dhgUeQucmfcFNiAiTb4KpP8j+fVBDfAWsRfWKywL
         zOnJsss0baL8h4wCzNRLhcl3aQ6XkQIBYbqHZoqMQGuTKdHSuoc6VG0uOd772WsmyX+H
         hRvTnY8GB1+EGS+rd0/hNLPnyUndiTOTXtl0UDYqqEugCbwPtCuTPtxrDNLV5iz3nK8S
         UDRpQd2TQoApo7uRjLXib+VMfCwA3R48f195MPzU2W2Xp2XJH8lWBDIJiyfCpg5Wlfds
         ij1Q==
X-Gm-Message-State: APuU4Z9Tp6UmYHNN9PcFOhFykRjcpQNPDe90EyxrGntC8VzRXMZ/L1+d
	aceY+6laD39ZfEwVqndv46J+Q+0DFj+C5Z89Z7YxFmbtuXiP5lFO+A7ROSz/6hHHowb6aLz4rAS
	4NOBDvsZtjnnav7wnPmomN/XIOMvmV4bZIBUdSbH1N50SFnT/xRZbY78Hp59FmCdCrYPT
X-Gm-Gg: AYBFou2jVoAG5dTWyCxl0uLRx/7jYvA3Z8q2B4FVQT238bZOGwz1FM3TIMzE5eZXdFt
	XeHBSGHsunMVSEQyF3a/MW9Zb9zXtJyt2PVyBEj3pmyYi/Ou4lZbMDush8NmhG5eyd0BtrArVjl
	GsPKCSy/mltq0RkgZivJvOhU2FC1CR1inrTIRkq6wqreZs51nH4oRgSi2pXhJCD8OpxEguyZTZd
	3Bfyi62qYh8imzQSQ4BxJ8gTWr7o+8RBWXqfHdAc1dgeRyl/BZYy7frlGi/KR3he2vIb6iGD/Lj
	qk+aUGE9uiQ5V438zsvWOw6Trq6lNmJ7uXL6YqV2RpSe6xOrRmjjNJH7eKfLSFSqHQDQ3U4CrQ0
	3OF3FF6tOMuHhFdUAlNSXBNg9amiFVgP60EY6UcSvkamL95YaIWRZ482uOhcld3QW0GGVpX45Qt
	ZGlw==
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468454137.16.1793708482677;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468443137.16.1793708482196;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:14 +0100
Subject: [PATCH v10 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-1-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+6wdSPRH1rPuN+UD8TJRPtXlvt0JwY6x+y
 Fz1jdAAJvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w/HHD/42h6ZeqO/+2wIFbZAiCsVqWLIuntzfuCGlmnMpTszctbfmwz7DNx1LHuqo5oQHNaLUVpY
 HL44ss8ggWYUIwCFfLudAWeczX4H9yyPdCxwC31IJpxfaneSnkpCvq3VZxurOs6OwANjCNDqb0o
 gTDIZK8d13ZHI5Z9aJ6qEkERUvlZW/vHMBB4mns4cx/HtcDgS9H540W4c27/pxN9UkbjJVXWhyb
 xbRu/aN+5QTyGp08CflDDqBHaiuyJ76n4eg0Xkz+T83m1AKYtdLbaymp0D0eiIq1RZMgqD8Bclg
 2yJrwX+kViiHyxI06S9BUAVvY8v6GiEBos10PKjdVTKYJNEhwX1q+0kBPZ1vYJeYS9LYzkBIPkR
 yF9DKWRWdQcZJsEDK4kiaMX51kkksdtaHnW8ATgNzuK2JPC/mnxQsI1tpSbAk8l4shypfD63r9F
 wo7lW4dpO2ub+wGcZwQ6Ta2R8F3Y1ZSEe8OC42fYMj+FuSwIDSpdQ21UbTuJhn3Y5WrHQPKyUpf
 oDPpnRUDhd2n0wwR0rcgMlYnNp3zdDaqhhaPdc3aXa5HO4aMUY1/l6NNwfG3qoAX2xuey5HJbm5
 r55bMd+shLnejmlM9ZzOS4hGF69gSOzGkDtYDjTkglU9vXHdEtO/DVi/58XMCdccQZZoKAaq5jk
 hsoic5FijbZhhwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX3rPHcVMfBs3S
 c3Tr/9/b5JpUivY+pikgmb+zPm80Go2zMFbKaDkqqxVpmfpi0XD6qwI24Zzps5R2/s/pM0w7Gmq
 Ww3R926ak/2AB2m2EOv+HQcHMucCu9U=
X-Proofpoint-ORIG-GUID: YjjVR-1CSCume7dy2rwJlQm6eVCkhmLm
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae9d1c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: YjjVR-1CSCume7dy2rwJlQm6eVCkhmLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX2TMLe3qqJUmN
 gbt3WlE6xvfrIyowkvKd8k7X1e9UQb0ErN8XU8cV6tWR9bjdQf13Ar9FL6vOeIc0xX95pap0B6r
 Q0Zs+BAyyE6pBFYaMST3PqvBPg1UW6VaF8TrTy7Z6pWQmhajGA9qG65s28gWRt3JMXqVxi6hEIL
 OEk9T/Ls3o1jOKJqqvGD89wsbD0Di4U2J53b4M/ZlWR/6494ZvwTSDrh6ZAklfSH/yeBInglK4Z
 fetJw1V2b8Drp6TLiuVPvsMZSDG57EO2OjlTGqA+AOoqnsq/FE+AJ1D/E8jdyk8qgFNv85MzMYF
 V9kmM7pyp+7mj6x4joNP8kYkqdBtjTkbXE8LXPcygOXvZPnwUxNvXqa+8S2f1hyuNHmIYw2GFg4
 0mXqRZ474JDGfwbR1d9XVCfFdZ3RMwHWtyquC/eoP+E/gY9v5vDdmcDadDL7/m193ElzUCwQCb1
 YQKJT60rTbOhRC5b9rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

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

