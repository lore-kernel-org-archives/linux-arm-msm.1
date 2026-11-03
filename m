Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708488;
	b=xnT3oCPkS+SBLCfhQNYLUCuUCFFIX+3qyDhtMVLFdBSK+5J0f3dstkg1ZECNAnZgIk2B
	 DJageLkZzWN65uc7PNR7qIAXVhQIKBmOh8wXU2Mhuun2jZISfSTOAvk+sg0dTIYYskFdb
	 rgbOoKUHeWBirmMktOOWVvxOqm2Wg+sstBVLNXlXEiunBhW1X75NaK8IwTmBVNVSTJsnX
	 Is1NEsz2rwRSo5lLzHJU1wcbCu1nN9+eAAMoXVTbbT+Z7A6iK2knxUT8GZAgcrFzfqkEy
	 +SiUUmE5HsvsLbfyoZ5JxL6d98l5hddBErmRxXNja1nbFu7nO9ksnksah35VTe7ujTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708488;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
	b=GAS6JuNKoWvwCpA80q+YqPYPtZ3PdWAujoazkRJN+Fb2sA8zYpVCYAoECoeI9H/WUAYR
	 kLVpTJdLqwup7lYxPteaW95Dezypmka9tjB/Pb0NAGq6bErEca/1Cln26r0UxwKdc+8jR
	 evkJ7uRiPntNjuiXrVEpuCRVhbIWBYVFituyUn3GK917RHGN0B4zTMl2Xi5qk5pFSnPwC
	 Jy0JgftDEcVqsSdBhTHQhXB/fYxoBFXlVzRGZy+5CIfmim72TIpOIY6UXK3wzkxT2ltuZ
	 ZjzNQxLtQAhXz/p1IfOj/h7JiBjNt/JycE4Lu4JS+Vp/lUnf5t5eYSa/9QHxYbI3Qhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/zkIaJR";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNZbp1K7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54525606D81C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 12:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54525606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/zkIaJR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jNZbp1K7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ABbB32002823
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 12:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=; b=L/zkIaJRxxUeF6aZ
	Iduk03fXN4VfiteUeYQEDWGAryxfn0/y2C2bHxWx5FavCSHi9wyzbfqf7yXv8Tyh
	+BsR1xTG5cbwu6ypi9ZvbQMziCVPCr6F0aX5wfHfwusB5Z7UDmGl58MyPRElhd7z
	w6DiP7UH8X2mCwXZZD/E+N/t5qB4srEG6Pk+1l9eXWsrOTi+zk6p8KS24sic0oNn
	yepZ7jNSZhU6uIRAmG8gx3JcyTkevao5SXICkcT3SurNm41NEVhC5nrs0bXoDf9B
	vB+WEwpqlMIZkN+cspWd6hpqNn5NW/L7lnaMm3BCDzUWbb2nScSjc+Mmd8fgG+ME
	ba95RA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsxpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:21:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990634bef80so622891241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708487; x=1794313287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=jNZbp1K7b/2lx+a8HJ5KXvwpY/4ESSoZzHC3Q6HlKg9dWHKDVB/c5dr8wcpoJDUrw9
         s4ENtKwkxQDL5naGXTVPa6IYiRJLHaqv8uAV6dUZqJt7XAGTqFVWl8MuM1YHuIThAOZM
         rEqebSbqLkdls5FPfjFqIiiA21F/xpryTMWCBB2F1NndJtJzN+d3epKjlY4kt1F2Uc6L
         RDxhUZq0Xvj3yshoJ60B+jTuDEElbxQtNaD5/+l4e180DtJJAozWNdf6q5buD/CAO91g
         YGaO2hdPwyMbdMQFvUVX7ZxNbe6ZuoMMLUGT+ThfdGZ6YKGyWZNkJ/P4gYktePO1FtS5
         gq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708487; x=1794313287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5FZt9tKHEYnklbrXH4tFShFaNZxBtay+nhOBMjLp2E=;
        b=lxuedLcCjp865S9UNTM8ORaykw2qdtzuYvamiPYGzPhdshr0w0u/qWtLZAQR70+Drd
         EKQftm99qmr83ExCxGtT/wbZ/JWg9rzXG4fa0yI4pEMFUWiSqNwnaK29g0vb9BRN4GgA
         wfsC8zNoZwWerLMoIYFKejCC/ZOM3/M3df55nppJZZBpKx7sQ6NcS8ni3336+YuBtlJX
         q5a0Pf7qUa4v7ko+Z8hpoqeXAgplV86FQnAjMwkIgwfnCMU5TVgKQdGuPgGZs7ZRsrVZ
         qchbaWRlktybnBxBmHq505pPLzntbqi/w81HK2mJggq3oqsRGletXGqUBnpcLzMiSLzj
         qhoQ==
X-Gm-Message-State: APuU4Z+viQbIBHU9F2rF5zP4xuts2aJCf+LUzmfcQ6hFI11F7fbmbKA5
	yhOGs+N6F6SkHBgkUWq06SGHYmFZG2QUVS0onKD6NTiT1y/h1lLB5KJnKQURtLyOk4rbtmbboA0
	757is8AS0wFpP5n5yfSG8asfzAudGVUSeCSBEzM4ED8+Oj6PLe/eIQKvZoVLNRX0uL3TT
X-Gm-Gg: AYBFou0/RbOakDJC5lehU6jDv817UJf0kUwn0LPNeDVq7a7iELXn75YIre2uzuoDKni
	fvqsH+TPjK941JxTLP22klx1Fj+NvFZbyduHcZtLZD78kPp3hvXFqwZh1cS6xh1p+IEjzu8MjKg
	qImyaRZebYn105bgstp5zBKJXFRjwaTLecB5/xKRHuq2mN2jVtwANM1SdnoDbw3eUjgAwXxswk5
	+hII185mpOWpsT3u3tBDV5eSZJrKDrvnwkm3rlbTPHOhP/EFnkOM/yp77ThRqtLeqUo1JDWwdqP
	mVCrcb9aEocSuS/NhZ3M8O9P3GbCc4GJ91R1sjt3u+faIyvdhkXhpGIkLje91tMtYD3cGzVcVHy
	yviO1Z81XoypFGKcPkEtAnte6YBhNAImHoHp/FescM0iFhyl1h9dVDLVC3Q0iJXhSF7FFaU8hWs
	4f7g==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084409137.12.1793708486462;
        Tue, 03 Nov 2026 04:21:26 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr4084404137.12.1793708485974;
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:25 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:16 +0100
Subject: [PATCH v10 3/5] gpio: shared: unwind partial failures in
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-3-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QekYjtrADoWd66GPIisjizU3FTTnaBTEJebZvmRuj4A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+/cg6goh5Nqda0LhUqPC1f+YZp+Qr4mN6y
 v18/ZW14TGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w3kQD/9gf30U+O/gYGWmckn3O27+6KmRXS42MTsduBSRTKcL2dSvTIyfq6AXHmKOIYufmQWthVt
 QLZ19+0X9XVpgpdFdOUNgCUDMw7SMgqsD8UjxqX3npnjmYu8sg3ZcgFduYlITWwgCi8qWE57RFo
 VzPTWA8cV4hqYHxfHBXI+Gh0TN+jpvczcTLAmixJWOGPde55oeiIgeBhY+HRgUtMImqsuYl0FA9
 tCpItlT0iFjSGXd1QxXfJ1/EjNIwbXKx1G9I1PabzYwuiBxub7JTdcxp/AOgrN2K+wthd7v6e/y
 v7mDQkYdoofPZlvT40lSmjz963QwkpRgEzcPvT5jmYU5MXMcoY2qOn4wtbfypjm6UiuVzTqlC9I
 N5OiYzk9eB4h6+O/mU7TcVloAct+kfEB3INyroFHNf9bGWjpW8GjUYHOg/K8Gx/7dOU3y7UDvbj
 L73ZXYXCYmcQwyUTPSLQ4fEh7i1yuEciW2Xze/KY/sB/Tko7SA1VJqDGaOrGP+2QHKSR9L8M5KU
 Ql617TUGDeCX/eFCHa0XQrWtZuAPtUnTNc0z+KTvQiSA2vx0smH2a5UObgxz86g9O7fOeRHWkUn
 eBAR9/Ijw9ur//GKCtwFMG2mtgPNyzG4MxIQ5GE6o+aaXFhq3Tgtns5plEDuzGoxzNP0alu/q49
 MlmZBA1gMvVFGUA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9d1c7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: Pg-G41LwmMY_cliOzLDGJnEFMUo6vLy4
X-Proofpoint-GUID: Pg-G41LwmMY_cliOzLDGJnEFMUo6vLy4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX4vUDkrJyQ5Ey
 KA24NJr3pVCto3vrvGVRGZW3YY8eeaTujb+RutM1p7a48puotXy7XgPthVRDne4IO6ds6QQGhDN
 hu06QTfaC/s1uwGz46WUmxfK6w+gAt/D8ccKBuFJ9O1KUt8O0umwbOQPOXitku+Dbqw9QFbKOMQ
 GxEvKdTZgcVxNqG1Bk5spFHcsQy8TO7J/3i994zWcCVRls9YVgNuYzMclAtg1nhbtnzVIrPO6MJ
 ASCJFEQoegIRTidy3BTf2K+ntJVRXnFHavhqHK/SauiZN5YBTEVV2PHzDb8ffVwwtfYx025Ydws
 22JDTPovGPv6LTtVod7nFpCMZ/N/pd6DS6bGRwnRrtzIkhH0zb4mXubQ8VOAYY48ql86iUBiLCQ
 sc+LLMVWzHPA5BiBiBbExxJmDgw6Z8vJJHaZlUaohOn6t1PezESNjOrML1SNTKObxAvzfGStE38
 hsZG9grztCVj4cRnyJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX9qyTZZOi6Uvb
 ag6L2S1twqcqWeL5mtlVwNPVm4hoC7bcIFeYWrBVKC41yiOu7mvMqOUyh2qP5UeLS7waWEFgl+w
 B69PhRFBRIPYZ3IUA8JhMT0UMGnBrBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

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

