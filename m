Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198689;
	b=VV0a8qBm3N+JrJQZiHd+I9o0iRt9QWtWl6zaAbyEGIEqgv8B6+pfnyayST5ReZ6Q8T/N
	 BNPHR+3u/xJiY90EpvMXUdZ+3Q/tKP/wqJuCGorfhdwFfNQ5MWGUN38XOC4KDUM2H+CFa
	 htDhmossVJs85HMJLBa9h/NcZeqMeoyV881bDvjmP/uk/R7rceNTXtuK9omnFAmHnmT2S
	 fjAJnVjVwp8PvqIych7KpxcK1HXmjfhH/eM8L/a2kVvNR6i3EIw3QVZ0BNlCGdrx5I5U9
	 bluaJMsqZJiO2WCGjdkC5UiA+iAz9wNaz/FvJ1fnAYfNjqtRec4HmKVmfGikcNzGZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=OM8T4LwK4dsw9r353piwsQYcPczEs5xbUwUWfNg1qhfAr+2oU7cCg2vckcD1ddiBC1Ae
	 KtA4rDZJ4Q7ZE5XnbzcRY77aEJchPv/ylHcyQt/2t13jWGdd/C0/4YbG/VAam0U/+Sfwz
	 NOBbqCqUkBY8LxWUYijhRojqkfWMy5K6YmI0BB+ZnSfn7PphoYOTG8quX3hfRfIz1Q2ru
	 Gp8K+/2opcYHG6MtkrMNVQdoGtwwLNzroCxUF7x5OLESR9JH/Ft7SLOiONmuukEUxGKg4
	 9Z8415Y8RGu25y0UvAONzqb2NejK/LXt0TkVpN4mmkVSg7qecSvlrvf+3ugL6lHLWxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WowuLDHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sf/mkQoJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB0B60A2600
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB0B60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WowuLDHK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sf/mkQoJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIPW03917216
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=WowuLDHKT94Fl2w1
	eCQgidIbCDVI6oqdlejTjHDTJEB5bHnGtu4kYOF1sE34Ojfilr+6g1USVXdxJPgc
	YYi+gXnHAQUaOe6Qmd/K1vEUqejNOhRGMCT6+4Yu8b/wHT4/9kQy98r6iV+uAegG
	emO9lPXAzUA/N0Vqu36k1e4ZrdSSZbmFpJS/Fw/XcB4I0iRFLbntaOnEI2vZdei0
	Vk5OWJO9dAw2cUERSjZ9DYOr4kGWVnnoYRIsgpwYWRPRc2/QTczU6aMq61oIpGnr
	uMDxVWqgcxqeDzo6Y2lpR5r7Z7HG5qo1p8qHKt7YiZ1smxE//jpzlxUL4+J/pC5G
	7bfSCA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngcf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c861b562eso10414526d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198687; x=1793803487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=Sf/mkQoJPj4sKNI7MASTo9oouUa3Fu9fXfZ/MQpn3vKvXtDTylWJRjOcGsnh5eXJa+
         ngkzFDI3dA6KfTZMDARGJqOni/gxWY90mcVDY6IBDDGf5OqxuPNfIo9W0ovhtrnUdoYj
         LXqQQrjxBnfUttRBcE6M52X0tCnGzp3LUnT7i8GxPj5jXZr09bNb9Ydsbfd2H1Sf1121
         xQPc/mYumbWaPzKqu1WxWiQVh2MwyCa0O9cOl9c32CgGEe+nU5rGRand2nf0iEnaWfhK
         i5h0TRyXiVPPoDvofJ18ORsA7f2JESr66b6VAmhMb8G7C/guiIxowbMZ7e7xmP3dGZ3K
         gB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198687; x=1793803487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=0TB/Vmc5aLU48POF2AFmE2N9Y2K4myVCj71tRYeOb3W5FN8YW4w9g8ezJyGBl4GlUh
         Pvo5+SVTS5nIWjloDgLOLzZmjcwHS8Y6ENbZJCRq/MIDH4ecDrvifjQCdMOI9O4nNHlP
         DfIOQfu7HA4G+WZaBFP+fwy1aiqOyNkrLTm4+SMJ+06nvBscQmbpcz9aFG8J8KDYNY/r
         +c47ZXlC4zzCmJC+WAlTywuJP5cf+rvt14Mz697MfGT7LQXVo6eJcHNgBNHLoP5ynZim
         UyxhZy8iZGhp8tg8Mbv+KcI4T3b0oy3hmYYxWODolz/jYNEPbG3bV0HjXBxrZnzlKNkD
         oSPQ==
X-Gm-Message-State: AFq9FYKzJi+aE9rPhXNGE8/cyRESm+6QhQQm5p2aJ9wzaJS1NoCuZFMV
	VtNlUUkJzzyj/jt8cCpnLfNnOcLbfA0NSGFSfErEUyhWm2aCCLPa8wAXqlaYoQObWyeXwLSUmvA
	W2uBzRECWHD3MUlquY0VFiTowhBH83iI3jA74Zz0yAkypEKGGOcIentKeXB/mjTDHdzMU
X-Gm-Gg: AYBFou22Nu6BGKUdhB1/Mt12Hi4coUVC+D+xYeG3c9oUixCSgwDJTHkvK0m5GDwncTi
	Vf5fur5cSEyu1Ln7uaVpAqJESkIN0dTeS9S5QlvTsclbMamO6RS2my1sv9MnNp837DDPaPNBOkD
	PIl/aaMX8ZDIv4AJBOMco/Ln95ieJ9X8+DYeXHQCSyOCg9z5cHwL9oegkD+9ErKi3CWGwDxdIBd
	Xcsm7e00FLgLpdQVoQ+BqSuSsMx+FTpM2njz8yNw2q19ssTZU+nxThwwYM93D37E6+gn0LPva+u
	CExhQ5nbmXxO7Vr2oOQT5OzWbwLRgGNOhSAnpdJFrmuDSvTlv8f1QSahDmFCdtA+zhVK6jtD+U7
	trBUTm27c1Ui80YIWB7eSzUhZW6O5/zLzJhwTJBErVxxgvZPaqCQt963Lwj3Q6/9krJ1GUENtkE
	dLiQ==
X-Received: by 2002:a05:620a:2995:b0:93e:e1fd:b87f with SMTP id af79cd13be357-94408e0f4f5mr340978185a.83.1793198686643;
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2995:b0:93e:e1fd:b87f with SMTP id af79cd13be357-94408e0f4f5mr340975085a.83.1793198686185;
        Wed, 28 Oct 2026 07:44:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:37 +0100
Subject: [PATCH v7 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-1-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpaXHSqJc9SkCXonaZr2cM1k7K9B+WIJMary
 PcR4LIVnPmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w57EEACgDsPYly5YIzzDY8l15bnEQy5vaow1loPZngor3HUvd6CSl4PAD9INYBxHZ+LxjbTK8jh
 a5geXKNQqMflyE6oTMh4dtIetTUwTPOAeYib/z9TtLt4e14UEzB4D7r+x6WNjxdXzC+g5HMv10R
 GDDgW7jiK5Iz81pteVckhzX+WOvYIv4K50vdo0FF0zj4iss0FaqOgReJ5fB+f8wpTQtiaA0era6
 ZjANFN1owWPMJpK9QcFfO9ZNjJQAXs+LC+4MixWppfkl48N0J2vLlzpCi94uA6NpeyH7UpmdKaG
 GHArhPCS+D/NHtPVN/3VDEa7Yebizn5T+MiDeXsVDSsRb1OHdIkLbCLUYMc2r5YahVS/pHtQAof
 TPLPZCG9kOhQlpUuKt2VY99hwPAwXr3s9bZcwHh18vi24TX+FLLbE/QbwVeBCWsaiuAHW96lgRA
 cICsWIIHBMv+241HVbeZ6nPzF2pS00exaQ7wyfZ+HgObPVFcwEbuvlhM8bb/umJOWd8MtZJSTzn
 CMBRtw8ByxihzPp1U7+a9hrF/7yPR9SrFIoEuQ1vZXpGgWeAd4Meu0VWVDzzvautWtnEEJNt29A
 QD6SQvACQ/qOMIslLgkKQ9Vy3Haj9pBLa0YdmdL8DWXHtryyGdVEudpZaUcXSD1bvV669g7Xooe
 nVYogw58JOJ+KSw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2m2F0u9pAUaYwJUzF9j1XlbjRPpl6WHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX73a7V3T6S0nz
 rHDXp/R9A680bX0JMGmzmVaZNFUXeN7yjAztZ1y2nMBcuRwcqZV0KWp6wWbNICi5PZwfExVheRP
 yXHtX4qJq8vYZ2dk9HstioJalOWoJ/DvWfHdP7RiBVWT4Co+kZm5xN8mxI8BpsPRu1KIcVptKK4
 dFVMt7cbMrUe+UJ5IMj7l4LRT175f4WSL8PiSEgFr84BijKr/CYIktlyKx4iol8sCZJ2re2ClUP
 +akN4A/DcdDzIiHn36sBggzZQ3VaX6/0RtpyNuqvg5tszpXLAtSZEi+2MHCJQyBoSfawdPIlxPr
 WfOSdCFrpBSMyQ5QVOjjuIsnjLpVrn6elfcaQKNgwajni8X1k6KHCPdPP6fvnDunwt9UQOtSz/B
 Q+WMPjQZYSWfudT8oZwr8/S0NBV8PXjz8Jw7ianrLSZiCNzjua3DXmu+/ZmKUqOZP2juRtU6czB
 tbIzeKOdigPixQa4pFQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20a5f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2m2F0u9pAUaYwJUzF9j1XlbjRPpl6WHU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX5ZMau9QMvAwl
 krw/qVa2zX9VRp49QetHnshAnvgnMkSdm46EsX9J12u1duX6rxnjo8EUrTQJIRn0XYWG7sgbX2P
 fFTobmcTsZbtxL+b7I/2qJk96bSUms8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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

