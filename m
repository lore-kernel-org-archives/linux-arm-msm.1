Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290964;
	b=KsKNSgT3FeozYNuPtGHrTXt4L5g637b+ie9+h3bS/WK64277ceYy2sqwcqCSNAz879vi
	 Mq5CMnSJbVvjqzZGeY7yFu+np0kVN5X1sYnYKkTNRAZvhbG4NQQZwRHFaTxDvfrqBxxM9
	 KbKWK1afETqHdlpkIm+wbx7vLlZd22y4hXLZsUMvgSQazftaQdVnxBey7bwYm+XsTeh8g
	 cAoM2D7vxH9a3XdBspVixS6iTqT08gD6xp4uqxo5N9fpRZkpElKa6al9gLBu+SfVuP/3g
	 mHyoqb5lqUyc/SM/01YZOefaQJoMaTNatTEFec6kJ7LwBFAd1nfrW8nV+nUdzdxLd+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290964;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=v9EC+uNYCVRmJGUTI31zZv08Mh42KkgYXQXfhTPj5cM9FLasqIss0JIYpl/WRCS+IbpM
	 lSkAcwCD0kkezRnkLPyTLbHsiWQR/U6ThGhzWtRTPT9H6Ak7bu4tI7NtP6jLoKRiLYyfA
	 5NF8SXDYFSS3hgA0n2KGnqZX0zJDon8VUr5gfOC4Btqj+tw8aF75+4Oo68rpXueO5zWSV
	 IQc4d5bKCxv14ioPhR0S/dhvfE10kYCTAv7sK+x5IGZtu7pNhwPyG8rPFfYMkV08zCUZp
	 oNRFiXC+FeiLUCbTEpXTLt/+Ov3Cvbz9X+/f02sWwvO57Jf3Fc/TDwim9jR7yu1C5Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8Rpor+r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNe2fj0R;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B67606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98B67606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8Rpor+r;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NNe2fj0R
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDIKh1654926
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=l8Rpor+rW09VBJGX
	GxZliXh4q/RDNxUz9qizzbPFjmA3Z0iKQmnIwLnEgVx3eXjpGG+mOAz1LclCBeee
	D42COMBpJmQ8P8tQGiDzU1KeVZ2LYKbtUykYgiHHA9wAtrkadsWq7w2VE2uO92aH
	TKcJ0mtDMDTJsysnDV+q4Yy+DJZwOIzs9N7Sm5Tb/xFt+zAESs4S8V90LYNyrES6
	EntvKRhoWNPTfWkGIk9CkEvnBRHo3R3I5imXkAkXYYrEV/3jsVPsJ1TGeV5akdfU
	Ny2yAtYdlLfQ3DKBCcuE4YQ5i9Y5DQgEEu6FVtzvWDgY+Va50bTcmjTviv/Z443S
	knN4dA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm4a21fyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f2fafeaso287633685a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290962; x=1793895762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=NNe2fj0R5/l5R4gHMIf52D2qI0crk18QV2uzGFHb324k48ZZLdjSuFsUqE94HhPNhm
         L2RMQYZrJ+msJblrcreKkxv5fCFogXgQLOBNv3psl7I4jIj5EclTGUjiSyDUq0JZYYuD
         aluLDA39iBgsSuyOK6ZswtWnPsyMdPrZY/716o4ez/HEnBhETRRoAoawOcgO358/p9Dc
         gAk3hqTgz2nAa7ZCrpkVtK2w/mBUrh6b3tJBrJijkQhZGhQH4iAsRY23lvcnmrQOudEe
         oy9aNrjf7l9Ko3Iq5pPQ7oqVET35ICzFMCDjjXbp4hv3G/JPDnMK0A/nKt4WtKt2rAVC
         9tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290962; x=1793895762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=sIU83msBDOg3F8SO5b1bdEWB2T40uPKQutKnKO4Ivr5z/GybvkZyKsqBwDbGkynGDk
         wTmpwQKFfisO35jGIgY/CBO2+QuKcyweQbmP2dq1qUBreaAzouTjFL33o0T84TKgz/sW
         gVrOyBwok7m9ODqDlC56/TGP3/chUW2+qQbjVqj/dH8G7l2Lr8wvkErRgHMETj2Z6wBh
         6tbPwtbkgOO+FTt3gtHiChgSdOUS4KmruRDDmk5MDz+PHlH99JD5hloTxAYcJUexgYMJ
         ntywjCUOiAIOdHIpA7qjnPR4bsqmtWjZZp8vOOkfBKZfcf645RCe3BYOeLzcHOkckkW3
         7YiA==
X-Gm-Message-State: AFq9FYJbzf9DHPCnQBNdl5iKfQYC65JOJRlqfvWWr/ETLHFu8F+9Izia
	jSnQ1yIrYKEfARgqAgd46rFdT34klL3TD6FKveY1xmpznJ6nalGrKSYdzoxzvBwRaCJTzfSK9b5
	RkwI+d505Pyi09lHAO83vbvclhGmQ8JPCnZa6FjvlmjNBV2nbvv4obhhHuyI+uTxbgbFc
X-Gm-Gg: AYBFou040AKl3b5Y8UmGXVLn4QrLfHCSoOZzcscwH2rkLA1a1dI2UZhJmm4BRLqiqV5
	ciLWiolhBPxZOkyFZQ4Ja7TDtCsEAWJD8amM5lRaSedS0kQR0MBJr05B3O605aZ7AqSBt4yqE5P
	1xsj/OccVqMNJWN5U9nLoeG7GiI2qBuQ+3Y6Ly3RR7rveHjxfz6EpAaclsuFpeXgXE2jz/ombrm
	X4ZnKaTnRv70l7wCinooi48J7g8GamOgMlx5v3oCQHD4uXGRc0AjoJFL0NzOjyyqhEaGX8bYyOx
	byLkrM47f9xhgPMbzCOyRRzXUIZjqAFHh+iyXygPcSl1rX/x1lG9WNudB2iY1InYd50NOHxeUKh
	iwBeePSNORkpNElXFCBiBhNpWeChaVCYzYqmZUcNo9ly2K/SVdUUEbGtjcJux86I21VG5Gohai6
	e66Q==
X-Received: by 2002:a05:620a:469f:b0:93e:653e:6981 with SMTP id af79cd13be357-9440892fd2dmr905468785a.11.1793290961767;
        Thu, 29 Oct 2026 09:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:93e:653e:6981 with SMTP id af79cd13be357-9440892fd2dmr905461585a.11.1793290961012;
        Thu, 29 Oct 2026 09:22:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:32 +0100
Subject: [PATCH v8 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-1-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LM8eg8bQDluHEs2DiZTZS721Wu2K7DVm5Z8
 QvLtHivDiSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w9hAD/40BpnJhNmZwmpTh3I4LWaGEfhyxAyN9cmHDHykp+6RBbv3kLpAH4yMd3xCokpTZ/llV87
 60j4xvx/B2RYjK2x2T0HPHzGWgZIH22aBX/4J4Rv9+oQVLeUG4MW1ZatLy8CxsetMeSzzXAh7qb
 9szSfQhb9LMvYH7Y2T5XPYN+ZR2/XWl6ul5WDDOj38PMVZT3o6xuSan9WggJNGgBfZ8CWdLwMsK
 L7g0Vvh11FGe1czfBZ4IDxSwgpE/mnDaBmozS7RCZbaX/zB4vRgXkEfXky+GtGf6cxF7e4KB9+H
 Emml+sTGqTrLzOAKMKlBU2grlghvLUrfeYR+lWGwYjIlPZAjOcNZim9Pe6csx5Wv2gHR9ATZeRw
 E2SA61lATv8lMlYHdRUrrJZxhVAL+zuYw8oJ7/ecPLdYfXJxaScki5FDsrlALp/uLiiPmcb6xHl
 Uy7ITbi2AzRTT5ceS2RydKF0AZVZNB6220i7ngvP35qAbx8eN23aIYWje0Cy6OOoyqsBNyo6mnG
 t8hmlVaS1uap/RttAS8c2SPMWulLmDX3WKuGrsrt6K3N1S1lSHOT6A9PeaajrsogFko6wjDQYbQ
 ELyPIUZyLnTyTV/Qsyc0lgONmsc7etC7bWg8SYyqPdJJvBZCyXCUNqRoBzK0nN9QlmHwZxseX+k
 ONdLfaZ3Lf99F5A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX29rXre9mc4ZW
 G4UUbqeBIezoxJXRXPiHNswtIe67QG4K2vjkv5tNX1oQ4UpGMk/p/CKjqKlbI10Xr84SdLh+WvH
 OGq9x1WQIyM63Ii3579DU6EvwwGgg5NhTYeiywTifhMlLLZxXPb5ZAoDEbN1VNbC4zVPePtF3f1
 6uyD5GnB//Q496cK6d8u++7XygHB7M/mczg1dg6L0zajixQBHvjGvlThedCGnktSfwFuQeQn4Oj
 JTIcmfApRlHCNU3IRwOuSV1uX3Xx7Atc+ZlsV6djK+pifdlYIfm3N4R7fbNoGioUZrT55Ye2O/H
 /YKrXMvwQO6StlVBhen/GpaJa9N+YcA1Dy+0cojfi1zXqs9wEPGohWvprifxdceW9ujsI/wt6+v
 F2uBa7lMzCqF39IZkrs/+Dh0nvgmppaG0rEZefLHL1yEvEnzLPom3nbv6mfNON+4LIpqK+L3CzB
 8WvfF9mLCxgDQRniD5g==
X-Authority-Analysis: v=2.4 cv=E8tYNqdl c=1 sm=1 tr=0 ts=6ae372d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX97ljb6i7nwue
 F0EYD3z0VrPj8WMEjPquYRCNPFkmWPhIlLtdWorJ8jCuajIslZ1UMBUT8L6gyETmiPm1IL95tCr
 oO1qz5Zv0Wwogd2d0wVCAEZGvZ6mhEQ=
X-Proofpoint-ORIG-GUID: 7Ma21qAxP39oCkPAQc1pFfWKhxcs6Pvr
X-Proofpoint-GUID: 7Ma21qAxP39oCkPAQc1pFfWKhxcs6Pvr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290064

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

