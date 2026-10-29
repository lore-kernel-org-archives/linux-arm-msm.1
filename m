Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793290967;
	b=KT541L+31UXoLgraVmAJQmIGomTHQ8EpycSS0836VWOdwMrYMlJcnEVRCcsqln1bNF9e
	 wetK8bx6hERLeh/x5HQVbpWJc26cWYJx2WIfD36Bw4rWaTYN+JbzOeagmr4ggEqREf3UX
	 TFxmtp/FeqXZ+S2A8aKNR9xh2WQZWLluhGGHlYyUuylGS9NWIBVPiLZoNdswYhnptZNt8
	 siIZZYiZ8tqEKQp5wDP1j5lN5AjNlnugspUpVzXClK11aaK5QJcXzTGS+ys1knAF9rK1z
	 5ktBCR6no9+ZUvW/i7gFJDGL4/aNOA6EaaXiNRXBfkFacnuxZNdVq1YuADY9ubcZsbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793290967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=i0h4nJjQDQNvO+GANp1K7eUD7/ohaGHuiEESZ9V7QIuiVCvIA0djP09hb/S2c8q7DC1Q
	 jhWVt63hlv2VFfluf8Wwg2d2uXyR5TS6rElpvSPqXp3qsdG4y8dF4b/lyBrHNByKaN16y
	 ExCZbSiLbohgUKI2gKNIDTWlwqQZKyXX/rFcbW5oHYdzS3zGDRgdHZ4hpMqRPI1v1TFIh
	 Bzu5vqQrKxLexAmCADknkXwp8XUcdUrOOQqRRUU5l64Jset1AUqBI5rMAyJ/VQjrTPogd
	 x7LB/CtjYjnttPMHw8DFsL1l2KPyxFQ+l4TiFogpAwU86DLRQHf9YoMzfRLTmM+yUaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNXbJ0xW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQDHwXR0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EB460A260D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EB460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mNXbJ0xW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HQDHwXR0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDXHx3234268
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=mNXbJ0xWGr+ajBlD
	TaVbiEWp13c05/jFniq5TplxkKrhzlSD99TR3SCHl1ZOeqJ9kviGaBPZV5MmDrFa
	ZrRNik/IWaIh9xtvquaWkVVweGTX+MoUEdx2S9+TfN53PmBt1y01wjerrxpyNek8
	M04mT3tqK7PJ8UsIvZ6mRIe3NNmXAMskzPx4LRLTq13XSdGuQOGOh7ycrHIL3X3H
	yQg5ee+uCovqSJPceyHRG1jCt4/+YcZvdLdXa+Q2+SJyZeyojWiWZ7kr/om/JUud
	HJ7qib7G8/SwiHL/PV9YI4Mddk0vtD1neAiCMzEY030Jb4tE7Bd6USXAu61NstRl
	YMr80g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b1tts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 16:22:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so360690885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793290965; x=1793895765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=HQDHwXR0ZOFhQSzFDNew2TGFSWDvbMHfFO9ewWCP5kizEGchIar4/ax8975nO4EWFW
         /RAYIPmjtNVI5iKT09LKUhvtoSDoXYzf//hWu8hGatRUvqlfGCk3kz/1U7+hhJZB8Nal
         PL0WDo7KV2xbo2osehG3LdmwIP/QRS16bDv+KymKb+cBoi04C5/Ic2eb3TgLgtcyQDPf
         9k1HymZEVbDhM44hLzJKwVv1BdOmd7HP655gtuzEvPJ9igPpHSw6MYaSCdqUYl0dixi3
         NYvc+VL1V/Q3yl2YlUNWrzD+fHXYYkFCek+n+dppaPmU0WCBf73nWSYiZgNKXyHg7IAc
         EG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793290965; x=1793895765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=SsHW+Xbyc/xqjGPtQs6anzAUGqwIThXcyaSrMYSNJxbCw8JfoApHTA9qj4sTmFhWef
         u8VBlcKqvu/QLgIYTsY1TvqTSyMmN/7PMHt2ige/Q0p9dGsU/tNl2xQiUZe42ILWBy8x
         NVfY5mR76K2ROux4pgRnezAGtS9uC7J+s3RHd/kT35m3nNvwv6wAmaxkVBt5RqlXC7Am
         gIzotJFQRmwcSVpBPnZJkZ8VRFgSAlNzYdjCb5jcCWZB+hhbI3Jz8BJp9GWDCIwt/q5E
         SED2uE+909z0yHD3oisMpt2VxJw2Nk077tb2/fqZybjAtYnSYrcxQocV2cff8HnW4xw0
         UP/A==
X-Gm-Message-State: AFq9FYJfwRDR6yn47BoCRLtofpsa1zdUHoqP/lTEB2PXDwkoqEDh1kaL
	Dcm0BH1ldrPXkVNm678gwqA4IlxieyN2vaNBGE1AqwA7/vCOqMKeeQxJic6IaaR/4fftZY8DUr5
	XKk8P8N+lBtFwhQMCBiEPLOMmmvSqrN51N6NpSo5tgqArg/uVXQ/ZGRghuMLHd8zoU0Xq
X-Gm-Gg: AYBFou07UbjWptBsOlJ0ypEVDKtYTd8fCUc5dACVFCeCDxfrIEam8UsshRSIQ5jUcZX
	ppPHcyxGYcyShrZsl3iC+wnNKGdySM4iHnIRHCWmu3F7GU1+ilfAeuEvT2BktvR3hzpeiUzP5MU
	cgcxQ+aMoxMkKQTYxdOwPsvNDOP7seo70nYEBkphDtX95ySD40TziqS2+IOThGlxBQPZIEX9CG+
	PqfvMa6688Mlgmj10GI9cw/5NRLtDKc+Kq+p8+XO0oXEvWgcOge88drXXrqMdcwvUJRXSfVq+yg
	/Es3VjTICQC62FAtDZHOzS5arTKp244FHW6WJodFFPdIScPWGUEkqSgfKfZBIWkhl5p4pkzNsjL
	Wi5UrMnZhNjazc9KIp5jSckYc1lB80R/txMz1RA/8KTHl59oTWZZHBKhqgWrftpu16HgpGHXhYF
	ryMQ==
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-94408a9763amr931506985a.57.1793290964846;
        Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:944:6d8:9c52 with SMTP id af79cd13be357-94408a9763amr931503885a.57.1793290964491;
        Thu, 29 Oct 2026 09:22:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a93103e72dsm93868605e9.2.2026.10.29.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:22:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 17:22:34 +0100
Subject: [PATCH v8 3/5] gpio: shared: unwind partial failures in
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
Message-Id: <20261029-gpio-shared-fwnode-lookup-v8-3-d15d75cd560f@oss.qualcomm.com>
References: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
In-Reply-To: <20261029-gpio-shared-fwnode-lookup-v8-0-d15d75cd560f@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq43LMwhY4d7pYkUtde35p+HvF1WKISbOm6vxjn
 rShgf9pn4OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauNyzAAKCRAFnS7L/zaE
 w9m6D/9N8SV4GEp4jPNFK8DBMf7VRoxBUfEg/Zf2wj2ROg6LM6SKWLVOZsPKJfi7Vt+sFD56YTG
 AEh3Fr6TeaapP9e64BaA4/G5niJBCKemov3WVBvQTIfUT+Q0xuZxdY0Ge5McHY7dRefIJBsLbX0
 GLXzXNLoRis5T8gc3zn67NPMoyVhQpiq7Gz8jJ+VXiBJUzXhWiQA+ujMi+ge2bvNHlW9Ac9s2HR
 62fESX1F0Zy6DlX5Mebe0UqT5roOB/ZVskX0NzhV9EYE91wt/X7q641BR9QzMZtp2Awo8xa4a/+
 rkbX7Dt0tYxbBwfqMyLAVGkUBR+R92uil3x0wWSEX9AYA1TDElnZ8oSpYyEiWEZmylt9cQKbj3v
 GcdtC9MgKl5viaL+ZOTyplX1Ly5z4isYo+bgqMRo3tRovKkllFTtYraVCg24vNWFlLWyp70mnmX
 ZILuST3W1ZjERUT3zXZ6hvEQK+CCXqn/CiMAEVQpFY9RXrS8lluMzKzdPCSDGzLUipWKSuWE02M
 vVwFifLIL5sgU2jQv1aAoLzMP7bWUVRepN4b4vU0n0qrqDzFdOJuvLKXyqDx5dE2EPTbjGNC4OP
 yVhYIUvvKEiU1Z87g3Lv3th1WwDLuFV8QoC8GiUcKlw2oTzFBpSpbvM33AWUMCwSL3sQTS74PL2
 g/VcV8eOBGTjGFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfX9Z3BP445J/5a
 b76iNcbHgtfm3K07aobSYuOvlgoUjNRePhFmW4WizQ5zDW+fKCoF2NKkV4L9UY+RI8iUcSjXhif
 onIG+m1PY9YtwZbZNs1a6jylSScx11A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2NCBTYWx0ZWRfXyjuw9jfohOap
 Ls2S8c4RPRmIIPOr9iv4wrK3SMa0EvXfdhkMh/8p+6bviSeo8FaZugB4se5N+Arpg0IWc+XSjni
 7G05ebv6Esuz6NjK/EuHDr6cVmEo2g3BydhghL9wmGNH8FDTLUgZgZ6R1oCXTVvlRBXNbYbDOf5
 NEdVHbWL6Yxizyt7glhLqlvr3MnoNGCvB6JNLjljFRI+4HknpyEWBtQYhwt9UFRQZtRZCvSavGh
 eHVEci+RN5vBomJdyFuIt/W5fvIs0lzajy780c2aZQ5WkLhKmN8sdJNjaF6pkRNEnJm/+gE/l+G
 Y+6tgWpIcfBSNkGTVqPk1ixKJoubjj8PpqM2ECNNkp9b6APWt/WnudAgAx3lDAFVxg9xEDuTexq
 6utIPgvjOrF8L5g5c+PBamu6ZbrbXcTJG5Kavj3me3ES6LT0XpPGlndqsPaHunH0rcFplyZATld
 YSKGSblrTqFOnFS7m6w==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae372d5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mqlGcDetNLCUSAicgnWrbDd8JDPIIiM5
X-Proofpoint-ORIG-GUID: mqlGcDetNLCUSAicgnWrbDd8JDPIIiM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290064

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

