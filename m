Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198692;
	b=nPBSHrYxu6WUQoJiCesuz420MpATghPXlx8NQDfqZ86FUfGhgP0DFbgtyjzCKNEC/eyu
	 ec7kIh9Y0pE9+Ug17eUxs77z+qNEr7aME2xM2saQZCz26b01r9R4AF3Xfm95/dAz7ZMW6
	 6hLXNPW8OZzCSBrtDdWf1lpty6qTPPQZaK+o9cZzb9V22m73Q3SVRv3TMn5ttGAb4zYy3
	 EnDBb2ZVelFL3P3o4Uf9KAIBX6E7u2TDK0wsVLUZH6a7akmKO+ahqfvEdkY+kZJKP7Lp4
	 bo1Q4e1JLKC64sbpj+6UPIxEEMoTgVRc0mZnURHge31miQYw36iAEhtJyUS0dAnqBww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=IlaqWQkNy+1m6Gwdo5or9aZvGmGIcvYXPfh1SQOs0/Fb5oFvMUw8VA6uyAsjNB/a6INb
	 FWUC40l85s+t/37qp8D1/oeuY42dQmIRjjjmumOLalOVJXwGxCHtsZDS/hq15KxCazACZ
	 fVF7mIzYRQuc4EWoywI9Y7vKaC5LIkViaAQ3hxpZfMnAsi0Qzvc12LUsIl3DjFir0XUg+
	 l9yoHPa5QdM0DIB9ld4v8w0yMEzyRpUj5VwvT/X5TBi6TyLkK2WlgqN/kENFYHkXsDgFz
	 PQTVl/JIDVY4YVuv6aMTVLJgzQaBkBHVjOBLhUZjDhG4nszwVOXghTXqSEd0BvS+aDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFAF60A262A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFAF60A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIHJ43916337
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=ME83Iq1SZPJKQFjs
	pY23U1GAxnfRycuRqkTn+8/q+/+pPlwl96U6OXtQ4yHE+Us8CfdAhUfhupOx9NpW
	ExHwBzz6osq5lRUYI7kx+oQt7hSi994gE4WnfGk6fy8JCO8YJIhICN7by1lsx6W2
	4UJTBKfiaskGsvLz8xPqwrlCxlZEN313wS7mMcoSLiQ8Q7xTl0agpSWFkYeIItyg
	pRJLgW40k5RQvW+NAkaDQYChToiHHNX2o7cBzCCo6oVxT9b1H9VqWjaWXdxoBbJZ
	t0eyfd1TPtaQaov04zV9Ge9uc8eWx1FNPucps237Y/kY6nHHoRcL/+600UU+Klyd
	mXXvuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngcfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:44:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so98785585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198690; x=1793803490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=Irrk7s0O43cN5uVxr7GMDB1TmVfs5d42xWGWmlO+puEDYQ4mR2nKnK6meq+mRxDa+H
         PhPINEagHOQ8ToR/KzQvg8FRKJ416hRI/95jDYw9vGjCQxa5iALGnpDCsiRWpRA2iN6S
         6LVN8T8AfeYpPUTGTtQdL3017zZi5jQ04GUzk+6NGOXTYEH0s4vpZOvWBkyOvFRJ4mTX
         ByJATdcDiwF832HthDGbOhzkffNy96/DAo1QySDOMm3ErAGbCXRkON8hlstTS8AYU5ou
         8ENfVSRBCN0zLy5tKPMj4a6uaVm4V3YUicr1c0h2Hs43nEOgo5XP0xvehlXVUvEZblmB
         jjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198690; x=1793803490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=kc9G6atA8r4so3e9evazjP7eBKusyFMs+1wg4XlV0X255LjIL7ohdA0Myyl3yFhyS/
         zTETVtYkcV+7oslsQ3BZELH9Op2LilAlcbVaNj9H0bLLgWgB0r/1EcXYpNeST8jciuKA
         G1ExQYh7tnMDJAGBCNz3Owt9fp4au3OOHkIrX90W5TpR/m/w1hRFI3kl+qX++onFuJ8J
         Jg+yZ7WlGH6JsPwXXD0+pqHXC50xoNl2omuEKdkE23VEb8GxE1hs7Ya+wYRnBo/GvuyR
         aER/MUxVid2EhYcdb47PYuTLO05S+yp9mwOsaPEQGuXvRCrgEc/ikSO/7SYn17qxZbCt
         HQ8A==
X-Gm-Message-State: AFq9FYIuoKXVoSjmSHH/DgprKpf4LHWKERUxsCn/hxQFhhNa72s47hwX
	0uLo/D8rqqXE3xSzCDZdxsXbWvjOXep/SHtdcvth3vTnLHHOz+sHam7x8iGsm5NJ0m2rpCFA8uy
	VY1d/Y9wHgcyBHDbZQJq/mUF1zSBDQ69N2ZmhaneoTYqgc5gchH0KLc4UM+UQ9Q7R/WTpJajpB6
	6K
X-Gm-Gg: AYBFou2u+2UVUIocRYXMP1tQHWeJSwZB3YQ5xUnlICQknOS+Qf3x/doIaYh53jFNvqd
	AP0fHsYjjTtNzKIKtByM3Q+qtWuRRCHd5VV88i4Snyd3z9b3uQJNIT0wC+L+xh9sUHJfCRlSO+v
	oFWBBkV6efR+TZbHjjnA0JpLxiTXvbJ3QhXrckFJqfLo1ORClU5S+j//QmzeOF4Ceuzj8OhuzEt
	eDLqH1Ihb0j4v+CivFK6pbw0CTcANJiJuywwtfvCDHfw0haIK3e51CDvW3roJ0jDI1xGFQnE34z
	7t6mbFx360n3IKKkm0bsdgZPsy9w3R5MwGBKLVuW3nKuiBVVuvGhUQIb1U1jepUsZQzu+z2XFv1
	wn0XW+FgTQ0c78Hka71Cs9oxbXQDKpv0wKaFiYKzwZO8SdHUAdfr+hKx2Q83Qeex8OXBNta+fcz
	Qwiw==
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363984285a.68.1793198689861;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363980185a.68.1793198689301;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:39 +0100
Subject: [PATCH v7 3/5] gpio: shared: unwind partial failures in
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-3-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpagBqL1CBEVbeJbb9EbwfKAPskFpgHc3fn1
 CdEpIoTJv2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w0HgD/9mAnWUkPVyiu3djErWX+jIAxFSPUN92WPzgtOPD9qxvh8NSz0PYg4RX6SeqPMs04B0BoB
 K+HURvkXhE7bNk2MVNOBzqlkEc25PbAPqRAiH47/BedR9kCRiCAPRMSDTXVQMwIkcjqgeRJkp0K
 kWErMGx2Io5dPHHiIth5H5WmhKa1hQRJhXK72xRohd3fodZPQWHnlMlh+3+RceLgT1VfzVb4r1c
 VP0yWdbwpFdLuO8/0M+MP8LLZc+24BzBgd1InchcrDkcbaV28zuIN1t8yEp5MoE1rYTilcasBtU
 UikZauCch+lAkxTIau+c8JUAvUWw+n0NQ6IBA96/sZWdHzIY+Kcb9OyYa7aHMuGj8QcGuN4/eKg
 MA6tOoe4CkXCF+UVsq29rtxXo+zIEIfn8wEEKP2dhlSxqPV43idpNzSfNs6foRrT5yt178t+2jk
 6V0tVpz98IuCOqHg0KvvRoW5h9vr7ESCvqxakShrZA3WKzux8zZhXDZgM3vR83JvU+gm3DXrcSj
 IQSQOMEQH+rQBAJ3tGK1gtRNOtsDHhksxtpQZjgfHf3D8RtRTK/7rCIYgMFFGnu2gDkc+8gN4XE
 EW18koKCM67I+S7e/7r/o/WfKYPA5lsnY+dFx7PC7c+KGTYWQtdr10GjJQVtYDHrb28E3d14gda
 0f/bXnBxbky22/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pVopIdd1ZZnjJP6Mq1BWoVKDDTMzk9Gh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX1jBgYVe3BrST
 pz9HIPPE1xVJjul52b9kNnmOp9TXcNHSithOIJrL3Y+KVPijST9D9cDIEvhFNUSPFH+VOXhSJ4r
 wxBLQOyxgL1TGHj7dfjJ9shYFe6rsSv6VR7nADL6umoaTRA2LlOoZsJmSD80cHc03wElbBG1mhh
 3y7kDNS4WAPArtSUlK6ZOK16BO2cBD/seNY8G8xMdkvVLZkldEC6Nn14NSy9PjylhIvkk/Dd0sZ
 r/HYZXiATBBd+fu2nyfMHDpuKXyI+R5kDGq88w7ywQYkHftSv2g7k1CGKeNUmHIb0yMTbtRqC8k
 DudvNmfijHhMDWqFKy5p3VJK/i+sEyeTIrsYs/tk+pPmX2H765f+yzfQ7NFLuDn4aJvdY/XSG21
 P4BmOmXDVdrV2B40iKFn2nhD9v7r0oPMVA22pDNcr7OadvXqWeDY9dXcC8F11VEEwdk9P2kzugw
 8xgDjhfayicYS2mcmig==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae20a62 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: pVopIdd1ZZnjJP6Mq1BWoVKDDTMzk9Gh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX8/p2ZuhTszdZ
 bKES0IDBmZ8yrR2+cou7/fsVwgLWZDUfuEsMBFQAymWy90+uaYGpZy5vHajnkVRvNtHGWXyn/Lw
 0zXBnsNoTPwYskSwbEHCu62SD6GUjVw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

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

