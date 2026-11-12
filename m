Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489624;
	b=XpWxKq0dsF3u+BWBAjEgSVZuH7Bm0TDzU1vRzw/5CH5KYD9TlLzhi2PWJIGSpCUhwf/d
	 gu6dNJ7Rf7WWhKzRqIFlRtpX7wZu8jyU/HQxUiQwixAPdvhYaHXj6eeopusu/eCdFOHP+
	 Zo/Ej1ePJ/sjKQ8WII5iIHELnrnQX/GJI7e+8CSWoLHbJOoOhNEJ5Mc09R9WEir9jns2C
	 DcYwnLaEZ+E6ja/SJtTZv/E8lXz++sxXQ4QrZGy9gFBc1lDyQd4m6fVm9ftQzP57r3R79
	 Szu4Ubh4Lwz3HzkWzLTrSvNuv0gNXwOr6F8YKBGVdUlZrLAe2lBN+/Nn9hjJgILc2hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
	b=y7uHbC6OHRYioNyD0xyrxxMooHUVTOwyc4/JSKh6Qp0sNrI7IhZLd7EuaPpeKGRP1NTx
	 VGpWgUTCKjWRiSGW8pUj/db+QMJ71FJb0/nSa3BFtJfPfhR+9bQYaXhHpke2dI6TShRlk
	 fy7GzOVFybH8oucly93phJwMFJHHZ6jiwdLBCZZAa9impZwv+IXa7SOHSX0X9fb3zFJqy
	 9hak5Xn5GnCXOiq13wfsWCbzk00vvNKTvrWyS7399Z/nrnBUwiU72fhpwWb0e29Y8041H
	 UZYka4l0mQ+3i2Oscd31DCAtcMCTx6/t3uEQx41ItegVhfIhEVyfNh1PYKqnkybc7hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDMxJkF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuDT8Dsz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE2606A336
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABE2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDMxJkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuDT8Dsz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmjkx2555172
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=; b=RTDMxJkF508Dh42y
	BaoG1QT6krm5io92kTIWgovSydZvkRbbYWPAylkUMdx52dharX1koMAVwtZ8+VeZ
	tTRuOg2fyUhzQwuoHPinJzOnAjKIgfZQe0eqIYiwp2LgsDb29upW5LCIcEuQwhB4
	6O5XBOmxtOjBdzSJvmmbseT34r9CvVjI7luek1oKTBU7L26D68Li2d7kHtOhi7gn
	87EbdNi97UAlPilkGjWSj+bK/8BkXN1WA6E0qQg//+AIQaZ0TzmQcSeYcBEUEEt8
	fMl79a7n4O43kEZoHcECn50f0r2uCx2VhHXdtwBAb9xy4+DPDBtGjH7RFjyD01NN
	i+qfTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j0fyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:20:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so924507585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489622; x=1795094422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=YuDT8DszZktF+6YImAgvTDcPerggXEmGrCWFRa1hYA/1RuPHq35dAt2d9Rx5mdhtZj
         mn8vx/vnXvj+dsHv6l+Q7dy1fx9YHfnGfvMAF/eHEKC1evUg4ScudvvCjlbYOpjuY43n
         i5BPkgqzKQG5OtmgPEDURMLIngIevLpgdrtLq6XXIMnUqQJGyGBZVMQk/xnGvQnmR9UG
         oP/3Lde5g4FnTR91hKlbrBtJnXxzYCezPStaHdCNSb9/mBhaza1kuhhGCB/aeLufFJk4
         y9VSsyLeODJKnho0uLfCZXm9F5m3NksCq7XN7/PzVa/8efqYUw3SIO2C8QpZhYDBC9j0
         5YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489622; x=1795094422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=a6C6e+RwvNPsTG62AL7j314bwVnxBFV8Ub0jFFfz5uqUyAqRqvLyXGLP18K+SYtBQY
         vfOB4Epl6vQkpV5X8aVekJUAZXdoiTCinx6qBO6gAsjk11IU8jr+ylWvfKz3yjzthKVg
         F30evB9YtH6trAmpTc9sM/vQTq+YRl3+RaTcSfp2xY1hArkrE82enWtj5mBiDXNaDiGP
         E+WuWqHOxnqYp2YMbu8TvXkidzojzBAtCtKft/m01WyTa3pvv1gwdBr0qafYWGyUcsDw
         glJKDcvhMkOEYCpbxfD6769TvT3Ils8Rro3c/9KpKSrmy0UCor35YhMxpUgPmjIZk6G7
         8clQ==
X-Forwarded-Encrypted: i=1; AL+hErG/3v0WyvpuM+5Bpdw22BNJlqhAlSPEiz1k6WPzRbZ3TK5L26ygYbksQoFqazjkxWk4+1HEKT/Y4Il8SDCB@vger.kernel.org
X-Gm-Message-State: APuU4Z8BBRT7BuP3eQbzhtxemaPA2QMCDRp69vXTuHCoKBoRUn/N0ly2
	FrwbQkmdHzGCgutX2m+Iiyi0vp4+vmElKo9JPb+svbQtsFpgOREQD2PJtUnDs8D3l21KOeT9cND
	7BxXRl9g48MN1bkYVcvfR4mA/wMiBaj3w2QUB7dzG4ruVgHlzv68RY2e86zm0/Sh5CYqfovZsbU
	hQ
X-Gm-Gg: AYBFou3Mfw8REPPuZtSVGZgYdPcw6QtmZklUgjOEtXDsFJRZ+Ng2GDHEmnMmg1ucz53
	iLn772+dq2aIGTcqxcseLlkTdWQrdqDappj8hdNBIFPENU0Y4XYl4pn/xaeM/h9ylBLK5NqCFqU
	0IKpsTVkDPjekAj8223oQaTYV8ivUjkFNWz4GMdBIUvr+T0e1Q70PKY6RY+YhF3TgOV7Effu7sU
	s9zXMXrFXzm25KiOD27VjdDCqHt4oTjoE1T7VXplaV6/HFRk2zsMCz/ndky9e8PivAvTseF8ihZ
	6BcC1dNYELGTy4YFFXVcHCSGqIGjeZnqSQ4JJktdcXURxeoO8kzLA4KRC29e3XQbB3HdIlJmFrW
	iOygZvqLt3VQCiAh07ek6g3iVK4Fx+YZOyf6Q2iTxyN/2BehmOXqyZlxAJ0Jv92gNxDVkPZcMGE
	iDwGKVXYHrd0fhE++IfagV38u5U7221XGVden3xBT6KN6JB/ziHh1NmQNUQ9aIyLo=
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815414985a.61.1794489621871;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815410785a.61.1794489621347;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:20:08 +0100
Subject: [PATCH v12 1/2] crypto: qce - Only register algos if the user
 really wants it
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
Message-Id: <20261112-qce-fixes-broken-label-v12-1-7b5b9c7083ed@oss.qualcomm.com>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uNWdf7JMTPD50Oq4Q34RGGw6aCVGFgeAIRGofUpNzcU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JlqMlRyBVpFc0kBTJiSqRQUy68ErqMNtxR
 wWCrVcf9EuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w6arEACorZuR3+d3VjlfFgy8L0TymbxxLQjd/fjA019WVhb2ONi1ho9cV/b7XiBgidpiNufnH67
 bvQBcnu867YgJe1vsh4hc0DBLnCufY66fk5SePylcV6oAirKwoHY4/kG9KpnhDj1oTOwnA4IFhs
 K/fzmC9PoPAN51Xa7rg+oltR/p5rp5uqBBnOyZvd+ZsEVnFvfA/zIMcHzXs3wdgCsI/nTMWzGS9
 leSaSR5m6f89F/pUDDl0oO6jjKrFhTG1CbGwkgAmTRo7nfuG2cqMoh2i3iGY8iEL+EkmbH2WAG/
 /Dp9ffP3b07xP8jHS0FHDOqFLvsaVc6nGKWkhxhsVQU4lLzTwn1AT7sNUlgKROfI/tZ7iD+3VFD
 sSR8klidK+ywgzSP5dyUzOvkjMOmRirQbYT0rlaSCe8HhWDSRz9rt5eGEQIP+NbZCV8IjgMIm2q
 6vU5KKIpbQweuGP1PPQDMAjlFWLQpxwftmSUB+Q65KwaUjX7lov0hO04rtNkrq0Krwvch2sUVXN
 9Kshp07fgmVrz/O6dujFwyfGJPie48+kMzD6rzGOIRGaqZ10xc7YW12IUooa6SZScHdaIOtAM01
 YBUOiwoWw4Va1FwqOYSVkGCHvLGUfLs291wqvCDlt05OFwrWugQfTiflKAHs4wEDFDTv/ZmgDFU
 0ThVkge3KjgRyYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX+nTEVyFtgXYD
 PiNnlAGG8dJpjvvY2g7g3vTUVCsC/OZ+ab/6FinOX8O0cDG2Jh6rJuyzo7Kd/JgufSoeAMDnYtb
 1IUSbignY/uQBH4cTHyoiUKVbTEhR4U=
X-Proofpoint-ORIG-GUID: 8PnwqoGwqnqXdTJ7eh4HE5rb0UrKAHNb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX8W4/W9lzemad
 NDSdqOjA07cC7nRo8W0inL2iIW2Aj4WyYtFU/T4XOfg8HnlllsxToVau12pSA25Zgyt5pHdGEPa
 Rq5lGIj5XG68OL0JpBkXFXWB5rhYzBVVuEyML3rWYj7GclPywKs9YvsP5Mdbb+kAX8SZ4YvgQ4b
 HOKE7A6ihU3HUvViq/U3MYRfS2CdXNWr8nzHjaDZ/sfR1FCGNEQ40T6bpnTa+Ckxm0g647jof+S
 W+DxbOCypXSVMN/NpI9B5EK4bW1DJbLQYSnV7POnD7zYohHpJ/csIPfxTHqsz5NWHEhSBwn/Ajy
 EFUSqK4MlF0GdEaV9oMKjig2jcJWEu/1uP4bN9wNKi2dYZElwJbDoNnxROCUDiIucn+bP5c3YCD
 4okG0so3m3xfoHk/JHIEFWnCCaQsMnbAEDtivi5GWJd1/zNLGscylAL37EhmfijFNtPGT3ucfBT
 iQNeUfbcVQB0m002W2g==
X-Proofpoint-GUID: 8PnwqoGwqnqXdTJ7eh4HE5rb0UrKAHNb
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5bd16 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XywcRVADl8Xu_msC9vwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a009c791417b707c5d4e98fc30111863dd8809fa..ddb4df3d227f801e566422491b488c5fcb777717 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,10 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+MODULE_PARM_DESC(do_register_algos, "Enable registering the crypto algorithms.");
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +264,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3

